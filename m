Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94275109773
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 02:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FAF6E1CD;
	Tue, 26 Nov 2019 01:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18BC6E1CD
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 01:11:32 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id o8so2981316pls.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 17:11:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kaPPIWsEF4upG4l+JTslBmj5SeIlIs0u8TXiyS8y8YE=;
 b=P5a+91HNhaw4l9nrvZVVTfmXFKuh7Ua+fq5corOakgCDJ7N5ixrVwTFmym9Ea8rieQ
 cBZSv/q9yT1WcLb3hO8rhfF+iPdfZU6+a+6nZmAvjRj2qc4P+yjJAhiutZP0zBnWwuqn
 +QnGrfB8ujr3odJ/pjVe2I2ljGlYCk3OGlTm1Z9lL4qiJQOpKG5Fep994xl4qcs76zWc
 reR51fxTV4HjDFg7R8VJPlaFOgBabg+zygc7GmtY8YnZwUJDKJcKjZuFA6SWfeiarBf5
 TXZG5lQfatNi+bQp/lZJhWECs3UHTpHyrvDkVlJh7I60jmamwxmPkka2dsbr6UdBOJvH
 4W7g==
X-Gm-Message-State: APjAAAXZstBv6jbLZBvODI46XmltNpoe9uP4avdkVReYBc6Ki1pfnNyn
 Gk48h2fhOFz/eCoQ4SkcyERiZAOcn7c=
X-Google-Smtp-Source: APXvYqy13Jc8EN+9gue54QDH3UcS2g6yMy02t4IHt328z0ehWIeXCTIH+h+pgNzM/I4cFrODmPsMUg==
X-Received: by 2002:a17:902:b68c:: with SMTP id
 c12mr2947446pls.126.1574730692309; 
 Mon, 25 Nov 2019 17:11:32 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id z10sm9672903pgg.39.2019.11.25.17.11.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Nov 2019 17:11:31 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] udmabuf: implement begin_cpu_access/end_cpu_access hooks
Date: Mon, 25 Nov 2019 17:10:56 -0800
Message-Id: <20191126011056.67928-5-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191126011056.67928-1-gurchetansingh@chromium.org>
References: <20191126011056.67928-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kaPPIWsEF4upG4l+JTslBmj5SeIlIs0u8TXiyS8y8YE=;
 b=U0wBRPFw2/H930x4iZW30rQMMo2mQvK/5uDl+S7FrtZTV4XBj0O3kl2Jp8ytlFe9gG
 KE6X0YiGz/ZmRV7iXG30Zm2QRjJFWk+zpcFeaNL01XYzAinQ8vJZzag0NeAmp27QJfup
 xIvFwS09lrxp9yvGsIdATTyI4SENgMLvlE6ow=
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com,
 hch@lst.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGUgbWlzYyBkZXZpY2UsIHdlIHNob3VsZCBlbmQgdXAgdXNpbmcgdGhlIHJlc3VsdCBv
ZgpnZXRfYXJjaF9kbWFfb3BzKC4uKSBvciBkbWEtZGlyZWN0IG9wcy4KClRoaXMgY2FuIGFsbG93
IHVzIHRvIGhhdmUgV0MgbWFwcGluZ3MgaW4gdGhlIGd1ZXN0IGFmdGVyCnN5bmNocm9uaXphdGlv
bi4KClNpZ25lZC1vZmYtYnk6IEd1cmNoZXRhbiBTaW5naCA8Z3VyY2hldGFuc2luZ2hAY2hyb21p
dW0ub3JnPgotLS0KIGRyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMgfCA0MCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0MCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYyBiL2RyaXZlcnMvZG1h
LWJ1Zi91ZG1hYnVmLmMKaW5kZXggNjdlODliYjAzNGM1Li4xNDI0NDQ5MjJhY2QgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL3VkbWFi
dWYuYwpAQCAtMTksNiArMTksNyBAQCBzdHJ1Y3QgdWRtYWJ1ZiB7CiAJdTMyIGZsYWdzOwogCXBn
b2ZmX3QgcGFnZWNvdW50OwogCXN0cnVjdCBwYWdlICoqcGFnZXM7CisJc3RydWN0IHNnX3RhYmxl
ICpzZzsKIAlzdHJ1Y3QgbWlzY2RldmljZSAqZGV2aWNlOwogfTsKIApAQCAtMTA1LDggKzEwNiwx
MiBAQCBzdGF0aWMgdm9pZCB1bm1hcF91ZG1hYnVmKHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQg
KmF0LAogc3RhdGljIHZvaWQgcmVsZWFzZV91ZG1hYnVmKHN0cnVjdCBkbWFfYnVmICpidWYpCiB7
CiAJc3RydWN0IHVkbWFidWYgKnVidWYgPSBidWYtPnByaXY7CisJc3RydWN0IGRldmljZSAqZGV2
ID0gdWJ1Zi0+ZGV2aWNlLT50aGlzX2RldmljZTsKIAlwZ29mZl90IHBnOwogCisJaWYgKHVidWYt
PnNnKQorCQlwdXRfc2dfdGFibGUoZGV2LCB1YnVmLT5zZywgRE1BX0JJRElSRUNUSU9OQUwpOwor
CiAJZm9yIChwZyA9IDA7IHBnIDwgdWJ1Zi0+cGFnZWNvdW50OyBwZysrKQogCQlwdXRfcGFnZSh1
YnVmLT5wYWdlc1twZ10pOwogCWtmcmVlKHVidWYtPnBhZ2VzKTsKQEAgLTEyNyw2ICsxMzIsMzkg
QEAgc3RhdGljIHZvaWQga3VubWFwX3VkbWFidWYoc3RydWN0IGRtYV9idWYgKmJ1ZiwgdW5zaWdu
ZWQgbG9uZyBwYWdlX251bSwKIAlrdW5tYXAodmFkZHIpOwogfQogCitzdGF0aWMgaW50IGJlZ2lu
X2NwdV91ZG1hYnVmKHN0cnVjdCBkbWFfYnVmICpidWYsCisJCQkgICAgIGVudW0gZG1hX2RhdGFf
ZGlyZWN0aW9uIGRpcmVjdGlvbikKK3sKKwlzdHJ1Y3QgdWRtYWJ1ZiAqdWJ1ZiA9IGJ1Zi0+cHJp
djsKKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSB1YnVmLT5kZXZpY2UtPnRoaXNfZGV2aWNlOworCisJ
aWYgKCF1YnVmLT5zZykgeworCQl1YnVmLT5zZyA9IGdldF9zZ190YWJsZShkZXYsIGJ1ZiwgZGly
ZWN0aW9uKTsKKwkJaWYgKElTX0VSUih1YnVmLT5zZykpCisJCQlyZXR1cm4gUFRSX0VSUih1YnVm
LT5zZyk7CisJfSBlbHNlIHsKKwkJZG1hX3N5bmNfc2dfZm9yX2RldmljZShkZXYsIHVidWYtPnNn
LT5zZ2wsCisJCQkJICAgICAgIHVidWYtPnNnLT5uZW50cywKKwkJCQkgICAgICAgZGlyZWN0aW9u
KTsKKwl9CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIGludCBlbmRfY3B1X3VkbWFidWYoc3Ry
dWN0IGRtYV9idWYgKmJ1ZiwKKwkJCSAgIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcmVjdGlv
bikKK3sKKwlzdHJ1Y3QgdWRtYWJ1ZiAqdWJ1ZiA9IGJ1Zi0+cHJpdjsKKwlzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSB1YnVmLT5kZXZpY2UtPnRoaXNfZGV2aWNlOworCisJaWYgKCF1YnVmLT5zZykKKwkJ
cmV0dXJuIC1FSU5WQUw7CisKKwlkbWFfc3luY19zZ19mb3JfY3B1KGRldiwgdWJ1Zi0+c2ctPnNn
bCwgdWJ1Zi0+c2ctPm5lbnRzLCBkaXJlY3Rpb24pOworCXJldHVybiAwOworfQorCisKIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZG1hX2J1Zl9vcHMgdWRtYWJ1Zl9vcHMgPSB7CiAJLmNhY2hlX3NndF9t
YXBwaW5nID0gdHJ1ZSwKIAkubWFwX2RtYV9idWYJICAgPSBtYXBfdWRtYWJ1ZiwKQEAgLTEzNSw2
ICsxNzMsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtYV9idWZfb3BzIHVkbWFidWZfb3BzID0g
ewogCS5tYXAJCSAgID0ga21hcF91ZG1hYnVmLAogCS51bm1hcAkJICAgPSBrdW5tYXBfdWRtYWJ1
ZiwKIAkubW1hcAkJICAgPSBtbWFwX3VkbWFidWYsCisJLmJlZ2luX2NwdV9hY2Nlc3MgID0gYmVn
aW5fY3B1X3VkbWFidWYsCisJLmVuZF9jcHVfYWNjZXNzICAgID0gZW5kX2NwdV91ZG1hYnVmLAog
fTsKIAogI2RlZmluZSBTRUFMU19XQU5URUQgKEZfU0VBTF9TSFJJTkspCi0tIAoyLjI0LjAuNDMy
Lmc5ZDNmNWY1YjYzLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
