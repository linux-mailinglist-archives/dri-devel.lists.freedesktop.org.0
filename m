Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 062FBDFBBA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 04:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88786E31E;
	Tue, 22 Oct 2019 02:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC99C6E320
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 02:39:23 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-TILZfxBFOEqeACPmDj-UiQ-1; Mon, 21 Oct 2019 22:39:18 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6C60800D41;
 Tue, 22 Oct 2019 02:39:12 +0000 (UTC)
Received: from malachite.redhat.com (ovpn-120-98.rdu2.redhat.com
 [10.10.120.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB3BC60126;
 Tue, 22 Oct 2019 02:37:13 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 00/14] DP MST Refactors + debugging tools + suspend/resume
 reprobing
Date: Mon, 21 Oct 2019 22:35:55 -0400
Message-Id: <20191022023641.8026-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: TILZfxBFOEqeACPmDj-UiQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571711962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YhY8RBO4XfCrBkxlH8rgZzaLB/4Dib/JgMGT4HhW/x0=;
 b=UZR9UTIZviOYz/m11ILrVYRXcPxgsHN3v4yzI56peYNXLcS0ZI454iLUVp24Lj02oKAMbg
 LPDbaw/+EkBWUcQbfnPbq57doZ7czuZp15BcvVwjezHh4wrQ4iaLCUC6WJW/8UQetqqDla
 5fWikptR+fighpdMsKazj/pfi7Pg7gs=
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
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Huang Rui <ray.huang@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Markus Elfring <elfring@users.sourceforge.net>, Yu Zhao <yuzhao@google.com>,
 David Francis <david.francis@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 "Jerry \(Fangzhi\) Zuo" <jerry.zuo@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Thierry Reding <treding@nvidia.com>, Tao Zhou <tao.zhou1@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Emily Deng <emily.deng@amd.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Monk Liu <monk.liu@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>,
 Thomas Lim <thomas.lim@amd.com>, Felix Kuehling <felix.kuehling@amd.com>,
 xinhui pan <xinhui.pan@amd.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@amd.com>,
 linux-kernel@vger.kernel.org, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Mathias=20Fr=C3=B6hlich?= <mathias.froehlich@web.de>,
 Hawking Zhang <hawking.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyB0aGUgZmluYWwgcG9ydGlvbiBvZiB0aGUgbGFyZ2Ugc2VyaWVzIGZvciBhZGRpbmcg
TVNUCnN1c3BlbmQvcmVzdW1lIHJlcHJvYmluZyB0aGF0IEkndmUgYmVlbiB3b3JraW5nIG9uIGZv
ciBxdWl0ZSBhIHdoaWxlCm5vdy4gSW4gYWRkaXRpb24sIEk6CgoqIFJlZmFjdG9yZWQgYW5kIGNs
ZWFuZWQgdXAgYW55IGNvZGUgSSBlbmRlZCB1cCBkaWdnaW5nIHRocm91Z2ggaW4gdGhlCiAgcHJv
Y2VzcyBvZiB1bmRlcnN0YW5kaW5nIGhvdyBzb21lIHBhcnRzIG9mIHRoZXNlIGhlbHBlcnMgd29y
a2VkLgoqIEFkZGVkIHNvbWUgZGVidWdnaW5nIHRvb2xzIGFsb25nIHRoZSB3YXkgdGhhdCBJIGVu
ZGVkIHVwIG5lZWRpbmcgdG8KICBmaWd1cmUgb3V0IHNvbWUgaXNzdWVzIGluIG15IG93biBjb2Rl
CgpOb3RlIHRoYXQgdGhlcmUncyBzdGlsbCBvbmUgaW1wb3J0YW50IHBhcnQgb2YgdGhpcyBwcm9j
ZXNzIG1pc3NpbmcKdGhhdCdzIG5vdCBpbmNsdWRlZCBpbiB0aGlzIHBhdGNoIHNlcmllczogRURJ
RCByZXByb2JpbmcsIHdoaWNoIEkKYmVsaWV2ZSBTdGFuaXNsYXYgTGlzb3Zza2l5IGZyb20gSW50
ZWwgaXMgY3VycmVudGx5IHdvcmtpbmcgb24uIFRoZSBtYWluCnB1cnBvc2Ugb2YgdGhpcyBzZXJp
ZXMgaXMgdG8gZml4IHRoZSBpc3N1ZSBvZiB0aGUgaW4tbWVtb3J5IHRvcG9sb2d5CnN0YXRlIChl
LmcuIGNvbm5lY3RvcnMgY29ubmVjdGVkIHRvIGFuIE1TVCBodWIsIGJyYW5jaCBkZXZpY2VzLCBl
dGMuKQpnb2luZyBvdXQgb2Ygc3luYyBpZiBhIHRvcG9sb2d5IGNvbm5lY3RlZCB0byBhIGNvbm5l
Y3RvciBpcyBzd2FwcGVkIG91dAp3aXRoIGEgZGlmZmVyZW50IHRvcG9sb2d5IHdoaWxlIHRoZSBz
eXN0ZW0gaXMgcmVzdW1lZCwgb3Igd2hpbGUgdGhlCmRldmljZSBob3VzaW5nIHNhaWQgY29ubmVj
dG9yIGlzIGluIHJ1bnRpbWUgc3VzcGVuZC4KCkFzIHdlbGwsIHRoZSBkZWJ1Z2dpbmcgdG9vbHMg
dGhhdCBhcmUgYWRkZWQgaW4gdGhpcyBpbmNsdWRlOgoqIEEgbGltaXRlZCBkZWJ1Z2dpbmcgdXRp
bGl0eSBmb3IgZHVtcGluZyB0aGUgbGlzdCBvZiB0b3BvbG9neQogIHJlZmVyZW5jZXMgb24gYW4g
TVNUIHBvcnQgb3IgYnJhbmNoIGNvbm5lY3RvciB3aG9zZSB0b3BvbG9neSByZWZlcmVuY2UKICBj
b3VudCBoYXMgcmVhY2hlZCAwCjxzaWRlYmFuZCBtZXNzYWdlIGR1bXBpbmcgaGFzIGJlZW4gbWVy
Z2VkIDopPgoKTHl1ZGUgUGF1bCAoMTQpOgogIGRybS9kcF9tc3Q6IERlc3Ryb3kgTVNUQnMgYXN5
bmNocm9ub3VzbHkKICBkcm0vZHBfbXN0OiBSZW1vdmUgUERUIHRlYXJkb3duIGluIGRybV9kcF9k
ZXN0cm95X3BvcnQoKSBhbmQgcmVmYWN0b3IKICBkcm0vZHBfbXN0OiBSZWZhY3RvciBwZHQgc2V0
dXAvdGVhcmRvd24sIGFkZCBtb3JlIGxvY2tpbmcKICBkcm0vZHBfbXN0OiBIYW5kbGUgVVAgcmVx
dWVzdHMgYXN5bmNocm9ub3VzbHkKICBkcm0vZHBfbXN0OiBBZGQgcHJvYmVfbG9jawogIGRybS9k
cF9tc3Q6IFByb3RlY3QgZHJtX2RwX21zdF9wb3J0IG1lbWJlcnMgd2l0aCBsb2NraW5nCiAgZHJt
L2RwX21zdDogRG9uJ3QgZm9yZ2V0IHRvIHVwZGF0ZSBwb3J0LT5pbnB1dCBpbgogICAgZHJtX2Rw
X21zdF9oYW5kbGVfY29ubl9zdGF0KCkKICBkcm0vZHBfbXN0OiBMZXNzZW4gaW5kZW50aW5nIGlu
IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3Jlc3VtZSgpCiAgZHJtL25vdXZlYXU6IERvbid0IGdy
YWIgcnVudGltZSBQTSByZWZzIGZvciBIUEQgSVJRcwogIGRybS9ub3V2ZWF1OiBSZXN1bWUgaG90
cGx1ZyBpbnRlcnJ1cHRzIGVhcmxpZXIKICBkcm0vYW1kZ3B1OiBJdGVyYXRlIHRocm91Z2ggRFJN
IGNvbm5lY3RvcnMgY29ycmVjdGx5CiAgZHJtL2FtZGdwdS9kbTogUmVzdW1lIHNob3J0IEhQRCBJ
UlFzIGJlZm9yZSByZXN1bWluZyBNU1QgdG9wb2xvZ3kKICBkcm0vZHBfbXN0OiBBZGQgYmFzaWMg
dG9wb2xvZ3kgcmVwcm9iaW5nIHdoZW4gcmVzdW1pbmcKICBkcm0vZHBfbXN0OiBBZGQgdG9wb2xv
Z3kgcmVmIGhpc3RvcnkgdHJhY2tpbmcgZm9yIGRlYnVnZ2luZwoKIGRyaXZlcnMvZ3B1L2RybS9L
Y29uZmlnICAgICAgICAgICAgICAgICAgICAgICB8ICAgMTQgKwogLi4uL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfY29ubmVjdG9ycy5jICAgIHwgICAxMyArLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jICAgIHwgICAyMCArLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYyAgIHwgICAgNSArLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2VuY29kZXJzLmMgIHwgICA0MCArLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2lycS5jICAgICAgIHwgICAgNSArLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZGNlX3YxMF8wLmMgICAgICAgIHwgICAzNCArLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZGNlX3YxMV8wLmMgICAgICAgIHwgICAzNCArLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZGNlX3Y2XzAuYyAgICAgICAgIHwgICA0MCArLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZGNlX3Y4XzAuYyAgICAgICAgIHwgICAzNCArLQogLi4uL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgICA0MSArLQogLi4uL2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtX2lycS5jIHwgICAxMCArLQogLi4uL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyAgIHwgICAyOCArLQogZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9tc3RfdG9wb2xvZ3kuYyAgICAgICAgIHwgMTE4NSArKysrKysrKysrKysrLS0tLQogZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jICAgICAgIHwgICAgMyArLQogZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYyAgIHwgICAyOCArLQogZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jICAgICAgIHwgICAzOCArLQogZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYyAgIHwgICAzMyArLQogZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmMgICAgIHwgICAxOSArLQogZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHBfbXN0LmMgICAgICAgIHwgICAyNCArLQogaW5j
bHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaCAgICAgICAgICAgICAgIHwgIDE2MCArKy0KIDIx
IGZpbGVzIGNoYW5nZWQsIDEzMjkgaW5zZXJ0aW9ucygrKSwgNDc5IGRlbGV0aW9ucygtKQoKLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
