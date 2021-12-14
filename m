Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E06C474584
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 15:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB5410E53D;
	Tue, 14 Dec 2021 14:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFF910E53D;
 Tue, 14 Dec 2021 14:48:30 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id h24so14492165pjq.2;
 Tue, 14 Dec 2021 06:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Iulmly40W1bDkhduoNsg+HBkwz1jkiNj6QQWr6cyxGI=;
 b=bVQ0yxfqR4gM8cvY3QfzVLBcKqhQI0nJLVV4RQfceHzyjSNcQpSou3zvsdx2WTGUGv
 xl3xVudr5Oeu4DaGKSB+/bmFlRpfPZkzOnRa1H6aIbsC1m4MCmw5UJhLd6/5njKfU0Wv
 LVuCbgS74ETHCAJ5Thx3+b+i0JoWHn5tSodY/IzyHg61gXSXY8uALr9Nh4fcM31JEPyY
 HEBkle6Lq92XyrBc94TZ4k6SoKkLl9hNzQO9/skGJZLIlcdpmU59AxMo6gNScBMD6plH
 DgvRUzAY6bJ7HJoTd8IjJnw/tfzo/NgepRbYNbEOp0JGh8owSwHG7t/iSAMYsdI8LBHa
 TdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Iulmly40W1bDkhduoNsg+HBkwz1jkiNj6QQWr6cyxGI=;
 b=M695SLfKq2t6y/HQf1P3U/YUwsBqR7ngRQAPcm1JZ+UAwA17Bd03RLP2/1GutYDPHM
 PqTA5YCLyNEqqTClexI1l9te43q0LAXJEOO5UY0ybRZ9r1EwBYz37085n4i6L3vwpdg3
 YK7jNk6Lzq7UeICed2dpXNSejOjBV9Oms37n9LIY5u9tdaAMaSXzKQPYk9GqqIVSewoS
 XtGCy8ZR9cIXGMsCL68Agl/m4GVX1ntxbBmmfahuikp4CnI2O+M6/TOgLRCIwNoFULP9
 DIqEUG72+920OcSNezeBYHU9hcGYCTaKgjTBlejkYKvFzkzvU7KzhMfoaF2S2iNPCCll
 sUmQ==
X-Gm-Message-State: AOAM530IcqKIzigIWUbdMRKbvdbV2NCegVnIJmyFd9ziYWeURN4S7Uxh
 GnNaayLY1dflcPkizWGHtfJfTsijixGsy63Dlr8=
X-Google-Smtp-Source: ABdhPJwZ1uKUDFQaXtTUt03NxX7hd0yKn9NTGJLMfjB3K+xhXU208vU7PYQTDnm0wNMJOYtiw2zB7Q==
X-Received: by 2002:a17:90b:1c8d:: with SMTP id
 oo13mr6164377pjb.139.1639493309906; 
 Tue, 14 Dec 2021 06:48:29 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id d9sm2556776pjs.2.2021.12.14.06.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 06:48:29 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Subject: [PATCH] drm/amdkfd: Fix missing check in kfd_parse_subtype_iolink
Date: Tue, 14 Dec 2021 14:48:23 +0000
Message-Id: <20211214144823.16057-1-linmq006@gmail.com>
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
Cc: linmq006@gmail.com, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kmemdup() function may return NULL in case of error.
Add NULL checking to prevent potential null deference.

Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
index cfedfb1e8596..59d55f752aa7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
@@ -1060,6 +1060,8 @@ static int kfd_parse_subtype_iolink(struct crat_subtype_iolink *iolink,
 			return -ENODEV;
 		/* same everything but the other direction */
 		props2 = kmemdup(props, sizeof(*props2), GFP_KERNEL);
+		if (!props2)
+			return -ENOMEM;
 		props2->node_from = id_to;
 		props2->node_to = id_from;
 		props2->kobj = NULL;
-- 
2.17.1

