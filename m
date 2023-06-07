Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC86B7259BE
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326A410E490;
	Wed,  7 Jun 2023 09:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF1610E490
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686129141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B3BIYD3PXMtQvTPGQV01/1k0Hmx/7PJYivm+5X8kP8U=;
 b=O+IETPrpEKa5dZUBQt2NtWpk9csmzf3XlIbfvYXhRQyGDov4ThNqiSRuLbAQFf0DO92KaE
 Wvmnuxky8x4QhIc1CqB9mYrxaRADznaMPy/OMvpyhO6GTGyxl4waEC6HpZILJfIGVzs0z2
 DJKr+KE6MwDS9vbpvjJ3or6EsnSdvPw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-aU1aVMCUNaOnFR73t1-reQ-1; Wed, 07 Jun 2023 05:12:20 -0400
X-MC-Unique: aU1aVMCUNaOnFR73t1-reQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30ade645c59so3222946f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 02:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686129139; x=1688721139;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B3BIYD3PXMtQvTPGQV01/1k0Hmx/7PJYivm+5X8kP8U=;
 b=WTAx8WzO4rPHbcQyGwRvmG7/B8kL5+IIj14pMMgh4sHiul4yzQvdZR7+MaOBjLufaH
 xOptFb9e22P0aEfn5vvgw0UqVg5RM5f6zKh+5Fjlf+f4aV0v4sx03R+8WlW/szlL62JZ
 c7Cx2unABZUfvADuOwJs64/q+m63ECsaAzy2+ni1lwm/XWr8IVx2m0RZGHjc2Mfcyc15
 NZ9nQ3iSryy0/UPp86dyqXXcWN6F/EdCv4bXRR/cE0dea/B00skh/TzV5hgCvcOmVABQ
 /RvTYFxvx/8usvDaq9MY4BdcJcMc/Osn0jsrZomeu8xEw/uQZgy25AMfL+LpFIUgqAvF
 GgNw==
X-Gm-Message-State: AC+VfDynYFp1CjyRHoW506jZWig3VwavVayBlF2Qq3ZvVNFtDHD1qDxK
 9zuw9hSkveDX4PFOsuNSRT3imffydNp1hTpRnzNnPXjrgx/EG+Dm1ynh35jDsTTBNPJHKnyXeIm
 c6i/pECEgoNuI5geT5PAiGCrPVzXb
X-Received: by 2002:a5d:55c6:0:b0:30e:38d3:cc4f with SMTP id
 i6-20020a5d55c6000000b0030e38d3cc4fmr3742551wrw.36.1686129139401; 
 Wed, 07 Jun 2023 02:12:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5wzUZfsA9VSizf9bxaqukgTVAwDp5W+57tfKmlffItPyQVvcHhSQ5E8wYACr5/gCv7xQF2rA==
X-Received: by 2002:a5d:55c6:0:b0:30e:38d3:cc4f with SMTP id
 i6-20020a5d55c6000000b0030e38d3cc4fmr3742525wrw.36.1686129139085; 
 Wed, 07 Jun 2023 02:12:19 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003f60101074dsm1447712wmc.33.2023.06.07.02.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 02:12:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 21/30] fbdev/sm501fb: Output message with fb_err()
In-Reply-To: <20230605144812.15241-22-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-22-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:12:18 +0200
Message-ID: <87o7lreivh.fsf@minerva.mail-host-address-is-not-set>
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

> Fix case were dev_err() is being called with struct fb_info.dev.
> Use fb_err() instead.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

