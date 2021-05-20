Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B3E389A74
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 02:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0415F6E4BA;
	Thu, 20 May 2021 00:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867876E33F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 00:25:21 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id z4so5812846plg.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 17:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HnUlRSyazCKo9xmvcnsazZcLuVKlbVM14ntknUcnp7c=;
 b=lppee0aykW6DYsEq7WnlEJbxTzvXzKJZXA4Qci82EhIxzNrqkndVPltAPRRrIfjq4z
 Jgc1SlTGuIp/GPyI+PPl8PhKEreGx4dRNFDMme/gHvgkY9T4MFHnMK5bg6FWiXoVn/M2
 /uaDGv8cnGuege3fZ3SZLURqHSRmzAZBFQ0e4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HnUlRSyazCKo9xmvcnsazZcLuVKlbVM14ntknUcnp7c=;
 b=pA+1IQ0LdwqVKmasq19zyOyJeeuwtViCKJVhdT+3ue0K7hDkwvI/NqHdaZFKXbpGIm
 8RpeVdKkf0H3mfZZhUXkcuVth+5DqLkOprL2IF6E/AD5iJlPOd8dXbdMJqyKadhPoQ4J
 8Bu5kxNrV5Ec86e7kNwCRBUm5Y7PWx/SGlQFmn2+FszB+dMjGhnKuDrIOCxweh90RuC2
 d0rfbL4Uegj9BsAhsMolD5G4QTxuqugC3Nq4Agzsy+6Z4qk6SAbH5I04iLpSdKg8N2YI
 gkFiX2AR0kAnoWykmRDCX+u+dURylrHxjnEY4oN4PhjG2j8pbG8czwbgzoGKiS4FfjQ2
 R1Pw==
X-Gm-Message-State: AOAM532oKPOMdQd44iQipvWjBQoQxXVwJj3fhcoXP0bcYdn5IsckqLd4
 sSsu3UuOxdaLB1Js9eXd8M95VI0Xj/emqA==
X-Google-Smtp-Source: ABdhPJwC3IwDI2gFp43UHpOegES+CCjEkSMmtGwVPcBzLAlKbgcBury8x7ZAosf/PakNL9RQbOsijQ==
X-Received: by 2002:a17:902:d4c3:b029:ee:ae62:9fb7 with SMTP id
 o3-20020a170902d4c3b02900eeae629fb7mr2675752plg.8.1621470321058; 
 Wed, 19 May 2021 17:25:21 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:200b:db75:4e6c:8b96])
 by smtp.gmail.com with ESMTPSA id i14sm398904pfk.130.2021.05.19.17.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 17:25:20 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/7] component: Make into an aggregate bus
Date: Wed, 19 May 2021 17:25:12 -0700
Message-Id: <20210520002519.3538432-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is from discussion we had on reordering the device lists for
drm shutdown paths[1]. I've introduced an 'aggregate' bus that we put
the aggregate device onto and then we probe the device once all the
components are probed and call component_add(). The probe/remove hooks
are where the bind/unbind calls go, and then a shutdown hook is added
that can be used to shutdown the drm display pipeline at the right time.

This works for me on my sc7180 board, but I'm currently struggling with
the last patch where we migrate the msm driver. It runs into a runtime
PM problem where the parent device isn't runtime PM enabled yet. I'm
still trying to figure out a clean solution there. Moving runtime PM
around breaks boot and I think that's because the power domain is off.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>

[1] https://lore.kernel.org/r/20210508074118.1621729-1-swboyd@chromium.org

Stephen Boyd (7):
  component: Drop 'dev' argument to component_match_realloc()
  component: Rename 'dev' to 'parent'
  component: Introduce struct aggregate_device
  component: Introduce the aggregate bus_type
  component: Use dev.parent instead of adev->parent
  component: Move struct aggregate_device out to header file
  drm/msm: Migrate to aggregate driver

 drivers/base/component.c      | 614 ++++++++++++++++++++++------------
 drivers/gpu/drm/msm/msm_drv.c |  47 +--
 include/linux/component.h     |  73 +++-
 3 files changed, 487 insertions(+), 247 deletions(-)


base-commit: 6efb943b8616ec53a5e444193dccf1af9ad627b5
-- 
https://chromeos.dev

