Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F217F4F2B29
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 13:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C402710E8EF;
	Tue,  5 Apr 2022 11:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C3410E8EF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 11:09:06 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 65CC922247;
 Tue,  5 Apr 2022 13:09:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1649156944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HhCRNMxeN/GjO55RvomQG0xoJmMvvbdrMDnAktj+ZOw=;
 b=cNqMfgmXtFPvgEEwbWq+VnwdvMuscRpK20137u0iJSnBDLVHoJFUu5w4qyLSMk8UBd8eum
 0HMbGVUDIyLdMdlDNStBDi+KY7vBSzta24pjZddLL/yJGIlyoEPC3VL3TgfKTOY12IUtu8
 hkJrB7ZhYGB9P1u1D5xx4Y+a7XRIo5o=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Tue, 05 Apr 2022 13:09:04 +0200
From: Michael Walle <michael@walle.cc>
To: Codrin.Ciubotariu@microchip.com
Subject: Re: [PATCH] i2c: at91: use dma safe buffers
In-Reply-To: <360914ee-594c-86bc-2436-aa863a67953a@microchip.com>
References: <20220303161724.3324948-1-michael@walle.cc>
 <46e1be55-9377-75b7-634d-9eadbebc98d7@microchip.com>
 <bc32f1107786ebcbfb4952e1a6142304@walle.cc>
 <360914ee-594c-86bc-2436-aa863a67953a@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <27f124c9adaf8a4fbdfb7a38456c4a2e@walle.cc>
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

Am 2022-04-05 12:02, schrieb Codrin.Ciubotariu@microchip.com:
> On 05.04.2022 12:38, Michael Walle wrote:
>> Am 2022-04-05 11:23, schrieb Codrin.Ciubotariu@microchip.com:
>>>> +       if (dev->use_dma) {
>>>> +               dma_buf = i2c_get_dma_safe_msg_buf(m_start, 1);
>>> 
>>> If you want, you could just dev->buf = i2c_get_dma_safe...
>> 
>> But where is the error handling in that case? dev->buf will
>> be NULL, which is eventually passed to dma_map_single().
>> 
>> Also, I need the dma_buf for the i2c_put_dma_safe_msg_buf()
>> call anyway, because dev->buf will be modified during
>> processing.
> 
> You still:
> 	if (!dev->buf) {
> 		ret = -ENOMEM;
> 		goto out;
> 	}
> 
> So, at91_do_twi_transfer()/dma_map_single() will not be called.

Ahh, I misunderstood you. Yes, but as I said, I need the dma_buf
temporary variable anyway, because dev->buf is modified, eg. see
at91_twi_read_data_dma_callback().

-michael
