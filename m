Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D456F19A9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 15:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE62910E1E4;
	Fri, 28 Apr 2023 13:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D6110E1E4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 13:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682688820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=Lo1vQxn9uoDbA94qo/xXBz/VbLMOqy0KEh5xDqDuYyiLUrcBNlYV+IWPTRVoE3MeijYCBu
 SoaJVzuR9ewI7q7PhydjvWjAQo0FkXpuRcP6ATqgrg/uOwekcisU3YfUNUzQ3QvZ3UhmON
 iv8nY0QO8s9cicTvLNWUwnVHMrCWWNM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-NmWsZQPHO1KjHpqi323qLQ-1; Fri, 28 Apr 2023 09:33:38 -0400
X-MC-Unique: NmWsZQPHO1KjHpqi323qLQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f1757ebb1eso35616345e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 06:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682688817; x=1685280817;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=ZpwqP39bGhs74CekPnZlyZ/pl0IP7S/d+DEXHpj6MkDohZ49Dt+juEub0HwfvruB5M
 ywE/bsTXJ6HCE3y1akQjoH54ym0OjMmAiD8aND+Jc0Tr3oq7/H727dRZ/xeGClWisycF
 GKWttDC1Byb4orm6dp+7hNem/UoXEkCN0M0tJX/mudilI/i2RUESynmwAs5VDixBhV17
 Z5i6TWuuwgmRoKLY5SebZh63r06l5guhyDakLf4MrOeV8OSYoLttP9FNqoL09QeiK3hW
 9iVyYZY3fsNjiSJmZAOVqnnQt0yde3S8TDFtdtY0eTfu+pepBcpN64B/5zMHrqpCVbrK
 +0Ow==
X-Gm-Message-State: AC+VfDy7YaZbRnvIWV5lxCSh38plPrT7zzRSeuc7r1RhrY8xacsqlxyf
 qA0cfY5ONRYYV/uSMajQDesbVtDZ/kUIs1FDP6PMM+3YGgfAxdyfUeV1VSPgZv60JB2lmg23L6k
 pLDnaaeXExmCNG8voz8IT6DuiTGqk
X-Received: by 2002:a5d:54cb:0:b0:2f4:f727:14b9 with SMTP id
 x11-20020a5d54cb000000b002f4f72714b9mr3754767wrv.43.1682688817682; 
 Fri, 28 Apr 2023 06:33:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4aoS11M0VcXzkzoTNNDPlJ9yq5eLNx4vXdbKR1p77ehBhl3fOopeYeVOMj3at8BjlbnCOB3Q==
X-Received: by 2002:a5d:54cb:0:b0:2f4:f727:14b9 with SMTP id
 x11-20020a5d54cb000000b002f4f72714b9mr3754743wrv.43.1682688817385; 
 Fri, 28 Apr 2023 06:33:37 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600012d200b002ceacff44c7sm21198449wrx.83.2023.04.28.06.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 06:33:37 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH v2 01/19] auxdisplay/cfag12864bfb: Use struct
 fb_info.screen_buffer
In-Reply-To: <20230428122452.4856-2-tzimmermann@suse.de>
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-2-tzimmermann@suse.de>
Date: Fri, 28 Apr 2023 15:33:36 +0200
Message-ID: <87ildggmhb.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use info->screen_buffer when reading and writing framebuffers in
> system memory. It's the correct pointer for this address space.
>
> The struct fb_info has a union to store the framebuffer memory. This can
> either be info->screen_base if the framebuffer is stored in I/O memory,
> or info->screen_buffer if the framebuffer is stored in system memory.
>
> As the driver operates on the latter address space, it is wrong to use
> .screen_base and .screen_buffer must be used instead. This also gets
> rid of casting needed due to not using the correct data type.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

