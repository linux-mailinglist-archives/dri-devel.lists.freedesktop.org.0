Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B2A496D9B
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jan 2022 20:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3E910E33E;
	Sat, 22 Jan 2022 19:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A235510E33E
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jan 2022 19:19:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D03360EB7;
 Sat, 22 Jan 2022 19:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65EDBC004E1;
 Sat, 22 Jan 2022 19:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642879180;
 bh=d6wiWoWrFFvd/k9Xxg/m5banf7LANNWYSravrHpAk4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ezh915L8ebkT+JcGDTWwADrEndB1O+U/VqfPAwUdrM5k9glY7ZBm063vgOQopxnHw
 3Il9usv97f7rY2fXCf4sIDaJ2EAaJe4QnVY0SE06KBoxZ3g4mTqpXfBW6Mxtz0UBbT
 nGImBEHY+9UBiaoVPya0iiDkky2I6pfF5PwgVepNSBR8gh+w6Mp5/QWefzHAEcd1Jn
 QOTGgzqhHQFeH5POAiuMEPCTpJMfSB89wMgLbJK7AU6IjXyDKijVaFdAUiDHkYiFxY
 mJ6mBSYmGaXq0DL1CxNePwKN4vfttxKg98k70GwUSeGDlXjEh7YpPep/7jVfaQkUb0
 AMaxLn/o6/0tA==
Date: Sat, 22 Jan 2022 14:19:39 -0500
From: Sasha Levin <sashal@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH AUTOSEL 5.15 123/188] drm/tegra: dc: rgb: Allow changing
 PLLD rate on Tegra30+
Message-ID: <YexYywTFEkQWEw/e@sashalap>
References: <20220118023152.1948105-1-sashal@kernel.org>
 <20220118023152.1948105-123-sashal@kernel.org>
 <1fa23a4d-f647-c3ae-df8c-4cbd91f5a4c6@gmail.com>
 <3bfdaf7b-c34d-1396-c6c7-2e22996b7643@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bfdaf7b-c34d-1396-c6c7-2e22996b7643@gmail.com>
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
Cc: airlied@linux.ie, Maxim Schwalm <maxim.schwalm@gmail.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, jonathanh@nvidia.com,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 18, 2022 at 12:39:43PM +0300, Dmitry Osipenko wrote:
>18.01.2022 12:37, Dmitry Osipenko пишет:
>> 18.01.2022 05:30, Sasha Levin пишет:
>>> From: Dmitry Osipenko <digetx@gmail.com>
>>>
>>> [ Upstream commit 0c921b6d4ba06bc899fd84d3ce1c1afd3d00bc1c ]
>>>
>>> Asus Transformer TF700T is a Tegra30 tablet device which uses RGB->DSI
>>> bridge that requires a precise clock rate in order to operate properly.
>>> Tegra30 has a dedicated PLL for each display controller, hence the PLL
>>> rate can be changed freely. Allow PLL rate changes on Tegra30+ for RGB
>>> output. Configure the clock rate before display controller is enabled
>>> since DC itself may be running off this PLL and it's not okay to change
>>> the rate of the active PLL that doesn't support dynamic frequency
>>> switching since hardware will hang.
>>>
>>> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>>> ---
>>>  drivers/gpu/drm/tegra/dc.c  | 27 ++++++++++++--------
>>>  drivers/gpu/drm/tegra/dc.h  |  1 +
>>>  drivers/gpu/drm/tegra/rgb.c | 49 +++++++++++++++++++++++++++++++++++--
>>>  3 files changed, 65 insertions(+), 12 deletions(-)
>>
>> Hi,
>>
>> This patch shouldn't be ported to any stable kernel because h/w that
>> needs this patch was just merged to the 5.17.
>
>* support of h/w that needs..

I'll drop it, thanks!

-- 
Thanks,
Sasha
