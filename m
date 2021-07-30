Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D49F3DB226
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 06:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF666F3AA;
	Fri, 30 Jul 2021 04:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F62E6F3AA
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 04:15:43 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id k1so9504659plt.12
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 21:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ps4IOmc17WySeTSgvo3uD/BUf6CSyI+vUb3e7yZqyFw=;
 b=OUrY581BKpj1tZ35umAHWh0e42+XyE080rD3dk0rmx2YEf+L22+XObDcnJWZOf4+bB
 F4RVXAVGzALNEvXX5aKZSdADknVAT+gVJfBSmZJbL1jRpQ8cL5uiM0JVZWBdBAj06BNy
 1YiEUvKctStw3zvAOm/wS0Axwd6ExSoyNsGPuBWoFA0Hr1q0osa0+2ImFTtTv78Wn9On
 1pYLoNzShbUfviuLZxRdMeMar2lVVfkocmFkDP/1tnn8kWPvNLZZ8b6gEkMFs3hL0mC8
 VRC9zMg86AQAoFNtjwGVrpO9fOUg942dJ9jQQ8Vip4+6LCEXCUUjui5/suNmQvvjjlaK
 Xzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ps4IOmc17WySeTSgvo3uD/BUf6CSyI+vUb3e7yZqyFw=;
 b=cMSRPDQs9K8q3CYOEM5UMzwfNOiR0FHLLvXxBS+00Ko69JnRTlDxrql9SlANGbLpgK
 deN4WY1xuyHPUSuqbi8RijLtoDCcnaoTSRxc2w0q8nYuPRmc0SfTb+frER6oHXa1BmRR
 Bu88pmwthFLehOYdKiLXCpJCh4gVChgRan/7QGTNacnanCrX8KEdaoJJeMV5hOpqw5zt
 YcWyuDt1Hu6r0Yt9tLFCcpoJxyKF00f5EbyR6ymCP2P0/uMvL8J+qmXWo6fbiH66Z3Wo
 5OPdJ2dJ8VQDyQXdzcXVoYS3EWlZM2ngAJ2z0ES932jNeBcwadO2Exxq7TpCYUmb22LM
 c3Dw==
X-Gm-Message-State: AOAM531c5G7Jjq6xnP0yrzlPymeMZJZdHraYkulqyAsIl0OAlNFa+Hg4
 BQlwUJmkyl2Zfa1Ma5Y+EQc=
X-Google-Smtp-Source: ABdhPJybNXzwf1afATACd4SoNNQWUK7gXTndoS2hYEHp5ijscoZl7YjagXGkzLzBsdMgVdCBa96Beg==
X-Received: by 2002:a17:90a:c902:: with SMTP id
 v2mr1012698pjt.136.1627618542716; 
 Thu, 29 Jul 2021 21:15:42 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id t19sm439322pfg.216.2021.07.29.21.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 21:15:42 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, longman@redhat.com, boqun.feng@gmail.com
Subject: [PATCH 0/2] locking/lockdep,
 drm: apply new lockdep assert in drm_auth.c
Date: Fri, 30 Jul 2021 12:15:13 +0800
Message-Id: <20210730041515.1430237-1-desmondcheongzx@gmail.com>
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, skhan@linuxfoundation.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Following a discussion on the patch ("drm: use the lookup lock in
drm_is_current_master") [1], Peter Zijlstra proposed new lockdep_assert
helpers to make it convenient to compose lockdep checks together.

This series includes the patch that introduces the new lockdep helpers,
then utilizes these helpers in drm_is_current_master_locked in the
following patch.

Link: https://lore.kernel.org/lkml/20210722092929.244629-2-desmondcheongzx@gmail.com/ [1]

Best wishes,
Desmond

Desmond Cheong Zhi Xi (1):
  drm: add lockdep assert to drm_is_current_master_locked

Peter Zijlstra (1):
  locking/lockdep: Provide lockdep_assert{,_once}() helpers

 drivers/gpu/drm/drm_auth.c |  6 +++---
 include/linux/lockdep.h    | 41 +++++++++++++++++++-------------------
 2 files changed, 24 insertions(+), 23 deletions(-)

-- 
2.25.1

