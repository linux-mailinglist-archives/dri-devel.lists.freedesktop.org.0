Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA06384D9F5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 07:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABD510E111;
	Thu,  8 Feb 2024 06:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Oalc83M8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F3610E14A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 06:19:49 +0000 (UTC)
Message-ID: <09701811-70bb-4731-a179-099845c59b4a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1707373183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UjHoYwmVlEt5wAy+Z0BauImOiW3XL6t1g/je10Behf0=;
 b=Oalc83M8S+FfF4j2M3Qtw/UB7UtFIKHHZQqb8HgYHugcv+sXdrnIpiMg0HpwmVdIKDigqL
 1wHgjGxbSa9M26fXIs1dIe5CIZCIJXV2YyQwyi7Ud51HZl8pxkR1G0MpbQxiWAbmJKfOjv
 WiWR44U5u9224PqyoVCu3Y85klW3JCo=
Date: Thu, 8 Feb 2024 14:19:32 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] drm/etnaviv: fix DMA direction handling for cached
 read/write buffers
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>, Lucas Stach <l.stach@pengutronix.de>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, Christian Gmeiner
 <christian.gmeiner@gmail.com>, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
References: <20240126165856.1199387-1-l.stach@pengutronix.de>
 <CAPj87rNOMYS7g_bU8Xjmh9xEJhuzG+BViXakC7wzgiDaG+9yCg@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <CAPj87rNOMYS7g_bU8Xjmh9xEJhuzG+BViXakC7wzgiDaG+9yCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 2024/1/29 18:29, Daniel Stone wrote:
> Hi Lucas,
>
> On Fri, 26 Jan 2024 at 17:00, Lucas Stach <l.stach@pengutronix.de> wrote:
>> The dma sync operation needs to be done with DMA_BIDIRECTIONAL when
>> the BO is prepared for both read and write operations. With the
>> current inverted if ladder it would only be synced for DMA_FROM_DEVICE.
>>
>> [...]
>>
>>   static inline enum dma_data_direction etnaviv_op_to_dma_dir(u32 op)
>>   {
>> -       if (op & ETNA_PREP_READ)
>> +       if (op & (ETNA_PREP_READ | ETNA_PREP_WRITE))
>> +               return DMA_BIDIRECTIONAL;
> This test will always be true for _either_ read or write.


Haha, I think it should be"if ((op & ETNA_PREP_READ) && (op & ETNA_PREP_WRITE))"


> Cheers,
> Daniel
