Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC69B613454
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 12:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C9B10E066;
	Mon, 31 Oct 2022 11:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FFE10E066
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 11:14:35 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id z14so15446049wrn.7
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 04:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m9bbGo0bvK6KW8lmRDeE10oRwrE5N7HeEJNDkRQyO8A=;
 b=WlQA7cWjwEb+Xdd5jtfQ912UBKuCDuH5SlcDmbcO9sHxyPWBlv0pr7XseAS1DU3+QI
 jao6daZ/G2L+o2hFwCQBVmiA3632G+JqYnBpyCMez9moZfFDeTDA9sQSp5qTOTD+Mh/Q
 4JrtfdAhhByjPfbXS35SiQ7SW09/6H9ulxDXBgj3ddtz7A//4lyxjvn2FBX1LxwigPOE
 apbmT+pkDD6Xl+xOVsRUBqgnBxaMGDNBADOnQU7SnL0+OwEE+GCDGKh8aHhoL+fakbeQ
 SDXv2qJlrCby362um47ZwlK4kX6actxGQ0ksi+rFDqvtYIODILVEiIqnUmJFesGTOReo
 M7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m9bbGo0bvK6KW8lmRDeE10oRwrE5N7HeEJNDkRQyO8A=;
 b=y5qTBw67fi0bDgccCt4uCTeRMTuWFveAszj2gi8kxWbNswcMKBZVGY3WGLpWYtm4q4
 BqAl0RLo74ZjpmqRXpEwJD/75xT0ytxP1EmoloboCeY4hyhMeCCw1qGvewYjmoVG5nfE
 fJWmFhkm6bwR+e9SU2/Fs1mfhGYA37tpEqMI0xM9E/VfGdbGUhfGPzWLY2nWzqgsKRUY
 tzma1WXXwkHiL8dfCNSW1a8gOsR748obu1SyqdROfteU8OlblVttC4i4STyBcsNaOk6l
 NtdDcknPkdcqUcZ9php0H0KG0fks2aWd+0R+5D/IzjNOyc54TSnoMpoXMcsln7qSIWUW
 lHXQ==
X-Gm-Message-State: ACrzQf32YsCxncXfjN90GbTzvqN5PBL0gTUm2lrN4le74+uhD15LYszK
 pwXaxdk0/in2Ei9r/3hWhQs=
X-Google-Smtp-Source: AMsMyM6e2wBSZmbNMzzhU5zkyKz9QkfZfTr0UqJoQ8AgVgL5qpBKKqLziz5rnQeg3xP+GQf7IWZeLw==
X-Received: by 2002:adf:c582:0:b0:22b:3c72:6b81 with SMTP id
 m2-20020adfc582000000b0022b3c726b81mr7784585wrg.320.1667214874081; 
 Mon, 31 Oct 2022 04:14:34 -0700 (PDT)
Received: from [192.168.1.10] ([46.249.74.23])
 by smtp.googlemail.com with ESMTPSA id
 o18-20020a05600c511200b003c6c3fb3cf6sm7976775wms.18.2022.10.31.04.14.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 31 Oct 2022 04:14:33 -0700 (PDT)
Subject: Re: [PATCH 3/3] drm: omapdrm: Do no allocate non-scanout GEMs through
 DMM/TILER
To: Tony Lindgren <tony@atomide.com>, "H. Nikolaus Schaller"
 <hns@goldelico.com>
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <4B3F8E50-3472-4AED-9A77-3E265DF8C928@goldelico.com>
 <0000784a-ae89-1081-0ec7-fc77d3381545@gmail.com>
 <Y1+f0zG50ZR4aWGX@atomide.com>
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <108e96f7-d86a-2c1e-1a6a-c0ed02667719@gmail.com>
Date: Mon, 31 Oct 2022 13:14:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <Y1+f0zG50ZR4aWGX@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: tomba@kernel.org, airlied@linux.ie, merlijn@wizzup.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 31.10.22 г. 12:13 ч., Tony Lindgren wrote:
> * Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com> [221031 06:55]:
>> On 31.10.22 г. 0:08 ч., H. Nikolaus Schaller wrote:
>>> [   39.419846] WARNING: CPU: 0 PID: 3673 at drivers/bus/omap_l3_noc.c:139 l3_interrupt_handler+0x23c/0x330
>>> [   39.429914] 44000000.l3-noc:L3 Custom Error: MASTER MPU TARGET GPMC (Idle): Data Access in Supervisor mode during Functional access
>>> ...
>>>
>>
>> I have no idea what that error is supposed to mean. @Tony?
> 
> The error above is GPMC related. It means GPMC is not properly clocked or powered
> while trying to access it's IO range.
> 
> Maybe DSS is somehow trying to access GPMC address space registers with DMA? The
> GPMC address space starts at 0. Maybe the DSS DMA address is 0 somwhere?

I think I have an idea:

omap_framebuffer_pin() calls omap_gem_pin() without verifying the 
returned plane->dma_addr. To me it seems the assumption is that plane 
BOs are scanout/linear, which most-probably isn't the case. I was unable 
to find who provides those BOs though (they are passed as handles to 
omap_framebuffer_create(), most-probably set by the userspace)


> 
> Regards,
> 
> Tony
> 
