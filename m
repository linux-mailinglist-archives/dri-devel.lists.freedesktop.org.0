Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD487A9D1F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 21:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7449110E5F9;
	Thu, 21 Sep 2023 19:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7ABA10E5F9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 19:28:33 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so947920a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 12:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695324512; x=1695929312;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cZtAYqJWE7JpdsZxb5rfWkU3kZ2lTrkKomU0ysGX5d0=;
 b=Bz5WsbUmerrwH62CmE9A3H5TynFU43dnEPTvRNO0H50pXApql2LQvwrNok8BkGcVpR
 oMyVfkY8bBAws1HeFNgxGwuiCk1sPGdN9htgc6zR5DXURc46E1+GgprkNAM8mTiJ34fQ
 40JmX78hDY4hKHrEoU73Kz3ZnO9FbYEnBTuSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695324512; x=1695929312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cZtAYqJWE7JpdsZxb5rfWkU3kZ2lTrkKomU0ysGX5d0=;
 b=gkjS4+jbt30o/+QkrThMU2pVFVEeTL8rli0EvCr+zX75awVO+WhLKLLqOLE5I4jOpU
 JD1/d3EyR4Higw5E+KxK7VMIYCtYFlYa8mTfLeA7nFytY8xbv7Ksq5gQUpMnxS3n9Ck2
 JS9smZS0sJW1JSDScvBVEK3oRdIL97HXT24uydMe5tqd33Mlm01lQeMEriYWbSa4Y+Rn
 h+ioFcvo8m47WRH80NKX1HzzbL+s66wCgSu1dRr71wuigIH7QLaPijFVqJiQWn8IHuKa
 BrRl/eIFqfbTCmmYlJsjOus0J2phhjDmQKGX7TgK0fHbiolpUHNSsrcEnZl1q2iF7AFp
 wh8Q==
X-Gm-Message-State: AOJu0YwX/LbEqg2xW+Tq51GSTqheH+T0UCf+PoXmNWZxzYeb5WA+btCB
 PhGgqGJxTf919S5H0mKmZiyLNxgoJgDB+ck8ws5UIGzW
X-Google-Smtp-Source: AGHT+IFLfEFOKyhwKb3FZnAY6hGcxUNsWis48sb0QkS+Rc27anChCNA3mxZflSD413ezokJ4zowvTw==
X-Received: by 2002:a05:6a20:7f93:b0:152:6b63:f1e5 with SMTP id
 d19-20020a056a207f9300b001526b63f1e5mr8883328pzj.38.1695324512344; 
 Thu, 21 Sep 2023 12:28:32 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:e6ed:6d49:f262:8041])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1709029a8800b001b9f032bb3dsm1892875plp.3.2023.09.21.12.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 12:28:30 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH v2 06/12] drm/arcpgu: Call drm_atomic_helper_shutdown() at
 shutdown time
Date: Thu, 21 Sep 2023 12:26:49 -0700
Message-ID: <20230921122641.RFT.v2.6.I8a0a246fea222059881d01a8fff2adcf7ef3d7a4@changeid>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
In-Reply-To: <20230921192749.1542462-1-dianders@chromium.org>
References: <20230921192749.1542462-1-dianders@chromium.org>
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
Cc: abrodkin@synopsys.com, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on grepping through the source code this driver appears to be
missing a call to drm_atomic_helper_shutdown() at system shutdown
time. Among other things, this means that if a panel is in use that it
won't be cleanly powered off at system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

(no changes since v1)

 drivers/gpu/drm/tiny/arcpgu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index e5b10e41554a..c1e851c982e4 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -414,6 +414,11 @@ static int arcpgu_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void arcpgu_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 static const struct of_device_id arcpgu_of_table[] = {
 	{.compatible = "snps,arcpgu"},
 	{}
@@ -424,6 +429,7 @@ MODULE_DEVICE_TABLE(of, arcpgu_of_table);
 static struct platform_driver arcpgu_platform_driver = {
 	.probe = arcpgu_probe,
 	.remove = arcpgu_remove,
+	.shutdown = arcpgu_shutdown,
 	.driver = {
 		   .name = "arcpgu",
 		   .of_match_table = arcpgu_of_table,
-- 
2.42.0.515.g380fc7ccd1-goog

