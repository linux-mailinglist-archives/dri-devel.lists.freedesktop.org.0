Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040B474AE93
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52FC10E550;
	Fri,  7 Jul 2023 10:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4584A10E550
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 10:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688724748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DlW1R/8hRwezlWgbC+wvZSXHhVUh/eG+VQMZJgN0Tvc=;
 b=TzYnI9s5JcszrVKky2QMsAwqLDqmVIzYsOQP9Vgvzug/CT+YkMRdTbgqfrB+XK6FUs2xgT
 fW2V1YOD/FXcRs7wlMK+fziefLnxFdeKHL/wyfDNmgPtfBwSsMAbmDqiQzD/1J22O1WsXQ
 IIc1f1BwsxGn0rZPNFhW7NtTmhqdbhk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-QA9cz8JQOXSkoIlID3uUmg-1; Fri, 07 Jul 2023 06:12:27 -0400
X-MC-Unique: QA9cz8JQOXSkoIlID3uUmg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-31429e93f26so940836f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 03:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688724746; x=1691316746;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DlW1R/8hRwezlWgbC+wvZSXHhVUh/eG+VQMZJgN0Tvc=;
 b=kFbn9+PRKb0wanY5ecaysorPRmrbXIzAxw26WGFy/JUNXaC0OwevSVKay+Ifah296b
 5C085kIwtUAPjIuUyZSMd9HkDbU4BG+ThRk53p7J2FQ4EUuuBHyC+l16APvrFxqbb+PB
 r9VDQYzaZgta+MAfRGKCvxC/PloC7sheC2iQwgxoT7gOyMPIf/Pu1Zf0yCGhl3y0hjNq
 YWJD1ufIMGDhuSArVuc6G+e+VqwVNpIGYDEcCs+68dnlt5hjdpUrJXMErHBUimgesNR1
 lohTDLLkg9Ez87NO42iskePOf9iDZl9wb8wXUTkf7nl7TfY7Rgk2haacpkn8aIf3KeVZ
 7PuQ==
X-Gm-Message-State: ABy/qLav3zz9RqS9V+oHCnRTqIHF9S6UQMXC0A8wjeks9afYPzDbhImH
 L0NoZBKyvhto03818qfU7y57QacEIh9dsllkWaHbY/YP339r8b048Ii5g7rLCMgEFm5+A7IFYaO
 Y57WJ5tANvsyAiGBqXOxaf9RGkL3h
X-Received: by 2002:adf:e40b:0:b0:313:f02f:be7f with SMTP id
 g11-20020adfe40b000000b00313f02fbe7fmr3429141wrm.55.1688724746547; 
 Fri, 07 Jul 2023 03:12:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEl0rRQx8YRJhH9y3kGM2crHvIosSMl2yPsiQFeLRX1mWJpZ5P5lO4jWKSG6bWALHyxhssqPQ==
X-Received: by 2002:adf:e40b:0:b0:313:f02f:be7f with SMTP id
 g11-20020adfe40b000000b00313f02fbe7fmr3429126wrm.55.1688724746175; 
 Fri, 07 Jul 2023 03:12:26 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m5-20020adfe945000000b00313f9085119sm4031028wrn.113.2023.07.07.03.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 03:12:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH v3 05/12] drm/tegra: Store pointer to vmap'ed
 framebuffer in screen_buffer
In-Reply-To: <20230707083422.18691-6-tzimmermann@suse.de>
References: <20230707083422.18691-1-tzimmermann@suse.de>
 <20230707083422.18691-6-tzimmermann@suse.de>
Date: Fri, 07 Jul 2023 12:12:19 +0200
Message-ID: <87pm54xc70.fsf@minerva.mail-host-address-is-not-set>
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
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Tegra uses DMA-able memory, which has to be acessed with CPU ops
> for system-memory. Store the framebuffer's vmap address in struct
> fb_info.screen_buffer. The currently used field 'screen_base' is
> for I/O memory.
>
> Suggested-by: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

