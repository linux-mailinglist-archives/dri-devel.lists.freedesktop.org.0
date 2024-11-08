Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5B39C196D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 10:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D38910E950;
	Fri,  8 Nov 2024 09:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FhdCMO0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B910A10E94F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 09:43:02 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5c96b2a10e1so2640801a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 01:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731058981; x=1731663781; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oxPoyERHOUNIJgqJ+dA9r9WtuIYqAB/sJU67bsWQZiY=;
 b=FhdCMO0XHX2SwPl6lH6yLa+ObQW3amr40j8ss2W0JCTS/LMzYq0QJEqFItGTyaNAUH
 6au25hV5FY8VhgXIchYpnIB1fY5A0X6QqEqv0vRtJqw58/WZoidnYxit47awTApdp8Bx
 2x90fvmHs+qTMdc5sSGlw4ucBh5xjr9drALpDvvQfiiBOmPc1uKV35GJSLdxY9yv0dY6
 Z2rf/bNCgRc9ZkzRcFoKMf74KH2pRMprl80FD9UxGN0mA/CrS8Da422eMoG9Ah82dztY
 3vtE/mesv+ACKOdDnaRd7r4p/PGZ3h5BGOML2y15dOo9gBtUz/dgl953VzGh7qJ3EZmL
 MzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731058981; x=1731663781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oxPoyERHOUNIJgqJ+dA9r9WtuIYqAB/sJU67bsWQZiY=;
 b=Za44B99usFpcGXumYzFRiTvZYhRHEQAB2kqWX0yPcnwxo8Dae5AAGcMi6iXnwpr0QB
 +Sl2oQeCvsozcOj6SxJRT3+EjpiygwYX5Jgbx5iKQXkgFWwRG4hdoLwvPq6Gft2guUEV
 C8n1FCr8sXlODBymj72eKTiMYxTgmQfNVL86TnOsTp/4RpDVcGCmNuG9cyb92L8fT6zM
 i090I5vsmcxSWyxNfwjNEFDkvN/Pvn5YnnsuQv1XVvSthqvsiI7+W5EP5utS1D23mROe
 7byB1zMcT13BpBt/PunxO614yd68lEly1CPGATkxpe79LmYvXjMDMB/M9PAhiVFzUxQ9
 XOfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQVDg8GobZhjTgGYJjR0S+1nCahne/auwWZ373qGNv2diVUmzteFUZMxo0udF7OD0x6DiU5apqxbU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzz7oPQDNeKWIVbpKZYJt7J4THujrBHo5osrK6EUYxrxGQHBVFO
 Q50rbx490zwwz7uj7oqQh5i6l2Ep0ZdrDWjUkpFm2DhXCOQhZ6QX
X-Google-Smtp-Source: AGHT+IGuSlSbtSi9d3Uj6xL6XTGWtOk6iiYS8/yj/grAeWXVm+rMhoJkR2wi5yuQ5X/OgLyNzl+OvQ==
X-Received: by 2002:a05:6402:42c8:b0:5ce:deaa:27c8 with SMTP id
 4fb4d7f45d1cf-5cf0a310879mr1437135a12.12.1731058980864; 
 Fri, 08 Nov 2024 01:43:00 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:153e:2b00:4f76:20be:cb86:c8de])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03c7c455sm1756385a12.73.2024.11.08.01.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 01:43:00 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: boris.brezillon@collabora.com, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 lionel.g.landwerlin@intel.com, dri-devel@lists.freedesktop.org,
 faith.ekstrand@collabora.com, simona@ffwll.ch
Subject: [PATCH] dma-buf: fix dma_fence_array_signaled
Date: Fri,  8 Nov 2024 10:42:56 +0100
Message-Id: <20241108094256.3717-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108094256.3717-1-christian.koenig@amd.com>
References: <20241108094256.3717-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The function silently assumed that signaling was already enabled for the
dma_fence_array. This meant that without enabling signaling first we would
never see forward progress.

Fix that by falling back to testing each individual fence when signaling
isn't enabled yet.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 46ac42bcfac0..01203796827a 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -103,10 +103,22 @@ static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
 static bool dma_fence_array_signaled(struct dma_fence *fence)
 {
 	struct dma_fence_array *array = to_dma_fence_array(fence);
+	unsigned int i, num_pending;
 
-	if (atomic_read(&array->num_pending) > 0)
+	num_pending = atomic_read(&array->num_pending);
+	if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &array->base.flags)) {
+		if (!num_pending)
+			goto signal;
 		return false;
+	}
+
+	for (i = 0; i < array->num_fences; ++i) {
+		if (dma_fence_is_signaled(array->fences[i]) && !--num_pending)
+			goto signal;
+	}
+	return false;
 
+signal:
 	dma_fence_array_clear_pending_error(array);
 	return true;
 }
-- 
2.34.1

