Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD888FCAF3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 13:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3108110E07D;
	Wed,  5 Jun 2024 11:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="kvRN2wWi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BDD10E07D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 11:50:43 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a68f10171bdso431664966b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 04:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1717588242; x=1718193042;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=si8jm3GzWRqXx1IokxC0CnOeeKfkWKdxlqw96jlz8gE=;
 b=kvRN2wWihLg1djg5SH5Osp0sjSgpZ1byDq79bxu6R+KoF/64hRU3qjm32TPndPoca5
 OelYT68/+C3ZWGHZrMnazhtRCZVXOVL0FuP4gHf1uv/pTModwhRfmoAEgIn8XMmEDoqI
 Omy/5HnzCJsWWV8QwRUwMreWjZO+qS87GXFVvuM4fRt8DWhafX8nURAr6Rhs6NdArAUw
 NMSZ6ZPVGtY9kCl4Qz/2NcM6V92ns/8ZqzE6AeSO8XOXweE721TSexPW7ufD/5dpKClM
 42BSxmZW9kNRNS4LSY7WO5O3ZDrI1BAHfX2LFN44rngiKIIKgG1cgXoeJhOvW6XEW/nA
 H4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717588242; x=1718193042;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=si8jm3GzWRqXx1IokxC0CnOeeKfkWKdxlqw96jlz8gE=;
 b=E/kombBwvQCRiLJWbHa6yiH2dK68RFEp/81S0B461UFlpabRMI1BvYTJ3WgM8cftON
 6tOVVSdJKoi5B7vZejcLAbWRWwAU+aLo98q1SttYcH4lDrK+xZsZAXM7ogIS2FfLxzNJ
 aK3HBKwh4F3bZMzBV7soumd7eciD8Z/dnVLSJ2ZvX+a2BIghTvNRAwLjsTzeA/Ka/ZJc
 ckfsu9NvnkD/RiC4DYBQqkwxczDhLXjWHQ4xhXpAme3ClbvzX+WkQ9z/F+JVQ+IX8zyd
 /pVgPrA/br5bPe989qf0NfKWjAqRktEr/A62JAXOb1LHyHVEIqoLla4V0q7g8euaooXc
 Y+4w==
X-Gm-Message-State: AOJu0Yz0fCYRTOTm6jOrqHG4wTkwpeelGDLWTJXwV72Pb5qoS0Hjj6H2
 dlFCZs3IVQVuSNcXj8+xDn8i5t8libt+mIqEhr5r8pdmW/11FYyGiUhk1aBZcg0=
X-Google-Smtp-Source: AGHT+IF5ti3wzThIx0McGMRIE3AiHKcPjjsf3XWSmVpmGVH/jBbxJzXHej+rEPhsvqWN+HUoB9bqsQ==
X-Received: by 2002:a17:907:770c:b0:a67:7649:3c3c with SMTP id
 a640c23a62f3a-a69a000e966mr187050066b.56.1717588242051; 
 Wed, 05 Jun 2024 04:50:42 -0700 (PDT)
Received: from debian.fritz.box. (aftr-82-135-80-164.dynamic.mnet-online.de.
 [82.135.80.164]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a68ed879eacsm533329966b.99.2024.06.05.04.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 04:50:41 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] drm/managed: Simplify if condition
Date: Wed,  5 Jun 2024 13:50:01 +0200
Message-Id: <20240605115000.83102-1-thorsten.blum@toblux.com>
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

