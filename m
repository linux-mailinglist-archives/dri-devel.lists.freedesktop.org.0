Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC5D825243
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 11:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9689310E044;
	Fri,  5 Jan 2024 10:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECBC10E044
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 10:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704451270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eo+Uvb6jarFiFIpH6KsY6T0G0WiuLhhCjZaknzkTf7c=;
 b=E54TB2dpS9jgAIrVyXooLOEFk75BtmsshsQ8b8s3zaPUhSMS+bxob5nTtv2VlO+ye0Ngyi
 rPMmXqbnA/4MRq99XXK5WU/X5IuGyK4HuhG+WchumNT/aPLPMlYu2qx+YylagYSh2aZ6AW
 QyZlNIpSCiA+5Y1dyPtJtGgizgMh+4Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-Hcb66IJXOGKV324pHDuvwA-1; Fri, 05 Jan 2024 05:41:09 -0500
X-MC-Unique: Hcb66IJXOGKV324pHDuvwA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40e34df6fdcso9382625e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 02:41:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704451267; x=1705056067;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Eo+Uvb6jarFiFIpH6KsY6T0G0WiuLhhCjZaknzkTf7c=;
 b=gmpi8Ls8Qb87wKB5ykNBerQbWv0s4lKlOjNWRv12qMim8bvs2XWDQDRiFPSySHrPWh
 XUcW+w8vvooCRURyB5exblhHCWeyuMuz0418w3IGgAhYzf+ZfuMp/eU9dKqcluw8jHvC
 f3ydkgtzRmEI9HFlwSmj6lp3w4htXBshEDpL8Yahdg1fAYeseaVHe5ZsinjXI9tCXFgL
 2hhAGAXeifTvuiqGsmKgwLrHYm7De0Lt5DHNYQmMXTXjqIq1QBG7gTFuC4qmkSOYOz7a
 WpCPxRzY8X06OsCJU4HMZZWZXAPAXM8DB2NNSnzmPW9bvp0dGM8dEiNrfCwiyQ4mXuvl
 TUOA==
X-Gm-Message-State: AOJu0YzkLcdK1IkvRMw29l/nrETueH15fnmcxoBa/CfvDVWWgvtYpQLp
 QHDTYcaIDApz40aJ8O9YanIZv6cotN6hieJ8vz0sY1+OKbbriAAWpvv8C4bEO6ON+7HknwefNXc
 4kcOY49D6D+Ujj8F7w+WV+nfNqwzaTvw4f314NLBjbv9V
X-Received: by 2002:a05:600c:5123:b0:40d:60ac:626d with SMTP id
 o35-20020a05600c512300b0040d60ac626dmr1016380wms.62.1704451267151; 
 Fri, 05 Jan 2024 02:41:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/G/D4tfuzPhENH8WJrNGf8h7QZC3DBZcNNxBHfYGX10eHs/CXvNazsnK1631qXaNVOJIvHQ==
X-Received: by 2002:a05:600c:5123:b0:40d:60ac:626d with SMTP id
 o35-20020a05600c512300b0040d60ac626dmr1016371wms.62.1704451266836; 
 Fri, 05 Jan 2024 02:41:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 l42-20020a05600c1d2a00b004030e8ff964sm1170042wms.34.2024.01.05.02.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jan 2024 02:41:06 -0800 (PST)
Message-ID: <d169ab1a-d0ee-46f4-8bd8-2f42040a2572@redhat.com>
Date: Fri, 5 Jan 2024 11:41:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Fix caching setup for remapped video memory
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch
References: <20240105082714.21881-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240105082714.21881-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 05/01/2024 09:25, Thomas Zimmermann wrote:
> I/O video memory for the framebuffer supports write-combine caching
> mode. Simplify the driver's code that sets up the caching mode.
> 
>   * Map video memory with ioremap_wc(), which automatically sets up
> the PAT entry with write-combine caching.
> 
>   * Remove the now obsolete call to devm_arch_io_reserve_memtype_wc().
> It is only required to mmap the video memory to user space, which the
> driver doesn't do.
> 
>   * According to the PAT documentation, arch_phys_wc_add() is best
> called after remapping I/O memory, so move it after ioremap.
> 

Thanks a lot for taking some time to look at the latency issue.
This looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn

