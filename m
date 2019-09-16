Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4228DB3CAA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 16:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F13A6E9A4;
	Mon, 16 Sep 2019 14:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1064F6E9A4;
 Mon, 16 Sep 2019 14:36:12 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id c4so312810edl.0;
 Mon, 16 Sep 2019 07:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qgjBNJZO9oVOXycGs4KaN9N5oGLDclPQLzdzyg38Kgs=;
 b=tcI636BW8SFLpu1PjbrAplIWbIkkwAmKsLrYOGCizaY56/orGU2z0SS1cuSssZ/fGz
 uET9mv/7OsG4+xTAhOh/Nt6tyiyi5pcwR9NEQgJeMk+MphO+CP6bSyartCMd7grBrqjk
 xvdB6B3fj47t3mBWDDm0o1K9SEsXLFEfmJgH0Yw/kC2rrH7WK4PjWiRiU+ZAgsITqj7e
 kdu8qbNTUIxq6kGHmUUaGl7my5D4z9CeY79ugeU9P/FDr+mc3FxkbhAetBgOdjjY6f9K
 xka5eR/USCv43SXHg+y3krz69fLGaLez4xRt6rY1prBg+378skXGcKjQ9sHHk6/vOwl8
 RBSQ==
X-Gm-Message-State: APjAAAUrRuTeTRnMElxw4D0TXWzWoCBcEAR7kgkoik0acYdtlPEF0VQB
 sKJTZILszkrToX8YgymHmvhO3k/R
X-Google-Smtp-Source: APXvYqxZKSTHS5xUaf2NYCTyizrADVRSTgL4u+k4Bss5uRdj982100Gv3VhswrsRjHA1Y0gtlISSLw==
X-Received: by 2002:a50:e614:: with SMTP id y20mr41519729edm.276.1568644570593; 
 Mon, 16 Sep 2019 07:36:10 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id r18sm7244562edl.6.2019.09.16.07.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 07:36:09 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 1/2] drm/nouveau: tegra: Fix NULL pointer dereference
Date: Mon, 16 Sep 2019 16:36:05 +0200
Message-Id: <20190916143606.9272-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916143606.9272-1-thierry.reding@gmail.com>
References: <20190916143606.9272-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qgjBNJZO9oVOXycGs4KaN9N5oGLDclPQLzdzyg38Kgs=;
 b=VbBQy7pHrugrnHif+/4StsOWeGIx6KLjSxCMjmVwjnLn44safb3eOAmTT3c44nY66h
 JrQHSyfffnfBjrNBEs1+5tMGO0aVI5qNSiSyvpeMNjY7p8EOykYILLrLU7yCqtb1lJ0A
 XpiubgkUZYDIdqdPoQRYdt2pdPxL49FpdejuVkzLnnYWcHJVyWOytV3XGfTsnXUuFQHL
 yX8Q2UiBIscCID6EQ9bMEvw3tKP3X1zPYGBd938XR75km9HHA++0G3MaO6WBcbypU7f5
 RooMsZm3p752WVXQmdA0EkfHfmi/U+NhbaNeBIcw1SCuvdl5UsI3XH3eZSz+uVxSWKhh
 UBeQ==
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkZpbGwgaW4gQkFSMiBj
YWxsYmFja3MgZm9yIGluc3RhbmNlIG1lbW9yeS4gVGhlcmUncyBubyBCQVIyIG9uIFRlZ3JhCkdQ
VXMsIGJ1dCBidWZmZXJzIGFyZSBhbGwgaW4gc3lzdGVtIG1lbW9yeSBhbnl3YXksIHNvIGp1c3Qg
cmV0dXJuIHRoZQpwbGFpbiBhZGRyZXNzLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcg
PHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiAuLi4vZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvaW5z
dG1lbS9nazIwYS5jICAgfCAzMCArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MzAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252
a20vc3ViZGV2L2luc3RtZW0vZ2syMGEuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20v
c3ViZGV2L2luc3RtZW0vZ2syMGEuYwppbmRleCA5ODVmMjk5MGFiMGQuLmIwNDkzZjhkZjFmZSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvaW5zdG1lbS9n
azIwYS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2luc3RtZW0v
Z2syMGEuYwpAQCAtMjYxLDYgKzI2MSwzNCBAQCBnazIwYV9pbnN0b2JqX3JlbGVhc2VfaW9tbXUo
c3RydWN0IG52a21fbWVtb3J5ICptZW1vcnkpCiAJbnZrbV9sdGNfaW52YWxpZGF0ZShsdGMpOwog
fQogCitzdGF0aWMgdTY0CitnazIwYV9pbnN0b2JqX2JhcjJfZG1hKHN0cnVjdCBudmttX21lbW9y
eSAqbWVtb3J5KQoreworCXN0cnVjdCBnazIwYV9pbnN0b2JqX2RtYSAqaW9iaiA9IGdrMjBhX2lu
c3RvYmpfZG1hKG1lbW9yeSk7CisJdTY0IGFkZHIgPSB+MFVMTDsKKworCWlmIChnazIwYV9pbnN0
b2JqX2FjcXVpcmVfZG1hKCZpb2JqLT5iYXNlLm1lbW9yeSkpCisJCWFkZHIgPSBnazIwYV9pbnN0
b2JqX2FkZHIoJmlvYmotPmJhc2UubWVtb3J5KTsKKworCWdrMjBhX2luc3RvYmpfcmVsZWFzZV9k
bWEoJmlvYmotPmJhc2UubWVtb3J5KTsKKworCXJldHVybiBhZGRyOworfQorCitzdGF0aWMgdTY0
CitnazIwYV9pbnN0b2JqX2JhcjJfaW9tbXUoc3RydWN0IG52a21fbWVtb3J5ICptZW1vcnkpCit7
CisJc3RydWN0IGdrMjBhX2luc3RvYmpfaW9tbXUgKmlvYmogPSBnazIwYV9pbnN0b2JqX2lvbW11
KG1lbW9yeSk7CisJdTY0IGFkZHIgPSB+MFVMTDsKKworCWlmIChnazIwYV9pbnN0b2JqX2FjcXVp
cmVfaW9tbXUoJmlvYmotPmJhc2UubWVtb3J5KSkKKwkJYWRkciA9IGdrMjBhX2luc3RvYmpfYWRk
cigmaW9iai0+YmFzZS5tZW1vcnkpOworCisJZ2syMGFfaW5zdG9ial9yZWxlYXNlX2lvbW11KCZp
b2JqLT5iYXNlLm1lbW9yeSk7CisKKwlyZXR1cm4gYWRkcjsKK30KKwogc3RhdGljIHUzMgogZ2sy
MGFfaW5zdG9ial9yZDMyKHN0cnVjdCBudmttX21lbW9yeSAqbWVtb3J5LCB1NjQgb2Zmc2V0KQog
ewpAQCAtMzUzLDYgKzM4MSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbnZrbV9tZW1vcnlfZnVu
YwogZ2syMGFfaW5zdG9ial9mdW5jX2RtYSA9IHsKIAkuZHRvciA9IGdrMjBhX2luc3RvYmpfZHRv
cl9kbWEsCiAJLnRhcmdldCA9IGdrMjBhX2luc3RvYmpfdGFyZ2V0LAorCS5iYXIyID0gZ2syMGFf
aW5zdG9ial9iYXIyX2RtYSwKIAkucGFnZSA9IGdrMjBhX2luc3RvYmpfcGFnZSwKIAkuYWRkciA9
IGdrMjBhX2luc3RvYmpfYWRkciwKIAkuc2l6ZSA9IGdrMjBhX2luc3RvYmpfc2l6ZSwKQEAgLTM2
NSw2ICszOTQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG52a21fbWVtb3J5X2Z1bmMKIGdrMjBh
X2luc3RvYmpfZnVuY19pb21tdSA9IHsKIAkuZHRvciA9IGdrMjBhX2luc3RvYmpfZHRvcl9pb21t
dSwKIAkudGFyZ2V0ID0gZ2syMGFfaW5zdG9ial90YXJnZXQsCisJLmJhcjIgPSBnazIwYV9pbnN0
b2JqX2JhcjJfaW9tbXUsCiAJLnBhZ2UgPSBnazIwYV9pbnN0b2JqX3BhZ2UsCiAJLmFkZHIgPSBn
azIwYV9pbnN0b2JqX2FkZHIsCiAJLnNpemUgPSBnazIwYV9pbnN0b2JqX3NpemUsCi0tIAoyLjIz
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
