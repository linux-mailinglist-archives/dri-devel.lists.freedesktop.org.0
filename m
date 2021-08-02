Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5403DD46A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 13:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BFF6E092;
	Mon,  2 Aug 2021 11:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964196E092;
 Mon,  2 Aug 2021 11:01:06 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 b1-20020a17090a8001b029017700de3903so18601007pjn.1; 
 Mon, 02 Aug 2021 04:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+4PUslbRzXQEVcyLjM1+XzzP75b9QIYpCs6ACXDfVsQ=;
 b=PBNkxN6DWeczRn2gcRqifa1l8gMQiDGvhZH1FXQiXg2ttbO/odOC1ivcBqr8H01S0D
 jfsgV37/i8xj5A2z76bc+oO9ZiUJfPVGooTQzts+RmNLoQnUiSTCT/IOzHCYZ6yL6EQM
 cosIIp29pDNN1sbFff32hpjqpysYBO8OevzObUWgHJkyaoRN+pQMa6JSXmbMbWiY+z1r
 QmYH3s1ahk2DAjyNQuRCJ+0Nk4O55ASJjPnCD1sPHF3w09+As/JtRMHCHHjH0USSWBkI
 Pbnt60nBbzlkLd12fNE1rlrDN7KxV5ZOcIH0y243fIkNxLQT/aePqQtbY6syJf8z+A1u
 PSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+4PUslbRzXQEVcyLjM1+XzzP75b9QIYpCs6ACXDfVsQ=;
 b=WMIsjmdPrlcmYN+/uw+TPWHzXLzdz8DzS7GXrh4tmUsfEmoDD8JJTMBylbYM9H9Nr9
 iybaqnGMTwmnBD6z3Tn/V+FywfHfuzyoG+2sNHparB082N9MFcyjQHz+EV3YyhlAHn3X
 QX/XfI48KdD0DSCKGhigFtZGWXcqzGk8XNTBOdolQdFLiMh+n7nPOUahuYYVrxnpF1eW
 IUplVX6fpHBdejycBHgtcC8eSpN77BRb4CuKFrtKDDdr+GAAdap3HIz7wh2wKdbftLr1
 SIoOvSUW57pGANv8FD3VzwpffDr2E/gJyIbMHEZKy+q0p6SkIMhgqcx4/hBpX7Irp6ht
 RcVQ==
X-Gm-Message-State: AOAM5300VTVgT2X4SSiPXVdrWLNGsSowNwtk3vQEYOnY4vLK0mZdTQqe
 rUoqfF43IJ/sVKF8DwzkbMM=
X-Google-Smtp-Source: ABdhPJxYoSbH1KU580oT99tsfY14kH5fvF22HdTQpqe2O21iFrCt95Z3GnyJlCAhxGz0r3wEDKlm0A==
X-Received: by 2002:a17:903:22c6:b029:12c:8da8:fd49 with SMTP id
 y6-20020a17090322c6b029012c8da8fd49mr13360743plg.79.1627902066166; 
 Mon, 02 Aug 2021 04:01:06 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id v30sm9709158pgk.25.2021.08.02.04.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:01:05 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, longman@redhat.com, boqun.feng@gmail.com,
 sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [RESEND PATCH v2 0/2] locking/lockdep,
 drm: apply new lockdep assert in drm_auth.c
Date: Mon,  2 Aug 2021 18:59:55 +0800
Message-Id: <20210802105957.77692-1-desmondcheongzx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

My bad for the resend. Adding cc: intel-gfx, and the maintainers and
mailing lists for include/drm/drm_file.h.

Following a discussion on the patch ("drm: use the lookup lock in
drm_is_current_master") [1], Peter Zijlstra proposed new lockdep_assert
helpers to make it convenient to compose lockdep checks together.

This series includes the patch that introduces the new lockdep helpers,
then utilizes these helpers in drm_is_current_master_locked in the
following patch.

v1 -> v2:
Patch 2:
- Updated the kerneldoc on the lock design of drm_file.master to explain
the use of lockdep_assert(). As suggested by Boqun Feng.

Link: https://lore.kernel.org/lkml/20210722092929.244629-2-desmondcheongzx@gmail.com/ [1]

Best wishes,
Desmond

Desmond Cheong Zhi Xi (1):
  drm: add lockdep assert to drm_is_current_master_locked

Peter Zijlstra (1):
  locking/lockdep: Provide lockdep_assert{,_once}() helpers

 drivers/gpu/drm/drm_auth.c |  6 +++---
 include/drm/drm_file.h     |  4 ++++
 include/linux/lockdep.h    | 41 +++++++++++++++++++-------------------
 3 files changed, 28 insertions(+), 23 deletions(-)

-- 
2.25.1

