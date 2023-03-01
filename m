Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA236A6E22
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 15:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CB310E109;
	Wed,  1 Mar 2023 14:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AD010E0EB;
 Wed,  1 Mar 2023 14:15:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 33F47B8103F;
 Wed,  1 Mar 2023 14:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BDCC433D2;
 Wed,  1 Mar 2023 14:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677680155;
 bh=67yGKOOelLpeOlZKR/e1mlM7y1TTA9eOt92/JiaBs8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QiiYn58qB3G8xGjuvfAilzxQMkLAq9gcG8f3uZ1/YEfZhCe66xYzB7SOhLATl8PAn
 RqdpSp5nfLMghhz+gDvEDj+5TXJJfxSQrQMVjyKWOTMBMUci5p4acb6NK07/m0NKhJ
 xo6rISBtTeUm2tLzrGxi9A8yGgfSkCn/AtUIRrGm3dZ7YAFzDPeVK1feOjAJh+69i1
 OjBzxpWuMb9MYIbUYnXW4xPemQCQpbgOpKttOY8M+eHAKdy1Qwo2gTeNPm8Wzsviqx
 P2vlitqOYsj37CBqm7WMVJkX/aXrU6xXTwM3rWYHabOce3Lz2edEsX7Bg/LjWUgnkQ
 NIGDDiIu/m5Rg==
Date: Wed, 1 Mar 2023 09:15:53 -0500
From: Sasha Levin <sashal@kernel.org>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH AUTOSEL 6.2 18/60] drm/msm/dp: Remove INIT_SETUP delay
Message-ID: <Y/9eGRUEYyN8oroU@sashalap>
References: <20230227020045.1045105-1-sashal@kernel.org>
 <20230227020045.1045105-18-sashal@kernel.org>
 <Y/xz9IcSsc8mau9s@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Y/xz9IcSsc8mau9s@hovoldconsulting.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 Bjorn Andersson <quic_bjorande@quicinc.com>, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, swboyd@chromium.org,
 johan+linaro@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 10:12:20AM +0100, Johan Hovold wrote:
>On Sun, Feb 26, 2023 at 09:00:03PM -0500, Sasha Levin wrote:
>> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>>
>> [ Upstream commit e17af1c9d861dc177e5b56009bd4f71ace688d97 ]
>>
>> During initalization of the DisplayPort controller an EV_HPD_INIT_SETUP
>> event is generated, but with a delay of 100 units. This delay existed to
>> circumvent bug in the QMP combo PHY driver, where if the DP part was
>> powered up before USB, the common properties would not be properly
>> initialized - and USB wouldn't work.
>>
>> This issue was resolved in the recent refactoring of the QMP driver,
>> so it's now possible to remove this delay.
>>
>> While there is still a timing dependency in the current implementation,
>> test indicates that it's now possible to boot with an external display
>> on USB Type-C and have the display power up, without disconnecting and
>> reconnecting the cable.
>>
>> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>> Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> Patchwork: https://patchwork.freedesktop.org/patch/518729/
>> Link: https://lore.kernel.org/r/20230117172951.2748456-1-quic_bjorande@quicinc.com
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This is not a bug fix and should not be backported.

Ack, I'll drop all the INIT_SETUP patches. Thanks!

-- 
Thanks,
Sasha
