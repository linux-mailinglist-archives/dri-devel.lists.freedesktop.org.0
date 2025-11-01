Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E44C283D1
	for <lists+dri-devel@lfdr.de>; Sat, 01 Nov 2025 18:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BECD10E01F;
	Sat,  1 Nov 2025 17:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N+pqmSHO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A252510E01F
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Nov 2025 17:27:05 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-475dc0ed8aeso21359485e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Nov 2025 10:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762018024; x=1762622824; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FbWnJy2qvToz3lRO6LsUfQP9kSkNdSH0CV+AqxPKYkU=;
 b=N+pqmSHOF62oZUKpS4yhFJLvaPa+eG8R4lof7JFsGEY/Iyg1nN3XDypLov+0CxLXER
 DHTDUJ+n+uXhUV6fWNe0qGsghp1w1Y9Hxdumf98OfhtbdYtrU7a0IvgiPyjIvIFpV5wz
 XyGqFAuUKdK/CvukyCqaAXd1w25fLYhP3m40MKRkYclC4yqkntpaJcLdSq9pSsy+uJlV
 v5dNq7IIXlzhgT4UY3mTThQDnDLXrIUdr8zT8lmHF6yjcGFbtbI4nvZP21zZY3ZVX2lE
 4RY45i+eOmZrncP3+GB8eBFKBdRMmiaQsQhtbGzCI53T15xttdkxbcM7PFB5Hwyk61Ry
 53Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762018024; x=1762622824;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FbWnJy2qvToz3lRO6LsUfQP9kSkNdSH0CV+AqxPKYkU=;
 b=gOoyXcGItroTUjaUlpM2qaBJZcCaVbHdiENJ+wDzIh2WGGaxynGfisctIgOd264eV9
 s+wMLtxrVXNNRH6qaH2BoHiRysXi/K0mBOsU7+xyW3ZE/SYiH8PB2xpY7BmjjYmLs6JG
 YhV2oFbn9DhrHjrunjwrgsyvGfvN4ENCh0KeoeOrBvaelPAqNIoDSBcaxBhChfOE/y6s
 XGzS27MEX53qtqLxkxoehxl71Xa35stSpynUH0mRorWpVvuTAFibGWUjuKO21ho2yChW
 iGcHStip9qB8IQZfBt/GfLbedFIlDSIC8RGIt4msFMi5E1kiuNP1vY6doU2lS7bUcEKd
 MWZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2UB9v3bNyH47CmiYh+WJaiwwPg7TMHNqGEwmW0uiI+naAyBJX2ioZRlcEd2Ihk+AkqemQBypPSHQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDhQZVgldAAVGbT/EXYMdwPpf5OYvISF8O237aGpljM0dzJmBj
 HlLKvdoBxg5cdVqQM2TTXsnblOVLYzpFWxcr0M5oS+XPcAseym+yYACz
X-Gm-Gg: ASbGnctmRyMnpbz0XgXplRftELegvDlzdj2ZbPzGuai4k23cL8969J7UlfbJtulqXbw
 gXI4zvRAvTrm/1snx7pBp9gh+0dwPFCiyUMmTV9A6sAmZ7wMBjiTa1GGoU4Z2R2IroXb/q/AN8x
 B5HRtH1mPZ9lzogjbaB56M8UYIRd27dvbTjPrAYaHL3AxnMLT7MbkSfvQse7VLIimLFZrKXCMN5
 kNLVTvR1wQ8YdQhlg4ZUa1M5PyTykVgXfAuKBt+JHkVZnD+33k7Ylx9QOPmITAHPNkSdkHPs1AK
 nYErVmcyHenKIMBtZXh21u1kK/Hh9L35S1Yk3rcKUnRTzayQKGb/Ucter6B8yiI07Hgsz0hpQel
 wh5ZjY4K2qUzKIJP1DbX/qtdA+a2mLPqiJ/sce2ibX2yYWZAUuvQ9pHPvbblm1FsVkLJSDkP340
 bl/Q==
X-Google-Smtp-Source: AGHT+IHAkUzD34H7H16cKENp3oNKZcbe/ZJey18IMsChHD+t7D8pxRPIyXbIWzgon9sgvH3z56VsCw==
X-Received: by 2002:a05:600c:468e:b0:475:dd59:d8d8 with SMTP id
 5b1f17b1804b1-47730793c2amr81536255e9.8.1762018023809; 
 Sat, 01 Nov 2025 10:27:03 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fd280fbsm46567395e9.5.2025.11.01.10.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Nov 2025 10:27:03 -0700 (PDT)
Date: Sat, 1 Nov 2025 18:26:54 +0100
From: =?iso-8859-1?Q?Rapha=EBl?= Gallais-Pou <rgallaispou@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Yan <andy.yan@rock-chips.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] drm/bridge: synopsys: dw-dp: add bridge before
 attaching
Message-ID: <aQZC3gr55C1r2uuX@thinkstation>
References: <20251028-b4-drm-bridge-alloc-add-before-attach-v3-0-bb8611acbbfb@bootlin.com>
 <20251028-b4-drm-bridge-alloc-add-before-attach-v3-6-bb8611acbbfb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028-b4-drm-bridge-alloc-add-before-attach-v3-6-bb8611acbbfb@bootlin.com>
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

Le Tue, Oct 28, 2025 at 11:15:47AM +0100, Luca Ceresoli a écrit :
> DRM bridges should be always added to the global bridge list before being
> attached.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v3 after searching for any remaining bridges not
> using drm_bridge_add().
> ---

Hi Luca,

Reviewed-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Best regards,
Raphaël
