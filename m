Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A8B265D6
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB9089AB2;
	Wed, 22 May 2019 14:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA88189971
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 18:47:09 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t5so6312097wmh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 11:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8viNroRA5goE0iPj/ap53EgAXBGfEQtlqx5YkjMMp0=;
 b=hkGNEMS1tCzFuxX3872z8t5ROoKX12k31/TGTPMVN2KSyJTYGxCT4gd06vkKNGxaOv
 ducIVo6cjTRGs0WgIrW+M1KgKtoxBk9/uk1vsxSUp1ouMCacun0meuR2TkPuecpNnivN
 lBnQ2TwXBqrBpD8a80BXHaH9WaA6esSFl9UGRZhwdplpC2yVEcRN43m87i+2ZPX2eyYK
 DX4/iN1L3er3/ugMaT/4b3gD3hDxcRoyMCVEj5ch4wjnrGHhO/THyMu1a6V/R7QHd5Pk
 LdK7eLA5+6vsZIOPE1NVRL4X1ot/dIbUBOGYhloA+hTF4S6c8xyVpcPywCJpZ2tGMPw2
 jGDw==
X-Gm-Message-State: APjAAAW55p16+KGvCxDflMVHImkBgEsebsTJSYabMW0GCTq+OMopn3ne
 SsQjvf5Sg98kmfSRRGZqKg7n/OXYsTnzzw==
X-Google-Smtp-Source: APXvYqx5WYQ+/UFX3j4mg5Ayc/w6LeLH6Wy8mGmkZ59Hw5REOLqHmfti245ovfZ/JrzJoGg3/ubYNA==
X-Received: by 2002:a1c:7c0d:: with SMTP id x13mr3111380wmc.89.1558118828555; 
 Fri, 17 May 2019 11:47:08 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id v20sm5801112wmj.10.2019.05.17.11.47.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 May 2019 11:47:07 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH v5 2/6] iommu: io-pgtable: fix sanity check for non 48-bit
 mali iommu
Date: Fri, 17 May 2019 20:46:55 +0200
Message-Id: <20190517184659.18828-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517184659.18828-1-peron.clem@gmail.com>
References: <20190517184659.18828-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r8viNroRA5goE0iPj/ap53EgAXBGfEQtlqx5YkjMMp0=;
 b=sYa1xSeqBijyACT713JrcPfeJ6i1pId1XJ8eV7bYFwQOvCKVI9hU6X6rsi5VoYuOYt
 0D2cTJcpZWhDRkgW3lFeqzAiU5xxh8pXYkjduO+E3yB4kURp14tlb4FYguNJ6mVXxr/o
 7sNEuSmlziet3wBZ3p1LC4/4XDskX8RjgeFVzrsZZncbZNeV30kdefMoGz1GhCiM5MVN
 77LwiSFwRps5gRv+r0TY4n6TYH1qIYzplYaT0WGD17Sd2DddZ0Ra8tJkdfzHukxZ9Emq
 OxPUS2T4geuoPK9oiBP1tfS0VhtC7+6ZAjb7E2YjmdJZy2Hapy3h2XjQMFiCW1W0RPGZ
 OXDw==
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsd2lubmVyIEg2IFNvQyBoYXMgYSBNYWxpIFQ3MjBNUDIgd2l0aCBhIDMzLWJpdCBpb21tdSB3
aGljaAp0cmlnIHRoZSBzYW5pdHkgY2hlY2sgZHVyaW5nIHRoZSBhbGxvYyBvZiB0aGUgcGd0YWJs
ZS4KCkNoYW5nZSB0aGUgc2FuaXR5IGNoZWNrIHRvIGFsbG93IG5vbiA0OC1iaXQgY29uZmlndXJh
dGlvbi4KClN1Z2dlc3RlZC1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4K
U2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KLS0t
CiBkcml2ZXJzL2lvbW11L2lvLXBndGFibGUtYXJtLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11
L2lvLXBndGFibGUtYXJtLmMgYi9kcml2ZXJzL2lvbW11L2lvLXBndGFibGUtYXJtLmMKaW5kZXgg
NGUyMWVmYmM0NDU5Li43NGYyY2U4MDJlNmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW9tbXUvaW8t
cGd0YWJsZS1hcm0uYworKysgYi9kcml2ZXJzL2lvbW11L2lvLXBndGFibGUtYXJtLmMKQEAgLTEw
MTYsNyArMTAxNiw3IEBAIGFybV9tYWxpX2xwYWVfYWxsb2NfcGd0YWJsZShzdHJ1Y3QgaW9fcGd0
YWJsZV9jZmcgKmNmZywgdm9pZCAqY29va2llKQogewogCXN0cnVjdCBpb19wZ3RhYmxlICppb3A7
CiAKLQlpZiAoY2ZnLT5pYXMgIT0gNDggfHwgY2ZnLT5vYXMgPiA0MCkKKwlpZiAoY2ZnLT5pYXMg
PiA0OCB8fCBjZmctPm9hcyA+IDQwKQogCQlyZXR1cm4gTlVMTDsKIAogCWNmZy0+cGdzaXplX2Jp
dG1hcCAmPSAoU1pfNEsgfCBTWl8yTSB8IFNaXzFHKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
