Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1DF7255BE
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 09:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD4910E44A;
	Wed,  7 Jun 2023 07:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E20310E44A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 07:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686123259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/4kkmKCd2wl5ncm7VdRIyhpSQ8IQY2Nc27kZwe+CQ6o=;
 b=Lj5RLNiP0T6JzaPAo6qgrlLTrzKbWlJoDCDzeelUo0aC9pzhCMuRP0uxd7UpKUAbVvvVuf
 FjCJmsjtHwNmn1c6ItKJv6ORsECn764ku6CbEFGn1grYCd533yhGC/jOVA0JBXSaprRYhq
 guKLnabYAoI4Jz3Or4x2CSHnHVzdZ9w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-WPO-ilcjM26s9H-kyQO6jQ-1; Wed, 07 Jun 2023 03:34:16 -0400
X-MC-Unique: WPO-ilcjM26s9H-kyQO6jQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30c5d31b567so2489636f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 00:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686123255; x=1688715255;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/4kkmKCd2wl5ncm7VdRIyhpSQ8IQY2Nc27kZwe+CQ6o=;
 b=FiPhQmMvoVgvQHv4ynOj4iQtdH1lNW5iufKi+yea4/CGaDr3ib41Oadl+yfmU/9j6P
 cOeyR2JInSWkNWi/rdbkjbFTtJ4YsDrpf9HYwXFLADmRqslGz82yO4GBxUKJc7/PujXJ
 PnQjagNeGiBYhQVMPcqLAyUmG7MnrFlYYvS3HouYxK9cAoMecsbBd+G1yOqsI/Im2A1H
 1/h9qwLo2U72czaU+c8gHetUhw8i6BIdWNJwsBK/RSz4Z26AoY9+oDexegtAUa0XlZ0Z
 7UA8nQdXM/L16z7albfg1gvJqhTbkSeJTEo6kInt4p8PmGyCOfDizf33C7AN3MYDOcu+
 okVw==
X-Gm-Message-State: AC+VfDyljh3DWk1S4z8tSBnXJB8rW/382BKdBPpS8jam+txaM6NjmGLW
 PFs245/iTGDoubTAnNuz2y0+7tkze4dAz0+IJp82JDCe9OIe1EMp0udVj8WfTTwlPUA6YXyyNxa
 Aak83NL9llBTIU20G/v22BPLGL/i1
X-Received: by 2002:adf:de92:0:b0:2ef:bada:2f25 with SMTP id
 w18-20020adfde92000000b002efbada2f25mr3634434wrl.67.1686123255196; 
 Wed, 07 Jun 2023 00:34:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5kwgjMr0fDuyCE+y4fhZTqJkSHNU6+Lw9lBuHow6MJ+hyLq4N+EQ2nCyTNeqeilySEFyk4bw==
X-Received: by 2002:adf:de92:0:b0:2ef:bada:2f25 with SMTP id
 w18-20020adfde92000000b002efbada2f25mr3634421wrl.67.1686123254876; 
 Wed, 07 Jun 2023 00:34:14 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 3-20020a05600c028300b003f7eeec829asm1180357wmk.10.2023.06.07.00.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 00:34:14 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 01/30] backlight/bd6107: Compare against struct
 fb_info.device
In-Reply-To: <20230605144812.15241-2-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-2-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 09:34:14 +0200
Message-ID: <878rcvhgjt.fsf@minerva.mail-host-address-is-not-set>
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

> Struct bd6107_platform_data refers to a platform device within
> the Linux device hierarchy. The test in bd6107_backlight_check_fb()
> compares it against the fbdev device in struct fb_info.dev, which
> is different. Fix the test by comparing to struct fb_info.device.
>
> Fixes a bug in the backlight driver and prepares fbdev for making
> struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---

I agree with what was discussed in this thread, the check fix and rename
could be split in separate patches to make it easier to understand what
is changed. Regardless, feel free to add:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

