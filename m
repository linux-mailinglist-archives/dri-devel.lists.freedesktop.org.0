Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB4A284B5
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 19:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F076E053;
	Thu, 23 May 2019 17:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4516E054
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 17:17:11 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id j53so7622120qta.9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 10:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LAxvAIcKgOQtgxLFmLme64DEPUv6dyfyGiKy9z9/MCs=;
 b=rQIjPdXXb4YiFB9W5FV1FwfgPCCAJbSy8UqI6mjpc/lLdUmlfgm2jLmREAKQqFC1KK
 eml/VAAiyoqEZsh4q4hNSLXcCj6NA/0TqIOoxVh5HedXQdDY+Zzgn4pGaNQGYSZ+f8+W
 m9SKnEtXu6OYrLE8r0xercxGWTZsVjak/10fPb9fkPB6Dkm6ILMldfJp1OH/GFpUPsk0
 8Zq0E0hIP5p9b/dk+rS1hP1JHjd/xgmqAHDw3NksDIOHdhdiLqIZbxo54oPMHV7Ryk/d
 FC/JMNBjwVrY30Zdp0gEmTz6S0XPzOgVuXl77MsdQMHMngnpSYVkgaQ/sbASV1m6iqXH
 SzIA==
X-Gm-Message-State: APjAAAUsVrKaVx92NbmxDyalz8dW5rOlOtYUgMm9PjV3zcg8Wwm6PaIU
 dusoCEuAdjKbvrvz1PkWJKbIsTiq+sg=
X-Google-Smtp-Source: APXvYqyYw1/bFwr5ugr6PT9CZN+/0NEYxJLX3rL7031w7JMYQiQvCowH+7AbKLe2zMD0244RVWYD4A==
X-Received: by 2002:ac8:38c6:: with SMTP id g6mr12497608qtc.353.1558631830415; 
 Thu, 23 May 2019 10:17:10 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id v25sm662660qtv.2.2019.05.23.10.17.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 10:17:09 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2 5/6] drm/msm/a6xx: Drop the device reference in gmu
Date: Thu, 23 May 2019 13:16:44 -0400
Message-Id: <20190523171653.138678-5-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190523171653.138678-1-sean@poorly.run>
References: <20190523171653.138678-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LAxvAIcKgOQtgxLFmLme64DEPUv6dyfyGiKy9z9/MCs=;
 b=V0CFGOhhRC9eOWybC6/ZBTPxvnDMwWa8evXcjFmVfoOF7xn1ScLItpDL3v/QCcz/QX
 1wzP9oTnirrNEy2iiPcV4Lg/ITtuPPrbCzYpG1fKug7lRL0OrvjUCMHlNcK6CvH2318I
 4SqhOH8ZWTfrtUaanBHb8TCdO8xRCQZbeflqzPt8OqFzNrLoQ0bPgTPbHMvcB7JyDiDZ
 AbVW4myrmGjYp6ArQkkS7s0z2FDKZR+Z0lJMOYvt6J6zaOnXIrwCOuqk8KM0sGltNNIC
 W576cyuZhs6n1Xcw0NPM7KLGwkyshxKBySWID0gN/7UQW71pIfT+i2Ln/b3PgkrlPo9J
 IfkQ==
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
Cc: Sean Paul <sean@poorly.run>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpvZl9maW5kX2RldmljZV9i
eV9ub2RlKCkgZ3JhYnMgYSBkZXYgcmVmZXJlbmNlLCBzbyBtYWtlIHN1cmUgd2UgY2xlYXIgaXQK
b24gZXJyb3IgYW5kIHJlbW92ZS4KCkNoYW5nZXMgaW4gdjI6Ci0gQWRkZWQgdG8gdGhlIHNldCAo
Sm9yZGFuKQoKQ2M6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1cm9yYS5vcmc+ClNpZ25l
ZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMgfCAxNCArKysrKysrKysrKy0tLQogMSBmaWxl
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vYWRyZW5vL2E2eHhfZ211LmMKaW5kZXggZjcyNDBjOWUxMWZiLi5lMmI4MzliNWQzYmQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYwpAQCAtMTI1Myw2ICsxMjUzLDkgQEAg
dm9pZCBhNnh4X2dtdV9yZW1vdmUoc3RydWN0IGE2eHhfZ3B1ICphNnh4X2dwdSkKIAlmcmVlX2ly
cShnbXUtPmdtdV9pcnEsIGdtdSk7CiAJZnJlZV9pcnEoZ211LT5oZmlfaXJxLCBnbXUpOwogCisJ
LyogRHJvcCByZWZlcmVuY2UgdGFrZW4gaW4gb2ZfZmluZF9kZXZpY2VfYnlfbm9kZSAqLworCXB1
dF9kZXZpY2UoZ211LT5kZXYpOworCiAJZ211LT5pbml0aWFsaXplZCA9IGZhbHNlOwogfQogCkBA
IC0xMjc3LDEyICsxMjgwLDEyIEBAIGludCBhNnh4X2dtdV9wcm9iZShzdHJ1Y3QgYTZ4eF9ncHUg
KmE2eHhfZ3B1LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpCiAJLyogR2V0IHRoZSBsaXN0IG9m
IGNsb2NrcyAqLwogCXJldCA9IGE2eHhfZ211X2Nsb2Nrc19wcm9iZShnbXUpOwogCWlmIChyZXQp
Ci0JCXJldHVybiByZXQ7CisJCWdvdG8gZXJyX3B1dF9kZXZpY2U7CiAKIAkvKiBTZXQgdXAgdGhl
IElPTU1VIGNvbnRleHQgYmFuayAqLwogCXJldCA9IGE2eHhfZ211X21lbW9yeV9wcm9iZShnbXUp
OwogCWlmIChyZXQpCi0JCXJldHVybiByZXQ7CisJCWdvdG8gZXJyX3B1dF9kZXZpY2U7CiAKIAkv
KiBBbGxvY2F0ZSBtZW1vcnkgZm9yIGZvciB0aGUgSEZJIHF1ZXVlcyAqLwogCWdtdS0+aGZpID0g
YTZ4eF9nbXVfbWVtb3J5X2FsbG9jKGdtdSwgU1pfMTZLKTsKQEAgLTEzMzQsNiArMTMzNywxMSBA
QCBpbnQgYTZ4eF9nbXVfcHJvYmUoc3RydWN0IGE2eHhfZ3B1ICphNnh4X2dwdSwgc3RydWN0IGRl
dmljZV9ub2RlICpub2RlKQogCiAJCWlvbW11X2RvbWFpbl9mcmVlKGdtdS0+ZG9tYWluKTsKIAl9
CisJcmV0ID0gLUVOT0RFVjsKIAotCXJldHVybiAtRU5PREVWOworZXJyX3B1dF9kZXZpY2U6CisJ
LyogRHJvcCByZWZlcmVuY2UgdGFrZW4gaW4gb2ZfZmluZF9kZXZpY2VfYnlfbm9kZSAqLworCXB1
dF9kZXZpY2UoZ211LT5kZXYpOworCisJcmV0dXJuIHJldDsKIH0KLS0gClNlYW4gUGF1bCwgU29m
dHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
