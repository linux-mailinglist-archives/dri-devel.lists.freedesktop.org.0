Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58124A13A6D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 14:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD3A10E597;
	Thu, 16 Jan 2025 13:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="WRFka4dg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A8C10E597
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 13:06:39 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-216634dd574so9494615ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 05:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1737032739; x=1737637539; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H/o57V/vV+aGa4K/rLu8+cuyK2mmORob2MdKMJfcAVQ=;
 b=WRFka4dgQBCI2lKiwVmEZybFkt9VfivMPrnlnzQgmifyCDBU6ZkQwOfj8fUIXo4ZLL
 9QrxDPw8czgygzs4Pc+x6Yxh/KmGQ8fxg915Jy1WPNnKMwgXn+KtsXzpUbsA7xyRZoiT
 NK2wEGNHcIFU8gfJVW0PQ450K3TJK5bm7+vRBr3xJZEVneCd4KR69JzSouy2GE6m+MUB
 ljhhUnKipY19UWHlLwpEirc6HVkKTwOyYonbvA5dQjNW3foJyR+JYIoQuyIGHnK09zAK
 4iZz1H3nQ8dUnGSWaD4gUG+jcm7FwHQDfFcYTYjJH7cyaW64eiyWJhV6AXyYSViYqz3G
 EN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737032739; x=1737637539;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H/o57V/vV+aGa4K/rLu8+cuyK2mmORob2MdKMJfcAVQ=;
 b=AO1Dc8CVif7q7lOU3Je6pLM3rPwR8fSobFbLJAdEPTgePmEtIDAgJBUdqs6+DeCNXc
 ap2Q/1+G1JeoaEtpf8TCusBdKuvNLgMRPIaN30S5pqTVmGKhR6C03hJKUxEPyQZxTyks
 zvyJXU9QUd73Wlosm/qqKTCh2TNIEWf8xYpRX23vnAwW9sY4NQi6FEOzkn4QDyqrKxPN
 WuOT5YYszyxbI7Luqh4SRa5jCdGvEwrxB92yb/kyOyyYEDHipeTn5gyilgpKNQ/p6z7T
 36MmSWMrJvpXnerEzJTghhrf6vjCYnwUbRji6cYR+yRbB0jD+uXfsbI2vgLxza8GlJr3
 pU4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOtNm9ZeXdAKSDR3ZKK2IGUJfUb9mGKyxrY4GldshZgSDAf+0adISSyoVp73qQENN1lRU5TP9wCaQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywsqh3GSK+zTTeKJKX6MS/gm5X2zTEabEfdkAoQrIQ5k+p9muv0
 U6hvhevyFnMCwCcODu8E7qgJ8xRcGlhXnwOB968jPIBiA16N/GFIpldSJuPmi8Q=
X-Gm-Gg: ASbGncspOXi62tW35OBZ8d8l6Zb4DRV586OMGBsaNPuX/OcKoSaxuL2D6VZTZiXhCCA
 2ARCfpLU5oXaXwE9UxaYCj/AtxysZWpfg5gNyKahP34ki7sE9XfYhOxE50w6HCtB4eIIMzabfae
 ykRCSyyLSvuDsyCqzrlGbhXuP8Mz37EEieLEsn/ykSbCFFP0XFXR0hND7zVPG4N379Z9Gqmi+dp
 L7KhwAyknGijEKpw8wUqMG3nxcoFEonELM93otx4DBI+hffVadWOp1HNRDAf7flEvONKlxhrqOK
 2ihzi0LD7xcZ+GYHqT9MAr1AcRFc
X-Google-Smtp-Source: AGHT+IE9L9uY+6el/9Inm9AUrjq1Z3380oZ1KcIlgZNqzSQRRL8IMrdhmv5N+4HjQFAdESRzhw8XdQ==
X-Received: by 2002:a17:90a:d64b:b0:2ee:94d1:7a9d with SMTP id
 98e67ed59e1d1-2f548f416b4mr39794533a91.32.1737032739094; 
 Thu, 16 Jan 2025 05:05:39 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f72c2f6bd8sm3228975a91.43.2025.01.16.05.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 05:05:38 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v1 0/2] support for kingdisplay-kd110n11-51ie and
 starry-2082109qfh040022-50e MIPI-DSI panels
Date: Thu, 16 Jan 2025 21:05:30 +0800
Message-Id: <20250116130530.3010117-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
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

The kingdisplay-kd110n11-51ie and starry-2082109qfh040022-50e are both 10.95" TFT panels.
which fits in nicely with the existing panel-boe-tv101wum-nl6 driver.From the datasheet,
MIPI needs to keep the LP11 state before the lcm_reset pin is pulled high, so increase lp11_before_reset flag.

Langyan Ye (2):
  drm/panel: boe-tv101wum-nl6: support for kingdisplay-kd110n11-51ie
    MIPI-DSI panel
  drm/panel: boe-tv101wum-nl6: support for starry-2082109qfh040022-50e
    MIPI-DSI panel

 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 270 ++++++++++++++++++
 1 file changed, 270 insertions(+)

-- 
2.34.1

