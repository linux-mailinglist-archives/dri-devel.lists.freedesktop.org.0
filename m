Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466E5CA2253
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 03:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E22110E140;
	Thu,  4 Dec 2025 02:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="Sv5/itSE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m19731110.qiye.163.com (mail-m19731110.qiye.163.com
 [220.197.31.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF88E10E140
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 02:07:48 +0000 (UTC)
Received: from [127.0.0.1] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2be9edc35;
 Thu, 4 Dec 2025 10:07:44 +0800 (GMT+08:00)
Message-ID: <1284bf23-1069-4d54-b259-7b40271f8e0e@rock-chips.com>
Date: Thu, 4 Dec 2025 10:07:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] drm/mcde: Create custom commit tail
To: Linus Walleij <linusw@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Vicente Bergas <vicencb@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
 <20251202-mcde-drm-regression-thirdfix-v6-2-f1bffd4ec0fa@kernel.org>
 <c3c5f62f-98fd-49a7-9b39-c4c4f798ad2c@rock-chips.com>
 <CAD++jLmzkmZAgwbahKDnasj3dDpG4RBggoZfhPiEHj9rb09+eQ@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CAD++jLmzkmZAgwbahKDnasj3dDpG4RBggoZfhPiEHj9rb09+eQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ae71d89a603abkunm6ff8ae635f3078
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0tPTFZLHh4eSE1JGB0fTRhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=Sv5/itSEsRDt7Idjp5+XyunqOgxTrWF+ajneoPKm2CkpDlKGN1/nOH9ogl8y1VDdnnssu1M7dm94Z+kynwqwTWyU4WKLk8paHPgTpmFgXQvQDJuQuviIut8fgv7atpLpoFeEKcz4drz0JUkNdCtJaEviMH1zSdHy/fCixDSg0RA=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=fEyb6s/X54CqQDGTtl8EkHTpjqxUsuwAv/fJrVBHtT0=;
 h=date:mime-version:subject:message-id:from;
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

On 12/4/2025 7:13 AM, Linus Walleij wrote:
> On Wed, Dec 3, 2025 at 7:27 AM Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
> 
>> The bridge document says: "The display pipe (i.e. clocks and timing
>> signals) feeding this bridge will not yet be running when the
>> @atomic_pre_enable is called."
>>
>> Therefore, your approach seems to be merely a workaround and does not
>> meet the current requirements of the bridge.
>>
>> And document also says: "The bridge can assume that the display pipe
>> (i.e. clocks and timing signals) feeding it is running when
>> @atomic_enable callback is called."
>>
>> If DSI commands need to wait for the display pipe (CRTC) to be ready,
>> why not perform them inside @atomic_enable instead of @atomic_pre_enable?
> 
> That was exactly what the v1 and v2 versions of this patch set was
> doing, and it was (politely) NACKed, and that is why we are
> here.
> https://lore.kernel.org/dri-devel/20251023-fix-mcde-drm-regression-v1-0-ed9a925db8c7@linaro.org/
> https://lore.kernel.org/dri-devel/20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org/
>

Hmm, I'm afraid there really isn't a common solution at this point.

The logical enable order of the CRTC, bridge, and panel may be
different from the actual physical enable order. And there is no
mechanism to change this order :(

So I believe your current patch to the mcde makes sense,
because you are indeed requiring the CRTC to be enabled at the
hardware level. But for other platforms, you may need to distinguish
whether this is a software dependency order problem caused by changes
to the bridge enable order.

> In essence, Tomi remarked that drivers should be able to send DSI
> commands at atomic_pre_enable() which is for example
> mapped to the .prepare() callback in the DSI panel bridge.
> And he has a good point in this, I just converted the few panel
> drivers that I was affected by, but there are many more such
> and probably some bridges as well.
> 
> Yours,
> Linus Walleij
> 
> 

-- 
Best, 
Chaoyi
