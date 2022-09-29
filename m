Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162645EF760
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 16:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D55710EA9D;
	Thu, 29 Sep 2022 14:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C5F10EA9D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 14:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664461275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dc6+0P8/mx3Gy35ifSieoD5AuK0yRDcTYWvyHZ6F8l0=;
 b=iSZ6Z2dedhG1Kp1gtg77pFsLu5szMkhqbhmS2euly8wjMWBc0I46nnMC88H8mrPJVXGw6V
 3MGvWerVuv/l5xyGZBW64uBfs9AgVCzINynLrm5ss16X94KldI2H5mRYnDMZsMbI/tBGzu
 GImzt8YucgwT3kX/RJIL6ZaZ7QXXPiI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-KgQk_qCZO42lX-8O2I3HKw-1; Thu, 29 Sep 2022 10:21:14 -0400
X-MC-Unique: KgQk_qCZO42lX-8O2I3HKw-1
Received: by mail-wr1-f70.google.com with SMTP id
 r22-20020adfa156000000b0022cc3018fbaso600158wrr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 07:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=dc6+0P8/mx3Gy35ifSieoD5AuK0yRDcTYWvyHZ6F8l0=;
 b=A2pdflSzDNm72/RRJ9bJzOmBfQhuTGeIdSNv7BCSn8/cDuPWHnYRDOMbizSks1XY4U
 7dgvWr3dC3pz2Du9aQ7tet/aFgR7oJWn6oBW8og2tsgfkU2RHLbtTvS20+Z+wMK7CUr4
 xog7rbZri3iYEU8Zz5vxBw85K783pwW4D1Ci9TPqoIpdPbJm1q/ZdTyLXh7uGu+HaZ/U
 KAAhgymvWUl5lk+AWrt/HHjG0XZoyIpbxNHmJVVmUcgmuLjH0EYcOf7IuLEF1NdrF4Xc
 TuLOwyQsXXZTkI3gpewU0gSKY6oAkTWDasEzMMt1u5m6jXD1kLbC/FydEa9pR5+0cG0q
 l2Eg==
X-Gm-Message-State: ACrzQf2iMiBzSnEdODeBuRreqJf9MeiTq/PkabIYaUSmyH8eT4TzlNbu
 FQwIyBUCnITKWLVOWYPTByrJiwswRjOTWvnuHXl4k/31utENJ8XaQH6j9ucB8wR5jXvFMrENr6c
 3X5UTjqCKWNtI+MmgvlZBMx2oPfW4
X-Received: by 2002:a05:600c:1d11:b0:3b4:7644:b788 with SMTP id
 l17-20020a05600c1d1100b003b47644b788mr2757102wms.114.1664461273453; 
 Thu, 29 Sep 2022 07:21:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5H7nkERMTUTKYNG9YFnQVnGEoj4q1ZbJ833EJrwv9Euqo14ORslDlTSnReDSi+F/0jb2iK0A==
X-Received: by 2002:a05:600c:1d11:b0:3b4:7644:b788 with SMTP id
 l17-20020a05600c1d1100b003b47644b788mr2757087wms.114.1664461273271; 
 Thu, 29 Sep 2022 07:21:13 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z8-20020a1cf408000000b003b56be51313sm3885519wma.44.2022.09.29.07.21.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 07:21:12 -0700 (PDT)
Message-ID: <899296e6-a0bc-b063-0262-5acb37a7171f@redhat.com>
Date: Thu, 29 Sep 2022 16:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 07/16] drm/udl: Convert to atomic-modesetting helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-8-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220919130408.21486-8-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/19/22 15:03, Thomas Zimmermann wrote:
> Replace simple-KMS helpers with regular atomic-modesetting helpers.
> The simple-KMS helpers introduce a mid-layer abstraction without
> added functionality. Using regular atomic helpers makes the driver's
> implementation more discoverable and simplifies code sharing.
> 
> The conversion effectively open-codes the simple-KMS functions and
> data structure within udl. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

