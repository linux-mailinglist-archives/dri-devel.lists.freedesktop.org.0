Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED6678D64D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 15:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE1D10E52A;
	Wed, 30 Aug 2023 13:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7415810E524
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 13:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693403202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w7XXAxDLUmZdx81fESQwCFLbPlVQDp3wBmzbmeWO24M=;
 b=OE5ECJrGM24DknbMl8BDqzUVlOCcJaJBNR/KILwZGxOcYr01HdpI6VJdrifdL6V86Y5v18
 Mp4Glq8+2pTE0ZpPoaFo5OQMLEuISOr7yTwc1oZxuMTuFrosIR1lkcHq6zE/nI64MertCD
 GNl8vZ3RMPx3aotlnrVz95m5v2yKuWw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-9N7VVQerMf-XxJ-wc9O_5w-1; Wed, 30 Aug 2023 09:46:41 -0400
X-MC-Unique: 9N7VVQerMf-XxJ-wc9O_5w-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a342f1703so87948966b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 06:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693403200; x=1694008000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w7XXAxDLUmZdx81fESQwCFLbPlVQDp3wBmzbmeWO24M=;
 b=GaZtZCaq5Ofw7vdYzv1hx8QLCzO/5jsPiZkv5ylaR1sZLdW8EbSSvrQ821CQlTevYr
 BOHYWN/Pj2wzQ49nRHMb7LQ7yHBdWiciJg8oKiJxsekIvqu9WPBqMzUvNzEQnd3UhcFA
 bzFGI6y+akuVVEbukzocrWkN35hKRAXm1fksXPtw9T654eSaSmqXcqJaKXKIRNOaWSOH
 nhwOFQ25FhOHWljDpsg45zGyzkarn7bWPC6yyHUEGQOkcTudujAp7xCbXAIoUnKOy9Zq
 WZBFqCu4v/Flamjrd/MbnSWLTffz6T1lGK9sVg+8uaA4eGbkqjcwfrstwSdXMGZM61c2
 aNoQ==
X-Gm-Message-State: AOJu0Yxkzi1vXj6cTq1EUmJiMcHJk1v/cBSssATBclqYpaAYl63OSEnJ
 eBPqLFF2G5VgaSd/maigtuiJflZhjof9bu5bKyNz8xMjDNnjvnaneFIx1rIcpqWmPmqyYpCnGrO
 9n5IJcQfwbYG2Cpf4aa05iHwT9al5
X-Received: by 2002:a17:906:1011:b0:9a1:aea8:cb5a with SMTP id
 17-20020a170906101100b009a1aea8cb5amr1574499ejm.1.1693403200683; 
 Wed, 30 Aug 2023 06:46:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFovveJ1gRkNa/hbpuOdO660EpmuFNfSfZvj7MduSJ07LTCEG5M6k7oeDfsA0MPBedrGa9vw==
X-Received: by 2002:a17:906:1011:b0:9a1:aea8:cb5a with SMTP id
 17-20020a170906101100b009a1aea8cb5amr1574480ejm.1.1693403200487; 
 Wed, 30 Aug 2023 06:46:40 -0700 (PDT)
Received: from fedorinator.fritz.box ([2001:9e8:32e4:1500:aa40:e745:b6c9:7081])
 by smtp.gmail.com with ESMTPSA id
 gy25-20020a170906f25900b0098951bb4dc3sm7218566ejb.184.2023.08.30.06.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 06:46:40 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Kees Cook <keescook@chromium.org>, Andy Shevchenko <andy@kernel.org>,
 Eric Biederman <ebiederm@xmission.com>,
 Christian Brauner <brauner@kernel.org>, David Disseldorp <ddiss@suse.de>,
 Luis Chamberlain <mcgrof@kernel.org>, Siddh Raman Pant <code@siddh.me>,
 Nick Alcock <nick.alcock@oracle.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Zack Rusin <zackr@vmware.com>
Subject: [PATCH 5/5] drm: vmgfx_surface.c: copy user-array safely
Date: Wed, 30 Aug 2023 15:45:56 +0200
Message-ID: <6f9397d6af919b7e8325c2945385c13aaa3dc5f1.1693386602.git.pstanner@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1693386602.git.pstanner@redhat.com>
References: <cover.1693386602.git.pstanner@redhat.com>
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
Cc: Philipp Stanner <pstanner@redhat.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 linux-hardening@vger.kernel.org, David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, there is no overflow-check with memdup_user().

Use the new function memdup_array_user() instead of memdup_user() for
duplicating the user-space array safely.

Suggested-by: David Airlie <airlied@redhat.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 5db403ee8261..9be185b094cb 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -777,9 +777,9 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 	       sizeof(metadata->mip_levels));
 	metadata->num_sizes = num_sizes;
 	metadata->sizes =
-		memdup_user((struct drm_vmw_size __user *)(unsigned long)
+		memdup_array_user((struct drm_vmw_size __user *)(unsigned long)
 			    req->size_addr,
-			    sizeof(*metadata->sizes) * metadata->num_sizes);
+			    metadata->num_sizes, sizeof(*metadata->sizes));
 	if (IS_ERR(metadata->sizes)) {
 		ret = PTR_ERR(metadata->sizes);
 		goto out_no_sizes;
-- 
2.41.0

