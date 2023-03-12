Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 949BA6B6C89
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 00:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52CB10E29E;
	Sun, 12 Mar 2023 23:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAEBD10E28D;
 Sun, 12 Mar 2023 23:31:42 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id ek18so10809180edb.6;
 Sun, 12 Mar 2023 16:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678663901;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U2rvudHbVOnChl+qv6wpA7Rv7tbiy4zwUQFXOr8Etec=;
 b=M4/CsfGzgYjfR7vq5RWFJ5NA/pMXRo9vyLWdReUw7STD/2XdCxaVrFJRa4ZwO2bLmO
 cAbypT6lboJKehK2335G5sBAX4mdmJB3Tao+wqKFNhRtAKiEQhndA+VpWe+V4voxJRHR
 N4nl9TpP/BiydCJS7P9dKDpHwZCL8CHV0yC1B7nPuH0rX09IbJpvi2CWmpS5URHn5QHc
 V26+32xE+wpVbpsImlYyGimR90E4HcPUsvB6eJ/8asG/nB1exwojkmnJkc+JdeamOA7y
 suxmpk+S5r8KvRNhQ7fCRvWg7OK9c2SwRKv1WxDhRyxeEpaCfCKSXfc6HhHfeyIYjJwz
 d8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678663901;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U2rvudHbVOnChl+qv6wpA7Rv7tbiy4zwUQFXOr8Etec=;
 b=2Bnp/jhkB6AqgXo1qSbD5x99YHFBlvFHSec4AEqRJ7bDuv81A0NaBBs9gVfwTmrsJk
 BgTU6EM0WgRTYL5XtlH9ueihZ50LEfWIwUb28jWE8ktp53o4N74ZQl9a1usNyTn9kv9F
 mBGLUIsRn5BL7Gj0cxrwPyjL3fsf5476Xn3MIKL3vzjpl7wQUJUa4Un6qxM0zj6bV3xk
 pRNHIV+kMR3ZjLsYQYYZz02A8CZHDHl+fv0+8yUuHit0aFAC5g0sI3Gvjm5cORJPp3uf
 NrGf4bJb8M38EPwbFGKxYBFi3UpWuQ+2z9bzLajubVIFser98VM1N8JtmeRho8SJEkKo
 i5kg==
X-Gm-Message-State: AO0yUKUiTWp0EceCf6fEAsrh/FMWaQex4Gh4YMrmKA/TfPKkhivFIsSL
 jA6YRkXwnuLTe+RTOEu6vDg=
X-Google-Smtp-Source: AK7set8cQScks8ot0O62oZWVmp8qWom24It6qknbChj5ZCrWu4454GxJehIokI7MUfPZAkYOO++kbQ==
X-Received: by 2002:a17:906:1c59:b0:924:a66:df8e with SMTP id
 l25-20020a1709061c5900b009240a66df8emr4940857ejg.26.1678663901294; 
 Sun, 12 Mar 2023 16:31:41 -0700 (PDT)
Received: from centennial.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 vv11-20020a170907a68b00b009226f644a07sm2009958ejc.139.2023.03.12.16.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 16:31:40 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/lima: expose usage statistics via fdinfo
Date: Mon, 13 Mar 2023 00:30:49 +0100
Message-Id: <20230312233052.21095-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, Erico Nunes <nunes.erico@gmail.com>,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expose lima gp and pp usage stats through fdinfo, following
Documentation/gpu/drm-usage-stats.rst.
Borrowed from these previous implementations:

"df622729ddbf drm/scheduler: track GPU active time per entity" added
usage time accounting to drm scheduler, which is where the data used
here comes from.

Then the main implementation is based on these etnaviv commits:
"d306788b6e1b drm/etnaviv: allocate unique ID per drm_file" and
"97804a133c68 drm/etnaviv: export client GPU usage statistics via
fdinfo"

Also "874442541133 drm/amdgpu: Add show_fdinfo() interface" since lima
has a context manager very similar to amdgpu and all contexts created
(and released) at the ctx_mgr level need to be accounted for.

Tested with the generic "gputop" tool currently available as patches to
igt, a sample run with this patchset looks like this:

DRM minor 128
    PID               NAME             gp                        pp
    4322   glmark2-es2-way |█████▊                  ||██████████████████      |
    3561            weston |▎                       ||███▌                    |
    4159          Xwayland |▏                       ||▉                       |
    4154          glxgears |▏                       ||▎                       |
    3661           firefox |▏                       ||▏                       |


Erico Nunes (3):
  drm/lima: add usage counting method to ctx_mgr
  drm/lima: allocate unique id per drm_file
  drm/lima: add show_fdinfo for drm usage stats

 drivers/gpu/drm/lima/lima_ctx.c    | 30 ++++++++++++++++++++-
 drivers/gpu/drm/lima/lima_ctx.h    |  3 +++
 drivers/gpu/drm/lima/lima_device.h |  3 +++
 drivers/gpu/drm/lima/lima_drv.c    | 43 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/lima/lima_drv.h    |  1 +
 5 files changed, 78 insertions(+), 2 deletions(-)

-- 
2.39.2

