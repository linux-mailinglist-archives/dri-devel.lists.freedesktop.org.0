Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C043646AA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 17:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF9489F9F;
	Mon, 19 Apr 2021 15:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589AE89F9F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 15:03:47 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id g17so40426743edm.6
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 08:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OXFx+n1AMQvwAtX2ANI3rRZXcsHjDRiIiHwYqRCFtTA=;
 b=V8z5t2lMwxqnMquWE0kaPRGcE+epfh0UKyAzflP18e0RTGqB/wwiemTFrws2ZEf4rP
 gZv4oeAa2kEzyW/qdiwwW7R36UUSn71VGUfq3eDFfjgCiChExiJQ/4tdWSXlFI6HRhCH
 sJ7ITM9/kBYT+bPm3h/v4gFNx1qWhpFmdrTPVQblAIj62wRqVAUWnbL00lqYnbtwtzvE
 +uWYA+xLlEWL258JI5kCC0jPWb8TcTCA7UcbGwIgRxrOGxQR3IvfJhdto9F9iOq5JkOZ
 k5/IZVHTumcwR8lF984bMBoZ0Gv6beiFOOlhoQvi7xwxaB+KTv73e736RbAYoisQkuPc
 DXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OXFx+n1AMQvwAtX2ANI3rRZXcsHjDRiIiHwYqRCFtTA=;
 b=Im78/vTGLgS0JQimnv+jM8ezd6F6VFWt1jr51iVed13EyyGyCqFPPRx+qGLrdtQ6YJ
 E4QU69yE2ePF0odtCVet776vsGlwu0x5IP5Tcs7JkYGpGIjCZuT/Gx6txtGTsjgSQVMu
 8scKjBatsACPewK2I9ItHnnuTFM57rWzcyJun0v5JrR91oqI7otIaDVUv0Xmjch4ftnt
 rhjN3bt+cfBe9zumzUeAkdPzYINhUk1ObNWA0vUnFyWfO7LxEl4HNHTlydJoXGa9BhvJ
 bCVTL0GsoydobDh1uB15DC4JLfczjtf6aVADne/af8t6dTHdeTwc63F38oC2ArW0h35V
 ml3w==
X-Gm-Message-State: AOAM5320IyYiZnig1syNIHvjiGYbvpCuWNOZxyqj5olRUIiTlTc3ki47
 Ct8gLSi/aFqJaaBLKtf/2PkEnV65D9NZ8E0M
X-Google-Smtp-Source: ABdhPJxymZ75kw7odWyFTAG/0ew41z6cx4KWsAoHB5QWiJqTv+bgT5bSw5H0L+DrOis2/dezGVRmrw==
X-Received: by 2002:aa7:d787:: with SMTP id s7mr7830676edq.240.1618844625996; 
 Mon, 19 Apr 2021 08:03:45 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id o5sm1965954edc.8.2021.04.19.08.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 08:03:45 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>
Subject: [PATCH v2 0/2] Replace drm_modeset_*_all with DRM_MODESET_LOCK_ALL_*
Date: Mon, 19 Apr 2021 17:03:39 +0200
Message-Id: <20210419150341.24959-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the deprecated API with new helpers, according to the TODO list
of the DRM subsystem. The new API has been introduced with commit 
b7ea04d299c7: DRM_MODESET_LOCK_ALL_BEGIN() simplifies grabbing all modeset 
locks using a local context. This has the advantage of reducing boilerplate.

Changes from v1: Added further information to the commit message.

Fabio M. De Francesco (2):
  drm/amd/amdgpu/amdgpu_device.c: Replace drm_modeset_*_all with
    DRM_MODESET_LOCK_ALL_*
  drm/amd/amdgpu/amdgpu_drv.c: Replace drm_modeset_*_all with
    DRM_MODESET_LOCK_ALL_*

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 ++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  6 ++++--
 2 files changed, 16 insertions(+), 8 deletions(-)

-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
