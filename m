Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E04274EDAB9
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 15:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C125410E39E;
	Thu, 31 Mar 2022 13:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EEF10E39E
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 13:41:53 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9787E8419D;
 Thu, 31 Mar 2022 15:41:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648734111;
 bh=1lmYhadYKOwyDMOH975Qrh+34yCegxfu7PQbBFmp9cQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SfW2ZIyPTT+byNVv/I/5O5Kck6WR7LOo3ojkDhQrf55//8Mxib7khR/QBJ3UpvcZi
 5tfPJM6QhWecSBnf+Xnv+OdlsXD82kY4O2BA2wPNvP+nvSAt+WpzFUe4GhNYqqUPF1
 OcP2yZVfbdpaJZWE+ZOIBeU/fdmIUd5cTL0XzJBlghb+ZGKawdro2s8xN3v2kkH8Ll
 mSyQ81uoxqDHklZQT1qMvYuI1nfsIcoEBQB2aYOSYIueBcemadxnRH5fnuD10cY0ol
 zEfnLkxMZRC9p6zF0A5yTx7KKQ4IK3K3N6zioMAtAg4nGGBM4N/NJimznt4BAnEoex
 pfdJZZfscTXPg==
Message-ID: <0e684035-50ad-fedd-bd4b-682b7716b5fe@denx.de>
Date: Thu, 31 Mar 2022 15:41:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 00/11] drm: bridge: icn6211: Fix hard-coded panel
 settings and add I2C support
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>
References: <20220318184755.113152-1-marex@denx.de>
 <CAG3jFyt1S3Rwx1t9BRvzy9zoPAwRr98_O-ovjHWHH+nN6b97qw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAG3jFyt1S3Rwx1t9BRvzy9zoPAwRr98_O-ovjHWHH+nN6b97qw@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/31/22 14:02, Robert Foss wrote:
> Hey Marek,

Hi,

> On Fri, 18 Mar 2022 at 19:48, Marek Vasut <marex@denx.de> wrote:
>>
>> This series fixes multiple problems with the ICN6211 driver and adds
>> support for configuration of the chip via I2C bus.
>>
>> First, in the current state, the ICN6211 driver hard-codes DPI timing
>> and clock settings specific to some unknown panel. The settings provided
>> by panel driver are ignored. Using any other panel than the one for which
>> this driver is currently hard-coded can lead to permanent damage of the
>> panel (per display supplier warning, and it sure did in my case. The
>> damage looks like multiple rows of dead pixels at the bottom of the
>> panel, and this is not going away even after long power off time).
>>
>> Much of this series thus fixes incorrect register layout, DPI timing
>> programming, clock generation by adding actual PLL configuration code.
>> This series no longer adds lane count decoding and retains current
>> hard-coded lane count 4 due to disagreement over lane count parsing
>> from DT. The lane count support will come later. The series also fills
>> in a couple of registers with likely correct default values.
>>
>> Second, this series adds support for I2C configuration of the ICN6211.
>> The device can be configured either via DSI command mode or via I2C,
>> the register layout is the same in both cases.
>>
>> Since the datasheet for this device is very hard to come by, a lot of
>> information has been salvaged from [1] and [2].
>>
>> [1] https://github.com/rockchip-linux/kernel/blob/develop-4.19/drivers/gpu/drm/bridge/icn6211.c
>> [2] https://github.com/tdjastrzebski/ICN6211-Configurator
>>
>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>> Cc: Maxime Ripard <maxime@cerno.tech>
>> Cc: Robert Foss <robert.foss@linaro.org>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> To: dri-devel@lists.freedesktop.org
>>
>> Marek Vasut (11):
>>    drm: bridge: icn6211: Fix register layout
>>    drm: bridge: icn6211: Fix HFP_HSW_HBP_HI and HFP_MIN handling
>>    drm: bridge: icn6211: Add HS/VS/DE polarity handling
>>    drm: bridge: icn6211: Add generic DSI-to-DPI PLL configuration
>>    drm: bridge: icn6211: Use DSI burst mode without EoT and with LP
>>      command mode
>>    drm: bridge: icn6211: Disable DPI color swap
>>    drm: bridge: icn6211: Set SYS_CTRL_1 to value used in examples
>>    drm: bridge: icn6211: Implement atomic_get_input_bus_fmts
>>    drm: bridge: icn6211: Add I2C configuration support
>>    drm: bridge: icn6211: Rework ICN6211_DSI to chipone_writeb()
>>    drm: bridge: icn6211: Read and validate chip IDs before configuration
>>
>>   drivers/gpu/drm/bridge/chipone-icn6211.c | 486 ++++++++++++++++++++---
>>   1 file changed, 434 insertions(+), 52 deletions(-)
>>
>> --
>> 2.35.1
>>
> 
> This series looks ready to be merged

I was waiting for 5.18-rc1 to be out and MW closed before picking it 
into drm-misc-next . Maybe I can pick it up now already ?

> , could you fix the remaining
> 'checkpatch --strict' warnings that are applicable?

There are only these left, which I think is OK:
WARNING: Possible unwrapped commit description (prefer a maximum 75 
chars per line)

And then this one strict CHECK, but if I change that the formatting 
looks even uglier:
0010-drm-bridge-icn6211-Rework-ICN6211_DSI-to-chipone_wri.patch

CHECK: Alignment should match open parenthesis
#68: FILE: drivers/gpu/drm/bridge/chipone-icn6211.c:238:
+       chipone_writeb(icn, PLL_REF_DIV,
                     (best_p ? PLL_REF_DIV_Pe : 0) | /* Prefer /2 
pre-divider */

CHECK: Alignment should match open parenthesis
#97: FILE: drivers/gpu/drm/bridge/chipone-icn6211.c:272:
+       chipone_writeb(icn, VACTIVE_HACTIVE_HI,
                     ((mode->hdisplay >> 8) & 0xf) |

CHECK: Alignment should match open parenthesis
#113: FILE: drivers/gpu/drm/bridge/chipone-icn6211.c:284:
+       chipone_writeb(icn, HFP_HSW_HBP_HI,
                     HFP_HSW_HBP_HI_HFP(hfp) |

> Ideally the line
> removal suggested by Maxime would be included too.

This line removal comment has nothing to do with changes in this series, 
it is about the following patch, which is no longer part of this series 
because there is ongoing disagreement about that part and OF graph, so 
that patch will be resubmitted separately later:

[PATCH v4 05/13] drm: bridge: icn6211: Add DSI lane count DT property 
parsing

The continuation of that discussion is already in:

[PATCH] dt-bindings: display: bridge: Drop requirement on input port for 
DSI devices

So this series itself has no outstanding changes pending, unless you 
really want the uglier formatting above.
