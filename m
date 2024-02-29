Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 421C486D385
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 20:43:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571B310E596;
	Thu, 29 Feb 2024 19:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="QOTU4X9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAD710E596
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 19:43:44 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-7c7db34d162so50497639f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 11:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709235823; x=1709840623;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vPzWpf0KRKzJfNNxm1xP82WyABEHBYT/ScSU2rL7CkM=;
 b=QOTU4X9Ds+p+L9GaJI2bqzNjOUm5r5dIUXOhi+5CsqOAQhjBROpQftfeiWLtyWo3R1
 uYvHv6a9JeKV45L8kdI0fmhvj1JtMLNDPVvOBMBYDkhIfjkP6XSyitTboMufbrCYcdvL
 MwSXZmZGhvJGC7elEjIm7+kNGThNXx/2Z9NDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709235823; x=1709840623;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vPzWpf0KRKzJfNNxm1xP82WyABEHBYT/ScSU2rL7CkM=;
 b=GTkvhk8y10enKZHEWM8G/SAU5FjxF1rinjbO8lgVnUFavSizc25zgNpdOQvc+DmqOK
 XaCxTJsNWQNWO8GYR0AS8q9pYpN4enT+9P58oOLLL+wmBXZKO4eQdZIbZIFb0alSByMu
 xeKmexYFXfeFdOQSGsXlJRs+smhmB+C8nJH9vTAFBYeDt38UTIwlDPJ8Ei8UHrvJhssc
 ezcJc53TE7ptXwL5XAuvslxOJEmJmnff0SdGr9/HjxXav5kuxvlm3k2kaXLApXeiVsyn
 cQdyndVlAcashnPWkpFP+PiMDWGSO3LB4AJJsgJgkM0ki0CyYJEJbPwgB+lkdpFoRB3z
 4nbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpAoYPw7GwJ90q1ouq2hYAcrXK/+631cP+dkQtFcsalqwEBGsvnihmTHV8C+REIQhDbwsC1GLjsz2FERW7EdBRNqP0KlwAklGxrCUyV2ku
X-Gm-Message-State: AOJu0YzoSnamiX6xdcfvXK3AbB1rX4oFt+C709FoX+ayJF5WFEq6QzVB
 uJywK9Fku+SgyhwQjpjaf1ttXaoYKgkEO2vDz0dIXsIp+d1/dqtOoOrXJCXaOg==
X-Google-Smtp-Source: AGHT+IFs9wvs5pOAkDdWryJuttZydoEKEVDVwn8LfV2HYXPgDEXsihSPEp+kjzLHY+xQ9IiRbWM32w==
X-Received: by 2002:a05:6602:2c48:b0:7c8:1437:4b07 with SMTP id
 x8-20020a0566022c4800b007c814374b07mr2416906iov.20.1709235823176; 
 Thu, 29 Feb 2024 11:43:43 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com.
 [35.222.57.144]) by smtp.gmail.com with UTF8SMTPSA id
 m8-20020a0566380ac800b0047472bc0182sm465429jab.63.2024.02.29.11.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 11:43:42 -0800 (PST)
Date: Thu, 29 Feb 2024 19:43:42 +0000
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
Subject: Re: [PATCH v6 6/9] ARM: multi_v7_defconfig: update ONBOARD_USB_HUB
 to ONBOAD_USB_DEV
Message-ID: <ZeDeboeqDe88gKj2@google.com>
References: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
 <20240229-onboard_xvf3500-v6-6-a0aff2947040@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240229-onboard_xvf3500-v6-6-a0aff2947040@wolfvision.net>
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

On Thu, Feb 29, 2024 at 09:34:49AM +0100, Javier Carrasco wrote:
> The onboard_usb_hub driver has been updated to support non-hub devices,
> which has led to some renaming. Update to the new name accordingly.
> 
> Update to the new name (ONBOARD_USB_DEV) accordingly.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
