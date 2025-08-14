Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC93B25ADC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 07:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2D210E103;
	Thu, 14 Aug 2025 05:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ffmlZpE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B77D10E103
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 05:39:29 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2745A15B2;
 Thu, 14 Aug 2025 07:38:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1755149913;
 bh=zzyLMYb+/GSeAGpdZe6nYcCoHf6i1PqZizfwR4H7H58=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ffmlZpE2Rmkrfx5OfRa0jGcp/L0sIprylhGlIHvG7ybgh8vSElGVOVyilEiqJVOaN
 gsK83J3TJ2QO3omOnN5hV6+0wL3eFzIhlPQt6CCR/OWogX89oNibYmbdlInFrL5t5i
 7awEoQeFP2GXn2xskWRJdcYi7sNysMTWoqKCOL60=
Message-ID: <7c92c10b-bfe0-4782-9fbf-272c9616f5ca@ideasonboard.com>
Date: Thu, 14 Aug 2025 08:39:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/rcar-du: dsi: Remove fixed PPI lane count setup
To: Marek Vasut <marek.vasut@mailbox.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20250608142636.54033-1-marek.vasut+renesas@mailbox.org>
 <20250608142636.54033-3-marek.vasut+renesas@mailbox.org>
 <64b49da6-15ae-45e1-a4af-c1f08f80cf3a@ideasonboard.com>
 <87cc32a7-fe1d-4d8d-b793-e3bb7e12fb7d@ideasonboard.com>
 <1ae735be-3d07-4520-8013-c4b7a1b1c26a@mailbox.org>
 <c83317d5-53f1-440e-b854-c75d283ed746@ideasonboard.com>
 <58109767-145b-414f-a20e-aee651e9e4d5@mailbox.org>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <58109767-145b-414f-a20e-aee651e9e4d5@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

On 14/08/2025 00:06, Marek Vasut wrote:
> On 8/13/25 9:34 AM, Tomi Valkeinen wrote:
> 
> Hi,
> 
>>>>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/
>>>>>> drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>>>>> index b3e57217ae63..cefa7e92b5b8 100644
>>>>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>>>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>>>>> @@ -80,10 +80,7 @@
>>>>>>     * PHY-Protocol Interface (PPI) Registers
>>>>>>     */
>>>>>>    #define PPISETR                0x700
>>>>>> -#define PPISETR_DLEN_0            (0x1 << 0)
>>>>>> -#define PPISETR_DLEN_1            (0x3 << 0)
>>>>>> -#define PPISETR_DLEN_2            (0x7 << 0)
>>>>>> -#define PPISETR_DLEN_3            (0xf << 0)
>>>>>> +#define PPISETR_DLEN_MASK        (0xf << 0)
>>>>>>    #define PPISETR_CLEN            BIT(8)
>>>>>
>>>>> Looks fine, but do you know what the TXSETR register does? It also has
>>>>> LANECNT, but I don't see the driver touching that register at all.
>>>>> TXSETR:LANECNT default value is 3 (4 lanes), which matches with the
>>>>> old
>>>>> hardcoded behavior for PPISETR... So I wonder if that register should
>>>>> also be set?
>>>>
>>>> Ah, never mind, I now saw the patch 3 =). But should it be before patch
>>>> 2? Hmm, I guess that ordering is no better. Should they be combined
>>>> into
>>>> "support 1,2,3 datalanes" patch?
>>> I think each patch fixes slighly different issue, even if the issues are
>>> related. I tried to keep the issue description in each patch commit
>>> message for posterity. I can squash them if you think that's better, I
>>> don't mind either way.
>>
>> I was thinking about this the user's or backporting point of view.
>> Neither of the commits (clearly) say that they add support for 1/2/3
>> lane modes.
> 
> The 1/2/3 lane mode was already implemented in the driver, except it was
> broken.

If it never worked, was it broken or not implemented? How much code the
original driver must have for the feature to have the feature
"implemented, just broken"? If it reads the num lanes from the DT, and
allows the driver to probe with 1-4 lanes, is it then "implemented, but
broken"? Or does the driver have to have a clear intent on having the
feature (even if it doesn't work) for it to be implemented?

I'm not trying to be annoying here, and I'm fine with the new patch you
sent. I bring this topic up as I just had a similar discussion in a
thread for another patch series, and the answer is not clear to me.

stable-kernel-rules.rst doesn't really cover this case, so, afaics,
someone could argue that this (well, the new one you sent) is not valid
stable patch: it doesn't fix a crash/hang/etc, it adds support for more
lane setups.

In this particular case I'm fine calling this a fix, and backporting to
stable, as the patch is such a small one and "obviously correct" (as
stable-kernel-rules.rst says) because with the only working lane setup,
4-lanes, we can easily see that the values written to registers are
identical to default/old values.

Still, if someone has feedback on how to approach this question, I
wouldn't mind hearing the thoughts =).

>> You say they "fix", but they're not quite fixes either. The
>> patch 3 could be considered a fix, but at the moment it just writes the
>> default value to the register, so no point in marking it as a fix to be
>> backported.
> 
> 3/4 does write the DSI lane count into TXSETR , not the default value.

I meant that as only the 4-lane mode works, I must assume all the users
use 4-lane mode. Thus with patch 3, a value identical to the default
value gets written, as everyone uses 4 lanes. So, if it's backported to
kernels where everyone uses 4 lanes, it won't change anything.

 Tomi

