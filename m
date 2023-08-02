Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 233CD76D56C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 19:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D4310E559;
	Wed,  2 Aug 2023 17:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6153B10E559
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 17:34:05 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5C82A86879;
 Wed,  2 Aug 2023 19:34:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1690997644;
 bh=XwFK3L9YauS9V85jsvpUthDzNCzhrXp9TLJ01qFpdpU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=F1zPl7Yi2QzjoG/Sty7wipc8AbAV4wQ0mGJ8Lckm/jbAqpZyBnvVuVdecthVjtBVR
 EeJwHrwVa/6sEPRx9ScbS4XpPqYEkmAk1pHAVzibVsRtMRfvrZVoDESqyRgWNSq8n5
 vi0ZQ9myQ954PtewvN3YHZTQv+0LEbb1vCwfXegrXEcBN4oFx5CcG9eAlBKhBVddF7
 2OedU7DTsgBIyJXsc4rUKX5Mg5n/GU+o3/tJTYgNtTABF5sgypIXCKQv+EoL43EtDT
 MF9uU9Es0lAQ08tqUeUeW+TVRxeQEyXumyJCq+F/4HF1K6+ufQ27kIGz9/A7Ptgbl7
 XqhdtS74EaoqA==
Message-ID: <bf95af44-2510-1835-dec9-183144de8413@denx.de>
Date: Wed, 2 Aug 2023 19:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] Revert "drm/bridge: lt9611: Do not generate HFP/HBP/HSA
 and EOT packet"
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
 <5cf0e3fa-f66d-06c4-cfda-c48efd8c6508@linaro.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <5cf0e3fa-f66d-06c4-cfda-c48efd8c6508@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Amit Pundir <amit.pundir@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/2/23 15:38, Dmitry Baryshkov wrote:
> On 02/08/2023 11:52, Neil Armstrong wrote:
>> This reverts commit [1] to fix display regression on the Dragonboard 845c
>> (SDM845) devboard.
>>
>> There's a mismatch on the real action of the following flags:
>> - MIPI_DSI_MODE_VIDEO_NO_HSA
>> - MIPI_DSI_MODE_VIDEO_NO_HFP
>> - MIPI_DSI_MODE_VIDEO_NO_HBP
>> which leads to a non-working display on qcom platforms.
>>
>> [1] 8ddce13ae696 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA and 
>> EOT packet")
>>
>> Cc: Marek Vasut <marex@denx.de>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Fixes: 8ddce13ae69 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA 
>> and EOT packet")
>> Reported-by: Amit Pundir <amit.pundir@linaro.org>
>> Link: 
>> https://lore.kernel.org/r/CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com/
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #fix db845c
> 
> The boards broken by [1] are used in production by different parties 
> since 5.10, breaking them doesn't seem more acceptable than breaking the 
> new out-of-tree iMX8m hardware.

The MX8M is also in-tree, so this does not apply.
