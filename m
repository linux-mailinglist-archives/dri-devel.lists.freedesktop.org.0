Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C27CB69A748
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 09:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB42810EF27;
	Fri, 17 Feb 2023 08:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E0710EF27
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 08:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676623586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zj7ME0Zls97ljpljDJh+52JR4W0iO9sdC4iOpN3awy4=;
 b=ed10CBbG9OJ8IzQUuggSMXWepuFGJwzI39+m5Gg5oM6/yWUuM37FoTZ6YYtNIIi988pNQq
 N4yeXLAm5Z6OqqMv4jV8cJe6yESuDXEDQZf1B+GUeEEcOJ++XCocFGWRlB0A2poVKCWOMR
 nXLeqbZQEU6hXg/jepD8Z1vPBoDNeys=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-375-AmOhaRJTOJO-QNsGqobbQQ-1; Fri, 17 Feb 2023 03:46:22 -0500
X-MC-Unique: AmOhaRJTOJO-QNsGqobbQQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 y11-20020a1c4b0b000000b003dc5341afbaso373611wma.7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 00:46:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zj7ME0Zls97ljpljDJh+52JR4W0iO9sdC4iOpN3awy4=;
 b=IHj5tTDSsOqj71Pc3v4ktSivIKed/XTKRMXzEMKMUZjQ80KON2fnERQLl8k9OOmKta
 3icrvb89KNFghK7+Ua0X7eu6WazUbN75xOVsyvt0Rv8HHSKmQmCQ32qy5hj51It8jykZ
 8ztZWLLfG0T/4tm8g4mZzsa+liBkfPkkxNnSfHzLAPMUWvXL1FmABcyK1dAcH3QkaKVG
 jKLR/moGsh0tvScw6i0whuvW4n0e3dgObuXB73jFmNTwby42EDBxp4WR7womlmtOyjbq
 UNTkPtjDDxexMPUpdIPGBxCGip89m3GbmS9e3YlHY8EITBOL2a+2dhCY4VFUEDfeA+K2
 XIhw==
X-Gm-Message-State: AO0yUKVzG8ELsANRCOOo+fkxzQLGlgRbZ34VIB2QDoWx0nGIJB3jlY7n
 zV92420ZaXCvN2ewpYAZ6sVzLpNYwf6agqYMs1r9MdPpWPafr7TbMHMupzWMqlSbqk5DoIdDWIg
 Hil/YIIe2aJg/YUVemnfNGhP/yyi2
X-Received: by 2002:a05:600c:4d8a:b0:3e2:115f:4052 with SMTP id
 v10-20020a05600c4d8a00b003e2115f4052mr3403436wmp.17.1676623581799; 
 Fri, 17 Feb 2023 00:46:21 -0800 (PST)
X-Google-Smtp-Source: AK7set9+hq4+2Bza33qEvtq4Ut8E7x8aQSr+iMyJJkN2Oiss1vlbpJK+6bKPo4cnPxZn5QWxBOW1Dw==
X-Received: by 2002:a05:600c:4d8a:b0:3e2:115f:4052 with SMTP id
 v10-20020a05600c4d8a00b003e2115f4052mr3403421wmp.17.1676623581539; 
 Fri, 17 Feb 2023 00:46:21 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p17-20020a05600c1d9100b003e21dcccf9fsm2587825wms.16.2023.02.17.00.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 00:46:21 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 04/11] drivers/ps3: Read video= option with fb_get_option()
In-Reply-To: <20230209135509.7786-5-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-5-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 09:46:20 +0100
Message-ID: <871qmoy90j.fsf@minerva.mail-host-address-is-not-set>
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

> Get the kernel's global video= parameter with fb_get_option(). Done
> to unexport the internal fbdev state fb_mode_config. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

