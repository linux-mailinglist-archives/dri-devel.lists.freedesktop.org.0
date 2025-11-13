Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13210C5811A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC1B10E851;
	Thu, 13 Nov 2025 14:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j2lpBLAA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176F510E841
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:53:45 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b72cbc24637so158720166b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763045623; x=1763650423; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NKmnEQ/nUI33x0xsdd1mSPqaJsxAwU8yNUcMzUe1VSA=;
 b=j2lpBLAAAPJkzvBYkJnjkgLpmE0UU6R8SmPEQukPBRLnRVE3rSWcZlDs2ELHQSgz72
 q2XPwjES9WiVhfNoe0XBzAXPH6bVLQIPP+N6PAqL4xP4YB4h/sfC6nlbioVMLnav4RRA
 LH1qaPK1FG8yi4rxWdNFzhVVkDWiI0fa+CFgAOn0OL4AYWnzd67vNtWvKieY/uPkKnq0
 OgPfJZV04wy5e5Zp3tDJvqbgTnexpi0Vy7pc7K3CIx7sLP7PxelT2G3H4Xa0b/tlchhd
 OBN3S9YoXWlIp9xuiGniwyn+oNfmqt8U03wMfnItiA8uKJLc67SW6gkPPf75qlFXD+Uy
 vSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763045623; x=1763650423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NKmnEQ/nUI33x0xsdd1mSPqaJsxAwU8yNUcMzUe1VSA=;
 b=sUnw1AwPu+xEgbWZUbeOwvaMAQZuerWd1N9l+rSKZenrwTXmVhXmGfs59UeRca7Du+
 GWxk4u1q0q7qTWpNAM9Szmuhel6lHGSH3THU1T2/cG/fibah/uOoUdZuExyj6XSkYey+
 S9miOyXFkWnJVAQSOWQbB9ddr0zF/B7vgOjzFTo3RCE6uwzPJx6YZCVprgLCGhKf2n0e
 AwjXr/hTtbJZurgUi+pKWGHvYOh7I+5WeI0NyAld9mx6VcEwzuDBzOVMii7wC1kVaYm+
 VTuwdvQZXKj/RqFSoGk+bNowvVf9w7GylA1YNXdtV+8n6qpYcA/Mw+iOtzG61oND44iH
 31Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQZk3DFXf2FaD3yJNV5P9ilJzy0VAHXpW3eQDwTj0D37z+dEJXCRjzygQjRkjcAXVWTsUurKHhZAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwctlhtOuNWC5kBXjeu0JIt9GpcjFPr65ZlhM2byWfyzpkfanpn
 zFARQ9i/KxfwoAGVz7pMD7Hd6bm99gsI4M24rYGnbp41h5FzGJG+RN3M
X-Gm-Gg: ASbGncvYJtF0aX/2JdUX98chgMLzimHDIHeogxjfBjexVlRD6cSefY6LCdZE4b4DYfo
 8a9+RQ9TJln7NzC5XcTCvETHvpRsxLMmtThTsK2ZsU5RMiC6n0x+15NJchQZcopAMHfTgvHnxN3
 FedbFbaiiuBL/lO88C+aC5LlhuLyppYhW3jpUJ93H+W7IgcHiaEagHkiWMpo0gXaN9MrdIu3jXQ
 tAGswmlMGzrRMlEHZvwizXV44EctSCnYD05i/jKpsSEUBp47j+qjho578AVf+B1inNyc9YbKtbe
 jWbfGoC369m/ANw97duWz7wY3+IYW5sBra+yGh1RQezNq6fYxrX/j18Y8qiGa5absjL0eni/9Zs
 QCTKFlWheiDc+TCtQkovty3xmTmaw0u1WNA3Mxng1by24vzunYAIF/6QuSJPeb0TaVLaHa4+R8e
 nHlJdhT+a4SEw=
X-Google-Smtp-Source: AGHT+IGg++u+GaHI/MTXIjLOGncykPNSekn7i6/RimPgdNfxQMkJ6YRb52ePk8VS7b1+3/78EaXHzQ==
X-Received: by 2002:a17:907:7f8c:b0:b30:c9d5:3adc with SMTP id
 a640c23a62f3a-b7331aaad1cmr676555866b.49.1763045623545; 
 Thu, 13 Nov 2025 06:53:43 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15aa:c600:cef:d94:436c:abc5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73513b400fsm173747166b.1.2025.11.13.06.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:53:43 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Subject: [PATCH 11/18] drm/amdgpu: independence for the amdgpu_eviction_fence!
Date: Thu, 13 Nov 2025 15:51:48 +0100
Message-ID: <20251113145332.16805-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113145332.16805-1-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
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

This should allow amdgpu_fences to outlive the amdgpu module.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c | 3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
index 23d7d0b0d625..95ee22c43ceb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
@@ -167,9 +167,8 @@ amdgpu_eviction_fence_create(struct amdgpu_eviction_fence_mgr *evf_mgr)
 
 	ev_fence->evf_mgr = evf_mgr;
 	get_task_comm(ev_fence->timeline_name, current);
-	spin_lock_init(&ev_fence->lock);
 	dma_fence_init64(&ev_fence->base, &amdgpu_eviction_fence_ops,
-			 &ev_fence->lock, evf_mgr->ev_fence_ctx,
+			 NULL, evf_mgr->ev_fence_ctx,
 			 atomic_inc_return(&evf_mgr->ev_fence_seq));
 	return ev_fence;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h
index fcd867b7147d..fb70efb54338 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h
@@ -27,7 +27,6 @@
 
 struct amdgpu_eviction_fence {
 	struct dma_fence base;
-	spinlock_t	 lock;
 	char		 timeline_name[TASK_COMM_LEN];
 	struct amdgpu_eviction_fence_mgr *evf_mgr;
 };
-- 
2.43.0

