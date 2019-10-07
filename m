Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6772BCED98
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 22:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6FC89C52;
	Mon,  7 Oct 2019 20:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFABC89C52;
 Mon,  7 Oct 2019 20:35:38 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id a2so9373458pfo.10;
 Mon, 07 Oct 2019 13:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CqfvJ5pvQPXk0BHnC/qiO7SxY725BiWlCHyn+q4BOxc=;
 b=mJwJrDmRmpOZStfcRRMgktMHAJHit3PUHldTugza5SbwUbskCQBGcMuqx5LWgn2375
 umQLDP6FR2gslAecbryyXmTPN4wL5k/uvYrk52MR12U04AR+OWQbeiJzU2VcnRCXLf9r
 HQdjJnoAB9v7ExQfxsYMvgn0AhY6HE11wRzX6AQ14LtEcxcSzdD531mcbSt+k0eVGSgP
 zGD4lgWi1OeK+nvuRiQ7Jk24/HxVdejO/CGWr5EOGlbdH2IWgypCQ1HZW0e0ZJ+L1oFk
 +DRfNfI3wX/6osxJeb8+BYl6UgxxlZGlLgnUTbW4P2qSfUk39lHhnaIJAVNBvGhHqT5y
 nNRg==
X-Gm-Message-State: APjAAAWtHlkReNrpwFUnwC0j41zccCCWCVAKgDtSkHNYM8hncQcX3p72
 aPY3qAgbsYlSZw6C7myGX66kmmVQ
X-Google-Smtp-Source: APXvYqwdvdnGsnyePeqeHBTBNU74U6yfa020DAsY08IaRi36nJv8u4329HayFHYz+95BFWYxqkzUwA==
X-Received: by 2002:a63:f957:: with SMTP id q23mr170715pgk.81.1570480538059;
 Mon, 07 Oct 2019 13:35:38 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id q20sm20502851pfl.79.2019.10.07.13.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 13:35:37 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm: always dump buffer base/size
Date: Mon,  7 Oct 2019 13:31:08 -0700
Message-Id: <20191007203108.18667-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007203108.18667-1-robdclark@gmail.com>
References: <20191007203108.18667-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CqfvJ5pvQPXk0BHnC/qiO7SxY725BiWlCHyn+q4BOxc=;
 b=ToO/RKWqkLaXMfa+snaXo9WKFKvpYC1NfRgs4c/h85/8LQmRMMP7WIwrafm0v2mEXK
 pv6Qb21fzchRVOgFzQWuwXbldwIZE37+0mbjGol0bwP+Wb8wdWeyXV4B/GFCX4jH+GMA
 P9MY0XNkRzbAzkgZuE0LWDERaLivykyGf+D8y+f28XzdibEKlDT2V6gJkJMtw+JCKSCR
 nzhUFw4nmOEx2eA6FUw6kwpABWh6mP01CuhPBkQ7rcpozRZSG4FvxYqOYDkl8PMK7Lr9
 2PM/Ngfkzmw2nqzTIS0uyJhb+Bc2C/8XB9wnu3CRu/Wtc9xdsfI6aVSgwVdVWQn8/F/i
 UDhQ==
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKRXZlbiBpZiB3ZSBhcmUg
bm90IGR1bXBpbmcgdGhlIGJ1ZmZlcidzIGNvbnRlbnRzLCBpdCBpcyB1c2VmdWwgdG8gbG9nCnRo
ZWlyIGJhc2UgYWRkcmVzcyBhbmQgc2l6ZS4gIFRoaXMgbWFrZXMgaXQgZWFzaWVyIHRvIHNlZSB3
aGVuIGRpZmZlcmVudApncHUgcG9pbnRlcnMgcG9pbnQgdG8gYSBzaW5nbGUgYnVmZmVyLCBmb3Ig
ZXhhbXBsZSBoaWdoZXIgbWlwbWFwIGxldmVscwpvZiBhIHNpbmdsZSB0ZXh0dXJlLgoKU2lnbmVk
LW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9tc20vbXNtX3JkLmMgfCAxMCArKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vbXNtX3JkLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9yZC5jCmluZGV4IGY4ZjY1
NDMwMWRlZi4uMDg5NjQxOWVkOTVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21z
bV9yZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX3JkLmMKQEAgLTI5NSw3ICsyOTUs
NyBAQCB2b2lkIG1zbV9yZF9kZWJ1Z2ZzX2NsZWFudXAoc3RydWN0IG1zbV9kcm1fcHJpdmF0ZSAq
cHJpdikKIAogc3RhdGljIHZvaWQgc25hcHNob3RfYnVmKHN0cnVjdCBtc21fcmRfc3RhdGUgKnJk
LAogCQlzdHJ1Y3QgbXNtX2dlbV9zdWJtaXQgKnN1Ym1pdCwgaW50IGlkeCwKLQkJdWludDY0X3Qg
aW92YSwgdWludDMyX3Qgc2l6ZSkKKwkJdWludDY0X3QgaW92YSwgdWludDMyX3Qgc2l6ZSwgYm9v
bCBmdWxsKQogewogCXN0cnVjdCBtc21fZ2VtX29iamVjdCAqb2JqID0gc3VibWl0LT5ib3NbaWR4
XS5vYmo7CiAJdW5zaWduZWQgb2Zmc2V0ID0gMDsKQEAgLTMxNSw2ICszMTUsOSBAQCBzdGF0aWMg
dm9pZCBzbmFwc2hvdF9idWYoc3RydWN0IG1zbV9yZF9zdGF0ZSAqcmQsCiAJcmRfd3JpdGVfc2Vj
dGlvbihyZCwgUkRfR1BVQUREUiwKIAkJCSh1aW50MzJfdFszXSl7IGlvdmEsIHNpemUsIGlvdmEg
Pj4gMzIgfSwgMTIpOwogCisJaWYgKCFmdWxsKQorCQlyZXR1cm47CisKIAkvKiBCdXQgb25seSBk
dW1wIHRoZSBjb250ZW50cyBvZiBidWZmZXJzIG1hcmtlZCBSRUFEICovCiAJaWYgKCEoc3VibWl0
LT5ib3NbaWR4XS5mbGFncyAmIE1TTV9TVUJNSVRfQk9fUkVBRCkpCiAJCXJldHVybjsKQEAgLTM3
OCw4ICszODEsNyBAQCB2b2lkIG1zbV9yZF9kdW1wX3N1Ym1pdChzdHJ1Y3QgbXNtX3JkX3N0YXRl
ICpyZCwgc3RydWN0IG1zbV9nZW1fc3VibWl0ICpzdWJtaXQsCiAJcmRfd3JpdGVfc2VjdGlvbihy
ZCwgUkRfQ01ELCBtc2csIEFMSUdOKG4sIDQpKTsKIAogCWZvciAoaSA9IDA7IGkgPCBzdWJtaXQt
Pm5yX2JvczsgaSsrKQotCQlpZiAoc2hvdWxkX2R1bXAoc3VibWl0LCBpKSkKLQkJCXNuYXBzaG90
X2J1ZihyZCwgc3VibWl0LCBpLCAwLCAwKTsKKwkJc25hcHNob3RfYnVmKHJkLCBzdWJtaXQsIGks
IDAsIDAsIHNob3VsZF9kdW1wKHN1Ym1pdCwgaSkpOwogCiAJZm9yIChpID0gMDsgaSA8IHN1Ym1p
dC0+bnJfY21kczsgaSsrKSB7CiAJCXVpbnQzMl90IHN6ZCAgPSBzdWJtaXQtPmNtZFtpXS5zaXpl
OyAvKiBpbiBkd29yZHMgKi8KQEAgLTM4Nyw3ICszODksNyBAQCB2b2lkIG1zbV9yZF9kdW1wX3N1
Ym1pdChzdHJ1Y3QgbXNtX3JkX3N0YXRlICpyZCwgc3RydWN0IG1zbV9nZW1fc3VibWl0ICpzdWJt
aXQsCiAJCS8qIHNuYXBzaG90IGNtZHN0cmVhbSBibydzIChpZiB3ZSBoYXZlbid0IGFscmVhZHkp
OiAqLwogCQlpZiAoIXNob3VsZF9kdW1wKHN1Ym1pdCwgaSkpIHsKIAkJCXNuYXBzaG90X2J1Zihy
ZCwgc3VibWl0LCBzdWJtaXQtPmNtZFtpXS5pZHgsCi0JCQkJCXN1Ym1pdC0+Y21kW2ldLmlvdmEs
IHN6ZCAqIDQpOworCQkJCQlzdWJtaXQtPmNtZFtpXS5pb3ZhLCBzemQgKiA0LCB0cnVlKTsKIAkJ
fQogCX0KIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
