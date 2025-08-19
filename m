Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152DDB2C2F6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7267E10E5C7;
	Tue, 19 Aug 2025 12:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BHDnkWcI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF87810E5C8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:16:57 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-afcb78fb04cso746428466b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605816; x=1756210616; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4fkU/a+xa7cLVNmfOA736vjbmCxRfQxiZ58RMOVvwos=;
 b=BHDnkWcI+MIIMmcg/N0b4oBUZ2OIVZqMcpWNu1n0M/kmCWsXvwZ/cDU1UByo03W6lt
 c17JyjW0bAsFq525ScE0sRYnySvpL2DNqrO5nSAYCXr37vo/gPJr3GS3mYv5iUSdWUjq
 1Y0tAIXY3WDqMmFnYVuxjz1x/GzlHQ3Un2WireWTswUX9j1kP+zrjonYOr8WhDrvXxVw
 G1CV55rbW8NfvVx1Xa2uz13YU1UdUCBIZJUKsPzI0Njfuer20DsWxDvdm3L174eQr/36
 FgGXoYbmcIn/xn0MXMeqQnHddkhJBYkKm6O8ekosMvcZwfDsh5iy+kmZyDFDzQQcCB4A
 aaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605816; x=1756210616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4fkU/a+xa7cLVNmfOA736vjbmCxRfQxiZ58RMOVvwos=;
 b=IB/O/026n40B/0PQ7Ch2T6qp6pHjiwJJTcx8IyYS1/plU/exaY6UUHW995w4gunFqg
 KFb5AQI5HKVsIp6uXQl1WIi4hvGx4imRMHRFno/faPxpFNQHKXJCCaPl3wkHyfYraHc9
 ym4hQO9Fe6TSIYOhFhg0mk81lbdM5NLMj5zR99gT6j4HgpMJ+AI10K2P/ZMVzK0IDob4
 O+aELaK0O7i4uusgLZhTIJgGfS228/nvCdSYX0kBnugFopZChMSL2m0x8iQV29MyU9v1
 SlSBnMRQWVo7AJyUmIt6MtQjz6iXA5bx+Al8lO0H+yaOZrVT7txyYFM7we5jppzd4gym
 8O7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq70B2dmKHpNlSZzS/Tlo9C8sgPA5lcovZ3xVuSWmsWlwBP96KDSOfTgXlU2F/zhyifIl5J1grV88=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziZkf/1lvisksfY+HCzlWLTtDlSWYN05uiDcizdlCgdbpjzJka
 36LYPhemcoc0zjzBTDDq7GcjRBNpZArmGXrG1qMNKQ9xXiJCMRTPoBaS
X-Gm-Gg: ASbGncve98+v5C7l16+ugMF/5NPcDDzrXQkgv2FKoglPKl7UEMKQAYmyN0wx8D84VXI
 b+co3ux6Ii0TR4WIfaH85dUPl42KnWrgOQpbBqkXUKwQWpFohhdyIBkBZle59yeN4lFr2I0oDcw
 Om0kqAAnYr2nTuDYu+I628p7unqVMjJi37ZzaHn+aeiRTByzWzYUH509bdCed7y+M7r0PXbRU2k
 UzKAyB9jrzF7nc31XZHCFoD55awaDSSsS8MLlwu9Rq0k9lzK9FKEB9TggNrQtGCFOErTNHQGUP4
 UBcXDKExfvJ2Po3YN4qh2qJmIxCCJ7dtxc3SR0WHn6/8hRyGuvYeoyNRWgMQoKRPsS4PAR831IE
 yRjzAGR8+9cFxZw==
X-Google-Smtp-Source: AGHT+IHJ4yXxyFDH52h3CZln8jXl9xdbMpK8BdgfQdr6A++kmO6oEQ+K4jjTD9jwnpkwnFwOUoSZIQ==
X-Received: by 2002:a17:907:d78a:b0:af9:36b3:d695 with SMTP id
 a640c23a62f3a-afddd1fb2c8mr241450666b.43.1755605816012; 
 Tue, 19 Aug 2025 05:16:56 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:16:55 -0700 (PDT)
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
Subject: [PATCH v1 08/19] staging: media: tegra-video: vi: adjust
 get_selection op check
Date: Tue, 19 Aug 2025 15:16:20 +0300
Message-ID: <20250819121631.84280-9-clamor95@gmail.com>
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

Get_selection operation may be implemented only for sink pad and may
return error code. Set try_crop to 0 instead of returning error.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 71be205cacb5..4f67adc395ac 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -476,15 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
-			ret = v4l2_subdev_call(subdev, pad, get_selection,
-					       NULL, &sdsel);
-			if (ret)
-				return -EINVAL;
-
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
 		}
-- 
2.48.1

