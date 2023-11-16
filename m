Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6D27EDE7B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB60710E5BF;
	Thu, 16 Nov 2023 10:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD4010E5C5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700130592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s4K0NJtAI8Ut/gylc6ZVPplq/yszo6HBWl7CF/uc+l0=;
 b=VsXZa7kXPLSkquJHg9jRNEbp5Ap2wM07Soq4aSMT5tcUVOIR29TLtFkw2r0g6KVa202iGC
 yZTbzUD0CBQ925FSWwrgt0KjJ/5axSjeMJe0w1VMhSfvgZSz2wT2m+7+RuVtdP1U+S+Iv/
 ug4Vx9h19K+VggCtM/1Z/wxjG/5GPrE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-FjZej9tWOaKyWoQZ4GMKtQ-1; Thu, 16 Nov 2023 05:29:48 -0500
X-MC-Unique: FjZej9tWOaKyWoQZ4GMKtQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40a5290e259so3371995e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 02:29:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700130588; x=1700735388;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s4K0NJtAI8Ut/gylc6ZVPplq/yszo6HBWl7CF/uc+l0=;
 b=bSXlOw/AAIXDIvhAnYF45y2U3v5yvGgNSp/fg6H552YBmSabxmOSuYp837Lj9A/xeR
 DMkIN+/T6ZWiP5ZZug4wkA4TAN54+jfi9c2Ixm94UrwwVsouIQAYFSbvYu51I49yhGkS
 W/a+mSpS10iZnf3EaVVKevfpsx/eTavt25XoS9fYY+Sx5prFiDsIn9APU5Amu/0Tpt8V
 t6WVoqICh7eQTPCf52PZCWZhR+unUN48j8lviWAicbiOOx0xY3HDAD7qnk/edA3nm2av
 Sze4ZYEwC0HmqumbvYM52qpZB4Lorajl8KBsQWBmpsI7owwGzcQZ7vUBMHit063gcK49
 bmFA==
X-Gm-Message-State: AOJu0YyWnitHwMK60Np+Y8G4qN7PQC8NeJ1YbsRMYO7fu0bBXXIPVO/K
 F5W5URGqBxw/G3g51ZJi52+7x0p3B7CZv8I1aj+icZJvBscWrfEP++w3MgZVXk5uwy3wWOsJ8do
 HCxUg/wJ+9i6t1cXqVkwUex+M7axg
X-Received: by 2002:a05:6000:1786:b0:32d:ac49:2bb1 with SMTP id
 e6-20020a056000178600b0032dac492bb1mr13618213wrg.63.1700130587860; 
 Thu, 16 Nov 2023 02:29:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgdsoziH1ZKEaEPDcC8kszLbLsQivWBIF52pYZtiDhTohP8oeKvhhcyaQz03bxlr6BsqAL7Q==
X-Received: by 2002:a05:6000:1786:b0:32d:ac49:2bb1 with SMTP id
 e6-20020a056000178600b0032dac492bb1mr13618201wrg.63.1700130587589; 
 Thu, 16 Nov 2023 02:29:47 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p15-20020a056000018f00b0032d96dd703bsm13215613wrx.70.2023.11.16.02.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 02:29:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 12/32] fbdev/sh_mobile_lcdcfb: Set FBINFO_VIRTFB flag
In-Reply-To: <20231115102954.7102-13-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-13-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:29:46 +0100
Message-ID: <87leay3s9x.fsf@minerva.mail-host-address-is-not-set>
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

> The sh_mobile_lcdcfb driver operates on DMA-able system memory. Mark
> the framebuffer accordingly. Helpers operating on the framebuffer memory
> will test for the presence of this flag.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

