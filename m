Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC76E5E752C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 09:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D299510E496;
	Fri, 23 Sep 2022 07:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC6B10E491
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663919322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u1fQllVeLVNgNejn8tlyLAz2/g1arDB+37Jwgsi4gCQ=;
 b=BjKx0IheESsc+ykCVfjamiGnVk5GIEVU6SkaCJphhTvQQmEdGX8BtFJY81WQCEzY4AV+ZU
 Rqxhv9lZsxv3ZQ2e4oEPx/UD+ITCp8QnQ0nmxf6NCyY025i5olQ07yESGo1F/wlzCf2VP/
 TTO8Og5aOCeYrmQThde6ZfN/f44rMrU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-448-Wf6Fb655NN6IohV95Gq3-A-1; Fri, 23 Sep 2022 03:48:41 -0400
X-MC-Unique: Wf6Fb655NN6IohV95Gq3-A-1
Received: by mail-wr1-f71.google.com with SMTP id
 g19-20020adfa493000000b0022a2ee64216so3748809wrb.14
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 00:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=u1fQllVeLVNgNejn8tlyLAz2/g1arDB+37Jwgsi4gCQ=;
 b=vVANwjMMEAzlL1pOsWSomjoRA/4iJjSKODr4Z3NdknwnDIecRb06TjUUzks8tDahh/
 hPdTnW85OKS6V34hcz3PvqiVJUllLlM+I5uIh98UM0WkGLo5US/u/1w0bXwUBZ5XyG0I
 IyW2X0xgtOgDLl38A3SiCGbphv70LjDE7urVuHbY+QzaJs5Da+hzA3i6lVEoTvMFfM44
 V69u2wg7JdFQYYaNXiia1K5XSzHNthpdjjeax8GuRGuVyQ36TgRNrreoubbEiHqjn/PV
 C8Cms3sZOdyRUbzvAADpaqyd0IYf7jOlJs9XkaLcHbQZLjLUdFIaeKXhR810pZHF5jYN
 Z7Ng==
X-Gm-Message-State: ACrzQf0bknUGOKES81a40equV4ww97zfEACZJdfENgsePe4+vZ8XQX1v
 kD30qM+T6/KMtaaeEqrdWbjVzNM0VGqdEnc9si1HtbPNfWyH0t8l3cmU0DYnMMh0irKaZuoIPS0
 RG/8N3jGkZJQJF7ioi9WkpTtubmso
X-Received: by 2002:a5d:64e4:0:b0:22a:4997:c13c with SMTP id
 g4-20020a5d64e4000000b0022a4997c13cmr4468078wri.621.1663919320185; 
 Fri, 23 Sep 2022 00:48:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ihYMMApckW/uMu0oMAFyalF7EgUgUwbnCt82X3+AP1zOjAdPvwEa7IWDkPm8dV+kYFze77g==
X-Received: by 2002:a5d:64e4:0:b0:22a:4997:c13c with SMTP id
 g4-20020a5d64e4000000b0022a4997c13cmr4468065wri.621.1663919319825; 
 Fri, 23 Sep 2022 00:48:39 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c2ccf00b003b51369fbbbsm677881wmc.4.2022.09.23.00.48.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 00:48:39 -0700 (PDT)
Message-ID: <ad04501c-fdab-ad68-e820-938a410f87a6@redhat.com>
Date: Fri, 23 Sep 2022 09:48:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 3/5] drm/simpledrm: Remove !fb check from atomic_update
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie, daniel@ffwll.ch
References: <20220922130944.27138-1-tzimmermann@suse.de>
 <20220922130944.27138-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220922130944.27138-4-tzimmermann@suse.de>
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

On 9/22/22 15:09, Thomas Zimmermann wrote:
> The primary plane implements atomic_disable, so atomic_update will
> not be called without a framebuffer set. Remove the test for !fb.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 3 ---
>  1 file changed, 3 deletions(-)
> 

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

