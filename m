Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C86C6F15E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 14:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4D810E5D9;
	Wed, 19 Nov 2025 13:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ui+V5JMo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A7510E5D9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 13:57:25 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id
 a1e0cc1a2514c-934fb15ee9dso1792171241.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 05:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763560644; x=1764165444; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=de5iNSvcqaaOwtf/lxZWP8NugFiYs5OOT1HDIPeVtSo=;
 b=Ui+V5JMo0vxT8Lgl6ki1ox17d4sRBobXirm6gwb4vtQAGGj4BXLvx+q1R00SVA/cgj
 hOxS4qX1aoxFQQ/drgdc05U+3duThZuwt6YICnaJQxixdZUw4nWFaTWakpz2w6OB4Rkl
 L3eqckcOBrovbi91PBt9P6sN9RvY9iPnheSU+vMvcNGA2mqOWpGU5PkAmtml7i9iGY5P
 7oW03PICSG7b5nicLuHuZ4gIvcGwIVc5v7CsqngH8fH2ZOW/oic+F6mX3kEJePv9T4sa
 US/EIoeIa1tH9novnggEIsg0ZgQA6nnrBR3rgx1eLReDb/YGBkUZffzdC7OCPoIDLQmT
 BeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763560644; x=1764165444;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=de5iNSvcqaaOwtf/lxZWP8NugFiYs5OOT1HDIPeVtSo=;
 b=FEUGWW5AQyflk9koLNkTqTVUUS3e1CY4Aef1yobolEV/lWPXdPVBKG/oIsgSdOVbhr
 Nzc0QG/nHmQm/R5PEvm5KTfxzAYCJ2+4LxY06dK2PV+sZlSWasZLzaik/9TqZl69M9LL
 zkazwcsMkLRZNb0jKLqqg4IXKr4sz2Q18kDkV4COMqvPyIqwWHXdAbubyCKwS1b2u129
 PQvJnD6/sSBDDPXw1efhPfLmWi2pjNTpuSiBtkxDZ1JyBIM8pUNx713Y+Etx5RwU20Sh
 MGSv4tIPO4eFduR+IMrqWXnlfQv6qACVvkL0sh7kr9y68reRyKQAqdMBUbfqN0FbCOAC
 65JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmYTNRxej/w0A9DGlyfX9ItsQYH4tSsrrQpB63VC1JqYy4pnWWoo8gl4SUwpuLXHpBM6owwvSLE+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5bpx6SuVYsQkAsdF5lc3shEYf7pF/SVWzBhEM/0pQ8lMsPbMv
 MdowoAkHlIiS5piUXWo1cieT39AdKQJlVKTQ+YYeNNuXpioGNoBRNRxg
X-Gm-Gg: ASbGncs9BuNwozcwexcuJUDAUVE+njXoQXp5VoHCqw/r1eq5so8q/eeX0XuuuxvFxux
 tbIrb2I8i3/3d+jPCUE0R42EdkErq+x6YWjXtnUIwmUphDbynez9pE2+5meYiAIpbQfNuSLL7S4
 5jN+1OiLfmlAU6SLYrmY78oHlE6EQ3zXRbS5FcRIcYCMvXRJBkbKqrHcNDjXqZwrJZVwBRzGuYa
 lbdcUm6GpvgM4ifL38LyZf+45GTYP6KD965F4BPS3qYLmVX2bUJWGyGpHaisnUXOqYJGyQ5/D1A
 uCIHdBJIQNCE4KpU4P85BG+hx/eyF1aFSMC+FD9lFsJlCQvRjDt+MIEjZ+aC+aj+C69PpZAiZfR
 0i9qDhHP+BN9W34vkSOWb6uNI1/1L9T0v2MiRpgLf4eiRvLHr0KGdQ05Bu4JgsbWsWuY+4vKppd
 nKXu2ESJOPtSUwxtpZj7g4avoJqI4ejAR1KPFU+w==
X-Google-Smtp-Source: AGHT+IGa7rzG95o6W6cj6AePLxJr9+GNclEXHGzK7/ZUIMQGaEM6Y41RRqYBi1xyySb7CTzboZJPMg==
X-Received: by 2002:a05:6102:2906:b0:5d7:de08:dcd6 with SMTP id
 ada2fe7eead31-5dfc54eb53dmr6337612137.2.1763560644030; 
 Wed, 19 Nov 2025 05:57:24 -0800 (PST)
Received: from [192.168.1.145] ([104.203.11.126])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5dfb726ff96sm6675438137.14.2025.11.19.05.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 05:57:23 -0800 (PST)
Message-ID: <4ec784a5-0f67-4fd3-9d51-d89a9fa9a385@gmail.com>
Date: Wed, 19 Nov 2025 08:57:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: q40fb: request memory region
To: Sukrut Heroorkar <hsukrut3@gmail.com>, Helge Deller <deller@gmx.de>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: shuah@kernel.org, david.hunter.linux@gmail.com
References: <20251118095700.393474-1-hsukrut3@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20251118095700.393474-1-hsukrut3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 11/18/25 04:56, Sukrut Heroorkar wrote:
> The q40fb driver uses a fixed physical address but never reserves
> the corresponding I/O region. Reserve the range  as suggested in
> Documentation/gpu/todo.rst ("Request memory regions in all fbdev drivers").
> 
> No functional change beyond claming the resource. This change is compile
> tested only.

Reserving memory is a significant "functional" change, so you should not
put "No functional change...". I have noticed that in the mentorship
program, mentees might say this often times when they have not done
testing.

Thank you for describing that you did a compile test, but I believe that
more testing should be done before this patch is accepted.

As a result, if you are unable to test this device, I believe that an
RFT tag should be used. Also, the testing information goes below the
"---". This puts it in the change log and would make it so that if a
patch is accepted, everything below the change log is not put in the
commit message.

> 
> Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
> ---
>  drivers/video/fbdev/q40fb.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/video/fbdev/q40fb.c b/drivers/video/fbdev/q40fb.c
> index 1ff8fa176124..935260326c6f 100644
> --- a/drivers/video/fbdev/q40fb.c
> +++ b/drivers/video/fbdev/q40fb.c
> @@ -101,6 +101,12 @@ static int q40fb_probe(struct platform_device *dev)
>  	info->par = NULL;
>  	info->screen_base = (char *) q40fb_fix.smem_start;
>  
> +	if (!request_mem_region(q40fb_fix.smem_start, q40fb_fix.smem_len,
> +				"q40fb")) {
> +		dev_err(&dev->dev, "cannot reserve video memory at 0x%lx\n",
> +			q40fb_fix.smem_start);
> +	}
> +

Is this correct? It seems to me that in the case of an error, all you
are doing is simply logging the error and proceeding. Would this cause
the device to continue to try to use space that it was not able to
reserve? I do not have experience with this device or the driver, but
that does not seem correct to me.

>  	if (fb_alloc_cmap(&info->cmap, 256, 0) < 0) {
>  		framebuffer_release(info);
>  		return -ENOMEM;
> @@ -144,6 +150,7 @@ static int __init q40fb_init(void)
>  		if (ret)
>  			platform_driver_unregister(&q40fb_driver);
>  	}
> +
>  	return ret;
>  }
>  

