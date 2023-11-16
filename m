Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C997EDE14
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D50F10E2E3;
	Thu, 16 Nov 2023 10:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B6C10E2E9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700128835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aix+qLa2JZVyx8zPyk76uQKCOlbsbX/nflXBJMLRqWk=;
 b=DmBA19Cm+RJJNM0UJLMAwWUWe64peroJ5hQjtTGm9YiVBPnAdNpfIjJCFX1Nu4RI1NbLEX
 s93qhGPac9rerREOY5cjcJ9665YBrz+ARX2Zm/1qztCEcXqXIDTTXay+Ty6jiJNvlOWD1t
 YYcwDZ4lhgxBstIhBoL7dvtAKkb6rVw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-oU3rajuXMwKCdnbPRoDS8g-1; Thu, 16 Nov 2023 05:00:33 -0500
X-MC-Unique: oU3rajuXMwKCdnbPRoDS8g-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-408f9e9e9b0so3177335e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 02:00:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700128832; x=1700733632;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aix+qLa2JZVyx8zPyk76uQKCOlbsbX/nflXBJMLRqWk=;
 b=V8rHq9YPZYdnd+Mnm9JuEWEsb5DVsZQNHqyDFL/QbO+FXkUIPZKfGxioHgR90JR6Lm
 UmkQ9wjjO36aRl0ZMRcdvzWRmDMIHV6krntcgHidUUh9X/fc7Lzx3CUAznaQa+JdSCWb
 H5fSKEGp7i3IjyjTeMM091ek22SOglur1b4pbqTAGM2CRtM0rqLFXf3RirHugzwGfXF8
 FmiRTqbLksQCTEE9Yiig66ZySMNai+l+rnxkkQA3IqW483e4AzVj+qg5gQdT+/q5OLXh
 xbRJOm6Hvce43uKCX0SGct4sbKIorJjWsXbfEVZfBtzO0AR4miNrRRPtR5c/g+vZ6vlY
 Ac6Q==
X-Gm-Message-State: AOJu0YwrD4jxRhE1lSewfCct1wZmkahi6Zdyd3w7L/GA+Wdyp0/E17j3
 8LYangObrYhqM07Jy99KAYTVZSfQyVyu01GhwE/c7cGgX4zNIshrqs8O/z9DSlVb1OZRPrzpxQ/
 qf1Azt8sTpuZpkx8Pb0A1czEuSFCf
X-Received: by 2002:adf:a347:0:b0:32d:a405:b6b7 with SMTP id
 d7-20020adfa347000000b0032da405b6b7mr11031369wrb.32.1700128832209; 
 Thu, 16 Nov 2023 02:00:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSAU15esNJuVx/9XqjnsNdvj/tNjNqHIRKF6duesUYhUqC5ezx9srKFBjRMBp8Pok7diS9hg==
X-Received: by 2002:adf:a347:0:b0:32d:a405:b6b7 with SMTP id
 d7-20020adfa347000000b0032da405b6b7mr11031355wrb.32.1700128831885; 
 Thu, 16 Nov 2023 02:00:31 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i16-20020a05600011d000b0033134ab9691sm12965840wrx.57.2023.11.16.02.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 02:00:31 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 03/32] fbdev/vfb: Set FBINFO_VIRTFB flag
In-Reply-To: <20231115102954.7102-4-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-4-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:00:30 +0100
Message-ID: <87bkbu5875.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The vfb driver operates on system memory. Mark the framebuffer
> accordingly. Helpers operating on the framebuffer memory will test
> for the presence of this flag.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

