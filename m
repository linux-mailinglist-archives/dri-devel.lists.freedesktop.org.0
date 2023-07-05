Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2C57480ED
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 11:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8093710E341;
	Wed,  5 Jul 2023 09:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82FB10E341
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 09:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688549671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2l0oWn80w44VFK/52z7+jyoTd7jTP9Axkcdy88qxz40=;
 b=CytUrYP7MWCGqMjlGubc8KvjHjjLbsSZ3sr+FlOmjuMgvNFe4ucxGo9SpT6yB1isIc6Q9K
 zkNLTLB4HY7iotwpjkAoDJ5f2nWd8LqCttfZHblfLJbSeqrCqCPf6NKU++N9ZQMYlCtpzU
 8fBkjGFA+g2db2stnpLCvvSJmBjT598=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-_Qm5MZVgOtKjTyiaCXjx0g-1; Wed, 05 Jul 2023 05:34:28 -0400
X-MC-Unique: _Qm5MZVgOtKjTyiaCXjx0g-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4fb76659cacso6272657e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 02:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688549667; x=1691141667;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2l0oWn80w44VFK/52z7+jyoTd7jTP9Axkcdy88qxz40=;
 b=QIBhHtrx/MWxLTLK/pcDab7QqiIP02FXBuQ82Cv0KdLc4EGAPr/Xndkwbf+5MzGC+d
 hMBGV7kE/Kxgxc2leSeD9ycQ4aBMRisPV3OJsX6/CMyycDYlkGt59XxUr4CHfoAf8OnS
 VUp27CL5kFFspaKUCuEVIud+DQSYDVtWG/BgEOvqzWpUxxiWjh2vLuEz8RpdHgYysY0x
 mws4kHpNSlOiUvN3JU5apN9eG4L8sLLySaOPwJvUst7QbZEqhNm1DdKQG9E5lyWDX+jw
 em8uEuUqur5k2KJ1SqSAbfnIzfVABT0NknahlGFcTmQXTv7eGXOvJMR0xoQEpZW0rDnw
 BnaA==
X-Gm-Message-State: ABy/qLbMCMiV8eMQAMgC1PxfnavDTLKOcIk4E6rVzdpg8acosdhbfE9g
 VeBHlojhuFtn0OOeLAKPtQbsgaz/Te+cQtBJhPY9Ci2Bmrbl7gFP1w+63xFuS7aqXFxeIy6ORmk
 TeJQan6sZk/itbe40nw4yqJQ0hnRt
X-Received: by 2002:a05:6512:55c:b0:4fb:8603:f6aa with SMTP id
 h28-20020a056512055c00b004fb8603f6aamr10259728lfl.11.1688549667043; 
 Wed, 05 Jul 2023 02:34:27 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHdHXA+Wnp6hB3dyZ6CUVofgFnsSNYOrPiwVRr8+Xhwm5qD73pR2kC2waLM/BUW1Q1QrDqlPA==
X-Received: by 2002:a05:6512:55c:b0:4fb:8603:f6aa with SMTP id
 h28-20020a056512055c00b004fb8603f6aamr10259712lfl.11.1688549666653; 
 Wed, 05 Jul 2023 02:34:26 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u22-20020a05600c00d600b003faa6ce54b2sm1630439wmm.2.2023.07.05.02.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:34:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH 04/10] drm/tegra: Set fbdev flags
In-Reply-To: <f82635d8-4500-d420-f6ba-65aa515017e4@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-5-tzimmermann@suse.de>
 <87wmzerc2s.fsf@minerva.mail-host-address-is-not-set>
 <f82635d8-4500-d420-f6ba-65aa515017e4@suse.de>
Date: Wed, 05 Jul 2023 11:34:25 +0200
Message-ID: <87a5war9b2.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

[...]
   
>>> +	info->flags |= FBINFO_VIRTFB;
>> 
>> I see that all fbdev drivers just do: info->flags = FBINFO_FLAG_DEFAULT | FBINFO_VIRTFB
>> 
>> Guess you are doing in two assignments to be consistent with drm_fbdev_dma.c ?
>> I was just curious about the rationale for setting the flags in two steps.
>
> The _DEFAULT flag is really just a zero. And the other flags describe 
> different aspects of the framebuffer.  I think it makes sense to set the 
> flags together with the respective state. For example, _VIRTFB is set 
> next to ->screen_buffer, because they belong together.
>

Yes, that makes sense.

> _VIRTFB is currently only used in defio code at
>
> https://elixir.bootlin.com/linux/latest/source/drivers/video/fbdev/core/fb_defio.c#L232
>
> I think the fbdev I/O helpers should also test this flag after all 
> drivers have been annotated correctly. For example, fb_io_read() would 
> WARN_ONCE if the _VIRTFB flag has been set; and fb_sys_read() would warn 
> if it hasn't been set.  For the read helpers, it also makes sense to 
> WARN_ONCE if the _READS_FAST flag has not been set.
>

Agreed. Maybe you could add those warn (or at least info or debug?) even
if not all drivers have been annotated correctly. That way people can be
aware that is missing and fix if there are remaining drivers.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

