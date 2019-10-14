Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DE1D6302
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 14:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DCF6E2BC;
	Mon, 14 Oct 2019 12:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0196E2B2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 12:51:03 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 7so17171898wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 05:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G8Ip/N74ctxJJIwGKeqriyFtdTULY1VY4q99IhD7qRM=;
 b=Mkd3Qhc8Wh47FOs/jUSI+oovkpEfaWNixyzlS+iEtOKzP+NDCrwWVU265pFC3gU1ic
 GDTWQX+c7CE05c+XmESPnO1tQZJvAxsd4sk2EMMXordMm+1ehnkNRfOA0riSkKVkCh2C
 8MCJ3hGlBz/PyCkFBhe5gbzIMR6tz9YgnPEHVv7IwqDO9WTpFguFa1RpnyTqMcswEZ22
 CT+wRaQ5xilAzoGxWBda9qPHsWjw15GcAxXjRWp3BsDRP0d/STJHTIiCTv//eQSs7QPt
 cWpiJ1G8dd1f0CV4mu5M9qgvdYOOj5IVyymZhhRgqNUlWyrSmvqZ+ys4BK5Szp1wPdGP
 lIeA==
X-Gm-Message-State: APjAAAUhJe6JFwW16a281P4lT1f5h38RfSL7SZdd8MlNviz48XVRnbml
 ub1z+v3Mjf3Y1alGDAN9DFkTKZIs
X-Google-Smtp-Source: APXvYqwy8ad1by41Gb786EPOSxMUzFJ4fHUkh7WWE+RcLVZpFH7w5ydP5oTR7CWjvEhiKXk3grAFmQ==
X-Received: by 2002:a1c:ac02:: with SMTP id v2mr11162902wme.85.1571057462130; 
 Mon, 14 Oct 2019 05:51:02 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id l7sm18312749wrv.77.2019.10.14.05.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:51:01 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 05/14] drm/tegra: Inherit device DMA parameters from host1x
Date: Mon, 14 Oct 2019 14:50:40 +0200
Message-Id: <20191014125049.425101-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G8Ip/N74ctxJJIwGKeqriyFtdTULY1VY4q99IhD7qRM=;
 b=a6UPelncewmDN9UTVzqDbpUmI9eu9bTh6bxy9nRXld4JwG3EVLAm3e06C3HA577Sv1
 QHP5J78GPFogvs6g3WMyHnKzY9Oqw94QVzNn1g9OrBs3Oj07LAkxqz5I8WNR5ZZi8MHR
 iLsysrgZLneZNwqixOsZUzJaKfimn+4au/Ai31U/WASpDeF9WweuGelfgEN4OvxznALR
 lTR5/bvHA824s1VLAWOzUWEvLosCs/f8LeECsUD2aQTrR+61yvSqi+Q3OyQw4nYhtybO
 Act5WdkDXd+GYETwDO+CWFi2NiopIvXTHNJKkZstRgJQulH4eHae5YnT717G65LEiWLH
 Itpw==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBkaXNwbGF5IGNv
bnRyb2xsZXJzIGFuZCBWSUMgZG9uJ3QgaGF2ZSBhbnkgbGltaXRhdGlvbnMgb24gdGhlCkRNQSBz
ZWdtZW50IHNpemUuIEluaGVyaXQgdGhlIERNQSBwYXJhbWV0ZXJzIGZyb20gdGhlIHBhcmVudCBk
ZXZpY2UsCndoaWNoIGFsc28gZG9lc24ndCBoYXZlIGFueSBzdWNoIGxpbWl0YXRpb25zLgoKU2ln
bmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vdGVncmEvZGMuYyAgfCA5ICsrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL3ZpYy5jIHwgOSArKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jIGIvZHJpdmVycy9ncHUv
ZHJtL3RlZ3JhL2RjLmMKaW5kZXggZmJmNTdiYzNjZGFiLi5mN2Y3OTg0YmI3NDkgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdy
YS9kYy5jCkBAIC0yMDc0LDYgKzIwNzQsMTIgQEAgc3RhdGljIGludCB0ZWdyYV9kY19pbml0KHN0
cnVjdCBob3N0MXhfY2xpZW50ICpjbGllbnQpCiAJCWdvdG8gY2xlYW51cDsKIAl9CiAKKwkvKgor
CSAqIEluaGVyaXQgdGhlIERNQSBwYXJhbWV0ZXJzIChzdWNoIGFzIG1heGltdW0gc2VnbWVudCBz
aXplKSBmcm9tIHRoZQorCSAqIHBhcmVudCBkZXZpY2UuCisJICovCisJY2xpZW50LT5kZXYtPmRt
YV9wYXJtcyA9IGNsaWVudC0+cGFyZW50LT5kbWFfcGFybXM7CisKIAlyZXR1cm4gMDsKIAogY2xl
YW51cDoKQEAgLTIwOTcsNiArMjEwMyw5IEBAIHN0YXRpYyBpbnQgdGVncmFfZGNfZXhpdChzdHJ1
Y3QgaG9zdDF4X2NsaWVudCAqY2xpZW50KQogCWlmICghdGVncmFfZGNfaGFzX3dpbmRvd19ncm91
cHMoZGMpKQogCQlyZXR1cm4gMDsKIAorCS8qIGF2b2lkIGEgZGFuZ2xpbmcgcG9pbnRlciBqdXN0
IGluIGNhc2UgdGhpcyBkaXNhcHBlYXJzICovCisJY2xpZW50LT5kZXYtPmRtYV9wYXJtcyA9IE5V
TEw7CisKIAlkZXZtX2ZyZWVfaXJxKGRjLT5kZXYsIGRjLT5pcnEsIGRjKTsKIAogCWVyciA9IHRl
Z3JhX2RjX3JnYl9leGl0KGRjKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS92
aWMuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYwppbmRleCBjOTdhNjFjODc3YWYuLjhk
OThiMGNmYzQ3YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3ZpYy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYwpAQCAtMjE0LDYgKzIxNCwxMiBAQCBzdGF0aWMg
aW50IHZpY19pbml0KHN0cnVjdCBob3N0MXhfY2xpZW50ICpjbGllbnQpCiAJaWYgKGVyciA8IDAp
CiAJCWdvdG8gZnJlZV9zeW5jcHQ7CiAKKwkvKgorCSAqIEluaGVyaXQgdGhlIERNQSBwYXJhbWV0
ZXJzIChzdWNoIGFzIG1heGltdW0gc2VnbWVudCBzaXplKSBmcm9tIHRoZQorCSAqIHBhcmVudCBk
ZXZpY2UuCisJICovCisJY2xpZW50LT5kZXYtPmRtYV9wYXJtcyA9IGNsaWVudC0+cGFyZW50LT5k
bWFfcGFybXM7CisKIAlyZXR1cm4gMDsKIAogZnJlZV9zeW5jcHQ6CkBAIC0yMzYsNiArMjQyLDkg
QEAgc3RhdGljIGludCB2aWNfZXhpdChzdHJ1Y3QgaG9zdDF4X2NsaWVudCAqY2xpZW50KQogCXN0
cnVjdCB2aWMgKnZpYyA9IHRvX3ZpYyhkcm0pOwogCWludCBlcnI7CiAKKwkvKiBhdm9pZCBhIGRh
bmdsaW5nIHBvaW50ZXIganVzdCBpbiBjYXNlIHRoaXMgZGlzYXBwZWFycyAqLworCWNsaWVudC0+
ZGV2LT5kbWFfcGFybXMgPSBOVUxMOworCiAJZXJyID0gdGVncmFfZHJtX3VucmVnaXN0ZXJfY2xp
ZW50KHRlZ3JhLCBkcm0pOwogCWlmIChlcnIgPCAwKQogCQlyZXR1cm4gZXJyOwotLSAKMi4yMy4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
