Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AACF6A7C4D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 09:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B579010E3B4;
	Thu,  2 Mar 2023 08:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5907F10E1CE;
 Wed,  1 Mar 2023 17:25:46 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id o12so56832984edb.9;
 Wed, 01 Mar 2023 09:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PGpSg9k17aWT56J8ESLMcQ9AizPFi87Eiw+yaS3AOCw=;
 b=n8zWH/MlMMgN27wnO6J2y/HeI0n1+Rmr0p3ClSf5D5f+RJi502iMbPPq7mCwFIbxew
 75m/Z6GIKizq6q3G1Ky0qivM27oMW5BRrRAUFauFSB6MXC4x5FrzVsqrO2qXXwH6v8CF
 P4F1e+SOu3aIkJqh6zJ607IWae8A7fgNYw3bfKo/yII5XFchV70BE6cEy2CB+pEaIF/Y
 yipyrGmZl2ox9D5racFirklUAuAneGOwEzuaJPGp7/n1dGltVbcC1Iu0Qlld/GhKLJtS
 d/Mxj3qxFXvF3RNvQKQ5ZEUiy2i1VFN/CibE50hE+v+YLfbpGdXWQtOR9cJ/DVIebms+
 gntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PGpSg9k17aWT56J8ESLMcQ9AizPFi87Eiw+yaS3AOCw=;
 b=utALeVDfjV6aNYB2cdOglVkVp8QwmCrGvppFAC8xtqhJhXMaL4I/N7d92RjvnO5TKC
 rv52fJNiFbxyzVb9bu1Dm2fagctoqVh7HZqgq2Rr0DXpadiBKfHX37I/LFHszijPmfvW
 O2J7ik9k2ZpmXhYW+hnX94pVuEcZ9jqPDc4X0rshgrg2v9cedh8BylrxHPji27F7DyKt
 nkHYXhNYcYK/3yLrP9HsJtEN/W8DB6SH+WptuO+eaxCMcLrPIQBfev2KRTdOXwi62/fF
 I4wf2sNiAKPPTs39BultoMLfK3BHVmoal9fU+wGHQzItQn8NDAXIj0tAZf40UiqilOZL
 B3Vw==
X-Gm-Message-State: AO0yUKVAON6doFaJZiUDDbu7oy8yKf7IoqmQOkJa+dJPhOQ6ZeDCsxyy
 VkpsKSbHPvyFcHw6N8O/2+4=
X-Google-Smtp-Source: AK7set/RdNqzJLsFGCwGBU2hCZ6jT/oewFdddt3HHcP8VqmlvRUBJv04SfeD9uvvD6LZ7BxXIR0o+Q==
X-Received: by 2002:a17:906:69c7:b0:88d:9cf8:2dbb with SMTP id
 g7-20020a17090669c700b0088d9cf82dbbmr6504821ejs.12.1677691544425; 
 Wed, 01 Mar 2023 09:25:44 -0800 (PST)
Received: from [127.0.1.1] (i130160.upc-i.chello.nl. [62.195.130.160])
 by smtp.googlemail.com with ESMTPSA id
 v23-20020a170906489700b008e9ac1ad79dsm5974715ejq.194.2023.03.01.09.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 09:25:44 -0800 (PST)
From: Jakob Koschel <jkl820.git@gmail.com>
Date: Wed, 01 Mar 2023 18:25:37 +0100
Subject: [PATCH 1/2] drm/nouveau/device: avoid usage of list iterator after
 loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230301-drm-nouveau-avoid-iter-after-loop-v1-1-0702ec23f970@gmail.com>
References: <20230301-drm-nouveau-avoid-iter-after-loop-v1-0-0702ec23f970@gmail.com>
In-Reply-To: <20230301-drm-nouveau-avoid-iter-after-loop-v1-0-0702ec23f970@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677691543; l=2000;
 i=jkl820.git@gmail.com; s=20230112; h=from:subject:message-id;
 bh=gzlpAicQX0rX29VOXLewaf79YUBgb8hjXaJCe+N3/OU=;
 b=khgQNjBDqCsqPWJJ693j/U1NsNOSGFNW127MUStil+3KrMBgy5uXMTdUjnU4FAqTOG/qWHpwBHNY
 OoSLMt5qAhM77SLXVzpOr9E0u1YvtfCP7kJlDyu7nHOcEZBiTXC1
X-Developer-Key: i=jkl820.git@gmail.com; a=ed25519;
 pk=rcRpP90oZXet9udPj+2yOibfz31aYv8tpf0+ZYOQhyA=
X-Mailman-Approved-At: Thu, 02 Mar 2023 08:12:47 +0000
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
Cc: nouveau@lists.freedesktop.org, Pietro Borrello <borrello@diag.uniroma1.it>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 Jakob Koschel <jkl820.git@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If potentially no valid element is found, 'pstate' would contain an
invalid pointer past the iterator loop. To ensure 'pstate' is always
valid, we only set it if the correct element was found. That allows
adding a BUG_ON in case the code works incorrectly, exposing currently
undetectable potential bugs.

Additionally, Linus proposed to avoid any use of the list iterator
variable after the loop, in the attempt to move the list iterator
variable declaration into the marcro to avoid any potential misuse after
the loop [1].

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jkl820.git@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
index ce774579c89d..7c9dd91e98ee 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
@@ -72,7 +72,7 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl, void *data, u32 size)
 	} *args = data;
 	struct nvkm_clk *clk = ctrl->device->clk;
 	const struct nvkm_domain *domain;
-	struct nvkm_pstate *pstate;
+	struct nvkm_pstate *pstate = NULL, *iter;
 	struct nvkm_cstate *cstate;
 	int i = 0, j = -1;
 	u32 lo, hi;
@@ -103,11 +103,14 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl, void *data, u32 size)
 		return -EINVAL;
 
 	if (args->v0.state != NVIF_CONTROL_PSTATE_ATTR_V0_STATE_CURRENT) {
-		list_for_each_entry(pstate, &clk->states, head) {
-			if (i++ == args->v0.state)
+		list_for_each_entry(iter, &clk->states, head) {
+			if (i++ == args->v0.state) {
+				pstate = iter;
 				break;
+			}
 		}
 
+		BUG_ON(!pstate);
 		lo = pstate->base.domain[domain->name];
 		hi = lo;
 		list_for_each_entry(cstate, &pstate->list, head) {

-- 
2.34.1

