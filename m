Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEC94EEF99
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7931C10E87A;
	Fri,  1 Apr 2022 14:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFACC10E7BB;
 Fri,  1 Apr 2022 14:27:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 35BF3B8240E;
 Fri,  1 Apr 2022 14:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109F3C2BBE4;
 Fri,  1 Apr 2022 14:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823228;
 bh=mOr3lNQXdbCJKrjBLq76MigGAjQCXtmASAMKe4k0eGs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dgqYvqFlugiMbIb63Z7ypu21gjUojGLk7a87MS7hc8qoKoJehw55qjbKXldIePGMU
 fC9IYBVOc5aQunoz8RV/nr/M+0GlRXnhB56rZYy91zXAWaUTNkAbt5xZ51WTMrGpjV
 hWI4ZyaF3mwVP+8tKqjwayLi7iT+G/ZNDNO3/EIr9k7zW2MNymL0vQH48aFDs9PP3g
 7Rt5YHByKGJCf3HpcIuUTj+DW8n1nJoGnvYd7nO2/OUb6VLYmcEOiEYcpY10R9D/CU
 2zGB9hS9dP+mxsAFctduMQdOkyXplVybF+NnoXfJTPHSAERxl8d4jxCUZF2q3IDeEM
 A5oVTYRwu8jWw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 024/149] drm/amdgpu: Fix an error message in rmmod
Date: Fri,  1 Apr 2022 10:23:31 -0400
Message-Id: <20220401142536.1948161-24-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401142536.1948161-1-sashal@kernel.org>
References: <20220401142536.1948161-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Jack.Zhang1@amd.com, Xinhui.Pan@amd.com,
 Yang Wang <kevinyang.wang@amd.com>, airlied@linux.ie,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Tianci.Yin" <tianci.yin@amd.com>,
 amd-gfx@lists.freedesktop.org, lijo.lazar@amd.com,
 dri-devel@lists.freedesktop.org, kevin1.wang@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Tianci.Yin" <tianci.yin@amd.com>

[ Upstream commit 7270e8957eb9aacf5914605d04865f3829a14bce ]

[why]
In rmmod procedure, kfd sends cp a dequeue request, but the
request does not get response, then an error message "cp
queue pipe 4 queue 0 preemption failed" printed.

[how]
Performing kfd suspending after disabling gfxoff can fix it.

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Yang Wang <kevinyang.wang@amd.com>
Signed-off-by: Tianci.Yin <tianci.yin@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index ed077de426d9..b793682071b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2708,11 +2708,11 @@ static int amdgpu_device_ip_fini_early(struct amdgpu_device *adev)
 		}
 	}
 
-	amdgpu_amdkfd_suspend(adev, false);
-
 	amdgpu_device_set_pg_state(adev, AMD_PG_STATE_UNGATE);
 	amdgpu_device_set_cg_state(adev, AMD_CG_STATE_UNGATE);
 
+	amdgpu_amdkfd_suspend(adev, false);
+
 	/* Workaroud for ASICs need to disable SMC first */
 	amdgpu_device_smu_fini_early(adev);
 
-- 
2.34.1

