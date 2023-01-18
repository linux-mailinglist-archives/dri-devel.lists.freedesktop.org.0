Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5D66713AB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 07:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B6410E6A1;
	Wed, 18 Jan 2023 06:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29C910E693
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 06:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674022436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GqctRI7P01D+Q/Vr3L/m1m3KsR2bbveGpuxATunwrRo=;
 b=Xhpd6nhF1jxRtLM5gXRV72zF8S0nW2je28HKEnq/OYpueuUjzTs97HL9T28cq5gJ7BlIvr
 jSkDaIy2XW1knCMJHAZVUDH42lTDSJ5GoTQq8niZmohaRO2RHFEpLrDr98APRQUHDaAcmp
 R48//kMelklnIJloddZzU4wzjBAXL1I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-227-z8uUr3FbN9mTmB7dP-8VQg-1; Wed, 18 Jan 2023 01:13:54 -0500
X-MC-Unique: z8uUr3FbN9mTmB7dP-8VQg-1
Received: by mail-ed1-f69.google.com with SMTP id
 g14-20020a056402090e00b0046790cd9082so23193656edz.21
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 22:13:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GqctRI7P01D+Q/Vr3L/m1m3KsR2bbveGpuxATunwrRo=;
 b=a81o35xK659wxWGj7NZ6D7aiXDGAwDCKatq3XLPTTRMuCnOBVTBObnKdbaDTZGzAYZ
 2YxvLMRI5mNwEbFnb1ve94QaZVcqiV6tJ8oWh2K4YsP2a6AjUyXAC3rmwiLY+GssiQWg
 U8d6zFHhcVaTYOXyk6TpgBqzUE7ioEBnkKICJn6vJQL+10tvCucdfjUcO5y3Lz1sG6+1
 7h7vDc+fRNUh8DHHZJlvdUTl6PtO/RNkxnUpHn1GOMXHvknGB0ZRdeZkQRuOjEDIUElF
 wz6jtPtgnswgHxkPqeG1AxKaQL/qQwpup5G0gDcEEsSyketSR42fk7mTXkP+pj9HAsUn
 19QA==
X-Gm-Message-State: AFqh2krYLSRysjmTDylToabnW8dlSKbkAgMek2/cAChWn0ODMYyPLN6Y
 nG4OEna6lke5KHyywa4R45JmsRSUpjJp57tejhx9+Kej89fEltG55ath+qxyyyaRIUsUTbklJq1
 CFlgep+Kgi9ah2yeNhXX2qvjSzUC1
X-Received: by 2002:a05:6402:401d:b0:49b:5a1c:9cb5 with SMTP id
 d29-20020a056402401d00b0049b5a1c9cb5mr6136307eda.16.1674022433100; 
 Tue, 17 Jan 2023 22:13:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsMRQNeLN0f7U0iSpRPj/7pTZ3JgTXp3PTis3EaCSPjKRlhbStTsVCJPYygyXG1jLnP6DuINw==
X-Received: by 2002:a05:6402:401d:b0:49b:5a1c:9cb5 with SMTP id
 d29-20020a056402401d00b0049b5a1c9cb5mr6136300eda.16.1674022432934; 
 Tue, 17 Jan 2023 22:13:52 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a05640243cb00b0049e19136c22sm3039222edc.95.2023.01.17.22.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 22:13:52 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
 bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net
Subject: [PATCH drm-next 07/14] drm/nouveau: bo: initialize GEM GPU VA
 interface
Date: Wed, 18 Jan 2023 07:12:49 +0100
Message-Id: <20230118061256.2689-8-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize the GEM's DRM GPU VA manager interface in preparation for the
(u)vmm implementation, provided by subsequent commits, to make use of it.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index d2b32a47e480..4cdeda7fe2df 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -215,11 +215,14 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 	nvbo = kzalloc(sizeof(struct nouveau_bo), GFP_KERNEL);
 	if (!nvbo)
 		return ERR_PTR(-ENOMEM);
+
 	INIT_LIST_HEAD(&nvbo->head);
 	INIT_LIST_HEAD(&nvbo->entry);
 	INIT_LIST_HEAD(&nvbo->vma_list);
 	nvbo->bo.bdev = &drm->ttm.bdev;
 
+	drm_gem_gpuva_init(&nvbo->bo.base);
+
 	/* This is confusing, and doesn't actually mean we want an uncached
 	 * mapping, but is what NOUVEAU_GEM_DOMAIN_COHERENT gets translated
 	 * into in nouveau_gem_new().
-- 
2.39.0

