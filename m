Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0765E7566
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 10:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A275710E4D5;
	Fri, 23 Sep 2022 08:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70ED810E4CB
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 08:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663920369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/UDEbHop3omdSniq2G1PXxMgzkeyeJYeF2Shfxq3aYI=;
 b=UB7W7prO7pmLaF/2A5PA8SRYNO6XoQtOD9So5U562Fb0a4IdRa31Ir8ul/bFNFMgeZ6jre
 36TSJUpUyrS6R/HOyumNox45PTTQ00pEmx3fs38teNbG6yYL/fvEoUcoIkCBVFOtJ/5K/t
 GVL0PxHx8HbDf94lzUMcqjXPP4KJ/ZE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-28-isjvkL73PKO4WiZBaUVRXg-1; Fri, 23 Sep 2022 04:06:05 -0400
X-MC-Unique: isjvkL73PKO4WiZBaUVRXg-1
Received: by mail-wm1-f72.google.com with SMTP id
 i129-20020a1c3b87000000b003b33e6160bdso2353243wma.7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 01:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=/UDEbHop3omdSniq2G1PXxMgzkeyeJYeF2Shfxq3aYI=;
 b=iv5FXTmMQ+4e5IAaa9TxMu4pbMTbytbZf4qXQywNKVhOwZJoH6xCETXXlQOywSkSnz
 cIDsL/TLIB7Nr90KJXAxwl3+qWOz7iWgCDG7AogAFhVP6oOQiyoSxCLDdefstE5swUAg
 Kml+1VT+qfGXjpm9KdhIbC12J5r941ZPvAEAjLQqiwvKap0D1K1FL2WFnSAXBkjOdIDq
 j4YPOIgqkqSuv3PLO02Vya5xxT7h24Zf/tCSskZGzd9mh6cFulCzWkjZpLMhUIrdq0lw
 oYnVtuJCOOcwUig4RYHxvPAQeCAO3ldfd7EzNUfRHsyJYJYtDU5nPM0a9PeShQS/dqIr
 g3pg==
X-Gm-Message-State: ACrzQf2wY/MWDx3/0+RAv28Pr8q4/JsT5JHkJskDqrvk/EkbGCLdubyn
 GhqJKixrmtlmPTZLyRWAnXxMDnp6lMamcqnkEvL171p7xxwyBzBXV5NjTNiLlrQLht82J1vpDFQ
 tRNRF1qTl7ez97Ab2QfT/CMcFlHSH
X-Received: by 2002:adf:fbd1:0:b0:228:6406:23d8 with SMTP id
 d17-20020adffbd1000000b00228640623d8mr4279596wrs.45.1663920364787; 
 Fri, 23 Sep 2022 01:06:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7w6+01OEBTtOBO3Y/Rf5FHB+x0WQHpfAMDTForwAtqxpv6cWPvOAHeG79JHFSa6c4z0YBmUg==
X-Received: by 2002:adf:fbd1:0:b0:228:6406:23d8 with SMTP id
 d17-20020adffbd1000000b00228640623d8mr4279577wrs.45.1663920364415; 
 Fri, 23 Sep 2022 01:06:04 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ba30-20020a0560001c1e00b00228655a5c8fsm6648659wrb.28.2022.09.23.01.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 01:06:04 -0700 (PDT)
Message-ID: <2163b960-cfbe-7693-ba89-633cb36558a7@redhat.com>
Date: Fri, 23 Sep 2022 10:06:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 5/5] drm/simpledrm: Synchronize access to GEM BOs
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie, daniel@ffwll.ch
References: <20220922130944.27138-1-tzimmermann@suse.de>
 <20220922130944.27138-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220922130944.27138-6-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/22/22 15:09, Thomas Zimmermann wrote:
> Synchronize CPU access to GEM BOs with other drivers when updating the
> screen buffer. Imported buffers might otherwise contain stale data.
>

Can you please elaborate what the problem is? The framebuffers memory is
setup by the firmware and would never come from an imported dma-buf, so
could the GEM BOs even be shared with other drivers?

Or is this done just for the sake of correctness ?
 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

The change looks good to me though if is for the latter.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

