Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CDD7498FE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 12:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEFB10E4C3;
	Thu,  6 Jul 2023 10:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6001410E4C3
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 10:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688638024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oEtFgP4jV8QdPMyzqT8C2mnvY6qTublxY+UCyt9JYXE=;
 b=SJ1Irx7ctX5IP99BokPO0DW8Ty34U7uMcnF1NeQrrivBOI37zgAMp57qUX2CpuD1f2sQwC
 nlJ9jad8PgNQXVJpDzG0Ls9AWiBV/EXwqsRPK1ixYGF9UlDOF/uzm7aI5tStD8gBEwIsgn
 sKG2HaF7J2kXRuADRX6rzW31jnb73T0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-QJXZJsKPN-mcIZqE_Y4cEw-1; Thu, 06 Jul 2023 06:07:03 -0400
X-MC-Unique: QJXZJsKPN-mcIZqE_Y4cEw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f5fa06debcso3746375e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 03:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688638022; x=1691230022;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oEtFgP4jV8QdPMyzqT8C2mnvY6qTublxY+UCyt9JYXE=;
 b=fZwiecWMfB1cAEoh9NOsN4rlKCCGsxeivxmJSJT2lijQuoHkoBWu7rlWv2DB8D6XsI
 hmLnAawuR9P51rWxTOvYr0tcKGnJKn1bHc30ZjS5Ms5BwuVnRZfQPe/1hkCIXAAwv/jh
 WM5indfGW70s/F5jbSX1U2l5Aj66EIAtxCKuHFbhfaBNrf1fTUxo5Z6SAJDfsqS9Rmax
 GsQZgR6BQZj7wC1ThWSvqfo5pBEvJnJODCBMFuLPfOuEeXVAAHLtu2UMO5WmdBmZkEZC
 v1oNWVsz60rAJG8UA1/hxX+PSlTtLXrAzzM9NqkjsyD2HSbEXU9aClDMRLcjiKGX0NwV
 DMKQ==
X-Gm-Message-State: ABy/qLb7JLpS/UKJOruUHPfq4ebHDOnkj2FwW68GpiSIEsxocKARvAsK
 iPxwzrH+x9Y6ID7MKi17Z+3JXXIDSCyzOQDtgqX+GQ2pRbixowVtSQHFOwljDFQRVRc+5YLIpto
 vKFSRp3zXe+E4KxYOUEMfPLAWa7G/ZmxIdL8L
X-Received: by 2002:a1c:7417:0:b0:3fb:e573:4172 with SMTP id
 p23-20020a1c7417000000b003fbe5734172mr1078766wmc.31.1688638021936; 
 Thu, 06 Jul 2023 03:07:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEfpe2QRHDV2UBIWJ6Gfx3RlqibOgmBP3DTEhvgT5ej3+u/7NhtYS7ubKRWNbwoTBzs9s10kw==
X-Received: by 2002:a1c:7417:0:b0:3fb:e573:4172 with SMTP id
 p23-20020a1c7417000000b003fbe5734172mr1078756wmc.31.1688638021560; 
 Thu, 06 Jul 2023 03:07:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:57d9:6996:9558:341b?
 ([2a01:e0a:d5:a000:57d9:6996:9558:341b])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a7bcd8a000000b003fb9ebb6b88sm4641193wmj.39.2023.07.06.03.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 03:07:01 -0700 (PDT)
Message-ID: <fdb25b67-92fa-d010-39b4-a14ab3fa4edc@redhat.com>
Date: Thu, 6 Jul 2023 12:07:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
To: Jani Nikula <jani.nikula@linux.intel.com>, tzimmermann@suse.de,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <878rbv20dp.fsf@intel.com> <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
 <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com> <87h6qhxu4h.fsf@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87h6qhxu4h.fsf@intel.com>
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

On 06/07/2023 11:32, Jani Nikula wrote:
> On Thu, 06 Jul 2023, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> On 04/07/2023 18:45, Jocelyn Falempe wrote:
>>> On 04/07/2023 16:54, Jani Nikula wrote:
>>>> On Fri, 23 Jun 2023, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>>> Since commit fae7d186403e ("drm/probe-helper: Default to 640x480 if no
>>>>>    EDID on DP")
>>>>> The default resolution is now 640x480 when no monitor is connected.
>>>>> But Aspeed graphics is mostly used in servers, where no monitor
>>>>> is attached. This also affects the "remote" resolution to 640x480,
>>>>> which is
>>>>> inconvenient, and breaks the anaconda installer.
>>>>> So when no EDID is present, set 1024x768 as preferred resolution.
>>>>
>>>> This conflates "monitor connected" and "EDID present", which are not
>>>> necessarily the same thing.
>>>>
>>>> The fallback in drm_helper_probe_single_connector_modes() is for no
>>>> modes, but connector status is connected or unknown.
>>>
>>> When debugging the issue, I found it surprising that the status is
>>> "connected" when nothing is plugged in the DP port.
>>>>
>>>> You could add a connector ->detect callback that returns disconnected
>>>> when there's no display, and the problem should go away. If there's no
>>>> ->detect callback, it'll default to connected.
>>>
>>> ok, I'll try that. I don't know how the hardware detect something is
>>> connected, but looking at the dp code, maybe checking
>>> "AST_IO_CRTC_PORT,0xDC, ASTDP_LINK_SUCCESS" would be good enough.
>>
>> I've tested this approach, and it works.
> 
> \o/
> 
>> But on the server I'm testing,
>> there are VGA and DP output. I think on a server that has only one DP
>> output, if no monitor is connected, then no modes will be reported to
>> userspace, and the remote BMC may not work ?
> 
> I couldn't say, but having the driver lie about the connected status to
> make it work feels wrong.

Yes, so maybe a better way would be to add a remote/bmc connector, with 
proper default resolution ?
That will better reflect what the hardware does.

-- 

Jocelyn

> 
>> Also I don't have physical access to the server, so I only tested when
>> no monitor is plugged.
>>
>> I will send shortly a v2 with this change, so others can help me test
>> this case.
> 
> Thanks,
> Jani.
> 
> 
>>
>> Best regards,
> 


