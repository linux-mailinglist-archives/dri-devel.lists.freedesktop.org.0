Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2741A271F7E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 11:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159CC6E049;
	Mon, 21 Sep 2020 09:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC9B6E048
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 09:58:45 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m6so12072167wrn.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 02:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=etrKK7AWdfHjQZEPismEwo+emoOyvv0qi7+F3B83LVc=;
 b=Xts2EYRCG2w/N/OJ3fzl0hqzFwPYIKoTP8Iu9CNGknrkIr7OED5hp9VtlxxGsivMC/
 h8K0NEYmPbf6k2V5m68i9IK5ShbEibz6yprtkDRjJi3eX5TJup4nCZFMCEhiea3aVwmy
 r8zZbsBZ5a+W60MViEURcsIlHAO36SKE53DgfDGKJcfkpKkTq98GI6v5FC4z3q9L5MHI
 evDxAZSs1TuuX3YoEMy/t0F0uoY4zxXZE+ps3PAAWXmPYGqdL+hlKulY2ZfWXpolPjCR
 UFt1r2g4zZM09jEL7jtjN3Z5zsWe0Y5uMg149UfQL6rRlpARBhfXUTPU0ITvJwisVLpP
 JB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=etrKK7AWdfHjQZEPismEwo+emoOyvv0qi7+F3B83LVc=;
 b=KdCRB44K3J/qUZ+RKnvrYQKuZ5gg4NOX4Ijx5Ni0eeRsDHu3XvgVWabSPtiC34JRUk
 7Uy+kqJ1FFi+MoKqAIJw3cwqeZD+7HOxXe8g3/CW3K+JWtJva5bvfvp2KY58mdqVLZRl
 L3Cl2T0OVHMpmon2P1fEKw0l3iHvUePn4gXkJXQfX+7ZbIpeeSAaQNnnNNWejRlYdQVv
 rAstWbFxZDNPvTsqmGgG8KN2SidClEFP5B3QxYaqilYvRM8TCMD9vocIz1giB5MOAEiU
 kbwk80//xdBSHNL3ZgwczqXm/wCk197nZJJ46i4aNFV3ar5gATMloytcHMY2u8a7/na+
 ERpA==
X-Gm-Message-State: AOAM532RDeWK7+oe6jWMQFu3YJvnsWfnmBnR9X7jUSi0CGH90Hg40uLb
 LyY9+2Go0i1u14n9vrrla+nWsg==
X-Google-Smtp-Source: ABdhPJzDQJjbohCSh9mQgFAafRTgPqozjjSiyF6xbtKdoQjdLehDaCVbpplUKF3fyqRhP1sdxEVsTg==
X-Received: by 2002:a5d:6ac9:: with SMTP id u9mr28205701wrw.46.1600682323904; 
 Mon, 21 Sep 2020 02:58:43 -0700 (PDT)
Received: from [192.168.1.23] (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id l19sm18823113wmi.8.2020.09.21.02.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 02:58:43 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: Use kmemdup cf. kmalloc+memcpy
To: Daniel Vetter <daniel@ffwll.ch>, Alex Dewar <alex.dewar90@gmail.com>
References: <20200909190213.156302-1-alex.dewar90@gmail.com>
 <c14d055d-1f6e-8c46-3a6e-7794ec69e6fe@baylibre.com>
 <89c599d2-6766-df68-5359-7672679b3d89@gmail.com>
 <CAKMK7uEwQhdqmU4+Ri+M9JtYqMmetmK8p9uFrhx1Lp16g=1edA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <7450528b-4204-ce6e-63ed-0976ba412dd5@baylibre.com>
Date: Mon, 21 Sep 2020 11:58:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEwQhdqmU4+Ri+M9JtYqMmetmK8p9uFrhx1Lp16g=1edA@mail.gmail.com>
Content-Language: en-US
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Antonio Borneo <antonio.borneo@st.com>, Philippe Cornu <philippe.cornu@st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Markus Elfring <elfring@users.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/09/2020 10:24, Daniel Vetter wrote:
> On Sat, Sep 19, 2020 at 9:31 PM Alex Dewar <alex.dewar90@gmail.com> wrote:
>>
>> On 2020-09-11 13:57, Neil Armstrong wrote:
>>> On 09/09/2020 21:02, Alex Dewar wrote:
>>>> kmemdup can be used instead of kmalloc+memcpy. Replace an occurrence of
>>>> this pattern.
>> Friendly ping?
>>>>
>>>> Issue identified with Coccinelle.
>>>>
>>>> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
>>>> ---
>>>>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 4 +---
>>>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>>>> index 52f5c5a2ed64..7e9a62ad56e8 100644
>>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>>>> @@ -1049,12 +1049,10 @@ static void debugfs_create_files(void *data)
>>>>      };
>>>>      int i;
>>>>
>>>> -    dsi->debugfs_vpg = kmalloc(sizeof(debugfs), GFP_KERNEL);
>>>> +    dsi->debugfs_vpg = kmemdup(debugfs, sizeof(debugfs), GFP_KERNEL);
>>>>      if (!dsi->debugfs_vpg)
>>>>              return;
>>>>
>>>> -    memcpy(dsi->debugfs_vpg, debugfs, sizeof(debugfs));
>>>> -
>>>>      for (i = 0; i < ARRAY_SIZE(debugfs); i++)
>>>>              debugfs_create_file(dsi->debugfs_vpg[i].name, 0644,
>>>>                                  dsi->debugfs, &dsi->debugfs_vpg[i],
>>>>
>>> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> Neil has commit rights, so I was assuming he'd push this to drm-misc-next.
> -Daniel
> 

Hmm, I applied this already:
commit 33f290811d4c1a09c4e92f5bf0458525835dbcba
Author: Alex Dewar <alex.dewar90@gmail.com>
Date:   Wed Sep 9 20:02:08 2020 +0100

    drm/bridge: dw-mipi-dsi: Use kmemdup cf. kmalloc+memcpy

    kmemdup can be used instead of kmalloc+memcpy. Replace an occurrence of
    this pattern.

    Issue identified with Coccinelle.

    Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
    Acked-by: Neil Armstrong <narmstrong@baylibre.com>
    Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20200909190213.156302-1-alex.dewar90@gmail.com

Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
