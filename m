Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7457B8082B0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 09:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799B310E111;
	Thu,  7 Dec 2023 08:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEA810E111
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 08:18:08 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1d06fffdb65so4674275ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 00:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701937087; x=1702541887;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ogWC6aXr0co7496xG70uhIqQbvQeFN6t7NUTqWYnsUU=;
 b=XcFNPkR5a4NwvLCsHjvZ0QUe3nXRzkJWDthaU5JwF6jqGGQOpRT2XZn2IXOhn3YD9n
 XiBnQtShDQOZGed/WO+VZp5PpXjr7I6hYHHKtjN1uc6QO/J7tcjBRxyribooph2XGIjk
 hreZj3IU/kq1lDpFFJqtEWquunaUfwIX4uLkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701937087; x=1702541887;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ogWC6aXr0co7496xG70uhIqQbvQeFN6t7NUTqWYnsUU=;
 b=ZSxuYog240b/DMrL4r1gRN+jIQptNQmx/E+VMqOjzE2ygMWbjzTl/xdizG0x9nbq8+
 pUSRa4KLAH94E2pU3pVy8wmWBtfCkLw+eh7CZ7syZ4rjumEPhxU7IM+hUF3RtQjC3ijQ
 2CtHIdVf0VIbiBy8PCuPiloRGmcy7JGeWrD+Z3dmdcvMajR2bbTcy7YuW+Nio0G/isCe
 aUU74hbEAr+kkvUJA4689uVXAa/VNkwV/d+AsrllEPnpgCja1OirliFdIhUUcv8+3n84
 0ag0S6hCxBDy1zskEHlveczolep+wsKo5V+BuydiwJ0FeZrpH2TJnzMva3Kf+F+0wBjH
 yV1Q==
X-Gm-Message-State: AOJu0Yx44/SlZpV39fazLORR/kGlhhdwD6Ph6Q91Gh8dTvfuE6239A6r
 GY9cFP1kOMvK+IrtkN3tB1qDVw==
X-Google-Smtp-Source: AGHT+IEp5hKQQmDxI/X5QAOIPteQpG71UFyE9a+2u0kC/L1w4+IZsOjIHgenhOC+1H8dt+CmwGJL5g==
X-Received: by 2002:a17:902:740b:b0:1d0:6ffd:6e4f with SMTP id
 g11-20020a170902740b00b001d06ffd6e4fmr1551434pll.71.1701937087564; 
 Thu, 07 Dec 2023 00:18:07 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:663f:6f8e:5f2d:e06c])
 by smtp.gmail.com with ESMTPSA id
 t23-20020a1709028c9700b001d09c5424d4sm748128plo.297.2023.12.07.00.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 00:18:07 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/4] Support panels used by MT8173 Chromebooks in edp-panel
Date: Thu,  7 Dec 2023 16:17:34 +0800
Message-ID: <20231207081801.4049075-1-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
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
Cc: Guenter Roeck <groeck@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains 4 patches:
1. Sort the panel entries as a clean up. This one has no dependency with
   other patches in this series and can be merged separately.
2. Add a new panel delay to support some BOE panels
3. Add panel entries used by Mediatek MT8173 Chromebooks.
4. Add panels missing data sheets but used to work in older kernel version
   without any specified delays.

Changes in v2:
- Add a new patch to sort the list, and rebase the rest patches.

Pin-yen Lin (4):
  drm/edp-panel: Move the KDC panel to a separate group
  drm/panel-edp: Add powered_on_to_enable delay
  drm/edp-panel: Add panels delay entries
  drm/panel-edp: Add some panels with conservative timings

 drivers/gpu/drm/panel/panel-edp.c | 93 ++++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

-- 
2.43.0.472.g3155946c3a-goog

