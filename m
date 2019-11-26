Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B94109774
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 02:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D900F6E1E5;
	Tue, 26 Nov 2019 01:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3D36E1E0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 01:11:30 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id bb19so3901666pjb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 17:11:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ghrwFxO818UoK8VetowCRFQffMjIOkvAfQ3v9xbttnw=;
 b=HsNSB6ZS9qfX4ouncHRMbiu9a6xwJv6WM6sRJIXGrVMe8cc4CX+OxiQ2KoQ+BTJ34m
 tgkUeYIOP0Kuuqud+SDM7lWh1CDZmUbrYQDps5vr/4j8u8i5zyLwYT86aExQQGa9xyPx
 ytoFtSFdR49cfdhTjy61ORw0usW/LOWEsmAtRSjwhCYBOHk7vzngIwQB0R+aiK6wXedI
 uYPJ+iYMMiukphdzYn923NMsL13wTNopGTWz7BidZNlsYyU8y6LkOMFQ+F/N7zwaHSc6
 vyMWrN3bTvtpfPXrNAsdQA6D7lUopjGtEF7FA4MxIa+KRDaMqbS2S/cDe9oq7o5sMkYg
 jT+g==
X-Gm-Message-State: APjAAAXghPgYvp4KJjn4u9au3sSo3QMcaBOxZSojemY86y6XKbt9wxHA
 YhZowp7aPsoJzh/ykaBLQ80g3XUzdRE=
X-Google-Smtp-Source: APXvYqzVL3/E4ZIaU+Kwqbhjk9+5S/H6jnox5RjWJwEk18dpafx3G092uB/gv0Th9142Qsj0mldwwQ==
X-Received: by 2002:a17:902:9a8e:: with SMTP id
 w14mr32578884plp.215.1574730689905; 
 Mon, 25 Nov 2019 17:11:29 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id z10sm9672903pgg.39.2019.11.25.17.11.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Nov 2019 17:11:29 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] udmabuf: separate out creating/destroying scatter-table
Date: Mon, 25 Nov 2019 17:10:55 -0800
Message-Id: <20191126011056.67928-4-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191126011056.67928-1-gurchetansingh@chromium.org>
References: <20191126011056.67928-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ghrwFxO818UoK8VetowCRFQffMjIOkvAfQ3v9xbttnw=;
 b=bjQiRQnkTIJk7xaJAmU3rUsZEwFA9izbk1Nt1r7qkmcdtPgkSmoq+yv51kKezAaR76
 Znba5vsISPOkd4WV6umB/7G0uVLSLpFdJMYAsIynemULdwMz3729ksy3mTO+36xPitQ1
 UmlB0RqK4wVRfIt92L0ppbMOuPKXSHPQzh4A0=
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

VGhlc2UgYXJlIG5pY2UgZnVuY3Rpb25zIGFuZCBjYW4gYmUgcmUtdXNlZC4KClNpZ25lZC1vZmYt
Ynk6IEd1cmNoZXRhbiBTaW5naCA8Z3VyY2hldGFuc2luZ2hAY2hyb21pdW0ub3JnPgotLS0KIGRy
aXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMgfCAyNiArKysrKysrKysrKysrKysrKysrLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYyBiL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVm
LmMKaW5kZXggOWU2ZmRkMmJjOTc5Li42N2U4OWJiMDM0YzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
ZG1hLWJ1Zi91ZG1hYnVmLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYwpAQCAtNTQs
MTAgKzU0LDEwIEBAIHN0YXRpYyBpbnQgbW1hcF91ZG1hYnVmKHN0cnVjdCBkbWFfYnVmICpidWYs
IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgc3Ry
dWN0IHNnX3RhYmxlICptYXBfdWRtYWJ1ZihzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdCwK
LQkJCQkgICAgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyZWN0aW9uKQorc3RhdGljIHN0cnVj
dCBzZ190YWJsZSAqZ2V0X3NnX3RhYmxlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRtYV9i
dWYgKmJ1ZiwKKwkJCQkgICAgIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcmVjdGlvbikKIHsK
LQlzdHJ1Y3QgdWRtYWJ1ZiAqdWJ1ZiA9IGF0LT5kbWFidWYtPnByaXY7CisJc3RydWN0IHVkbWFi
dWYgKnVidWYgPSBidWYtPnByaXY7CiAJc3RydWN0IHNnX3RhYmxlICpzZzsKIAlpbnQgcmV0Owog
CkBAIC02OSw3ICs2OSw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2dfdGFibGUgKm1hcF91ZG1hYnVmKHN0
cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0LAogCQkJCQlHRlBfS0VSTkVMKTsKIAlpZiAocmV0
IDwgMCkKIAkJZ290byBlcnI7Ci0JaWYgKCFkbWFfbWFwX3NnKGF0LT5kZXYsIHNnLT5zZ2wsIHNn
LT5uZW50cywgZGlyZWN0aW9uKSkgeworCWlmICghZG1hX21hcF9zZyhkZXYsIHNnLT5zZ2wsIHNn
LT5uZW50cywgZGlyZWN0aW9uKSkgewogCQlyZXQgPSAtRUlOVkFMOwogCQlnb3RvIGVycjsKIAl9
CkBAIC04MSwxMyArODEsMjUgQEAgc3RhdGljIHN0cnVjdCBzZ190YWJsZSAqbWFwX3VkbWFidWYo
c3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXQsCiAJcmV0dXJuIEVSUl9QVFIocmV0KTsKIH0K
IAorc3RhdGljIHZvaWQgcHV0X3NnX3RhYmxlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHNn
X3RhYmxlICpzZywKKwkJCSBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXJlY3Rpb24pCit7CisJ
ZG1hX3VubWFwX3NnKGRldiwgc2ctPnNnbCwgc2ctPm5lbnRzLCBkaXJlY3Rpb24pOworCXNnX2Zy
ZWVfdGFibGUoc2cpOworCWtmcmVlKHNnKTsKK30KKworc3RhdGljIHN0cnVjdCBzZ190YWJsZSAq
bWFwX3VkbWFidWYoc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXQsCisJCQkJICAgIGVudW0g
ZG1hX2RhdGFfZGlyZWN0aW9uIGRpcmVjdGlvbikKK3sKKwlyZXR1cm4gZ2V0X3NnX3RhYmxlKGF0
LT5kZXYsIGF0LT5kbWFidWYsIGRpcmVjdGlvbik7Cit9CisKIHN0YXRpYyB2b2lkIHVubWFwX3Vk
bWFidWYoc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXQsCiAJCQkgIHN0cnVjdCBzZ190YWJs
ZSAqc2csCiAJCQkgIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcmVjdGlvbikKIHsKLQlkbWFf
dW5tYXBfc2coYXQtPmRldiwgc2ctPnNnbCwgc2ctPm5lbnRzLCBkaXJlY3Rpb24pOwotCXNnX2Zy
ZWVfdGFibGUoc2cpOwotCWtmcmVlKHNnKTsKKwlyZXR1cm4gcHV0X3NnX3RhYmxlKGF0LT5kZXYs
IHNnLCBkaXJlY3Rpb24pOwogfQogCiBzdGF0aWMgdm9pZCByZWxlYXNlX3VkbWFidWYoc3RydWN0
IGRtYV9idWYgKmJ1ZikKLS0gCjIuMjQuMC40MzIuZzlkM2Y1ZjViNjMtZ29vZwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
