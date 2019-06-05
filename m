Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A14735B55
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 13:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630E08987C;
	Wed,  5 Jun 2019 11:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 900 seconds by postgrey-1.36 at gabe;
 Wed, 05 Jun 2019 11:34:33 UTC
Received: from cam-smtp0.cambridge.arm.com (unknown [217.140.106.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418DB8987C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 11:34:32 +0000 (UTC)
Received: from e110455-lin.cambridge.arm.com (e110455-lin.cambridge.arm.com
 [10.2.131.87])
 by cam-smtp0.cambridge.arm.com (8.13.8/8.13.8) with ESMTP id x55BJT2s005442;
 Wed, 5 Jun 2019 12:19:29 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: "James (Qian) Wang" <james.qian.wang@arm.com>
Subject: [PATCH] arm/komeda: Convert dp_wait_cond() to return an error code.
Date: Wed,  5 Jun 2019 12:19:29 +0100
Message-Id: <20190605111929.18478-1-Liviu.Dudau@arm.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Mali DP developers <malidp@foss.arm.com>,
 DRI devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHBfd2FpdF9jb25kKCkgY3VycmVudGx5IHJldHVybnMgdGhlIG51bWJlciBvZiByZXRyaWVzIGxl
ZnQgb3ZlciB3aGljaAppcyBoYXJkbHkgYW4gdXNlZnVsIGluZm9ybWF0aW9uLiBDb252ZXJ0IHRv
IHJldHVybmluZyAtRVRJTUVET1VUIHdoZW4KdGhlIHdhaXQgdGltZXMgb3V0LCBvciAwICh6ZXJv
KSB3aGVuIGNvbmRpdGlvbiBpcyBtZXQgYmVmb3JlIGRlYWRsaW5lLgoKQWxzbyBjb252ZXJ0IHRo
ZSB1c2VycyBvZiB0aGUgZnVuY3Rpb24gdG8gcmV0dXJuIHRoZSBlcnJvciB2YWx1ZS4KClNpZ25l
ZC1vZmYtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF91dGlscy5oIHwgNSArKy0tLQogZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Rldi5jICAgfCA0ICsrLS0K
IDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF91dGlscy5o
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3V0aWxzLmgKaW5k
ZXggOGNmZDkxMTk2ZTE1Li4zYmMzODNkNWJmNzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF91dGlscy5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF91dGlscy5oCkBAIC04LDYgKzgsNyBAQAogI2Rl
ZmluZSBfTUFMSURQX1VUSUxTXwogCiAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KKyNpbmNsdWRl
IDxsaW51eC9lcnJuby5oPgogCiAjZGVmaW5lIGhhc19iaXQobnIsIG1hc2spCShCSVQobnIpICYg
KG1hc2spKQogI2RlZmluZSBoYXNfYml0cyhiaXRzLCBtYXNrKQkoKChiaXRzKSAmIChtYXNrKSkg
PT0gKGJpdHMpKQpAQCAtMjAsMTEgKzIxLDkgQEAKIAlpbnQgbnVtX3RyaWVzID0gX190cmllczsJ
CQlcCiAJd2hpbGUgKCFfX2NvbmQgJiYgKG51bV90cmllcyA+IDApKSB7CQlcCiAJCXVzbGVlcF9y
YW5nZShfX21pbl9yYW5nZSwgX19tYXhfcmFuZ2UpOwlcCi0JCWlmIChfX2NvbmQpCQkJCVwKLQkJ
CWJyZWFrOwkJCQlcCiAJCW51bV90cmllcy0tOwkJCQlcCiAJfQkJCQkJCVwKLQludW1fdHJpZXM7
CQkJCQlcCisJKF9fY29uZCkgPyAwIDogLUVUSU1FRE9VVDsJCQlcCiB9KQogCiAvKiB0aGUgcmVz
dHJpY3Rpb24gb2YgcmFuZ2UgaXMgW3N0YXJ0LCBlbmRdICovCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfZGV2LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfZGV2LmMKaW5kZXggMWM5MTRmOGNhMDE2Li42
OGYyN2M1Y2ZmY2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEvZDcxL2Q3MV9kZXYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2Q3MS9kNzFfZGV2LmMKQEAgLTI4MCw3ICsyODAsNyBAQCBzdGF0aWMgaW50IGQ3MV9jaGFuZ2Vf
b3Btb2RlKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2LCBpbnQgbmV3X21vZGUpCiAJcmV0ID0gZHBf
d2FpdF9jb25kKCgobWFsaWRwX3JlYWQzMihkNzEtPmdjdV9hZGRyLCBCTEtfQ09OVFJPTCkgJiAw
eDcpID09IG9wbW9kZSksCiAJCQkgICAxMDAsIDEwMDAsIDEwMDAwKTsKIAotCXJldHVybiByZXQg
PiAwID8gMCA6IC1FVElNRURPVVQ7CisJcmV0dXJuIHJldDsKIH0KIAogc3RhdGljIHZvaWQgZDcx
X2ZsdXNoKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2LApAQCAtMzA0LDcgKzMwNCw3IEBAIHN0YXRp
YyBpbnQgZDcxX3Jlc2V0KHN0cnVjdCBkNzFfZGV2ICpkNzEpCiAJcmV0ID0gZHBfd2FpdF9jb25k
KCEobWFsaWRwX3JlYWQzMihnY3UsIEJMS19DT05UUk9MKSAmIEdDVV9DT05UUk9MX1NSU1QpLAog
CQkJICAgMTAwLCAxMDAwLCAxMDAwMCk7CiAKLQlyZXR1cm4gcmV0ID4gMCA/IDAgOiAtRVRJTUVE
T1VUOworCXJldHVybiByZXQ7CiB9CiAKIHZvaWQgZDcxX3JlYWRfYmxvY2tfaGVhZGVyKHUzMiBf
X2lvbWVtICpyZWcsIHN0cnVjdCBibG9ja19oZWFkZXIgKmJsaykKLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
