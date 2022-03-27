Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 944F04E86BE
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 09:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D6D10E028;
	Sun, 27 Mar 2022 07:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBDE10E028;
 Sun, 27 Mar 2022 07:58:37 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 o68-20020a17090a0a4a00b001c686a48263so9757544pjo.1; 
 Sun, 27 Mar 2022 00:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=UT8NRfVPaniG62r1LWTa4ALoqhuyMOXc7nycNB8eTOA=;
 b=IiWm+MaVGSQWcTvPQHJw9oeiSuEafCApIsYcgLT9PcPKaKjO5U0l46UqswBFE7S4FM
 pTuWRpmyp/QUprWVEaZHaKqExU+zPaHnFcNINrjNWUbjef38YetTqjFCz3QeIwUxuaTg
 1Xlga1UqkyoFt+H0OQUp8Gdzw3HtqU5IGQl8Try+03ohb9NQqB4Nm4vG8F1lXCJQDOE0
 WFwxJ5taH2lOSTknX0C0Fvl8XXo7ueYxTyfUTDjtHqmKLsj3kPgyefk7soFmVO47vhH4
 RugDLjc6whGtUDvAkwhBQIIJN4CJv2D11lF/OjFdivACDcK8vMk1hReH4AsLSPA3+RDz
 LVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UT8NRfVPaniG62r1LWTa4ALoqhuyMOXc7nycNB8eTOA=;
 b=WHZI5rWG5Ip5N9U4CbGgxm1rdV/PExBdHBhBHB6Ajg7YIqDm4PIit92OhpdylO5Mcw
 KQSQO0YfvYzXRJpvgky82w17i4735TkvEdPKzZAYxYOflyAp/YdiujdKg0nABCm27L6H
 6xK3YyaU0eYQWa7pZFhGEct6BOonbK+JcureFRica5xDzL3adBxPeTnAM1RssX/DYgCV
 V1nPOVNIAsD3KbzTMMNjH7oVKlShHWmTvESBCo22CJKZJZGk211dcj2NNgsgzH2aVmNK
 WpsRaTDESmoG6C/6hX2gG2oKpTPZjdC1AXAQ6pmPSEdkKKnIgNmA8NeP4k1XQVK3Pp6Y
 Sv6w==
X-Gm-Message-State: AOAM532A1u+tPZ2dmVH2/KX2Jg3azncSF+jjeK4vOL8qKPwQjkrT1ImO
 eK9D6w+RW9e5gYNltYZL4s4=
X-Google-Smtp-Source: ABdhPJyhzeqXeHB5NEFBpmEy8HKFAwwTzpPRxKd7M8ALdpLmqrObhT2u1f8FqSk0MuM5Zd5KZoyd6Q==
X-Received: by 2002:a17:90b:17c5:b0:1c6:3639:7daf with SMTP id
 me5-20020a17090b17c500b001c636397dafmr22491743pjb.105.1648367917077; 
 Sun, 27 Mar 2022 00:58:37 -0700 (PDT)
Received: from localhost ([115.220.243.108]) by smtp.gmail.com with ESMTPSA id
 d8-20020a056a00198800b004fab740dbe6sm11846197pfl.15.2022.03.27.00.58.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 27 Mar 2022 00:58:36 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] clk: base: fix an incorrect NULL check on list iterator
Date: Sun, 27 Mar 2022 15:58:24 +0800
Message-Id: <20220327075824.11806-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bug is here:
	if (nvkm_cstate_valid(clk, cstate, max_volt, clk->temp))
		return cstate;

The list iterator value 'cstate' will *always* be set and non-NULL
by list_for_each_entry_from_reverse(), so it is incorrect to assume
that the iterator value will be unchanged if the list is empty or no
element is found (In fact, it will be a bogus pointer to an invalid
structure object containing the HEAD). Also it missed a NULL check
at callsite and may lead to invalid memory access after that.

To fix this bug, just return 'encoder' when found, otherwise return
NULL. And add the NULL check.

Cc: stable@vger.kernel.org
Fixes: 1f7f3d91ad38a ("drm/nouveau/clk: Respect voltage limits in nvkm_cstate_prog")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
index 57199be082fd..c2b5cc5f97ed 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -135,10 +135,10 @@ nvkm_cstate_find_best(struct nvkm_clk *clk, struct nvkm_pstate *pstate,
 
 	list_for_each_entry_from_reverse(cstate, &pstate->list, head) {
 		if (nvkm_cstate_valid(clk, cstate, max_volt, clk->temp))
-			break;
+			return cstate;
 	}
 
-	return cstate;
+	return NULL;
 }
 
 static struct nvkm_cstate *
@@ -169,6 +169,8 @@ nvkm_cstate_prog(struct nvkm_clk *clk, struct nvkm_pstate *pstate, int cstatei)
 	if (!list_empty(&pstate->list)) {
 		cstate = nvkm_cstate_get(clk, pstate, cstatei);
 		cstate = nvkm_cstate_find_best(clk, pstate, cstate);
+		if (!cstate)
+			return -EINVAL;
 	} else {
 		cstate = &pstate->base;
 	}
-- 
2.17.1

