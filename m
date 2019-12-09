Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D84A117704
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 21:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713636E517;
	Mon,  9 Dec 2019 20:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41156E517
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 20:07:17 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 161532073D;
 Mon,  9 Dec 2019 20:07:16 +0000 (UTC)
Subject: Patch "drm: damage_helper: Fix race checking plane->state->fb" has
 been added to the 5.3-stable tree
To: 20190904202938.110207-1-sean@poorly.run, airlied@linux.ie,
 daniel.vetter@ffwll.ch, daniel@ffwll.ch, drawat@vmware.com,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 robdclark@gmail.com, sean@poorly.run, seanpaul@chromium.org,
 thellstrom@vmware.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 09 Dec 2019 21:02:58 +0100
Message-ID: <157592177821982@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575922037;
 bh=AvCYkZ/ojL9xQUI49b17kh/ZhdnqHWEQS+w2pnV45OA=;
 h=Subject:To:Cc:From:Date:From;
 b=DxDPGENOL6YiWj350zzcBcE10744vGyP1/tG2TjhneN7uGvb+tQdIqise+F8bEiT8
 je7ES1R3n3bfzI8zohnX6xluxUMgxe8LaUz+vYrH5CtdVqXnULVbMEK0g3i527yWYb
 q59yfADPKubVi1Kcrc4IONiK9iVNw0BNrcRGWBjI=
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClRoaXMgaXMgYSBub3RlIHRvIGxldCB5b3Uga25vdyB0aGF0IEkndmUganVzdCBhZGRlZCB0aGUg
cGF0Y2ggdGl0bGVkCgogICAgZHJtOiBkYW1hZ2VfaGVscGVyOiBGaXggcmFjZSBjaGVja2luZyBw
bGFuZS0+c3RhdGUtPmZiCgp0byB0aGUgNS4zLXN0YWJsZSB0cmVlIHdoaWNoIGNhbiBiZSBmb3Vu
ZCBhdDoKICAgIGh0dHA6Ly93d3cua2VybmVsLm9yZy9naXQvP3A9bGludXgva2VybmVsL2dpdC9z
dGFibGUvc3RhYmxlLXF1ZXVlLmdpdDthPXN1bW1hcnkKClRoZSBmaWxlbmFtZSBvZiB0aGUgcGF0
Y2ggaXM6CiAgICAgZHJtLWRhbWFnZV9oZWxwZXItZml4LXJhY2UtY2hlY2tpbmctcGxhbmUtc3Rh
dGUtZmIucGF0Y2gKYW5kIGl0IGNhbiBiZSBmb3VuZCBpbiB0aGUgcXVldWUtNS4zIHN1YmRpcmVj
dG9yeS4KCklmIHlvdSwgb3IgYW55b25lIGVsc2UsIGZlZWxzIGl0IHNob3VsZCBub3QgYmUgYWRk
ZWQgdG8gdGhlIHN0YWJsZSB0cmVlLApwbGVhc2UgbGV0IDxzdGFibGVAdmdlci5rZXJuZWwub3Jn
PiBrbm93IGFib3V0IGl0LgoKCkZyb20gMzU0YzJkMzEwMDgyZDFjMzg0MjEzYmE3NmMzNzU3ZGQz
Y2Q4NzU1ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogU2VhbiBQYXVsIDxzZWFucGF1
bEBjaHJvbWl1bS5vcmc+CkRhdGU6IFdlZCwgNCBTZXAgMjAxOSAxNjoyOToxMyAtMDQwMApTdWJq
ZWN0OiBkcm06IGRhbWFnZV9oZWxwZXI6IEZpeCByYWNlIGNoZWNraW5nIHBsYW5lLT5zdGF0ZS0+
ZmIKCkZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgoKY29tbWl0IDM1NGMy
ZDMxMDA4MmQxYzM4NDIxM2JhNzZjMzc1N2RkM2NkODc1NWQgdXBzdHJlYW0uCgpTaW5jZSB0aGUg
ZGlydHlmYiBpb2N0bCBkb2Vzbid0IGdpdmUgdXMgYW55IGhpbnRzIGFzIHRvIHdoaWNoIHBsYW5l
IGlzCnNjYW5uaW5nIG91dCB0aGUgZmIgaXQncyBtYXJraW5nIGFzIGRhbWFnZWQsIHdlIG5lZWQg
dG8gbG9vcCB0aHJvdWdoCnBsYW5lcyB0byBmaW5kIGl0LgoKQ3VycmVudGx5IHdlIGp1c3QgcmVh
Y2ggaW50byBwbGFuZSBzdGF0ZSBhbmQgY2hlY2ssIGJ1dCB0aGF0IGNhbiByYWNlCndpdGggYW5v
dGhlciBjb21taXQgY2hhbmdpbmcgdGhlIGZiIG91dCBmcm9tIHVuZGVyIHVzLiBUaGlzIHBhdGNo
IGxvY2tzCnRoZSBwbGFuZSBiZWZvcmUgY2hlY2tpbmcgdGhlIGZiIGFuZCB3aWxsIHJlbGVhc2Ug
dGhlIGxvY2sgaWYgdGhlIHBsYW5lCmlzIG5vdCBkaXNwbGF5aW5nIHRoZSBkaXJ0eSBmYi4KCkZp
eGVzOiBiOWZjNWUwMWQxY2UgKCJkcm06IEFkZCBoZWxwZXIgdG8gaW1wbGVtZW50IGxlZ2FjeSBk
aXJ0eWZiIikKQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KQ2M6IERlZXBhayBS
YXdhdCA8ZHJhd2F0QHZtd2FyZS5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPgpDYzogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgpD
YzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4K
Q2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+CkNjOiBTZWFuIFBh
dWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHY1LjArClJlcG9y
dGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+ClJldmlld2VkLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2Vh
bnBhdWxAY2hyb21pdW0ub3JnPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvcGF0Y2gvbXNnaWQvMjAxOTA5MDQyMDI5MzguMTEwMjA3LTEtc2VhbkBwb29ybHkucnVuClNp
Z25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+CgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGFtYWdlX2hlbHBlci5jIHwgICAgOCArKysr
KysrLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMKQEAgLTIxMiw4ICsyMTIsMTQgQEAgcmV0cnk6CiAJZHJt
X2Zvcl9lYWNoX3BsYW5lKHBsYW5lLCBmYi0+ZGV2KSB7CiAJCXN0cnVjdCBkcm1fcGxhbmVfc3Rh
dGUgKnBsYW5lX3N0YXRlOwogCi0JCWlmIChwbGFuZS0+c3RhdGUtPmZiICE9IGZiKQorCQlyZXQg
PSBkcm1fbW9kZXNldF9sb2NrKCZwbGFuZS0+bXV0ZXgsIHN0YXRlLT5hY3F1aXJlX2N0eCk7CisJ
CWlmIChyZXQpCisJCQlnb3RvIG91dDsKKworCQlpZiAocGxhbmUtPnN0YXRlLT5mYiAhPSBmYikg
eworCQkJZHJtX21vZGVzZXRfdW5sb2NrKCZwbGFuZS0+bXV0ZXgpOwogCQkJY29udGludWU7CisJ
CX0KIAogCQlwbGFuZV9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X3BsYW5lX3N0YXRlKHN0YXRlLCBw
bGFuZSk7CiAJCWlmIChJU19FUlIocGxhbmVfc3RhdGUpKSB7CgoKUGF0Y2hlcyBjdXJyZW50bHkg
aW4gc3RhYmxlLXF1ZXVlIHdoaWNoIG1pZ2h0IGJlIGZyb20gc2VhbnBhdWxAY2hyb21pdW0ub3Jn
IGFyZQoKcXVldWUtNS4zL2RybS1tc20tZml4LW1lbWxlYWstb24tcmVsZWFzZS5wYXRjaApxdWV1
ZS01LjMvZHJtLWRhbWFnZV9oZWxwZXItZml4LXJhY2UtY2hlY2tpbmctcGxhbmUtc3RhdGUtZmIu
cGF0Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
