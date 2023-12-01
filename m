Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4AD80064B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 09:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5171C10E836;
	Fri,  1 Dec 2023 08:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3193610E82A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 08:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701420852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Pbr1Dv1dvhQFSASepFeXXLAmwvC8VYXypnppxj7crc=;
 b=W8wK7+LBTBEa8LkFPS5coT5sQNJNN3BDRFw+/juwKy97oPjlFGTEh2LqUPoWsoQa9NR3uB
 PH5Y2Zq3+mDH3nQQl9bRoYO6fq16XuFyMSpBMgR2Fp6XlEq/SSPCGE9x0U/K7TUC7HdKzj
 WTy6Oh9QdBFc3yP8zjsE8Rfuz7xKZ5A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-JlNxSHlgOtyNP2cVzLvNNQ-1; Fri, 01 Dec 2023 03:54:10 -0500
X-MC-Unique: JlNxSHlgOtyNP2cVzLvNNQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40b53c8194cso12646895e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 00:54:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701420850; x=1702025650;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4Pbr1Dv1dvhQFSASepFeXXLAmwvC8VYXypnppxj7crc=;
 b=NBQZGa1l1SDkPNL3AyJxQinim7pL8693gzvVSom8i4DnKk9ti9e48Y6E45QKpXNFQ/
 1hXHwKCMIMSWu5i+t4plEtzFl6grxEZw15TFxiWnxA1xphS+gHSN/x8fymTWoxpTo8ZI
 5Xah1Zr67ZZKQAlIN8kuzzS8kygToUjqbjfV1pxq0KZkxteG27mx1M1PeClLLkivceVe
 2KXAJoSnAQw3YXpdbHyjHWFGFILq6VXD/nBCm2FIa4NFM5ihbDkU3t9eiS9rGdtlfJxs
 HgLpVIjw1h2EC+qafTzdEvzawyMDGGLXkRRI50pQhD3npD5H72HX7ZEVzfw1G1esXWqW
 Guxw==
X-Gm-Message-State: AOJu0YwLAvrdeMF/dUdjJLLAR+8gQXU9WEJtHYXLvRVS7/6dLr3aNkzN
 fP7H1u1BSa9Yl+TYu7xaOFm/KQi3fAmesXLAwniyLyxh3lPQT8oe5KiJAR590TeR1eDhzB5S9D3
 xnA1rvHkUOIdr0SqyebB4HeJDtv93
X-Received: by 2002:a05:600c:198d:b0:40b:5e21:bdc6 with SMTP id
 t13-20020a05600c198d00b0040b5e21bdc6mr219059wmq.85.1701420849844; 
 Fri, 01 Dec 2023 00:54:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+m+mUUxd+MdEV6NuzsUIPWLqYPAU1I5t3ON2imSsU+wNGGrRr0d8jVur/P8FuaIggJYX+HA==
X-Received: by 2002:a05:600c:198d:b0:40b:5e21:bdc6 with SMTP id
 t13-20020a05600c198d00b0040b5e21bdc6mr219051wmq.85.1701420849516; 
 Fri, 01 Dec 2023 00:54:09 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p5-20020a5d4585000000b0033314c63881sm3659797wrq.22.2023.12.01.00.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 00:54:09 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, pjones@redhat.com
Subject: Re: [PATCH 2/4] fbdev/efifb: Use screen_info pointer from device
In-Reply-To: <20231129155218.3475-3-tzimmermann@suse.de>
References: <20231129155218.3475-1-tzimmermann@suse.de>
 <20231129155218.3475-3-tzimmermann@suse.de>
Date: Fri, 01 Dec 2023 09:54:08 +0100
Message-ID: <87v89il2vj.fsf@minerva.mail-host-address-is-not-set>
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

> Use the screen_info instance from the device instead of dereferencing
> the global screen_info state. Decouples the driver from per-architecture
> code. Duplicated the screen_info data, so that efifb can modify it at
> will.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +	si = dev_get_platdata(&dev->dev);
> +	if (!si)

I would add a comment that this platform data is set when the device is
registered by sysfb.

> +		return -ENODEV;
> +	si = devm_kmemdup(&dev->dev, si, sizeof(*si), GFP_KERNEL);
> +	if (!si)
> +		return -ENOMEM;
> +

Why a copy? In any case maybe the global screen_info should be duplicated
when is set as the device platform data in sysfb_init() ?

I agree with the direction of the patch though, so whatever you decide:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

