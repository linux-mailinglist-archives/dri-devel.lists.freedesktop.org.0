Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02490AE5BA4
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 06:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FBA10E4BD;
	Tue, 24 Jun 2025 04:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="ZHyUmZ03";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9EB10E4BD
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 04:53:16 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O4r1p41758084;
 Mon, 23 Jun 2025 23:53:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1750740781;
 bh=TmcUunDbJTKoNg9eOqTWGxYIouQv1t0S4n/SFCibWxA=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=ZHyUmZ03K7BZvRX6CEb0rvx+ZK1s0eOGY8bJMTH/tuYd785qL4PqWgXb06fXioxMk
 G/rqXjEVGGOXNl9YBkIavIDMOgLtg9XKy4d68RjAnwPO9cZ2F0r3osW4nL2MORFAba
 CTJmUFGXFxAYs5RiZ5pvlOht68s4lO9B0FLk/SEE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O4r0KH4141641
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 23 Jun 2025 23:53:00 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 23
 Jun 2025 23:52:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 23 Jun 2025 23:52:59 -0500
Received: from [172.24.227.214] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [172.24.227.214])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O4qqGP892097;
 Mon, 23 Jun 2025 23:52:53 -0500
Message-ID: <bc66e52a-7ab8-47db-b534-cc2fbef60ef4@ti.com>
Date: Tue, 24 Jun 2025 10:22:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Doug Anderson <dianders@chromium.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
 <tomi.valkeinen@ideasonboard.com>, <max.krummenacher@toradex.com>,
 <ernestvanhoecke@gmail.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <kieran.bingham+renesas@ideasonboard.com>,
 <linux-kernel@vger.kernel.org>, <max.oss.09@gmail.com>,
 <devarsht@ti.com>, <geert@linux-m68k.org>
References: <20250616093240.499094-1-j-choudhary@ti.com>
 <CAD=FV=Wb=bWXDfCyF8XhJ93dBRU2rUKM+B0X5uYh39FHRgT1Ww@mail.gmail.com>
 <CAD=FV=V0BL0Mi2i2JR=bNVyBVQ8QA9+j+n6is0NTp8GF=X2yCA@mail.gmail.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <CAD=FV=V0BL0Mi2i2JR=bNVyBVQ8QA9+j+n6is0NTp8GF=X2yCA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hello Doug,

On 23/06/25 21:00, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jun 16, 2025 at 9:24 AM Doug Anderson <dianders@chromium.org> wrote:
>>
>> Hi,
>>
>> On Mon, Jun 16, 2025 at 2:32 AM Jayesh Choudhary <j-choudhary@ti.com> wrote:
>>>
>>> @@ -1220,6 +1231,27 @@ static void ti_sn65dsi86_debugfs_init(struct drm_bridge *bridge, struct dentry *
>>>          debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
>>>   }
>>>
>>> +static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
>>> +{
>>> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>>> +
>>> +       /*
>>> +        * Device needs to be powered on before reading the HPD state
>>> +        * for reliable hpd detection in ti_sn_bridge_detect() due to
>>> +        * the high debounce time.
>>> +        */
>>> +
>>> +       pm_runtime_get_sync(pdata->dev);
>>> +}
>>> +
>>> +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
>>> +{
>>> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>>> +
>>> +       pm_runtime_mark_last_busy(pdata->dev);
>>> +       pm_runtime_put_autosuspend(pdata->dev);
>>
>> nit: you don't need the pm_runtime_mark_last_busy() here, do you? Just
>> call pm_runtime_put_autosuspend().
>>
>> Aside from the nit, this looks reasonable to me now.
>>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> What's the plan here? I can just remove the
> `pm_runtime_mark_last_busy()` and land it if people are on board with
> that (and if it works fine for Jayesh). If Jayesh wants to post a v6
> to make it more legit, I can land that. I probably won't land anything
> myself past Wednesday (California time) since I'm about to go offline
> for 2 weeks and wouldn't want to land and bolt.
> 

Posted v6 with this dropped and the tags picked up:
https://lore.kernel.org/all/20250624044835.165708-1-j-choudhary@ti.com/

Thanks and Warm Regards,
Jayesh


> -Doug
