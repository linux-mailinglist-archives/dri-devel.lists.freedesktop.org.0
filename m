Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200269AB4DA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 19:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB8510E059;
	Tue, 22 Oct 2024 17:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="EaAQh3rj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com
 [91.218.175.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD6C10E059
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 17:20:14 +0000 (UTC)
Message-ID: <84f6fe15-a1e8-4219-9b14-7d6c2a165890@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1729617612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FmOdIY0cSAiBlqXkHUrcDk1nQ2vkHpftSfWWemsmT1E=;
 b=EaAQh3rj8mdCldBGEZ1KCTqQX1x1BklkHeiTWdX92FiR/S36q5gsKlYWFkxvTdgRafUrl5
 fk3IANL02FtNzahMorYnvHeM4dVhCsuPJvlAnD536zp9GAGcAgEeCl82Dk984u9oxwtAkj
 JTKTvPRol4acO6J4XMk8RB0PepAJM6s=
Date: Tue, 22 Oct 2024 22:49:40 +0530
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: Re: [PATCH v5 13/13] drm/bridge: cdns-dsi: Use
 pre_enable/post_disable to enable/disable
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dominik Haller <d.haller@phytec.de>, Sam Ravnborg <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>
References: <20241019195411.266860-1-aradhya.bhatia@linux.dev>
 <20241019200530.270738-1-aradhya.bhatia@linux.dev>
 <20241019200530.270738-6-aradhya.bhatia@linux.dev>
 <m7t4hsa3lcszjbipxlypf655uspoxw3xfyy5jo3n3bnmqaiqcf@6wti5f477gve>
 <c8a42d96-c02e-4ce0-acd8-3fdc5eecd208@linux.dev>
 <CAA8EJprWwKyyh5JvsmXnJC7QbybxEmwnAceMBgUr96uGzEJMtQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAA8EJprWwKyyh5JvsmXnJC7QbybxEmwnAceMBgUr96uGzEJMtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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



On 10/22/24 00:09, Dmitry Baryshkov wrote:
> On Mon, 21 Oct 2024 at 20:07, Aradhya Bhatia <aradhya.bhatia@linux.dev> wrote:
>>
>> Hi Dmitry,
>>
>> Thank you for reviewing the patches!
>>
>> On 10/20/24 17:27, Dmitry Baryshkov wrote:
>>> On Sun, Oct 20, 2024 at 01:35:30AM +0530, Aradhya Bhatia wrote:
>>>> From: Aradhya Bhatia <a-bhatia1@ti.com>
>>>>
>>>> The cdns-dsi controller requires that it be turned on completely before
>>>> the input DPI's source has begun streaming[0]. Not having that, allows
>>>> for a small window before cdns-dsi enable and after cdns-dsi disable
>>>> where the previous entity (in this case tidss's videoport) to continue
>>>> streaming DPI video signals. This small window where cdns-dsi is
>>>> disabled but is still receiving signals causes the input FIFO of
>>>> cdns-dsi to get corrupted. This causes the colors to shift on the output
>>>> display. The colors can either shift by one color component (R->G, G->B,
>>>> B->R), or by two color components (R->B, G->R, B->G).
>>>>
>>>> Since tidss's videoport starts streaming via crtc enable hooks, we need
>>>> cdns-dsi to be up and running before that. Now that the bridges are
>>>> pre_enabled before crtc is enabled, and post_disabled after crtc is
>>>> disabled, use the pre_enable and post_disable hooks to get cdns-dsi
>>>> ready and running before the tidss videoport to get pass the color shift
>>>> issues.
>>>>
>>>
>>> Not being an expert in the TI DSS driver, would it be more proper to
>>> handle that in the TI driver instead? I mean, sending out DPI signals
>>> isn't a part of the CRTC setup, it's a job of the encoder.
>>
>> I haven't done a feasibility analysis of moving the CRTC bits of TIDSS
>> into the encoder, but even if it were possible, it wouldn't solve the
>> issue.
>>
>> The bridge_enable() sequence gets called _after_ the encoder has been
>> enabled - causing the TIDSS's DPI (enabled from encoder) to still be
>> up and running before the DSI has had a chance to be ready.
> 
> But then you can move CDSI setup to pre_enable, so that all setup
> happens before encoder's (= DPI) being enabled.
> 
> 

Ah! I did not realize that you were suggesting against moving
_bridge_pre_enable() to before crtc_enable().

I think, despite its initial complexity, it is a good idea to move the
_bridge_pre_enable() before the crtc_enable().

The boundary between an encoder and a CRTC in the modern display
hardware seems to have blurred a bit. Maybe the tidss / cdns-dsi is a
unique case (only for now), but of course, tidss is not
the only one generating the DPI signal from the CRTC.

And bridges should be allowed an option to get _some_ configuration done
before the CRTC and encoder are up and running, and I think that's where
the re-ordering is of the essence.

My initial version did suggest creating a new API[0], "_early_enable()"
that allowed _pre_enable() to remain where it is, all the while allowing
the bridges to have the option of configuring before the signals start
getting generated in the pipeline. That idea was then translated into
the current one.


Regards
Aradhya


[0]: https://lore.kernel.org/all/20240511153051.1355825-7-a-bhatia1@ti.com/
