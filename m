Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2237523E2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 15:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F0B10E6DB;
	Thu, 13 Jul 2023 13:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF02210E6DB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 13:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689255256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wTBCMaQ4CuK5r1ndgLzmwVEIa7sBx3JNSh/wKvM/t4c=;
 b=OCOmU6SGBShkT7pOJvwyFRKMF8KkftblPLohJwGCA7LvGUARIjpLI3aunNa5FjjBY8lkyu
 8YmxgNp/zNEfHCbQJGp7u1v6OxVXFgOl8xH49t3DkPoKqzcyXu5ozTRWf7InQkfQ2hXY6R
 oOSkvRcn5vNXi8V5xV3J5/RxMXHJbVQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-Ru48_DHZPhGGqVGWP6pufA-1; Thu, 13 Jul 2023 09:34:15 -0400
X-MC-Unique: Ru48_DHZPhGGqVGWP6pufA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3141c6f4173so492263f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 06:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689255254; x=1691847254;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wTBCMaQ4CuK5r1ndgLzmwVEIa7sBx3JNSh/wKvM/t4c=;
 b=dnjHlXa6yfX7NUueePEjBW7RjnUh6eX13UlSOP2Rg6UQHWyRblgJpftC6ORxfsqyk6
 ytvov7fxvsimV118qphHm3LImA02xbWycWmmLkp6IuxuMFzz3eojt0O560/xOyyiraUf
 B7/DicmChMKJXLCAEUFaQcFmYMH35icN/+fCyRZ5b2gN5iHIdcAc0JEdV7B0EEhG9/ia
 fz6c/4sKgtUC1sMlJWeis1fBsPjmIdRIUzop2Ee3TVDMgE/5F/PkzeQHVKBSpNnoNITH
 XB1cqNy69Q+tTkQK7INNJ6zp0qSd0L+MKoYAV9rFevJPLu7CzYWuklqbKfQ7k5S0geza
 WarQ==
X-Gm-Message-State: ABy/qLaK/D4lRsBrRyduUZLWlKShv0jgU0FF65GMOUqyKDPxJ8+DWt81
 mnPvqiqIC9O6cUkdkOEt7tj49ZXuAV6vuIwc1Z6vrzddqAin4Bmt7AN9aMHN7DyBDLEOvZ32p8H
 +i/M73/LvqHo7SkUZpXKk7EWCtMbF
X-Received: by 2002:a5d:58c8:0:b0:313:ee5b:d4bc with SMTP id
 o8-20020a5d58c8000000b00313ee5bd4bcmr1668629wrf.5.1689255254356; 
 Thu, 13 Jul 2023 06:34:14 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG9bsjxhIWaple/Oilgg9WvhwiDiAYxjAz66phK6XvcLy8oPUZm+D0naYTEsUWpSUKmkPaSvQ==
X-Received: by 2002:a5d:58c8:0:b0:313:ee5b:d4bc with SMTP id
 o8-20020a5d58c8000000b00313ee5bd4bcmr1668614wrf.5.1689255254055; 
 Thu, 13 Jul 2023 06:34:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a5d4b10000000b003143be36d99sm8035444wrq.58.2023.07.13.06.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 06:34:13 -0700 (PDT)
Message-ID: <c0c7711a-eff2-e9d7-9b0c-ea562acb65d3@redhat.com>
Date: Thu, 13 Jul 2023 15:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 2/2] drm/ast: report connection status on Display Port.
From: Jocelyn Falempe <jfalempe@redhat.com>
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
 <078393ae-9ef3-4531-cdd5-c271b7698d0b@redhat.com>
In-Reply-To: <078393ae-9ef3-4531-cdd5-c271b7698d0b@redhat.com>
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

On 13/07/2023 11:31, Jocelyn Falempe wrote:
> On 13/07/2023 11:12, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 13.07.23 um 11:05 schrieb Jammy Huang:
>> [...]
>>>>
>>>>
>>>> For the BMC connector patch, you know if there is a register setting 
>>>> I can check to see if a BMC is present or not ?
>>>
>>> I think you can use VGA CRD0[7] whose definition is as below:
>>>
>>> DRAM Initial Selection (see note 1)
>>> 0: VBIOS Initial the DRAM
>>> 1: SOC Firmware Initial the DRAM
>>>
>>> If CRD0[7] is 1, there is BMC.
>>
>> Thank you. That seems very helpful.
> 
> Thank a lot, I will run some tests, and add this check in my v6.
> 

Unfortunately, on my testing server (which has BMC, and I'm using it) 
the bit(7) of CRD0 is set to 0.

Here is the complete register read:
AST read[d0] 0x41

So I will keep the always enabled BMC virtual connector.

-- 

Jocelyn

