Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B7F2553E
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 18:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1D08941D;
	Tue, 21 May 2019 16:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BD18941D;
 Tue, 21 May 2019 16:14:50 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id C84F261A72; Tue, 21 May 2019 16:14:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2E48561A5C;
 Tue, 21 May 2019 16:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2E48561A5C
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 10/15] drm/msm: Add a helper function for a per-instance
 address space
Date: Tue, 21 May 2019 10:13:58 -0600
Message-Id: <1558455243-32746-11-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
References: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558455290;
 bh=9aXhSj9Phw8JHRWY+YFRT00OkAJ1xzvQFBspXjSWjck=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FFf3W9q+PijduigovDnLfhX/WdknhM67/QkUEefNq3J+brJklduC9hzP6rMQjLY8M
 KgvOYHHdmGVFOM8QUFKQ7Cr2ibAlfHvaty5Q4+tUndvXVV2aasnKlEkO5CgFTFgQkb
 bK3r9z1L2C5H3BkSx8B8smn6MH8ofE6LfMS222aE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558455265;
 bh=9aXhSj9Phw8JHRWY+YFRT00OkAJ1xzvQFBspXjSWjck=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SVnDGffrzPDaouD/31loIWc92bGnmmbA4g62WezNnVT6esjiwklpM6/VbBxRNAKl6
 tPqzNybOhQem/ehtZUUG2Uv+o8bhn1mV+Jx/rFBeULrOuilrm1a0EwOsC1qYOmdobY
 gws1wRzfdfkVrxlfx3lemXB0NGJ/V/B53TTsen7k=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 hoegsberg@google.com, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgaGVscGVyIGZ1bmN0aW9uIHRvIGNyZWF0ZSBhIEdFTSBhZGRyZXNzIHNwYWNlIGF0dGFj
aGVkIHRvCmFuIGlvbW11IGF1eGlsaWFyeSBkb21haW4gZm9yIGEgcGVyLWluc3RhbmNlIHBhZ2V0
YWJsZS4KClNpZ25lZC1vZmYtYnk6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1cm9yYS5v
cmc+Ci0tLQoKIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5oICAgICB8ICA0ICsrKwogZHJp
dmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3ZtYS5jIHwgNTMgKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDIx
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5o
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmgKaW5kZXggZDlhYTdiYS4uMWQ0YjQ1YSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9tc21fZHJ2LmgKQEAgLTI2Miw2ICsyNjIsMTAgQEAgc3RydWN0IG1zbV9nZW1f
YWRkcmVzc19zcGFjZSAqCiBtc21fZ2VtX2FkZHJlc3Nfc3BhY2VfY3JlYXRlX2EyeHgoc3RydWN0
IGRldmljZSAqZGV2LCBzdHJ1Y3QgbXNtX2dwdSAqZ3B1LAogCQljb25zdCBjaGFyICpuYW1lLCB1
aW50NjRfdCB2YV9zdGFydCwgdWludDY0X3QgdmFfZW5kKTsKIAorc3RydWN0IG1zbV9nZW1fYWRk
cmVzc19zcGFjZSAqCittc21fZ2VtX2FkZHJlc3Nfc3BhY2VfY3JlYXRlX2luc3RhbmNlKHN0cnVj
dCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqbmFtZSwKKwkJdTY0IHZhX3N0YXJ0LCB1NjQgdmFf
ZW5kKTsKKwogaW50IG1zbV9yZWdpc3Rlcl9tbXUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3Ry
dWN0IG1zbV9tbXUgKm1tdSk7CiB2b2lkIG1zbV91bnJlZ2lzdGVyX21tdShzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCBzdHJ1Y3QgbXNtX21tdSAqbW11KTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21zbS9tc21fZ2VtX3ZtYS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3Zt
YS5jCmluZGV4IGZjZjdhODMuLjBlZTExYjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX2dlbV92bWEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fdm1hLmMK
QEAgLTEzNiwxNCArMTM2LDEyIEBAIGludCBtc21fZ2VtX2luaXRfdm1hKHN0cnVjdCBtc21fZ2Vt
X2FkZHJlc3Nfc3BhY2UgKmFzcGFjZSwKIAlyZXR1cm4gMDsKIH0KIAotCi1zdHJ1Y3QgbXNtX2dl
bV9hZGRyZXNzX3NwYWNlICoKLW1zbV9nZW1fYWRkcmVzc19zcGFjZV9jcmVhdGUoc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW4sCi0JCWNvbnN0IGNoYXIgKm5h
bWUpCitzdGF0aWMgc3RydWN0IG1zbV9nZW1fYWRkcmVzc19zcGFjZSAqCittc21fZ2VtX2FkZHJl
c3Nfc3BhY2VfbmV3KHN0cnVjdCBtc21fbW11ICptbXUsIGNvbnN0IGNoYXIgKm5hbWUsCisJCXU2
NCB2YV9zdGFydCwgdTY0IHZhX2VuZCkKIHsKIAlzdHJ1Y3QgbXNtX2dlbV9hZGRyZXNzX3NwYWNl
ICphc3BhY2U7Ci0JdTY0IHNpemUgPSBkb21haW4tPmdlb21ldHJ5LmFwZXJ0dXJlX2VuZCAtCi0J
CWRvbWFpbi0+Z2VvbWV0cnkuYXBlcnR1cmVfc3RhcnQ7CisJdTY0IHNpemUgPSB2YV9lbmQgLSB2
YV9zdGFydDsKIAogCWFzcGFjZSA9IGt6YWxsb2Moc2l6ZW9mKCphc3BhY2UpLCBHRlBfS0VSTkVM
KTsKIAlpZiAoIWFzcGFjZSkKQEAgLTE1MSwxMCArMTQ5LDkgQEAgbXNtX2dlbV9hZGRyZXNzX3Nw
YWNlX2NyZWF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFp
biwKIAogCXNwaW5fbG9ja19pbml0KCZhc3BhY2UtPmxvY2spOwogCWFzcGFjZS0+bmFtZSA9IG5h
bWU7Ci0JYXNwYWNlLT5tbXUgPSBtc21faW9tbXVfbmV3KGRldiwgZG9tYWluKTsKKwlhc3BhY2Ut
Pm1tdSA9IG1tdTsKIAotCWRybV9tbV9pbml0KCZhc3BhY2UtPm1tLCAoZG9tYWluLT5nZW9tZXRy
eS5hcGVydHVyZV9zdGFydCA+PiBQQUdFX1NISUZUKSwKLQkJc2l6ZSA+PiBQQUdFX1NISUZUKTsK
Kwlkcm1fbW1faW5pdCgmYXNwYWNlLT5tbSwgKHZhX3N0YXJ0ID4+IFBBR0VfU0hJRlQpLCBzaXpl
ID4+IFBBR0VfU0hJRlQpOwogCiAJa3JlZl9pbml0KCZhc3BhY2UtPmtyZWYpOwogCkBAIC0xNjIs
MjQgKzE1OSwzOCBAQCBtc21fZ2VtX2FkZHJlc3Nfc3BhY2VfY3JlYXRlKHN0cnVjdCBkZXZpY2Ug
KmRldiwgc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWluLAogfQogCiBzdHJ1Y3QgbXNtX2dlbV9h
ZGRyZXNzX3NwYWNlICoKK21zbV9nZW1fYWRkcmVzc19zcGFjZV9jcmVhdGUoc3RydWN0IGRldmlj
ZSAqZGV2LCBzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW4sCisJCWNvbnN0IGNoYXIgKm5hbWUp
Cit7CisJc3RydWN0IG1zbV9tbXUgKm1tdSA9IG1zbV9pb21tdV9uZXcoZGV2LCBkb21haW4pOwor
CisJaWYgKElTX0VSUihtbXUpKQorCQlyZXR1cm4gRVJSX0NBU1QobW11KTsKKworCXJldHVybiBt
c21fZ2VtX2FkZHJlc3Nfc3BhY2VfbmV3KG1tdSwgbmFtZSwKKwkJZG9tYWluLT5nZW9tZXRyeS5h
cGVydHVyZV9zdGFydCwgZG9tYWluLT5nZW9tZXRyeS5hcGVydHVyZV9lbmQpOworfQorCitzdHJ1
Y3QgbXNtX2dlbV9hZGRyZXNzX3NwYWNlICoKIG1zbV9nZW1fYWRkcmVzc19zcGFjZV9jcmVhdGVf
YTJ4eChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBtc21fZ3B1ICpncHUsCiAJCWNvbnN0IGNo
YXIgKm5hbWUsIHVpbnQ2NF90IHZhX3N0YXJ0LCB1aW50NjRfdCB2YV9lbmQpCiB7Ci0Jc3RydWN0
IG1zbV9nZW1fYWRkcmVzc19zcGFjZSAqYXNwYWNlOwotCXU2NCBzaXplID0gdmFfZW5kIC0gdmFf
c3RhcnQ7CisJc3RydWN0IG1zbV9tbXUgKm1tdSA9IG1zbV9ncHVtbXVfbmV3KGRldiwgZ3B1KTsK
IAotCWFzcGFjZSA9IGt6YWxsb2Moc2l6ZW9mKCphc3BhY2UpLCBHRlBfS0VSTkVMKTsKLQlpZiAo
IWFzcGFjZSkKLQkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7CisJaWYgKElTX0VSUihtbXUpKQor
CQlyZXR1cm4gRVJSX0NBU1QobW11KTsKIAotCXNwaW5fbG9ja19pbml0KCZhc3BhY2UtPmxvY2sp
OwotCWFzcGFjZS0+bmFtZSA9IG5hbWU7Ci0JYXNwYWNlLT5tbXUgPSBtc21fZ3B1bW11X25ldyhk
ZXYsIGdwdSk7CisJcmV0dXJuIG1zbV9nZW1fYWRkcmVzc19zcGFjZV9uZXcobW11LCBuYW1lLCB2
YV9zdGFydCwgdmFfZW5kKTsKK30KIAotCWRybV9tbV9pbml0KCZhc3BhY2UtPm1tLCAodmFfc3Rh
cnQgPj4gUEFHRV9TSElGVCksCi0JCXNpemUgPj4gUEFHRV9TSElGVCk7CitzdHJ1Y3QgbXNtX2dl
bV9hZGRyZXNzX3NwYWNlICoKK21zbV9nZW1fYWRkcmVzc19zcGFjZV9jcmVhdGVfaW5zdGFuY2Uo
c3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFyICpuYW1lLAorCQl1NjQgdmFfc3RhcnQsIHU2
NCB2YV9lbmQpCit7CisJc3RydWN0IG1zbV9tbXUgKm1tdSA9IG1zbV9pb21tdV9uZXdfaW5zdGFu
Y2UoZGV2KTsKIAotCWtyZWZfaW5pdCgmYXNwYWNlLT5rcmVmKTsKKwlpZiAoSVNfRVJSKG1tdSkp
CisJCXJldHVybiBFUlJfQ0FTVChtbXUpOwogCi0JcmV0dXJuIGFzcGFjZTsKKwlyZXR1cm4gbXNt
X2dlbV9hZGRyZXNzX3NwYWNlX25ldyhtbXUsIG5hbWUsIHZhX3N0YXJ0LCB2YV9lbmQpOwogfQot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
