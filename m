Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C87BC5ED804
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 10:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A71510E35B;
	Wed, 28 Sep 2022 08:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [IPv6:2a01:4f8:c0c:51f3::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D65810E35B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 08:39:31 +0000 (UTC)
Message-ID: <2f341aa8-b960-26d1-8073-737f828a8805@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1664354368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=odnCR32h5bJchqerHBwrx1Lt5l9YbS6widivPl5LNjY=;
 b=pJWdtNKRskTs+7ssI6eg3TAS8vHINylC05MFxd8MfuzRpr6dJTytJ32n0QC4ovEBbtpzTZ
 VyW270OPYGeU7Ivb6PgIh+z7aTN2AXSepXuCXcKCzeWtSDxzDpgifkXyaqEPYg24aGjIIU
 ZLBrT0IhMOQc2lQWXyvu4Qmt4bmcrXMlc9lEzi29TfxXojxzeKi0JyWXKosi0G0duUaLS/
 uikpXkYClldjEgeOSJpTzpYZ1+Tqwc5RLyuh91QZF3hm6eC82l/rVhJq9HHENROdIfrlA7
 uGhca2zF3VLcJMmPj5HidkNUdianstCpEV/x1bF4yoeJYB0OUqNQ+PpBIlfKtw==
Date: Wed, 28 Sep 2022 10:39:27 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] drm/rockchip: dw_hdmi: Add 4k@30 support
Content-Language: da-DK
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <20220926080435.259617-1-s.hauer@pengutronix.de>
 <cf2285dc-d732-0c6d-83bc-022f23f29524@wolfvision.net>
 <2430a203-f8e7-7d78-3e9e-9e1d9c6826c9@manjaro.org>
 <20220928083755.GU986@pengutronix.de>
From: Dan Johansen <strit@manjaro.org>
Organization: Manjaro ARM
In-Reply-To: <20220928083755.GU986@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=strit@manjaro.org smtp.mailfrom=strit@manjaro.org
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
Cc: Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Den 28.09.2022 kl. 10.37 skrev Sascha Hauer:
> On Tue, Sep 27, 2022 at 07:53:54PM +0200, Dan Johansen wrote:
>> Den 26.09.2022 kl. 12.30 skrev Michael Riesch:
>>> Hi Sascha,
>>>
>>> On 9/26/22 10:04, Sascha Hauer wrote:
>>>> This series adds support for 4k@30 to the rockchip HDMI controller. This
>>>> has been tested on a rk3568 rock3a board. It should be possible to add
>>>> 4k@60 support the same way, but it doesn't work for me, so let's add
>>>> 4k@30 as a first step.
>>>> 														     Sascha
>>>>
>>>> Changes since v1:
>>>> - Allow non standard clock rates only on Synopsys phy as suggested by
>>>>     Robin Murphy
>>>>
>>>> Sascha Hauer (2):
>>>>     drm/rockchip: dw_hdmi: relax mode_valid hook
>>>>     drm/rockchip: dw_hdmi: Add support for 4k@30 resolution
>>>>
>>>>    drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 34 ++++++++++++++++-----
>>>>    1 file changed, 27 insertions(+), 7 deletions(-)
>>> Thanks for the v2! On a RK3568 EVB1 with a HP 27f 4k monitor
>>>
>>> Tested-by: Michael Riesch <michael.riesch@wolfvision.net>
>> Sadly this still doesn't give my display out on my 2k monitor. Not even just
>> 1080p picture like the old current implementation does.
> By "like the old current implementation" you mean that this patchset
> introduces a regression for you?
Yes. What currently in the kernel at least shows as 1080p on my 2K 
monitor, while this patchset turns off the screen.
>
> Sascha
>
-- 
Kind regards
*Dan Johansen*
Project lead of the *Manjaro ARM* project
Manjaro-ARM <https://manjaro.org>
