Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC438A2DA4E
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 03:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5D310E011;
	Sun,  9 Feb 2025 02:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="La3zZAP5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8657710E011
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 02:00:19 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-54298ec925bso4096865e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 18:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739066417; x=1739671217; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RiSJBpwJ06y13Y4m32+RLR4LRqNBHBlyjKc73IF8wvA=;
 b=La3zZAP5MIiCfqQpG3gzKGM0pBlYMpCoJC9Zcpd9tChKAIFO/RebUlaC7+AUJbUs4i
 vYxwGM3aLdQKX5ta6V9EX4yjM2qHWacNTVD+n6Sy0qwQCPXbIp6DINk2B/v1Ul2G18Ao
 aWt4tyYhomuGSV+jSgOuS53mxP7Y3x/bW44fiQ6VuRCRLNvUyVH+UECH0FYK+7kBupQH
 I6K5AH4zvjdWeHMm7tuGzQyuRqUzVgQQollp+F3CwgSz4T237XmQCKx9623EZpwYOolp
 TkYJYTn7lSd6wbC7aGXzTB6hARhtrjlxgxoF7pkSb5Gw/gK8wB0HONOZYGLQcSGgCDIS
 H0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739066417; x=1739671217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RiSJBpwJ06y13Y4m32+RLR4LRqNBHBlyjKc73IF8wvA=;
 b=BbNYkBgKXod7SgjdrXHN9ut9IzMLLK0od0O0jrdd2xTfgYNNXr3vXqyQYW2tjd2y7W
 ExOfFmzH03QHvUr3eeCNRIE09BoIB+koad8MdzgCCzbyznhfXE5dSXQp2SOVjkXYdRq+
 DYd4waQkQCRe4adTi8nd4k62IIRy8MuvgfDlELYL6CCP2XIhJQjPF0dmOxKtY0JuNAnR
 8Aiq9hSLsT9ysceW6PZNY4GmnvapBmxl6gLF2tnS2OnjT7jInzrCXNrXIdES6U4904sx
 H5yJON4s3tVZWNB0Y29QMcG7aD40f4NGefoAFKNBA33vnV/FcP1Ra6w7vd/mdfjHL6Cj
 GHRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOmptqcMsoUbBpe+TTnVi/DOgYZv/8BbbTi2LsPwqzROF+UiZaGdpKIVjv+xctG7Mqd32WGGQo5P4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCxaxE7c2UfyQX1kvhdUS4O3UTGWfV2MIDl9Qv10QJcd6Tua99
 s0/W+TQKhvObC/cQwt296/kh6MCsQm2dEdH3MNSQh8RAorK4AiaDCg8ZH2hioSU=
X-Gm-Gg: ASbGncshgLv2htGbZlEYAueDoCqSVVCjI+AZ/oiYa/rEtXXou6Tvv8sYRwJQS0RvhKg
 idpBtf7aXdW0ozxryMR2HUXJxWqZldgDo9I/7qrPOJPJSzAv4L2tq9aMWrmmDE2CBy45soDi4Ah
 CFrbh/1TiYY7f6CFzzo4cZCcrg9aDOGVmc4lb1LUQ6688AGnq5t9/zbYgP6uScwMmMROHk7Jw4A
 Mfwu9LxeDJjLjwPt9q7zJ+SqSWTg9Maejaeeyl5/IeABrnvl7q616s3AcpHAihb3f5J3Cp9JVqw
 GKjEb0OjoMktmvr1/0v/I2vQSbrUt9jgioD2bYhsxnO7XJOVz6jA2nJV2FM=
X-Google-Smtp-Source: AGHT+IE1RFuoba21V8k71iKwxN4QDWJF/N6Im8G5mQFzaucJ5Tcf1TVvg4WXdL+j+R121vWZVBKCRQ==
X-Received: by 2002:ac2:5f06:0:b0:545:9ce:7606 with SMTP id
 2adb3069b0e04-54509ce9eb7mr130030e87.34.1739066417472; 
 Sat, 08 Feb 2025 18:00:17 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54508f570b0sm82299e87.126.2025.02.08.18.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 18:00:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/hisilicon/hibmc: select CONFIG_DRM_DISPLAY_DP_HELPER
Date: Sun,  9 Feb 2025 04:00:07 +0200
Message-ID: <173906639943.8625.1474098563019119282.b4-ty@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250127071059.617567-1-arnd@kernel.org>
References: <20250127071059.617567-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Mon, 27 Jan 2025 08:10:02 +0100, Arnd Bergmann wrote:
> Without the DP helper code, the newly added displayport support
> causes a link failure:
> 
> x86_64-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.o: in function `hibmc_dp_aux_init':
> dp_aux.c:(.text+0x37e): undefined reference to `drm_dp_aux_init'
> x86_64-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.o: in function `hibmc_dp_link_set_pattern':
> dp_link.c:(.text+0xae): undefined reference to `drm_dp_dpcd_write'
> x86_64-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.o: in function `hibmc_dp_link_get_adjust_train':
> dp_link.c:(.text+0x121): undefined reference to `drm_dp_get_adjust_request_voltage'
> x86_64-linux-ld: dp_link.c:(.text+0x12e): undefined reference to `drm_dp_get_adjust_request_pre_emphasis'
> x86_64-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.o: in function `hibmc_dp_link_training':
> dp_link.c:(.text+0x2b0): undefined reference to `drm_dp_dpcd_write'
> x86_64-linux-ld: dp_link.c:(.text+0x2e3): undefined reference to `drm_dp_dpcd_write'
> 
> [...]

Applied to drm-misc-fixes, thanks!

[1/1] drm/hisilicon/hibmc: select CONFIG_DRM_DISPLAY_DP_HELPER
      commit: 9ab127a18018fb06bd42a54ed38bb7b8c449d686

Best regards,
-- 
With best wishes
Dmitry

