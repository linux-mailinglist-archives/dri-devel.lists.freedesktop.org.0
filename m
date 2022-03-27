Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1091D4E85F3
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 07:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E68F10E376;
	Sun, 27 Mar 2022 05:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732BA10E376;
 Sun, 27 Mar 2022 05:31:48 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id q19so9752932pgm.6;
 Sat, 26 Mar 2022 22:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=T9ii1s/vDDaD1QA64Ks3s/bvtYbdmXDV59Ucnc6x+8M=;
 b=KDf55Yv5mpN2AkGspc9VfaKo0K2v900aUEgARfmtbxGdDUL6QXuvltflUnnxq9PkHt
 YhW79cDOHms4RxghCJ1odTS3nROpbDTpCnIHmpQ0gIsgSaHGWxR/Ajl+aqYrON7uxevK
 ZGbYyFQdZtH7S4orjIPps5iSgN/1w/8COOndrIemkzpS5iGeY6Fm3KpBjqrdsFfrOFVL
 iSwc8hN81KgS13LzY0muEQDppdLDaOI63J4hYMNlhm9atCWo8og4mXVlxxKGPjLdU3uY
 AHyqFXZQ4LoJ/FMpl6b2E4O6S3ZOb0KN+Y0yfnQw2Quy7wUbvzjmRUDB+CJNT8rRFKQ8
 lbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=T9ii1s/vDDaD1QA64Ks3s/bvtYbdmXDV59Ucnc6x+8M=;
 b=gRQBPTvEjyQB/fcRi047rHQivm+TDAOybEuRsmE9azLC+n2Rmk9WV5Zam+WCIN9Cl7
 UYygelZzvk+U/x009zRPJZEgwuJW8XyZDYMXNCq/PwsBTWE7cp9DJgUzyWnT5cNuk7wL
 f2u6rTpKUNXbsho5VKdtv0/SkdYQ5DuvHEUgxAZC8eJdFSn0JD9q4TdBYxHVGQGl8ExM
 XDlTk8jWBj6hLcBcjnRmWWelXeKfWugLn8ENyJSQMdJaD7okg4VpxeXO2Iz4loCrQ9UA
 ett7iXXM3a0oR2Q4OeufdI/8+Lqf+ag6OiP+KPa9/ZCCMpcGmqogUYqUoiAJNUI1xkax
 5IeA==
X-Gm-Message-State: AOAM530vVQd+RjgpZXZolqzbxIHS7PWIlPAFInmAlRlT37WXEV4XUyUN
 AwMix6lERF8RajeabowRsiE=
X-Google-Smtp-Source: ABdhPJzkzp7Reb+gYTSiszuRxap2P3TtfajgbjK+Rluk16gl1IRBjl55f5DmGDmjeshiq0mHS3yx2A==
X-Received: by 2002:a05:6a00:849:b0:4fb:1112:c19f with SMTP id
 q9-20020a056a00084900b004fb1112c19fmr10667773pfk.74.1648359108089; 
 Sat, 26 Mar 2022 22:31:48 -0700 (PDT)
Received: from localhost.localdomain ([115.220.243.108])
 by smtp.googlemail.com with ESMTPSA id
 f15-20020a056a001acf00b004fb2ad05521sm3894539pfv.215.2022.03.26.22.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 22:31:47 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: bskeggs@redhat.com
Subject: [PATCH] device: fix missing check on list iterator
Date: Sun, 27 Mar 2022 13:31:39 +0800
Message-Id: <20220327053139.2572-1-xiam0nd.tong@gmail.com>
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
Cc: kherbst@redhat.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xiaomeng Tong <xiam0nd.tong@gmail.com>, stable@vger.kernel.org,
 linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bug is here:
	lo = pstate->base.domain[domain->name];

The list iterator 'pstate' will point to a bogus position containing
HEAD if the list is empty or no element is found. This case should
be checked before any use of the iterator, otherwise it will lead
to a invalid memory access.

To fix this bug, add an check. Use a new value 'iter' as the list
iterator, while use the old value 'pstate' as a dedicated variable
to point to the found element.

Cc: stable@vger.kernel.org
Fixes: 9838366c1597d ("drm/nouveau/device: initial control object class, with pstate control methods")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
index ce774579c89d..6b768635e8ba 100644
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
@@ -103,11 +103,16 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl, void *data, u32 size)
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
 
+		if (!pstate)
+			return -EINVAL;
+
 		lo = pstate->base.domain[domain->name];
 		hi = lo;
 		list_for_each_entry(cstate, &pstate->list, head) {
-- 
2.17.1

