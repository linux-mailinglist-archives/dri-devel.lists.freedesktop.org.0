Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 195F491E8F7
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 21:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A364B10E0BD;
	Mon,  1 Jul 2024 19:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="TndOz3rj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B071E10E0BD
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 19:56:50 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1f9d9b57b90so24018945ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 12:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1719863810; x=1720468610;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4phTXkkw2gQSc+8dNAA63L23OQusnHODrsEh3hYbZ4s=;
 b=TndOz3rjBROYdC5yOAqBk0TIZeCswCQdUwQcg7MWYNjmNmHA3lPUh0S4zCmx14Adke
 ngTGeTXIxv4gkZs6mXJh+1uAzsZQLkGy40SJLpFdNMUbBp1DhDvn1OXIHWIYWmPqwvsc
 A4o/Bg9Lzb/WjLdGV/o8t7VMfouEs4/IuKM6TZVrqeeT8phJh0T+7kJbo+W5AojPe0NR
 MaVGHq28N8G8O+CZqU/8VvxhT9jtQ4RBd5prgB+3x+bcVQ3LHAMSGz8hpUmJlgDgSvIi
 tBSTgBCmVong6hgVRQMX2JXyEQSOLNZKESzZn7cn6OaQ2entk/RvfEDifOOD7DKezWKF
 XQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719863810; x=1720468610;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4phTXkkw2gQSc+8dNAA63L23OQusnHODrsEh3hYbZ4s=;
 b=bE9OfTc8tN7uIufWfFLE315G5EPotbfEqwuGz5jAMYowsBqUsbHlLLPMMveHwLxl5A
 GI+85rk8ovex/Mw48w10IzltFuQX6JxhoJOKPBdTh7mraxAW64Ag+iyR6FACGHE6CJS7
 frdBNkTT+GsYlqwcB0J0zieN5NCABXghq6p+YnpBponunCTayEm5BM5jhXYcxmymnv2b
 Htg65nFFtnZcD0fJQVn98xjU0xJVERH0Urfs8BkAYA5oqEk4ivV6OHOmG6thjA6Erw0o
 yeIgY0eS9pPMIvep1r1sxKbOHyplqTsi2t7H1mLulKnayYE78zEQOYvN4lSKVfV9GD3M
 Yoyg==
X-Gm-Message-State: AOJu0Yyu/M9CmKMxKbosUlWV/zUYP8Ei8c92RVJzqGKb2LBjp3xSu2U+
 8PJ2xMyWHhMxWEw93puTZfAR6B/TTSLeYRms3ONkdUUKqy3FS8gDG3aDgIikLvy4W/ykjWu1tIj
 1WIg=
X-Google-Smtp-Source: AGHT+IF8iFAqlCFGCgrrnbtwsZpScqow+XchPf4GezyX7uCxsum1kO02WSlVbl2t65pDpT8elg6nsg==
X-Received: by 2002:a17:902:f650:b0:1fa:2dcc:7d94 with SMTP id
 d9443c01a7336-1fadbc93f97mr79599735ad.33.1719863810191; 
 Mon, 01 Jul 2024 12:56:50 -0700 (PDT)
Received: from debian.vc.shawcable.net. (S0106c09435b54ab9.vc.shawcable.net.
 [24.85.107.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac15b8920sm69026085ad.304.2024.07.01.12.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 12:56:49 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thorsten Blum <thorsten.blum@toblux.com>
Subject: [RESEND PATCH] drm/managed: Simplify if condition
Date: Mon,  1 Jul 2024 21:56:08 +0200
Message-Id: <20240701195607.228852-1-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.39.2
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

The if condition !A || A && B can be simplified to !A || B.

Fixes the following Coccinelle/coccicheck warning reported by
excluded_middle.cocci:

	WARNING !A || A && B is equivalent to !A || B

Compile-tested only.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/gpu/drm/drm_managed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 7646f67bda4e..79ce86a5bd67 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -197,7 +197,7 @@ void drmm_release_action(struct drm_device *dev,
 	spin_lock_irqsave(&dev->managed.lock, flags);
 	list_for_each_entry_reverse(dr, &dev->managed.resources, node.entry) {
 		if (dr->node.release == action) {
-			if (!data || (data && *(void **)dr->data == data)) {
+			if (!data || *(void **)dr->data == data) {
 				dr_match = dr;
 				del_dr(dev, dr_match);
 				break;
-- 
2.39.2

