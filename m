Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8276B29FFC4
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EB76E991;
	Fri, 30 Oct 2020 08:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDDC6E946
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 01:18:02 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id x23so2177207plr.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 18:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=6/T1bgNMX0hc7obLwVMGSAc+uvcAnq6mB6Znj0RpZj4=;
 b=QamlEIUF04NHqrdOLu3HlEqGIxbCZMTeDWZLaOyYYaIwjgG8bPGY97mDz5SRffykgk
 2LM0B+k0EopunO8G3uCNnT2utfRb2DJLAu5QC2Rr5GXAS4KCAIj2l99cM+qo0uSjUUyW
 pSDHp/0eK9Ihzh/cFLxsrz3uNL+EFPjLYL9fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=6/T1bgNMX0hc7obLwVMGSAc+uvcAnq6mB6Znj0RpZj4=;
 b=owpJrRO0D8hDX5hla/10UszznNtTHyiwetec/yszgjjmXrKukUsePPHFLhlbsnp/PI
 SugUODqUM8nmmS6ZBTG7kzqKsNAqDzL6guZQpiy5/PYG3xZT1y/ulPjS9/klmnHJWlC5
 L46bBL8vGvk9vZEDn7bL+UkieAzQrxn8lA6TKWIqudHvONe1a1a3qrxG76GJaUOlj3Mg
 dO1ji+GUmD1To04YeGL4QL45wZFnE/DJ6xq5CnnhA3ykGea8c3zt078LE/lcMva0JsL+
 A9hejhUE4gNVfUy3AUoCic+XND3ELhqmX1L8Vieg1SQTv+Uez1S6h3ZFmEzn+4kEE2FX
 Agrw==
X-Gm-Message-State: AOAM532ZVm46A/HW080f9OOlb18oyI+/POdLWKYG6jbV+ylTF/tbH0bF
 ZGWE5n5q9va6GxYOnf8kDH86/w==
X-Google-Smtp-Source: ABdhPJzZFC3ctMbDZuoSYzO/annVO2MRDdW3xmvpRDz3KMTE+zxuQLBGDVnn8zI8L/vzvVOAlnwIYg==
X-Received: by 2002:a17:902:780f:b029:d6:3413:9fe8 with SMTP id
 p15-20020a170902780fb02900d634139fe8mr6827287pll.46.1604020682572; 
 Thu, 29 Oct 2020 18:18:02 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id a10sm1061409pjq.17.2020.10.29.18.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 18:18:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20201029011154.1515687-2-swboyd@chromium.org>
References: <20201029011154.1515687-1-swboyd@chromium.org>
 <20201029011154.1515687-2-swboyd@chromium.org>
Subject: Re: [PATCH 1/4] drm/bridge: ti-sn65dsi86: Combine register accesses
 in ti_sn_aux_transfer()
From: Stephen Boyd <swboyd@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Date: Thu, 29 Oct 2020 18:18:00 -0700
Message-ID: <160402068056.884498.17274332256355831549@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Stephen Boyd (2020-10-28 18:11:51)
> @@ -72,6 +74,7 @@
>  #define SN_AUX_ADDR_19_16_REG                  0x74
>  #define SN_AUX_ADDR_15_8_REG                   0x75
>  #define SN_AUX_ADDR_7_0_REG                    0x76
> +#define SN_AUX_ADDR_MASK                       GENMASK(19, 0)
>  #define SN_AUX_LENGTH_REG                      0x77
>  #define SN_AUX_CMD_REG                         0x78
>  #define  AUX_CMD_SEND                          BIT(0)
> @@ -841,11 +844,13 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>         struct ti_sn_bridge *pdata = aux_to_ti_sn_bridge(aux);
>         u32 request = msg->request & ~DP_AUX_I2C_MOT;
>         u32 request_val = AUX_CMD_REQ(msg->request);
> -       u8 *buf = (u8 *)msg->buffer;
> +       u8 *buf = msg->buffer;
> +       unsigned int len = msg->size;
>         unsigned int val;
> -       int ret, i;
> +       int ret;
> +       u8 addr_len[SN_AUX_LENGTH_REG + 1 - SN_AUX_ADDR_19_16_REG];

I realize now that the SN_AUX_CMD_REG is also here and it has a "go bit"
in it. We can combine another register write here by writing out the
address, length, and request in one go. I rolled that into v2.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
