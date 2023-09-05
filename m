Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4817920B5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 09:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D028010E442;
	Tue,  5 Sep 2023 07:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F8F10E25C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 07:28:12 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6288C75A;
 Tue,  5 Sep 2023 09:26:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693898804;
 bh=VvDgO6WZIfHOJ92ePZGwc+GLxQLF0SWCV70ytox5Eek=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LHED6sbchNDoIDVWxX4KRrgFHIp1urqvbNZIoKYb/1StTpG6Ryw0FVAtRsxqtdGzb
 X9OSwF/0Ke0eeYCJ8m7ciw3nbOejloDsAmnteuUDgDItVjjMBo+P0+vatR7xB/+I3k
 rwwBIItumpmC+NtV+XCpdL55dW991IT74BIzPgjI=
Message-ID: <9c04a6f0-d7ec-6efd-7b33-774ce4d5548d@ideasonboard.com>
Date: Tue, 5 Sep 2023 10:28:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/4] drm/bridge: lt8912b: Manually disable HPD only if it
 was enabled
Content-Language: en-US
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
References: <20230804-lt8912b-v1-0-c542692c6a2f@ideasonboard.com>
 <20230804-lt8912b-v1-3-c542692c6a2f@ideasonboard.com>
 <cb069b10a38b018868f370fada3e97da7257264b.camel@toradex.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <cb069b10a38b018868f370fada3e97da7257264b.camel@toradex.com>
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 "adrien.grassein@gmail.com" <adrien.grassein@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/09/2023 21:08, Marcel Ziswiler wrote:
> Hi Tomi
> 
> Looks good. Thanks! Tested both on Verdin AM62 as well as on Verdin iMX8M Mini.
> 
> Just a minor nit-pick in your commit message.
> 
> On Fri, 2023-08-04 at 13:48 +0300, Tomi Valkeinen wrote:
>> lt8912b only calls drm_bridge_hpd_enable() if it creates a connector and
>> the next bridge has DRM_BRIDGE_OP_HPD set. However, when calling
>> drm_bridge_hpd_disable() it misses checking if a connector was created,
>> calling drm_bridge_hpd_disable() even if HPD was nenver enabled. I don't
> 
> was never enabled
> 
>> see any issues causing by this wrong call, though.
> 
> any issues caused by this wrong call
> 
>> Add the check to avoid wrongly calling drm_bridge_hpd_disable().
>>
>> Fixes: 3b0a01a6a522 ("drm/bridge: lt8912b: Add hot plug detection")
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> For the whole series:
> 
> Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Thanks! I have fixed the typos in the desc.

  Tomi

