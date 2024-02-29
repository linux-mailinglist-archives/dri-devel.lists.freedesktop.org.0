Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EDD86CE9F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 17:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276FA10E4FA;
	Thu, 29 Feb 2024 16:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="DZYB9w8g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A20110E4FA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 16:19:01 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-364f791a428so5477865ab.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709223540; x=1709828340;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iDjcaSL55qXYMAB4NoyOKMuTj/7aaFa6rN5hETeg1qE=;
 b=DZYB9w8glrkqcqAkEVEA2jJQQA2CXUI52GWddtAzgBTJgVsBbSom8F8baBmlKBCznw
 BCrpMQSU+ejhZIFBDGWn0iASPCLiYLtQNVU5sX7wjeBqPTiUDjZ9LMNicrOnn55fwSC1
 cu8ajJuPwfG/WIHyEI3y6ejRNFGlwdPhfglNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709223540; x=1709828340;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iDjcaSL55qXYMAB4NoyOKMuTj/7aaFa6rN5hETeg1qE=;
 b=frnOFSA/4DmLbR+xK3zz5oKunEFHBAjvDud2pMKRnt5uHZT9afw6C1JzKM3IJkCDeP
 D/+G1Oa2xdy4C8yGW7+6VjTPRSUwF4kY3rJ2p21cxBBToCDRpssdeAo/4Lx2g8WxaPsL
 GuQ0BxZ9VkjEwqoMbGprYt174gQFahlgRVZzqKykSaC4Udz4FtuZRFavqVZKxNlhGikH
 2ipdEK8Zd6obeJlgb8ixb3IVJcz6SAOfD3SR2Hx6pafgPCHXihboX7UwHgoEiwsnElXp
 BVAdocr+TwcCfunhzhoLP/P3g1RvV6Z4lvi3AyWXaPOUv+Ixdn9g2XjE6Ed+ONGo4fbI
 Vt/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTq4SCn/XbcWtVURoN+uzatQJAJ+VmHfImWbWf/dLQobFpXxyc19XXAcosvvOS2X8Ba7ptFqdUFjFjCoeNkLTCUKTYaEVupBMHqd41a/bP
X-Gm-Message-State: AOJu0Yzd8GK6upL7znu16TShU7Vq3OWdQrv9z0KEgY7t0SRRCRs+RrQf
 VwQtOKzJy44aQYEVpbK9had5NWpkDNg5SThuFCt6cJGST1hlEeFrABgWDTT2Kw==
X-Google-Smtp-Source: AGHT+IG6SYsudTR8afpmPjLzEt8KXtmaUS4neFhh1HH4JtsY7zddGu+EDbyGNsZuVMQLqJ/dxguupg==
X-Received: by 2002:a92:d404:0:b0:363:c2d4:a365 with SMTP id
 q4-20020a92d404000000b00363c2d4a365mr2789045ilm.26.1709223540248; 
 Thu, 29 Feb 2024 08:19:00 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com.
 [35.222.57.144]) by smtp.gmail.com with UTF8SMTPSA id
 v4-20020a056e020f8400b00365cdc51c7esm93507ilo.30.2024.02.29.08.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 08:18:59 -0800 (PST)
Date: Thu, 29 Feb 2024 16:18:58 +0000
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
Subject: Re: [PATCH v6 1/9] usb: misc: onboard_hub: use pointer consistently
 in the probe function
Message-ID: <ZeCucidYlrO7f-7t@google.com>
References: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
 <20240229-onboard_xvf3500-v6-1-a0aff2947040@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240229-onboard_xvf3500-v6-1-a0aff2947040@wolfvision.net>
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

On Thu, Feb 29, 2024 at 09:34:44AM +0100, Javier Carrasco wrote:
> Commit 14485de431b0 ("usb: Use device_get_match_data()") overlooked the
> already existing pointer to pdev->dev 'dev'.
> 
> Use the existing pointer 'dev' in device_get_match_data() to keep code
> consistency.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

Acked-by: Matthias Kaehlcke <mka@chromium.org>
