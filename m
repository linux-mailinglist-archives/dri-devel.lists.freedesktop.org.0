Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A7251248D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 23:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2ABB10EAE6;
	Wed, 27 Apr 2022 21:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C466F10EAE6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 21:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651094993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qu+9cW5R00FScE94cg2fosnaTUjfEHdj2O3XEUpsTt0=;
 b=GsP+WrzLdwtiDdCfFILXnOcohhWDgT6N+NDnseR0GUcxo6kNqb+x0MJT+tpRD51yEYC40j
 JXoLWfenmEyvP+3O30921hE+xCictMlKaqu8VbOyqpBtXpAaWzRSNTqqoMWff9zz76UlvF
 DnzCHauBOX6nBRAyPcdRV/UJbj1vV9k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-SgzzMjnVNVejDVZXA-bl1A-1; Wed, 27 Apr 2022 17:29:52 -0400
X-MC-Unique: SgzzMjnVNVejDVZXA-bl1A-1
Received: by mail-wr1-f69.google.com with SMTP id
 e21-20020adfa455000000b0020ae075cf35so1201805wra.11
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 14:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qu+9cW5R00FScE94cg2fosnaTUjfEHdj2O3XEUpsTt0=;
 b=AehAMOEvZfVNgvwGPah00wWUWj+EAbpCh133J9NJ6ZtVexrk54G5X5QnFUo/s06jHK
 T3GIlsngPdEZJLHV5DKbvFHLteGbmvfUTCAvnwZJZaxpt5pOYDm6SURcH5XEF3StXz8h
 x44v2kqwAC/lQI7tJT9lWoMC3cxPRfRIiKJRkQwJxJPf3RJ+MamW95pMsctXV8SwZfrA
 rUQMlhPNjt8kRG6gFReF5gwtMoSGB2547yPg7LaECwgH/HeJPto2QmfzxAjex9cSA4gj
 UTBE4Bm4otUU8psvX/gZZeEbVM8pC4A3Y22tLheStcygq+V2WzhH69HFepmbcYBNUjgT
 h0LQ==
X-Gm-Message-State: AOAM5331cj/vgKO6CqgYLevxImN39SK9j+dQOfmUCS+DfkSUFz6LnhNq
 tbYGI/aCGTbbYdalOPpiBEQl69AsBSgSLAOTq75M5r/WxcNbl922hNpY/7jcNNDWfvyjRtk2ZJA
 YEV5ncD/0nft7UT0LrDZGvemr7J0u
X-Received: by 2002:a05:600c:4e8a:b0:393:f169:b261 with SMTP id
 f10-20020a05600c4e8a00b00393f169b261mr11087067wmq.81.1651094991502; 
 Wed, 27 Apr 2022 14:29:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwp3oXACwpueXDePLHDIjsNfwNIfXXGKs7X4UsEVcT/C2ckmWjJ8qHBHGNa+RCk9TBcbbr/WA==
X-Received: by 2002:a05:600c:4e8a:b0:393:f169:b261 with SMTP id
 f10-20020a05600c4e8a00b00393f169b261mr11087040wmq.81.1651094991105; 
 Wed, 27 Apr 2022 14:29:51 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a5d6da4000000b0020a8c8d3e00sm15291167wrs.73.2022.04.27.14.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 14:29:50 -0700 (PDT)
Message-ID: <23074b44-27c9-ccab-dc72-c2231947bb30@redhat.com>
Date: Wed, 27 Apr 2022 23:29:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/display: Select DP helpers for DRM_DP_AUX_CHARDEV and
 DRM_DP_CEC
To: linux-kernel@vger.kernel.org
References: <20220427202513.46996-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220427202513.46996-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/27/22 22:25, Javier Martinez Canillas wrote:
> The DRM_DP_AUX_CHARDEV and DRM_DP_CEC boolean Kconfig symbols enable code
> that use DP helper functions, exported by the display-helper module.
> 

[snip]

> @@ -32,6 +32,8 @@ config DRM_DISPLAY_HDMI_HELPER
>  config DRM_DP_AUX_CHARDEV
>  	bool "DRM DP AUX Interface"
>  	depends on DRM
> +	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_HELPER

Actually, this is wrong since it will prevent DRM_DISPLAY_HELPER to be set
as a module (it's tristate while this symbol is bool). I now have a better
understanding of the problem and a patch that I believe is the correct one.

I'll post a v2 soon.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

