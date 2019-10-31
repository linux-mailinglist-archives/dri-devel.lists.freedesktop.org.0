Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E62EB0B2
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 14:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990A56EC30;
	Thu, 31 Oct 2019 13:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714BB6EE54;
 Thu, 31 Oct 2019 11:55:05 +0000 (UTC)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tip-bot2@linutronix.de>)
 id 1iQ92W-0002qf-48; Thu, 31 Oct 2019 12:54:56 +0100
Received: from [127.0.1.1] (localhost [IPv6:::1])
 by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id B17A41C03AD;
 Thu, 31 Oct 2019 12:54:55 +0100 (CET)
Date: Thu, 31 Oct 2019 11:54:55 -0000
From: "tip-bot2 for Paul E. McKenney" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
Subject: [tip: core/rcu] drm/i915: Replace rcu_swap_protected() with
 rcu_replace_pointer()
MIME-Version: 1.0
Message-ID: <157252289545.29376.11174975468179332374.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Mailman-Approved-At: Thu, 31 Oct 2019 13:00:41 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Reply-To: linux-kernel@vger.kernel.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZvbGxvd2luZyBjb21taXQgaGFzIGJlZW4gbWVyZ2VkIGludG8gdGhlIGNvcmUvcmN1IGJy
YW5jaCBvZiB0aXA6CgpDb21taXQtSUQ6ICAgICAxZmVhY2U1ZDZhNGExYWNmNDRkZGUyYmZiNWMz
NmNjMGIxY2Y1NTljCkdpdHdlYjogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvdGlwLzFm
ZWFjZTVkNmE0YTFhY2Y0NGRkZTJiZmI1YzM2Y2MwYjFjZjU1OWMKQXV0aG9yOiAgICAgICAgUGF1
bCBFLiBNY0tlbm5leSA8cGF1bG1ja0BrZXJuZWwub3JnPgpBdXRob3JEYXRlOiAgICBNb24sIDIz
IFNlcCAyMDE5IDE1OjIyOjE1IC0wNzowMApDb21taXR0ZXI6ICAgICBQYXVsIEUuIE1jS2VubmV5
IDxwYXVsbWNrQGtlcm5lbC5vcmc+CkNvbW1pdHRlckRhdGU6IFdlZCwgMzAgT2N0IDIwMTkgMDg6
NDQ6MDQgLTA3OjAwCgpkcm0vaTkxNTogUmVwbGFjZSByY3Vfc3dhcF9wcm90ZWN0ZWQoKSB3aXRo
IHJjdV9yZXBsYWNlX3BvaW50ZXIoKQoKVGhpcyBjb21taXQgcmVwbGFjZXMgdGhlIHVzZSBvZiBy
Y3Vfc3dhcF9wcm90ZWN0ZWQoKSB3aXRoIHRoZSBtb3JlCmludHVpdGl2ZWx5IGFwcGVhbGluZyBy
Y3VfcmVwbGFjZV9wb2ludGVyKCkgYXMgYSBzdGVwIHRvd2FyZHMgcmVtb3ZpbmcKcmN1X3N3YXBf
cHJvdGVjdGVkKCkuCgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBSGstPXdp
QXNKTHcxZWdGRUU9WjctR0d0TTZ3Y3Z0eXl0WFpBMStCSHF0YTRnZzZId0BtYWlsLmdtYWlsLmNv
bS8KUmVwb3J0ZWQtYnk6IExpbnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9u
Lm9yZz4KWyBwYXVsbWNrOiBGcm9tIHJjdV9yZXBsYWNlKCkgdG8gcmN1X3JlcGxhY2VfcG9pbnRl
cigpIHBlciBJbmdvIE1vbG5hci4gXQpTaWduZWQtb2ZmLWJ5OiBQYXVsIEUuIE1jS2VubmV5IDxw
YXVsbWNrQGtlcm5lbC5vcmc+ClJldmlld2VkLWJ5OiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5s
YWh0aW5lbkBsaW51eC5pbnRlbC5jb20+CkNjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGlu
dXguaW50ZWwuY29tPgpDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgpD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+
CkNjOiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgpDYzogPGludGVs
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+CkNjOiA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fY29udGV4dC5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2NvbnRleHQuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9jb250ZXh0LmMKaW5kZXggMWNkZmUw
NS4uM2YzZTgwMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
X2NvbnRleHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fY29udGV4
dC5jCkBAIC0xNjI5LDcgKzE2MjksNyBAQCByZXBsYWNlOgogCQlpOTE1X2dlbV9jb250ZXh0X3Nl
dF91c2VyX2VuZ2luZXMoY3R4KTsKIAllbHNlCiAJCWk5MTVfZ2VtX2NvbnRleHRfY2xlYXJfdXNl
cl9lbmdpbmVzKGN0eCk7Ci0JcmN1X3N3YXBfcHJvdGVjdGVkKGN0eC0+ZW5naW5lcywgc2V0LmVu
Z2luZXMsIDEpOworCXNldC5lbmdpbmVzID0gcmN1X3JlcGxhY2VfcG9pbnRlcihjdHgtPmVuZ2lu
ZXMsIHNldC5lbmdpbmVzLCAxKTsKIAltdXRleF91bmxvY2soJmN0eC0+ZW5naW5lc19tdXRleCk7
CiAKIAljYWxsX3JjdSgmc2V0LmVuZ2luZXMtPnJjdSwgZnJlZV9lbmdpbmVzX3JjdSk7Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
