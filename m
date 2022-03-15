Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B924F4D9B49
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 13:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292AD10E3E4;
	Tue, 15 Mar 2022 12:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A8510E3E4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 12:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647347568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ng50kpxzvtPViXgByyIi4u1+YwPTs56W0iaR9U1Up70=;
 b=if5HgabsrImU1fNYfoxHLtbogDZIBmDPGV3wpsAFsgfXds0gSSWpFbKDEbT/T/nAo1Nh+S
 16gAEqqAeaJHEDodn5unC28ugyPfyMa5qVIb857/nH6iBRqIgUYcm73nh3wyYo3tpGR1Or
 mznQ+2eVrrWdao2Hq1K69ivB2y4GAL0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-xeiQf51zNxOF1qLwc0noHQ-1; Tue, 15 Mar 2022 08:32:47 -0400
X-MC-Unique: xeiQf51zNxOF1qLwc0noHQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l10-20020a05600c27ca00b0038b85cf8a20so870131wmb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 05:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ng50kpxzvtPViXgByyIi4u1+YwPTs56W0iaR9U1Up70=;
 b=0WEhAjhnth8xAhWCEhVzy58XpStqnZ5VDHJPFs1HxsCAmVIRCfTG34XkP2ldgVomhW
 5tHheq2Q1HGcwltc+lXDuNd3W2LkhVp/Eezqa+z6ErrgCSQ9JmazWa5KufN02HhqO7wn
 UkOJ8E1p6r8buZtthdI9piWVnVww5oAtWG78kTYPW6AGO5qm61hfDjKWLP1wlNdRXAFd
 E9x98mIgrCRVAguvj9QZRfmlSwQVkBPHb143f3yK23z5ql5G675/+p2Nbynw6oZGTVex
 4BqGiKK4f4Vov+8Rg8I1bx4X8s0myjzbyEGpO8Ijws58tptNeFMPNAY+jI261os350uB
 lhiA==
X-Gm-Message-State: AOAM530jtMtNb8QnwAqlHxp+/8KCaDZbyMXVl+vg8ZI+XpWYTEWd40AG
 T+XanavhLEudmqG6gi43DUx3kPCazDAYc+7N+Pw7ikAh5Pvekil79Pod1G6TfsiWEiN8n9E8fBJ
 KpRR5ys9PSFXm/N/CHVc9Du04F8+1
X-Received: by 2002:a7b:c8d7:0:b0:389:c84c:55be with SMTP id
 f23-20020a7bc8d7000000b00389c84c55bemr3214926wml.135.1647347566211; 
 Tue, 15 Mar 2022 05:32:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+lXekobfF9QCg8WpZMIKVPdif6vtRisJZFsCWd/H1zYb7+OeE/XTzOvT+FKqf410LGkjKjg==
X-Received: by 2002:a7b:c8d7:0:b0:389:c84c:55be with SMTP id
 f23-20020a7bc8d7000000b00389c84c55bemr3214909wml.135.1647347565967; 
 Tue, 15 Mar 2022 05:32:45 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 k10-20020adfe3ca000000b001f0329ba94csm24459727wrm.18.2022.03.15.05.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 05:32:45 -0700 (PDT)
Message-ID: <43b88d77-bcba-e6d5-b51f-56c5c8c0318c@redhat.com>
Date: Tue, 15 Mar 2022 13:32:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/5] drm: ssd130x: Reduce temporary buffer sizes
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
References: <20220315110707.628166-1-geert@linux-m68k.org>
 <20220315110707.628166-5-geert@linux-m68k.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220315110707.628166-5-geert@linux-m68k.org>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/15/22 12:07, Geert Uytterhoeven wrote:
> ssd130x_clear_screen() allocates a temporary buffer sized to hold one
> byte per pixel, while it only needs to hold one bit per pixel.
> 
> ssd130x_fb_blit_rect() allocates a temporary buffer sized to hold one
> byte per pixel for the whole frame buffer, while it only needs to hold
> one bit per pixel for the part that is to be updated.
> Pass dst_pitch to drm_fb_xrgb8888_to_mono_reversed(), as we have already

Just drm_fb_xrgb8888_to_mono() since you already fixed the name in patch 1/5.

> calculated it anyway.
> 
> Fixes: a61732e808672cfa ("drm: Add driver for Solomon SSD130x OLED displays")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Indeed. I haven't noticed that got the calculation wrong until you pointed out.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

