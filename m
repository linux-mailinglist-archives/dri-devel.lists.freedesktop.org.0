Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E89B9ED01D
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2019 18:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817766E4EA;
	Sat,  2 Nov 2019 17:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB106E4EA;
 Sat,  2 Nov 2019 17:56:50 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a11so12726092wra.6;
 Sat, 02 Nov 2019 10:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nFY1vqzSONgdwE5+azceCzycYUt1l/wUOCKvdJLbIwE=;
 b=um8aX40oETSe0H9yS21LlwofAZ/CgQm3SWG8NJSMFxb2GhH+b0uSDMHsA2AZm4dHV5
 1qi0piZrhcfEb5RuGv4JxGe0ANtYbN3pptvgbD1j9iSHrO6HzdcyN33RZs0gEDp8M7lP
 Me/MvNOvPIElI007U+hx1LsgY9eCebAVaWSoHyPLbBFx6Yhv3uKUuG+yeAKZf2p0hjXj
 q7W4OC3t5wVJEC7+iTOISPQNgy3ah6fXc3P4Tg7DTt4Ao/s5gRSnRWNh0FZ8fy0FrYLh
 Z6UCxM++pfV9ndQB8hWCuWd6f3FoM6xBS/5QjIgG8hymrIwzNtlDETRocaEzSCBYi5P0
 kuPg==
X-Gm-Message-State: APjAAAUn1SbFNGC6Tr+XWlizcW329zlLgh14lDvJpd6207sCR2+lLKEV
 eUPGE5qvlRnyhjgvvpet8lE=
X-Google-Smtp-Source: APXvYqyTBiZYvfTa39s9N+6sTjLpKVJXitd6D44ddHfUz9PxVTxgBDpCrbr5sez8rkJvcruoMq3iww==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr8258412wrw.238.1572717409261; 
 Sat, 02 Nov 2019 10:56:49 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id t29sm23428383wrb.53.2019.11.02.10.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2019 10:56:47 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v2 4/9] drm/nouveau: tegra: Do not try to disable PCI device
Date: Sat,  2 Nov 2019 18:56:32 +0100
Message-Id: <20191102175637.3065-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102175637.3065-1-thierry.reding@gmail.com>
References: <20191102175637.3065-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nFY1vqzSONgdwE5+azceCzycYUt1l/wUOCKvdJLbIwE=;
 b=tw+Jpba8055Bl8J2Hlie89ay0WxADSFMhaavglIxVwMeYCKa98EiG+IJGKD99CGMf8
 MmdBt7wzXf7CCufbUnVkS7Cbp0BDpGuyca+to8s4g0lEZtpDUlOlYdKCC7JbKIB5KE1X
 LS7xWBahzkzEeP9ofB1SwNH0vI0e6trPz2AVeq/1zDoJZF1goHsbSdVjW1XS8f2sxLev
 zEE5jpuvrMBgqmoEBQC/y1HpGo4hlV1njKU6fNkTgH+K7MceB8WxjyzYHRCsP1QMRtdN
 tGhQ+oZciB0MKcL/zYQMsgn0xwUKwpZr5V2A4lcthRicFvIKR+wOTsixgsiq5F4lIt9r
 Z85A==
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
 Ben Dooks <ben.dooks@codethink.co.uk>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCldoZW4gTm91dmVhdSBp
cyBpbnN0YW50aWF0ZWQgb24gdG9wIG9mIGEgcGxhdGZvcm0gZGV2aWNlLCB0aGUgZGV2LT5wZGV2
CmZpZWxkIHdpbGwgYmUgTlVMTCBhbmQgY2FsbGluZyBwY2lfZGlzYWJsZV9kZXZpY2UoKSB3aWxs
IGNyYXNoLiBNb3ZlIHRoZQpQQ0kgZGlzYWJsaW5nIGNvZGUgdG8gdGhlIFBDSSBzcGVjaWZpYyBk
cml2ZXIgcmVtb3ZhbCBjb2RlLgoKUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhh
dC5jb20+ClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYyB8IDMgKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfZHJtLmMKaW5kZXggMmNkODM4NDk2MDBmLi5iNjVhZTgxN2VhYmYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYwpAQCAtNzE1LDcgKzcxNSw2IEBAIHN0
YXRpYyBpbnQgbm91dmVhdV9kcm1fcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCiB2b2lkCiBu
b3V2ZWF1X2RybV9kZXZpY2VfcmVtb3ZlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiB7Ci0Jc3Ry
dWN0IHBjaV9kZXYgKnBkZXYgPSBkZXYtPnBkZXY7CiAJc3RydWN0IG5vdXZlYXVfZHJtICpkcm0g
PSBub3V2ZWF1X2RybShkZXYpOwogCXN0cnVjdCBudmttX2NsaWVudCAqY2xpZW50OwogCXN0cnVj
dCBudmttX2RldmljZSAqZGV2aWNlOwpAQCAtNzI3LDcgKzcyNiw2IEBAIG5vdXZlYXVfZHJtX2Rl
dmljZV9yZW1vdmUoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAlkZXZpY2UgPSBudmttX2Rldmlj
ZV9maW5kKGNsaWVudC0+ZGV2aWNlKTsKIAogCW5vdXZlYXVfZHJtX2RldmljZV9maW5pKGRldik7
Ci0JcGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYpOwogCWRybV9kZXZfcHV0KGRldik7CiAJbnZrbV9k
ZXZpY2VfZGVsKCZkZXZpY2UpOwogfQpAQCAtNzM4LDYgKzczNiw3IEBAIG5vdXZlYXVfZHJtX3Jl
bW92ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gcGNp
X2dldF9kcnZkYXRhKHBkZXYpOwogCiAJbm91dmVhdV9kcm1fZGV2aWNlX3JlbW92ZShkZXYpOwor
CXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsKIH0KIAogc3RhdGljIGludAotLSAKMi4yMy4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
