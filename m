Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A034B30ED
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 23:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1630210EBBB;
	Fri, 11 Feb 2022 22:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D91910EBA9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 22:40:11 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id x15so2034878lfu.10
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 14:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A8ctvX5zLKvSPusbxBXHP85Dtil9Pv7DuZ+PpnlfzHc=;
 b=QObfsafJ4EWjse6VV3bqb1uHiZBP6amKZbxvvjbIOlPJ/J+NAmh2xeY7cjkwbN4HmV
 kx5r+NO8p9TPow6xwADjImn0CnGaDXEqQYEaCI0lhrOEvsub7dTkUgy4KFfhUJymo7RH
 o2nl/LNJqSEcwIYoom14Srv5mHwd8OIgarz3lN0RGoUFWG876V7YTv9rJFsnNpuYMt/4
 o7DpaoSbzbrRiUFK60QECAKO2wja0Eq24yYVB25HKIRykLkjQeznFgOJNk0lW0joMfeG
 1oWCBu+o2KYPe+oIPmtduDKh9AoHKWhDXqgjQgsHv/ePg2JmaJOQIFbpXLwOETiEoAEV
 VLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A8ctvX5zLKvSPusbxBXHP85Dtil9Pv7DuZ+PpnlfzHc=;
 b=YnQFFC/utUGJof6BeT4Y7q29zVVtMCGT1/FhCaavoRcHjivZEv4UG3ioMG4CpzcssM
 2oS+9PgrTj/YQvyMvh87Y3EAOyRZsqozMAtKp0PzlY40qSUck0IrjFx+IDjF0b/j2CAH
 zSnzj4LqsSTCpQApRmv0zDt3pbGMdlHKjiH3dS/CJ1sXsMBjUK09oWXB/LwDXgrzq1CW
 LkoqpRU8vEWSG2yAQ5S1u54iGQm2gR9ofwg8tT4VVCM4XUw5wY4Iknii+Yg5rfW7d+KW
 ePFYEb+Nr4yuo0m0otgNWzZcagG7yeOr0AdylGbeKkZ9zRht3G8rlNX5V6eNBSmQRh9T
 C04Q==
X-Gm-Message-State: AOAM530BoNibLU2JYtY+2vzaVhpFuZb8WFHCf6LLO6HtYF9OzzT2gsh9
 jqhvx275Do1IQogq1ggeN8x6Rnyxb0U8KA==
X-Google-Smtp-Source: ABdhPJxvqS6RjfOowra5TYzzwwv/HVceArtYgxJUEYM2mDzk1UDJMrVcSrQWKi6bjb0IzwRNNx0KJQ==
X-Received: by 2002:a05:6512:398d:: with SMTP id
 j13mr2623942lfu.251.1644619209897; 
 Fri, 11 Feb 2022 14:40:09 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a6sm3319983ljb.93.2022.02.11.14.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:40:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [RFC PATCH v2 3/5] drm/msm/dp: support finding next bridge even for
 DP interfaces
Date: Sat, 12 Feb 2022 01:40:04 +0300
Message-Id: <20220211224006.1797846-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is possible to supply display-connector (bridge) to the DP interface,
add support for parsing it too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_parser.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 901d7967370f..1056b8d5755b 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -301,17 +301,22 @@ static int dp_parser_parse(struct dp_parser *parser, int connector_type)
 		return rc;
 
 	/*
-	 * Currently we support external bridges only for eDP connectors.
+	 * External bridges are mandatory for eDP interfaces: one has to
+	 * provide at least an eDP panel (which gets wrapped into panel-bridge).
 	 *
-	 * No external bridges are expected for the DisplayPort connector,
-	 * it is physically present in a form of a DP or USB-C connector.
+	 * For DisplayPort interfaces external bridges are optional, so
+	 * silently ignore an error if one is not present (-ENODEV).
 	 */
-	if (connector_type == DRM_MODE_CONNECTOR_eDP) {
-		rc = dp_parser_find_next_bridge(parser);
-		if (rc) {
-			DRM_ERROR("DP: failed to find next bridge\n");
+	rc = dp_parser_find_next_bridge(parser);
+	if (rc == -ENODEV) {
+		if (connector_type == DRM_MODE_CONNECTOR_eDP) {
+			DRM_ERROR("eDP: next bridge is not present\n");
 			return rc;
 		}
+	} else if (rc) {
+		if (rc != -EPROBE_DEFER)
+			DRM_ERROR("DP: error parsing next bridge: %d\n", rc);
+		return rc;
 	}
 
 	/* Map the corresponding regulator information according to
-- 
2.34.1

