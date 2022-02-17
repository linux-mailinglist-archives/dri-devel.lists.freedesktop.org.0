Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 360504BA460
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 16:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0EB10E492;
	Thu, 17 Feb 2022 15:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1628510E492
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 15:29:47 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id d10so8115528eje.10
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 07:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SdNsn33s2vqrmQrJpjzrM9XwN56LeRJmp4LOd8dZoak=;
 b=pJzLECZFS8HAu/ThmLu9FQj6w/XVV4XVVP7YvND/CgvqTXm4hInd7wvi3fxO6g7xpr
 tsuC1drjCzzSg44Ibmg3jjQYJyuOhmPQIZX0mIGbs79SLIMXOR8eqRPYPFr6FlT0vcpc
 MN0G6gKuBAFe9mvEc6uUiRwol7N0WYkJT8o4BiaM0qbIod5sPtOhvs3T4cZ2hqhTAQiO
 aHXI9w0WGCOHhfAMZy/wRNsef5Tfa5yC5PtRrx9OdC9VHstzOgMIGx/HXn62mdHbR5Ix
 kpV6aliPf40QaM0Qn0chv+tOW6sCVdB0y0zEKzvz+NHzK5n+B3xl+8qYWP3OcdcJy2y2
 Kq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SdNsn33s2vqrmQrJpjzrM9XwN56LeRJmp4LOd8dZoak=;
 b=6lmsSREqq50n/5BnRxGPabVEsE2nK3XMtsaHgVS0I2uNXMi/sZpoASqGdNCac4fPBJ
 UKexR2l6wmnFy4vyv5Rsc55U58BL1T0G76JJjUEqPJ11Bny75xhxwdsmvlEfcy+9kks2
 GhyLqCJmwDiMmmTdbHn32azggxcJqiKx2BBdeCI2LjRnyV33MqeHuTEzeFKQt6r2z5s1
 2fTVT6CMka4vSOYzTj9O7hT+3BytcViLFNn0VUICBQWseF8c0a6cPu2NHHuhsZ+I/qw7
 RHWVSozPdPvGGsLhAxu91BiVDvBbwVw6Cwf5zDSQHrZcLg7cUS4wI7PW7JNRfV91sbG4
 wPhQ==
X-Gm-Message-State: AOAM532VSuLDErDdEKbypQ1C1LjywYTuO+0ko5ItacFCyH1Hi6pIB+W5
 2xzNiF5u7lemxcT1rl0Bq4M=
X-Google-Smtp-Source: ABdhPJzZoqfXTR8DJX7/ovMs2z7Mq6EmglzQJrdy+1mfwhhenI60YKJCUMhDS5dDRiRHNtrl1MTkuQ==
X-Received: by 2002:a17:906:1b12:b0:6cc:fd05:a553 with SMTP id
 o18-20020a1709061b1200b006ccfd05a553mr2708579ejg.445.1645111785419; 
 Thu, 17 Feb 2022 07:29:45 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
 by smtp.googlemail.com with ESMTPSA id g6sm1300780ejz.170.2022.02.17.07.29.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Feb 2022 07:29:45 -0800 (PST)
Subject: Re: [PATCH 3/3] drm: omapdrm: Do no allocate non-scanout GEMs through
 DMM/TILER
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, tomba@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <5b6d3e7f-c638-fdc7-5080-44d34abed610@ideasonboard.com>
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <a3ed3a2c-86ce-1c85-e8aa-c08b54ad1a43@gmail.com>
Date: Thu, 17 Feb 2022 17:29:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5b6d3e7f-c638-fdc7-5080-44d34abed610@ideasonboard.com>
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
Cc: tony@atomide.com, merlijn@wizzup.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.02.22 г. 14:46 ч., Tomi Valkeinen wrote:
> Hi,
> 
> On 19/01/2022 12:23, Ivaylo Dimitrov wrote:
>> On devices with DMM, all allocations are done through either DMM or 
>> TILER.
>> DMM/TILER being a limited resource means that such allocations will start
>> to fail before actual free memory is exhausted. What is even worse is 
>> that
>> with time DMM/TILER space gets fragmented to the point that even if we 
>> have
>> enough free DMM/TILER space and free memory, allocation fails because 
>> there
>> is no big enough free block in DMM/TILER space.
>>
>> Such failures can be easily observed with OMAP xorg DDX, for example -
>> starting few GUI applications (so buffers for their windows are 
>> allocated)
>> and then rotating landscape<->portrait while closing and opening new
>> windows soon results in allocation failures.
>>
>> Fix that by mapping buffers through DMM/TILER only when really needed,
>> like, for scanout buffers.
> 
> Doesn't this break users that get a buffer from omapdrm and expect it to 
> be contiguous?
> 

If you mean dumb buffer, then no, this does not break users as dumb 
buffers are allocated as scanout:

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/omapdrm/omap_gem.c#L603

If you mean omap_bo allocated buffers, then if users want 
linear(scanout) buffer, then they request it explicitly by passing 
OMAP_BO_SCANOUT.

Ivo
