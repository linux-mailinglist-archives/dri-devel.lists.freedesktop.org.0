Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BF188A09E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 13:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E256310E82D;
	Mon, 25 Mar 2024 12:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="LzSTjkl7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C0D10E1E6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 12:59:06 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-5a49261093cso2144572eaf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711371546; x=1711976346;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JkyqpDMyqX41cyTaE28OnrvQwkG6qyxUUrve0FvXzho=;
 b=LzSTjkl7EY0JgrlWuncgCuxZaQS2DldftB/BxTMgF91kqi9KRYEKn9dgqLUIvGDss6
 uVSufOXY/KNJUWEGnRfu0JtkPtuteVo5vbdoRec3wmvJm9J7Ifr0D31ti3/ERyRaPEaJ
 omuFi4zaCRiQOiU8qLeDZpQWKot+no/Ncbmas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711371546; x=1711976346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JkyqpDMyqX41cyTaE28OnrvQwkG6qyxUUrve0FvXzho=;
 b=BxjDwv+5ZonWlR22/D/l49QfoLpPInlQLXN11O/m8XinBt6QXXKPJxhx1r4toTmDHH
 t5oSQvcKWFZ9P4ozhs5bn9X7cLxYQnlb6rRGlbv/aTCDvkFM45BkdrpZfSmECKaohFDz
 SZsRnPgNSfCD7Ipi0hJNz0wV3cnFw5RhQFE0P+3vSdUvHQsp4X/uMwLXttBV+8Tm1KPr
 nXmes1t3k8yUCgrlE23zyEoOKrgXfVf8GVNFNiRnUc9etjw1n/raR6fdKvQB+2XrVwDX
 iQh2IPfkOP4rdqdBuh5GfMCpPYqShOn8+M1CbLpN0BYkfhpIyH70Hj8GJqVlGoFhUZmK
 pdlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcjPOJH1yYZfOsVD9TuEkPjClgg5XHhmbsioscVkKPMNUXSsnUzbqMSn0yAdTQw50posPC1XgJrpURqVdlAWB3Ev0Sy1uiXCSpVvkQOOkN
X-Gm-Message-State: AOJu0YzMSIzrHxeONfUPC+CIbybAkJoY4KlMNGn2YtjSrFOfT6ERuQxW
 OP6iKpow353GEXQ45VeF4o5R7U9rJIg6WHBuHxliNUovK3musXYa5/NDvlqKFg==
X-Google-Smtp-Source: AGHT+IG0ccGt9Jqagp19yq4VqEubSRZbWD0YyCNpyegF9W/d3KGhEe24YPFxiE9DLu6ni8Ngc5Qg9Q==
X-Received: by 2002:a05:6358:5242:b0:17e:53f9:697e with SMTP id
 c2-20020a056358524200b0017e53f9697emr7688607rwa.28.1711371545721; 
 Mon, 25 Mar 2024 05:59:05 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:c95b:ef24:f1aa:2bcc])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a63e904000000b005e2b0671987sm5723446pgh.51.2024.03.25.05.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 05:59:05 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel@vger.kernel.org, Hsin-Te Yuan <yuanhsinte@chromium.org>,
 dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH] drm/panel-edp: Add AUO B120XAN01.0
Date: Mon, 25 Mar 2024 20:58:51 +0800
Message-ID: <20240325125901.2524752-1-treapking@chromium.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
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

Add support for the AUO B120XAN01.0 panel.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index c4f851200aa2..1a4a1ffea2c1 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1989,6 +1989,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140HAK02.7"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50, "B140XTN07.2"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120XAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140XTN07.7"),
 
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0607, &delay_200_500_e200, "Unknown"),
-- 
2.44.0.396.g6e790dbe36-goog

