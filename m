Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3F68191F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 14:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35AA89D66;
	Mon,  5 Aug 2019 12:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DFB89D66
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 12:23:56 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id s49so43652716edb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 05:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6cE/xv/U0fBPBmKtqaF9y7E9fzhVX7Pxsb5pN0WeB1I=;
 b=L7DbG07GBdbKjRF6kO3QA5tzmqcbRzZRowsDKc3xqq0qc3dG06ZdyS1k4Q6CcM9Zyg
 LOTWqDKEkzXtgOdNBMO9uBbZiff48PneIOXzpOLDzREEjY5UBxnW4v7YtMvfKmef1uUA
 sc0p2k+sAYVyOjDkUTl8YTECUstaC52hhu9WtYwObpbGMz+fO6lMRFWHRMbb25mQTzow
 AJs6PGWnWjKgQjwm6HxvRCVl5/F1xBB7XZOzcgXdTeQuGEKaNANdx4otEC/ps/tOkMzT
 aAJb1B9vQjckABFsZeEMgFV+6nCfbtc8fP8MIgBL/pG45Y9w6bzUSEJ+EFOTbfVbDTIJ
 sXlQ==
X-Gm-Message-State: APjAAAVgh5b6r9dZtk7ZXRUKAsPBxcnII9HxQCZtcOeOiSSY6vXZgN0G
 dAZ1bNLi6DHFF7G0v7PB3O/Kxj5q
X-Google-Smtp-Source: APXvYqzJLYMl8X58rC6Z68Ux+kFysgpoFJIuYIEtkqr8EnJnNzkm22UqaQB+ILDUAbn08v48+Bg1Ng==
X-Received: by 2002:a50:982a:: with SMTP id g39mr132230254edb.88.1565007835124; 
 Mon, 05 Aug 2019 05:23:55 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id u7sm14307073ejm.48.2019.08.05.05.23.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:23:54 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/21] drm/dp: Add drm_dp_link_reset() implementation
Date: Mon,  5 Aug 2019 14:23:32 +0200
Message-Id: <20190805122350.8838-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805122350.8838-1-thierry.reding@gmail.com>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6cE/xv/U0fBPBmKtqaF9y7E9fzhVX7Pxsb5pN0WeB1I=;
 b=BC7gWUx9P3nVOUDqIHJkhyz8XXGF8042tSx+pdS+Vx6CO6ucqRxR0mth21Hc0r1Bhm
 AlUHqtLFNU1FxOWHbZ8DKnTYhyMBmlwPeFhDKGLkcRR/l6TbeFkXV6Ces80flVZBNMnn
 fGMKs1sOwrCcDrDh9RarGM7ROs7N/d7x/Uw9foeJNkZWjqhOjuqvBC4itVnG4Ne3l5R9
 xg54NarjOjTO9wasL7giqarr9OfQsKaRx8uA7Hf+cOWnKNaCNVTqGXty5ztB9zCEsTeU
 ewe5iiqOATij1SVREmY7FIb/09d8X5L2+ZVeeNK5waoEeduDCSMIeFbD/SBYNXdsjV65
 WKiA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClN1YnNlcXVlbnQgcGF0
Y2hlcyB3aWxsIGFkZCBub24tdm9sYXRpbGUgZmllbGRzIHRvIHN0cnVjdCBkcm1fZHBfbGluaywK
c28gaW50cm9kdWNlIGEgZnVuY3Rpb24gdG8gemVybyBvdXQgb25seSB0aGUgdm9sYXRpbGUgZmll
bGRzLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwgMTMgKysrKysrKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9oZWxwZXIuYwppbmRleCBmZmM2OGQzMDVhZmUuLmY1YWY3MWVjMWI3ZCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2hlbHBlci5jCkBAIC0zMzYsNiArMzM2LDE3IEBAIGludCBkcm1fZHBfZHBjZF9yZWFk
X2xpbmtfc3RhdHVzKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCiB9CiBFWFBPUlRfU1lNQk9MKGRy
bV9kcF9kcGNkX3JlYWRfbGlua19zdGF0dXMpOwogCitzdGF0aWMgdm9pZCBkcm1fZHBfbGlua19y
ZXNldChzdHJ1Y3QgZHJtX2RwX2xpbmsgKmxpbmspCit7CisJaWYgKCFsaW5rKQorCQlyZXR1cm47
CisKKwlsaW5rLT5yZXZpc2lvbiA9IDA7CisJbGluay0+cmF0ZSA9IDA7CisJbGluay0+bnVtX2xh
bmVzID0gMDsKKwlsaW5rLT5jYXBhYmlsaXRpZXMgPSAwOworfQorCiAvKioKICAqIGRybV9kcF9s
aW5rX3Byb2JlKCkgLSBwcm9iZSBhIERpc3BsYXlQb3J0IGxpbmsgZm9yIGNhcGFiaWxpdGllcwog
ICogQGF1eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwKQEAgLTM1Miw3ICszNjMsNyBAQCBpbnQg
ZHJtX2RwX2xpbmtfcHJvYmUoc3RydWN0IGRybV9kcF9hdXggKmF1eCwgc3RydWN0IGRybV9kcF9s
aW5rICpsaW5rKQogCXU4IHZhbHVlc1szXTsKIAlpbnQgZXJyOwogCi0JbWVtc2V0KGxpbmssIDAs
IHNpemVvZigqbGluaykpOworCWRybV9kcF9saW5rX3Jlc2V0KGxpbmspOwogCiAJZXJyID0gZHJt
X2RwX2RwY2RfcmVhZChhdXgsIERQX0RQQ0RfUkVWLCB2YWx1ZXMsIHNpemVvZih2YWx1ZXMpKTsK
IAlpZiAoZXJyIDwgMCkKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
