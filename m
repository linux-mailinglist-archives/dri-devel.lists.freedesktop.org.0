Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389CA875B54
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 00:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3302E10F721;
	Thu,  7 Mar 2024 23:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vXKGWw2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8800210F603
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 23:57:09 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-512e4f4e463so2071863e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 15:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709855827; x=1710460627; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=u4g0A2mJqMdnp6Ni8UfsRj9520wAhqMQ6QMy2JhUnOU=;
 b=vXKGWw2Jkk2X4bQcxgoJ+E+tER/WQntcjgnd+1NkyEMh35YBFf7p/BMYZYZUnT/NBr
 7QuHCapXYYxnc9jbUgrvWRaQFj5bc2fe/OE488Ebe42ZHePP6CChkE03J7Vahh0QOyCU
 GX23xngsB6wgIsspVcXytk5FLywR2RxMmayMT2n/mnwNajULEsq07c/6OSCMT4s/f/tz
 xGvPx24VJFgzvtqP7vtn6a3leiAbX1rmd9IKwJasPeVGh+hpkYTeSTN8V0VImPzhLOb/
 OaIUQMxMu4pPrDPr+Llp1b7Nqp1wsYzDhjyXvq4OPrsdNNGArC7Jqn71pBm0Vx5wIZiE
 lf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709855827; x=1710460627;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u4g0A2mJqMdnp6Ni8UfsRj9520wAhqMQ6QMy2JhUnOU=;
 b=uTyFZWX2IRswOWIUUQI8C90DbLuSD7yG0mhUrxnv9kte7sKJf6h8BLoPfpM6QhVZZ+
 M1GBpQg925Rg5sWqYbMKoT/SKE7Y5WwLbmEkRO69NcxvpLPx15jrAyfPTkMi4s4kINnX
 j2G2AnJN1hq8UF5hOv8dm4J+JXswry0jEILf0gYd4goD5oVKrTdVHZiIECmEU7jd9whb
 8IcIKJl/eEfJb2EclAT9tTRVMze2leq9xhKO3HcqSTrK4NlQR5MlofF0dGU9geYbsL7M
 QD3GEDS74/0lWcqBlUfqErYAvz64dt0LKrUOBdI5uFF9lZg0M0NNZnCIE1MCtC0kLTrw
 WL+w==
X-Gm-Message-State: AOJu0YwaLbirfYMv89NNOaukpLjZ6k8Dp+LtGhgX2U/enacz9apCGSwu
 NDjQbkIUQeWCZg/wOeusFtloovDMRJI4cSqDw18WrzhlMXlbiXovqPe8vmQLacM=
X-Google-Smtp-Source: AGHT+IHnzbTF0XaaPfXPOV+dLSi0h6C3uhHFgoDuYO0jtbmQe2VfAWhicaYbI6f6ZjHFWwvICqMuWw==
X-Received: by 2002:ac2:46ec:0:b0:513:6bbc:e6fc with SMTP id
 q12-20020ac246ec000000b005136bbce6fcmr2641998lfo.8.1709855827608; 
 Thu, 07 Mar 2024 15:57:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c25-20020ac25f79000000b005133277eb29sm2796475lfc.270.2024.03.07.15.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 15:57:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Mar 2024 01:57:03 +0200
Subject: [PATCH RFC 4/6] drm/connector: hdmi: add opaque data type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240308-bridge-hdmi-connector-v1-4-90b693550260@linaro.org>
References: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
In-Reply-To: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=833;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+x1kUIee7AVt4kqlCisaJEmSVhGtSnW63wlN0WYeMiA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6lRO/psOtZsryGYjtaY69ZDmy/fmZxGSuALo0
 MH0TenaSr2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZepUTgAKCRCLPIo+Aiko
 1bWyB/96ELkZShJQsyKTOUoy9ypVBKSLltVC9CyfncZFcfJC5shSifparvQ4Le8sgjJoD/2QMc8
 fJpSUEKjwVONTpTnUczcZCGSb+AD8Ananr14DMJk1qLgqdgEhQld80cwc4Nx4Ymh/2sfKh08eB6
 7Zo9MNIsAMrsQHpC8/fnISo1aw9DbUNEQe/dAnV0FKrGaiGef+PHa9+9PR9fDisGNy/NiZXr5ol
 9RbTzIFxaH/I6bE7NEYh/phl13xjQQY/cz+tdarJWMzvngg8zdEbe9T97fixyJEwK0hdRL3AbIb
 YHRRNAze8OMlT1H0Jrg6D3cFUfw0hp3CdmavESs3McL2O0qE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

HDMI bridge drivers need to store private data pointer to be used from
drm_connector_hdmi_funcs::write_infoframes() and clear_infoframes()
callbacks. Add it to the drm_connector.hdmi structure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_connector.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 37d54d5ff0d6..d5c240ad7c5f 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2088,6 +2088,11 @@ struct drm_connector {
 		 */
 		const struct drm_connector_hdmi_funcs *funcs;
 
+		/**
+		 * @data: Internal data pointer used by the HDMI connector funcs.
+		 */
+		void *data;
+
 		/**
 		 * @infoframes: Current Infoframes output by the connector
 		 */

-- 
2.39.2

