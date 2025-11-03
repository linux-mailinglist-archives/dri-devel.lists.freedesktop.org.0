Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE8FC2CEEF
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED51410E436;
	Mon,  3 Nov 2025 15:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="dpnAlJi9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAC810E430
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:58:02 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-429c8632fcbso1586462f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 07:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762185481; x=1762790281; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8k4OPahllBy6sUVh2DoEGWIyKwEqM+wN18o+bKA/lCY=;
 b=dpnAlJi9bq3snaEXkWADk3fe8fjcVqRL7eKkhVRkwV5epiTKpPobyN4WmLmN2gRXlA
 nAs9gs9SiUPAhdB2k5lIvjdXbYEY1Ox/1CnkIGyj4GWIg7d3Muydn/Mgc3GjTWzxuSZ7
 9RLcuAmSZbqhk8P5dYIsvDF4APRVTexBuLO+HCLswsl9KbO4YP5ktKiYnSPEVBCUbQL/
 /Zrv+ML15gmLbOsIOrp/YyQpGDR/kAqrPX7zJ2jPPKM+1pCZ3eWMnExIDbu0dL4ZxHuY
 ot0sn53YQWEtL9/ZEVO0IHowx/ZCFeKa6ae9EF4WL+8AbWWkL8BzBUH3mexjHfJMRmMu
 plpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762185481; x=1762790281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8k4OPahllBy6sUVh2DoEGWIyKwEqM+wN18o+bKA/lCY=;
 b=np6qshs7z6MJYTz1EBG1nHcEwIVRrzfukh4N8CeEHmvoEyh0pL//TtNdCXnRCbUrVI
 OXC4YXP93fdClr6ZUP0y9VCra+/tch68a3Bru8ReerF++LFB/kAfHT/WN7i1KbT4bfY5
 mhVufCTyhSYjg3J54mTks+TmKQmKCEHa3txh8/oqWyaHfUqNrUtYGoPdDRRca71QdLDI
 YStiit+piXByrtXweOXLIBItBY5AP73kvWuTo8+8Ru9NdUuY6ysEwEbEMW8NVaeJu2Nd
 QtPPXgEx1ECqWyx4JfeX44ioEDPi+8wRu2gcs0SUYGXmubWJLaQJsAFSon2rOkeRg1Bs
 omwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGW4T1ELKo3/r9jCV6p1OAoTo0C4ILk5hMDH4OkcrKDxxxptX6J69MW5nUkWhWKl0odckGTv2OM28=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEXne7KlLJBjMS/WP+HCd9QvD4bXf9DWgo9pUpX8bRiS8RSiNt
 0SwrK+ap0p6RaKnRys9gjSG7ZRL72WMtegXgTnDsVtaw6H1e7L4g6BYZjycQ942zc2Q=
X-Gm-Gg: ASbGncveqnrcmWVoi31j400UnW4g4n2Cm9dVAJEhKz/8Hoc23yXDUCWN52gAfftW8zm
 +0lL7j2KOTGML7j/faO+sJZLm7fn16LL36KJ11O6Kvowt0OcDzbSOHZSzho372QnJGxsxrkH2hI
 gEHEA4hZjjsKvg/Cm8x6vPBSGVN3X5rHiLpQsTJ7aHODZk9umU95/B9zfn+T7osPoYxh0D6ToUn
 UFlzSciRurvC9MmyN7vcbNIeeNWQqsXYatCOvWetFEqFWde5233sFtuluUXc+PYUq5DlZDf/GO5
 hgub7LIbaieJiFdJwzpQe2Zs1bX0wUqnuz17AB3CMnncAYIctjk1TDXHfOxJxqMsb+kllRiwkTD
 hCrW4V7JV4FpYHZAJmTGtmGOkCgKUYmrQHqQJTgeEM+cbp860NKvhgF/IuWt2NPBRE470HQoVUZ
 6PcoFjdy5JklBeDvSvAtrb3pkFoll7Z6rYq61ShhGSUMb7JQ==
X-Google-Smtp-Source: AGHT+IEsAP1CwoepaQ2zRH4SCp73+KKlXjJIFyjaJAoEgcOUpETiFrS5vxDtmgLOOrIYEIDu1LsKXg==
X-Received: by 2002:a5d:5d13:0:b0:429:c4bb:fbcb with SMTP id
 ffacd0b85a97d-429c4bbfef1mr8526566f8f.28.1762185481404; 
 Mon, 03 Nov 2025 07:58:01 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47754adcd08sm48245e9.5.2025.11.03.07.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 07:58:01 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philip Yang <yangp@amd.com>
Subject: [PATCH v2 2/4] drm/amdgpu: replace use of system_wq with system_dfl_wq
Date: Mon,  3 Nov 2025 16:57:38 +0100
Message-ID: <20251103155740.250398-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251103155740.250398-1-marco.crivellari@suse.com>
References: <20251103155740.250398-1-marco.crivellari@suse.com>
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

system_wq is the per-cpu workqueue, replaced by system_percpu_wq. This
specific workload does not benefit from a per-cpu workqueue, so use the
new unbound workqueue instead (system_dfl_wq).

The above change introduced in the Workqueue API has been introduced by:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")

The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 041ee35684ed..fc61802444b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4805,7 +4805,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 		}
 		/* must succeed. */
 		amdgpu_ras_resume(adev);
-		queue_delayed_work(system_wq, &adev->delayed_init_work,
+		queue_delayed_work(system_dfl_wq, &adev->delayed_init_work,
 				   msecs_to_jiffies(AMDGPU_RESUME_MS));
 	}
 
@@ -5335,7 +5335,7 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
 	if (r)
 		goto exit;
 
-	queue_delayed_work(system_wq, &adev->delayed_init_work,
+	queue_delayed_work(system_dfl_wq, &adev->delayed_init_work,
 			   msecs_to_jiffies(AMDGPU_RESUME_MS));
 exit:
 	if (amdgpu_sriov_vf(adev)) {
-- 
2.51.1

