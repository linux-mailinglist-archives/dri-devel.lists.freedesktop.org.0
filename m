Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AF1658DEA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 15:31:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C94110E270;
	Thu, 29 Dec 2022 14:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0702310E270
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 14:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672324260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iyDuPw9BfhAfsJqj1LLBmM52knl5cpyM0AV0SoAQzf4=;
 b=iWPEKjgopctzo85+/B87jBdJqTe2AwdAffQRRFSF4+Pb7d1qolRSZVN8jNhO9I7fQhnJQI
 dmQl4V55Vr5+LaSdkeTH781nD6I4BA+xsYjieugtvuHnNP2toK8280d5GmoEPXU6+v2zNz
 Y3BOBpRFeyIE05bqofq6Mu9a44McTLI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637--AKzQz14OtqZ38c_-piO9A-1; Thu, 29 Dec 2022 09:30:58 -0500
X-MC-Unique: -AKzQz14OtqZ38c_-piO9A-1
Received: by mail-wm1-f72.google.com with SMTP id
 j1-20020a05600c1c0100b003d99070f529so3475741wms.9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 06:30:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iyDuPw9BfhAfsJqj1LLBmM52knl5cpyM0AV0SoAQzf4=;
 b=aAiIAk0lUrkD+roqN5czSmVK11rOUvb7GiBWf1E/kEqkclOeJZii9SCtqPdXs9NFtu
 6Cwj2JSL4tp2AHDJAqo4pHcchtBKT4pvsu5zzAg5qV48PGvU7LzN1zwWAaI80WipUzKN
 MzINNHV42qbDaUaxpCVa/qWUbmfYtCrA2ywrol4NMqMl+zgY7t+Ckaj82eqd1NPfosEE
 QOPWCl6dKDPeQ2+ylrEUTKZnfOByyyFTfLNWAnjw6b/ENxeSSao8ykr1TPjfnKxv873n
 S2gYVkdI0EsX9M0IoPdF4qtJKGK2HNo6jIcRlE+7hnvaGJ40t1JdfrqdEaVJFrfy6dF+
 xXDw==
X-Gm-Message-State: AFqh2kos7d6WHSx3RdYc3Kd4Kcm4a2C/Y5D0OHd0YhCJChSmET92u+Ro
 4PD3MN5PpoHzpkBr1dbQefXbwhpCEEX1rp9F7xy01zTUuzjpw/OqxTdMjLXHlWp9vyye/KwD/g7
 lhqgGCVnGH3d6nkjgRrASRs9BL0fm
X-Received: by 2002:a05:600c:500a:b0:3d3:5b56:b834 with SMTP id
 n10-20020a05600c500a00b003d35b56b834mr20258818wmr.5.1672324257053; 
 Thu, 29 Dec 2022 06:30:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu7jq2MqHRR2Qf7hZNRLxPrxMP+dHZZmm1DOclVneqxdq6tN99CJ+oQPMkRcoN+zvTQ2QD3pg==
X-Received: by 2002:a05:600c:500a:b0:3d3:5b56:b834 with SMTP id
 n10-20020a05600c500a00b003d35b56b834mr20258803wmr.5.1672324256815; 
 Thu, 29 Dec 2022 06:30:56 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c35c900b003d96bdddd3dsm26127449wmq.15.2022.12.29.06.30.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 06:30:55 -0800 (PST)
Message-ID: <7e527370-5c10-e908-c143-d33ebe69a3a0@redhat.com>
Date: Thu, 29 Dec 2022 15:30:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 03/14] drm/panel-sitronix-st7703: Drop custom DSI write
 macros
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <guido.gunther@puri.sm>
References: <20221228014757.3170486-1-javierm@redhat.com>
 <20221228014757.3170486-4-javierm@redhat.com>
 <Y6wwLdvhjUeTYSlQ@qwark.sigxcpu.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Y6wwLdvhjUeTYSlQ@qwark.sigxcpu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Ondrej Jirman <megous@megous.com>, Purism Kernel Team <kernel@puri.sm>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Guido,

On 12/28/22 13:01, Guido Günther wrote:
> Hi Javier,
> Could you please also cc maintainers on the actual macro addition since
> it's hard to review without seeing what the code gets changed to
> (especially when there's multiple revisions). I assume
>

Sure, I will do it if post another revision. Although the changes are quite
trivial and all the drivers define basically the same macro so no functional
changes are expected.
 
>    https://lore.kernel.org/dri-devel/20221228014757.3170486-2-javierm@redhat.com/
> 
> is the right one?

Correct.

> Cheers,
>  -- Guido
> 
-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

