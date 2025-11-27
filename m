Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23733C8D4F4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 09:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7C410E796;
	Thu, 27 Nov 2025 08:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="V4xC/Zk5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F46B10E0A5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 01:18:19 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-477a1c28778so2840465e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 17:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1764206298; x=1764811098; darn=lists.freedesktop.org; 
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:date:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HKgOFooMWN6cAHuCEA8Jqj3i0BZ6TtQryqGYElbczIg=;
 b=V4xC/Zk5Njh90Pvj2VG0e8RsNntpjhEPyZwzmTtcv+coN4fFEZ7xxvyd3CJItvnMCn
 qzVc/qSsAKAnyb9JcQZkpw3HYW/kE/w3qJA3q0mXJXwR+1hTjqEiREEsPjzxl+ta5H6M
 sWG9/YgpNIFYjiU0DRpV25ucleU2lNQzsq4Z7AKmAgjbbCdxdi3gNsK+PsjE2mxaH4DR
 FBEPyoo9K9bY3/VNG3V36OHCBcJrIcKoMIyuulKQUcQXzpGX+bphCck//EMdi4ge5MY5
 ykx7FJtmwvATZSdvvIfHePvE624sn46Y6bJGaPpAj6nZ2ybvgMa2f7oo4grJviyDEvxP
 +UJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764206298; x=1764811098;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HKgOFooMWN6cAHuCEA8Jqj3i0BZ6TtQryqGYElbczIg=;
 b=laIINZRQ0DdFPN6eLLBKJWKD1HAnEKyfBTw99kiiCb1xO7PcJqoPGntnLRmlxZPCvK
 SSPImCbGTYtjRwBO6B8eiWEL5mA/IUONxCcrS0pQxoHIMeYgsa0t4ELw3Cm5YBoiYNq5
 Uw9YABqFoInU5S8rz49o4j18M872ewI3iiMIJvusv5kDNrhl/26q2ER5f+pv+RmgtH/S
 sH5UcSx76zcN3zt4iEc8qfhcE+7c0jpVNaOZS6TOUzHHqLIa8O+4S9YtgRsvEuwJLAcm
 jhSYj00GV59pgDI8+UUV/QeYUxaCU213k9q/Mb7KWGZwVhBuCdpJyzeSh5Cd8/St4zKm
 LMVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyvH5EyqKvF9xfSVC35tv/55hm25rSyLhJFDZOBsCJxJMy5BvTt3BFk48pjwMwfil4l0ogLEgk5QM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+sjqSEr/BsobXzQDTbs5IC9TuaYALHfqCFsP+tP1mrrVPWaUl
 eauq75uQBSG4/Fs+ttto6pcP6cEV2APxk9En59ZtKA6irCwkkq+1fHXcQDW5SMSwv0M=
X-Gm-Gg: ASbGncsxWiq3iqWLqWtctaJw0MzK5gjgnPDuErx3dL6anN/3NCsLgEukCd7V8Y0/d8C
 s0LE1aE02wbLLlNXl585G7tS5NSzRqugz4fowZuZ2dyeH91g6Hj+yG8acJq6dP5nJrwlK/GRRqe
 Ekci45hH2p89pAd282QyPDZFoTmYt+M20ZL/jx0iz31RghZwyf+v02lbDWVKFG7pWRRz4PyWG49
 AzYYgwyALsW9GrZ32U1/YmNB1aQPH45zKcbdOl9Z/cwc8edQkTE8HufcsHY6OsnTT5ocajgkcdE
 VXRHogmLV64M1wiHkbBz0Z+NIvN2OlguBVN4mzdeXcvA8jA60ZGOIyngt/RKyiNZ/3QatB2xPSK
 ISHGhFOdJ9V1Qu6e6v/wbyuNIwoCvIc5+Q+hazEjLIOq58oVN1veA+PBAvHdmo1inE7oBZ+92zj
 Fdtcg+5GXpC4OGSYxExxXC0T32vLHV7HOU
X-Google-Smtp-Source: AGHT+IHKRsRzIcI/YdpyjCx/e6RWPSP3syqAgwQHcfAEZoMWkqQomccWOuW4YSvp5SYEElJFnjRGrw==
X-Received: by 2002:a05:600c:19ce:b0:477:79c7:8994 with SMTP id
 5b1f17b1804b1-47904b25e63mr87066215e9.30.1764206297510; 
 Wed, 26 Nov 2025 17:18:17 -0800 (PST)
Received: from r1chard (1-169-246-18.dynamic-ip.hinet.net. [1.169.246.18])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b1075ddsm207261215ad.3.2025.11.26.17.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 17:18:17 -0800 (PST)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Thu, 27 Nov 2025 09:18:09 +0800
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org,
 javierm@redhat.com, arnd@arndb.de, helgaas@kernel.org
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 3/9] sysfb: Add struct sysfb_display_info
Message-ID: <aSem0a7jTfCNTdX-@r1chard>
References: <20251126160854.553077-1-tzimmermann@suse.de>
 <20251126160854.553077-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126160854.553077-4-tzimmermann@suse.de>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Mailman-Approved-At: Thu, 27 Nov 2025 08:19:07 +0000
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


Reviewed-by: Richard Lyu <richard.lyu@suse.com>

On 2025/11/26 17:03, Thomas Zimmermann wrote:
> Add struct sysfb_display_info to wrap display-related state. For now
> it contains only the screen's video mode. Later EDID will be added as
> well.
> 
> This struct will be helpful for passing display state to sysfb drivers
> or from the EFI stub library.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  include/linux/sysfb.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
> index 8527a50a5290..8b37247528bf 100644
> --- a/include/linux/sysfb.h
> +++ b/include/linux/sysfb.h
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <linux/err.h>
> +#include <linux/screen_info.h>
>  #include <linux/types.h>
>  
>  #include <linux/platform_data/simplefb.h>
> @@ -60,6 +61,10 @@ struct efifb_dmi_info {
>  	int flags;
>  };
>  
> +struct sysfb_display_info {
> +	struct screen_info screen;
> +};
> +
>  #ifdef CONFIG_SYSFB
>  
>  void sysfb_disable(struct device *dev);
> -- 
> 2.51.1
> 
