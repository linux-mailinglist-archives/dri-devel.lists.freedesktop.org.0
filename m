Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0088C751C4A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A25610E631;
	Thu, 13 Jul 2023 08:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F3310E637
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689238414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=48KiOA12Y9USvsdXypNyUuBOse//ujwIeJhT9CtTmps=;
 b=ItKJL3VRRaUUGm/eDCR5S/FlJSwxWYmeg2fSt6kFx2GTNWhsGzTZ94n8+/8LcNXgzknker
 frq0JeGRyEzu3kTcyVfqC2aAsI9uDQHuHQVW706ozBsWjYR+a2+2gzxsMBXPm2dbj9wwGx
 Yyf4aqKKltM9pw2TFtj3+wqcXUWxKZA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-evMgBDQPNxSaDfRsSxn1Mg-1; Thu, 13 Jul 2023 04:53:26 -0400
X-MC-Unique: evMgBDQPNxSaDfRsSxn1Mg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-31273e0507dso381579f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 01:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689238405; x=1691830405;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=48KiOA12Y9USvsdXypNyUuBOse//ujwIeJhT9CtTmps=;
 b=M0ieTYSbjsFQEqLkp0OWZHHHLryI5dkEbvZgIbLD57+4IVVZDCTBZxPZlPbi2LbR9f
 8Zt+INwmxXd7KiTXXONUz3iyus/ZMi3GqLMQ4MKGOINeP4gqo7cROdClwp90zxAIGNrv
 MND3imEaXVtlQMzmp45rpIpfDWvzo6AOxnh/6lWgbpbHkzj2B4QogCJoFcyY8JzZCiOD
 ZtUFksr9f3Y9fB/IuSXhkU9w30UHEzuDrQ9vphspdaNODHe4SwI0T/0Y9njn8R8iLrlN
 3m1t+9o5SvQJedHr6bhjWRHFwI/OWX5C6dhZYlYSHvBi2i34+lPUZPCaXzyb2i0DyERz
 VW1w==
X-Gm-Message-State: ABy/qLZjEjNGfUI+/nFUvOm06Cndx7XuYdHxDDJLEBCierWXa1VH0K78
 8UzJFqJ1zKk+tlk49Ey2i3ZqH3TQY7FvI+8nDVImK5g0rY31n3y6ZI0qwshtiiqSo+9N4PcWDYo
 amIsjPSFNTwY/1iVQU58z6fTxJXW4jO1ENKho9AJRcqPNTYTJ9af61vFwaWppGp9xrWcynrAK3K
 JhsYrPwsFgjdk8
X-Received: by 2002:a5d:628c:0:b0:313:f54a:a842 with SMTP id
 k12-20020a5d628c000000b00313f54aa842mr1002508wru.63.1689238405046; 
 Thu, 13 Jul 2023 01:53:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHo3qG9/ApIO9sdUCp09eK4zg+PcmYp8+cfPdmVpa/T1HOpfIDCABTfAog0w6QYrhpfYrrAYQ==
X-Received: by 2002:a5d:628c:0:b0:313:f54a:a842 with SMTP id
 k12-20020a5d628c000000b00313f54aa842mr1002492wru.63.1689238404707; 
 Thu, 13 Jul 2023 01:53:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a5d6110000000b003063db8f45bsm7306601wrt.23.2023.07.13.01.53.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 01:53:24 -0700 (PDT)
Message-ID: <90f7b5f9-9805-39d3-801a-babd10f1a0cf@redhat.com>
Date: Thu, 13 Jul 2023 10:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
To: dri-devel@lists.freedesktop.org
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <878rbv20dp.fsf@intel.com> <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
 <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>
 <43d12606-9c81-99f8-f13c-14338fcd7a28@suse.de>
 <f4b4ab09-5f03-af3c-0e7f-44a248678be8@redhat.com>
 <23d80964-d2d0-b688-e3cd-bf25a8135e5e@redhat.com>
 <81c57344-289d-fe41-8518-503249ea8d64@suse.de>
 <3fc768f8-9461-c4b0-b9af-555c52294c94@redhat.com>
 <2fb391e2-9f68-26f0-e005-a7f0f4324adc@loongson.cn>
 <b56afc8a-5fda-3227-3ac0-5e7b7773976b@redhat.com>
 <36e04e4c-c2ac-64cf-9503-ea43a29b66d0@mailbox.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <36e04e4c-c2ac-64cf-9503-ea43a29b66d0@mailbox.org>
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

On 13/07/2023 10:32, Michel Dänzer wrote:
> On 7/12/23 17:25, Jocelyn Falempe wrote:
>> On 12/07/2023 17:05, Sui Jingfeng wrote:
>>> On 2023/7/10 16:07, Jocelyn Falempe wrote:
>>>
>>>> On the other hand, are there any drawback to present a BMC connector even when the hardware doesn't have it ?
>>>
>>> If not properly setting up, I think you will create two encoder and two connector in the system.
>>
>> Yes, but I think it won't have any visible effect for the end-user.
> 
> I'm afraid user-space display servers would waste effort producing content for a non-existing BMC (assuming its connector status is connected or unknown).
> 
> 
I think it's already the case, as AST's DP and VGA connectors currently 
always report "connected" status. And they all share the same crtc, so 
there is only one framebuffer, that is always active.

Best regards,

-- 

Jocelyn

