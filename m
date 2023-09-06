Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9047938BB
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015B610E5B8;
	Wed,  6 Sep 2023 09:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A5810E5B8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 09:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693993535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UlEOBu/VE6tjdzL9UJOCpexRbWh3hX2rULyWpu7l158=;
 b=cilXly8NEdvxAyKzLGZlv06W8dA75Ea6BSaoIp2ClcIdR5an/I8fCSJoEbRih1+pk13eqb
 VeT318nob5fuZf3Hy81u0V2nDBrUL2dssxdzqAVPrsd365jMIX5sBbiVVvp7xDzHbqqcxn
 gtWEbMcVYBvv7NuHVujOh4y0mS6p/pU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-lh9HWi9zPUG03doAVrkxgw-1; Wed, 06 Sep 2023 05:45:34 -0400
X-MC-Unique: lh9HWi9zPUG03doAVrkxgw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fbdf341934so21358665e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 02:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693993533; x=1694598333;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UlEOBu/VE6tjdzL9UJOCpexRbWh3hX2rULyWpu7l158=;
 b=HBY3AMwE4U0WD0jpghjVPrlkb2dMtMSxZyJh5r9yblENdPRmpNbUBH3A7rMkzQhqk4
 1tzoRdFQZAdKYU2VcHHHKQ+wDSTytFgrtpHISfAyWfT3PP/pUQaCeCZLjytAl8HTsr+8
 L9b0qpRyVM1mfID6VOOfCq2w5mbVzKI3W5DGTCZUdTb9fjFW5MzTkLBu4ruQ5To3KNix
 ad2wmG/63b4wc65Hm/ah07H/+HsQP6SYjD6ryrmR3pFcLcnrr+1OXF4842PzIVlhIicP
 SeISrXIfPOhrOeoF+4jHGgFrGQurddJBLZUwgCN/zZPsl1mj5ILJAPdtP3oQ3OJRDMzm
 r0OA==
X-Gm-Message-State: AOJu0Yy8CHXdqHKIELsBvT+djcT137YxvmSsLUQaWMISDd0t8sqgSwiG
 OmpyuF014GKnu2+msDEjeIZ79Pi1mr85STvg0mfMQU6Ly0qCNY6A7oqr4hT1gda6ukbifGiLa85
 wBQ8BnjdbDUQjhp3+VbdOnKCuSoQu
X-Received: by 2002:a7b:c01a:0:b0:400:419c:bbde with SMTP id
 c26-20020a7bc01a000000b00400419cbbdemr2083808wmb.18.1693993533251; 
 Wed, 06 Sep 2023 02:45:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvzjMv9fXcOqlGgHExO0/Bky5TAsfqUJ4gFKWD/812OOB2n+3Ka+NKF8N9/cFpNJ2b058T6g==
X-Received: by 2002:a7b:c01a:0:b0:400:419c:bbde with SMTP id
 c26-20020a7bc01a000000b00400419cbbdemr2083793wmb.18.1693993532950; 
 Wed, 06 Sep 2023 02:45:32 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w17-20020a05600c015100b00401d6c0505csm19255994wmm.47.2023.09.06.02.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 02:45:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/7] fbdev/au1200fb: Do not display boot-up logo
In-Reply-To: <20230829142109.4521-2-tzimmermann@suse.de>
References: <20230829142109.4521-1-tzimmermann@suse.de>
 <20230829142109.4521-2-tzimmermann@suse.de>
Date: Wed, 06 Sep 2023 11:45:31 +0200
Message-ID: <87o7if4ouc.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The fbcon module takes care of displaying the logo, if any. Remove
> the code form au1200fb. If we want to display the logo without fbcon,
> we should implement this in the fbdev core code.
>

Agreed. I see that this code has been since the driver was added in 2006,
I wonder if was ever used. Enabling a fbdev driver without fbcon doesn't
seem to be a common configuration.

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

