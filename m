Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA00F96090
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 15:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC1F6E7D7;
	Tue, 20 Aug 2019 13:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2032D6E7D7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 13:42:05 +0000 (UTC)
Received: from sasha-vm.mshome.net (unknown [12.236.144.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9840922DD6;
 Tue, 20 Aug 2019 13:42:04 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 41/44] drm/ast: Fixed reboot test may cause system
 hanged
Date: Tue, 20 Aug 2019 09:40:25 -0400
Message-Id: <20190820134028.10829-41-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190820134028.10829-1-sashal@kernel.org>
References: <20190820134028.10829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566308525;
 bh=XFlRnSuBi0sK6RamGh07WiJv/X0GSLiXcqA+17EEsxE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qP3YoUsfVoCGOsgcxSXZihaVvsJz5N3iVi7YgqBvV296WW9jHNqyzuLAu+jXoIwRG
 JsDkk0oI3+COxz3ouNb79buf/7jY6FopM2iHzFLR0pGMXfJho04eJdMP+DG8eSnaAM
 U98LhlcCzCxxRkKU+MwtSLqbYFpd6qvawU2b04Rs=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIlkuQy4gQ2hlbiIgPHljX2NoZW5AYXNwZWVkdGVjaC5jb20+CgpbIFVwc3RyZWFtIGNv
bW1pdCAwNWI0Mzk3MTFmNmZmODcwMGU4NjYwZjk3YTExNzk2NTA3NzhiOWNiIF0KClRoZXJlIGlz
IGFub3RoZXIgdGhyZWFkIHN0aWxsIGFjY2VzcyBzdGFuZGFyZCBWR0EgSS9PIHdoaWxlIGxvYWRp
bmcgZHJtIGRyaXZlci4KRGlzYWJsZSBzdGFuZGFyZCBWR0EgSS9PIGRlY29kZSB0byBhdm9pZCB0
aGlzIGlzc3VlLgoKU2lnbmVkLW9mZi1ieTogWS5DLiBDaGVuIDx5Y19jaGVuQGFzcGVlZHRlY2gu
Y29tPgpSZXZpZXdlZC1ieTogQmVuamFtaW4gSGVycmVuc2NobWlkdCA8YmVuaEBrZXJuZWwuY3Jh
c2hpbmcub3JnPgpTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29t
PgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMTUy
MzQxMDA1OS0xODQxNS0xLWdpdC1zZW5kLWVtYWlsLXljX2NoZW5AYXNwZWVkdGVjaC5jb20KU2ln
bmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hc3QvYXN0X21haW4uYyB8IDUgKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X21vZGUuYyB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X3Bvc3QuYyB8IDIgKy0KIDMg
ZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3Qv
YXN0X21haW4uYwppbmRleCAyODU0Mzk5ODU2YmEwLi40YWViZTIxZTZhZDlmIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fz
dC9hc3RfbWFpbi5jCkBAIC0xMzEsOCArMTMxLDggQEAgc3RhdGljIGludCBhc3RfZGV0ZWN0X2No
aXAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgYm9vbCAqbmVlZF9wb3N0KQogCiAKIAkvKiBFbmFi
bGUgZXh0ZW5kZWQgcmVnaXN0ZXIgYWNjZXNzICovCi0JYXN0X2VuYWJsZV9tbWlvKGRldik7CiAJ
YXN0X29wZW5fa2V5KGFzdCk7CisJYXN0X2VuYWJsZV9tbWlvKGRldik7CiAKIAkvKiBGaW5kIG91
dCB3aGV0aGVyIFAyQSB3b3JrcyBvciB3aGV0aGVyIHRvIHVzZSBkZXZpY2UtdHJlZSAqLwogCWFz
dF9kZXRlY3RfY29uZmlnX21vZGUoZGV2LCAmc2N1X3Jldik7CkBAIC01NzYsNiArNTc2LDkgQEAg
dm9pZCBhc3RfZHJpdmVyX3VubG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogewogCXN0cnVj
dCBhc3RfcHJpdmF0ZSAqYXN0ID0gZGV2LT5kZXZfcHJpdmF0ZTsKIAorCS8qIGVuYWJsZSBzdGFu
ZGFyZCBWR0EgZGVjb2RlICovCisJYXN0X3NldF9pbmRleF9yZWcoYXN0LCBBU1RfSU9fQ1JUQ19Q
T1JULCAweGExLCAweDA0KTsKKwogCWFzdF9yZWxlYXNlX2Zpcm13YXJlKGRldik7CiAJa2ZyZWUo
YXN0LT5kcDUwMV9md19hZGRyKTsKIAlhc3RfbW9kZV9maW5pKGRldik7CmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9t
b2RlLmMKaW5kZXggOTdmZWQwNjI3ZDFjOC4uNzRkYTE1YTMzNDFhOCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X21vZGUuYwpAQCAtNjAxLDcgKzYwMSw3IEBAIHN0YXRpYyBpbnQgYXN0X2NydGNfbW9kZV9zZXQo
c3RydWN0IGRybV9jcnRjICpjcnRjLAogCQlyZXR1cm4gLUVJTlZBTDsKIAlhc3Rfb3Blbl9rZXko
YXN0KTsKIAotCWFzdF9zZXRfaW5kZXhfcmVnX21hc2soYXN0LCBBU1RfSU9fQ1JUQ19QT1JULCAw
eGExLCAweGZmLCAweDA0KTsKKwlhc3Rfc2V0X2luZGV4X3JlZyhhc3QsIEFTVF9JT19DUlRDX1BP
UlQsIDB4YTEsIDB4MDYpOwogCiAJYXN0X3NldF9zdGRfcmVnKGNydGMsIGFkanVzdGVkX21vZGUs
ICZ2Ymlvc19tb2RlKTsKIAlhc3Rfc2V0X2NydGNfcmVnKGNydGMsIGFkanVzdGVkX21vZGUsICZ2
Ymlvc19tb2RlKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X3Bvc3QuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X3Bvc3QuYwppbmRleCBmN2Q0MjEzNTlkNTY0Li5jMWQx
YWM1MWQxYzIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9wb3N0LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfcG9zdC5jCkBAIC00Niw3ICs0Niw3IEBAIHZvaWQg
YXN0X2VuYWJsZV9tbWlvKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IGFzdF9w
cml2YXRlICphc3QgPSBkZXYtPmRldl9wcml2YXRlOwogCi0JYXN0X3NldF9pbmRleF9yZWdfbWFz
ayhhc3QsIEFTVF9JT19DUlRDX1BPUlQsIDB4YTEsIDB4ZmYsIDB4MDQpOworCWFzdF9zZXRfaW5k
ZXhfcmVnKGFzdCwgQVNUX0lPX0NSVENfUE9SVCwgMHhhMSwgMHgwNik7CiB9CiAKIAotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
