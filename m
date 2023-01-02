Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5DB65B6DA
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 20:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7927C10E381;
	Mon,  2 Jan 2023 19:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C44A10E381
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 19:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672686494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F4ofZIv0IxIEQU2OkhdFQLomYdGk3PsuGMeKiK+hXoA=;
 b=JcXPnizjHfw08BblXmHGHVO2kQMyFN67Rs6QjmFM+h8OaVx4/QbmP0h1Wf9u6qM0A+LUN3
 2lAO/0YUDPYb0eJfbq+/ULonryTAdOp82QogUrUasiCNF5Jy6eVfAmTvU7A/Lw+MEouL1v
 eSxHmw/91tlsdm8uweIlomCcr3oPsHc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-231-qZwlAzeiP9mHK8RS9pyDNQ-1; Mon, 02 Jan 2023 14:08:13 -0500
X-MC-Unique: qZwlAzeiP9mHK8RS9pyDNQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi18-20020a05600c3d9200b003d991844dbcso9381454wmb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 11:08:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F4ofZIv0IxIEQU2OkhdFQLomYdGk3PsuGMeKiK+hXoA=;
 b=HooiJBTB+SdwKLXtoPCuS/66N0Fth2i8p5pKPatt05avuGKuf/O+kwe3z28YHvLDAA
 tOKrlzHxoDTEcbOhamIcnubZ0aXrBKxlM9o0rdbbt4fPUimDAc8koepn3rYdWTn+55yz
 Yjjc2ylN9kgOuWomAJM5IMHUrHlwz4B+P7aRCF35eM/QOK0sqrv8hZPCMuccdaB3nR3L
 x34LeGpWWHPGIelPbOmPnkeAUemPrwcPIbkgtQJiZRgYby7I7Qc2lMjDzKvgF3E1XsAp
 +1xi/VCqxyhH5brihjRsvs92COvTadCqyPKz1rBbEi8MONby8fIG390WpwwTtmtU8h2m
 plyA==
X-Gm-Message-State: AFqh2ko17YEr70p8NS2ygqhmfaM4gkw9Cenrx0cqAaQh5xd3yR1QE4RU
 SkO/k0kQ2odOfSL0r3dEG9Va2xnLRgGHLccsU+2uodhNaCcWahwysZ7b1CNZ9nzU3XmsPIJcPEn
 xbjahiQPGN/8oN3oaSSy1ENbDfvGa
X-Received: by 2002:a05:600c:5022:b0:3d3:5893:f4f8 with SMTP id
 n34-20020a05600c502200b003d35893f4f8mr29107451wmr.23.1672686492332; 
 Mon, 02 Jan 2023 11:08:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtW4sPNTyvBtLeWnkh+MknYOaDLNrSPJzqLeJJHGNdlGV/JcS7IV5Qbb8k460QkFgbShcr1rw==
X-Received: by 2002:a05:600c:5022:b0:3d3:5893:f4f8 with SMTP id
 n34-20020a05600c502200b003d35893f4f8mr29107446wmr.23.1672686492190; 
 Mon, 02 Jan 2023 11:08:12 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b003d9780466b0sm34301349wmq.31.2023.01.02.11.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 11:08:11 -0800 (PST)
Message-ID: <c96f9d0b-2838-fc8a-cf2b-47c5be463ff1@redhat.com>
Date: Mon, 2 Jan 2023 20:08:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 14/14] drm/panel-xinpeng-xpp055c272: Drop custom DSI write
 macro
To: Sam Ravnborg <sam@ravnborg.org>
References: <20221228014757.3170486-1-javierm@redhat.com>
 <20221228014757.3170486-15-javierm@redhat.com>
 <Y7MoPm/7wLxSgiHF@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Y7MoPm/7wLxSgiHF@ravnborg.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/2/23 19:53, Sam Ravnborg wrote:

[...]

>>  }
>>  
>> -#define dsi_generic_write_seq(dsi, cmd, seq...) do {			\
>> -		static const u8 b[] = { cmd, seq };			\
>> -		int ret;						\
>> -		ret = mipi_dsi_dcs_write_buffer(dsi, b, ARRAY_SIZE(b));	\
> Notice that this is *dcs*
>

I missed that! Thanks a lot for catching this inconsistency in the naming.

[...]

>> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
>> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETMIPI,
>> +	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
> This is wrong - here you should use mipi_dsi_dcs_write_seq()
> Likewise for the rest of the file.
>

Agreed.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

