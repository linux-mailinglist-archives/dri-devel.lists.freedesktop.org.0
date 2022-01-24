Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D484991C6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 21:18:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D94B10E731;
	Mon, 24 Jan 2022 20:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7C610E731
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 20:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643055501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LK256wQogjCX5wa9UmsP7s8Vi1buTBnWqTcBCjO4e1M=;
 b=BMfAZ0JMGgQi1KI63yLFIB9lfPW/H+HCdav5DMHsldenMkHZWJm8FVD08q33+5aeVd+AZ8
 XfF5XGxqNcTl8sIG49qSn8nLREX1b9+YOsTepNS1VW+6e4UtfZyg1Uz0HKL0YL4oLM2RZL
 hvOWjA5GT9MtDTw54mxZSi02LBdvOnM=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-TAzv6D9uNbeYEXbhmuCv5Q-1; Mon, 24 Jan 2022 15:18:19 -0500
X-MC-Unique: TAzv6D9uNbeYEXbhmuCv5Q-1
Received: by mail-oi1-f199.google.com with SMTP id
 bx38-20020a0568081b2600b002cccdb971ddso3218667oib.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 12:18:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LK256wQogjCX5wa9UmsP7s8Vi1buTBnWqTcBCjO4e1M=;
 b=0JUJqKnZwAT4xQnD39PhAmUg//ijp5QXvrLpxAyam1QVkfCNGPDUgX/wlfbKINnzGq
 NRMUjlXlmjueBZuT+G+soXXA8ZYNEnMw4s1d+89zOBJ+q1F+s2abKq+kCLDSbAl2EUfx
 alSNwCxcy96Ov5Ndj+UnMv3wpSty+y8AOuv+Tt6POkSHUhXPvtCsyutWccA7SQjFOEIw
 rfqu+5bDqZ9kR1fKNu65nk5R1ii+nOnzOSJc/RNKyAHwJ0NC/zrRlDnets6dWQPGT4CP
 0Sv4EUbGS1Rm1ouBeKxqf7W1AigZc/nzevnoJEKac29DXFzG4nEArxdbt4xHDaLzxIZC
 tuvw==
X-Gm-Message-State: AOAM532vczfPfrcgv9z0jUb4CaTTGdPkmi86Q7AUlDR3IUufJAAwEyXc
 o6nbwr4k/Hezn68pwjTMpVuxPTcf0ZUACTAXuSh+S0WsBTuT7SRi4acjy+wYAKEZtl4Bi1DGiWK
 dGCxqvGpyDEPlZB/ksIbcrRHNupwh
X-Received: by 2002:a9d:d08:: with SMTP id 8mr13197872oti.334.1643055498329;
 Mon, 24 Jan 2022 12:18:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTEn4ya3/5eCInZIkS/C/4U2Q9wOWBRRyxGnlMA9linsmQiFFzkE//YKVVW2gVtrkOgoqmKw==
X-Received: by 2002:a9d:d08:: with SMTP id 8mr13197856oti.334.1643055498138;
 Mon, 24 Jan 2022 12:18:18 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id bk23sm6235774oib.23.2022.01.24.12.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:18:17 -0800 (PST)
From: trix@redhat.com
To: evan.quan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com, lijo.lazar@amd.com, darren.powell@amd.com,
 guchun.chen@amd.com, Arunpravin.PaneerSelvam@amd.com,
 andrey.grodzovsky@amd.com
Subject: [PATCH v2] drm/amd/pm: return -ENOTSUPP if there is no
 get_dpm_ultimate_freq function
Date: Mon, 24 Jan 2022 12:18:12 -0800
Message-Id: <20220124201812.1078824-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

clang static analysis reports this represenative problem
amdgpu_smu.c:144:18: warning: The left operand of '*' is a garbage value
        return clk_freq * 100;
               ~~~~~~~~ ^

If there is no get_dpm_ultimate_freq function,
smu_get_dpm_freq_range returns success without setting the
output min,max parameters.  So return an -ENOTSUPP error.

Fixes: e5ef784b1e17 ("drm/amd/powerplay: revise calling chain on retrieving frequency range")
Signed-off-by: Tom Rix <trix@redhat.com>
---
v2: return error instead of initializing min/max

drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 5ace30434e603..264eb09ccfd51 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -116,7 +116,7 @@ int smu_get_dpm_freq_range(struct smu_context *smu,
 			   uint32_t *min,
 			   uint32_t *max)
 {
-	int ret = 0;
+	int ret = -ENOTSUPP;
 
 	if (!min && !max)
 		return -EINVAL;
-- 
2.26.3

