Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E204B3D36
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 17:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171946E9D1;
	Mon, 16 Sep 2019 15:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5436E9CA;
 Mon, 16 Sep 2019 15:04:36 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id r9so346154edl.10;
 Mon, 16 Sep 2019 08:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ccugY6ClSnbuX7APJroS2mNfHC14XOtjAHCQoqo1l0=;
 b=b+/zu4shdI8clgg6sMpLYOSF17lOL6ws0eu0vxPFQEBFmTfHd5nI7wG2yT9tZ5XoQs
 0mIksqYL2arh1FVXpaRQrO82I2x0zCzpellvDTm6zUD9B1S7JDC2uBMnCLlMuLMMGP9e
 Db+/vOux4ZiNALTaPiFIw4u+h9FSwlpAwDhGJFndJeUiRuV0YQWgZ4tjuMbLSEi+DAF8
 puSfesTuXX0bxVJ7OtB6gsCRzPbtTIEA5ztuCvZGpYGB1HPzrU7HirLJtccE5X9whoqz
 lG+2RriXX+C5VBIt8EfJwvD+yXKAEO+3rdv2TR+yifdV1DgMMLI2KBElrJ0cdh8rYIPo
 rcQg==
X-Gm-Message-State: APjAAAVplo1Cz5VyaoJsOsongsO7MSLOoQR3YyNl7lHI1OkHEiG0oHwa
 wnFUrksBx0ly3GJfrvRtnRE=
X-Google-Smtp-Source: APXvYqzWp5v8wABQQuXME4pRri+jmpw25ohBKUxrL9wKEhSeykouiUN4nTbccXTpL4h81AdC9KnLrg==
X-Received: by 2002:aa7:c71a:: with SMTP id i26mr4215857edq.68.1568646274381; 
 Mon, 16 Sep 2019 08:04:34 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id n12sm598159edi.1.2019.09.16.08.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 08:04:33 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 08/11] drm/nouveau: tegra: Skip IOMMU initialization if
 already attached
Date: Mon, 16 Sep 2019 17:04:09 +0200
Message-Id: <20190916150412.10025-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916150412.10025-1-thierry.reding@gmail.com>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ccugY6ClSnbuX7APJroS2mNfHC14XOtjAHCQoqo1l0=;
 b=rqrXASqqg0Wt2ElZbDzwn9YUA12fnkmFRR5RjTH92TD/4WMMnpGAlmyZLDrPlmwrPp
 VSN0VbGB+dfg1H7dtDuzpKTaxJFQ/LtK0k3Z+RBmthUHsjOdbVMDrQBpNHwSAfBTUm5r
 Tk8YIV/5E3XZprWXihHmVx0htM0mUVLVZjvQEoFQC07t2/YJTcJQkwPl7EdvWOkBgqnn
 z3ZxWIzmhUkC40om417QMynb6dV6HLBRzeG4MP/Z0II+ra/iNu34csozVX/ymJxNmegP
 3PmSZdtOa4HJXJSCWqdbX/PejXhWHdj+SkUepfCKYRpj8FQ+4tZ1ss51ZTNIVEr1CIpf
 cGMA==
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCklmIHRoZSBHUFUgaXMg
YWxyZWFkeSBhdHRhY2hlZCB0byBhbiBJT01NVSwgZG9uJ3QgZGV0YWNoIGl0IGFuZCBzZXR1cCBh
bgpleHBsaWNpdCBJT01NVSBkb21haW4uIFNpbmNlIE5vdXZlYXUgY2FuIG5vdyBwcm9wZXJseSBo
YW5kbGUgdGhlIGNhc2Ugb2YKdGhlIERNQSBBUEkgYmVpbmcgYmFja2VkIGJ5IGFuIElPTU1VLCBq
dXN0IGNvbnRpbnVlIHVzaW5nIHRoZSBETUEgQVBJLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBS
ZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiAuLi4vZHJtL25vdXZlYXUvbnZrbS9lbmdp
bmUvZGV2aWNlL3RlZ3JhLmMgICAgfCAxOSArKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kZXZpY2UvdGVncmEuYyBiL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2RldmljZS90ZWdyYS5jCmluZGV4IGQwZDUyYzFk
NGFlZS4uZmM2NTJhYWE0MWM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmttL2VuZ2luZS9kZXZpY2UvdGVncmEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmttL2VuZ2luZS9kZXZpY2UvdGVncmEuYwpAQCAtMjMsMTAgKzIzLDYgQEAKICNpZmRlZiBDT05G
SUdfTk9VVkVBVV9QTEFURk9STV9EUklWRVIKICNpbmNsdWRlICJwcml2LmgiCiAKLSNpZiBJU19F
TkFCTEVEKENPTkZJR19BUk1fRE1BX1VTRV9JT01NVSkKLSNpbmNsdWRlIDxhc20vZG1hLWlvbW11
Lmg+Ci0jZW5kaWYKLQogc3RhdGljIGludAogbnZrbV9kZXZpY2VfdGVncmFfcG93ZXJfdXAoc3Ry
dWN0IG52a21fZGV2aWNlX3RlZ3JhICp0ZGV2KQogewpAQCAtMTA5LDE0ICsxMDUsMTMgQEAgbnZr
bV9kZXZpY2VfdGVncmFfcHJvYmVfaW9tbXUoc3RydWN0IG52a21fZGV2aWNlX3RlZ3JhICp0ZGV2
KQogCXVuc2lnbmVkIGxvbmcgcGdzaXplX2JpdG1hcDsKIAlpbnQgcmV0OwogCi0jaWYgSVNfRU5B
QkxFRChDT05GSUdfQVJNX0RNQV9VU0VfSU9NTVUpCi0JaWYgKGRldi0+YXJjaGRhdGEubWFwcGlu
ZykgewotCQlzdHJ1Y3QgZG1hX2lvbW11X21hcHBpbmcgKm1hcHBpbmcgPSB0b19kbWFfaW9tbXVf
bWFwcGluZyhkZXYpOwotCi0JCWFybV9pb21tdV9kZXRhY2hfZGV2aWNlKGRldik7Ci0JCWFybV9p
b21tdV9yZWxlYXNlX21hcHBpbmcobWFwcGluZyk7Ci0JfQotI2VuZGlmCisJLyoKKwkgKiBTa2lw
IGV4cGxpY2l0IElPTU1VIGluaXRpYWxpemF0aW9uIGlmIHRoZSBHUFUgaXMgYWxyZWFkeSBhdHRh
Y2hlZAorCSAqIHRvIGFuIElPTU1VIGRvbWFpbi4gVGhpcyBjYW4gaGFwcGVuIGlmIHRoZSBETUEg
QVBJIGlzIGJhY2tlZCBieSBhbgorCSAqIElPTU1VLgorCSAqLworCWlmIChpb21tdV9nZXRfZG9t
YWluX2Zvcl9kZXYoZGV2KSkKKwkJcmV0dXJuOwogCiAJaWYgKCF0ZGV2LT5mdW5jLT5pb21tdV9i
aXQpCiAJCXJldHVybjsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
