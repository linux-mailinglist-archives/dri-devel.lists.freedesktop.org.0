Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A162C7C35
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 02:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708526E3F2;
	Mon, 30 Nov 2020 01:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1021 seconds by postgrey-1.36 at gabe;
 Sun, 29 Nov 2020 15:23:38 UTC
Received: from bitmer.com (49-237-179-185.static.tentacle.fi [185.179.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3DD6E1EC
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 15:23:38 +0000 (UTC)
Received: from 88-114-184-87.elisa-laajakaista.fi ([88.114.184.87]
 helo=[192.168.1.42])
 by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <jarkko.nikula@bitmer.com>)
 id 1kjOHN-00068k-2t; Sun, 29 Nov 2020 17:06:21 +0200
Subject: Re: [PATCH] drm/panel: sony-acx565akm: Fix race condition in probe
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20201127200429.129868-1-sebastian.reichel@collabora.com>
 <20201128174647.GE551434@darkstar.musicnaut.iki.fi>
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-ID: <9a143b07-2449-134b-3915-622b8c8a10c5@bitmer.com>
Date: Sun, 29 Nov 2020 17:06:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128174647.GE551434@darkstar.musicnaut.iki.fi>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 30 Nov 2020 01:02:59 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/28/20 7:46 PM, Aaro Koskinen wrote:
> Hi,
> 
> On Fri, Nov 27, 2020 at 09:04:29PM +0100, Sebastian Reichel wrote:
>> The probe routine acquires the reset GPIO using GPIOD_OUT_LOW. Directly
>> afterwards it calls acx565akm_detect(), which sets the GPIO value to
>> HIGH. If the bootloader initialized the GPIO to HIGH before the probe
>> routine was called, there is only a very short time period of a few
>> instructions where the reset signal is LOW. Exact time depends on
>> compiler optimizations, kernel configuration and alignment of the stars,
>> but I expect it to be always way less than 10us. There are no public
>> datasheets for the panel, but acx565akm_power_on() has a comment with
>> timings and reset period should be at least 10us. So this potentially
>> brings the panel into a half-reset state.
>>
>> The result is, that panel may not work after boot and can get into a
>> working state by re-enabling it (e.g. by blanking + unblanking), since
>> that does a clean reset cycle. This bug has recently been hit by Ivaylo
>> Dimitrov, but there are some older reports which are probably the same
>> bug. At least Tony Lindgren, Peter Ujfalusi and Jarkko Nikula have
>> experienced it in 2017 describing the blank/unblank procedure as
>> possible workaround.
>>
>> Note, that the bug really goes back in time. It has originally been
>> introduced in the predecessor of the omapfb driver in 3c45d05be382
>> ("OMAPDSS: acx565akm panel: handle gpios in panel driver") in 2012.
>> That driver eventually got replaced by a newer one, which had the bug
>> from the beginning in 84192742d9c2 ("OMAPDSS: Add Sony ACX565AKM panel
>> driver") and still exists in fbdev world. That driver has later been
>> copied to omapdrm and then was used as a basis for this driver. Last
>> but not least the omapdrm specific driver has been removed in
>> 45f16c82db7e ("drm/omap: displays: Remove unused panel drivers").
>>
>> Reported-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
>> Reported-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
>> Reported-by: Tony Lindgren <tony@atomide.com>
>> Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
>> Reported-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
>> Cc: Merlijn Wajer <merlijn@wizzup.org>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> Fixes: 1c8fc3f0c5d2 ("drm/panel: Add driver for the Sony ACX565AKM panel")
>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> 
I had difficulties with recent kernels. Yesterday's vanilla head
c84e1efae022 and linux-next next-20201127 didn't boot, v5.9.11 had some
other DRM issues. I went back to v5.4.80 which didn't show this panel
issue and was actually working fine. Strange since obviously issue exist
before.

But v5.6.19 was testable, had the issue and this patch fixed it, so

Tested-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
