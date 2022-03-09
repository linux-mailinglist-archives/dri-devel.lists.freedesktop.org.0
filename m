Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD3E4D3011
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 14:39:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4F710E744;
	Wed,  9 Mar 2022 13:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CC210E635
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 13:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646833172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hxJPMn5J6L7pDstxJt5mOgE1pVrNFlShCuIhtS3CI8s=;
 b=TFYWktsgqqwZ67O/n7tL3HSIba6ugwInPiRRLqe8sEJwa0liIWmYg2j+VbZXlrZuTEtJa+
 3JJNfOup+GJTgJ2fpoRliYWWZl0MJzphmR3FEAtipttZieBNlYHU3d1bxXcSmUqiKeeW9E
 ykANW/y7fSBWu6gs8umJnHY3DAVePhc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-MaYiRu26Mgi7uKBs0gj1vA-1; Wed, 09 Mar 2022 08:39:31 -0500
X-MC-Unique: MaYiRu26Mgi7uKBs0gj1vA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n62-20020a1ca441000000b0038124c99ebcso797217wme.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 05:39:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hxJPMn5J6L7pDstxJt5mOgE1pVrNFlShCuIhtS3CI8s=;
 b=m6iHSxSLnVDe3sOC6axP5p+M+AFXWZzQ07C8FdaRB8+HaDY6vec9s49dD2uhnw0kLq
 8GpOtKRsIlS4TduIhI+swgWrMQCohksZGh+6n59++GaWS7vtKDkC3AKnUJZZjMlwUpQ0
 2lZiNZP7fFFuD0xm3dOtc5sEf4p9x/Alsy+qsIJMICb0zAzefVhJ4QZeCFyrowkD4P4u
 QBAtBooLwbf/5V2ef7IRUovQjFnMGg1u1eMJU5pFBx5aGFqIO67uMM1mLw4/7NtYHj63
 Hjxagn9hzrfPsvHBltAvYW9deps65zug5+jw4WeI9REfXWTFDfiFfwfWWU5e+xdoKnUX
 ofpw==
X-Gm-Message-State: AOAM532P6cN66hzDGEwDWrVh2NLGdTTiu95k4kHruNQZV+JW1ZTbsIA0
 p2k+tTTPy6fZs7VDR0I4hWmgoL56oapW5/Tld09nzRSITBpLYYg7MzqP0CtI53npXu4XGiquxKQ
 AFahyZGR1V2XfHh64UugUf070L4ii
X-Received: by 2002:a1c:6a01:0:b0:37f:1b18:6b17 with SMTP id
 f1-20020a1c6a01000000b0037f1b186b17mr7467013wmc.146.1646833169796; 
 Wed, 09 Mar 2022 05:39:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUiXVqoM47oNz6ncRVRIq/E3m1+h7KnHuneTo0rnDdEN8qOnGhuo4BXntkJRz7KSBVfpVw1Q==
X-Received: by 2002:a1c:6a01:0:b0:37f:1b18:6b17 with SMTP id
 f1-20020a1c6a01000000b0037f1b186b17mr7466991wmc.146.1646833169595; 
 Wed, 09 Mar 2022 05:39:29 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 y10-20020adfee0a000000b001f0639001ffsm2618429wrn.9.2022.03.09.05.39.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 05:39:29 -0800 (PST)
Message-ID: <d1003594-dc26-23d4-a402-2951b3ed395d@redhat.com>
Date: Wed, 9 Mar 2022 14:39:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 RFC 09/10] drm/fourcc: Add DRM_FORMAT_R[124]
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
References: <cover.1646683502.git.geert@linux-m68k.org>
 <98c062f1b5c71427d5ba6c7bca706d04b1892162.1646683502.git.geert@linux-m68k.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <98c062f1b5c71427d5ba6c7bca706d04b1892162.1646683502.git.geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/7/22 21:52, Geert Uytterhoeven wrote:
> Introduce fourcc codes for single-channel light-on-dark frame buffer
> formats with two, four, and sixteen intensity levels.
> 
> As the number of bits per pixel is less than eight, these rely on proper
> block handling for the calculation of bits per pixel and pitch.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

IIRC the agreement was that it was worth to have both Cx and Rx fourcc
formats separately, so this patch makes sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

