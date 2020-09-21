Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB9D273C59
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407596E0F2;
	Tue, 22 Sep 2020 07:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B64A6E044
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 10:13:21 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z9so11990751wmk.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=RRqhc8Nlwm2DDwWTkuXckex2GFJqP8TMEjH3RDhwROc=;
 b=lPohekoT479zA+Ink3ei/17Cf5QfQB8rgzWc9VJtDuLwo/MsOu1QdVWHwKW+iXfbFg
 5SgfcvbsnMu91VIR9G54UU6GlwAKmRBLytahyVWxS6L4hpdX7aCEAXODfn3gYoW5BWuP
 FURKAIbbOqYBawyzXKfIiQOsxA7INJeaW/W8yxWMC0oWjEwl7Ery5Akl+M1tdplWCLHd
 ucFb91RYiS3u0qOaPRRwGZitmTr1jp5JwLQ4+91Va/fxq7NrLCfwNchXCL1LOP+VumaJ
 IRSZJMn1NyqsJUrP2WdZbI77gqCA47ZUReO8XyztySW4+Je74/PRinvGgcXOaffFjCKt
 mMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RRqhc8Nlwm2DDwWTkuXckex2GFJqP8TMEjH3RDhwROc=;
 b=EtQi7gf0w9iHwRykkZpjgemd78VJy3tpqzZQ6EslKd9lSM+0NratFdVjs42yHH0xQz
 aTaUBYsIgJsJbXdWCyC99L8sfwBJq0LUQu31vN3wo6tfzjXQ9DOpzyynDbanXq/B6osN
 sAdYYJ7HPDDpCEkLo6IVLG6uBsvYIli5Mxjpfh3RyMDBeWdfjQHt4NuchpHm3oMl57Wb
 JLAwwY8CNk6zyhZPIadKmbHE1uQ12QnSC2tjVO+1ogSXchID6//tVAuYj1pocR0fHifb
 CibTaLuHxGm9B3UNf/YcNRUNCkBy+NGqmnhdCu6tCsQWH71xF2ogltSxj8GXJ5PSGTeA
 lkfg==
X-Gm-Message-State: AOAM533sSKQwbUcYOE47x/D/tk2inJDMP1ismm0GfIRZtqlEIabrUuuV
 p25k5s+d9yA5oC0lI96isQs=
X-Google-Smtp-Source: ABdhPJyr58F+Cvw7KvfAN0WVqdVyAFJTi8qQQfvsHiTASAOUkP4u51PfEcNiAkswmY28OR4OYM/wFQ==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr30590820wml.39.1600683200125; 
 Mon, 21 Sep 2020 03:13:20 -0700 (PDT)
Received: from [192.168.0.18]
 (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
 by smtp.gmail.com with ESMTPSA id y1sm19249095wmi.36.2020.09.21.03.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 03:13:19 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: Use kmemdup cf. kmalloc+memcpy
To: Neil Armstrong <narmstrong@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20200909190213.156302-1-alex.dewar90@gmail.com>
 <c14d055d-1f6e-8c46-3a6e-7794ec69e6fe@baylibre.com>
 <89c599d2-6766-df68-5359-7672679b3d89@gmail.com>
 <CAKMK7uEwQhdqmU4+Ri+M9JtYqMmetmK8p9uFrhx1Lp16g=1edA@mail.gmail.com>
 <7450528b-4204-ce6e-63ed-0976ba412dd5@baylibre.com>
From: Alex Dewar <alex.dewar90@gmail.com>
Message-ID: <274b0d15-25dc-27cb-dade-6f12c71e88e6@gmail.com>
Date: Mon, 21 Sep 2020 11:13:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7450528b-4204-ce6e-63ed-0976ba412dd5@baylibre.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:38 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Hmm, I applied this already:
> commit 33f290811d4c1a09c4e92f5bf0458525835dbcba
> Author: Alex Dewar <alex.dewar90@gmail.com>
> Date:   Wed Sep 9 20:02:08 2020 +0100
>
>      drm/bridge: dw-mipi-dsi: Use kmemdup cf. kmalloc+memcpy
>
>      kmemdup can be used instead of kmalloc+memcpy. Replace an occurrence of
>      this pattern.
>
>      Issue identified with Coccinelle.
>
>      Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
>      Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>      Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>      Link: https://patchwork.freedesktop.org/patch/msgid/20200909190213.156302-1-alex.dewar90@gmail.com
>
> Neil
Sorry! My bad. Thanks for applying :)

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
