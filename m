Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB6FB3DE79
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 11:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FED610E3ED;
	Mon,  1 Sep 2025 09:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Q+mTvftj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3AB10E3ED
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 09:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756718978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gLIfWutU/YiglT+ISVkDDOc433nVPWRihDwo9lIf2vg=;
 b=Q+mTvftjPt2UBB3eYmjserIqr5N0eZVngI7XZBoWAONT/Hnt008KGmjrAbReHMUe4Y2oGC
 SSidZanwX5dHfWciml5vtXTwsOuKXB2stmAi/jTreajqLpJDmSzVGxoVWhhZAedL+PVr84
 T8lTJR+Z0LPOUR67zXDcZWIrm4vx9gQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-kXZVplfgNfucArwaytZEBQ-1; Mon, 01 Sep 2025 05:29:37 -0400
X-MC-Unique: kXZVplfgNfucArwaytZEBQ-1
X-Mimecast-MFC-AGG-ID: kXZVplfgNfucArwaytZEBQ_1756718976
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45b883aa405so10363035e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 02:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756718976; x=1757323776;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gLIfWutU/YiglT+ISVkDDOc433nVPWRihDwo9lIf2vg=;
 b=EDxsnDQWJ80ePpevNeEqwaW8ftQ58Ie/WxONJVftKoeL+8yI1mPKud3U7YuJBCkhgB
 aXcmP4N1VQvCUxrLbFxdytKkoS7ygrZq+G77UKRxZGgXy5DP+TgrxG4Z7yLpdJWU+r46
 Kj175HzhZjqcqMHlc2CekRLMCw3fvH4/H68Pt4B9E/JSN5quzXIvGEBC+G5N1k+hbCXN
 Ggz85OcLsJcEyEFV+w/ml1kGQ4l/cPQ+LkR8VEgz73nvpjVrhnE/FpD7TPbIk5kB7n2C
 bSqNrLa9eGm5yxFiwT7E9xkmrTH7QRZ6IVrXhEPYnfGURb3MT+cqEp249L9vOh/3QWhl
 xFGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPmnOPu5o6V3OZoaJf/4MeJpvGyujwLWn3F/6JImFQ7pS7DL4lbKeI2GiTWkloeMFDSFZkzjQOelo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4OhjhXjvXFdGu7wg1xU6+uWxDmUdp75CEiyeiUi59dI/GwsEk
 T018Nu0pupRFbXORLbXqQqn3sycQHVR4h25XnYxHHYPqOfVP0miXOEqknVegpWQaRDJ826Lrc8O
 OyOALLcAZll6RLbH8TO3IicrWNE0K8U8mcbb/F1nAnOSuNZbldEHI0vBlMSaR9NloSK9dkQ==
X-Gm-Gg: ASbGnct2TycyUCIFmugizbueVEAYoRhXb6rH8GqdJTYk3CvbOedu4S93Zrra8A2sc2D
 +obF+fBSIQ0XG0+TfEMxiT40NoytDscdSve4MGvYeAhwOTrq9xB93jLFeehPpYnWlYnBhs8ypdU
 Q7FbdQ9gXEfnHabHEvZ9EO3OERaypImU6eyo0q6UYWYUY1YcaQuFlL8JE8zzbU/22e4slGgqYZj
 dLZD2A+MwvQraVQlzCkAXSeUDqscgalZinfuAQIfzx1ZzBjmtN8eYg18ullKJJuFKd9gfiHbpqA
 r2uDKOpwmwuJhgrKJiMZDmDAraNFHha1FWXiDb9bAOAQ504KIs0DpBq628709z1Lsg==
X-Received: by 2002:a05:600c:1d07:b0:453:2066:4a26 with SMTP id
 5b1f17b1804b1-45b8553417fmr73118795e9.16.1756718976026; 
 Mon, 01 Sep 2025 02:29:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv92lhrsAt3OXKOOSRcUvb13YtIbGD8LLn3o0PT6k8/S7ZFs5axHkJaP2LWNR34AeeM9XjJw==
X-Received: by 2002:a05:600c:1d07:b0:453:2066:4a26 with SMTP id
 5b1f17b1804b1-45b8553417fmr73118475e9.16.1756718975616; 
 Mon, 01 Sep 2025 02:29:35 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b73cf86f4sm207079325e9.6.2025.09.01.02.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:29:34 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, David
 Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Maxime Ripard <mripard@kernel.org>, Simona
 Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/sitronix/st7571-i2c: Make st7571_panel_data
 variables static const
In-Reply-To: <w4tlpcw6s6yogacneo4gthor5annn3qjyxswrtrisoqawdbf3p@y5r7gkrmzmdo>
References: <20250718152534.729770-1-javierm@redhat.com>
 <w4tlpcw6s6yogacneo4gthor5annn3qjyxswrtrisoqawdbf3p@y5r7gkrmzmdo>
Date: Mon, 01 Sep 2025 11:29:33 +0200
Message-ID: <874itmv7uq.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: liPIvfv_fY6wVE4RnFp-nZ6iYagZ4f7Zuw4wvbxbpEw_1756718976
X-Mimecast-Originator: redhat.com
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

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:

> On Fri, Jul 18, 2025 at 05:25:25PM +0200, Javier Martinez Canillas wrote:
>> The kernel test robot reported that sparse gives the following warnings:
>> 
>> make C=2 M=drivers/gpu/drm/sitronix/
>>   CC [M]  st7571-i2c.o
>>   CHECK   st7571-i2c.c
>> st7571-i2c.c:1027:26: warning: symbol 'st7567_config' was not declared. Should it be static?
>> st7571-i2c.c:1039:26: warning: symbol 'st7571_config' was not declared. Should it be static?
>>   MODPOST Module.symvers
>>   LD [M]  st7571-i2c.ko
>> 
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202507180503.nfyD9uRv-lkp@intel.com
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>> 
>> Changes in v2:
>> - Also make the st7571_panel_data variables to be const (Thomas Zimmermann).
>> 
>>  drivers/gpu/drm/sitronix/st7571-i2c.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

