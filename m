Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBD0748089
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 11:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA1B10E33C;
	Wed,  5 Jul 2023 09:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7CB10E33C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 09:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688548432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rik35amMtwyfsql6qwDwxhFyML3yiol4Y+GAZ2CyrAI=;
 b=iNTSzdNa12XsbUMb7g796WRj+R5RHCN6OCFxKCUMoJPTQ/UkjPD/hHYIeOYpPEPSse4rmu
 /MkenCf0D2sCiTyzblab0HL1bCMfri8CAdjcza/kUsLP+WqWxz0LKZxyc5MrKbCa7+O2c9
 lAtCKlQ8GQ8n44s8OmfazPXqlwIMW8Y=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-MQvKij-dNsetHx_Xivnl7Q-1; Wed, 05 Jul 2023 05:13:51 -0400
X-MC-Unique: MQvKij-dNsetHx_Xivnl7Q-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4f76712f950so6043979e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 02:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688548429; x=1691140429;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rik35amMtwyfsql6qwDwxhFyML3yiol4Y+GAZ2CyrAI=;
 b=XqVBspNav9pDWHwqqGgvU3twIZFmkA9gobqbSkTI9O+S/dCeoLzVBsacXkrkwg/YiP
 keYx056MjCDK4ozN6CAfYRIegtGoGJp7ODIpKi2ucv0L8MNGH2C7qOiXlTfjjwkd8gt3
 thWUd9eBvR8CPBLHHSxPAX5v/E/USSHOnHGUdNxp+QGiUzZy04E/CRzKH5lQ3zGgPppk
 AU5DECQQA6k+DnTwh27FqiQNH1MOdYnQBALAZdFPRIAAVOvpEAY4fTUOwQel3gQQw0cQ
 wUr38JpiqIVS2mhdufimKBJQKrohsRVU0t8eBXTE1ik4Zn0XztxnYAMdV9II+DurWqGd
 kMfQ==
X-Gm-Message-State: ABy/qLbzjDWuWxenJ9SIfUhA2Bb6uRimFZGlL1jIdKVTgzioYQgDee2T
 ZKcb+N9xcB0ZFu5VXsi3ITmxtAW9G4DVDZJg3jZhJsAvqHyHjeCZF5EAeB1BmhLpTuAsaan2OlG
 7Odxe2PnA+o9ijioZLFdgdFpc0J/G
X-Received: by 2002:a05:6512:2390:b0:4f8:75af:e917 with SMTP id
 c16-20020a056512239000b004f875afe917mr13371323lfv.41.1688548429591; 
 Wed, 05 Jul 2023 02:13:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEjlCwK+D/L2otHSAcjbQ8sKKCy18gUu/mb3rWmvZIWyjXZh7PIhlP01348E9bdMzGE5uNgkQ==
X-Received: by 2002:a05:6512:2390:b0:4f8:75af:e917 with SMTP id
 c16-20020a056512239000b004f875afe917mr13371303lfv.41.1688548429289; 
 Wed, 05 Jul 2023 02:13:49 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003fbc2c0addbsm1520495wmc.42.2023.07.05.02.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:13:49 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH 01/10] fbdev: Add fb_ops init macros for framebuffers in
 DMA-able memory
In-Reply-To: <45ed59d1-32a5-86cb-094f-5ce7ad758d5b@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-2-tzimmermann@suse.de>
 <875y6ysr6g.fsf@minerva.mail-host-address-is-not-set>
 <45ed59d1-32a5-86cb-094f-5ce7ad758d5b@suse.de>
Date: Wed, 05 Jul 2023 11:13:48 +0200
Message-ID: <87cz16ra9f.fsf@minerva.mail-host-address-is-not-set>
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
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

[...]

>> 
>> The comment for I/O memory helpers says:
>> 
>> /*
>>   * Initializes struct fb_ops for framebuffers in I/O memory.
>>   */
>> 
>> I think that would be good to have consistency between these two,
>
> Sure, I had the same thought. I think I'll rather change the existing 
> comments a bit.
>

Yes, that works for me too. Thanks!

> Best regards
> Thomas
>
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

