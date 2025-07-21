Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82229B0BC64
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 08:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110CA10E258;
	Mon, 21 Jul 2025 06:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="q/0zUVYo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372C410E258
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 06:16:36 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-75ce8f8a3a1so288351b3a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 23:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1753078596; x=1753683396; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N0ENQ275HCx0o/sjGDH+fa7srMZMEHCVXuFWv7uWYYc=;
 b=q/0zUVYoi5MdVDDmWvY/y5xsd6pez5+DVcLWrl3fErkEGUXYMLUYJQY0Vqe7JlOCPR
 BemScgs/PfGYOk0UstPXU9I0jHAT85FdwfnpUPu+FOrDXNbDMohD594dezx0wrWYiccD
 DcTMwmUaCusdGGuhEHr5YHI6tfKV3jsk9bzWcWfg+2Vm2w+xOCDFFY86wZkb4UlYRdrP
 GaSw4dPjmPwgjy6W+CcUUTqb5qFxo0OsbLq+SSErr6wbhdx1Z/X+BkT3smvqXujNQQ9o
 gAS0iEWJmMCL4qOYHqqznuNz2vdWFiFFPwnhFsPcaD7OD9FLklFGUXUKye1guISpEZYU
 E/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753078596; x=1753683396;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N0ENQ275HCx0o/sjGDH+fa7srMZMEHCVXuFWv7uWYYc=;
 b=edxnULk+JVG0YIrrZ1yYeEHWnPX8zeb6sinua9cVws7WcY4yd3T90p5aYhhSxYY7VN
 /SBwCViEMfJI4X3O8LrrRFrGcVFUpVU6mxFjlfrrK2a/kfasAQqbhoCP7tJpBitj0YKK
 xFCbfzksr6Yit1am1ClBCF8XSvyN54iH3c+jIGqFS0LhXJmc8HzsiX507yBlUy1fFP0d
 t0B3guhfkXWfpTUOD++PKaH9fj22LK6rfBas3jCoGZy4q4GsgdCK385zyHN9NJwwTAdr
 M019SJgP5sbVXPjSHMPlFITaxv/bewIk5yDnZZB9OJj4961RjkIxIkaJexT8lABZHD/C
 sKRw==
X-Gm-Message-State: AOJu0Yxj7Oo8TW5XJAIWu5j/7FUJTewoUC6M0uMiJy6aXqHy6XyCOjgI
 hquoc7umGcf2rDfN0h1JFo8EU8tlvM6cgtOZFxUEGSpvudM6r8FQ+HXKtfoEAbyvsvU=
X-Gm-Gg: ASbGncss72bRPmzwXXPZqlttdm2dOoKbbuhOzAH/90ORI7o8ObjaAfki3FLp8/HExL4
 jh84/DVCW7NzcZifdd7azdyZ6OkYkqTVzq1CkZoftOwfQnW/81KmYIb5t+iuMZ+c/8FBF3j5vM4
 NToqTLVuCEbI552kK+9S43L17hCFQGIQbz2XHDD1W9hR4dEX9op5mzm2mfpWLqhH3WUF9cdI4Nd
 mGvz1OfB79krExy+QOImZsfltIqPuX2moi1QH+PE4FOnUD4Zlcz+8pjyXMZf/9mZcEEGD2Kdmse
 LARbeYrdWzdo0sg3/yFkzz4y1o+oOpBV6Le91/r45Oy/gEd8SZejTq8XztMhcgD/tI36tuPDZ3I
 OEalAMUP2yUxACSpQLDHL7jWRRmPTY3cpqVqXG1TSMNLNWgpU3A2Lt7T/4+zmEtY+hsJQ2w==
X-Google-Smtp-Source: AGHT+IHjZqTtlpY0pL6h5Pp0btNtFSEGfuHRyOoDc2GP654jKlH/a0zZPhaWHOyzP97vMnL9W7trlw==
X-Received: by 2002:a05:6a00:3e23:b0:748:e150:ac5c with SMTP id
 d2e1a72fcca58-759ae1e7120mr16787301b3a.23.1753078595560; 
 Sun, 20 Jul 2025 23:16:35 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c89d0678sm5104153b3a.43.2025.07.20.23.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 23:16:35 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add disable to 100ms for MNB601LS1-4
Date: Mon, 21 Jul 2025 14:16:27 +0800
Message-Id: <20250721061627.3816612-1-yelangyan@huaqin.corp-partner.google.com>
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

For the MNB601LS1-4 panel, the T9+T10 timing does not meet the
requirements of the specification, so disable is set to 100ms.

Fixes: 9d8e91439fc3 ("drm/panel-edp: Add CSW MNB601LS1-4")
Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 9a56e208cbdd..09170470b3ef 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1828,6 +1828,13 @@ static const struct panel_delay delay_50_500_e200_d200_po2e335 = {
 	.powered_on_to_enable = 335,
 };
 
+static const struct panel_delay delay_200_500_e50_d100 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.enable = 50,
+	.disable = 100,
+};
+
 #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
 { \
 	.ident = { \
@@ -1984,7 +1991,7 @@ static const struct edp_panel_entry edp_panels[] = {
 
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "MNB601LS1-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1103, &delay_200_500_e80_d50, "MNB601LS1-3"),
-	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50_d100, "MNB601LS1-4"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50, "MNE007QS3-7"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1457, &delay_80_500_e80_p2e200, "MNE007QS3-8"),
 
-- 
2.34.1

