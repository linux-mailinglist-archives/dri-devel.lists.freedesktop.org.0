Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F3340FAB2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 16:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8F86EC84;
	Fri, 17 Sep 2021 14:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859686EC84
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 14:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631890051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2rkt90TAydOsFexCe7JVTwkkB2M9YRQUiexnhQR/3k8=;
 b=JJiw/MFiKIaKL3+0LPJDdpjL9j8UXXF0rUTo61W652PZPdeqAbKQc0QHLYPPg+66HsGSN/
 ud2Ts3X46Y56XIFGR4QnmwDJd9KFLX3sYVBR+qr8Dk8dF6rdvnvdu6oPYawrFo50kfkUUZ
 CXk4UOQGVPFQxnoCQhfii7RHiYjpeC8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-iTzdmmyVOxmpI0LU8URX5g-1; Fri, 17 Sep 2021 10:47:30 -0400
X-MC-Unique: iTzdmmyVOxmpI0LU8URX5g-1
Received: by mail-ed1-f69.google.com with SMTP id
 h24-20020a50cdd8000000b003d8005fe2f8so5185102edj.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 07:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2rkt90TAydOsFexCe7JVTwkkB2M9YRQUiexnhQR/3k8=;
 b=b4DIqFufOktnM0VjA2T59RRBBdRYa4SUN66c9q1G7en1/coJJ7ms3VR0lqjkz5Rw41
 tL6fMATntta4+kuziZPSlCNcKbYkJFSw7PwZclfIBmRtKVCz6NxjO5R/KIp3k0nK/BD3
 LS64Nz31DTwgONaAcw/ssqQVZLdG5QxkXcRtWJQaV55JEyLV6y8hqsazxvYiVPGAXuL3
 jIexBoPOUYEcr5WZsye+rs3WmWwOfTDrOpczP2hW3btvLSm8blYNEn5lsp6Ov6jX5Owk
 APxoiRmKFU4zXN9eF9LuEFHfC3RNd6dtKM5irNxkyKh1Y4sgto8tldc6Bc24iQ6pbYJt
 sBOQ==
X-Gm-Message-State: AOAM5309+MR54M1ZN6i658qITtyXn1++TsBqOZNcNBhqLMRvHJeJTdmI
 +223Iv/2pn4uA5BUOqnLQ8+bP9copgRttV1HcoIsSzRo1WlsxLimP8paRKWFAxm3XIVwtVeLSoZ
 s/qWps8hm0C3vzpeOaJA4tF0P9dGi
X-Received: by 2002:a17:906:1484:: with SMTP id
 x4mr12480776ejc.72.1631890049208; 
 Fri, 17 Sep 2021 07:47:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4o8+2RbXPY8KxUEewXmnpdKigR8Ox/d2GQyrWqeXxZqNeTarJKA4tZZWAIj8C+Y+iXHw+sg==
X-Received: by 2002:a17:906:1484:: with SMTP id
 x4mr12480752ejc.72.1631890049011; 
 Fri, 17 Sep 2021 07:47:29 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
 by smtp.gmail.com with ESMTPSA id lv10sm2362640ejb.66.2021.09.17.07.47.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 07:47:28 -0700 (PDT)
Subject: Re: [PATCH 0/5] lib: devres: Add managed helpers for write-combine
 setup
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, marcan@marcan.st, maz@kernel.org,
 akpm@linux-foundation.org, npiggin@gmail.com, thunder.leizhen@huawei.com,
 gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210916181601.9146-1-tzimmermann@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <9e5e73d1-bb7b-055f-8c48-a877a2e9c0fd@redhat.com>
Date: Fri, 17 Sep 2021 16:47:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916181601.9146-1-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/16/21 8:15 PM, Thomas Zimmermann wrote:
> Add devm_arch_phys_wc_add() and devm_arch_io_reserve_memtype_wc() for
> automatic cleanup of writecombine setup.
> 
> Several DRM drivers use the non-managed functions for setting their
> framebuffer memory to write-combine access. Convert ast, mgag200 and
> vboxvideo. Remove rsp clean-up code form drivers.
> 
> Tested on mgag200 hardware.
> 
> Thomas Zimmermann (5):
>   lib: devres: Add managed arch_phys_wc_add()
>   lib: devres: Add managed arch_io_reserve_memtype_wc()
>   drm/ast: Use managed interfaces for framebuffer write combining
>   drm/mgag200: Use managed interfaces for framebuffer write combining
>   drm/vboxvideo: Use managed interfaces for framebuffer write combining

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

For the series.

Regards,

Hans

