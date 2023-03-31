Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 891296D25D0
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 18:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B5110E1A0;
	Fri, 31 Mar 2023 16:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3F310E08C
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 16:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680280847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S5srYW34Gq6Rc0mPy9hqCIRWz9WH4Jy0yDiTUMwyFoY=;
 b=Gzaxn19ooxe7v4sNPZU0ntX/os8svxhi7B6DccezM66EZ61cG1s6+1c59xBHVG4pe16MTC
 ut+FnT0oiSKa1cFX92cmj203yIxW0VP/f18RMJ82hUzETWdaTKru+OTcOH3yx1SjKDAEPC
 D0ojHTj6zKzAx8aIk8L1z3k9Ni9blPk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-AKErOxmmPZypsRp-aFUyUQ-1; Fri, 31 Mar 2023 12:40:45 -0400
X-MC-Unique: AKErOxmmPZypsRp-aFUyUQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 c80-20020ae9ed53000000b007468c560e1bso10818499qkg.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680280845;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S5srYW34Gq6Rc0mPy9hqCIRWz9WH4Jy0yDiTUMwyFoY=;
 b=OZoU2TEYM5aIk5YMeAEP1nURADmaGAdFhDgA37jS9gJQDZysGJhzrO10uhsxjPPtuL
 UWGNpL9FnS2jYpfHpOraStCzRIn0n+X9bfrJ/9cZ2am+8hlsmyqyNAUJpsPNZCITNrdf
 QfY9Sdjt+LDp+PMaeFQHtrxwC8kdEFdaNkw55gms5fUvgVpJY3IWQH8FvqWaN+NLDDKv
 7QVdpO6rEsKQBZ6puHwL1FhomN4JYfXP35mNEtJwJWhevlNm6mNo0kFj3VIdHEA1n4tD
 63kxL13PLoc+qRLx+9Vi4TlqgFO3r6u+nBkxWhPl//gI3CWVlRTlojR7mllsA3wsDIqP
 lURg==
X-Gm-Message-State: AAQBX9c0mfRZpkH5vaETr/jNERf7MSx3i9AKezril4heawX7cm2ahaWF
 +5Pm2DOa09JoBFpqCr2thPlET4Wc5LK2KW7kSvtoP41MBu5BXVr2j5nxvkg32W+GOBfzHQ/PJ3i
 N7AKTGIZC7+S6EloHZJEDN0tejwbz
X-Received: by 2002:a05:622a:1a20:b0:3e3:9041:3f6e with SMTP id
 f32-20020a05622a1a2000b003e390413f6emr46722905qtb.7.1680280845100; 
 Fri, 31 Mar 2023 09:40:45 -0700 (PDT)
X-Google-Smtp-Source: AK7set9AlG21wz/QX/2UqrS1W/pPfMtig2JbymMss4of37EbHIk5FJiRqMt3PBrL7AF9Ryxd9BM1Yg==
X-Received: by 2002:a05:622a:1a20:b0:3e3:9041:3f6e with SMTP id
 f32-20020a05622a1a2000b003e390413f6emr46722869qtb.7.1680280844887; 
 Fri, 31 Mar 2023 09:40:44 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 c70-20020a379a49000000b00746ae84ea6csm797194qke.3.2023.03.31.09.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 09:40:44 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: evan.quan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com, Hawking.Zhang@amd.com, kenneth.feng@amd.com,
 lijo.lazar@amd.com, KevinYang.Wang@amd.com, tim.huang@amd.com,
 andrealmeid@igalia.com, Kun.Liu2@amd.com, mario.limonciello@amd.com
Subject: [PATCH] drm/amd/pm: remove unused num_of_active_display variable
Date: Fri, 31 Mar 2023 12:40:41 -0400
Message-Id: <20230331164041.1859088-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clang with W=1 reports
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:1700:6: error: variable
  'num_of_active_display' set but not used [-Werror,-Wunused-but-set-variable]
        int num_of_active_display = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index b5d64749990e..f93f7a9ed631 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1696,8 +1696,6 @@ static int smu_display_configuration_change(void *handle,
 					    const struct amd_pp_display_configuration *display_config)
 {
 	struct smu_context *smu = handle;
-	int index = 0;
-	int num_of_active_display = 0;
 
 	if (!smu->pm_enabled || !smu->adev->pm.dpm_enabled)
 		return -EOPNOTSUPP;
@@ -1708,11 +1706,6 @@ static int smu_display_configuration_change(void *handle,
 	smu_set_min_dcef_deep_sleep(smu,
 				    display_config->min_dcef_deep_sleep_set_clk / 100);
 
-	for (index = 0; index < display_config->num_path_including_non_display; index++) {
-		if (display_config->displays[index].controller_id != 0)
-			num_of_active_display++;
-	}
-
 	return 0;
 }
 
-- 
2.27.0

