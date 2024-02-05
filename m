Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85CD84A85F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 23:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D39710FD20;
	Mon,  5 Feb 2024 22:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aHH3g1EB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0933F10FD20
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 22:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707170410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hjBcErB1CCpg9NKqOWhKTcNtStkUdZD8IdC+CObI8bk=;
 b=aHH3g1EBz2fnM6/prQl2HsH5uXlVJbfZ5hViF9JTZqvU4k9yIp1Mmcf0BJj9eW3vYn9gVU
 RnavHeSWHvMMfvO+KOQ5fh6mjDyH7iziJuOAgWnstysHM/4gVdV7TAJzu7eeQbgMfN6y5D
 KBgGtLA8BluoOv3BPE/Y3aXyE8guGwo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-2j-Z1e7HMy6urKMKxdwaEw-1; Mon, 05 Feb 2024 17:00:09 -0500
X-MC-Unique: 2j-Z1e7HMy6urKMKxdwaEw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-33b28f50eadso1462561f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 14:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707170407; x=1707775207;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hjBcErB1CCpg9NKqOWhKTcNtStkUdZD8IdC+CObI8bk=;
 b=lKIRLJtMWPTRJQperEUYoujUwlGkAyfKBLQMv8FIYoSk+A572Sa03QYO+H1VeWBYX5
 j4qULE5oNoGJjjOwjfgyqu//Pa7sCxx03hcA5m4ugDy5HkiqEXAwMjzXMLHhbSmlbBvD
 pvS/lFXZvgD5cXsJ89Ju/wTYzowRcd51EJ3XEDpqFTFGHzFycylmKRZM47ykBMTJSxb9
 94iL3tSV+WCwsUt5+FkHEzjIfKzJzgo2lOCQiKTwUceHyg0f/PCo0pak16dCqwNdL36D
 bnI5Az/ZwGmSxpbRXMn52vfE/gbxhm+ezfUOyddZturXghJe/D8bNP0GvHMYPinTg4mN
 ZohA==
X-Gm-Message-State: AOJu0YyqwKkg8QL6sZ5Q53TvuPpNXsfDYgxsrnWkkbl2T6egDXdeJm0q
 ZdlzQAAVV3TbBYuViW3xKKW+joXe3RtAsIF2yr+yCxyDHQjHkcREOvIqnk+Lc64ROn8z7xg7OYz
 gm/H3z2+kgnjnnxNn6DUt4cDTgzBjlF5ELtXj/xAzM88YqG6eduwR5oSoAzYD6B6/TmUcn1MxNQ
 ==
X-Received: by 2002:a05:6000:146:b0:33b:20c:d2b2 with SMTP id
 r6-20020a056000014600b0033b020cd2b2mr492398wrx.13.1707170407022; 
 Mon, 05 Feb 2024 14:00:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGij6MBkiTCuTEPlaRJxyZPvpy8T7sL0ptjDM+L3dVvB3SdCPPtrt5b1BMpVx1V9kkhDkPuzQ==
X-Received: by 2002:a05:6000:146:b0:33b:20c:d2b2 with SMTP id
 r6-20020a056000014600b0033b020cd2b2mr492378wrx.13.1707170406386; 
 Mon, 05 Feb 2024 14:00:06 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWW4Ab3sce193OPClnEntrUCnRY6gF7IoSW7i0EIbbevxisTVN4y4X/un+ufoHDSMtIf6YOZ1vVqyS4D5+gqdW4/RePASB8HzJam2R9QkQ3
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a056000110f00b0033b3fd73127sm536558wrw.9.2024.02.05.14.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 14:00:06 -0800 (PST)
Message-ID: <3d967763-8f8f-4451-9927-33395e1b4d70@redhat.com>
Date: Mon, 5 Feb 2024 23:00:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau: offload fence uevents work to workqueue
To: Dave Airlie <airlied@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240129015053.1687418-1-airlied@gmail.com>
 <133266ac-7239-4233-a19d-cdc7563d401c@redhat.com>
 <CAPM=9tyc3zWRhm4xSnnHprU-v7prdZ2fkkLDEfjC_t_2wM-8Kg@mail.gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <CAPM=9tyc3zWRhm4xSnnHprU-v7prdZ2fkkLDEfjC_t_2wM-8Kg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/5/24 22:08, Dave Airlie wrote:
> On Tue, 6 Feb 2024 at 02:22, Danilo Krummrich <dakr@redhat.com> wrote:
>>
>> On 1/29/24 02:50, Dave Airlie wrote:
>>> From: Dave Airlie <airlied@redhat.com>
>>>
>>> This should break the deadlock between the fctx lock and the irq lock.
>>>
>>> This offloads the processing off the work from the irq into a workqueue.
>>>
>>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>>
>> Nouveau's scheduler uses a dedicated wq, hence from this perspective it's
>> safe deferring fence signalling to the kernel global wq. However, I wonder
>> if we could create deadlocks by building dependency chains into other
>> drivers / kernel code that, by chance, makes use of the kernel global wq as
>> well.
>>
>> Admittedly, even if, it's gonna be extremely unlikely given that
>> WQ_MAX_ACTIVE == 512. But maybe it'd be safer to use a dedicated wq.
>>
>> Also, do we need to CC stable?
> 
> I pushed this to Linus at the end of last week, since the hangs in 6.7
> take out the complete system and I wanted it in stable.
> 
> It might be safer to use a dedicated wq, is the concern someone is
> waiting on a fence in a workqueue somewhere else so we will never
> signal it?

Yes, if some other work is waiting for this fence (or something else in the same
dependency chain) to signal it can prevent executing the work signaling this fence,
in case both are scheduled on the same wq. As mentioned, with the kernel global wq
this would be rather unlikely to lead to an actual stall with WQ_MAX_ACTIVE == 512,
but formally the race condition exists. I guess a malicious attacker could try to
intentionally push jobs directly or indirectly depending on this fence to a driver
which queues them up on a scheduler using the kernel global wq.

> 
> Dave.
> 

