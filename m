Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C910E83904B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 14:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B2410E43C;
	Tue, 23 Jan 2024 13:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABAC10E43C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 13:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706017101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eIEgnQ9c50Sj+zsvA8MdnvK0Mjj4Z9htr/i8+xUw1GA=;
 b=evktzCJENuDTsxU29PZEue6YxG8/oku9YApco69+rPw0xObj9LSenxnDcPstWbLmm5n6pO
 v2yb1Y+9ejXyr3n/ynSmq2ZtgVcBk0cEslOJO1f+1zd8zNgwDMgrjQYkbAt3FCYgQm64e4
 lfRtQhdWZolr51rFzGL5X5S0nvmqugI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-NtytBx7MNZ-a7O-e719riw-1; Tue, 23 Jan 2024 08:38:20 -0500
X-MC-Unique: NtytBx7MNZ-a7O-e719riw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40e5980dfdfso36204025e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 05:38:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706017099; x=1706621899;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eIEgnQ9c50Sj+zsvA8MdnvK0Mjj4Z9htr/i8+xUw1GA=;
 b=W54WSN9UvBjLjqs5sqpksRUh7E34+jsq7ce80uR88f7VIcf01vcYAPHbO7rUanfSSa
 HhtoCmiDCu9sJklyLQ1h4hv7fBEefYpDvflQiADwPD9J3qg9Bl7LtLtuHNlfaFcRDoTn
 YO1/a9hTYe6XDho6yJ0xTQsQ9KbyS6947+dKPQPzKebsXpxFyBI+9UrpUC4k4Jq1+35X
 foWd0HQ9bZ0yDiljuOBiXTpejfQKDI1nnVawo7px9emn7IXNeoZ0MKoiwLlyKnVSD9mi
 052JR4YtzJzmLXdvktuwU2kosKLCtWA5NXgo52AxF4tU1kXbvW+mcaq5jqvZLCpA3zsP
 7ekg==
X-Gm-Message-State: AOJu0YxyymYcCO7dvFdqnD4ki15Kg+dZSDv7oFfd7jn5fIU1k+4wXcdE
 w6obERIQIOi72q/QrStKF6MRSNlFOS5EDhDPZ0lCXlGCycmlKL5UVjm27Ygkagrs3foONkMcOxz
 2mnCa4aJwjDGupYbdwARJrAgigh5BQkE1lr2MG84k1c6yvCxjRjtbqHduKkehmHrR4Q==
X-Received: by 2002:a05:600c:4e88:b0:40e:b313:9da2 with SMTP id
 f8-20020a05600c4e8800b0040eb3139da2mr155372wmq.90.1706017098955; 
 Tue, 23 Jan 2024 05:38:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXaxkDqdTjqQUUG1IEKUig0tKAlfzSQioI62GUGYo2aeuE2fALmv9NQ4rZZcK0tCK4jCvWnQ==
X-Received: by 2002:a05:600c:4e88:b0:40e:b313:9da2 with SMTP id
 f8-20020a05600c4e8800b0040eb3139da2mr155365wmq.90.1706017098635; 
 Tue, 23 Jan 2024 05:38:18 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c154600b0040e880ac6ecsm22681842wmg.35.2024.01.23.05.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 05:38:18 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, chenhuacai@kernel.org
Subject: Re: [PATCH] Revert "drivers/firmware: Move sysfb_init() from
 device_initcall to subsys_initcall_sync"
In-Reply-To: <20240123120937.27736-1-tzimmermann@suse.de>
References: <20240123120937.27736-1-tzimmermann@suse.de>
Date: Tue, 23 Jan 2024 14:38:17 +0100
Message-ID: <871qa8w4om.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jaak Ristioja <jaak@ristioja.ee>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> This reverts commit 60aebc9559492cea6a9625f514a8041717e3a2e4.
>
> Commit 60aebc9559492cea ("drivers/firmware: Move sysfb_init() from
> device_initcall to subsys_initcall_sync") messes up initialization order
> of the graphics drivers and leads to blank displays on some systems. So
> revert the commit.
>
> To make the display drivers fully independent from initialization
> order requires to track framebuffer memory by device and independently
> from the loaded drivers. The kernel currently lacks the infrastructure
> to do so.
>
> Reported-by: Jaak Ristioja <jaak@ristioja.ee>
> Closes: https://lore.kernel.org/dri-devel/ZUnNi3q3yB3zZfTl@P70.localdomain/T/#t
> Reported-by: Huacai Chen <chenhuacai@loongson.cn>
> Closes: https://lore.kernel.org/dri-devel/20231108024613.2898921-1-chenhuacai@loongson.cn/
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10133
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Thorsten Leemhuis <regressions@leemhuis.info>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

