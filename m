Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C5D601FEF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 02:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE3210E2C3;
	Tue, 18 Oct 2022 00:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506A210E2C3;
 Tue, 18 Oct 2022 00:54:22 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id p127so13374159oih.9;
 Mon, 17 Oct 2022 17:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tJF+WI60vk4zKRnY5WDcGvuP4IAKRIrw4t1y9atba+c=;
 b=CvJfsU/WmCgQx55S50cP58rTdE2xSJn65d6abDil0brE5yNcP10yKEpAc/a7KKh/Fs
 yqFVefwH05LvTg3rX1S9CEhqqGTzMej6Rk0n38uoOi3n8iOxpz8xatVBOQ1/R885MLk6
 jQoLSjlg+K6kZeWdAibBnwqVed/P4CsxsUtArSPhrDFbEDkR2TXjUxs6FDu4A2PwVMyk
 YvTCbdI0w+08paL2DOILF+jhO5ZKg7H2N9/qray/3nfSbF9EN+jRwYG3w+f7lBY/jAjk
 yYWpHNpe8gjWudH5mK0MpSO1OuMi0vt8deuLacYhX7t68oKkLfzp1DA2ttUkvGaCAzun
 rOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tJF+WI60vk4zKRnY5WDcGvuP4IAKRIrw4t1y9atba+c=;
 b=c5iNg9wen1n/0LyxVbCBnSRm82jffFhdsMX3/VZ04ZEj2CxuDjwYajz7kvWQmsaW3f
 XcS2wAWsDx2Y4ADQQm+/jAUBOabBAuzIRzuZwTZDCjC+RU/ApYUd+p+keyZqqmDlgF3F
 o1MOO43rd7ZgTa1zDSB77QoJb6hNV+Ke9P+8MWUttXEleLSF8/bR0APHUVn109HF9zyp
 hIPgjBuc16p9EHCHRGi87Owx+3ezjW8CdfYqH2F09Y6QG7DvbO4y3XgPrffIkehbGFyY
 FActOvjiuRfhFUx1HHDGznQgpjy1pcGBFL4GiqTsb9QeI00mLPh4Uyidtclv90VgTqvW
 Nj7g==
X-Gm-Message-State: ACrzQf0FAHZ6HIAi85dW6sqMcq7hvuRPSsf7i+UTWfoHfPlGaTfzQjPb
 5RN9xfpBAV0bC45lkiPL5JE=
X-Google-Smtp-Source: AMsMyM79IByIZADRuZXKE3oiNsXeZdoaKL8oknpSXSisoaeefSbJlBgjf2cwkfIV4DxrdgGt6gsrng==
X-Received: by 2002:a05:6808:1893:b0:354:b5bc:cd0d with SMTP id
 bi19-20020a056808189300b00354b5bccd0dmr14943045oib.244.1666054461473; 
 Mon, 17 Oct 2022 17:54:21 -0700 (PDT)
Received: from macondo.. ([2804:431:e7cc:1855:b6d2:d55:b2d8:b57d])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a9d7a83000000b00661a2c5fef9sm5420433otn.32.2022.10.17.17.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 17:54:21 -0700 (PDT)
From: Rafael Mendonca <rafaelmendsr@gmail.com>
To: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amdgpu/powerplay/psm: Fix memory leak in power state init
Date: Mon, 17 Oct 2022 21:53:57 -0300
Message-Id: <20221018005357.887009-1-rafaelmendsr@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: dri-devel@lists.freedesktop.org, Rafael Mendonca <rafaelmendsr@gmail.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 902bc65de0b3 ("drm/amdgpu/powerplay/psm: return an error in power
state init") made the power state init function return early in case of
failure to get an entry from the powerplay table, but it missed to clean up
the allocated memory for the current power state before returning.

Fixes: 902bc65de0b3 ("drm/amdgpu/powerplay/psm: return an error in power state init")
Signed-off-by: Rafael Mendonca <rafaelmendsr@gmail.com>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c
index 67d7da0b6fed..1d829402cd2e 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c
@@ -75,8 +75,10 @@ int psm_init_power_state_table(struct pp_hwmgr *hwmgr)
 	for (i = 0; i < table_entries; i++) {
 		result = hwmgr->hwmgr_func->get_pp_table_entry(hwmgr, i, state);
 		if (result) {
+			kfree(hwmgr->current_ps);
 			kfree(hwmgr->request_ps);
 			kfree(hwmgr->ps);
+			hwmgr->current_ps = NULL;
 			hwmgr->request_ps = NULL;
 			hwmgr->ps = NULL;
 			return -EINVAL;
-- 
2.34.1

