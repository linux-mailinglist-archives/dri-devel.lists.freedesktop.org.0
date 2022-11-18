Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE84C62F6D0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 15:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4562310E741;
	Fri, 18 Nov 2022 14:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBD910E741
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 14:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668780469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v7EhwawpUWWHMiqvCGGK/nXzVvuAHoO472NAxSlviJk=;
 b=i0ohMt5Z9WmXfm66QX15TFL6GXi40YsOaz3Z8N/VDasnn0MGnxaB+joMd8+cbirZFJvuf4
 KDPTS/7E/pbuSpGd9upI9pXgACxDf+TQFQoVAltoDqIW467Jh7ybleSx/UuwuZCqsXIFSq
 JFhedGElqFV9x3o1kSljrvvS29PDteg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-107-_mVhY8N9OnaivHojKo9KNQ-1; Fri, 18 Nov 2022 09:07:48 -0500
X-MC-Unique: _mVhY8N9OnaivHojKo9KNQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c10-20020a7bc84a000000b003cf81c2d3efso1177239wml.7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 06:07:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v7EhwawpUWWHMiqvCGGK/nXzVvuAHoO472NAxSlviJk=;
 b=spQbVjh8GDFOvBeNjxXXLj/I8e/oBEWDwKim/+Tcrl6/Tf/x2vaP9V/GxqhtIs1Agu
 mzk2177suwYhZHNEHhLLtKd3CALtVjZRT57qF1QoNgsIdTI3nZcWC+dnZCRcYPOqKdlN
 dEtd1UVvnSXy/gRaBArjnh85b5LlE8VOjoTQsD1qybqnbW+ZD7sQ2pnLuW4xkqjIAVu8
 EnNAfOiWnjG4XkTieIgpLSmUY58DNuJq4McJWW+PyYzMfnDNGOWbjClVtjE0DmV838h8
 CbI1R75qYAYOJRK17lIBKtlOB1BQtDlXZc+JhWiHBPVY4X7d8qq28yXTLLSJO1g9+5Q1
 fHhQ==
X-Gm-Message-State: ANoB5pmiSN5+1fOTrQNbtky+bbCl/2GsuGf1Ig9ODJiiGvmO90V8Hcyg
 M6/wApTb1iZOCsRrXpxfWVLMz4+PY67lIimIMKjNj98Sgg+/IXLjDOqrrayvX5bGuA8DsbSJhdZ
 56tdz0pN1qZ+d2mgrCzwaQgmY5Os3
X-Received: by 2002:a1c:7409:0:b0:3cf:713a:c947 with SMTP id
 p9-20020a1c7409000000b003cf713ac947mr5176155wmc.40.1668780467436; 
 Fri, 18 Nov 2022 06:07:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4vgbLTbCG+sUf2qpb+6TQAiaa31HYoDJ0jTLC7GxFZznPPcDJ0tYNyX5+SiqVmqNuCN31PEQ==
X-Received: by 2002:a1c:7409:0:b0:3cf:713a:c947 with SMTP id
 p9-20020a1c7409000000b003cf713ac947mr5176136wmc.40.1668780467223; 
 Fri, 18 Nov 2022 06:07:47 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i3-20020a1c5403000000b003cfc02ab8basm9349871wmb.33.2022.11.18.06.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 06:07:46 -0800 (PST)
Message-ID: <f89a2149-fcbc-50d1-fa25-00a510dad40e@redhat.com>
Date: Fri, 18 Nov 2022 15:07:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 5/7] drm/simpledrm: Set preferred depth from format of
 scanout buffer
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, jstultz@google.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul.kocialkowski@bootlin.com, airlied@redhat.com, kraxel@redhat.com
References: <20221116160917.26342-1-tzimmermann@suse.de>
 <20221116160917.26342-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221116160917.26342-6-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/16/22 17:09, Thomas Zimmermann wrote:
> Set the preferred depth from the format of the scanout buffer. The
> value cannot be hardcoded, as the scanout buffer's is only known at
> runtime. Also derive the fbdev emulations bpp value from the scanout
> format.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

