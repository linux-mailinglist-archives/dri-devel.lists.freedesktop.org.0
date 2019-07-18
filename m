Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4A76C483
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 03:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2026E2DD;
	Thu, 18 Jul 2019 01:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133F16E2CE;
 Thu, 18 Jul 2019 01:44:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 954743082A9C;
 Thu, 18 Jul 2019 01:44:55 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-120-112.rdu2.redhat.com
 [10.10.120.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7236E19C67;
 Thu, 18 Jul 2019 01:44:54 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 21/26] drm/nouveau: Don't grab runtime PM refs for HPD IRQs
Date: Wed, 17 Jul 2019 21:42:44 -0400
Message-Id: <20190718014329.8107-22-lyude@redhat.com>
In-Reply-To: <20190718014329.8107-1-lyude@redhat.com>
References: <20190718014329.8107-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 18 Jul 2019 01:44:55 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Juston Li <juston.li@intel.com>,
 Harry Wentland <hwentlan@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gb3JkZXIgZm9yIHN1c3BlbmQvcmVzdW1lIHJlcHJvYmluZyB0byB3b3JrLCB3ZSBuZWVkIHRv
IGJlIGFibGUgdG8KcGVyZm9ybSBzaWRlYmFuZCBjb21tdW5pY2F0aW9ucyBkdXJpbmcgc3VzcGVu
ZC9yZXN1bWUsIGFsb25nIHdpdGgKcnVudGltZSBQTSBzdXNwZW5kL3Jlc3VtZS4gSW4gb3JkZXIg
dG8gZG8gc28sIHdlIGFsc28gbmVlZCB0byBtYWtlIHN1cmUKdGhhdCBub3V2ZWF1IGRvZXNuJ3Qg
Ym90aGVyIGdyYWJiaW5nIGEgcnVudGltZSBQTSByZWZlcmVuY2UgdG8gZG8gc28sCnNpbmNlIG90
aGVyd2lzZSB3ZSdsbCBzdGFydCBkZWFkbG9ja2luZyBydW50aW1lIFBNIGFnYWluLgoKTm90ZSB0
aGF0IHdlIHdlcmVuJ3QgYWJsZSB0byBkbyB0aGlzIGJlZm9yZSwgYmVjYXVzZSBvZiB0aGUgRFAg
TVNUCmhlbHBlcnMgcHJvY2Vzc2luZyBVUCByZXF1ZXN0cyBmcm9tIHRvcG9sb2dpZXMgaW4gdGhl
IHNhbWUgY29udGV4dCBhcwpkcm1fZHBfbXN0X2hwZF9pcnEoKSB3aGljaCB3b3VsZCBoYXZlIGNh
dXNlZCB1cyB0byBvcGVuIG91cnNlbHZlcyB1cCB0bwpyZWNlaXZpbmcgaG90cGx1ZyBldmVudHMg
YW5kIGRlYWRsb2NraW5nIHdpdGggcnVudGltZSBzdXNwZW5kL3Jlc3VtZS4KTm93IHRoYXQgdGhv
c2UgcmVxdWVzdHMgYXJlIGhhbmRsZWQgYXN5bmNocm9ub3VzbHksIHRoaXMgY2hhbmdlIHNob3Vs
ZApiZSBjb21wbGV0ZWx5IHNhZmUuCgpDYzogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50ZWwuY29t
PgpDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpDYzogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxod2Vu
dGxhbkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMgfCAzMyAr
KysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAx
NiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0
b3IuYwppbmRleCA0MTE2ZWU2MmFkYWYuLmU5ZTc4Njk2YTcyOCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jCkBAIC0xMTI5LDYgKzExMjksMTYgQEAgbm91
dmVhdV9jb25uZWN0b3JfaG90cGx1ZyhzdHJ1Y3QgbnZpZl9ub3RpZnkgKm5vdGlmeSkKIAljb25z
dCBjaGFyICpuYW1lID0gY29ubmVjdG9yLT5uYW1lOwogCXN0cnVjdCBub3V2ZWF1X2VuY29kZXIg
Km52X2VuY29kZXI7CiAJaW50IHJldDsKKwlib29sIHBsdWdnZWQgPSAocmVwLT5tYXNrICE9IE5W
SUZfTk9USUZZX0NPTk5fVjBfVU5QTFVHKTsKKworCWlmIChyZXAtPm1hc2sgJiBOVklGX05PVElG
WV9DT05OX1YwX0lSUSkgeworCQlOVl9ERUJVRyhkcm0sICJzZXJ2aWNlICVzXG4iLCBuYW1lKTsK
KwkJZHJtX2RwX2NlY19pcnEoJm52X2Nvbm5lY3Rvci0+YXV4KTsKKwkJaWYgKChudl9lbmNvZGVy
ID0gZmluZF9lbmNvZGVyKGNvbm5lY3RvciwgRENCX09VVFBVVF9EUCkpKQorCQkJbnY1MF9tc3Rt
X3NlcnZpY2UobnZfZW5jb2Rlci0+ZHAubXN0bSk7CisKKwkJcmV0dXJuIE5WSUZfTk9USUZZX0tF
RVA7CisJfQogCiAJcmV0ID0gcG1fcnVudGltZV9nZXQoZHJtLT5kZXYtPmRldik7CiAJaWYgKHJl
dCA9PSAwKSB7CkBAIC0xMTQ5LDI1ICsxMTU5LDE2IEBAIG5vdXZlYXVfY29ubmVjdG9yX2hvdHBs
dWcoc3RydWN0IG52aWZfbm90aWZ5ICpub3RpZnkpCiAJCXJldHVybiBOVklGX05PVElGWV9EUk9Q
OwogCX0KIAotCWlmIChyZXAtPm1hc2sgJiBOVklGX05PVElGWV9DT05OX1YwX0lSUSkgewotCQlO
Vl9ERUJVRyhkcm0sICJzZXJ2aWNlICVzXG4iLCBuYW1lKTsKLQkJZHJtX2RwX2NlY19pcnEoJm52
X2Nvbm5lY3Rvci0+YXV4KTsKLQkJaWYgKChudl9lbmNvZGVyID0gZmluZF9lbmNvZGVyKGNvbm5l
Y3RvciwgRENCX09VVFBVVF9EUCkpKQotCQkJbnY1MF9tc3RtX3NlcnZpY2UobnZfZW5jb2Rlci0+
ZHAubXN0bSk7Ci0JfSBlbHNlIHsKLQkJYm9vbCBwbHVnZ2VkID0gKHJlcC0+bWFzayAhPSBOVklG
X05PVElGWV9DT05OX1YwX1VOUExVRyk7Ci0KKwlpZiAoIXBsdWdnZWQpCisJCWRybV9kcF9jZWNf
dW5zZXRfZWRpZCgmbnZfY29ubmVjdG9yLT5hdXgpOworCU5WX0RFQlVHKGRybSwgIiVzcGx1Z2dl
ZCAlc1xuIiwgcGx1Z2dlZCA/ICIiIDogInVuIiwgbmFtZSk7CisJaWYgKChudl9lbmNvZGVyID0g
ZmluZF9lbmNvZGVyKGNvbm5lY3RvciwgRENCX09VVFBVVF9EUCkpKSB7CiAJCWlmICghcGx1Z2dl
ZCkKLQkJCWRybV9kcF9jZWNfdW5zZXRfZWRpZCgmbnZfY29ubmVjdG9yLT5hdXgpOwotCQlOVl9E
RUJVRyhkcm0sICIlc3BsdWdnZWQgJXNcbiIsIHBsdWdnZWQgPyAiIiA6ICJ1biIsIG5hbWUpOwot
CQlpZiAoKG52X2VuY29kZXIgPSBmaW5kX2VuY29kZXIoY29ubmVjdG9yLCBEQ0JfT1VUUFVUX0RQ
KSkpIHsKLQkJCWlmICghcGx1Z2dlZCkKLQkJCQludjUwX21zdG1fcmVtb3ZlKG52X2VuY29kZXIt
PmRwLm1zdG0pOwotCQl9Ci0KLQkJZHJtX2hlbHBlcl9ocGRfaXJxX2V2ZW50KGNvbm5lY3Rvci0+
ZGV2KTsKKwkJCW52NTBfbXN0bV9yZW1vdmUobnZfZW5jb2Rlci0+ZHAubXN0bSk7CiAJfQogCisJ
ZHJtX2hlbHBlcl9ocGRfaXJxX2V2ZW50KGNvbm5lY3Rvci0+ZGV2KTsKKwogCXBtX3J1bnRpbWVf
bWFya19sYXN0X2J1c3koZHJtLT5kZXYtPmRldik7CiAJcG1fcnVudGltZV9wdXRfYXV0b3N1c3Bl
bmQoZHJtLT5kZXYtPmRldik7CiAJcmV0dXJuIE5WSUZfTk9USUZZX0tFRVA7Ci0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
