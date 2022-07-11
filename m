Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1489256FFD5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 13:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960A010F5D2;
	Mon, 11 Jul 2022 11:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D281C1123EB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 11:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657538011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NgrB0b1hGhY+Hu6lpXdXevvlkiE7V1d2yqtg5tmfmtA=;
 b=deqcrmHHYjOSwTYBixOb1KrikdqX3Pcdi70XUE7vduP8jH1lINNvJaumaRpCTH2RcfJNwc
 7CGTA+O0XiI20lbfgbdd7bnWwgS8vjiOPIKJbpPM4VNlu9kiCLiE8aFAqcXF+EVVg15gEl
 qGzQFxq3Gc6QmaZ8cs27hY6xc6D92Ns=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-Hw5nI7LJMA284QVqjNIvkQ-1; Mon, 11 Jul 2022 07:13:30 -0400
X-MC-Unique: Hw5nI7LJMA284QVqjNIvkQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 p21-20020a05600c1d9500b003a2d6c2b643so3037190wms.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 04:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NgrB0b1hGhY+Hu6lpXdXevvlkiE7V1d2yqtg5tmfmtA=;
 b=Y6I9m1/BbmnrJONyFfDuzjcl/twOO2jleM4WQTHLF06axpqzZa43ZvbcVfSLMWKlTX
 TzuAMl9zKWrFn30qu1UQMDnl8RSo3BnPrQ1QhaJIRhsbiZ61rHeMU3YtkP32iOATflNN
 56ep1YvY/U6gCsJf8Ir038SKUFs2z88gvixAUpgMNryQwWrSJdM1JBmjObh4ovGIIT+W
 9OWZhR3+6arb4wxy5U6+4bc/XVKg1Vl8JTwK+xqH1DW0QmD7tVX0+8tTUzfXKfWNvYA2
 wR/XPSEfRPEOlSviq9StMDM04/DXepMDJKLGJbmBAwu4S4tKUfNmlShCnwtm0g0Srqhv
 lErQ==
X-Gm-Message-State: AJIora/pi1UwnRW8ImAuHRMQJP7CMfIVifSoqnx463AsDSDmfFnFug3i
 xWnYqtXuL6b65npntcHdEvYZzVVBuovETdFDKGr9C37ZOltSfnkq+3cTSrCGNgd6EvPM0tDJ9t/
 VzWQzM+4uiLIZfhsQbwAQB23aaVjM
X-Received: by 2002:a05:6000:1446:b0:21d:27ea:5a01 with SMTP id
 v6-20020a056000144600b0021d27ea5a01mr16485651wrx.314.1657538009262; 
 Mon, 11 Jul 2022 04:13:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vcs0nWJiY8DtaMjFckjPBveM2LCwxXVkUAHZMUUjNEZSyGr2GAAEWa2YiuJ4Zpzd1flJ5Yfg==
X-Received: by 2002:a05:6000:1446:b0:21d:27ea:5a01 with SMTP id
 v6-20020a056000144600b0021d27ea5a01mr16485626wrx.314.1657538009047; 
 Mon, 11 Jul 2022 04:13:29 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g10-20020adfe40a000000b0021d6d18a9f8sm5562294wrm.76.2022.07.11.04.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 04:13:28 -0700 (PDT)
Message-ID: <210b1ae1-f663-dfe2-d9b5-2cd827d15f2b@redhat.com>
Date: Mon, 11 Jul 2022 13:13:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 06/11] fbdev: Remove conflicting devices on PCI bus
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-7-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220707153952.32264-7-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/7/22 17:39, Thomas Zimmermann wrote:
> Remove firmware devices on the PCI bus, by calling
> aperture_remove_conflicting_pci_devices() in the probe function of
> each related fbdev driver. iSo far, most of these drivers did not
> remove conflicting VESA or EFI devices, or outride failed for
> resource conflicts (i.e., matroxfb.) This must have been broken
> for quite some time.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> @@ -949,6 +950,10 @@ static int ark_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	int rc;
>  	u8 regval;
>  
> +	rc = aperture_remove_conflicting_pci_devices(dev, "arkfb");
> +	if (rc < 0)
> +		return rc;
> +

I wonder if we could think of a trick to avoid open coding the same check in
all drivers. Maybe a combination of using KBUILD_MODNAME for the name and
a probe callback wrapper or something ?

But probably not worth to invest more in the fbdev drivers and could be done
as a follow-up anyways if someone feels like it.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

