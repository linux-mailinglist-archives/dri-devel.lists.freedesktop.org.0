Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 507B46EAF02
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 18:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C40310EE66;
	Fri, 21 Apr 2023 16:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B7C10EE69
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 16:27:53 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-b98434b5311so2031217276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 09:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682094472; x=1684686472;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9+xE3Wm1qodu869l4ok3XAYSCDo7yF+Nc6Y5zDXcnPg=;
 b=i/+PgShiQL5qfbfdoXayj+fkkTBr4G2sffw6vbWqyRDC5jytqUXFdY7HR8Kz8kLzTk
 S/IvwVuN0BnrdnbIDQr5PDkagYcQHaRddEjoOSpNh4+/YY8bw+zXUOPrv11iguHY78h/
 n46AIwA4t9t7e7neoCJBSOzQhKxwQcbIT0Q2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682094472; x=1684686472;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9+xE3Wm1qodu869l4ok3XAYSCDo7yF+Nc6Y5zDXcnPg=;
 b=XEzYK/k+T+BvyiiqswyWjZxZu9u3aGlwU47tSwTGUgIqxx3wXbZosY5EhDXyw5OzPi
 6OKDs/Rhfj9iQ3QXm75urOYdiw0OboXzwgsRmYN0XRT+mbf0tMvUEcr+yD2vZ7ami0On
 Wc7YPMZaaqYZN0I5srmVdjm3gMcTSA4GChnLjEaL3Tni6p5TFmhFF78iEOh6he+tLekc
 GsyWMJorqHvN7XGEbw+ihezE6tLePXlXvRK2vTN8ROwr6neYBkaYArDO8ikkbulE9TwT
 RZy7pH7Yhshyyzo9hk2V0PG2aTNoFZSYiNCgruMPgEdLevlsCuD+sKJK1/ghKZYrxHoE
 zQQg==
X-Gm-Message-State: AAQBX9d22vKVIhbPUFiPlxmvy9wgHdthiNb/czmCTw8LvRFrH4qMhVJv
 /7Fpz8MNxpgBI/6VBAUhPVQMSu/Bm0+rScoBVIQ=
X-Google-Smtp-Source: AKy350Z+WJv+LAd8zAQUyDHILjfQyRmgLWJkgn0t4i2NQ8+FMiduNDEWQhEvOqPJQCY9wgkOuQer2Q==
X-Received: by 2002:a25:694b:0:b0:b95:8ccd:e9e6 with SMTP id
 e72-20020a25694b000000b00b958ccde9e6mr2835096ybc.37.1682094471939; 
 Fri, 21 Apr 2023 09:27:51 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:25e5:2115:c97c:bf00])
 by smtp.gmail.com with UTF8SMTPSA id
 t1-20020a0dea01000000b00545a08184fesm1013673ywe.142.2023.04.21.09.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 09:27:51 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/3] Create Content Protection Property and Use it
Date: Fri, 21 Apr 2023 12:27:46 -0400
Message-ID: <20230421162749.360777-1-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
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
Cc: dmitry.baryshkov@linaro.org, Mark Yacoub <markyacoub@chromium.org>,
 seanpaul@chromium.org, dianders@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@chromium.org>

Hi all, 
Following up to my HDCP patches[1], this series introduces a new connector prop that is required to push the key from user space to a driver that requires a key from user space to enable HDCP on a connector.

Patch 1 is the WO blob patch to protect the key
Patch 2 is the DRM code that creates this prop.
Patch 3 is the MSM driver making use of the value of this prop

V2: Added the WO property blob

Thanks,
Mark Yacoub

[1] https://patchwork.freedesktop.org/series/94713/

Mark Yacoub (3):
  drm: Create support for Write-Only property blob
  DRM: Create new Content Protection connector property
  dp_hdcp: Get the hdcp key from the connector prop

 drivers/gpu/drm/drm_atomic_uapi.c |  9 +++++
 drivers/gpu/drm/drm_property.c    |  3 +-
 drivers/gpu/drm/msm/dp/dp_hdcp.c  | 66 ++++++++++++++++++++++++++++---
 include/drm/drm_connector.h       |  6 +++
 include/drm/drm_mode_config.h     |  6 +++
 include/drm/drm_property.h        |  2 +
 include/uapi/drm/drm_mode.h       |  6 +++
 7 files changed, 92 insertions(+), 6 deletions(-)

-- 
2.40.0.634.g4ca3ef3211-goog

