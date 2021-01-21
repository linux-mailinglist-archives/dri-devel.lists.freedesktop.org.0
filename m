Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 659E82FFE96
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE626E9EC;
	Fri, 22 Jan 2021 08:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3166E97A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 23:33:12 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id m22so5021141lfg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 15:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LXLBko8Cp1/+g8qjMNN3MI6diNB1wKaGBp6QZagrUvw=;
 b=H6plmw40MZ+6SjPcYq1mPJlnbzickRzJ8SRP54NDX47VY7L8rNmE3rpyVZsiOtXeKi
 z8mVBmZKjk3FRQqTig0hlWgLXB+S4m9KwqcsBQFHlecYLl/fzpMOt5hd5+uJCkGUzN28
 NJjT2CRKFPXHy7KeJxw1z6m9Bw6kaUnSevl/j80O2LY78QPrVz4KmfcX0ITxZ9753THh
 UoY5p4VENRuytKHWiXDJE5+73P7l5GR+DwttXHxCxQW1dc4oqsKs0dZ0bb/ElL/NoHFT
 LaCKSPE2HphOcd00RiIwmP4YelSr5zNzSB16Ar7VilBQSBw+640Mchk4kTsD9qNSYdTn
 3lkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LXLBko8Cp1/+g8qjMNN3MI6diNB1wKaGBp6QZagrUvw=;
 b=XJsTJw8y4wn9qRBPNmj60ESDFdypB8DUfy4Y+oQvba15gF27Hn4+KZj/AB8bKhIkj0
 Kh9DVZEdh1q/8Nu7bZ+brzTjXeVP9joXMY2fj6sOgIQR1OkZKHW77Ds7RVhnZ2kxCrGh
 6GKleKb7cnVfcoD/flpTZdJKN37XbcVsAJ0RU2HI2nPK+vWJ0fT2SGz9E4E0FLMVo/1E
 VrOVvg2JFkKM4EI8b1T4VUynatBXDszMm+EETqEe7SY4WVuKqBSsvRyMNgClVBYsmSBN
 lq+j1zT/lndh405sbSaApviISv/WeZ1mGK2uhVfbqeBQq2G7fs55afzQE1VeOHzvU6eu
 v+Lw==
X-Gm-Message-State: AOAM530JYgumK797Ljv/MqSdDG7fPfUjtvuwdzwiWY892gITcMPwmywL
 3wvu+AuFpysSZKI0TG76yBR8PPmyWpCy6y1u
X-Google-Smtp-Source: ABdhPJxU9TZ69d8kwFQwT1jPDTrC4CkWHg4Ij8Kb0Ur9THl9pf4CK7mzNN9n3FnXmF5jEMhDfzUQVA==
X-Received: by 2002:a05:6512:612:: with SMTP id
 b18mr864962lfe.598.1611271990559; 
 Thu, 21 Jan 2021 15:33:10 -0800 (PST)
Received: from eriador.lan ([188.162.64.145])
 by smtp.gmail.com with ESMTPSA id l28sm726969ljb.42.2021.01.21.15.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 15:33:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 2/3] drm/bridge/lontium-lt9611uxc: fix get_edid return code
Date: Fri, 22 Jan 2021 02:33:02 +0300
Message-Id: <20210121233303.1221784-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
References: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return NULL pointer from get_edid() callback rather than ERR_PTR()
pointer, as DRM code does NULL checks rather than IS_ERR(). Also while
we are at it, return NULL if getting EDID timed out.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index a59e811f1705..b708700e182d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -505,7 +505,10 @@ static struct edid *lt9611uxc_bridge_get_edid(struct drm_bridge *bridge,
 	ret = lt9611uxc_wait_for_edid(lt9611uxc);
 	if (ret < 0) {
 		dev_err(lt9611uxc->dev, "wait for EDID failed: %d\n", ret);
-		return ERR_PTR(ret);
+		return NULL;
+	} else if (ret == 0) {
+		dev_err(lt9611uxc->dev, "wait for EDID timeout\n");
+		return NULL;
 	}
 
 	return drm_do_get_edid(connector, lt9611uxc_get_edid_block, lt9611uxc);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
