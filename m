Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AABF02A790C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5871F6E9C4;
	Thu,  5 Nov 2020 08:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491916E056;
 Wed,  4 Nov 2020 15:14:06 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id b3so17542395pfo.2;
 Wed, 04 Nov 2020 07:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=ZNNounMQIMRz8K10oG/OB7lWGgxV/OEsHEiMQfK/Lv8=;
 b=C/P/mZbeUHdxW56yw6dSDbVuQsqw1gkds/wYzRuOe2oRN6NyBlmL3+CqoHKnnp+HnH
 T19nKeaxHK+tfJ6tLfbXguZEMjaJHo3Bk47KrcdsnNnVa0ue3V2Tl8PkwnDezoGrTbWA
 jKdiWDlFUnE6XliZpn58za66usgob8wv1LgqX772mLLzYIWbNLnNR6WlzmwlODeZV1JZ
 +LNL7mzJvjxOkdcmG67P1WJx9ltZmi5SXM1Z1ytZTDM+Hz4XPaZ5fS1h7uyP9nkhkU66
 w2QrjOEsRFw5TL1rRBZb43tEQTuXJX3wkF0uEyhM2sY7fjG352+yOdl+VlytMIS/jRvO
 +WFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=ZNNounMQIMRz8K10oG/OB7lWGgxV/OEsHEiMQfK/Lv8=;
 b=aKATXzbW0ftnYsxe7M/5jUFvTBGPSZyxnoWa9OjBtbLUty9ZU8h6MBpfUwyIDVBOUB
 OPDgq1w4Q6/Lmb7TsrJcXiZv9HG4vbD4MkbTE1tRtaWnBvzyB5JHKsHNyXTBjyySiAow
 BRXv6WdtXx0lx7WlB6AlsLszv4BEr54aT4ajO9iVxKGbLAIFGyYKuLXxj6yaoZd/wxrN
 Fp934J7dcG2oiY3ER67fMxg4UnWB++KJ4gn3O+zoFS2vwsuYtRg3FfUELq2HIAK2C5SV
 oqJN/Xz6rpZjrdLyUdWdRakXEHthrjS+1cTgYCtfZxpKqTAkfpdNLyfYrTF4s4uqbJvT
 8yzA==
X-Gm-Message-State: AOAM5337aDa0tGfD4ZlJFkN6qdoB2ZLDf7eMNFsxtV6/bWcJToUg9Za0
 w4GZqO/o1dZvXf01ByrWJLdsIp5csUc=
X-Google-Smtp-Source: ABdhPJwqYTp5o+8CbcyUaE1B/F7rurtuzNjVeMUlFiaH2AP7l1ZV54Rnfv02uM64/jAslPkDIW5S2A==
X-Received: by 2002:a62:2ec7:0:b029:164:4811:e1d6 with SMTP id
 u190-20020a622ec70000b02901644811e1d6mr31715059pfu.12.1604502845856; 
 Wed, 04 Nov 2020 07:14:05 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id t32sm2900277pgl.0.2020.11.04.07.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 07:14:05 -0800 (PST)
Date: Wed, 4 Nov 2020 20:43:59 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdkfd: replace idr_init() by idr_init_base()
Message-ID: <20201104151359.GA69034@localhost>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
Cc: mh12gx2825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

idr_init() uses base 0 which is an invalid identifier. The new function
idr_init_base allows IDR to set the ID lookup from base 1. This avoids
all lookups that otherwise starts from 0 since 0 is always unused.

References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_events.c  | 2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
index ba2c2ce0c55a..b3339b53c8ad 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
@@ -230,7 +230,7 @@ static int create_other_event(struct kfd_process *p, struct kfd_event *ev)
 void kfd_event_init_process(struct kfd_process *p)
 {
 	mutex_init(&p->event_mutex);
-	idr_init(&p->event_idr);
+	idr_init_base(&p->event_idr, 1);
 	p->signal_page = NULL;
 	p->signal_event_count = 0;
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 65803e153a22..022e61babe30 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1289,7 +1289,7 @@ struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
 	list_add(&pdd->per_device_list, &p->per_device_data);
 
 	/* Init idr used for memory handle translation */
-	idr_init(&pdd->alloc_idr);
+	idr_init_base(&pdd->alloc_idr, 1);
 
 	return pdd;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
