Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 617A0570050
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 13:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE5C8D512;
	Mon, 11 Jul 2022 11:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7838F8B94C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 11:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657538650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXcH7XPyiqXQf/YCraM2DsGXqmeqYbmlOyORvpQYVqY=;
 b=BY9w51aR0GEJ946HDp5FVJz/aHjCy+LxRWpPlfVOfbNxyRdr3GEyFN6SuYL1nLI5fd0dBr
 dnZW054ftjGCVELM8/V+Fp8yQbM5PVEAzR7YCbWuqJzmI05Ito8fthFHyv5sMvryNZ+yhL
 LgmWiicAFhrscB8PohRIxQwpeDaJhLU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-V7Ro65SiMIaByt4wcONtlw-1; Mon, 11 Jul 2022 07:24:06 -0400
X-MC-Unique: V7Ro65SiMIaByt4wcONtlw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r186-20020a1c44c3000000b003a2daf644f9so4795198wma.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 04:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PXcH7XPyiqXQf/YCraM2DsGXqmeqYbmlOyORvpQYVqY=;
 b=YujqtPyQLiCmS7n1z3+nhCGs53o3HgzqyLyN77EmOCcy0C8yc7mqU2CmiCpLROcXo8
 qQGwOjk6koB5kXZydU7IXuEkQYSBFhW1zl1pM6y7ebn6JsIPKzPSvifDoFx3r4MM495G
 AO/VtCkDyPDgv2OwqAEDeFjwptN3TbHwSO41MVkGB2nr8P4RHQIEzDPcbc3g8LTR4etX
 8mLh9N1qpxFvhLRnQvGEsqEZlZ1mfeyOov9XXc4uAEHDMcoGBmxZEeswGvd2GifumNQk
 xUL1epkAIK9A8zB8ArEFOVpXsKtM+rceTnxg34DsyRwcKACOK9vHwHeLVfw07pJrGPtM
 8xuA==
X-Gm-Message-State: AJIora+UT/1dKCY93uYW5JwVrKDP8FVLO5AsmaDjTN9nd9DGDrCihSdS
 KVz0PmyCySr83H77Y0VrixJifzK90xZ9w26Snt5HJInY6SdJqHXheLq6UyfGxQZaNtEqcZ9Ohzr
 uMjRyVnVvgrkFDsDxX7Hd7ZqWQTOX
X-Received: by 2002:a5d:6149:0:b0:21d:6ba7:6095 with SMTP id
 y9-20020a5d6149000000b0021d6ba76095mr16111654wrt.680.1657538645787; 
 Mon, 11 Jul 2022 04:24:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t+UhotmR2eivMrEaSMsPtL4oXAPCvxQ5CRcLHZzaRlgXGZLXCBF4emHYXNPE71YvR1EZ7rjw==
X-Received: by 2002:a5d:6149:0:b0:21d:6ba7:6095 with SMTP id
 y9-20020a5d6149000000b0021d6ba76095mr16111641wrt.680.1657538645616; 
 Mon, 11 Jul 2022 04:24:05 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q1-20020a056000136100b00210320d9fbfsm6783085wrz.18.2022.07.11.04.24.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 04:24:05 -0700 (PDT)
Message-ID: <b0f5479c-1880-65f5-3870-191603468828@redhat.com>
Date: Mon, 11 Jul 2022 13:24:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 09/11] video/aperture: Remove conflicting VGA devices, if
 any
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-10-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220707153952.32264-10-tzimmermann@suse.de>
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
> On the primary graphics adapter, a driver might conflict with a VGA
> driver that controls the VGA framebuffer I/O range. Remove the VGA
> driver from the aperture helpers. Until now, this case has been
> hendled by fbdev, but it should work even with fbdev disabled.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

