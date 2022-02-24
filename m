Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8784F4C25BF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 09:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B434F10F32D;
	Thu, 24 Feb 2022 08:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3142810F322
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 08:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645690948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jkN+QCFWjhBZcF3q6Kse5Vg2WTpTjJb8OgeE2AujL7U=;
 b=ZPUsrzy0mMdj9tuVMrVpAdpbakENtXFIVscCu9I7oFmXQpYs1DulEH9jOMlorLuDrSEEjy
 lOCNGiSoJA+SGcA9DNYo+el5rVGYHuqZnPwJp8oQ0vG/VhD+2nHiLSaxA470DNNX6PFZM+
 oXc5+KN1mFosshkmKJEINF1UegUh2co=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-lflKWNGcNHOVcdyZlntkwA-1; Thu, 24 Feb 2022 03:22:26 -0500
X-MC-Unique: lflKWNGcNHOVcdyZlntkwA-1
Received: by mail-wr1-f71.google.com with SMTP id
 y8-20020adfc7c8000000b001e755c08b91so396034wrg.15
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 00:22:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jkN+QCFWjhBZcF3q6Kse5Vg2WTpTjJb8OgeE2AujL7U=;
 b=bYvNPGU0Y6rri9LDXcLZzgOOzRQAGqcTaWmT89FUcl731sE1chUrfl6xZiZsU90N+M
 cy1jLioqTgWbUjGhCRt8LLoKUiSyTqAvNbEwAE+pedvMjxIZ25Inh5G2YDNNh2h2nuUO
 pvvVMbqEV0xaTmuGe26xV1Kr8KT/I3IErinBIXg1k75AVFiAE8q2SwJL39uCe5I2xiIS
 cQYB22Q7CC7fWTXN430QZkjJylkXpy3ZltQe6XJu/uNyZTDz9/FdERgTYlQKaSnE+7hB
 TMckqa+JrzCqMK133cx0P0o4PM41DsAfeZGne6QzrW+2GlotJdpt8WXtKHJ3pAGTiKFm
 jKNQ==
X-Gm-Message-State: AOAM530AZ+ooOePKfDySoqnJ1i9ki4qgxmAgjcK/GXSzpd7kI+0irFGe
 XT1EszysTSYBYPixp4D0EeqVQv0jh5eEnhkkVz/4xLNsjPxE+7MGbdZzyDtXsPDllfLz4iWeyV6
 /0rnfe3nJJvpUgEmDT/Dm8yptxgA1
X-Received: by 2002:a05:600c:1c1a:b0:37b:ead2:8e6d with SMTP id
 j26-20020a05600c1c1a00b0037bead28e6dmr10829655wms.94.1645690945564; 
 Thu, 24 Feb 2022 00:22:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyv952eS8lOwFIzJtL+dkZyisK//nGSmETYzeXCs8mWOE9vRC3EZj2P41tAgcq1w3BRU5+wRg==
X-Received: by 2002:a05:600c:1c1a:b0:37b:ead2:8e6d with SMTP id
 j26-20020a05600c1c1a00b0037bead28e6dmr10829644wms.94.1645690945335; 
 Thu, 24 Feb 2022 00:22:25 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id n15sm2023738wri.80.2022.02.24.00.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 00:22:24 -0800 (PST)
Message-ID: <4c124a6d-f805-9235-301b-3525c4f0fdf3@redhat.com>
Date: Thu, 24 Feb 2022 09:22:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/5] fbdev: Remove trailing whitespaces from cfbimgblt.c
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch, deller@gmx.de,
 geert@linux-m68k.org, sam@ravnborg.org, kraxel@redhat.com,
 ppaalanen@gmail.com
References: <20220223193804.18636-1-tzimmermann@suse.de>
 <20220223193804.18636-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220223193804.18636-4-tzimmermann@suse.de>
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
> Fix coding style. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

