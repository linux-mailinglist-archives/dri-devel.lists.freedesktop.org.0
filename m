Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E124C265C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 09:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F1310F4B9;
	Thu, 24 Feb 2022 08:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05DAF10F40E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 08:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645691982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pLo3BT+JpXVVTvEFvgX4MJjwLYSwkDRz6mnMAcRuACw=;
 b=HitPFiWGp0LK4eJkNYtVb8meS+18NVIIml9VdsKHP7p9Dtzb9loEEA++sgrOj+9GhwATJ6
 8OdjKQvub10NwYHzzsgkKAip9KawM8M1K5MQ1R+34ZqXAmZxWgxzrBpNinxOruqoeF9OsP
 lb7K+HU+Dz33+VD+vZIr1W+liqlvaeY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-XkBhJokTNFaIl68m31VRIg-1; Thu, 24 Feb 2022 03:39:41 -0500
X-MC-Unique: XkBhJokTNFaIl68m31VRIg-1
Received: by mail-wr1-f72.google.com with SMTP id
 t8-20020adfa2c8000000b001e8f6889404so439634wra.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 00:39:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pLo3BT+JpXVVTvEFvgX4MJjwLYSwkDRz6mnMAcRuACw=;
 b=sWC1V4IEfbBuqrGXREZaTLWpqJvSRAdZ9E3lCTFo18h+wQmr3L09ulHoehnJHZn3oF
 s7Pqb1EG5hGI0d1rCti8Pmqr7Du6SFOSrns3Ii5BkSLkugemRiWGadCnuFCXVwuWwYgf
 RF1bPf5jkhmIK08s3zA2lRmiXrJPaBQ9TMPJAdb6oPlvL2oslm9O72fgyFTHqdQX02VC
 q0sPa+Nncxp+Re6RSTGtLROLCfI1+0oC/+6AJYdF2P0zQYgtx6rhXfgbuySxyvh0V2E9
 F67NQ1jzzLjF8vgO2v6MqUtKQaMr8mWJwl0mj1Bq3Xul9lsWv/UWDN98EcENa8ylXkw7
 Jx9Q==
X-Gm-Message-State: AOAM530Uv7zagmg5B5bMDl8jtRtJ6GnASrphU9MxDOFlXhgc9ONjq0ds
 XKv1VGrbX7r0CRwIzNrotyaLUYGeIsLTKeHZY3g0j6admg6Io+HHZihtnROPKKcd10O6gI8VI9B
 Uw3uyu9R0eJiKjT5DvEETCzvS+4op
X-Received: by 2002:a05:600c:4f03:b0:37c:b58:9c35 with SMTP id
 l3-20020a05600c4f0300b0037c0b589c35mr10410913wmq.118.1645691980322; 
 Thu, 24 Feb 2022 00:39:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7/+PPy5JuHjRbucsEnsdP1Hay+tcT6GGR3KRsDQQmXUJyHejk0aUvttSsAMn+eiRGPwn3aQ==
X-Received: by 2002:a05:600c:4f03:b0:37c:b58:9c35 with SMTP id
 l3-20020a05600c4f0300b0037c0b589c35mr10410895wmq.118.1645691980127; 
 Thu, 24 Feb 2022 00:39:40 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id b10sm2349050wrd.8.2022.02.24.00.39.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 00:39:39 -0800 (PST)
Message-ID: <16e21d99-26db-5e1f-564e-3fc1db600d29@redhat.com>
Date: Thu, 24 Feb 2022 09:39:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 5/5] drm: Add TODO item for optimizing format helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch, deller@gmx.de,
 geert@linux-m68k.org, sam@ravnborg.org, kraxel@redhat.com,
 ppaalanen@gmail.com
References: <20220223193804.18636-1-tzimmermann@suse.de>
 <20220223193804.18636-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220223193804.18636-6-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/23/22 20:38, Thomas Zimmermann wrote:
> Add a TODO item for optimizing blitting and format-conversion helpers
> in DRM and fbdev. There's always demand for faster graphics output.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

After fixing the typos mentioned by Sam:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

