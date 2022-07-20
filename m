Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E1357B9D6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80548F1F1;
	Wed, 20 Jul 2022 15:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE038F09E;
 Wed, 20 Jul 2022 15:33:02 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id q14so14513062iod.3;
 Wed, 20 Jul 2022 08:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bL9SmfHfMALFFeL2xDE9zET8U2WS92AMIVOZQAHdFgM=;
 b=qNlA5xnrP3dY6ZBo7PXii+qRTIAByeqj28yVQuJCOT0ubi3TgCaT54kFQ00w14763y
 wAI04ZYHMWXx1AqiwzLuT/7iWFXPHchbJXuiuo4IZuoI0cx/zkUKaeds1SR0g0UKMdnW
 W/ojC57aQn8H6oMIs/L2zuomHNRkm6mOdzG/+QhA4uv8sIKN5cGULtJzpwNx/coAqujM
 Z2rFmj2ElmewtytIxj5/LdfZ1z7pNZ80/688E2+qy05+cnsSfxYq2udliUp/rK9eDi1Y
 AMNuwLNrIUNk2BRXDXdZHuBpsfuTpB0nK45sEuFItqYLgdX/g23nX79cK2s5Z6N2+hge
 +UNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bL9SmfHfMALFFeL2xDE9zET8U2WS92AMIVOZQAHdFgM=;
 b=50cu1jeQvQ4kJdCIzgCUPzpK2PXpsVF4p1PdyQ3MeBu0Cf+8zT1NYhiWl56IrIKSu9
 byqQnmJU+gU85sQmnPrrlHD2KJT/7MUfPMfaaWSOG96x4VxGNpCOyh8G+NdmSNsxkrE5
 /QIBNV1G9qFfdNnnykgjN9Ngmbcha0RcwLlpayhNqnA/0ykfiSmNdjRrK3ZfNbWDbvos
 Qv22YWZd4flBkTl1KnRE2TATQtMm7sbll3G8rjHiitJ2mcslqJOnrDO0IKDexb3J3U4N
 AGRPEzhAoe1MpO5Sv2aI/y/LrReWX273ap5xxCPKn/pomf0NyANZx6fjFUYPOnmi4yss
 zTXQ==
X-Gm-Message-State: AJIora8mqEVfSmLROwXqAmVSG9NPOhNpCAHrxfx0teB2d87zVL7kfnVF
 3OL+DXz6qOVs8qnmf8A4gdUPd9eDXX2ypQ==
X-Google-Smtp-Source: AGRyM1tlbO/lueDTuTgCkX1RNPYngfLRVWh/GzwKGNRrE6W6SM3+kIPn9XLId99oUoH5l1MLmGPI9Q==
X-Received: by 2002:a05:6638:3801:b0:341:68f6:932 with SMTP id
 i1-20020a056638380100b0034168f60932mr9091331jav.71.1658331181037; 
 Wed, 20 Jul 2022 08:33:01 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:00 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 04/41] dyndbg: reverse module walk in cat control
Date: Wed, 20 Jul 2022 09:31:56 -0600
Message-Id: <20220720153233.144129-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

/proc/dynamic_debug/control walks the prdbg catalog in "reverse",
fix this by adding new ddebug_tables to tail of list.

This puts init/main.c entries 1st, which looks intentional.

no functional changes.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 8faf584f2f4b..7fb99492c16f 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -970,7 +970,7 @@ int ddebug_add_module(struct _ddebug *tab, unsigned int n,
 	dt->ddebugs = tab;
 
 	mutex_lock(&ddebug_lock);
-	list_add(&dt->link, &ddebug_tables);
+	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
 	vpr_info("%3u debug prints in module %s\n", n, dt->mod_name);
-- 
2.36.1

