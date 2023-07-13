Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D98751D42
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BED910E0D4;
	Thu, 13 Jul 2023 09:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FB810E0D4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689240726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A5GdB09iM4XZHi0BN8Yh2GDz37lhZWt/6hcGufYHSgY=;
 b=HL5TMhfFNAvkpBfoJipQhR57ShtD4/FxDSyq3B/wMK3InqH2DwmNIXPl7u1Ckhsl6OOGyI
 29urMi7HnLCuVym1hsouO5KY6bWm7ZI7YvpeKCzLp9R/EIGR4wOw4qgfEdcxWfAB09eTTC
 MaAY+t2SQjTcajaucdLG1+x6a1IGMqs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-UjG2ch58NyCOQY_qKIvsIQ-1; Thu, 13 Jul 2023 05:31:59 -0400
X-MC-Unique: UjG2ch58NyCOQY_qKIvsIQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3141c6f4173so369593f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 02:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689240718; x=1691832718;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A5GdB09iM4XZHi0BN8Yh2GDz37lhZWt/6hcGufYHSgY=;
 b=VjKIzx26YuEAvRDetlDf2f1tgCqV1iAO92opBzTse3gIbKukSsqrKcCijWTJMcVjZ6
 h8ePn41tdKOmQXJQyVRXXUVqnAwBmVtp3V6+tu5cI2Usb62grX5kpJU2aXdVgoSIIj9E
 JZxWgNdMoww/WtNwNhTI3wpeZ//JDefjK1IaybCuqPuE9/lX/ZHXZOwX92nqZ3qymbRY
 3cpdxeMAy8hLHH+6VpIFQrGi+MRrX40m7Hq+BKHgbuVMGWqyg5qQq+AfroxM1BRmR5FZ
 e1RPBZB+lavBrUNoYrsl429I7bAer5o3x4gwI5EZtiGN5awPJ9VnEp7Oeo91XQS7rdm7
 0eNw==
X-Gm-Message-State: ABy/qLbhuSEgY2rZED6ntVjtYJpEBprPxyYgX0utuhwSp27+fdP3Xc+S
 GEooJp4DlzIkZNu3Gr8OuPlyrcuV7XQhd7ACb080aCow8yQ60y4cEJZYZVrOR39zn3usfKK2skq
 NwrV8zMlIU7SnH0QoA55XdRo7Q+cb
X-Received: by 2002:a5d:4bcc:0:b0:314:11ab:11a0 with SMTP id
 l12-20020a5d4bcc000000b0031411ab11a0mr1005729wrt.34.1689240718048; 
 Thu, 13 Jul 2023 02:31:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGsJPAaVtLVjdTS0ks98Nj+s9cIui+59KYPaYt9hvqB91Mq2TVht6SMRWZeyHvwIP66R48Q/w==
X-Received: by 2002:a5d:4bcc:0:b0:314:11ab:11a0 with SMTP id
 l12-20020a5d4bcc000000b0031411ab11a0mr1005719wrt.34.1689240717798; 
 Thu, 13 Jul 2023 02:31:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 d17-20020adfe891000000b003143cdc5949sm7536657wrm.9.2023.07.13.02.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 02:31:57 -0700 (PDT)
Message-ID: <078393ae-9ef3-4531-cdd5-c271b7698d0b@redhat.com>
Date: Thu, 13 Jul 2023 11:31:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 2/2] drm/ast: report connection status on Display Port.
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jani.nikula@linux.intel.com,
 dianders@chromium.org
References: <20230713064037.315387-1-jfalempe@redhat.com>
 <20230713064037.315387-2-jfalempe@redhat.com>
 <f61ea042-a14c-9c8f-710d-0ba0820686fe@aspeedtech.com>
 <a6eb098a-8ac6-7240-dddc-ba645a1931fc@redhat.com>
 <2b1c2a6c-c912-d24f-b622-7a3f1cec89aa@aspeedtech.com>
 <7f1ccdf6-dadf-c25f-a972-f3c8add488f9@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <7f1ccdf6-dadf-c25f-a972-f3c8add488f9@suse.de>
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

On 13/07/2023 11:12, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.07.23 um 11:05 schrieb Jammy Huang:
> [...]
>>>
>>>
>>> For the BMC connector patch, you know if there is a register setting 
>>> I can check to see if a BMC is present or not ?
>>
>> I think you can use VGA CRD0[7] whose definition is as below:
>>
>> DRAM Initial Selection (see note 1)
>> 0: VBIOS Initial the DRAM
>> 1: SOC Firmware Initial the DRAM
>>
>> If CRD0[7] is 1, there is BMC.
> 
> Thank you. That seems very helpful.

Thank a lot, I will run some tests, and add this check in my v6.

-- 

Jocelyn

> 
> Best regards
> Thomas
> 
>>
>>>
>>> Best regards,
>>>
> 

