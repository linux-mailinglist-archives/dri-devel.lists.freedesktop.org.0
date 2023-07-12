Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91285750C61
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 17:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514C210E573;
	Wed, 12 Jul 2023 15:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC9B10E573
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 15:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689175513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b6/RKARnhF3eInevbXncvRqJ4bsYe72PPagTopes7dE=;
 b=bNbQFZwXYUnJ6YhaLmokp6pEuTMbo50yaJr124Uwl4aTZmQOpZ5FueuZ+kD1SeHYDXX1+6
 3w9q2JcBeAtWIYHqWxFJFCNWfiBW47qSywXYLtwrKF+Mn+dcnnRqR0hilOBhmAT3QfahSZ
 EwZyHT9cqzW8z80FhxHNSxctJeLcMIw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-ZIy6AHv1P6uvoY2_G5WWRw-1; Wed, 12 Jul 2023 11:25:12 -0400
X-MC-Unique: ZIy6AHv1P6uvoY2_G5WWRw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fbdf341934so50247025e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 08:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689175511; x=1691767511;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b6/RKARnhF3eInevbXncvRqJ4bsYe72PPagTopes7dE=;
 b=fApzilmO3BtcVdBYDZQbmGGqZcCBth58NensvqEIG60eVeqK25XMrNlRPlr44jBGXH
 UAKFnNtCqZOlQnjpui1hktfKjXMo6WU/Z3TtODzpODZap7ftgcVOL4Kxm5FqNEgsr2eT
 ++ETUmB+y4kR3WFZJhnDC9QBJUTOMYo/5/8mZKDXkRJS8zzM33fLz7kmqIp62Nxo5p10
 xugYtkTFKpq3jpB/Fc8wfGy2rFbyfRTzZLqvyw9K0wyChyD0WIhs1luPkzZeoNLbaNwK
 ltcYrGfavHYQ4Mz99kX+UJLHHt2ZrXRu2RlGJUvXvu5fg7aFF6rktaslFUhvxG8yyY7F
 B7sQ==
X-Gm-Message-State: ABy/qLaD3LWpkGvXYbTpmsoSk+Qc0ggBPoHOzuvaQ9IYNdrQF1FkywSz
 tlZHHqEfgffaJMdZIjK6Bp0j9lZ8y9CinyCQLavRjhgPLWT7sJTehP/Vvzu/yfEzescx8pbciMI
 NmaxXQzyoupVnXUJyI4hbHHUSrSgM
X-Received: by 2002:a05:600c:2043:b0:3fc:25:ced6 with SMTP id
 p3-20020a05600c204300b003fc0025ced6mr19931753wmg.13.1689175510879; 
 Wed, 12 Jul 2023 08:25:10 -0700 (PDT)
X-Google-Smtp-Source: APBJJlESfWfdHKarqG8dRoM25rgAULNENM63xUR0SfCGDZ23g18nh+ApsjUB3DVs7LCjT/UirLMpCA==
X-Received: by 2002:a05:600c:2043:b0:3fc:25:ced6 with SMTP id
 p3-20020a05600c204300b003fc0025ced6mr19931733wmg.13.1689175510493; 
 Wed, 12 Jul 2023 08:25:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c280400b003fc07e17d4esm12042936wmb.2.2023.07.12.08.25.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 08:25:10 -0700 (PDT)
Message-ID: <b56afc8a-5fda-3227-3ac0-5e7b7773976b@redhat.com>
Date: Wed, 12 Jul 2023 17:25:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <878rbv20dp.fsf@intel.com> <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
 <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>
 <43d12606-9c81-99f8-f13c-14338fcd7a28@suse.de>
 <f4b4ab09-5f03-af3c-0e7f-44a248678be8@redhat.com>
 <23d80964-d2d0-b688-e3cd-bf25a8135e5e@redhat.com>
 <81c57344-289d-fe41-8518-503249ea8d64@suse.de>
 <3fc768f8-9461-c4b0-b9af-555c52294c94@redhat.com>
 <2fb391e2-9f68-26f0-e005-a7f0f4324adc@loongson.cn>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <2fb391e2-9f68-26f0-e005-a7f0f4324adc@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 12/07/2023 17:05, Sui Jingfeng wrote:
> Hi,
> 
> 
> I'm here join to the discussion. Because I know a little about aspeed BMC.
> 
> 
> On 2023/7/10 16:07, Jocelyn Falempe wrote:
>> On 07/07/2023 09:30, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 06.07.23 um 18:37 schrieb Jocelyn Falempe:
>>> [...]
>>>>>>
>>>>>> You could out-comment the VGA code in the ast driver for testing.
>>>>>
>>>>> Oh, Thanks for the idea, I will try that.
>>>>>
>>>>
>>>> The result is that I get a black screen on the remote BMC. So maybe 
>>>> adding a remote/bmc connector will solve that.
>>>
>>> Could work. That would be a connector and encoder of type 'virtual'?
>>>
>>> Not all ast devices have a BMC. Do you know how to detect its presence?
>>
>> Hum, I though all ast devices have a BMC, 
> 
> No, Thomas is right, not all ast devices have a BMC.
> 
> I have two discrete AST BMC cards, see [1] for reference.
> 
> I generally using the ast2400 BMC cards to testing patches and study 
> drm/ast driver.
> 
> It seems that this two cards are pure 2D display card, because they 
> don't have a net interface(can not plug-in the net cable).
> 
> 
> [1] 
> https://github.com/loongson-gfx/loongson_boards/blob/main/ast_bmc_cards/ast1400_and_ast2400.jpg

Thanks for this picture, I didn't know about this discrete graphic 
cards, with PCIe connector.

> 
> 
>> and I don't see a way to detect that BMC is active or present.
> 
> I think we better find one, then if the BMC is active (present).
> 
> we could create a virtual encoder and connector safely.
> 
> 
>> (It would be even better to know the browser's size, and automatically 
>> resize, like when using a VM. But I'm not sure the hardware/firmware 
>> is able to do this).
>>
> 
> I think it is not difficult, it just that need the firmware of your 
> board to set a value to a register,
> 
> (a scratch register) or something like that.
> 
> But this really need you have the firmware (source code) to support this.

Yes, that's the difficult part.
> 
> Or you are luckily, if there somebody already done this for you.
> 
>> On the other hand, are there any drawback to present a BMC connector 
>> even when the hardware doesn't have it ?
> 
> If not properly setting up, I think you will create two encoder and two 
> connector in the system.

Yes, but I think it won't have any visible effect for the end-user.

-- 

Jocelyn

> 
>>>
>>> Best regards
>>> Thomas
>>>
>>>>
>>>>
>>>
>>
>> Best regards,
>>
> 

