Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3362349567
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 16:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252186EDAB;
	Thu, 25 Mar 2021 15:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586956EDAB
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 15:27:42 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id l18so2857429edc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 08:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ds58svqq370KeMAqZTmXbl85w43i4z+NC56Bd16rWfU=;
 b=kADTXPa8ZO+hzK2bZ+7P7jlj4Jhv3avT6mcnWQat6c02GyhUZe4rv9GfIUBC55eiqp
 iUR3QNcSjftG72XQRu0RKZ30AI3KgKPW7uJ8ADj1YS++3JSbrlCmsy/Pik04DL4XtXdb
 Hi29hynWZlhk9a4BIXRsFz8o2ABUtoOQ9QzeLAtBT/qu2bLTu5U+d9tDQEH2kJKwL1o0
 wTS19DDTcOqWXCb4nrkd8T+rRiB1ynYPREvVzLCiplIIq5kVy6NAUJ9pBNRnK89XsKzK
 VZqRpdb+TuQz1yOLtqUArvq/cL8HuPDiKSTbopiPXOHtGS6hsb3FLjMLkUvo0emfldAu
 PnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ds58svqq370KeMAqZTmXbl85w43i4z+NC56Bd16rWfU=;
 b=C8zyvLejDQARrneKaKiDwABLZwWWk5NsLSj6BbmANk8bZI7AF9NYxWCtkLwawvHreD
 hmuM7w8QPVWGRttpxanu+lyCGwrVAbZKSabh++MNaue0U5hply9R1sSNR535pFjHUsUk
 FxxIJpf9PZzNCCory9qsrWcYSAGTk19UnKsBSuyjJVufiaTxmSQJ0flWu5VL1rxRRZui
 4Bmsh/j0FSjl3a+Qty2BzaQXUZ/YEDPT1QjIMD0PA2I5Gt9haADXIn2Rr3p/kd1JMVTI
 ducnUkWcuYWl7YmH3GAujVQgQ9IMSS4bPVJgnSxrXt2+sR59pV1TtEu3yxidXtT3l+3A
 wu+w==
X-Gm-Message-State: AOAM5325np6S29dKOJEu+8k4JJjh1EjauaQF+RaoaBWi+gI4/Nvrv1/Q
 9g88t/qvv2R/MvbZDXLnPeZpryEViBk=
X-Google-Smtp-Source: ABdhPJwW7vaV0yKQFL9WTIZdHxW83bnm6boqq5kxlVFNKJXUtg0m0AvN6CTQA6OqyhaIq2gO87r2Xg==
X-Received: by 2002:aa7:d0c2:: with SMTP id u2mr9636564edo.158.1616686061085; 
 Thu, 25 Mar 2021 08:27:41 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fe55:c06:5237:9a7b])
 by smtp.gmail.com with ESMTPSA id 90sm2954977edr.69.2021.03.25.08.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:27:40 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: colin.king@canonical.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix invalid NULL deref
Date: Thu, 25 Mar 2021 16:27:40 +0100
Message-Id: <20210325152740.82633-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEJPIG1pZ2h0IGJlIE5VTEwgaW4gdGhpcyBmdW5jdGlvbiwgdXNlIHRoZSBiZGV2IGRpcmVj
dGx5LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgpSZXBvcnRlZC1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2Fs
LmNvbT4KRml4ZXM6IGExZjA5MWY4ZWYyYiAoImRybS90dG06IHN3aXRjaCB0byBwZXIgZGV2aWNl
IExSVSBsb2NrIikKLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgNiArKystLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMKaW5kZXggMmQyYWM1MzI5ODdlLi42YWI3YjY2Y2UzNmQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uYwpAQCAtNjI1LDcgKzYyNSw3IEBAIGludCB0dG1fbWVtX2V2aWN0X2ZpcnN0KHN0cnVjdCB0
dG1fZGV2aWNlICpiZGV2LAogCXVuc2lnbmVkIGk7CiAJaW50IHJldDsKIAotCXNwaW5fbG9jaygm
Ym8tPmJkZXYtPmxydV9sb2NrKTsKKwlzcGluX2xvY2soJmJkZXYtPmxydV9sb2NrKTsKIAlmb3Ig
KGkgPSAwOyBpIDwgVFRNX01BWF9CT19QUklPUklUWTsgKytpKSB7CiAJCWxpc3RfZm9yX2VhY2hf
ZW50cnkoYm8sICZtYW4tPmxydVtpXSwgbHJ1KSB7CiAJCQlib29sIGJ1c3k7CkBAIC02NjIsNyAr
NjYyLDcgQEAgaW50IHR0bV9tZW1fZXZpY3RfZmlyc3Qoc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYs
CiAJaWYgKCFibykgewogCQlpZiAoYnVzeV9ibyAmJiAhdHRtX2JvX2dldF91bmxlc3NfemVybyhi
dXN5X2JvKSkKIAkJCWJ1c3lfYm8gPSBOVUxMOwotCQlzcGluX3VubG9jaygmYm8tPmJkZXYtPmxy
dV9sb2NrKTsKKwkJc3Bpbl91bmxvY2soJmJkZXYtPmxydV9sb2NrKTsKIAkJcmV0ID0gdHRtX21l
bV9ldmljdF93YWl0X2J1c3koYnVzeV9ibywgY3R4LCB0aWNrZXQpOwogCQlpZiAoYnVzeV9ibykK
IAkJCXR0bV9ib19wdXQoYnVzeV9ibyk7CkBAIC02NzYsNyArNjc2LDcgQEAgaW50IHR0bV9tZW1f
ZXZpY3RfZmlyc3Qoc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYsCiAJCXJldHVybiByZXQ7CiAJfQog
Ci0Jc3Bpbl91bmxvY2soJmJvLT5iZGV2LT5scnVfbG9jayk7CisJc3Bpbl91bmxvY2soJmJkZXYt
PmxydV9sb2NrKTsKIAogCXJldCA9IHR0bV9ib19ldmljdChibywgY3R4KTsKIAlpZiAobG9ja2Vk
KQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
