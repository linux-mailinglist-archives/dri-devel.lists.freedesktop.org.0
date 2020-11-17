Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0012B6C66
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 18:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B9689316;
	Tue, 17 Nov 2020 17:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A05C89316
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 17:56:39 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id p12so25288643ljc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 09:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r5g1xro3gzMR8larnd5g0CHs85zOBMrU8NxGzGkTUpQ=;
 b=T54lFKh/HBiMQ3dcAseNVF6K75gKizraekbL3FbuvF0IyjGOEyjZDXs3qsveowGzbS
 efVh7Z+2ozNcccq/fmygkmUmXbbC/a/wXwDFoeTMFNCqYHGEo2utFHJVUV/axJ33xvI8
 NwR2ig29KZXHTb93GrCHWOLkFrx2AviOGSDM6t3tRghuAFUoiQcFZ1bI8DwwLAbWBZ08
 Djna/YdxHj0ns+cW2A2mcgPD9yXy5QJnTWmvKzGpdZLzGyfh51Ga1yphNXV288xoT/D0
 EmJimopwQ44Bl74n51OplRbOtW7bio0K3M/IEGiWmbgyRxo47IojNtjd959kbv4y/3dT
 RxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r5g1xro3gzMR8larnd5g0CHs85zOBMrU8NxGzGkTUpQ=;
 b=My3dzHZRy50Hr0kh/JKPwUwoVuWtKXNkOK30jnhXXasLbxe7DMTBoio5BvqBNuipX0
 UJgAPjm+D8nVHGm4ppF8XRVsF6S7IWFCQdaVccgxGiPAcIFiQRSry9VfOc/QGXTohrTA
 /Va/EYF8bv0syM2MLcWpz2R/H8cqvzeOAspVm4O+sUOcfSAwkutje6xUve4/4gu6YwA7
 GgDEwnoRxv6uBZCWt9TXG8yzQcoDhXa+xsNexk6I8DdiHHDrQhp02bfsLvmyxXF5NjLU
 DZBRgzdexYgyBNUN7lRw9U7q76riut9YML/uTdZbBVn+BKwJKqBE2ykFsqrMJ17bpXUR
 FTrQ==
X-Gm-Message-State: AOAM533E80BKeCORyPl8JSXSG0RFA0FKmCFY65I/WAFc+xrYWn0PMfQO
 v6hwudUuVld4wveROlMNVZGpRA==
X-Google-Smtp-Source: ABdhPJyJchYhsa7K5OJCd/36AOdkKdj61+wMrL1Or+JgbBW26+EoXTH4jIOxVX9WBcK7mue12AWfVw==
X-Received: by 2002:a2e:b558:: with SMTP id a24mr2210740ljn.328.1605635797758; 
 Tue, 17 Nov 2020 09:56:37 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id m21sm1558631ljh.82.2020.11.17.09.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:56:37 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/panel: s6e63m0: Fix init sequence
Date: Tue, 17 Nov 2020 18:56:21 +0100
Message-Id: <20201117175621.870085-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201117175621.870085-1-linus.walleij@linaro.org>
References: <20201117175621.870085-1-linus.walleij@linaro.org>
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
Cc: Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGluaXQgc2VxdWVuY2UgY29uc2lzdCBvZiBhIG51bWJlciBvZiB1bmtub3duIHNldHRpbmdz
CmZvciB0aGUgZGlzcGxheSBjb250cm9sbGVyLiBUaGlzIHBhdGNoIGFjaGlldmVzIHR3byB0aGlu
Z3M6CgotIEZpeCBhbiBlcnJvciB0aGF0IG11c3QgaGF2ZSBoYXBwZW5lZCB3aGVuIHRoZSBkcml2
ZXIgd2FzCiAgY29udmVydGVkIGZyb20gdGhlIGJhY2tsaWdodCBzdWJzeXN0ZW06IHRoZSAweGI4
CiAgY29uZmlndXJhdGlvbiBjb21tYW5kIHdhcyBsb3N0IGFuZCBhZGRlZCBhcyBhIHRhaWwgdG8K
ICB0aGUgcHJldmlvdXMgY29tbWFuZC4KCi0gVXBkYXRlIHNvbWUgbWlub3Igc2V0dGluZ3MgaW4g
c29tZSBieXRlcyBoZXJlIGFuZCB0aGVyZQogIGFjY29yZGluZyB0byBjaGFuZ2VzIGluIHRoZSBT
YW1zdW5nIEdULUk5MDcwIGFuZAogIFNhbXN1bmcgR1QtUzc3MTAgY29kZSBkdW1wcy4gU2luY2Ug
dHdvIG90aGVyIGRldmljZXMgdXNlCiAgdGhlc2Ugc2V0dGluZ3MgdGhleSBwcm9iYWJseSByZWZs
ZWN0IHRyaW1taW5ncyBsYXRlcgogIGZvdW5kIHRvIGJlIGJldHRlciBmb3IgdGhlIGRpc3BsYXkg
cmF0aGVyIHRoYW4KICBjdXN0b21pemF0aW9ucyBmb3IgdGhlc2UgZGV2aWNlcy4KCkNjOiBTdGVw
aGFuIEdlcmhvbGQgPHN0ZXBoYW5AZ2VyaG9sZC5uZXQ+CkNjOiBQYXdlxYIgQ2htaWVsIDxwYXdl
bC5taWtvbGFqLmNobWllbEBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWog
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtc2Ftc3VuZy1zNmU2M20wLmMgfCAxOCArKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYzbTAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYzbTAuYwppbmRleCAwNDE4ZDZmMTUzMGIuLjZiNGU5
N2JmZDQ2ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNhbXN1bmct
czZlNjNtMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYz
bTAuYwpAQCAtMzk3LDcgKzM5Nyw3IEBAIHN0YXRpYyB2b2lkIHM2ZTYzbTBfaW5pdChzdHJ1Y3Qg
czZlNjNtMCAqY3R4KQogewogCXM2ZTYzbTBfZGNzX3dyaXRlX3NlcV9zdGF0aWMoY3R4LCBNQ1Nf
UEFORUxDVEwsCiAJCQkJICAgICAweDAxLCAweDI3LCAweDI3LCAweDA3LCAweDA3LCAweDU0LCAw
eDlmLAotCQkJCSAgICAgMHg2MywgMHg4NiwgMHgxYSwgMHgzMywgMHgwZCwgMHgwMCwgMHgwMCk7
CisJCQkJICAgICAweDYzLCAweDhmLCAweDFhLCAweDMzLCAweDBkLCAweDAwLCAweDAwKTsKIAog
CXM2ZTYzbTBfZGNzX3dyaXRlX3NlcV9zdGF0aWMoY3R4LCBNQ1NfRElTQ1RMLAogCQkJCSAgICAg
MHgwMiwgMHgwMywgMHgxYywgMHgxMCwgMHgxMCk7CkBAIC00MTMsOSArNDEzLDggQEAgc3RhdGlj
IHZvaWQgczZlNjNtMF9pbml0KHN0cnVjdCBzNmU2M20wICpjdHgpCiAJCQkJICAgICAweDAxKTsK
IAogCXM2ZTYzbTBfZGNzX3dyaXRlX3NlcV9zdGF0aWMoY3R4LCBNQ1NfU1JDQ1RMLAotCQkJCSAg
ICAgMHgwMCwgMHg4YywgMHgwNyk7Ci0JczZlNjNtMF9kY3Nfd3JpdGVfc2VxX3N0YXRpYyhjdHgs
IDB4YjMsCi0JCQkJICAgICAweGMpOworCQkJCSAgICAgMHgwMCwgMHg4ZSwgMHgwNyk7CisJczZl
NjNtMF9kY3Nfd3JpdGVfc2VxX3N0YXRpYyhjdHgsIDB4YjMsIDB4NmMpOwogCiAJczZlNjNtMF9k
Y3Nfd3JpdGVfc2VxX3N0YXRpYyhjdHgsIDB4YjUsCiAJCQkJICAgICAweDJjLCAweDEyLCAweDBj
LCAweDBhLCAweDEwLCAweDBlLCAweDE3LApAQCAtNDM0LDkgKzQzMywxMiBAQCBzdGF0aWMgdm9p
ZCBzNmU2M20wX2luaXQoc3RydWN0IHM2ZTYzbTAgKmN0eCkKIAkJCQkgICAgIDB4MTMsIDB4MWYs
IDB4MWEsIDB4MmEsIDB4MjQsIDB4MWYsIDB4MWIsCiAJCQkJICAgICAweDFhLCAweDE3LCAweDJi
LCAweDI2LCAweDIyLCAweDIwLCAweDNhLAogCQkJCSAgICAgMHgzNCwgMHgzMCwgMHgyYywgMHgy
OSwgMHgyNiwgMHgyNSwgMHgyMywKLQkJCQkgICAgIDB4MjEsIDB4MjAsIDB4MWUsIDB4MWUsIDB4
MDAsIDB4MDAsIDB4MTEsCi0JCQkJICAgICAweDIyLCAweDMzLCAweDQ0LCAweDQ0LCAweDQ0LCAw
eDU1LCAweDU1LAotCQkJCSAgICAgMHg2NiwgMHg2NiwgMHg2NiwgMHg2NiwgMHg2NiwgMHg2Nik7
CisJCQkJICAgICAweDIxLCAweDIwLCAweDFlLCAweDFlKTsKKworCXM2ZTYzbTBfZGNzX3dyaXRl
X3NlcV9zdGF0aWMoY3R4LCAweGI4LAorCQkJCSAgICAgMHgwMCwgMHgwMCwgMHgxMSwgMHgyMiwg
MHgzMywgMHg0NCwgMHg0NCwKKwkJCQkgICAgIDB4NDQsIDB4NTUsIDB4NTUsIDB4NjYsIDB4NjYs
IDB4NjYsIDB4NjYsCisJCQkJICAgICAweDY2LCAweDY2KTsKIAogCXM2ZTYzbTBfZGNzX3dyaXRl
X3NlcV9zdGF0aWMoY3R4LCAweGI5LAogCQkJCSAgICAgMHgyYywgMHgxMiwgMHgwYywgMHgwYSwg
MHgxMCwgMHgwZSwgMHgxNywKQEAgLTQ1Niw3ICs0NTgsNyBAQCBzdGF0aWMgdm9pZCBzNmU2M20w
X2luaXQoc3RydWN0IHM2ZTYzbTAgKmN0eCkKIAkJCQkgICAgIDB4MDAsIDB4MDAsIDB4MDAsIDB4
MDAsIDB4MDAsIDB4MDMsIDB4MDYsCiAJCQkJICAgICAweDA5LCAweDBkLCAweDBmLCAweDEyLCAw
eDE1LCAweDE4KTsKIAotCXM2ZTYzbTBfZGNzX3dyaXRlX3NlcV9zdGF0aWMoY3R4LCAweGIyLAor
CXM2ZTYzbTBfZGNzX3dyaXRlX3NlcV9zdGF0aWMoY3R4LCBNQ1NfVEVNUF9TV0lSRSwKIAkJCQkg
ICAgIDB4MTAsIDB4MTAsIDB4MGIsIDB4MDUpOwogCiAJczZlNjNtMF9kY3Nfd3JpdGVfc2VxX3N0
YXRpYyhjdHgsIE1DU19NSUVDVEwxLAotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
