Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D98CB5FD592
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 09:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D785010E470;
	Thu, 13 Oct 2022 07:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E452310E470
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 07:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665646470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7+kkmXxqmOAqWpnEkFmH+PPx54SR+ImezPG4mMhIn2E=;
 b=VVXbaHsjXika6IYd0uzKrUnsOX1LqHC5SUCg0RiKbVzs2Ud1HJ3abbYoYPxx3WxrCLWgoB
 Eu0E+uy0IFgYSCFaDxjWpsUFQtIc8ec8tDV4+dW4sceVq4E7xfABGOAa9oCFOB7NqfBVUb
 CJ/6pq7iIq8V4BRFduZOzaIfmat0H+U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-428-lT-8FzVjPvqDKuwNFWxjUw-1; Thu, 13 Oct 2022 03:34:28 -0400
X-MC-Unique: lT-8FzVjPvqDKuwNFWxjUw-1
Received: by mail-wr1-f69.google.com with SMTP id
 i1-20020adfa501000000b0022cd1e1137bso228906wrb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 00:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7+kkmXxqmOAqWpnEkFmH+PPx54SR+ImezPG4mMhIn2E=;
 b=N8JgJi2ZPTwTBr6FiOyOoDe413EzrJ/N5St501/a95Jehk4BiCqvfrhHHBaaveVxsU
 sTahChavwCklIxcLzVXBdw+uqGoW6btgVNz3Eq2b8gxATFjs7TmrFjiJQBOc/9w62aNw
 DhmlVjGdv+lBApAlXTzHJ/uJTr7uXR/Gq+markRRz9iUH/oHuEDt8fn2+Op8wO2f91+W
 4kkWJXrUEsKNwQ5ADIg9WjdC82xz1H0PqI10gTF2xk3ycmAHXIQ9VARMEHiwDjqQvp3r
 ZRkHuLZmMmJuyd+9gsDmKN5CT7g78yQO2L0Sxu40WV2srrjIh4frZjpbXwHYrPpPTmUi
 7j7w==
X-Gm-Message-State: ACrzQf1JH5J5TmL//kHmFwxsKYebYMYpFuE23eZNV98ip9HGGW5ARRdK
 2c3c0je1BJTUqTYMj5GIp6NPUgPizMi8KnpXdKqZKAYU8Zkq4yDVB1bRYptZUNObuuBQGKTwDRi
 aXdQ54BkiGgnpcdgORX5TXRVuZU8U
X-Received: by 2002:a7b:c047:0:b0:3b4:adc7:1ecb with SMTP id
 u7-20020a7bc047000000b003b4adc71ecbmr5333945wmc.144.1665646467794; 
 Thu, 13 Oct 2022 00:34:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM76Bw6kTXCm8sc8B5hU+9qB/ACfIxlbJt65LXBIFUWuX5g23uiXeaQ5PngFBdE8Z+HpUzxeLA==
X-Received: by 2002:a7b:c047:0:b0:3b4:adc7:1ecb with SMTP id
 u7-20020a7bc047000000b003b4adc71ecbmr5333929wmc.144.1665646467584; 
 Thu, 13 Oct 2022 00:34:27 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a3170a7af9sm3790192wmq.4.2022.10.13.00.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 00:34:27 -0700 (PDT)
Message-ID: <b5e30da4-d958-4227-6e13-07f58ea0ccb8@redhat.com>
Date: Thu, 13 Oct 2022 09:34:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 0/4] Add a drm_crtc_helper_atomic_check() helper
To: linux-kernel@vger.kernel.org
References: <20221011165136.469750-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221011165136.469750-1-javierm@redhat.com>
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
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/11/22 18:51, Javier Martinez Canillas wrote:
> Add a helper function and make drivers that have the same logic in their
> struct drm_crtc_helper_funcs .atomic_check handler to use this instead.
> 
> Patch #1, #2 and #3 are just cleanups for the mgag200, simpledrm and
> ssd130x drivers respectively. Finally patch #4 converts the last two
> drivers to use a helper instead of open coding it the same logic.
> 
> The changes are inspired by a patch from Thomas Zimmermann for the ast
> DRM driver:
> 
> https://patchwork.kernel.org/project/dri-devel/patch/20221010103625.19958-4-tzimmermann@suse.de/
> 
> This is a v2 that addresses issues pointed out also by Thomas in v1:
> 

Pushed this to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

