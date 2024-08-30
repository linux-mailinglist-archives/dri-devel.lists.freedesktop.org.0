Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34628966794
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 19:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C4D10EA49;
	Fri, 30 Aug 2024 17:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=cristian.ciocaltea@collabora.com header.b="eUgTB7/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4985310EA49
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:06:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1725037583; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ngV+QYPPC8w8D6ME0lzSoqJLcXzhr8+rM3pIQnklsjTFqrR2Sbws/ZcdVmyt/JSh5NU9VeoMzWqkKzdZUTU81Gogk4fUu64s7/vEh7KazhA9zZ6KAPXdiTbu98QQlOe8ZMM5sJYW0wZGx+o4PNAO4dEs858OpzA0gNjRiI8gRDw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1725037583;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=KnpKeemAO2VMc6FHLD9U8mKtZUQ/q0cWnYTv+8kFLZ0=; 
 b=NvPaCsIjVPL8C/FDpDW6qF8B8M+Rg+P52Zst2GA1uMV5dFzxsvAJG9riFUkwSmO4IVXvmByE+rbvc9rpQYnGXH13+jljg8JHX9/OgYGl15LSS4jozmLCD4ScJ4lKdTfmP9NFEkmB6q4XLx+56OHBWPBgiqTyH5kslLaIAw0aKt4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=cristian.ciocaltea@collabora.com;
 dmarc=pass header.from=<cristian.ciocaltea@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725037583; 
 s=zohomail; d=collabora.com; i=cristian.ciocaltea@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=KnpKeemAO2VMc6FHLD9U8mKtZUQ/q0cWnYTv+8kFLZ0=;
 b=eUgTB7/4+R6rELo4C367GkmtuSW8hZ8Ii2ubfeFkdIvBmQ3cq4f7yiBGOu5T8E1r
 mLnrMyQPArepmiWwoCsrdzgtZg7UIjUMMFoI06LCfzP+hnQmFxqBKExkqcWSDpyqnR9
 2ngxm30h68NeSIYva+jjP4cKmnvHy2WKjihePMSs=
Received: by mx.zohomail.com with SMTPS id 1725037581937540.2732611536068;
 Fri, 30 Aug 2024 10:06:21 -0700 (PDT)
Message-ID: <68e78629-5a2c-433b-8c83-50ffced04268@collabora.com>
Date: Fri, 30 Aug 2024 20:06:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5? 0/6] Tweaked basic Synopsys DW HDMI QP TX driver for
 Rockchip RK3588
To: Shimrra Shai <shimrrashai@gmail.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 markyao0591@gmail.com, s.hauer@pengutronix.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, aarnoud@me.com, ldearquer@gmail.com,
 algea.cao@rock-chips.com
References: <20240830152132.8894-1-shimrrashai@gmail.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <20240830152132.8894-1-shimrrashai@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

Hi Shimrra,

On 8/30/24 6:21 PM, Shimrra Shai wrote:
> Hi,
> 
> I saw Cristian Ciocaltea's proposed basic driver for the Synopsys DW
> HDMI QP transmit (TX) facility on the Rockchip RK3588 and noticed that
> it had seen some critique and thought I'd help it along a little by
> making some of the changes that others had suggested in the discussion
> thread. This package is mostly like his(?) original but features the
> following changes suggested by Conor Dooley and Heiko Stuebner:

Please stop doing this!  

I appreciate your intention to help, but this is not the proper way of
doing it.  This is a work-in-progress series and you should have asked
before taking over.  Please do not interfere with other people's work
without having a preliminary agreement with the author(s).

Additionally, before submitting any other patches, you should get 
familiar with the process - see [1] for a starting point.

>  * Documentation for the device tree bindings specifies the various
>    clocks explicitly in both the general (synopsys,dw-hdmi-qp.yaml)
>    and Rockchip-specific (rockchip,rk3588-dw-hdmi-qp.yaml) files.

Why? Did you read [2]?

>  * Changed the compatibles for the RK3588 VO0 and VO1 GRFs in the
>    Device Trees (rk3588-base.dtsi) to reflect their different natures.

This has been already handled - see [3].

> and some of my own changes:
> 
>  * Tweaked the driver code slightly - mostly organizational, but also
>    added a mutex around device access in the dw_hdmi_qp_... method
>    that was present in the downstream BSP driver which might have been
>    necessary to prevent thread bugs.
>  * Improved grammar & punctuation in some of the English on the
>    Kconfigs and output messages.
> 
> Let me know how you like it. I hope this is suitable enough for kernel
> integration as I'd really like to be able to get some of the newest
> kernels having video bringup out of the box. 

That's definitely not suitable as you made lots of other mistakes while
preparing the patches, i.e. preserving authorship, missing commit
descriptions, SoB tags, etc.

Regards,
Cristian

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html
[2] https://lore.kernel.org/lkml/038073d0-d4b9-4938-9a51-ea2aeb4530f6@collabora.com/
[3] https://lore.kernel.org/lkml/20240828-rk3588-vo-grf-compat-v2-0-4db2f791593f@collabora.com/

