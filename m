Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C9296CBB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 01:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25D86E8B9;
	Tue, 20 Aug 2019 23:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3226E8B4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 23:06:43 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id l21so162509pgm.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 16:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IHOpC8CLMCy6vYTMkD3TApEoOIR8Z3RyhkmjOSjWV48=;
 b=MoJXg9Xk/VmslZ5nrEn6iPmAjEXlBSutxpN9CdphlU0NvtHH7F4SAsnr2qJKwMYXSF
 7cmiN9ycP+cYLX0dX/xlDP7pDj/2s7cMIl1BCP1f2rpZc04e/v++9omRAErLD1b6cHqY
 5uXnkN/mZFO/2i6VkkBc9+vd8llKgrZaDjA+wqGj0ZCKRjJlKmgJX/cL1McahDEGCcUy
 J20az9zPHT4jslI1nbNlvfFXY7f7G8L3U2myRdk3cTv6POsupY6ZjAzrAGyz5zC2vunD
 i9urLdrd0JlKeiYzMNFdKhTwXe9hLssil/M/XV0DMJpnLS/PKs1AFZ6hp3xnLqQqgs7f
 FwHg==
X-Gm-Message-State: APjAAAVfnL1cwYOO+4r/dea8igS+PuTlM14a63ctUCZezRHi4TqiPtVv
 M/q1vunppSNYQt/mS1dbRDEfAw==
X-Google-Smtp-Source: APXvYqwFyS1sAlRP8XG80pzzyhQTF9viVgJhczs8w38ldtloeV/kE7MMCAlmSY0+sBENvGQCc7gM0A==
X-Received: by 2002:a17:90a:ae15:: with SMTP id
 t21mr2369044pjq.50.1566342402912; 
 Tue, 20 Aug 2019 16:06:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 q4sm27564747pff.183.2019.08.20.16.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 16:06:42 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 09/25] drm: kirin: Move request irq handle in ade hw ctx
 alloc
Date: Tue, 20 Aug 2019 23:06:10 +0000
Message-Id: <20190820230626.23253-10-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820230626.23253-1-john.stultz@linaro.org>
References: <20190820230626.23253-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IHOpC8CLMCy6vYTMkD3TApEoOIR8Z3RyhkmjOSjWV48=;
 b=Lf3X1kiV6Q+88ALsWCTXpUPKE3BXimIMLls1hjiLvA+69eGl5zRh7EytASAO1J72oH
 Opd16Ho9fTavo08W9QtWEH0ivz4UelAAjsLR1AWdxgi0arlaoSOnE216Hm2g67F/0+N3
 umGrniElDd5TBOo82p/a1vzDMo4xb9eY15B94Esn6GLXZwTNlwBCnU0+m0W0DMzkcs1N
 h+W16udncU+Jx955N0uLwOwNJ83OLYC/1ssJL4qLKuJI+2WrclJIlr9qiLA+QvwK8Hbk
 gRrePxJrP6z6mHRedFi5bhbzujcM+2b7X8j8q0VzcJBskcODPiwvx06rQ6n/IOJoR5tw
 Bcig==
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKQXMgcGFydCBvZiByZWZh
Y3RvcmluZyB0aGUga2lyaW4gZHJpdmVyIHRvIGJldHRlciBzdXBwb3J0CmRpZmZlcmVudCBoYXJk
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggbW9kaWZpZXMgdGhlCmluaXRpYWxpemF0aW9uIHJv
dXRpbmVzIHNvIHRoZSBkZXZtX3JlcXVlc3RfaXJxKCkgZnVuY3Rpb24KaXMgY2FsbGVkIGFzIHBh
cnQgb2YgdGhlIGFsbG9jYXRpb24gZnVuY3Rpb24uCgpUaGlzIHdpbGwgYmUgbmVlZGVkIGluIHRo
ZSBmdXR1cmUgd2hlbiB3ZSB3aWxsIGhhdmUgZGlmZmVyZW50CmFsbG9jYXRpb24gZnVuY3Rpb25z
IHRvIGFsbG9jYXRlIGhhcmR3YXJlIHNwZWNpZmljIGh3X2N0eApzdHJ1Y3R1cmVzLCB3aGljaCB3
aWxsIHNldHVwIHRoZSB2YmxhbmsgaXJxIGRpZmZlcmVudGx5LgoKQ2M6IFJvbmdyb25nIFpvdSA8
em91cm9uZ3JvbmdAZ21haWwuY29tPgpDYzogWGlubGlhbmcgTGl1IDx6LmxpdXhpbmxpYW5nQGhp
c2lsaWNvbi5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkFj
a2VkLWJ5OiBYaW5saWFuZyBMaXUgPHoubGl1eGlubGlhbmdAaGlzaWxpY29uLmNvbT4KUmV2aWV3
ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogWHUg
WWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgpbanN0dWx0ejogcmV3b3JkZWQgY29tbWl0
IG1lc3NhZ2VdClNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8u
b3JnPgotLS0KdjU6IGNoZWNrcGF0Y2ggLS1zdHJpY3Qgd2hpdGVzcGFjZSBmaXh1cHMgbm90aWNl
ZCBieSBTYW0KLS0tCiAuLi4vZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5j
ICAgfCAyOSArKysrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9u
cygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2hpc2ls
aWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tp
cmluL2tpcmluX2RybV9hZGUuYwppbmRleCBlY2I1MDc5ODVmZWEuLmQwYTdjMWQwYWRiZSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMKQEAg
LTU0LDYgKzU0LDggQEAgc3RydWN0IGFkZV9od19jdHggewogCXN0cnVjdCByZXNldF9jb250cm9s
ICpyZXNldDsKIAlib29sIHBvd2VyX29uOwogCWludCBpcnE7CisKKwlzdHJ1Y3QgZHJtX2NydGMg
KmNydGM7CiB9OwogCiBzdHJ1Y3Qga2lyaW5fY3J0YyB7CkBAIC0zNTgsOSArMzYwLDkgQEAgc3Rh
dGljIHZvaWQgZHJtX3VuZGVyZmxvd193cShzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiAKIHN0
YXRpYyBpcnFyZXR1cm5fdCBhZGVfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGF0YSkKIHsK
LQlzdHJ1Y3Qga2lyaW5fY3J0YyAqa2NydGMgPSBkYXRhOwotCXN0cnVjdCBhZGVfaHdfY3R4ICpj
dHggPSBrY3J0Yy0+aHdfY3R4OwotCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9ICZrY3J0Yy0+YmFz
ZTsKKwlzdHJ1Y3QgYWRlX2h3X2N0eCAqY3R4ID0gZGF0YTsKKwlzdHJ1Y3QgZHJtX2NydGMgKmNy
dGMgPSBjdHgtPmNydGM7CisJc3RydWN0IGtpcmluX2NydGMgKmtjcnRjID0gdG9fa2lyaW5fY3J0
YyhjcnRjKTsKIAl2b2lkIF9faW9tZW0gKmJhc2UgPSBjdHgtPmJhc2U7CiAJdTMyIHN0YXR1czsK
IApAQCAtOTUxLDEyICs5NTMsMTQgQEAgc3RhdGljIGludCBhZGVfcGxhbmVfaW5pdChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3Qga2lyaW5fcGxhbmUgKmtwbGFuZSwKIAlyZXR1cm4gMDsK
IH0KIAotc3RhdGljIHZvaWQgKmFkZV9od19jdHhfYWxsb2Moc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKK3N0YXRpYyB2b2lkICphZGVfaHdfY3R4X2FsbG9jKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYsCisJCQkgICAgICBzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiB7CiAJc3RydWN0
IHJlc291cmNlICpyZXM7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKIAlzdHJ1
Y3QgZGV2aWNlX25vZGUgKm5wID0gcGRldi0+ZGV2Lm9mX25vZGU7CiAJc3RydWN0IGFkZV9od19j
dHggKmN0eCA9IE5VTEw7CisJaW50IHJldDsKIAogCWN0eCA9IGRldm1fa3phbGxvYyhkZXYsIHNp
emVvZigqY3R4KSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFjdHgpIHsKQEAgLTEwMDYsNiArMTAxMCwx
NCBAQCBzdGF0aWMgdm9pZCAqYWRlX2h3X2N0eF9hbGxvYyhzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogCQlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKIAl9CiAKKwkvKiB2YmxhbmsgaXJx
IGluaXQgKi8KKwlyZXQgPSBkZXZtX3JlcXVlc3RfaXJxKGRldiwgY3R4LT5pcnEsIGFkZV9pcnFf
aGFuZGxlciwKKwkJCSAgICAgICBJUlFGX1NIQVJFRCwgZGV2LT5kcml2ZXItPm5hbWUsIGN0eCk7
CisJaWYgKHJldCkKKwkJcmV0dXJuIEVSUl9QVFIoLUVJTyk7CisKKwljdHgtPmNydGMgPSBjcnRj
OworCiAJcmV0dXJuIGN0eDsKIH0KIApAQCAtMTAyNyw3ICsxMDM5LDcgQEAgc3RhdGljIGludCBh
ZGVfZHJtX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAl9CiAJcGxhdGZvcm1f
c2V0X2RydmRhdGEocGRldiwgYWRlKTsKIAotCWN0eCA9IGFkZV9od19jdHhfYWxsb2MocGRldik7
CisJY3R4ID0gYWRlX2h3X2N0eF9hbGxvYyhwZGV2LCAmYWRlLT5jcnRjLmJhc2UpOwogCWlmIChJ
U19FUlIoY3R4KSkgewogCQlEUk1fRVJST1IoImZhaWxlZCB0byBpbml0aWFsaXplIGtpcmluX3By
aXYgaHcgY3R4XG4iKTsKIAkJcmV0dXJuIC1FSU5WQUw7CkBAIC0xMDU5LDE1ICsxMDcxLDggQEAg
c3RhdGljIGludCBhZGVfZHJtX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlp
ZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JLyogdmJsYW5rIGlycSBpbml0ICovCi0JcmV0ID0g
ZGV2bV9yZXF1ZXN0X2lycShkZXYtPmRldiwgY3R4LT5pcnEsIGFkZV9pcnFfaGFuZGxlciwKLQkJ
CSAgICAgICBJUlFGX1NIQVJFRCwgZGV2LT5kcml2ZXItPm5hbWUsIGtjcnRjKTsKLQogCUlOSVRf
V09SSygma2NydGMtPmRpc3BsYXlfcmVzZXRfd3EsIGRybV91bmRlcmZsb3dfd3EpOwogCi0JaWYg
KHJldCkKLQkJcmV0dXJuIHJldDsKLQogCXJldHVybiAwOwogfQogCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
