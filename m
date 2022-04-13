Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B674FEE0B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 06:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395E910FE36;
	Wed, 13 Apr 2022 04:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C432D10FE36
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 04:03:09 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 893C38141C;
 Wed, 13 Apr 2022 06:03:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649822588;
 bh=wttltrNzo/PmwQ1AM6B+Ii618PxA5/oZKAoEqpNw8XY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=q1kXULDJ4l/WZo2KN8W5LZ4XPyVb7j9XZossuwcDjur5/EwhXC/FsgMfkVZs5xdNI
 AZgc6h3h7o34dRv+gb5jbiPMqhWDRMjzht7I92km2OVzKhyYD2688MEy3O5c/W2At6
 548a+WhWw0oY7heQcj1IcvARLn77GHstyWuWe93kTyQIodDKTUEPSr+VFSMI47b5Wc
 8erejteLuidB1d4f+dbTUUlSK4CpxXqwoIANYis/+tXVbKp15m8pbs8UL0kP2/THuo
 Zrw4c2OTDnurp7domQr/6c8Ij+8haczUx7Wrq/VXwRxXiAcRgGENP6clb96NFl0wlU
 qXyfwavOO0h+Q==
Message-ID: <a2494aba-f84a-bd28-81d6-c0e1cc560b19@denx.de>
Date: Wed, 13 Apr 2022 06:03:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] drm/panel: lvds: Simplify mode parsing
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220401162154.295152-1-marex@denx.de>
 <Yk7II6F7edZ/uEdF@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Yk7II6F7edZ/uEdF@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <digetx@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/7/22 13:16, Laurent Pinchart wrote:
> Hi Marek,
> 
> Thank you for the patch.
> 
> On Fri, Apr 01, 2022 at 06:21:53PM +0200, Marek Vasut wrote:
>> The mode parsing is currently implemented in three steps:
>> of_get_display_timing() - DT panel-timing to struct display_timing
>> videomode_from_timing() - struct display_timing to struct videomode
>> drm_display_mode_from_videomode() - struct videomode to struct drm_display_mode
>>
>> Replace all that with simple of_get_drm_panel_display_mode() call,
>> which already populates struct drm_display_mode and then duplicate
>> that mode in panel_lvds_get_modes() each time, since the mode does
>> not change.
>>
>> Nice bonus is the bus_flags parsed by of_get_drm_panel_display_mode()
>> out of panel-timing DT node, which is used in subsequent patch to fix
>> handling of 'de-active' DT property.
>>
>> Tested-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Dmitry Osipenko <digetx@gmail.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Robert Foss <robert.foss@linaro.org>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> To: dri-devel@lists.freedesktop.org
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

If that's OK with everyone, I will apply those soon.
