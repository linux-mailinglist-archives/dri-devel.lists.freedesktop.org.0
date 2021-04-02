Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D177353111
	for <lists+dri-devel@lfdr.de>; Sat,  3 Apr 2021 00:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67986F3A2;
	Fri,  2 Apr 2021 22:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDACE6F3A1
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 22:29:36 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id t23so40845pjy.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 15:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aTj0OGH7KaDzYKPFyz84iOUTYicqvk+ZBNlKttoJO+Q=;
 b=CgOs8CxEUCEHeF6iUU0vfsG5kJCASq3JPLdC4yt8vdPnN9hjSeAU5189WyCt326Ghi
 AfEwxJzlF73Zao6yjX7YMnN/6+Hzayv9NF1Re/lHKkogMMNs8JVCoypq231b1EOSy6uE
 LDNJt2tmY72VHDhggS5OHqI1LD1ogF85M64dM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aTj0OGH7KaDzYKPFyz84iOUTYicqvk+ZBNlKttoJO+Q=;
 b=kLFVHQa0Zasal+a8osVHLedYlaqoTrZWrRqxF5l3uHtKjK3TehFL1kYsXNR0Ckvh9/
 yBKxmZh5bbcoL7NOe8JEBRQrwcQEzw5KVXTVKC3rPLrWSjGpjgI+0itwg40vuTrgTo6n
 yZAAVmyY/2b4uPTsW7g1+SQk8lGuLg/DqCdy7k4B1CjjAp2HNaHg5VmSeIGnsZdsjaA8
 vnfLnLjrfcaSCmAhEycz7rA/5scAf1dlUm1fVgyudJ7DKeADLWjS/zUGbWoLeF8Tx0Hg
 j1Wx1WVQJDw2PHtKWZzV5xI3HjapQzu7XhkE+qVvm43e506RUPjb71bXfg8/JqUzBeva
 Opqg==
X-Gm-Message-State: AOAM531McdAce2gMy4Eg0qqpNSGw24TbmF65C/RvygHx49swgGriO+0Q
 D9feD2qHK75ueQMVt7GqCLgf8Q==
X-Google-Smtp-Source: ABdhPJy/TfR1o90gA4kNkharNT2qLPaUBedqIkni2GWNH7z0Lj8Zn/4GcUMFAsIKElP5fYQSV9d9BA==
X-Received: by 2002:a17:902:b210:b029:e6:33b4:cd9e with SMTP id
 t16-20020a170902b210b02900e633b4cd9emr14325791plr.67.1617402576574; 
 Fri, 02 Apr 2021 15:29:36 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6c58:fab2:c5e2:f2d7])
 by smtp.gmail.com with ESMTPSA id t16sm9233094pfc.204.2021.04.02.15.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 15:29:36 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 09/12] drm/bridge: ti-sn65dsi86: Fail aux transfers right
 away if not powered
Date: Fri,  2 Apr 2021 15:28:43 -0700
Message-Id: <20210402152701.v3.9.Ifda98514600b646db4fc7bc55f0d0f9a4f1650db@changeid>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
In-Reply-To: <20210402222846.2461042-1-dianders@chromium.org>
References: <20210402222846.2461042-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the bridge (and panel) haven't been powered on then AUX transfers
just won't work. Let's just fail them instantly.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
If the patch ("drm/panel: panel-simple: Use runtime pm to avoid
excessive unprepare / prepare") is accepted then we could consider
actually powering the panel on instead of failing the
transfer. However, without that patch the overhead would just be too
much since we need to do several AUX transfers for a single EDID read
and powering up and down each time would just be too much.

Changes in v3:
- ("Fail aux transfers right away if not powered") split out for v3.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 543590801a8e..a76cac93cb46 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -896,6 +896,13 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 	int ret;
 	u8 addr_len[SN_AUX_LENGTH_REG + 1 - SN_AUX_ADDR_19_16_REG];
 
+	/*
+	 * Things just won't work if the panel isn't powered. Return failure
+	 * right away.
+	 */
+	if (!pdata->pre_enabled)
+		return -EIO;
+
 	if (len > SN_AUX_MAX_PAYLOAD_BYTES)
 		return -EINVAL;
 
-- 
2.31.0.208.g409f899ff0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
