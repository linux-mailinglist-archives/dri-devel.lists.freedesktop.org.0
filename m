Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC2B86D376
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 20:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1021A10E4C1;
	Thu, 29 Feb 2024 19:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mR9OcVFc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453A910E4C1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 19:42:43 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-364f794f237so7074925ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 11:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709235762; x=1709840562;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KdmQnb2fNMhFh9QHwFl1noeV2VqNw483nMl2dymZb8k=;
 b=mR9OcVFckC9qQFjjoBKe2bh9r0Lp+GfZ9eaO7x/28E88soWB/+S7kD325i1zLGasln
 JkOyEoVBm3yd0svBSd0XXD3shYwK0LxoH9Z/2xuDFmXnhb+Has4kvSerh69XYfAajlDM
 EVpjbUKJ4RfoZVbGADuwXIo6UIZYccjGPZmgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709235762; x=1709840562;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KdmQnb2fNMhFh9QHwFl1noeV2VqNw483nMl2dymZb8k=;
 b=qZrZgdldbiqQx6NVtv5JgQYsva/0k1auuTaNHCA73hop1GoYA5aPiZtYvSsBcB8bSF
 5h3gkNoF7ncybhxqPyhGNDudRtKvRgcJE7uoMikkWo14s3NMszzWdtRz0KO6YGpG1o2Y
 tBEET4nUABK3QoS+Ih+rv0UXHbGIOKi/aLaOwmg80Dn7ur5xZd7fcCLgWxqGeMbKBcoA
 SNqGPgtl6erAhJ77NkojGCSDIfR3vlvInUiVD1z5gln1Xb4uWZ5UsVUm47QfwKxTGozW
 2iRqWKh/JIIo7z3wOkmnhNHtPffm7iH207ExjineW8c8Jiw4VXYfXfQBMOaXP7XbItoi
 iu6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbHXI95FpWr57glsZzfvKgMKmkngO9CCRCBIdBy71CmufIsKkbVsfKy/h+AgmvPlcpJ+uLa8jMYcIYa4OZp86U1gQDnUhBENsiJJ/pmGtQ
X-Gm-Message-State: AOJu0YzNphnNQDz4Amm1LYOrxf6WYED2I0UJ02ZMQSdBtIUDqSgH+yES
 XDg0pFOH6rL/7+G5uCMs10DNWFyiaoXhuStg6lg9fRD9H5xYPRp1annOqfgo7A==
X-Google-Smtp-Source: AGHT+IFq8HTZpzDtKrD3CmV20Ym2lHtGVcr43P2WwUpMFpTWmAh7BLzqB4hWiofzybpN3yXuPwjHbQ==
X-Received: by 2002:a05:6e02:1a8c:b0:363:e7c8:2180 with SMTP id
 k12-20020a056e021a8c00b00363e7c82180mr35407ilv.12.1709235762414; 
 Thu, 29 Feb 2024 11:42:42 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com.
 [35.222.57.144]) by smtp.gmail.com with UTF8SMTPSA id
 k16-20020a023350000000b00474c8277395sm99591jak.47.2024.02.29.11.42.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 11:42:42 -0800 (PST)
Date: Thu, 29 Feb 2024 19:42:41 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 4/9] drm: ci: arm64.config: update ONBOARD_USB_HUB to
 ONBOARD_USB_DEV
Message-ID: <ZeDeMc_hQzVo-CxQ@google.com>
References: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
 <20240229-onboard_xvf3500-v6-4-a0aff2947040@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240229-onboard_xvf3500-v6-4-a0aff2947040@wolfvision.net>
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

On Thu, Feb 29, 2024 at 09:34:47AM +0100, Javier Carrasco wrote:
> The onboard_usb_hub driver has been updated to support non-hub devices,
> which has led to some renaming.
> 
> Update to the new name (ONBOARD_USB_DEV) accordingly.
> 
> Acked-by: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
