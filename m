Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5834C63E05A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 19:58:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D5C10E4AF;
	Wed, 30 Nov 2022 18:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E5510E4AF
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 18:57:55 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id k7so17586254pll.6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 10:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z9DRDfpuTxto0btyiBvLDBo0aAmHRlVAsle+L4IM7HE=;
 b=PNKkuryiCC03qi+nHXcczRpXoF+nnLD7QfK0NQGrVsLuscMwK3SS/+uPmUEr4pihne
 6ziHKGf3eqaB7fhkicVYQ9juKQeuQLPXHGgJqd2H6Fdu42vH43vrhkWyjAhR8Uoqfy2B
 yheasy/gYoQtCuBXKCb50oRutjSO53IBmuWM1ovrTYsf+tKYbhtsp7XiiL2rqcoXBsza
 b8DONcpKHUaPu8oG9L826eoSdO6GwP/0t2n9v5w9zDPUSUcaYwVnpGuT22ialgvsvReD
 eQX9wmLQjzit7nhIzaX7BAVxZy2OGc+nLFG7t5ZHcAWkT9uWEKciIvwgkZuFYBY2zstD
 pflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z9DRDfpuTxto0btyiBvLDBo0aAmHRlVAsle+L4IM7HE=;
 b=O48ibvSVWlgEf8g/nm1+P5uK0GsKjniMonmjbNBq2sSaxk67gXmEZepWQM9yBhrZEP
 TGnWhgVWTWmonIRwJS9qYMMgp+OXrO8/AJXVsUeiIKLAMmoTfkClZ66hkMyOdrl9XY0y
 mqvPbZ7WVUWLRCoBt7poLHYIoiLFoVuYsb4dp3ALmLxeqTbdyVmLNkmb6kuDBVGf7mkb
 dAvXfPVNNs5Lr21ka3fsRxPhNKnZ0jaAPxH+SwPNgHlgfE2B7+rhAIVk4ypb0OId8wR4
 tvrfpPCcg+qR3V4K5hl3oIBQYhBf+h4Ml3Y/3nfYWTOe7qNyMTG8DWR6vQNBlSgegysD
 grVw==
X-Gm-Message-State: ANoB5pnxM/OQkL06WUDhWe50Vp2ZGhj2DxsbM5Ak0uCSz/EaN1n4Uv6j
 ywy4w/d/vaZu/Nqm0/YAn9iWFkn9Xb0=
X-Google-Smtp-Source: AA0mqf42JG08PNHd3GskrjsNXuBk82rU6G24g+oLq5XewpXThxHwnd2fOBjGFYoRFhoBajyJ4p6Puw==
X-Received: by 2002:a17:902:e351:b0:189:6623:4c09 with SMTP id
 p17-20020a170902e35100b0018966234c09mr28576736plc.150.1669834674433; 
 Wed, 30 Nov 2022 10:57:54 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a170902b48600b0018982bf03b4sm1826768plr.117.2022.11.30.10.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 10:57:53 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/shmem-helper: Fix a couple of error path bugs
Date: Wed, 30 Nov 2022 10:57:46 -0800
Message-Id: <20221130185748.357410-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

A couple fixes for error paths that userspace could manage to trigger.

Rob Clark (2):
  drm/shmem-helper: Remove errant put in error path
  drm/shmem-helper: Avoid vm_open error paths

 drivers/gpu/drm/drm_gem_shmem_helper.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

-- 
2.38.1

