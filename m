Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4508AAD7F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 13:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD7B10F7ED;
	Fri, 19 Apr 2024 11:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DnA+hdEz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E0B10F635
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 11:16:17 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3499f1bed15so1669699f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 04:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713525376; x=1714130176; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lJd9Cm2U697LnBlhHhSEj5YlaO4Yzmz+HEeo9KmF9JU=;
 b=DnA+hdEzR2/Hg+OnlynfKVWWeFfflLGZEqfnadylX9V8tyb+Nft1jrbcF3bpRLBRpr
 ihZ8mAUnkmeAYIyaNIVHr6q9qH3CmeaZfC9jCZQnIEubG2Lg51FNra9jQzd9iegIXc0E
 eHpB7UO6b6++ZOm42PPA3+nf9d48tH9pDs45VkfgpDn+DDJxPTKHbu8njriCnpoWI9TF
 9pCBjBD4erNs9+RGLXMrVz3O3FkpXbRLH3rCFuE60auw73iWs+irkr4TIji/efXuHkFK
 HneZmMqeaqmM1UFvYdEzQ+fR11zM4DpCFFPMDAccxl4N85EaqnQ5VAChLjjcRP8dzVI6
 hl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713525376; x=1714130176;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lJd9Cm2U697LnBlhHhSEj5YlaO4Yzmz+HEeo9KmF9JU=;
 b=FN398cMInZfg8IyE5pMsItnWwhbQ9RW79miIHaH7/oTXtd5IKjS9IVMOWQ9ZrdZupM
 JcgvRRrSBTYVI7vaP/Pca6/v5Ulq7kEExXPp6Aj381LPcHRmZI1T4VMT3V1OYuB4KotS
 hHQ0ALzuCByvqGtogtBR2GiXt0sDn3t2cqbjxKgmoNJsD8vWkSVKD2JdlcFakAPAA84P
 WfhE2xzIR7sGuZrH6Sq3snj8PWMPwxloAVQ2dCcFd8xWwW10z7taxLYgYB0tjcF8ZJ9F
 ax8wBhkVMaieCA46PBIfgYWLfUJSJEKZYY+Kr7wF67U/BV2TAdZxl7kF2LWPhEnyIUEa
 U7uQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVUegfPxXYJsncId3x/X9S4I/8ls9b2WkPC52B6WNoRgEwNHwRIYuVYsRmlPjUO2pSYseTct5oLd4nEBzQo0lcbt4YqNsSBEx/O1O3vQZJ
X-Gm-Message-State: AOJu0Yz7uigo4+suOoey4lHwHNZJNrh7gUvZkHSvHzkEsg2W42gghCxd
 4TugRvxt7maxK0IWtVdf6wUC3YqVp533gZVJ6O/Wbd2GBarhxzTM5veZWzDzN04=
X-Google-Smtp-Source: AGHT+IE1a4qRWYhPeu0QdfH0dU1eOD7zKO7WosHykWSQF41QV8m8arLjW2fak04Hrze4DKigl/GWSA==
X-Received: by 2002:adf:f447:0:b0:343:d23a:c977 with SMTP id
 f7-20020adff447000000b00343d23ac977mr4117664wrp.1.1713525375627; 
 Fri, 19 Apr 2024 04:16:15 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a05600001cb00b0034a21842accsm3473127wrx.86.2024.04.19.04.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 04:16:15 -0700 (PDT)
Date: Fri, 19 Apr 2024 12:16:13 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Shresth Prasad <shresthprasad7@gmail.com>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 javier.carrasco.cruz@gmail.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH][next] drivers: video: Simplify device_node cleanup using
 __free
Message-ID: <20240419111613.GA12884@aspen.lan>
References: <20240418194302.1466-1-shresthprasad7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418194302.1466-1-shresthprasad7@gmail.com>
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

^^^

Please fix the subject line to be "backlight: <driver>: ...". I came
very close to deleting this patch without reading it ;-) .


On Fri, Apr 19, 2024 at 01:13:02AM +0530, Shresth Prasad wrote:
> diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
> index eb18c6eb0ff0..3c5d8125080c 100644
> --- a/drivers/video/backlight/sky81452-backlight.c
> +++ b/drivers/video/backlight/sky81452-backlight.c
> @@ -182,7 +182,7 @@ static const struct attribute_group sky81452_bl_attr_group = {
>  static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
>  							struct device *dev)
>  {
> -	struct device_node *np = of_node_get(dev->of_node);
> +	struct device_node *np __free(device_node) = of_node_get(dev->of_node);


Do we need to get dev->of_node at all? The device, which we are
borrowing, already owns a reference to the node so I don't see
any point in this function taking an extra one.

So why not simply make this:

	struct device_node *np = dev->of_node;


Daniel.
