Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42526794D3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 11:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A171D10E64A;
	Tue, 24 Jan 2023 10:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152F610E64A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 10:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674555049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ea3L0Ed5IYjUQaMLhyl4vDM8euWki44OGeAFp5yFf8=;
 b=AUBNTcKg3C/M0XD134iji+Td+0ZWIDHP85gBJIIXMmRYF0Hrc7YuCrWEfBwEr1RPQpSq4l
 lKgpsDAZo8oSdDXJ+5ycmYjmkCVh4WHVS7LKZbpr1WeMcl2/0kbAxV/NyPA1jPdgHJz2BB
 wPgxdnRIGfbgMdZMTMbynQs3vkmSbbM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-34-T_qstL8aOSmSQK2XcbTtRQ-1; Tue, 24 Jan 2023 05:10:47 -0500
X-MC-Unique: T_qstL8aOSmSQK2XcbTtRQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 9-20020a05600c228900b003daf72fc827so8949760wmf.9
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 02:10:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ea3L0Ed5IYjUQaMLhyl4vDM8euWki44OGeAFp5yFf8=;
 b=3Zw9KfhYR2U6EFctZgm/Ec6PIPcvjcAJpp0MLNkIkFNjLunXb9r+a+ijZRjNJEotJQ
 XJutXewuS/l/qHG+8q9GnEXm+vh5KYqGCHoOPWrltgunyD+r8hcfZStV1vFoU0nOqnPz
 cYDlOI08mNzSmciTwmdJ1cR51IhY9XciLeipOEBNdFrMpJW7fWhu5/rFfDfzPm8fe1ez
 uMFMn8PfK270fXFTyPXIxqQt3coOyW9nxvKzE5wInqik7R21dupykOHnVxF9L/1HY6QL
 6KtQCsw4CeJ8ysqy5J8o07+StoyjgvTLTTNtIugrP0+dK4dghy/TVKCgXA7fGWWg+7j+
 daSQ==
X-Gm-Message-State: AFqh2kq5SdTYjrrlLNJfapqxExNkM5SAbLbNpSTcu2A0xdL6jucWIiBY
 9Lp9ACy0aegR44sChFR89aCcUeTlyDXXtlSMNDugmeSMIFoXT424RaV4r7M0yXInxC0VVrCKxHc
 aHCVOtjHcbM+NEqj/ypACRZQtMBEj
X-Received: by 2002:a7b:c45a:0:b0:3d1:ed41:57c0 with SMTP id
 l26-20020a7bc45a000000b003d1ed4157c0mr35140095wmi.30.1674555046564; 
 Tue, 24 Jan 2023 02:10:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv5AioHCNcL30Sjju8XtwLP3T9V6KC2OqPgEYZytb4DQyKsMxqZxY2HiIkelfmcTqUxgcRd0Q==
X-Received: by 2002:a7b:c45a:0:b0:3d1:ed41:57c0 with SMTP id
 l26-20020a7bc45a000000b003d1ed4157c0mr35140084wmi.30.1674555046385; 
 Tue, 24 Jan 2023 02:10:46 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h13-20020a05600c2cad00b003cfa622a18asm14171373wmc.3.2023.01.24.02.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 02:10:46 -0800 (PST)
Message-ID: <9bc96f9d-8e3a-7c71-c9fe-088c9d086f2a@redhat.com>
Date: Tue, 24 Jan 2023 11:10:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/ssd130x: Silence a `dubious: x & !y` warning
To: linux-kernel@vger.kernel.org
References: <20230121190930.2804224-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230121190930.2804224-1-javierm@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/21/23 20:09, Javier Martinez Canillas wrote:
> The sparse tool complains with the following warning:
> 
> $ make M=drivers/gpu/drm/solomon/ C=2
>   CC [M]  drivers/gpu/drm/solomon/ssd130x.o
>   CHECK   drivers/gpu/drm/solomon/ssd130x.c
> drivers/gpu/drm/solomon/ssd130x.c:363:21: warning: dubious: x & !y
> 
> This seems to be a false positive in my opinion but still we can silence
> the tool while making the code easier to read. Let's also add a comment,
> to explain why the "com_seq" logical not is used rather than its value.
> 
> Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>

Pushed this to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

