Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9B7679505
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 11:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0417D10E652;
	Tue, 24 Jan 2023 10:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28BD10E652
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 10:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674555532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GDZ2X6v9gZZjw/mylSeu05Q/SHm7XIRiCSfNoQKcE4s=;
 b=IrTaEO8b0t6KUBDYMvG20sfER7pUo/QBK3ILhY1ZCc4Gnk+SwhZa0EvEjBk6SfVDm8tkh9
 wxqgqJFhdsMwMUKKgb9tFcfmcoFNqHHKr4d7kxvYcu2sPcl+nGAg5yU0bgjlgkyuDppkLT
 Lhir3ZkpN1ZWWK3JmWwB7Hd46n8lOCg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-57-YqoF4ewLNlOKMvGbreXLMw-1; Tue, 24 Jan 2023 05:18:50 -0500
X-MC-Unique: YqoF4ewLNlOKMvGbreXLMw-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi18-20020a05600c3d9200b003d991844dbcso10948114wmb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 02:18:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GDZ2X6v9gZZjw/mylSeu05Q/SHm7XIRiCSfNoQKcE4s=;
 b=DUV0ioDErzbTcma7QwL/YmmiBdIVokUPwMZ1vzozdTfJNMt7JX84unxI6RJvEgTL3R
 5wRNhuYYl5dQUf7gNRMRE9lFJQIj2z1S8rePC9mylZrtEJXrY2i6h5sjm0J3R4qhnAPy
 K24fEjcXjpUrTaJ1DSJRNpUi+FxTKOhIt9RAqIzxjVq7exzdGRmJnkhDTfMkplnENK2U
 cNH/LSFoiLhoJVusukY+TiFbgmDrcP6vT1JKPUjvjY6Sy8oZYLT9mbqdKhRiaMwFAgOW
 wT96dtwZHZkz75A/Xe0iGGSja+BIR8rzQmaHkcsA7FGzhMdjhT3qupHKMRlWUSzLSzsy
 HUmw==
X-Gm-Message-State: AFqh2kr32NWNvwRONaAImxJn3SU/vOg4fKdqRfeFNzzP4xOSptaiR4JQ
 ysxMsV0McrBKzrz46ijpKSRFm1uXA1Cn+FqpYJxBIxoKpFuzdL3k/1zWg3pkA3ExJHtU8GEU9vi
 ss22PfkB50RwlrIFHzUiyTQy+eDr6
X-Received: by 2002:a05:600c:3d9b:b0:3db:1afd:ac36 with SMTP id
 bi27-20020a05600c3d9b00b003db1afdac36mr20999539wmb.32.1674555529776; 
 Tue, 24 Jan 2023 02:18:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu8zqFziGgSNsVTa/vJxE+MIl3zeqyq4trWRM1k2BTskMl0Qm00LweTGrV0W3Enfm9oMajDIA==
X-Received: by 2002:a05:600c:3d9b:b0:3db:1afd:ac36 with SMTP id
 bi27-20020a05600c3d9b00b003db1afdac36mr20999525wmb.32.1674555529610; 
 Tue, 24 Jan 2023 02:18:49 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t13-20020a1c770d000000b003db0ee277b2sm12997027wmi.5.2023.01.24.02.18.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 02:18:49 -0800 (PST)
Message-ID: <1ae9b489-4afe-d6ce-e055-9a6fd518745e@redhat.com>
Date: Tue, 24 Jan 2023 11:18:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/3] drm/fb-helper: Check fb_deferred_io_init() return
 value
To: linux-kernel@vger.kernel.org
References: <20230121192418.2814955-1-javierm@redhat.com>
 <20230121192418.2814955-3-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230121192418.2814955-3-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/21/23 20:24, Javier Martinez Canillas wrote:
> The fb_deferred_io_init() can fail and return an errno code but currently
> there is no check for its return value.
> 
> Fix that and propagate to errno to the caller in the case of a failure.
> 
> Fixes: d536540f304c ("drm/fb-helper: Add generic fbdev emulation .fb_probe function")
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Pushed this to drm-misc (drm-misc-fixes). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

