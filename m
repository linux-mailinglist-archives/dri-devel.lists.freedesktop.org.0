Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B38772560F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 09:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FF610E451;
	Wed,  7 Jun 2023 07:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE6F10E451
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 07:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686123709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zrMzVIVwuoeUQwH5hpliW2Jq51XgxuMBmmo9TGjEBeo=;
 b=DcMtqFOks/T2jqDkgzKDsboQ0sNeHns63qbfmZyRKBR0G9U60VnMEjc8KEIt5ngQxcJuBD
 rUIHrzHhoxT7IXS29iLgdlBCDpkuza/C4tsARYxiNKkGL/B1UtNESxVoZZ40lm0PSEKSyH
 tBBMNEB+1ophg/tNIJqZHZaNIn5GXsk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-3BF2PYUKNi-o99Zs7YwNDg-1; Wed, 07 Jun 2023 03:41:48 -0400
X-MC-Unique: 3BF2PYUKNi-o99Zs7YwNDg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30ad885addcso150038f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 00:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686123707; x=1688715707;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zrMzVIVwuoeUQwH5hpliW2Jq51XgxuMBmmo9TGjEBeo=;
 b=RMbWHsEJVJC+1MoEfzfMpaxrUqfOJQNXCZSK4cFsWN/hja45RyBoR/wHFA//5+fYkF
 G99Mbd+kiNWEQzSnoydWY/pJoHKV0mdbILj0gmEt9IZOTyisKo8GeTbYHq+WcdYlnffi
 oCyywWckUiP0/BZE/97gWB2IK873VE83goLAzuD46b72VP5L9CUUSLxB4knOwCvmS3ep
 M99Ad9Jde2wQegfxHcC4xWGza9Jj7poGGicMksDv1eiBZHvyJWVzx05EvTfd3m8awLSR
 070AlYUeIRuNVYAxK/rfkdOrPlyv5zW4zl2T4dkXshkBrpJIRf9rQs6WBORuz/HOmKX1
 qKig==
X-Gm-Message-State: AC+VfDz9sIOy0p51fT7my1HBulqIqUAp58NdS7JngQq9rjQ9vbIoQxWw
 L9/MXdDvZJmidEuXcXCOHW5TJESlv6iHJ3qgVpKEfPIrUPdp8Y51z+FwKu4iEVilDAKmqAI9TX9
 u9y2JzkpMRb42SWM5yVA9HnqnMWqp
X-Received: by 2002:a5d:4ece:0:b0:306:2713:f7f with SMTP id
 s14-20020a5d4ece000000b0030627130f7fmr10418242wrv.11.1686123706978; 
 Wed, 07 Jun 2023 00:41:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Zd2a468z/A2yXcthK/MVOYuYJ+/wr3Irr4l7Jvn6olRO9xiMCz+lyONSCQCChNdNZRPbF/A==
X-Received: by 2002:a5d:4ece:0:b0:306:2713:f7f with SMTP id
 s14-20020a5d4ece000000b0030627130f7fmr10418221wrv.11.1686123706744; 
 Wed, 07 Jun 2023 00:41:46 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f17-20020a7bc8d1000000b003f7e6d7f71esm1156174wml.36.2023.06.07.00.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 00:41:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 05/30] fbdev/atyfb: Use hardware device as backlight parent
In-Reply-To: <20230605144812.15241-6-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-6-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 09:41:45 +0200
Message-ID: <87zg5bg1mu.fsf@minerva.mail-host-address-is-not-set>
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

> Use the hardware device in struct fb_info.device as parent of the
> backlight device. Aligns the driver with the rest of the codebase
> and prepares fbdev for making struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

