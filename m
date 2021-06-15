Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9753A7422
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 04:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6F96E1CF;
	Tue, 15 Jun 2021 02:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE406E1CF
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 02:37:31 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id g6so12122593pfq.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 19:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XZngOmx3QZGSGE9q4/ABb06fw8+v1CSMYNte3U/V958=;
 b=j8BK1QDugcRXfg29Tqm6PhfSwlMgaC9EAqEaNluYMNCwd1ZYqElpq+kpbUktZ/urN4
 MVFmsPENeAISNrJygUJCEH0UF3af93a34tumnmJViTDG/YGE/wodIWkh6IlvmCndB6+C
 dhDr528Ave7TwpBKkGjCQI5PK87kyPYmJvipI4DE38MSn+6feAKYNBkQV19h8yNjhNDr
 UYugo4buc+C0+WvrHfvDhza6lHEJ+JjmM2oqHjcwqmDbG1d19wnfbfgHbu/EGX3jc2Tu
 jTh8f5lXw1t0Dqjad76TQQ7B/0slKvtYlcdMqP/585LM2WdakYuYfAYdSziFLM0+kJIK
 /K5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XZngOmx3QZGSGE9q4/ABb06fw8+v1CSMYNte3U/V958=;
 b=qAdWq+1qAdR4wNyast2tZv1b0POtdQodFX91l9inTPtOHzSW4Htsc/m1ZS3Vxa3pgF
 TxifieAMHjkHLx3h+OtJPrML7c3JxkHLFkd1qnOilhYCDpCO0B2fxzNBuj4u0Mkem3WZ
 ZnRfM4IlL/pBvkqzD18W9I7cegAjQ4Z0btpzbkDSeB0q00YEVHKXamfsW56LGwXfK+WW
 NQqU+ViRzFMV6tkaMK8n3KFt/wmKH9NARvAvLh+5gp2AGiqVFz2IH1Oq1uiNx+nooybq
 BuRfCKG1GzUsBFKOh7DPGPpAkQjUV0BpFgVD6usy0FUowXhe5HU7uGdtSVgaES+P3vK1
 jY9Q==
X-Gm-Message-State: AOAM5325u1PxKR4ATBajt99YIQaABxCqcYGwR7EO4zTLLWwOaxy/wAfA
 uEPMIc7tiKcyIgvN6hwTzFw=
X-Google-Smtp-Source: ABdhPJwkiRcyYOeOqxFuMqJ+7O0OK1G86N3d9NPQLqADbQgmmfevSGkqOf0Dpo41Ig68e77DvD7ZZA==
X-Received: by 2002:a63:ce07:: with SMTP id y7mr3664904pgf.249.1623724650822; 
 Mon, 14 Jun 2021 19:37:30 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id b133sm14102623pfb.36.2021.06.14.19.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 19:37:30 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 0/2] drm: Address potential UAF bugs with drm_master ptrs
Date: Tue, 15 Jun 2021 10:36:43 +0800
Message-Id: <20210615023645.6535-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: gregkh@linuxfoundation.org, emil.l.velikov@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series addresses potential use-after-free errors when dereferencing pointers to struct drm_master. These were identified after one such bug was caught by Syzbot in drm_getunique():
https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803

The series is broken up into two patches:

1. Implement a locked version of drm_is_current_master() function that's used within drm_auth.c

2. Identify areas in drm_lease.c where pointers to struct drm_master are dereferenced, and ensure that the master pointers are protected by a mutex


Change in v2:
- Patch 2: Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_get_lease_ioctl, as suggested by Emil Velikov

Desmond Cheong Zhi Xi (2):
  drm: Add a locked version of drm_is_current_master
  drm: Protect drm_master pointers in drm_lease.c

 drivers/gpu/drm/drm_auth.c  | 23 ++++++++++++---
 drivers/gpu/drm/drm_lease.c | 58 +++++++++++++++++++++++++++----------
 2 files changed, 62 insertions(+), 19 deletions(-)

-- 
2.25.1

