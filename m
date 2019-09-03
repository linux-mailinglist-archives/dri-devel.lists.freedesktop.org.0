Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA61A752D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 22:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77092898CE;
	Tue,  3 Sep 2019 20:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2996898B7;
 Tue,  3 Sep 2019 20:47:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5CF94307BCC7;
 Tue,  3 Sep 2019 20:47:38 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC23D1001956;
 Tue,  3 Sep 2019 20:47:30 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 00/27] DP MST Refactors + debugging tools + suspend/resume
 reprobing
Date: Tue,  3 Sep 2019 16:45:38 -0400
Message-Id: <20190903204645.25487-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 03 Sep 2019 20:47:39 +0000 (UTC)
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>,
 Karol Herbst <karolherbst@gmail.com>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Huang Rui <ray.huang@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Emil Velikov <emil.velikov@collabora.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Deepak Rawat <drawat@vmware.com>,
 Yu Zhao <yuzhao@google.com>, Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 David Francis <david.francis@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Thierry Reding <treding@nvidia.com>,
 Tao Zhou <tao.zhou1@amd.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Emily Deng <emily.deng@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Evan Quan <evan.quan@amd.com>,
 Sean Paul <sean@poorly.run>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <felix.kuehling@amd.com>, xinhui pan <xinhui.pan@amd.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@amd.com>,
 linux-kernel@vger.kernel.org, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Rex Zhu <rex.zhu@amd.com>,
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
dGVzdHMgZm9yCiAgdGVzdGluZyBvdXIgZW5jb2RpbmcvZGVjb2RpbmcgZnVuY3Rpb25zCgoJCSAg
IFBhdGNoc2VyaWVzIHdpZGUgY2hhbmdlcyBzaW5jZSB2MQotIEFkZCAiQ29tYmluZSByZWR1bmRh
bnQgY2FzZXMgaW4gZHJtX2RwX2VuY29kZV9zaWRlYmFuZF9yZXEoKSIgdG8KICBmdWxmaWxsIHNv
bWUgb2YgdGhlIGRhbnZldCdzIHJldmlldyByZXF1ZXN0cwoKTHl1ZGUgUGF1bCAoMjcpOgogIGRy
bS9kcF9tc3Q6IE1vdmUgbGluayBhZGRyZXNzIGR1bXBpbmcgaW50byBhIGZ1bmN0aW9uCiAgZHJt
L2RwX21zdDogR2V0IHJpZCBvZiBsaXN0IGNsZWFyIGluIGRlc3Ryb3lfY29ubmVjdG9yX3dvcmsK
ICBkcm0vZHBfbXN0OiBEZXN0cm95IE1TVEJzIGFzeW5jaHJvbm91c2x5CiAgZHJtL2RwX21zdDog
TW92ZSB0ZXN0X2NhbGNfcGJuX21vZGUoKSBpbnRvIGFuIGFjdHVhbCBzZWxmdGVzdAogIGRybS9w
cmludDogQWRkIGRybV9lcnJfcHJpbnRlcigpCiAgZHJtL2RwX21zdDogQ29tYmluZSByZWR1bmRh
bnQgY2FzZXMgaW4gZHJtX2RwX2VuY29kZV9zaWRlYmFuZF9yZXEoKQogIGRybS9kcF9tc3Q6IEFk
ZCBzaWRlYmFuZCBkb3duIHJlcXVlc3QgdHJhY2luZyArIHNlbGZ0ZXN0cwogIGRybS9kcF9tc3Q6
IFJlbW92ZSBQRFQgdGVhcmRvd24gaW4gZHJtX2RwX2Rlc3Ryb3lfcG9ydCgpIGFuZCByZWZhY3Rv
cgogIGRybS9kcF9tc3Q6IFJlZmFjdG9yIGRybV9kcF9zZW5kX2VudW1fcGF0aF9yZXNvdXJjZXMK
ICBkcm0vZHBfbXN0OiBSZW1vdmUgaHVnZSBjb25kaXRpb25hbCBpbiBkcm1fZHBfbXN0X2hhbmRs
ZV91cF9yZXEoKQogIGRybS9kcF9tc3Q6IENvbnN0aWZ5IGd1aWQgaW4gZHJtX2RwX2dldF9tc3Rf
YnJhbmNoX2J5X2d1aWQoKQogIGRybS9kcF9tc3Q6IFJlZmFjdG9yIGRybV9kcF9tc3RfaGFuZGxl
X3VwX3JlcSgpCiAgZHJtL2RwX21zdDogUmVmYWN0b3IgZHJtX2RwX21zdF9oYW5kbGVfZG93bl9y
ZXAoKQogIGRybS9kcF9tc3Q6IERlc3Ryb3kgdG9wb2xvZ3lfbWdyIG11dGV4ZXMKICBkcm0vZHBf
bXN0OiBDbGVhbnVwIGRybV9kcF9zZW5kX2xpbmtfYWRkcmVzcygpIGEgYml0CiAgZHJtL2RwX21z
dDogUmVmYWN0b3IgcGR0IHNldHVwL3RlYXJkb3duLCBhZGQgbW9yZSBsb2NraW5nCiAgZHJtL2Rw
X21zdDogUmVuYW1lIGRybV9kcF9hZGRfcG9ydCBhbmQgZHJtX2RwX3VwZGF0ZV9wb3J0CiAgZHJt
L2RwX21zdDogUmVtb3ZlIGxpZXMgaW4ge3VwLGRvd259X3JlcF9yZWN2IGRvY3VtZW50YXRpb24K
ICBkcm0vZHBfbXN0OiBIYW5kbGUgVVAgcmVxdWVzdHMgYXN5bmNocm9ub3VzbHkKICBkcm0vZHBf
bXN0OiBQcm90ZWN0IGRybV9kcF9tc3RfcG9ydCBtZW1iZXJzIHdpdGggY29ubmVjdGlvbl9tdXRl
eAogIGRybS9kcF9tc3Q6IERvbid0IGZvcmdldCB0byB1cGRhdGUgcG9ydC0+aW5wdXQgaW4KICAg
IGRybV9kcF9tc3RfaGFuZGxlX2Nvbm5fc3RhdCgpCiAgZHJtL25vdXZlYXU6IERvbid0IGdyYWIg
cnVudGltZSBQTSByZWZzIGZvciBIUEQgSVJRcwogIGRybS9hbWRncHU6IEl0ZXJhdGUgdGhyb3Vn
aCBEUk0gY29ubmVjdG9ycyBjb3JyZWN0bHkKICBkcm0vYW1kZ3B1L2RtOiBSZXN1bWUgc2hvcnQg
SFBEIElSUXMgYmVmb3JlIHJlc3VtaW5nIE1TVCB0b3BvbG9neQogIGRybS9kcF9tc3Q6IEFkZCBi
YXNpYyB0b3BvbG9neSByZXByb2Jpbmcgd2hlbiByZXN1bWluZwogIGRybS9kcF9tc3Q6IEFsc28g
cHJpbnQgdW5oYXNoZWQgcG9pbnRlcnMgZm9yIG1hbGxvYy90b3BvbG9neQogICAgcmVmZXJlbmNl
cwogIGRybS9kcF9tc3Q6IEFkZCB0b3BvbG9neSByZWYgaGlzdG9yeSB0cmFja2luZyBmb3IgZGVi
dWdnaW5nCgogZHJpdmVycy9ncHUvZHJtL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAxNCArCiAuLi4vZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jb25uZWN0b3JzLmMgICAgfCAg
IDEzICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgICAgfCAg
IDIwICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jICAgfCAg
ICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZW5jb2RlcnMuYyAgfCAg
IDQwICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaXJxLmMgICAgICAgfCAg
ICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjEwXzAuYyAgICAgICAgfCAg
IDM0ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjExXzAuYyAgICAgICAgfCAg
IDM0ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjZfMC5jICAgICAgICAgfCAg
IDQwICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjhfMC5jICAgICAgICAgfCAg
IDM0ICstCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAg
IDQxICstCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faXJxLmMgfCAg
IDEwICstCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jICAgICAgICAgfCAx
NjMzICsrKysrKysrKysrKystLS0tCiAuLi4vZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5X2lu
dGVybmFsLmggICAgfCAgIDI0ICsKIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYyAgICAgICAg
ICAgICAgICAgICB8ICAgIDYgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cC5jICAgICAgIHwgICAgMyArLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlz
cC5jICAgICAgIHwgICAgNiArLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25u
ZWN0b3IuYyAgIHwgICAzMyArLQogZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy9NYWtlZmlsZSAg
ICAgICAgICAgIHwgICAgMiArLQogLi4uL2dwdS9kcm0vc2VsZnRlc3RzL2RybV9tb2Rlc2V0X3Nl
bGZ0ZXN0cy5oIHwgICAgMiArCiAuLi4vZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVs
cGVyLmMgICAgfCAgMjM4ICsrKwogLi4uL2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fbW9kZXNldF9j
b21tb24uaCAgIHwgICAgMiArCiBpbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oICAgICAg
ICAgICAgICAgfCAgMTQzICstCiBpbmNsdWRlL2RybS9kcm1fcHJpbnQuaCAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDE3ICsKIDI0IGZpbGVzIGNoYW5nZWQsIDE4NzMgaW5zZXJ0aW9ucygrKSwg
NTI2IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfbXN0X3RvcG9sb2d5X2ludGVybmFsLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2RwX21zdF9oZWxwZXIuYwoKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
