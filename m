Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F3C6902EE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 10:11:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF8210E969;
	Thu,  9 Feb 2023 09:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB7810E969
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 09:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675933881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qfPjLudJxDgFfzgfTl3EDZTsNvVb8/CVcfYCLJC/TTU=;
 b=R+ld3ReZUi4HJvdjrJHoGbkt1yrVGCi1B6bHf3Os2JEOo4+bRR7xxfvdGutdp65WpkGUnG
 0vwdvDlS8nubQ4C3xiK7U0QlfQMWFlxl1gr08PvidjWLyAESblDuDZXNwfdgLzqA1olutP
 gxPiIrzSy5bIxuYxOUc0vAJzg62AB/Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-351-NuoI_zVcPa2o_pheFQnEpg-1; Thu, 09 Feb 2023 04:11:20 -0500
X-MC-Unique: NuoI_zVcPa2o_pheFQnEpg-1
Received: by mail-wm1-f70.google.com with SMTP id
 j20-20020a05600c1c1400b003dc5dd44c0cso772947wms.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 01:11:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qfPjLudJxDgFfzgfTl3EDZTsNvVb8/CVcfYCLJC/TTU=;
 b=iZo7kKYEgzWql+gPH0Ums45pmcvMYjwYMO+gLcYtShPSGLGHWPHCi5Q7pLmTrjmPN6
 FN2SoSMaDt9lrvV+WRyaDYtV7Wv5V5MkL73/Lt2Lit7qTU9XMtI16YQnumCs6TChn6Gw
 sRks5EpGe5TNDUrwyUfSoOa1cXo2IkZAu+XNpbiEe7gHqalZOQJmNqRmAxMoL1A3Kczz
 7W2fPncBjHzRp6fGfJuTTnjzIIHBuU6eHHMaaGKwQJHq6lzziaZBjiz3iWMreUHhRnS4
 MWMkxNz/+ofcP4DQdvRX20vl0lQQ/hdVTRiud45pmU///uCgQWMie5mBEnxbFooOQo0X
 vNNw==
X-Gm-Message-State: AO0yUKXpYmFI+83/yNSK0jzr0yIJmjoYbSoDmQOo8GiHhOjyjW6GwdoI
 R1oNYIK9xWrccBmP0I+pC2zTFDLF6gWX9elM372T27yQLuQvrZcYNHdkKzXMmZQOrjp8geRw1we
 OIWNhx9yrLmn4Zn+ZG49dKLR/wxOvV3tK9A==
X-Received: by 2002:a5d:6986:0:b0:2c4:61a:4666 with SMTP id
 g6-20020a5d6986000000b002c4061a4666mr4583166wru.15.1675933879154; 
 Thu, 09 Feb 2023 01:11:19 -0800 (PST)
X-Google-Smtp-Source: AK7set9nzqPKLjpk9qdccGuph0Z9GXzvYt8XlOKI+1Oi/1Xl9J/WHOIfTAfk9bk355c7CMkLklzzLA==
X-Received: by 2002:a5d:6986:0:b0:2c4:61a:4666 with SMTP id
 g6-20020a5d6986000000b002c4061a4666mr4583154wru.15.1675933878995; 
 Thu, 09 Feb 2023 01:11:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a05600c475300b003dc433355aasm1396212wmo.18.2023.02.09.01.11.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 01:11:18 -0800 (PST)
Message-ID: <d4cc2abb-260b-225e-8703-9c210379d517@redhat.com>
Date: Thu, 9 Feb 2023 10:11:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/ast: Fix start address computation
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com,
 jammy_huang@aspeedtech.com
References: <20230207105317.224277-1-jfalempe@redhat.com>
 <125d895f-7837-1ded-f121-ef0c5879bc2e@suse.de>
 <5d79840c-b0d8-ead5-6fb9-9d13832c3c80@redhat.com>
In-Reply-To: <5d79840c-b0d8-ead5-6fb9-9d13832c3c80@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/02/2023 12:36, Jocelyn Falempe wrote:
> On 07/02/2023 12:17, Thomas Zimmermann wrote:
>> Hi
>>
> 
> I was wondering if this start address is not an offset in the GPU 
> memory, and in this case the primary plane offset should always be 0 ?

I think it's the case, so I will send a v2 shortly.

> 
> Best regards,
> 
>>
>> Best regards
>> Thomas
>>
>> [1] 
>> https://elixir.bootlin.com/linux/v6.2-rc7/source/drivers/gpu/drm/ast/ast_mm.c#L96
>>
>>>       unsigned long cursor_size = roundup(AST_HWC_SIZE + 
>>> AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
>>>       unsigned long size = ast->vram_fb_available - cursor_size;
>>>       int ret;
>>
> 

