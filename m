Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F52F4F36BA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 16:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AB510E06E;
	Tue,  5 Apr 2022 14:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9869510E06E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 14:08:33 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E473822247;
 Tue,  5 Apr 2022 16:08:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1649167711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+6+1BpQJhWpIwzeox1bohwEoCNti4GjMewSwLvafwXw=;
 b=FjoEbM8+1cMTX7ixD4Mw3f9fWtrhCqWB0k1AAf2hdMX7f6oCWMT1wXPAY4BKHa7SJ2Uefh
 nRiJDlkMvxeECN0Hz+B+LZR9gyrz/dw/HfgISScMlZbgJrgFBhpSvJfVcPMr+lyrzY+sRR
 5CsvQ+iUunnCwjuq9CnFA29BcFB2G4c=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Tue, 05 Apr 2022 16:08:30 +0200
From: Michael Walle <michael@walle.cc>
To: Codrin.Ciubotariu@microchip.com
Subject: Re: [PATCH] i2c: at91: use dma safe buffers
In-Reply-To: <74494dda-e0cd-aa73-7e58-e4359c1ba292@microchip.com>
References: <20220303161724.3324948-1-michael@walle.cc>
 <46e1be55-9377-75b7-634d-9eadbebc98d7@microchip.com>
 <bc32f1107786ebcbfb4952e1a6142304@walle.cc>
 <360914ee-594c-86bc-2436-aa863a67953a@microchip.com>
 <27f124c9adaf8a4fbdfb7a38456c4a2e@walle.cc>
 <74494dda-e0cd-aa73-7e58-e4359c1ba292@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9e715ed06a28165446e29483cca7e3d0@walle.cc>
X-Sender: michael@walle.cc
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
Cc: alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 Nicolas.Ferre@microchip.com, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 linux-i2c@vger.kernel.org, stable@vger.kernel.org,
 Claudiu.Beznea@microchip.com, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-04-05 15:58, schrieb Codrin.Ciubotariu@microchip.com:
> On 05.04.2022 14:09, Michael Walle wrote:
>> Am 2022-04-05 12:02, schrieb Codrin.Ciubotariu@microchip.com:
>>> On 05.04.2022 12:38, Michael Walle wrote:
>>>> Am 2022-04-05 11:23, schrieb Codrin.Ciubotariu@microchip.com:
>>>>>> +       if (dev->use_dma) {
>>>>>> +               dma_buf = i2c_get_dma_safe_msg_buf(m_start, 1);
>>>>> 
>>>>> If you want, you could just dev->buf = i2c_get_dma_safe...
>>>> 
>>>> But where is the error handling in that case? dev->buf will
>>>> be NULL, which is eventually passed to dma_map_single().
>>>> 
>>>> Also, I need the dma_buf for the i2c_put_dma_safe_msg_buf()
>>>> call anyway, because dev->buf will be modified during
>>>> processing.
>>> 
>>> You still:
>>>       if (!dev->buf) {
>>>               ret = -ENOMEM;
>>>               goto out;
>>>       }
>>> 
>>> So, at91_do_twi_transfer()/dma_map_single() will not be called.
>> 
>> Ahh, I misunderstood you. Yes, but as I said, I need the dma_buf
>> temporary variable anyway, because dev->buf is modified, eg. see
>> at91_twi_read_data_dma_callback().
> at91_twi_read_data_dma_callback() is called as callback if
> dma_async_issue_pending(dma->chan_rx) is called.
> dma_async_issue_pending(dma->chan_rx) is called on
> at91_twi_read_data_dma(), which is called in at91_do_twi_transfer(),
> which we decided above to skip in case of error.

It is not about errors, you need the exact same pointer you
got from i2c_get_dma_safe_msg_buf() to be passed to
i2c_put_dma_safe_msg_buf(). And because (in some cases, it
isn't really obvious) the dev->buf will be advanced a few
bytes, I cannot pass dev->buf to i2c_put_dma_safe_msg_buf().

-michael
