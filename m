Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 209274D9B34
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 13:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21E810E40B;
	Tue, 15 Mar 2022 12:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17AD10E3C3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 12:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647347311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rCUHLPHxtaZMWaxTPw6z/f+D0oxFiu0iBaxXSexErqs=;
 b=Lp+isdudoJMVhXXHiVqTL53v4U7TRCKEVu/Dt3mIqIM5w0taaZXKg2sYJsFqekqYVS0SI7
 r39aPfcg5NGwIaWMPP9rGaAuuLZ5Sqn37IGms182wvT+3axWJfduLU7Utz8bYa2x8mxWZt
 NB71n2BWoEjm/Cik3tA+GAUEanrCkk4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-Q0rcm1FkPcOU2Xw3_Zhy4Q-1; Tue, 15 Mar 2022 08:28:30 -0400
X-MC-Unique: Q0rcm1FkPcOU2Xw3_Zhy4Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 j42-20020a05600c1c2a00b00381febe402eso1188000wms.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 05:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rCUHLPHxtaZMWaxTPw6z/f+D0oxFiu0iBaxXSexErqs=;
 b=bPV46i+R2WpKQ/zDpsG0VAT7Ed/6GlH9mTT49KXEuWZM6l3tVUqRp0OqABSkBFgvKk
 lPBlLAih/5FIn2PHQ6wxJmLh8KgmRzIDZQVnOBntiO2aF+kvTfoD1sMpG7dBdznhjSn1
 LoztrQOkrSFCLCZvHuAuwyxffnYhINsAiiEJDpL45iazbWCA/SGdLCkI7QPn1f6CWBji
 M7xuBgwTRLlhDhcD6Y/EAv8xYnTf9CuNw6Qd+dF/ljz96vfGEvc5GOcPHXF1CaWabfGQ
 D42U+WMQyFSfzYI4aa7Sxw8/rEEvuQUCoziFUPLnqZuPHb6pOPi8TZb/EuXVOYKZVnnK
 yOLg==
X-Gm-Message-State: AOAM533MkdnkVjakmQdiEZWFQTA6AEV0eaEZOi06Pk6WLyYUPdZxDmaK
 jxiP7iIoAYIVa+aaV80ohNJs/ibCEy5l556iv6kYh/BZNExMB4O6KM1TqUGbEOSki7YBFpvQs4h
 veKm0pCcYfK2iiAfxpMArLoLnrdKu
X-Received: by 2002:adf:f6d0:0:b0:1f0:7ab4:f905 with SMTP id
 y16-20020adff6d0000000b001f07ab4f905mr20351582wrp.54.1647347309440; 
 Tue, 15 Mar 2022 05:28:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbsddZ89uZLO7jWyVAF+5O7Ev+loDx2qrY1pk1jcg4dS2xrgd+LAlcmE3FuBvM05QobW9sOQ==
X-Received: by 2002:adf:f6d0:0:b0:1f0:7ab4:f905 with SMTP id
 y16-20020adff6d0000000b001f07ab4f905mr20351558wrp.54.1647347309175; 
 Tue, 15 Mar 2022 05:28:29 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a5d554b000000b001f0326a23ddsm15815149wrw.70.2022.03.15.05.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 05:28:28 -0700 (PDT)
Message-ID: <2b735f7b-68df-4a35-466e-e5d8cd2ad36a@redhat.com>
Date: Tue, 15 Mar 2022 13:28:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/5] drm: ssd130x: Fix rectangle updates
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
References: <20220315110707.628166-1-geert@linux-m68k.org>
 <20220315110707.628166-4-geert@linux-m68k.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220315110707.628166-4-geert@linux-m68k.org>
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
> The rectangle update functions ssd130x_fb_blit_rect() and
> ssd130x_update_rect() do not behave correctly when x1 != 0 or y1 !=
> 0, or when y1 or y2 are not aligned to display page boundaries.
> E.g. when used as a text console, only the first line of text is shown
> on the display.
> 
>   1. The buffer passed by ssd130x_fb_blit_rect() points to the first
>      byte of monochrome bitmap data, and thus has its origin at (x1,
>      y1), while ssd130x_update_rect() assumes it is at (0, 0).
>      Fix ssd130x_update_rect() by changing the vertical and horizontal
>      loop ranges, and adding the offsets only when needed.
> 
>   2. In ssd130x_fb_blit_rect(), align y1 and y2 to the display page
>      boundaries before doing the color conversion, so the full page
>      is converted and updated.
>      Remove the correction for an unaligned y1 from
>      ssd130x_update_rect(), and add a check to make sure y1 is aligned.
> 
> Fixes: a61732e808672cfa ("drm: Add driver for Solomon SSD130x OLED displays")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Thanks for fixing this too.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

