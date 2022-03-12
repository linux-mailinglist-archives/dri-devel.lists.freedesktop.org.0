Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D744D70F5
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 22:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D75110E112;
	Sat, 12 Mar 2022 21:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CB810E112
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 21:08:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id AE00E1F4595D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647119280;
 bh=wLExJO5a7BmNAEjWa2vEXI65hZUlcnfDKIQubmXYQnc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QYeUEH+ikY/Ro0+JeLJULZFKaxxIFkAzMFLOhDP83klBIXSO/dTzyh02Ta91Msvkz
 Co7Da98R4PxLxTf2su/UBioVU1YgOlfOenhHw9yjbvlMiP8/WA1Qld7GSG3cGG4J7x
 EZUrFmknuwGh3ws+Cq61njszuQwOgN+ztZthFrmQDfnJpw6xvxp6h9urLbStLUAE94
 sby0sevwi1CxegYfipUaMpooeK8yJl7rIW2Pfy90HqIgLTzifmmpOgC03xlNdjseFg
 UorG2by37kNYSuDTChgTvPzoOxNyzudZ62M5A8MCmVbQqawTlFPPQSLjS4XE456Bl4
 FAnhceRnDkSWg==
Message-ID: <4712e128-8a14-e361-0819-911dc3453372@collabora.com>
Date: Sun, 13 Mar 2022 00:07:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v8 09/24] drm/rockchip: dw_hdmi: Add support for niu clk
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>,
 "elaine.zhang" <zhangqing@rock-chips.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20220311083323.887372-1-s.hauer@pengutronix.de>
 <20220311083323.887372-10-s.hauer@pengutronix.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220311083323.887372-10-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/11/22 11:33, Sascha Hauer wrote:
> The rk3568 HDMI has an additional clock that needs to be enabled for the
> HDMI controller to work. This clock is not needed for the HDMI
> controller itself, but to make the SoC internal bus logic work. From the
> reference manual:
> 
>> 2.8.6 NIU Clock gating reliance
>>
>> A part of niu clocks have a dependence on another niu clock in order to
>> sharing the internal bus. When these clocks are in use, another niu
>> clock must be opened, and cannot be gated.  These clocks and the special
>> clock on which they are relied are as following:
>>
>> Clocks which have dependency     The clock which can not be gated
>> -----------------------------------------------------------------
>> ...
>> pclk_vo_niu, hclk_vo_s_niu       hclk_vo_niu
>> ...
> The clock framework does not support turning on a clock whenever another
> clock is turned on, so this patch adds support for the dependent clock
> to the HDMI driver. We call it "NIU", which is for "Native Interface
> Unit"

This still doesn't make sense to me. You're saying that "pclk_vo_niu,
hclk_vo_s_niu" depend on "hclk_vo_niu", but HDMI doesn't use pclk_vo, it
uses pclk_hdmi. I don't see how these "niu" clocks are related to HDMI
from your description. The pclk_vo should remain being disabled for HDMI.

I already said before that the datasheet suggests that hclk_vo needs to
be enabled in order to ungate the AHB part of the VO module, which is
needed for CPU accesses. Elain, could you please confirm this or clarify
more about why hclk_vo needs to be enabled for HDMI?
