Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783BA87DD35
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 13:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6B610EE03;
	Sun, 17 Mar 2024 12:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ipxeKbjn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54BE10EE03
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 12:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710679755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qSPsm2ZZVDvV0AkFvIhTyz4e6z0+4CVE3yr2sbXPMBw=;
 b=ipxeKbjn/JhtNGFu4o4Es/SsKgwtKWXoKyvguLa8VgewjxYteCp/VcA7CcJjTRs1hnQd+Q
 mQkHVsCmJB+1KzMtR56IMWe+YBdrJLDwo9kVJSvKiwHPAFPnZjf+DY9lNMmkNWjhaiO2a8
 UuIYDAeptCmrPJZiPFAuEmbR5KmDw8w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-8481PIDpNomfBlc8YGuD6w-1; Sun, 17 Mar 2024 08:49:13 -0400
X-MC-Unique: 8481PIDpNomfBlc8YGuD6w-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4140dd880b2so1637455e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 05:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710679753; x=1711284553;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qSPsm2ZZVDvV0AkFvIhTyz4e6z0+4CVE3yr2sbXPMBw=;
 b=XMi6szpEF4saV5GBTEYDcdF+qbJ/KhyITBnEhUT+bmge0haB58C3WRQnyoe84GLfpS
 WWE0eEcgKJnSebr7YgXRggXK0KJUR6g1zruobI87bM+o3Nh6WSfXwc5NLJPz5ZS1N3gK
 2JMQqVLJVqVebH1+zqo0aBa4IZl4rpNdi6VWqjTNCuxWr0t0CoGN3KM753k7TuJ77j8L
 DprPi4YikLlQoXqx6wGEDJl22lQFpXa0P0FasLunU/UgJaiVJ+4iYxPsn0Nbg8q5SzeD
 1vIrgSPgJQZkyTBVbKMURNJ8pRUjlxl9BmMJBOiOHYdeI+9In289etkSppeODGk7vifo
 WAcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbKiq9MSYE0Fh4DD3gg3HiWTAUxiKWhi8q7cBoSiWf+UI8jOOMHuZX20HsFncBwXAnf6URitVZwMK0rucTFDyhDmFGJFwWkXOOWsglExYd
X-Gm-Message-State: AOJu0Yw4LMN8H5IBtTTE+8iDUcQPsRfp0z2p57Kot+n4KG2aaVVp8eUg
 gzitclD1t4KoJBFk5bgkELd+6ysi/zUWdoyQzOmM/JU1Jv+niLhcCVlg7QF7uVCpYAxnyuFfMFO
 wNcBLlEObZqI8cvi9gJB5BYgtTFP5C6Ihw7ELwSUcBIu+OZO4PIKbZidFDSCB325e9w==
X-Received: by 2002:a05:600c:1f85:b0:414:24b:2f4e with SMTP id
 je5-20020a05600c1f8500b00414024b2f4emr4685034wmb.39.1710679752782; 
 Sun, 17 Mar 2024 05:49:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHs3diPQvSiy1+AZquGxl82tDDaYoG/FSkcFhi7h/8bS28ZCJWxwnlxo1bAMtufKaIY9J43Qw==
X-Received: by 2002:a05:600c:1f85:b0:414:24b:2f4e with SMTP id
 je5-20020a05600c1f8500b00414024b2f4emr4685025wmb.39.1710679752393; 
 Sun, 17 Mar 2024 05:49:12 -0700 (PDT)
Received: from localhost (231.red-83-48-46.staticip.rima-tde.net.
 [83.48.46.231]) by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b00413f035d58esm11642656wmq.10.2024.03.17.05.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 05:49:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/43] fbdev/deferred-io: Move pageref setup into
 separate helper
In-Reply-To: <20240312154834.26178-3-tzimmermann@suse.de>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-3-tzimmermann@suse.de>
Date: Sun, 17 Mar 2024 13:49:11 +0100
Message-ID: <877ci1gh14.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Set up struct fb_deferred_io_pageref in th new helper function

the

> fb_deferred_io_pageref_lookup(), which runs when the pageref is first
> taken. Remove the setup code from the rest of the code.
>
> At first, the code allocates the memory of all pageref structs. The
> setup of the various fields happens when the pageref is required.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

