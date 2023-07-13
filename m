Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8892D75248C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 16:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E318F10E6F5;
	Thu, 13 Jul 2023 14:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB60710E6E6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 14:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689256948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fA/eS6o3EDH8bydBgsWTgV/BrJiaaTq/p18XJHUPDVk=;
 b=hBG1/JH92ip4Q9EIZ6+kekfRm8S6tGD6+FOCUWV0K1q3EAuS1NiXau5FRdYEuSDF3VeQkz
 2UE2qsjb3zdjwK6SelixyzDwxwegqIMUw/oYSKaTy2CJUcj+bEyTrnpe+fTRtib4a4NrsX
 uIL9v0D0JLDMD4vKekUsTX6GFIl52qI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-Pn9n3MT4MF6B8KlLfbIaWQ-1; Thu, 13 Jul 2023 10:02:08 -0400
X-MC-Unique: Pn9n3MT4MF6B8KlLfbIaWQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fc0094c1bdso4179925e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 07:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689256914; x=1691848914;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fA/eS6o3EDH8bydBgsWTgV/BrJiaaTq/p18XJHUPDVk=;
 b=fYx29q/1xTYT3FDN3GgL+wegcmtRlAl0EyK3d0j+bzV7abU+BPOTNESD5Q9xDpg9/K
 K9sFycSIdxoAfbMTb5+NayPN7vjyycl5O4m+TkZNaA4Fnxdk3pPgmyJT/AaSN0E3B6+p
 IEzXKHG1YJUP+u4vuaj4VXb5zEYMa6jh0To6KQ+YTYpZ4Y7h6EFyfY4hr2IqUx2l030F
 TSry/WdV7Wyswhj3iH1WmfdVwMqcgPb3mgRJw3TklrUbW1LFkabdCxyektdxfu+rRH+r
 5qJR8a3ZnKQy2DPWW255+hIrfgA2RRH1AKQGyQzJ6VzUFnDf1GmKepxOhxQ2eoUiQUT/
 OTbw==
X-Gm-Message-State: ABy/qLZ1oltIOXk7Rdm6iBqcRo/xjztYPuip0CJN8BK00Yic4Sohbwez
 ot7cmESLXdd3nGgG63o5waTox+RrAoiAoirGsY396N/ol8VVQCevvUB1nX6uRGGG9ArzJa0bzY/
 aWP6ERgtweRbwTofI7OIvwbf/UJTn
X-Received: by 2002:a7b:c011:0:b0:3fc:5fa:e2a9 with SMTP id
 c17-20020a7bc011000000b003fc05fae2a9mr1484767wmb.41.1689256914232; 
 Thu, 13 Jul 2023 07:01:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFb9RDVsom0KqL6AKT6b6Y78RMIb1xxTz9aSpO2Jhiw+N3e07Kh6aAVD6+RMY2hUTqU82hGrA==
X-Received: by 2002:a7b:c011:0:b0:3fc:5fa:e2a9 with SMTP id
 c17-20020a7bc011000000b003fc05fae2a9mr1484752wmb.41.1689256913923; 
 Thu, 13 Jul 2023 07:01:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a7bc8cf000000b003fbaa2903f4sm7832911wml.19.2023.07.13.07.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 07:01:53 -0700 (PDT)
Message-ID: <03e06f56-7661-fe71-d29e-2818279fb3e3@redhat.com>
Date: Thu, 13 Jul 2023 16:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/2] Two memory leak fixes in drm_client_modeset.c
To: tzimmermann@suse.de, airlied@redhat.com, javierm@redhat.com,
 yizhan@redhat.com
References: <20230711092203.68157-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20230711092203.68157-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/07/2023 11:20, Jocelyn Falempe wrote:
> Jocelyn Falempe (2):
>    drm/client: Fix memory leak in drm_client_target_cloned
>    drm/client: Fix memory leak in drm_client_modeset_probe
> 

I just pushed the two patches to drm-misc-fixes, after removing the 
useless NULL check of the second patch.

Thank for your quick reviews.

Best regards,

-- 

Jocelyn


>   drivers/gpu/drm/drm_client_modeset.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> 
> base-commit: 2f98e686ef59b5d19af5847d755798e2031bee3a


