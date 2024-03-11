Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447A28788F8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 20:34:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB0D112C3B;
	Mon, 11 Mar 2024 19:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lq5eTZoJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9580B112C3B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 19:34:50 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-51380c106d9so3678012e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 12:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710185688; x=1710790488; darn=lists.freedesktop.org;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vItOGAE1mo8UPNsHcTm5CJt+36XtbkZUfhA7CGS+Q5s=;
 b=lq5eTZoJ/jH4TjdDlaliIOcYIZ+54/ErQ43g8YNHz5FFa2Ngbtpr413+2PhI9K+/sT
 BoZaMZnQGQrnYzfzbJ90mjMqvkNKgjl/tJRiPYspH7yxWy/fIZfACqdbWEg209XIbzW6
 uBZG2ZIprfqlTAnG8NDsY8qhMeSq7eAArcKaDVb5OzgRAfdN7qmBDAY+KWZAR93Ot4z2
 IRDMeOe+ZkMYS6XZBViPjVphC6w8y2Ef/ZOrJyj3HLjcbz55bZrD8pXPPQrIvXaNtPXh
 IdJaARu9MaDO2mdG+d2M6EWUMr6rUScWdgrFWNp715K15NA8r24wHvM79nm4IIBh7CeV
 uMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710185688; x=1710790488;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vItOGAE1mo8UPNsHcTm5CJt+36XtbkZUfhA7CGS+Q5s=;
 b=S3SlupDeCC0kVTpwLneTq2FqheNTiE3FfpDd0bDdz2Fyixg3wAXQMnMSOTCEPlNzAO
 dixcxprYvK32LZuXR0ahw0MBWB0o+4KGoo/pFagvZYb22qelpaM6WUe1K02KInOMV0b0
 6g90BfZfwgCllUdgVe+rQZYEJHEAFseD8ZYKVp5ennUzLrrSsRV6YpyUZvD0+6zAhEUW
 iXRZcDjHTJH7RbqPk0eqX5fqmwpChBfTx2YQn0ai7UQ3W3XYChZEhnxkQ8LiGpTKnXYM
 3dqPGYXWEMMhDw8dCmigCJygDasTRovV2qHAZ5UEHh1U23lN/0ZhY24IXxM2OODLbSi9
 Ztsw==
X-Gm-Message-State: AOJu0YxAq4vw0N0zzZJcppblRqjDRNjc5ahyXBGxjk9TWT4pXbJIdEHj
 gkgmmBgBPou1N0J/C9tBMQ/JhJ74f7YKe8Mdr4TAYZosxv/NLaxu
X-Google-Smtp-Source: AGHT+IGfFhmGTMjXICg8H9pNe3sH/IrXbSxx62pUvcrljYSUXFZpVBbNt84FZwLkCCIVVQukY8Cpsw==
X-Received: by 2002:a05:6512:239f:b0:513:aa43:811b with SMTP id
 c31-20020a056512239f00b00513aa43811bmr2578981lfv.0.1710185688073; 
 Mon, 11 Mar 2024 12:34:48 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com.
 [213.67.237.183]) by smtp.gmail.com with ESMTPSA id
 fb6-20020a056512124600b005139cbb1695sm1143826lfb.264.2024.03.11.12.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 12:34:47 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2] helo=ester)
 by betty.fdsoft.se with esmtp (Exim 4.97.1)
 (envelope-from <frej.drejhammar@gmail.com>)
 id 1rjlQ6-000000004JO-3At1; Mon, 11 Mar 2024 20:34:46 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org,  Russell King <linux@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,  Patrik Jakobsson
 <patrik.r.jakobsson@gmail.com>,  Rob Clark <robdclark@gmail.com>,  Abhinav
 Kumar <quic_abhinavk@quicinc.com>,  Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,  Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>,  Javier Martinez Canillas
 <javierm@redhat.com>,  =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm: Don't return unsupported formats in
 drm_mode_legacy_fb_format
In-Reply-To: <c3203f70-0e8c-493b-813e-1dff93a28323@suse.de> (Thomas
 Zimmermann's message of "Mon, 11 Mar 2024 09:40:25 +0100")
References: <20240310152803.3315-1-frej.drejhammar@gmail.com>
 <c3203f70-0e8c-493b-813e-1dff93a28323@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Mon, 11 Mar 2024 20:34:46 +0100
Message-ID: <ko7bky33d.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
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

Hi Thomas,

Thanks for the review and suggestions. My experience with the drm parts
of the kernel is limited to some weekends trying to fix the regression,
so I'm afraid I have some questions to check my understanding before
making a v2 of the patch.

Thomas Zimmermann <tzimmermann@suse.de> writes:

> I suggest to switch all fbdev code over to drm_driver_legacy_fb_format
> <https://elixir.bootlin.com/linux/latest/C/ident/drm_driver_legacy_fb_format>()
> first and then modify the format indrm_driver_legacy_fb_format
> <https://elixir.bootlin.com/linux/latest/C/ident/drm_driver_legacy_fb_format>()
> after reading it from drm_fb_legacy_fb_format().

I see how doing the format massaging in drm_driver_legacy_fb_format()
would fix the original regression (starting with the format returned by
drm_mode_legacy_fb_format(), drm_fb_legacy_fb_format() is a typo,
right?). As drm_driver_legacy_fb_format() has only two callers,
drm_mode_addfb() and __drm_fb_helper_find_sizes() that change is
probably less likely to do something unintended. As far as I can tell,
drm_driver_legacy_fb_format() is only used when userland hasn't
specified a format or the kernel is initializing and have no format
information. For these code paths it's clear that only formats which are
actually supported by the hardware are meaningful.

What I can't really see is what "switch all fbdev code over to
drm_driver_legacy_fb_format" would entail and what the benefit would
be. How do I determine when drm_mode_legacy_fb_format() should be
replaced with drm_driver_legacy_fb_format()? I have already mistakenly
considered the change to drm_mode_legacy_fb_format() as harmless and
broken ofdrm... Shouldn't it be enough to make
drm_driver_legacy_fb_format() select a format which is supported by the
driver?

Best regards,

Frej


