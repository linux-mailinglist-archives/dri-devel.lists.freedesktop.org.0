Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4C04D22BF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 21:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD49110E3EE;
	Tue,  8 Mar 2022 20:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F37210E3EE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 20:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646771914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FoBRIeqgLPupnZmRM+iNXvFKf6bd3tq0ykamYd2tTu8=;
 b=S9O8+Imm/ywyEPqtBTfFS6pyMnS9ivbZH2YcsV9W4OkgJf2LsLY/Qr7osnaTz/emez0Ou/
 Xu2C74ottis+u+9yElzMkoQ/GUafYuU7z/ilGwQNmhkHxYPGXWbfBAAeDqRKKN9ET6yLE6
 T1wX00o9/g4FeGGebLGQ6Y23kwyQCGo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-vX4b0A8SPl2tZrWDANW7OQ-1; Tue, 08 Mar 2022 15:38:33 -0500
X-MC-Unique: vX4b0A8SPl2tZrWDANW7OQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 f189-20020a1c38c6000000b0037d1bee4847so1628431wma.9
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 12:38:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FoBRIeqgLPupnZmRM+iNXvFKf6bd3tq0ykamYd2tTu8=;
 b=ufGfvrdSvkE+Xv20m8Fyq3gJwPaIoYkqG59unZClt8feaQhMawhKiwDztBN4potQBK
 ZFNcbMpGKbi7R/w9Q1ipJbEqczJdb38meNagKtbuEIHo4OOn50aJwVY6HT26y3qC04Vu
 39r2ifIYv2E3cK5ZW5xuyYkFJddHFi/4gGLPnlC8rFYPcAB7XscpAE+e8Glzb2TkHH1A
 5sKQmH2gSrFNvX1zu2c5kZ4BGtdl0eZUtHKsVGZneWEHjkOMf7eM/LCVWkFlrlvIrSCE
 h9Q1L2ZmrFn9h2IAG7+V3m/IKfHn2Xdag60pW+pJU5X0b2/z7JNgFta93TZhm8x3vAIR
 ee3w==
X-Gm-Message-State: AOAM533a1DDaXLX6xMp6/Nu36JdVOfmfN2Ky/F6Qhd8HACdC6KOeTXdK
 GyiOmTvElXx2q3IV1duRJ/WpySNrRWdS6gqugwWj+9fgYxjKoajljs7hQQEw9TTjdt7t+d+kB2i
 vUzpPBPQDGvZR38gUkjoztsNG1JJ2
X-Received: by 2002:a05:6000:1a8f:b0:1e8:3301:1273 with SMTP id
 f15-20020a0560001a8f00b001e833011273mr13579027wry.707.1646771910930; 
 Tue, 08 Mar 2022 12:38:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyACu+l5d8zlO5fn6jeLt1osubbTuoLy1Qt9BUBcsvksAAefifa1CtOLhGbeqsEGUGu19bi4g==
X-Received: by 2002:a05:6000:1a8f:b0:1e8:3301:1273 with SMTP id
 f15-20020a0560001a8f00b001e833011273mr13579012wry.707.1646771910702; 
 Tue, 08 Mar 2022 12:38:30 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a05600012cc00b001f059bcbd7asm13726134wrx.31.2022.03.08.12.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 12:38:30 -0800 (PST)
Message-ID: <85ed6113-ad81-94a2-14ac-b5046139e217@redhat.com>
Date: Tue, 8 Mar 2022 21:38:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] drm: ssd130x: Always apply segment remap setting
To: Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220308160758.26060-1-wens@kernel.org>
 <20220308160758.26060-2-wens@kernel.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220308160758.26060-2-wens@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/8/22 17:07, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Currently the ssd130x driver only sets the segment remap setting when
> the device tree requests it; it however does not clear the setting if
> it is not requested. This leads to the setting incorrectly persisting
> if the hardware is always on and has no reset GPIO wired. This might
> happen when a developer is trying to find the correct settings for an
> unknown module, and cause the developer to get confused because the
> settings from the device tree are not consistently applied.
> 
> Make the driver apply the segment remap setting consistently, setting
> the value correctly based on the device tree setting. This also makes
> this setting's behavior consistent with the other settings, which are
> always applied.
>

Nice catch. This is certainly much better. Thanks!
 
> Fixes: a61732e80867 ("drm: Add driver for Solomon SSD130x OLED displays")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

