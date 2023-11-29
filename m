Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D56B27FDDA6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 17:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659DB10E63E;
	Wed, 29 Nov 2023 16:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6739D10E63E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 16:53:07 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5d2d0661a8dso4240127b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 08:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701276786; x=1701881586; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FPGbfDWwX47hn9c1TMZWvz82zmR4+7EsCG8Vv2EabG0=;
 b=CcbBMR7Et8Q4YcZ2KkXiuNlqbF+BFZ2ibFBZiElPMCvXpZV9Rz5m/+JF4RBItPCQph
 U9Znme0fRkgKAV+1OIhRwZ4cHdFQztyeiAxchbpIIcJdL5OB/UpssJmESE+MsEnznR9v
 omszN802ni+S5IS6eeB1NWDIq1IDFaE3cyS6n1Egh8ntl7b6o0dnA3eoEn2MIBkbqUwe
 zjHHljM+uB9ThGyN3TkIer9InApwN0dV48BFv1REvWkyCR78ZMUXVok5yKJQnfiy06I9
 7LRp3xVMh10QvwKjclWx5hDYa+qoeMcs6RhOYXM6XD21k2Lbi/4+orfIIX8kFaMpU3zv
 sFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701276786; x=1701881586;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FPGbfDWwX47hn9c1TMZWvz82zmR4+7EsCG8Vv2EabG0=;
 b=InhlgFuF72ZmMomdQUHQngILn2BpAMJ/GikAANFbvPjZ+HQI8gOlt+8sVwl7OrWWlj
 pt+lncr8lo5834+JxXtU5IBTLfa/IjJ+RYbGqFVmRC5kn5OriRwqcI8XXHvqDBTUGXPf
 nCzdpOD5hNuP38/vbNYR3FdHFduil3DLaRdPBx+tDqPygZJOvPYh0ah+KCO2cc+dtGMT
 Ip64bD3ax4kxOkV8C2xuGVWxIcgGc/Yczk0Na3jHuD+UABgWh81AFf3qscjfGf4Q84iu
 VpOvz2P99kyJwHumiCTLvOfQyS0WpgmUhb1u8ZYymxvnCLmOrrwH7/M6mkDdkbzj5u2V
 rI2A==
X-Gm-Message-State: AOJu0YwWrYaSs3V0b55bwFlmeN+ADj9w8tjTtvLazbIgqeAizWSHGQR0
 6DZYbltw30ntcvkiYamtd1CQtQ==
X-Google-Smtp-Source: AGHT+IGmGSM5NJDfl50YO5yRCBQhZORbGm64vh+8LM76PvjgpggOwuowAv/8NruJzpZ7nIsrkCFYqA==
X-Received: by 2002:a05:690c:26c5:b0:5ce:2148:d4cf with SMTP id
 eb5-20020a05690c26c500b005ce2148d4cfmr17974677ywb.7.1701276786078; 
 Wed, 29 Nov 2023 08:53:06 -0800 (PST)
Received: from aspen.lan ([209.120.180.235]) by smtp.gmail.com with ESMTPSA id
 kd26-20020a05622a269a00b00421b14f7e7csm5700786qtb.48.2023.11.29.08.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 08:53:05 -0800 (PST)
Date: Wed, 29 Nov 2023 11:53:02 -0500
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH v2] backlight: mp3309c: fix uninitialized local variable
Message-ID: <20231129165302.GA18064@aspen.lan>
References: <20231129164514.2772719-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129164514.2772719-1-f.suligoi@asem.it>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 05:45:14PM +0100, Flavio Suligoi wrote:
> In the function "pm3309c_parse_dt_node", when the dimming analog control
> mode (by I2C messages) is enabled, the local variable "prop_levels" is
> tested without any initialization, as indicated by the following smatch
> warning:
>
> drivers/video/backlight/mp3309c.c:279 pm3309c_parse_dt_node() error: uninitialized symbol 'prop_levels'.
>
> To avoid any problem in case of undefined behavior, we need to initialize
> it to "NULL".
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/dri-devel/af0a1870-693b-442f-9b11-0503cfcd944a@moroto.mountain/
> Fixes: 2e914516a58c ("backlight: mp3309c: Add support for MPS MP3309C")
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
