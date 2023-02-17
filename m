Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA1A69A752
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 09:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA5C10EF32;
	Fri, 17 Feb 2023 08:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE8F10EF29
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 08:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676623657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zj7ME0Zls97ljpljDJh+52JR4W0iO9sdC4iOpN3awy4=;
 b=OXTt1BNvzCXvaOXn10V15wbFCJ+EnKtM/j0M5/Cm6WFAO4CeLFgRPlMTgZBJFm+fyou7hh
 bjq/olu6UqkrIhYRB/lsDULyigUHyggIjCRJqeLQUBHfg0H/4VweW03dEcjWIDf6Mp7iPN
 kLXuB80ilkl8FAWV2K+E5YpT13AAVTA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-369-hwgNw7DAPpqxZDlKbojVqQ-1; Fri, 17 Feb 2023 03:47:35 -0500
X-MC-Unique: hwgNw7DAPpqxZDlKbojVqQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j26-20020a05600c1c1a00b003dc5dd44c0cso348968wms.8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 00:47:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zj7ME0Zls97ljpljDJh+52JR4W0iO9sdC4iOpN3awy4=;
 b=hc7iSSxrWAhoAKsty8Uh+fqX/vtMyPTd0c7e7IO7DRFYTMp/mBt8hu5hHJm01n+D/X
 sQ06EsDqLFkCFHvHuNOH5s0e1yHRPYa9nCjoPsZ/0Wiyr9KGr9tN5I5U5Ny9a+8Vx1W4
 VbsJzviLOcd12fmR1Vw8lKKiQlxfVjYIW+NVY8d/7QtCWaAqIS7YConR/WhQwAAY0njZ
 GXsTEoPyJV8WlVDtdMVcyQ9LTYK71tJy3d/pcztz4gVcpp+hicg5oDUkvSex5I4SdsGI
 SntdxYf9Q0EmAdFXGzry9NTUU7kTtLh5V47dlexu1LzBQ8+HvgdE3Z5yPummNYP5LBxz
 vLgQ==
X-Gm-Message-State: AO0yUKWpIM6NPRNU+IVOtkhPb9EOUHI793VfUewOBaow2KUqxNIjUj3L
 ft6ffzyCpxsATZDZvo7HRgvQW8kwqX8+4pzAaaAFdpj32V57WuX7pIaWW54048v1f8ih+LWGHME
 z69sNwrHaYsjNfJEoZVLp6ZvSQp7z
X-Received: by 2002:a05:600c:1f06:b0:3dc:3b29:7a4 with SMTP id
 bd6-20020a05600c1f0600b003dc3b2907a4mr3949710wmb.0.1676623654732; 
 Fri, 17 Feb 2023 00:47:34 -0800 (PST)
X-Google-Smtp-Source: AK7set8S21a9xd9g881WvJoZPdWpHm1HFt5AhnZt79SXVbCgeie8WxKuAJO0erg8jgYguXWLyobjnA==
X-Received: by 2002:a05:600c:1f06:b0:3dc:3b29:7a4 with SMTP id
 bd6-20020a05600c1f0600b003dc3b2907a4mr3949692wmb.0.1676623654489; 
 Fri, 17 Feb 2023 00:47:34 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bh25-20020a05600c3d1900b003dc5b59ed7asm4471660wmb.11.2023.02.17.00.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 00:47:34 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 05/11] fbdev: Read video= option with fb_get_option() in
 modedb
In-Reply-To: <20230209135509.7786-6-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-6-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 09:47:33 +0100
Message-ID: <87y1owwue2.fsf@minerva.mail-host-address-is-not-set>
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

