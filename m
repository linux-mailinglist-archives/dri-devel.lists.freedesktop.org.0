Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7B4ED023
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2019 18:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC73E6E50C;
	Sat,  2 Nov 2019 17:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECE66E4F4;
 Sat,  2 Nov 2019 17:56:55 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o28so12718461wro.7;
 Sat, 02 Nov 2019 10:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n1tTzvYM5w9+u5hVDlIZGuSZUZEgZbCTm+ltdJcT/B4=;
 b=HCZqsNT4y4kwYnUGR1VhbSiWM/i1SCs0sqsKv2+6CpUIBn6PHJIBk8SVroBVmo2E62
 hRzAmsTOmlYzq8UCgPuaANd5m81txcqgAoebxfX9Q7YrR+1PPQY8z0CAjU1CFiMiga/9
 wJpnvOp0f/XqWx8UfoAgb3fykaO/s9EKWWfBTxzMhDWKJ6e2fKvB1fvb92NJdHDRUy5r
 6YVgywzmiBrxrOF6XHZhrchGAwluIYrzPhJvr4q5IE1eAdF6KgO2Hgto1Wjz8SVSX6LJ
 ukbI3Ef9FP0Wdu7k7ggE4GWR5INjaJjUu3a4tpZbRILno3ALFBM50ACf+l2qmQHeHrLs
 VsNg==
X-Gm-Message-State: APjAAAXpoSaPJG5PsvUyq0kODyYV0YlXhahfbFXmwipGFX777uAJECjN
 TpyWy5lrNjUmRfCeSIaRRqkXHkVe
X-Google-Smtp-Source: APXvYqwbnnYZXrTkrBOfrjQ8/OumIiqq2aGuleKDeqHVq/H+Li2Ivc5XBEpeNlbKG3RfHNpeD83iPA==
X-Received: by 2002:a5d:4612:: with SMTP id t18mr15317254wrq.255.1572717414013; 
 Sat, 02 Nov 2019 10:56:54 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id f13sm10800339wrq.96.2019.11.02.10.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2019 10:56:52 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v2 6/9] drm/nouveau: tegra: Set clock rate if not set
Date: Sat,  2 Nov 2019 18:56:34 +0100
Message-Id: <20191102175637.3065-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102175637.3065-1-thierry.reding@gmail.com>
References: <20191102175637.3065-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n1tTzvYM5w9+u5hVDlIZGuSZUZEgZbCTm+ltdJcT/B4=;
 b=Ez9eNqz/Ef4W+g9pbhwhmvBdXpT7gFPFmbgzwdZhMJ7WrkBziKZDOmzPtdKCI9Rewx
 j9zCBqE17D73D3xYZtyK9viD4VvW06H6nyqCEvDOM02OdtjuADd8Hr8Vn2mdamZwUkVK
 XmMej0sSChRRHMjAlTIjGXhHyuK3WiCvOyIbjrJB8j93m6r0ikiISpd1MrWAgytgaBMQ
 BmRt0oDiRbXYhi08tyPE+glhQRK+TyoRSCqyCpm8WC5utejvQYk+OTtla69byetV3Vkb
 KSkQ7jZRGNWPTFdH6cyCs/CAQV38NLV0E0lYd7CIAyAF0q9ZPUVNlkFRjSsGJz6apEfl
 lCzA==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCklmIHRoZSBHUFUgY2xv
Y2sgaGFzIG5vdCBoYWQgYSByYXRlIHNldCwgaW5pdGlhbGl6ZSBpdCB0byB0aGUgbWF4aW11bQpj
bG9jayByYXRlIHRvIG1ha2Ugc3VyZSBpdCBkb2VzIHJ1bi4KClNpZ25lZC1vZmYtYnk6IFRoaWVy
cnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbnZrbS9lbmdpbmUvZGV2aWNlL3RlZ3JhLmMgfCAxMiArKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNlL3RlZ3JhLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9udmttL2VuZ2luZS9kZXZpY2UvdGVncmEuYwppbmRleCA3NDdhNzc1MTIxY2YuLmQwZDUyYzFk
NGFlZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2
aWNlL3RlZ3JhLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2
aWNlL3RlZ3JhLmMKQEAgLTI3OSw2ICsyNzksNyBAQCBudmttX2RldmljZV90ZWdyYV9uZXcoY29u
c3Qgc3RydWN0IG52a21fZGV2aWNlX3RlZ3JhX2Z1bmMgKmZ1bmMsCiAJCSAgICAgIHN0cnVjdCBu
dmttX2RldmljZSAqKnBkZXZpY2UpCiB7CiAJc3RydWN0IG52a21fZGV2aWNlX3RlZ3JhICp0ZGV2
OworCXVuc2lnbmVkIGxvbmcgcmF0ZTsKIAlpbnQgcmV0OwogCiAJaWYgKCEodGRldiA9IGt6YWxs
b2Moc2l6ZW9mKCp0ZGV2KSwgR0ZQX0tFUk5FTCkpKQpAQCAtMzA3LDYgKzMwOCwxNyBAQCBudmtt
X2RldmljZV90ZWdyYV9uZXcoY29uc3Qgc3RydWN0IG52a21fZGV2aWNlX3RlZ3JhX2Z1bmMgKmZ1
bmMsCiAJCWdvdG8gZnJlZTsKIAl9CiAKKwlyYXRlID0gY2xrX2dldF9yYXRlKHRkZXYtPmNsayk7
CisJaWYgKHJhdGUgPT0gMCkgeworCQlyZXQgPSBjbGtfc2V0X3JhdGUodGRldi0+Y2xrLCBVTE9O
R19NQVgpOworCQlpZiAocmV0IDwgMCkKKwkJCWdvdG8gZnJlZTsKKworCQlyYXRlID0gY2xrX2dl
dF9yYXRlKHRkZXYtPmNsayk7CisKKwkJZGV2X2RiZygmcGRldi0+ZGV2LCAiR1BVIGNsb2NrIHNl
dCB0byAlbHVcbiIsIHJhdGUpOworCX0KKwogCWlmIChmdW5jLT5yZXF1aXJlX3JlZl9jbGspCiAJ
CXRkZXYtPmNsa19yZWYgPSBkZXZtX2Nsa19nZXQoJnBkZXYtPmRldiwgInJlZiIpOwogCWlmIChJ
U19FUlIodGRldi0+Y2xrX3JlZikpIHsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
