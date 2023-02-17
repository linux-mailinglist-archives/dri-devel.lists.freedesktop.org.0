Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF7A69A763
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 09:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2C510EF2B;
	Fri, 17 Feb 2023 08:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E883710EF33
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 08:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676623731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2eU8yeckiOADs0SAPKaxGJh7w9R7c65Q/H5mdcfdOj4=;
 b=K7eZbkgeAu+2g/01x937ak6rezu/DcjNSqEV4MDGj/kHkgM+S9devOtuNBGaDMhC1+QOQk
 zGwkD4dMSfGS3dO0w4LrXk7lipDFgcqW1j1ur6ewNABcjvbPVo4EoIiYiRmhcR5jIko0mU
 fI1nNnFZTgIiSY+ezjkU2b4O/qtYa/k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-582-ptHvQInZPM-wVNOw5ZgKrQ-1; Fri, 17 Feb 2023 03:48:49 -0500
X-MC-Unique: ptHvQInZPM-wVNOw5ZgKrQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m18-20020a05600c3b1200b003dc5dec2ac6so376522wms.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 00:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2eU8yeckiOADs0SAPKaxGJh7w9R7c65Q/H5mdcfdOj4=;
 b=4QVtfSeMlRCcg2XpM6kMbKseOqcvSR133VxzlIWiJ1cCc/qgame3ecWlzp68YWk2Ib
 yRW2LroiyzkOaC2glr5rLQjlWxBQ8ZWaRiGDclghu6T0O20pG/jZkKkkMqEsZF5MPyaV
 Pi7LlRRdp97d2hb0vXZKP2X6ocgfQ0zmnDqsW79DE/3NXcTWaPvTsf9vi6XHaaj060ly
 MC0KlNQLFTOYeWAWAN21IvNvILFiVjp/8fwwnZF8w7Df1C1kqSgy5ubqPUCcuPlHCMLg
 qPBT4LV1qg9wckksUZbv1a5eeuoYs2rqzIiJVJgvb9OlFCJWBkBc9GdOtXK4oeFjWryx
 BHNQ==
X-Gm-Message-State: AO0yUKVoLa51hJlwUBvJrthYy7ic6OK/R/+wH8aDiIri1J7zpSXCIkDQ
 IDFtxYYQxh7yjz4QOWutL/O5qBy9iTHC+ZpUvQBcPdO3jhqRtXavF5oRy/d0j86W6xVfJxTXsho
 f9KFuxhR8RxXfFKH4fVzFiL4vo5IZ
X-Received: by 2002:a05:600c:3096:b0:3dc:5c86:12f3 with SMTP id
 g22-20020a05600c309600b003dc5c8612f3mr7917277wmn.1.1676623728600; 
 Fri, 17 Feb 2023 00:48:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+a6F9dptY7bjjBAON9AHGK9gU+ghqAshRPH5VyjXN8kErI5tYZZJ197OpUlukUZMZdtlZ16Q==
X-Received: by 2002:a05:600c:3096:b0:3dc:5c86:12f3 with SMTP id
 g22-20020a05600c309600b003dc5c8612f3mr7917267wmn.1.1676623728342; 
 Fri, 17 Feb 2023 00:48:48 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 hn30-20020a05600ca39e00b003db03725e86sm4300956wmb.8.2023.02.17.00.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 00:48:48 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 06/11] fbdev: Unexport fb_mode_option
In-Reply-To: <20230209135509.7786-7-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-7-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 09:48:47 +0100
Message-ID: <87v8k0wuc0.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> There are no external users of fb_mode_option. Unexport the variable
> and declare it static.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

