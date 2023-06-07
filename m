Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B817259A2
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A052510E480;
	Wed,  7 Jun 2023 09:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8D110E480
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686128998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RSdIsVX6ecFqz04GkrugK7lp/x5jJUtqPYllPP5sQjg=;
 b=SVsN5vU9K8FT/r1Ft2radZh+CWKDa0llXTI0Q+7QyXNmTqBx4yHVeN2g+zUFavw0nGHeXX
 Vtee6T+qxMA24BX4/4PbrIxgBZLC+Zz2RNnai8L2fp7HZz+51EKcMHHG27j9xupm5JOYU7
 GT9Kpv1Tjd09iWj/LoJzfOYHJ5zvo4g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-ApCCx3eVPKOXKMQxkEOlwg-1; Wed, 07 Jun 2023 05:09:57 -0400
X-MC-Unique: ApCCx3eVPKOXKMQxkEOlwg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f7ecc15771so2028255e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 02:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686128996; x=1688720996;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RSdIsVX6ecFqz04GkrugK7lp/x5jJUtqPYllPP5sQjg=;
 b=TitPpYwOiJRW2LR0d2Hm+KndwsYzLoCusHjj59Ilu4LXV1sBDGhgYA3dNK517TgrG9
 V2LOnaqXUQiHF0rnSQhjhlRCafChJONb2/F04YXzuBbhOKv8OREWJVjeY9lYvXO4W2Kl
 JOjkDOsQETSWDFBw4gTvDi7fKmdwE25jgG+oukwc+uePdL2FM4f0qqLL9LPzAzSSZhv3
 S0JrnNlY5OjXmR9pOF2wjd+649NN9eCHsdH6gWuC9cMGIoFDm1bTu1MxELsgNP32Rxa7
 YNgIWf0tlBvyYvwWE73hY918sOcMkKDRCFHsDcGDyOEMEUYCIykRnG32Tz6ToKleVIGc
 fAKQ==
X-Gm-Message-State: AC+VfDyzWVGq7Sqq56xGfOyAFx53pys1i3E3Q0oMRYeiv2vdeS/wK07b
 TylHPBW/1vo/b8zlvdOvWjGgnnhEZrPZ1B5n3BuTE1lku+qZDrHvyDKvKanzWSlS4XXe44Nu12q
 pls/VSjCrnzBS/4ndel3k0cqYSbQ1
X-Received: by 2002:a05:600c:220f:b0:3f7:395d:6585 with SMTP id
 z15-20020a05600c220f00b003f7395d6585mr7850360wml.15.1686128996490; 
 Wed, 07 Jun 2023 02:09:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4S4Ug1fiHJ0oCExHc5SSiTGb/dJv10TIcn7zVRyFtmlI7TI/i0oDDpnO/bY0dqK+vi3g6l4w==
X-Received: by 2002:a05:600c:220f:b0:3f7:395d:6585 with SMTP id
 z15-20020a05600c220f00b003f7395d6585mr7850336wml.15.1686128996200; 
 Wed, 07 Jun 2023 02:09:56 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v25-20020a1cf719000000b003f736735424sm1425404wmh.43.2023.06.07.02.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 02:09:55 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 17/30] fbdev/radeonfb: Reorder backlight and framebuffer
 cleanup
In-Reply-To: <20230605144812.15241-18-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-18-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:09:55 +0200
Message-ID: <87zg5beizg.fsf@minerva.mail-host-address-is-not-set>
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

> The driver's backlight code requires the framebuffer to be
> registered. Therefore reorder the cleanup calls for both data
> structures. The init calls are already in the correct order.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

