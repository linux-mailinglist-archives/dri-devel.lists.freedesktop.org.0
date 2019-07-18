Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B64776C467
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 03:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864F96E2C2;
	Thu, 18 Jul 2019 01:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7766E2C0;
 Thu, 18 Jul 2019 01:44:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A569AA70E;
 Thu, 18 Jul 2019 01:43:58 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-120-112.rdu2.redhat.com
 [10.10.120.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5ECE219C67;
 Thu, 18 Jul 2019 01:43:50 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/26] DP MST Refactors + debugging tools + suspend/resume
 reprobing
Date: Wed, 17 Jul 2019 21:42:23 -0400
Message-Id: <20190718014329.8107-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 18 Jul 2019 01:43:59 +0000 (UTC)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org,
 Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Karol Herbst <karolherbst@gmail.com>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>, Huang Rui <ray.huang@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Anthony Koo <anthony.koo@amd.com>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Thomas Hellstrom <thellstrom@vmware.com>, Deepak Rawat <drawat@vmware.com>,
 Yu Zhao <yuzhao@google.com>, Harry Wentland <hwentlan@amd.com>,
 David Francis <david.francis@amd.com>, amd-gfx@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Ben Skeggs <bskeggs@redhat.com>,
 Thierry Reding <treding@nvidia.com>, Mauro Rossi <issor.oruam@gmail.com>,
 Juston Li <juston.li@intel.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Emily Deng <emily.deng@amd.com>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Evan Quan <evan.quan@amd.com>, Sean Paul <sean@poorly.run>,
 Felix Kuehling <felix.kuehling@amd.com>, xinhui pan <xinhui.pan@amd.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@amd.com>,
 linux-kernel@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <hawking.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyB0aGUgbGFyZ2Ugc2VyaWVzIGZvciBhZGRpbmcgTVNUIHN1c3BlbmQvcmVzdW1lIHJl
cHJvYmluZyB0aGF0CkkndmUgYmVlbiB3b3JraW5nIG9uIGZvciBxdWl0ZSBhIHdoaWxlIG5vdy4g
SW4gYWRkaXRpb24sIEk6CgotIFJlZmFjdG9yZWQgYW5kIGNsZWFuZWQgdXAgYW55IGNvZGUgSSBl
bmRlZCB1cCBkaWdnaW5nIHRocm91Z2ggaW4gdGhlCiAgcHJvY2VzcyBvZiB1bmRlcnN0YW5kaW5n
IGhvdyBzb21lIHBhcnRzIG9mIHRoZXNlIGhlbHBlcnMgd29ya2VkLgotIEFkZGVkIHNvbWUgZGVi
dWdnaW5nIHRvb2xzIGFsb25nIHRoZSB3YXkgdGhhdCBJIGVuZGVkIHVwIG5lZWRpbmcgdG8KICBm
aWd1cmUgb3V0IHNvbWUgaXNzdWVzIGluIG15IG93biBjb2RlCgpOb3RlIHRoYXQgdGhlcmUncyBz
dGlsbCBvbmUgaW1wb3J0YW50IHBhcnQgb2YgdGhpcyBwcm9jZXNzIG1pc3NpbmcKdGhhdCdzIG5v
dCBpbmNsdWRlZCBpbiB0aGlzIHBhdGNoIHNlcmllczogRURJRCByZXByb2JpbmcsIHdoaWNoIEkK
YmVsaWV2ZSBTdGFuaXNsYXYgTGlzb3Zza2l5IGZyb20gSW50ZWwgaXMgY3VycmVudGx5IHdvcmtp
bmcgb24uIFRoZSBtYWluCnB1cnBvc2Ugb2YgdGhpcyBzZXJpZXMgaXMgdG8gZml4IHRoZSBpc3N1
ZSBvZiB0aGUgaW4tbWVtb3J5IHRvcG9sb2d5CnN0YXRlIChlLmcuIGNvbm5lY3RvcnMgY29ubmVj
dGVkIHRvIGFuIE1TVCBodWIsIGJyYW5jaCBkZXZpY2VzLCBldGMuKQpnb2luZyBvdXQgb2Ygc3lu
YyBpZiBhIHRvcG9sb2d5IGNvbm5lY3RlZCB0byBhIGNvbm5lY3RvciBpcyBzd2FwcGVkIG91dAp3
aXRoIGEgZGlmZmVyZW50IHRvcG9sb2d5IHdoaWxlIHRoZSBzeXN0ZW0gaXMgcmVzdW1lZCwgb3Ig
d2hpbGUgdGhlCmRldmljZSBob3VzaW5nIHNhaWQgY29ubmVjdG9yIGlzIGluIHJ1bnRpbWUgc3Vz
cGVuZC4KCkFzIHdlbGwsIHRoZSBkZWJ1Z2dpbmcgdG9vbHMgdGhhdCBhcmUgYWRkZWQgaW4gdGhp
cyBpbmNsdWRlOgotIEEgbGltaXRlZCBkZWJ1Z2dpbmcgdXRpbGl0eSBmb3IgZHVtcGluZyB0aGUg
bGlzdCBvZiB0b3BvbG9neQogIHJlZmVyZW5jZXMgb24gYW4gTVNUIHBvcnQgb3IgYnJhbmNoIGNv
bm5lY3RvciB3aG9zZSB0b3BvbG9neSByZWZlcmVuY2UKICBjb3VudCBoYXMgcmVhY2hlZCAwCi0g
U2lkZWJhbmQgZG93biByZXF1ZXN0IGR1bXBpbmcsIGFsb25nIHdpdGggc29tZSBiYXNpYyBzZWxm
dGVzdHMgZm9yCiAgdGVzdGluZyBvdXIgZW5jb2RpbmcvZGVjb2RpbmcgZnVuY3Rpb25zCgpDYzog
SnVzdG9uIExpIDxqdXN0b24ubGlAaW50ZWwuY29tPgpDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtA
aW50ZWwuY29tPgpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxod2VudGxhbkBhbWQuY29tPgoKTHl1ZGUgUGF1bCAo
MjYpOgogIGRybS9kcF9tc3Q6IE1vdmUgbGluayBhZGRyZXNzIGR1bXBpbmcgaW50byBhIGZ1bmN0
aW9uCiAgZHJtL2RwX21zdDogRGVzdHJveSBtc3RicyBmcm9tIGRlc3Ryb3lfY29ubmVjdG9yX3dv
cmsKICBkcm0vZHBfbXN0OiBNb3ZlIHRlc3RfY2FsY19wYm5fbW9kZSgpIGludG8gYW4gYWN0dWFs
IHNlbGZ0ZXN0CiAgZHJtL3ByaW50OiBBZGQgZHJtX2Vycl9wcmludGVyKCkKICBkcm0vZHBfbXN0
OiBBZGQgc2lkZWJhbmQgZG93biByZXF1ZXN0IHRyYWNpbmcgKyBzZWxmdGVzdHMKICBkcm0vZHBf
bXN0OiBNb3ZlIFBEVCB0ZWFyZG93biBmb3IgcG9ydHMgaW50byBkZXN0cm95X2Nvbm5lY3Rvcl93
b3JrCiAgZHJtL2RwX21zdDogR2V0IHJpZCBvZiBsaXN0IGNsZWFyIGluIGRybV9kcF9maW5pc2hf
ZGVzdHJveV9wb3J0KCkKICBkcm0vZHBfbXN0OiBSZWZhY3RvciBkcm1fZHBfc2VuZF9lbnVtX3Bh
dGhfcmVzb3VyY2VzCiAgZHJtL2RwX21zdDogUmVtb3ZlIGh1Z2UgY29uZGl0aW9uYWwgaW4gZHJt
X2RwX21zdF9oYW5kbGVfdXBfcmVxKCkKICBkcm0vZHBfbXN0OiBDb25zdGlmeSBndWlkIGluIGRy
bV9kcF9nZXRfbXN0X2JyYW5jaF9ieV9ndWlkKCkKICBkcm0vZHBfbXN0OiBSZWZhY3RvciBkcm1f
ZHBfbXN0X2hhbmRsZV91cF9yZXEoKQogIGRybS9kcF9tc3Q6IFJlZmFjdG9yIGRybV9kcF9tc3Rf
aGFuZGxlX2Rvd25fcmVwKCkKICBkcm0vZHBfbXN0OiBEZXN0cm95IHRvcG9sb2d5X21nciBtdXRl
eGVzCiAgZHJtL2RwX21zdDogQ2xlYW51cCBkcm1fZHBfc2VuZF9saW5rX2FkZHJlc3MoKSBhIGJp
dAogIGRybS9kcF9tc3Q6IFJlZmFjdG9yIHBkdCBzZXR1cC90ZWFyZG93biwgYWRkIG1vcmUgbG9j
a2luZwogIGRybS9kcF9tc3Q6IFJlbmFtZSBkcm1fZHBfYWRkX3BvcnQgYW5kIGRybV9kcF91cGRh
dGVfcG9ydAogIGRybS9kcF9tc3Q6IFJlbW92ZSBsaWVzIGluIHt1cCxkb3dufV9yZXBfcmVjdiBk
b2N1bWVudGF0aW9uCiAgZHJtL2RwX21zdDogSGFuZGxlIFVQIHJlcXVlc3RzIGFzeW5jaHJvbm91
c2x5CiAgZHJtL2RwX21zdDogUHJvdGVjdCBkcm1fZHBfbXN0X3BvcnQgbWVtYmVycyB3aXRoIGNv
bm5lY3Rpb25fbXV0ZXgKICBkcm0vZHBfbXN0OiBEb24ndCBmb3JnZXQgdG8gdXBkYXRlIHBvcnQt
PmlucHV0IGluCiAgICBkcm1fZHBfbXN0X2hhbmRsZV9jb25uX3N0YXQoKQogIGRybS9ub3V2ZWF1
OiBEb24ndCBncmFiIHJ1bnRpbWUgUE0gcmVmcyBmb3IgSFBEIElSUXMKICBkcm0vYW1kZ3B1OiBJ
dGVyYXRlIHRocm91Z2ggRFJNIGNvbm5lY3RvcnMgY29ycmVjdGx5CiAgZHJtL2FtZGdwdS9kbTog
UmVzdW1lIHNob3J0IEhQRCBJUlFzIGJlZm9yZSByZXN1bWluZyBNU1QgdG9wb2xvZ3kKICBkcm0v
ZHBfbXN0OiBBZGQgYmFzaWMgdG9wb2xvZ3kgcmVwcm9iaW5nIHdoZW4gcmVzdW1pbmcKICBkcm0v
ZHBfbXN0OiBBbHNvIHByaW50IHVuaGFzaGVkIHBvaW50ZXJzIGZvciBtYWxsb2MvdG9wb2xvZ3kK
ICAgIHJlZmVyZW5jZXMKICBkcm0vZHBfbXN0OiBBZGQgdG9wb2xvZ3kgcmVmIGhpc3RvcnkgdHJh
Y2tpbmcgZm9yIGRlYnVnZ2luZwoKIGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMTQgKwogLi4uL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY29ubmVj
dG9ycy5jICAgIHwgICAxMyArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jICAgIHwgICAyMCArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rp
c3BsYXkuYyAgIHwgICAgNSArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Vu
Y29kZXJzLmMgIHwgICA0MCArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ly
cS5jICAgICAgIHwgICAgNSArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3YxMF8w
LmMgICAgICAgIHwgICAzNCArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3YxMV8w
LmMgICAgICAgIHwgICAzNCArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3Y2XzAu
YyAgICAgICAgIHwgICA0MCArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3Y4XzAu
YyAgICAgICAgIHwgICAzNCArLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jIHwgICA0MSArLQogLi4uL2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtX2lycS5jIHwgICAxMCArLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3ku
YyAgICAgICAgIHwgMTU5MiArKysrKysrKysrKysrLS0tLQogLi4uL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neV9pbnRlcm5hbC5oICAgIHwgICAyNCArCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3By
aW50LmMgICAgICAgICAgICAgICAgICAgfCAgICA2ICsKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZHAuYyAgICAgICB8ICAgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L2Rpc3BudjUwL2Rpc3AuYyAgICAgICB8ICAgIDYgKy0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfY29ubmVjdG9yLmMgICB8ICAgMzMgKy0KIGRyaXZlcnMvZ3B1L2RybS9zZWxmdGVz
dHMvTWFrZWZpbGUgICAgICAgICAgICB8ICAgIDIgKy0KIC4uLi9ncHUvZHJtL3NlbGZ0ZXN0cy9k
cm1fbW9kZXNldF9zZWxmdGVzdHMuaCB8ICAgIDIgKwogLi4uL2RybS9zZWxmdGVzdHMvdGVzdC1k
cm1fZHBfbXN0X2hlbHBlci5jICAgIHwgIDI0OCArKysKIC4uLi9kcm0vc2VsZnRlc3RzL3Rlc3Qt
ZHJtX21vZGVzZXRfY29tbW9uLmggICB8ICAgIDIgKwogaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9o
ZWxwZXIuaCAgICAgICAgICAgICAgIHwgIDEyNyArLQogaW5jbHVkZS9kcm0vZHJtX3ByaW50Lmgg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAxNyArCiAyNCBmaWxlcyBjaGFuZ2VkLCAxODQ2IGlu
c2VydGlvbnMoKyksIDUwNiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neV9pbnRlcm5hbC5oCiBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMKCi0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
