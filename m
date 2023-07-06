Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C38174A24B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 18:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E995D10E411;
	Thu,  6 Jul 2023 16:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AC410E411
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 16:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688661474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ByzyMMxMVwI0Z+qN+md3xE+PkjSfuCcKjMjNAInxi8=;
 b=Qh8kjvXwJvaCQDqVWs87b5huS1ZRVoPy9sDTHFYSbG1GdfpwfVVrWqau5f/MBKZ0Y9J2Z4
 XL40VYfV2Ng3VAl5P2Q2uGeYS18c07uT/IXKZMhJWB5jff9syqs/UdaWTpim0WRms76q3L
 vvfGaq/izz3YaXwAqJntXfyjdcX/Y00=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-gfFDD-rfPlqYvqWBfhxByg-1; Thu, 06 Jul 2023 12:37:50 -0400
X-MC-Unique: gfFDD-rfPlqYvqWBfhxByg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f42bcef2acso5301415e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 09:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688661467; x=1691253467;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2ByzyMMxMVwI0Z+qN+md3xE+PkjSfuCcKjMjNAInxi8=;
 b=CtpC6Ex9BG892qKkQ2cQ+oAn++9Uwsvce6JMFBm7Q8jRRPrgHVvFN/JFwM63t5z9CK
 5mVjzfDJ207PYMACJH/rtGjo4Vf2OABHXse8Hu4n3PJsvzC0iVlmv9nqsQcyr0p5zOAb
 VV6FFIfTV0bQXlfg3QZBPS+0scS7MwamCqmP/iR86nyw9j8+Ter0KXzKKH+z40ltMbWd
 BtfAhPEQaNuyOoYngNMMqJZnjUAzW1PodCyTVr3n9AxaYR3i5fh94cIEQ77G4z2gmKVJ
 RUR/TzyS9sNHhcnB/nJ8562Od7NM9BiiPTfCA35ZobFM9awq0JkfDH0n82ZFCvako8vN
 Ppxg==
X-Gm-Message-State: ABy/qLYzkYscq85ijwvfnMQXydUNHGCyKAXIFCLGjgcRV0yI5qO2wGfk
 RdCMG+v2odMebcrH9hvA44czWlJeU8n4wSW/TRTITrzITYJjN96G7DV+8xKwL3e8Y/HDgAZ+TOr
 lo3iRcALEK+3SwIAaV1Mk1cCLcneg
X-Received: by 2002:a1c:7206:0:b0:3fb:8284:35b0 with SMTP id
 n6-20020a1c7206000000b003fb828435b0mr1782652wmc.30.1688661467319; 
 Thu, 06 Jul 2023 09:37:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFHQRuZWtr4/5IxG9Cft7QEc4tPMCbniUD0AMFXrTIWULH3yz6XQWyRD5RyQWWJtSg2Xapv0A==
X-Received: by 2002:a1c:7206:0:b0:3fb:8284:35b0 with SMTP id
 n6-20020a1c7206000000b003fb828435b0mr1782638wmc.30.1688661467028; 
 Thu, 06 Jul 2023 09:37:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:57d9:6996:9558:341b?
 ([2a01:e0a:d5:a000:57d9:6996:9558:341b])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a5d6187000000b00301a351a8d6sm2251977wru.84.2023.07.06.09.37.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 09:37:46 -0700 (PDT)
Message-ID: <23d80964-d2d0-b688-e3cd-bf25a8135e5e@redhat.com>
Date: Thu, 6 Jul 2023 18:37:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <878rbv20dp.fsf@intel.com> <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
 <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>
 <43d12606-9c81-99f8-f13c-14338fcd7a28@suse.de>
 <f4b4ab09-5f03-af3c-0e7f-44a248678be8@redhat.com>
In-Reply-To: <f4b4ab09-5f03-af3c-0e7f-44a248678be8@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/07/2023 13:31, Jocelyn Falempe wrote:
> On 06/07/2023 12:26, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 06.07.23 um 11:16 schrieb Jocelyn Falempe:
>>> On 04/07/2023 18:45, Jocelyn Falempe wrote:
>>>> On 04/07/2023 16:54, Jani Nikula wrote:
>>>>> On Fri, 23 Jun 2023, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>>>> Since commit fae7d186403e ("drm/probe-helper: Default to 640x480 
>>>>>> if no
>>>>>>   EDID on DP")
>>>>>> The default resolution is now 640x480 when no monitor is connected.
>>>>>> But Aspeed graphics is mostly used in servers, where no monitor
>>>>>> is attached. This also affects the "remote" resolution to 640x480, 
>>>>>> which is
>>>>>> inconvenient, and breaks the anaconda installer.
>>>>>> So when no EDID is present, set 1024x768 as preferred resolution.
>>>>>
>>>>> This conflates "monitor connected" and "EDID present", which are not
>>>>> necessarily the same thing.
>>>>>
>>>>> The fallback in drm_helper_probe_single_connector_modes() is for no
>>>>> modes, but connector status is connected or unknown.
>>>>
>>>> When debugging the issue, I found it surprising that the status is 
>>>> "connected" when nothing is plugged in the DP port.
>>>>>
>>>>> You could add a connector ->detect callback that returns disconnected
>>>>> when there's no display, and the problem should go away. If there's no
>>>>> ->detect callback, it'll default to connected.
>>>>
>>>> ok, I'll try that. I don't know how the hardware detect something is 
>>>> connected, but looking at the dp code, maybe checking 
>>>> "AST_IO_CRTC_PORT,0xDC, ASTDP_LINK_SUCCESS" would be good enough.
>>>
>>> I've tested this approach, and it works. But on the server I'm 
>>> testing, there are VGA and DP output. I think on a server that has 
>>> only one DP output, if no monitor is connected, then no modes will be 
>>> reported to userspace, and the remote BMC may not work ?
>>
>> You could out-comment the VGA code in the ast driver for testing.
> 
> Oh, Thanks for the idea, I will try that.
> 

The result is that I get a black screen on the remote BMC. So maybe 
adding a remote/bmc connector will solve that.


-- 

Jocelyn

