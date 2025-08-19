Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034CEB2C2F9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562B910E5CE;
	Tue, 19 Aug 2025 12:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h0zKiISG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BFB10E5C7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:16:59 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-61a893d5226so609004a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605818; x=1756210618; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X39bS8YQI5ECgqe9acCiMShhqwPzQXztY7zHETyiqVE=;
 b=h0zKiISGiqqbLyUfFAwuqD5S66OO9c3VgENlqkAVmSvKoGllLi1RaApLB4NdcU9hso
 jd06V/bUxklwLIja24jnM3xUNImt1roJAw8JVB4/cEhJkNbKDFbd9M67tReSTJFyEEm4
 85y2+T0QSFeaDHNc+AqsGjdJaLGaZ4CzVuuho/KoZ+nwPQM8uYODtkTQbIYHGogyhMXa
 7JyRX55ePQnB0S/iFOG8muhjUamMI0RkugSJHM9NGd9yjuXCGyWiAuWbuWnpv2Iw+2+d
 aMT1VM9IPjORbql6vR6riOCKAQChP+mgh1yawqux1Z0gEvkSDNxvkmA05I8TE5iQtu6M
 KtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605818; x=1756210618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X39bS8YQI5ECgqe9acCiMShhqwPzQXztY7zHETyiqVE=;
 b=PoNypfeVeZ93nkYnZsjJdS99ip9W2yeWsHZg/57Cgar58FXeDAxFiRo2f27QBezhGC
 Wm7I9soVEyc0GJObek7G5kJHo82RsW43fG8Ca1wm6J7PfjYSYlyfVFnLkAzX607IoUxk
 QTmYnqDqce4WnNo2xGd4z91go1Uu/VSgF56JAUayOsWN1arDLgq1arQrHegEibiAscJC
 hYJezuF97WNclXmm+z4/09VZ95f1z+mnl/eSFohdmfGkMnwlnggSeh53cp5xLt+vTGkY
 80uKYx2t5zxykbK52ZmrziPz2BJC6KCuRJWlZ5+bshUEfP2p9Iw6XhoWu8jyxTuq+Ifu
 vjNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXOhpjTxvZQXqJ8so+mR5Imi6Q5xO+2XyEkN7B1hmiGdPSVG47QnT98W1aWQY7DrXVk5IUyLoa+8g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgM4Tn6z8Crmm7rdaqU412vUMAxV8tE1OgsQ3so0Q2Y/vZLSbL
 /FyixbjjF6TFAZ/E101keSbfDC303bXvYFsolCPVvwj5MVCCGhIZVg/z
X-Gm-Gg: ASbGnctpQscyHMOMDMMR504B2o+2GyiaL4k3SLTyB+B5vtSlvd5pIQml1URWMVcg2u2
 vXpyKMXQWdzJbrts1aF3SslSxmvap/SCdd8tcKcFC9pNDwxmWbkYQzFj93uGG49rKeUT7ELM3jX
 9cxiNHl+LDg5xRWT8uNqLBHBK8KZIwVlmCMMfNj2CqVM3l1qBjsO7ySoKAxB/SaRO9byze/uSJ3
 FbaCbGJBqtQKfo3pysJsnASo45ZgPIcHz4eDoWY88hFn/VKTgH0Cv0gNjIH2nqZ9RI2Lp9HqYHg
 a3nCgXadsyHSD6U0ih11ySpGDCTjpvU9sNJUjkE6zqcHJ5KuA0/10BXIqkpOpqMNI5q++2McW9a
 6wF05CLIgwWjZ2A==
X-Google-Smtp-Source: AGHT+IGbpGm2q0e2vT/L5TwS5YIPOoZV60ORppzvUtAWrZ8nGwnpAAbMDs2G1YJK5NIJt0MUou8dFQ==
X-Received: by 2002:a17:906:6a25:b0:af9:6e4a:3b2c with SMTP id
 a640c23a62f3a-afddd1e8b70mr223480566b.43.1755605817641; 
 Tue, 19 Aug 2025 05:16:57 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:16:57 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v1 09/19] staging: media: tegra-video: vi: add flip controls
 only if no source controls are provided
Date: Tue, 19 Aug 2025 15:16:21 +0300
Message-ID: <20250819121631.84280-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
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

Add HFLIP and VFLIP from SoC only if camera sensor does not provide those
controls.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 4f67adc395ac..61b65a2c1436 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -961,6 +961,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -986,11 +987,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return ret;
 	}
 
-	if (chan->vi->soc->has_h_v_flip) {
+	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
+	if (chan->vi->soc->has_h_v_flip && !hflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	}
 
+	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
+	if (chan->vi->soc->has_h_v_flip && !vflip)
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
 #endif
 
 	/* setup the controls */
-- 
2.48.1

