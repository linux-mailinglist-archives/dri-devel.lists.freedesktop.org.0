Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBD35461CC
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9E01121E2;
	Fri, 10 Jun 2022 09:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706A01121E2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654853021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ui+GefT7glVYbZJx7tAzYAgsijo4mtXjq2iJjZnCAk0=;
 b=VwiEIxe/LaExm6l2og1pbF5h542CfsUbeaCks3VXGwCXMuri4GoOLcGYT7NYJiHxON0kbF
 N52CeSOpi7/at0/StowzFU8+kVk/IN/nAti+lkk3oCThaK31fSeS1zPE7BG02REVvqwXGz
 DuXY7lOLypFxDE0DFFuHtqzSll0OGc4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-WTwXhHW5NbOdIOqxo7Ncfw-1; Fri, 10 Jun 2022 05:23:40 -0400
X-MC-Unique: WTwXhHW5NbOdIOqxo7Ncfw-1
Received: by mail-wr1-f69.google.com with SMTP id
 q14-20020a5d61ce000000b00210353e32b0so6002747wrv.12
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 02:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ui+GefT7glVYbZJx7tAzYAgsijo4mtXjq2iJjZnCAk0=;
 b=imvK8P8hRdEE4tfwwU63H1EH95WVvGQtqUt5o0maL15HOQfqDHE7otmOv4BIK73pW5
 3P0EEPeFWm7jhQPhfXsrDiRXfuIpJWebYZvGf9EZOXOpJlTa7pHI9fOsAv+41CuCyBZ7
 Qbm66EsIQobpnrDTjtGo/QkmpqL0zqI7i0qbwCbDntjdYqgIyc44wHud73KUt1AlOf+C
 vLxpFm8PCsNu9Z6r1i4uyCgp6LPmhKBM7pXhXiYSrsFFWD0PlPs+pcqxz8HWHUx2BubY
 fTpWd4e9x3fvjoIHnEHsZ9ejqp6SgWRM3kjprxrFF796dNpj0PfvKUMhafqcgiSBKuX1
 b5hg==
X-Gm-Message-State: AOAM531/o7oT2EzY4zk3Qp9q/UXInAeF3ocmxeFVKltf9LXIksKec5Rt
 IiDZtwd8HoA00msSxjXvzphSi/5kVmWcs/iPN4ZnVDjC6tDXYzwHNcz2/+IJPpYSHnvenXaU9QV
 0J5AbtBND3FRfAyPHasLvIJL/CVx5
X-Received: by 2002:a05:600c:1e2a:b0:39c:51f8:80d4 with SMTP id
 ay42-20020a05600c1e2a00b0039c51f880d4mr7909007wmb.192.1654853018892; 
 Fri, 10 Jun 2022 02:23:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzors8lrVCLvoMtZbR/XO1Cue4ykhrTN0Lh/orNjpsTm7XBIYzUbhU/YNQRJll7iilJG9sY3A==
X-Received: by 2002:a05:600c:1e2a:b0:39c:51f8:80d4 with SMTP id
 ay42-20020a05600c1e2a00b0039c51f880d4mr7908984wmb.192.1654853018625; 
 Fri, 10 Jun 2022 02:23:38 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c255000b0039c4b518df4sm2814684wma.5.2022.06.10.02.23.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 02:23:38 -0700 (PDT)
Message-ID: <3babc5cc-2f03-4b25-1cb3-82f039e3c40d@redhat.com>
Date: Fri, 10 Jun 2022 11:23:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20220610144958.5b90e8d3@canb.auug.org.au>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220610144958.5b90e8d3@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Stephen,

On 6/10/22 06:49, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/firmware/efi/sysfb_efi.c:29:10: fatal error: asm/efi.h: No such file or directory
>    29 | #include <asm/efi.h>
>       |          ^~~~~~~~~~~
>

I noticed that this header include is not necessary so I posted [0] to
just drop it, and mentioned the build error too with your Reported-by.
 
> Caused by commit
> 
>   fa0e256450f2 ("fbdev: vesafb: Allow to be built if COMPILE_TEST is enabled")
>

I posted a revert [1] for this but for a different reason (since after
[0] I believe the issue in powerpc should be fixed), which is that the
patch led to linking errors on arches that don't define a screen_info.

[0]: https://lkml.org/lkml/2022/6/10/323
[1]: https://lkml.org/lkml/2022/6/10/316

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

