Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F095725866
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1C410E470;
	Wed,  7 Jun 2023 08:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B06710E470
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 08:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686127671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zDz69+oFYWXX1BmnVAcHgBw7nzJBGz38VxVt62J1FoQ=;
 b=RuEld8eDXoU2w3kOBIdcX5OySp2s3PWlgYi9CReAGTXYH9VwxCmZ79DBzRdD9o6td1aMqh
 71kaTIR2B7c5qoWcByAJVhgC3xA8KktytlcafXb3TC+Mvm9x7LOdq/SieKu6ysTvaoAPLS
 jm6nePnjpDlBM1ddR6ej/wB2UQB0Slg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-qGiWjGiNO_G9wHqyP8ZBzQ-1; Wed, 07 Jun 2023 04:47:49 -0400
X-MC-Unique: qGiWjGiNO_G9wHqyP8ZBzQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30932d15a30so3863828f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 01:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686127668; x=1688719668;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zDz69+oFYWXX1BmnVAcHgBw7nzJBGz38VxVt62J1FoQ=;
 b=ZEjxZfQ1ovwW/KF0EQ0w7leu5tCDlm/vH7yw1i0Op7y06sxenbft+Yuhafdgn2xgfB
 j7e85s8NNQ7hH5NUuftnYGdcIUj99gGVCXBV6dZNJmohX/cWoEQVtTCSGy+lpHjvhR0Y
 OFdymYECHY3cAGvzlq5/v11di2hH1mhYnGGkMCVus9bSoVEbe1n3LJPw1+93TmeqVObe
 VliZ3VoWB3wdLU9CzEIGYMPHWh6YNQds8wRZeGgSI7uVO3S17LyRl9ll89qg8aHvros3
 bp0XV7V00E+cpW8F8fB8BuZ2xaFrnCtQfgeRRX5ywpyfRU+ennzqusNZKdJ+vWyOA5Ui
 hIUQ==
X-Gm-Message-State: AC+VfDw8VZfQc3rMZ8INp8V1/omPDi2eVSyRVVQLBCWKF/o9u1HG+dho
 1m0qcHkYkqt7xpSJHqIt79620Hn3oExUfso/ZHc4QcaxI5IgUJPv/mciJf+ZpZq8ouk14cKi2F8
 DQEb0Lcm79Pp2GQKQgMGLlcvFV5Wh
X-Received: by 2002:a5d:45c6:0:b0:30a:e495:2544 with SMTP id
 b6-20020a5d45c6000000b0030ae4952544mr3492883wrs.23.1686127668651; 
 Wed, 07 Jun 2023 01:47:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4HyIAuVGnzEFE0Y0RegoBmQPKta0aQoYnV+QnWWgwUwsjGZISbQLbaBPCUULIqP84aItfwIg==
X-Received: by 2002:a5d:45c6:0:b0:30a:e495:2544 with SMTP id
 b6-20020a5d45c6000000b0030ae4952544mr3492862wrs.23.1686127668360; 
 Wed, 07 Jun 2023 01:47:48 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n1-20020a5d6601000000b0030e5b1fffc3sm1029071wru.9.2023.06.07.01.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 01:47:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 09/30] fbdev/ep93xx-fb: Alloc DMA memory from hardware
 device
In-Reply-To: <20230605144812.15241-10-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-10-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 10:47:47 +0200
Message-ID: <87o7lrfyks.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Pass the hardware device to the DMA helpers dma_alloc_wc(), dma_mmap_wc()
> and dma_free_coherent(). The fbdev device that is currently being used is
> a software device and does not provide DMA memory.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

