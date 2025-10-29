Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F33FC19C56
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 11:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF5310E783;
	Wed, 29 Oct 2025 10:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JDklBsjE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE99410E783
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 10:37:28 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8E7AC73;
 Wed, 29 Oct 2025 11:35:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1761734138;
 bh=jwBaQzKjV6kpwsoIVph1wfQsut1xxi1eIsjuYFMBtGA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JDklBsjEu2Rkzm2oIzg+Dx4K5WBpo7qCadmF0vXxMxy/z1Ik/VhVX1CfZOXFQE92M
 KtXGGdOnkd5tlmCbB8h349avBLO2PQP/Zee3SMEcIFiMru/0tah20/oJHqknpiBrH5
 iNp7YNeoQxyOxCXNycfSzjLz/ZpW8AqQCRl590jo=
Message-ID: <a8e2a977-0bf7-476c-9a45-da7f38954465@ideasonboard.com>
Date: Wed, 29 Oct 2025 12:37:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/11] drm/rcar-du: dsi: Clean up VCLKSET register
 macros
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
 <20251005030355.202242-6-marek.vasut+renesas@mailbox.org>
 <2666bd0f-b2a3-49b4-9458-1b362d9d1b4e@ideasonboard.com>
 <CAMuHMdX0gPyMNF1vwnkEcJRc99MbqXW_5SqSwrdy8BL0Nyugkg@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdX0gPyMNF1vwnkEcJRc99MbqXW_5SqSwrdy8BL0Nyugkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/10/2025 11:57, Geert Uytterhoeven wrote:
> Hi Tomi,
> 
> On Tue, 28 Oct 2025 at 18:15, Tomi Valkeinen
> <tomi.valkeinen+renesas@ideasonboard.com> wrote:
>> On 05/10/2025 06:02, Marek Vasut wrote:
>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>> @@ -246,14 +246,14 @@
>>>
>>>  #define VCLKSET                              0x100c
>>>  #define VCLKSET_CKEN                 (1 << 16)
>>> -#define VCLKSET_COLOR_RGB            (0 << 8)
>>> -#define VCLKSET_COLOR_YCC            (1 << 8)
>>> +#define VCLKSET_COLOR_YCC            (1 << 8) /* 0:RGB 1:YCbCr */
>>>  #define VCLKSET_DIV_V3U(x)           (((x) & 0x3) << 4)
>>>  #define VCLKSET_DIV_V4H(x)           (((x) & 0x7) << 4)
>>> -#define VCLKSET_BPP_16                       (0 << 2)
>>> -#define VCLKSET_BPP_18                       (1 << 2)
>>> -#define VCLKSET_BPP_18L                      (2 << 2)
>>> -#define VCLKSET_BPP_24                       (3 << 2)
>>> +#define VCLKSET_BPP_MASK             (3 << 2)
>>> +#define VCLKSET_BPP_16                       FIELD_PREP(VCLKSET_BPP_MASK, 0)
>>> +#define VCLKSET_BPP_18                       FIELD_PREP(VCLKSET_BPP_MASK, 1)
>>> +#define VCLKSET_BPP_18L                      FIELD_PREP(VCLKSET_BPP_MASK, 2)
>>> +#define VCLKSET_BPP_24                       FIELD_PREP(VCLKSET_BPP_MASK, 3)
>>>  #define VCLKSET_LANE(x)                      (((x) & 0x3) << 0)
>> It probably doesn't matter, but just wanted to mention: here FIELD_PREP
>> is used with, e.g., (3 << 2). GENMASK returns an unsigned value, whereas
>> (3 << 2) is signed.
> 
> Huh?
> 
> Either you use the unshifted value "(define for) 3" with FIELD_PREP(),
> or you use the shifted value "(define for) (3 << 2)" without FIELD_PREP()?
Sure. My point was, VCLKSET_BPP_MASK is a signed value, but GENMASK()
would produce an unsigned value. Normally FIELD_PREP() is used with
GENMASK, i.e. with unsigned mask, but here FIELD_PREP is used with a
signed mask. Does it matter? I don't know, most likely not.

 Tomi

