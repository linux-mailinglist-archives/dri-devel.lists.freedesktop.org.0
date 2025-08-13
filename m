Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7705BB242F3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 09:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A5F10E4C0;
	Wed, 13 Aug 2025 07:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NIZnSNeG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C715910E4C0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 07:42:08 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8AA4379;
 Wed, 13 Aug 2025 09:41:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1755070874;
 bh=pfi0Nlnyj6XBvdl1brm/RguLb44hlUQLAHoSNeBRh+I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NIZnSNeG/y3zjJlbx/lMMBnPESEZaNigQzVv6D2zAT3FBctXVbwq4hacpAzsMiOTd
 Qi1/3fMefr/nF/ZMVjsjnPo3dtF6Ro/yZzS6FVfrv0Kur9LhktlTfSFAql84O1WhtM
 KFRrnagr1C+uYvTpFMgGDFxFjp4ooFUCEGEAaZgw=
Message-ID: <205c11a3-4794-416b-b287-76c853ca4fd2@ideasonboard.com>
Date: Wed, 13 Aug 2025 10:42:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/rcar-du: dsi: Convert register bits to BIT() macro
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
 <20250608142636.54033-2-marek.vasut+renesas@mailbox.org>
 <bc31d938-847d-46a5-af1e-29de3ac21504@ideasonboard.com>
 <7dc2c17d-9879-41c8-b90d-19f92a2d9c1e@mailbox.org>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <7dc2c17d-9879-41c8-b90d-19f92a2d9c1e@mailbox.org>
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

On 12/08/2025 22:32, Marek Vasut wrote:
> On 8/12/25 3:26 PM, Tomi Valkeinen wrote:
> 
> Hi,
> 
>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/
>>> drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>> index a6b276f1d6ee..b3e57217ae63 100644
>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> 
> [...]
> 
>>> @@ -51,11 +51,11 @@
>>>     #define TXVMVPRMSET0R            0x1d0
>>>   #define TXVMVPRMSET0R_HSPOL_HIG        (0 << 17)
>>> -#define TXVMVPRMSET0R_HSPOL_LOW        (1 << 17)
>>> +#define TXVMVPRMSET0R_HSPOL_LOW        BIT(17)
>>
>> I'm not sure about this (and below). We have two defines for the HSPOL,
>> high and low. If one of them is (x << y), shouldn't the other one be of
>> that style too?
> It is inconsistent, but one macro describes bit set to 0 and the other
> bit set to 1 (i.e. the actual bit) which is converted to BIT(n) macro. I
> would be tempted to remove the bits set to 0, that's probably the real
> discussion that should happen here. But that would also be a much bigger
> patch. What do you think ?

In my mind if you have defines for both HIGH and LOW, you have a
bitfield with a value, the values being 0 and 1, and for values you use
(0 << 17) and (1 << 17). It just happens here that the bitfield value is
only one bit long.

But I'm also fine with having only "TXVMVPRMSET0R_HSPOL_LOW
BIT(17)", and then the interpretation is that we have a enable/disable
style bit.

In the end, I'm fine with any of these, or the current one in the patch.
Although the current one does rub me the wrong way just enough for me to
comment about it =).

 Tomi

