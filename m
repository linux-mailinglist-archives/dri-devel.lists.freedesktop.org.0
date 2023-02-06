Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF39F68C615
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 19:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244CC10EA00;
	Mon,  6 Feb 2023 18:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DC710EA00
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 18:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675709238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hZ8casbfFD6TcKT9nSSfpPqsT0aAOl1x1pNCxblmoQc=;
 b=Z6K9tfvlj08KN9rJU//0ZIFPZurAa2+qQQ9uyPYHba6J/3wlt3fmm3FeunIhlNP3DwMjAX
 q+mxtyTPx8CYdLyDoEkpAsC8/1Mu/FH9x9QQI+ejaFqPg/L0Ty2m2gJJomHnIUFqqEQ725
 FD4LMObxLA1W0jd/a7lo9ATsFZfJYhs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-7v_t-o08Nc-xkS0lO9aaxw-1; Mon, 06 Feb 2023 13:47:16 -0500
X-MC-Unique: 7v_t-o08Nc-xkS0lO9aaxw-1
Received: by mail-wm1-f72.google.com with SMTP id
 d14-20020a05600c34ce00b003dd07ce79c8so6978184wmq.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 10:47:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hZ8casbfFD6TcKT9nSSfpPqsT0aAOl1x1pNCxblmoQc=;
 b=VsHILRyWf3s23YhNk/Bempda0R7Z4et87GXGF1ppcTWl/fOpjswv1FvKmU07LGmlsl
 C5hcrLQHjOupdxLnAWkvhaJzEaav9TSOfSzTTbg34yHur9lolFYyDm0wxyxbsg5APMhn
 OClwdnm44SaP1sdX/nyrZBCsaAHWEONwRgKy009ECbRkPTBxbY24OkbHb422af5Pb6NO
 T3nXUmGJ3xpY884fqVfXbBoiNliSqGcgvgLARXcOKnH1NKCrcPG2IIwdd54jzAnSSK6m
 LiSgmeCufnek84BXwIWy/u7k1KyvtAmmozs1XFXopWNAdQzRAc3UuOWXVtAvT0zEmK4Q
 uf3w==
X-Gm-Message-State: AO0yUKVgrfFaYZd0A8e0ZxFZnpyT3AtzS9yxjmrDf0Gr0yjM7WXL4ExQ
 lDhURLChSJS2fPXWtx8oI+qKCjlOLADVZMBKz02MLuV204CVmycfEc/LbONMLdFidopDwPRe39k
 XKJmw9+Eqxl++n+3I47D+Rj9eyvNL
X-Received: by 2002:a05:600c:18a6:b0:3dd:1a8b:7374 with SMTP id
 x38-20020a05600c18a600b003dd1a8b7374mr702586wmp.5.1675709235680; 
 Mon, 06 Feb 2023 10:47:15 -0800 (PST)
X-Google-Smtp-Source: AK7set9O+AFBlSx1vEYGijuQNmYcM6SnLQcrjncn2maMR7AxUw5thKkNysCaeGtaTLYwLHkwW2zybw==
X-Received: by 2002:a05:600c:18a6:b0:3dd:1a8b:7374 with SMTP id
 x38-20020a05600c18a600b003dd1a8b7374mr702568wmp.5.1675709235494; 
 Mon, 06 Feb 2023 10:47:15 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0ac700b003d1d5a83b2esm16444126wmr.35.2023.02.06.10.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:47:15 -0800 (PST)
Message-ID: <a1cd8c74-98f4-bff0-0344-cbece787c6e8@redhat.com>
Date: Mon, 6 Feb 2023 19:47:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/shmem-helper: Fix locking for
 drm_gem_shmem_get_pages_sgt()
To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230205125124.2260-1-lina@asahilina.net>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230205125124.2260-1-lina@asahilina.net>
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
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Lina,

On 2/5/23 13:51, Asahi Lina wrote:
> Other functions touching shmem->sgt take the pages lock, so do that here
> too. drm_gem_shmem_get_pages() & co take the same lock, so move to the
> _locked() variants to avoid recursive locking.
> 
> Discovered while auditing locking to write the Rust abstractions.
> 
> Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
> Fixes: 4fa3d66f132b ("drm/shmem: Do dma_unmap_sg before purging pages")
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

Good catch. The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

What about drm_gem_shmem_free() BTW, I believe that the helper should also
grab the lock before unmap / free the sgtable?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

