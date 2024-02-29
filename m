Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 340A586D37E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 20:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F3910E4CA;
	Thu, 29 Feb 2024 19:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="L3me3Z6I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526D710E4CA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 19:43:10 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7c403dbf3adso70735739f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 11:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709235789; x=1709840589;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F8CJpd2zjevkw27a8KH1DmVXJgw/Y0RSSqYs/uQ6sww=;
 b=L3me3Z6IKtDfcaKPBh4C/w08jzooWycp0S1P8Jps0MESYPCUqRJjwU8VIZWXgl9kxq
 /DP4bsXheR/5X0AYc/uC3dCgKuIaPTwTfCXwC8OXF6dl9uB0UbCDga6PMPI4bvbEW04v
 WQYsR7YqjgEQ1NyhTYNJBsDDM4QzHFzFl4bSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709235789; x=1709840589;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F8CJpd2zjevkw27a8KH1DmVXJgw/Y0RSSqYs/uQ6sww=;
 b=VdkSSpS4mHzmADCypJQW+R7JVuOiAM0RvxDurWI3ck1YUF1zbUrUkU+nN/7LMWmwD+
 OasjU3qC4lNfgN4RR+EnpSDVOTdBPDZcEaTF9wzIznjApdC+7va0/eBz1V50ghudHujq
 BHQZGLlb33s15O3zlNO4F+Q6j3j/sjbc998XoRP+vQtohFblVEM/CgC41h1C/OnjoJ7/
 cskO08dDxX1fT+ZzZ40LjLeZ8c+zlj4bExqKtUkb91FdGIyqbQo5rVbkfTzlKIRfSQL5
 Oj02g915zqQMvcUpxGrltgTpjLNbOuv64UPN0us8i+AVrGRvxf2pswFBjJvC2zQSL2nx
 UvJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJUFQQnnwhIil+8tJUOaRDOaQyKnkW/BoOjg62JG3Rmx4NWLyOkg7/atZycBCrkX8v2DNqeDMZLLQ6EB7aQ6AmfIv+A8qQhEYFHO5trgX9
X-Gm-Message-State: AOJu0YzGtUSc86hIZUBxD0H3AHK6TU5pRx7nbk9XGG/az9ypDu5QvQn+
 J7l2NeniLzbeDfS1u/P697q6AKcPb5Zy/WFFLFZyS4T3J5S2GxXW1daXBABw6Q==
X-Google-Smtp-Source: AGHT+IHgIo2qPrUsuvVLTw7+MTktv0oQumqgBoVoBnnMijf9sWuRrwq2Jdy3DJ/2sgHur6o+XReVVw==
X-Received: by 2002:a05:6602:1c8c:b0:7c7:43e0:335a with SMTP id
 hf12-20020a0566021c8c00b007c743e0335amr3364192iob.2.1709235789521; 
 Thu, 29 Feb 2024 11:43:09 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com.
 [35.222.57.144]) by smtp.gmail.com with UTF8SMTPSA id
 x25-20020a029719000000b00474663a39edsm460221jai.50.2024.02.29.11.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 11:43:09 -0800 (PST)
Date: Thu, 29 Feb 2024 19:43:08 +0000
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
Subject: Re: [PATCH v6 5/9] arm64: defconfig: update ONBOARD_USB_HUB to
 ONBOARD_USB_DEV
Message-ID: <ZeDeTFh_V4Eux5uK@google.com>
References: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
 <20240229-onboard_xvf3500-v6-5-a0aff2947040@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240229-onboard_xvf3500-v6-5-a0aff2947040@wolfvision.net>
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

On Thu, Feb 29, 2024 at 09:34:48AM +0100, Javier Carrasco wrote:
> The onboard_usb_hub driver has been updated to support non-hub devices,
> which has led to some renaming.
> 
> Update to the new name (ONBOARD_USB_DEV) accordingly.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
