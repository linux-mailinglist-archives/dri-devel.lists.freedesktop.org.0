Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C0AC2456C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B6410E280;
	Fri, 31 Oct 2025 10:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="CU7mousQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7640110E280
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:04:56 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7a2852819a8so2013767b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1761905096; x=1762509896; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UvssMcqLHNZRnyHGAkwUA5kNWfzI5bQpc+DN0zFiz7s=;
 b=CU7mousQZDJr5U7mJQdiHgrmC0JrnJhFF945xDbD5s9tdOkQ66pkrfYXXlFTomlOkV
 Ywtqml70jOIQBnSwwVXEKWt5Q+in9OZW9zEF/iHCRL1aq1OS1ZNVa38hbhb1F+72CRkv
 +pS+Pb42V9THot1z9eta8jJbsFVUcBUDbTmfiDT2g+5bI5BcYprCiHsH+znGmyKmonPw
 fByuR9prFwzhhIwjFSjosEkc9SZWKUlkuhAUXLMscLTmRiLeHLq6HepbjqFTpinCG+37
 Xik0GWUGQUMLAiJgLPAhLHxcl89Z62Mm26jgoPtC2S5mWO1BywqvhPh44zAl+L35qz8B
 DWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761905096; x=1762509896;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UvssMcqLHNZRnyHGAkwUA5kNWfzI5bQpc+DN0zFiz7s=;
 b=tJVUUFaUDyV+TuVf1nzAjcOz/23Invq0zNkHz34NlfP0ZGJGKqN3rKMo0B3Sp6X6NE
 25CdqovJPptnvLRTUIWdPcvlvOQnW4aLonokCN24ZrxxJQTmW6NdKEWvDiV8+oLQdDWB
 BdJg9B63iz26hxKyaDx1GeNYkGNLBzBZt7IQItoVGS05TVEGL47lgcdOwrgBvqsJyHNa
 JK5sWswcGfA1aCrHpXEWv15lyTwyZ1PPwLg04qIU7jQNbb+wAysXmsMjHu5ZRlFkn6Z/
 0/EPec8aRKzEabH6qEfeqp2Avo4ESq8WKL7crDnUXeVtDG1zgmvg9k9UOvssnwQfWuoF
 79Bw==
X-Gm-Message-State: AOJu0Yy4hZaTEtPJHHMX7rJcIqLqJGsxnNmQpwdiP+uPCeCdZ7ib/A1p
 9zn+FTjbynqN70orzSK7fMPTNXoL+aqnSuRP9OUgGeCkUFU9gBw8VX3tOik6k16lnL8=
X-Gm-Gg: ASbGncu8mdbvD6G2mSS6tOAFaOjzuO3yGd9U1D5rvnWfsSh4ht+RRJvk4fMRkENesO5
 g1OBJDOd6ibm7UQGNRxVf3D8+JUxrJFM2VWLlr9w22WMiagkEzZiLMQRAqgwttxvTzVXLrccYUg
 tANCCNhvBSVm7+LepqU8xi6xMyo2yxPBNY94lD5VHIjy/N9klTICLMNB0RRElfHXXktLCdz5dyR
 ADS7e5tN+tKd564AiuOnS+lxGX891xXnE+d4IdqxRzHUrJuDIMKbiZqbXJTS3hLePBYmnBal9hk
 Z5pC5iEcAicsFyJpDYwI5pz7+s2d8fEM6c252ueALJ0z0UwWttGrk2u0fx8ThRsXZFJuVtZjD4Q
 iVCglYhu/yAz3z3PFw/xHST+AdISopkGegPi7hCGqFYLEq9pqwlqs8HbhiNaE3j7lYeCRL2Ch8/
 2BW/LwC0Ssq7j9MzCSME9fthlK6DrQcg1nCrPeX9w+2NCN3QYYpr2G5LPJxA==
X-Google-Smtp-Source: AGHT+IE76fjQ4yD5hDeKMEFGATyM20a1IgpN+btK/m7ndkZxEYOWPa8WOPUvju+PU35yBX2pyjsaHA==
X-Received: by 2002:a05:6a00:148d:b0:792:f084:404f with SMTP id
 d2e1a72fcca58-7a7748476femr3809021b3a.0.1761905095714; 
 Fri, 31 Oct 2025 03:04:55 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a7d8982117sm1644352b3a.15.2025.10.31.03.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:04:55 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v5 0/2] drm/panel: ilitek-ili9882t: Add support for Ilitek
 IL79900A-based panels
Date: Fri, 31 Oct 2025 18:04:45 +0800
Message-Id: <20251031100447.253164-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds support for the Tianma TL121BVMS07-00 panel, which uses
the Ilitek IL79900A display controller.

Following review feedback from Neil Armstrong, the IL79900A support has
been merged into the existing `panel-ilitek-ili9882t.c` driver instead of
creating a new one, since both controllers share similar command sequences
and initialization behavior.

Changes in v5:
- PATCH 1/2: No changes (already reviewed-by Conor Dooley)
- PATCH 2/2: Merge IL79900A support into existing panel-ilitek-ili9882t.c driver.
- Link to v4: https://lore.kernel.org/all/20251022124628.311544-1-yelangyan@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 1/2: Rename compatible to "tianma,tl121bvms07-00" and update example accordingly.
- PATCH 2/2: Update driver to use new compatible and rename related data structure.
- Link to v3: https://lore.kernel.org/all/20251016095043.1694736-1-yelangyan@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 1/2: Fix DT schema error for `backlight` property.
- PATCH 2/2: Address review feedback (use mipi_dsi_msleep/_multi, move init sequence to mode, minor cleanups).
- Link to v2: https://lore.kernel.org/all/20251010093751.2793492-1-yelangyan@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 1/2: Address Rob Herring’s review comments and align with panel-common.yaml conventions.
- PATCH 2/2: Rename driver to panel-ilitek-il79900a and align naming and structure with existing Ilitek panel drivers.
- Link to v1: https://lore.kernel.org/all/20250930075044.1368134-1-yelangyan@huaqin.corp-partner.google.com/

Langyan Ye (2):
  dt-bindings: display: panel: Add Tianma TL121BVMS07-00 panel
  drm/panel: ilitek-ili9882t: Add support for Ilitek IL79900A-based
    panels

 .../display/panel/ilitek,il79900a.yaml        | 68 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 69 +++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml

-- 
2.34.1

