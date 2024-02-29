Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E25386D3C3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 20:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7A810E5A6;
	Thu, 29 Feb 2024 19:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="kfs0BoPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7098810E59D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 19:54:40 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-365b3d92354so7987605ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 11:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709236479; x=1709841279;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nUYjDsz8R+v6rHJ3y7OAU2D1Csa/Qz5IVStrXkn7les=;
 b=kfs0BoPL8RStUz/+bgJ1VuTakw6PGRtH7PLbP3dSkrqeuGZmCK+XcXW9snPvFDaT4U
 n87chPmPvZwfMDZEs/8nR16f6icdrkaEMYNMd3PUouqaQxNlcnhzq/KFsmiHeur5KYNG
 D+Nrc7CuL3gvI1Ddg2dldfXLclO3qm/kIJR/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709236479; x=1709841279;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nUYjDsz8R+v6rHJ3y7OAU2D1Csa/Qz5IVStrXkn7les=;
 b=gvjrFE0VebQ6TsfO/a84UsJDsAfN8+81CLrJdhUFBzRW7oAJ3zXPx2u+VlHD8WANlO
 bWrX/CAhiczddvBtPsUQGC2FjffuENII3ADhBCqyZ7N69PzkG5Sf0Se0dcu6ZDv1/2ax
 m3ZDrwRRWOax3J0UOvjnisb0J2vfN7UU6epCqjjOzs8qAvWwQqsTOjg8zrS/ACYbjVmd
 Bcj/2l124/nVjj/u8UlGLZxhG1KVsYV2/33aH8cwWkjPcCIMJ9JRxn0wKT89+vik82QC
 6j83WK8a5SE//rUbYbW/92ShlUYIBf3/e7cdBTbYQDueARVwmlhgeXy3uamUIdEiJQ1M
 aFRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBza4AXigwlt+q63C0aZEom2U7QLVrV66GqSYSFo20lnqMfYWJv8+DokNGkHEXdM1FoWZxBqU+rJSPA5Leyf6mU7rcpSxfFaixFnZIRgWn
X-Gm-Message-State: AOJu0YyuDhRZ00QsfRM4sNTwtSnC9NXYUTaTxLRoJfeAU4/EpSOdmkVf
 NJsI5+yJxIi54ocMbj9I4Tc9gP+daW7daHd9lM5gE/bzdq9wn/P9C3Oz0emhMA==
X-Google-Smtp-Source: AGHT+IGGZoKxldQ+DP+Axi8YKT3jN9VQUWSq7FAtq78rNujQCKd4lgSM0meggARCt9I6uWVFT1LKHg==
X-Received: by 2002:a92:ca4e:0:b0:365:19f0:f2ae with SMTP id
 q14-20020a92ca4e000000b0036519f0f2aemr40689ilo.31.1709236479442; 
 Thu, 29 Feb 2024 11:54:39 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com.
 [35.222.57.144]) by smtp.gmail.com with UTF8SMTPSA id
 l12-20020a056e021c0c00b003657f6b23e4sm497553ilh.68.2024.02.29.11.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 11:54:38 -0800 (PST)
Date: Thu, 29 Feb 2024 19:54:38 +0000
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
Subject: Re: [PATCH v6 9/9] usb: misc: onboard_dev: add support for XMOS
 XVF3500
Message-ID: <ZeDg_s4ob7TVb1wx@google.com>
References: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
 <20240229-onboard_xvf3500-v6-9-a0aff2947040@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240229-onboard_xvf3500-v6-9-a0aff2947040@wolfvision.net>
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

On Thu, Feb 29, 2024 at 09:34:52AM +0100, Javier Carrasco wrote:
> The XMOS XVF3500 VocalFusion Voice Processor[1] is a low-latency, 32-bit
> multicore controller for voice processing.
> 
> This device requires a specific power sequence, which consists of
> enabling the regulators that control the 3V3 and 1V0 device supplies,
> and a reset de-assertion after a delay of at least 100ns.
> 
> Once in normal operation, the XVF3500 registers itself as a USB device,
> and it does not require any device-specific operations in the driver.
> 
> [1] https://www.xmos.com/xvf3500/
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

Acked-by: Matthias Kaehlcke <mka@chromium.org>
