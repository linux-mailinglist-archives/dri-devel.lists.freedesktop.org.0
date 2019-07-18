Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 593196D1AB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 18:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32226E43C;
	Thu, 18 Jul 2019 16:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9713E6E431;
 Thu, 18 Jul 2019 16:15:35 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z28so27998928ljn.4;
 Thu, 18 Jul 2019 09:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vfJth78zrsCE8EvAkb2q7xxIdGu3poPk3dyoAqmz7bA=;
 b=paVj8PyKinyf5ARQBNEY9lEK/fsCSPVhMvKdwOOKycAWuzpzRsNT/vpI5J3h8epIwd
 mGtwSRat/bTCLwoMvPGXBv4VirdDtTAuW4kNF7ubyMb4/YChzmA1ot8V1tLsBmWOmBPq
 VfQ9nY75juvFgrAe5r7Qvjx4e4Qb8Nzm10UzKh5dsYKPu9djSfrHYX8UuaI/cNchYuEk
 MPe8Mr3WU+BaZgH2X3MekHqvaFxxArQW0FuHhWVJWAVbZVG+qLAgsWRaQmmvbe9XA3fw
 FC+YEdJeL3U6uOW7ZJZV225Z9cmbN1PlhnYgwiy3zeBmv9Xcu9V8J8sXDFS9pBpmYstG
 9hfw==
X-Gm-Message-State: APjAAAWlBPwDw2jv1fLEFSraFshwrr9ndwXspW+r361p1IKeCLuM80G7
 yFJIGDhY0GEF8ouZWym7z75tfhC1DmH94A==
X-Google-Smtp-Source: APXvYqz+lvIEFfsf44rKsdxmLLQVJPn5lk9Rv8gUung+m8ggZXDMg+iNeOqEP6Hx4DqN5fgQu97mtQ==
X-Received: by 2002:a2e:3013:: with SMTP id w19mr24846595ljw.73.1563466532065; 
 Thu, 18 Jul 2019 09:15:32 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 d21sm4057995lfc.73.2019.07.18.09.15.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 09:15:31 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v1 05/11] drm/vblank: drop use of DRM_WAIT_ON()
Date: Thu, 18 Jul 2019 18:15:01 +0200
Message-Id: <20190718161507.2047-6-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718161507.2047-1-sam@ravnborg.org>
References: <20190718161507.2047-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vfJth78zrsCE8EvAkb2q7xxIdGu3poPk3dyoAqmz7bA=;
 b=BbtCb9g2DsNiEp4NQaoJ4QYlf9TOBMn5FNfXAILkgRxVvjMv4oYQ2QWQur2QpY1oDs
 tY+hq6tQpdn6sv4GaAaRN3zqoKMtOJxKTS+CE/FeurecYR2py7DmD+wOYqDqFPliavRD
 kUvnCwNnxdpmg77SNaygFlJnpzjhLEFeu3r3pjJqPBA1qYv13+DJUC4oqyBIegVvlLUf
 yV55m8LLBBHpOjCBjccG83p4/fiVAPoDBnjNwfJNh1ay525CqTZIoid4MD9BRXItWgVc
 N7jdcGxdFSDusx5NEMh0a+wZcDux71kNRXlqKP3VfMBmJJZlGukoBFODa+OKNFpsR1xe
 1F0g==
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Thierry Reding <treding@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RFJNX1dBSVRfT04oKSBpcyBmcm9tIHRoZSBkZXByZWNhdGVkIGRybV9vc19saW51eCBoZWFkZXIg
YW5kCnRoZSBtb2Rlcm4gcmVwbGFjZW1lbnQgaXMgdGhlIHdhaXRfZXZlbnRfKi4KClRoZSByZXR1
cm4gdmFsdWVzIGRpZmZlciwgc28gYSBjb252ZXJzaW9uIGlzIG5lZWRlZCB0bwprZWVwIHRoZSBv
cmlnaW5hbCBpbnRlcmZhY2UgdG93YXJkcyB1c2Vyc3BhY2UuCkludHJvZHVjZWQgYSBzd2l0Y2gv
Y2FzZSB0byBtYWtlIGNvZGUgb2J2aW91cyBhbmQgdG8gYWxsb3cKZGlmZmVyZW50IGRlYnVnIHBy
aW50cyBkZXBlbmRpbmcgb24gdGhlIHJlc3VsdC4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9y
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJv
b3RsaW4uY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyB8IDI5ICsrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV92YmxhbmsuYwppbmRleCA2MDNhYjEwNTEyNWQuLjhlOWFjMTg3NTAwZSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX3ZibGFuay5jCkBAIC0zMSw3ICszMSw2IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9k
cnYuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2ZyYW1lYnVmZmVyLmg+CiAjaW5jbHVkZSA8ZHJtL2Ry
bV9wcmludC5oPgotI2luY2x1ZGUgPGRybS9kcm1fb3NfbGludXguaD4KICNpbmNsdWRlIDxkcm0v
ZHJtX3ZibGFuay5oPgogCiAjaW5jbHVkZSAiZHJtX2ludGVybmFsLmgiCkBAIC0xNjcyLDE5ICsx
NjcxLDMxIEBAIGludCBkcm1fd2FpdF92YmxhbmtfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgdm9pZCAqZGF0YSwKIAlpZiAocmVxX3NlcSAhPSBzZXEpIHsKIAkJRFJNX0RFQlVHKCJ3YWl0
aW5nIG9uIHZibGFuayBjb3VudCAlbGx1LCBjcnRjICV1XG4iLAogCQkJICByZXFfc2VxLCBwaXBl
KTsKLQkJRFJNX1dBSVRfT04ocmV0LCB2YmxhbmstPnF1ZXVlLCAzICogSFosCi0JCQkgICAgdmJs
YW5rX3Bhc3NlZChkcm1fdmJsYW5rX2NvdW50KGRldiwgcGlwZSksCi0JCQkJCSAgcmVxX3NlcSkg
fHwKLQkJCSAgICAhUkVBRF9PTkNFKHZibGFuay0+ZW5hYmxlZCkpOworCQlyZXQgPSB3YWl0X2V2
ZW50X2ludGVycnVwdGlibGVfdGltZW91dCh2YmxhbmstPnF1ZXVlLAorCQkJdmJsYW5rX3Bhc3Nl
ZChkcm1fdmJsYW5rX2NvdW50KGRldiwgcGlwZSksIHJlcV9zZXEpIHx8CisJCQkJICAgICAgIVJF
QURfT05DRSh2YmxhbmstPmVuYWJsZWQpLAorCQkJbXNlY3NfdG9famlmZmllcygzMDAwKSk7CiAJ
fQogCi0JaWYgKHJldCAhPSAtRUlOVFIpIHsKKwlzd2l0Y2ggKHJldCkgeworCWNhc2UgMDoKKwkJ
LyogdGltZW91dCAqLworCQlyZXQgPSAtRUJVU1k7CiAJCWRybV93YWl0X3ZibGFua19yZXBseShk
ZXYsIHBpcGUsICZ2Ymx3YWl0LT5yZXBseSk7Ci0KLQkJRFJNX0RFQlVHKCJjcnRjICVkIHJldHVy
bmluZyAldSB0byBjbGllbnRcbiIsCisJCURSTV9ERUJVRygidGltZW91dCB3YWl0aW5nIGZvciB2
YmxhbmsuIGNydGMgJWQgcmV0dXJuaW5nICV1IHRvIGNsaWVudFxuIiwKIAkJCSAgcGlwZSwgdmJs
d2FpdC0+cmVwbHkuc2VxdWVuY2UpOwotCX0gZWxzZSB7CisJCWJyZWFrOworCWNhc2UgLUVSRVNU
QVJUU1lTOgorCQkvKiBpbnRlcnJ1cHRlZCBieSBzaWduYWwgKi8KKwkJcmV0ID0gLUVJTlRSOwog
CQlEUk1fREVCVUcoImNydGMgJWQgdmJsYW5rIHdhaXQgaW50ZXJydXB0ZWQgYnkgc2lnbmFsXG4i
LCBwaXBlKTsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJcmV0ID0gMDsKKwkJZHJtX3dhaXRfdmJs
YW5rX3JlcGx5KGRldiwgcGlwZSwgJnZibHdhaXQtPnJlcGx5KTsKKwkJRFJNX0RFQlVHKCJjcnRj
ICVkIHJldHVybmluZyAldSB0byBjbGllbnRcbiIsCisJCQkgIHBpcGUsIHZibHdhaXQtPnJlcGx5
LnNlcXVlbmNlKTsKKwkJYnJlYWs7CiAJfQogCiBkb25lOgotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
