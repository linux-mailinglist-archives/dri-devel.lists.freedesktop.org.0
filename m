Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C147259BD
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28B610E48A;
	Wed,  7 Jun 2023 09:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC1910E48A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686129137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x1ensWxwtR1H9WH8H1jKCiwbKVNzMfKW0b7Yi6bDGCs=;
 b=V41qozxte54gOAPY6bpkpll89/xUUCTqF4XFq8SOugScS3LTWUovragTAU81FjC4zZhQ6+
 6i+xjqWIDlYhcyJd7a9upsCXmn3JuB/s5NKqrY+VGZFzlExdjyOhJqde3qRBWnroJifnoQ
 08/WllPtfNa7rawRXGF4BWXYSBKMiZQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-FhdyRxXjN8616KaKW4v8Lg-1; Wed, 07 Jun 2023 05:12:16 -0400
X-MC-Unique: FhdyRxXjN8616KaKW4v8Lg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3079c6648e3so3876222f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 02:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686129120; x=1688721120;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x1ensWxwtR1H9WH8H1jKCiwbKVNzMfKW0b7Yi6bDGCs=;
 b=VX9FNTWSN9R0aDfU60TsNFGOO892LMCJntYVqVpzUDrYvL3Hz9739uvyM91hsNCYIn
 g+aLuajYlOve3aUMzvAGfjEphZBpPHD7RBaTLsT3wjWRmZIBAmDrB3rcwlpHGt2tHfoG
 gVTyuXfKewe/TNgmPBh5T33UKRDx5HQyQPKfkRhi4b3YbWjLrURafasrkMbihyMiXaip
 WIjL1e6TF5aPV9lUd5InomLbI4mi/gi51aRYjyy2XI+738gL6ayOG81rPM0Ltd/aVX83
 QB60NLn7dym7t5URoaYfg3Ntvb0d530KKw9G5I+8i8DmjMTZ55GC+OyOIgEeVYWMMmtf
 1j9g==
X-Gm-Message-State: AC+VfDzT43d/bZ52yqWqy6f4lJcLCkIb5TFpCMjzEP5oXp6+soLihLsp
 YeiKqrYwETYcLA5h89zS1dmmoLcNW8Egx/x1hqDAeoyPXmDc7+itKqXD+qUyG3p70HhdziPvJt7
 cUtXzHgyenDjAVwN3IvsWT5gcH180
X-Received: by 2002:adf:efc7:0:b0:30a:eada:8b9b with SMTP id
 i7-20020adfefc7000000b0030aeada8b9bmr4008362wrp.41.1686129120264; 
 Wed, 07 Jun 2023 02:12:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6pKDNydRWrc71fW3bUFKqJDv/PfRpGWQYSkEIZ2IoZqLYQ3oH2ibQ9gh3nWmNRpad6J8Zxng==
X-Received: by 2002:adf:efc7:0:b0:30a:eada:8b9b with SMTP id
 i7-20020adfefc7000000b0030aeada8b9bmr4008341wrp.41.1686129120078; 
 Wed, 07 Jun 2023 02:12:00 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w3-20020a5d6083000000b0030abe7c36b1sm14722806wrt.93.2023.06.07.02.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 02:11:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 20/30] fbdev/rivafb: Use hardware device as backlight
 parent
In-Reply-To: <20230605144812.15241-21-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-21-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:11:59 +0200
Message-ID: <87r0qneiw0.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
 linux-sh@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use the hardware device in struct fb_info.device as parent of the
> backlight device. Aligns the driver with the rest of the codebase
> and prepares fbdev for making struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Antonino Daplas <adaplas@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

