Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA6C75A040
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 22:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0720810E510;
	Wed, 19 Jul 2023 20:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C8310E510
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 20:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689800231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u8/7gfrcuf8/DAAooprDSDfzeOTJmiOUpVBm/359QlE=;
 b=XQl36SiTsCiYtcS+SUpBmmSMy1EcVFgQKACSzNQEBmbFYmMrDBvsMVQ2TxZQ4uI5DnStUz
 dtUIFrsmsqQIsuMD6ZePtYEXi34RCm0boff5kEkoRr0btV1P2zHzIjzFY8lyzJBLT1+oXo
 NvG0yZNvgQ23vWqdCaneTiKTAjpZO9o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-qcv8pMFQOKen9JHG8speIg-1; Wed, 19 Jul 2023 16:57:09 -0400
X-MC-Unique: qcv8pMFQOKen9JHG8speIg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-316f39e3e89so526764f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 13:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689800228; x=1690405028;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u8/7gfrcuf8/DAAooprDSDfzeOTJmiOUpVBm/359QlE=;
 b=P/REIJjszzOITCe/UbX0fNv+S6WkVm9wu83+xMjzYmSDdRP+RqoE0ZShiUycteYl3G
 YgtNi1rprYJ2qGtVozLxbZ9rAymoB5HVecLHHhowIflJvvN1HSsSZ+WCpTWeJOPbJO2n
 mXhxTGaD4CCb2F67FqVX3Ieg2ZHnaxLh60vZNFQIzHLDCPdTSold4rwt/BtliOs5Arjy
 aKYreUM9Hl2XACmiXew4mkyFyHV1+jOkrD8avglw7pl/l0AjrRQty5Pr8pLCyQN4OeG2
 e1+Agi/r2Gy9Q9pedbP0ll31TjSH7to48LtCnaEWIx0hSdTRPWrHHM5Rh4aYSDqVLSWi
 wXjw==
X-Gm-Message-State: ABy/qLaTAjCHa7N8yFohShh7qrawD+sc0nDsAofneJtPjkBFbi5IrDZq
 mYJ5CImUAtAGOHe0OM7Neuof8IBUlBdVJRy2745GzicTZ6+eUfq60n8UtJZ0u25jeZz4pJN64gx
 csFHrXGl9jOZjG0uBQ1LtLj9QYbokZaEOZbKfBIQ=
X-Received: by 2002:a5d:6808:0:b0:313:ef62:6370 with SMTP id
 w8-20020a5d6808000000b00313ef626370mr779417wru.10.1689800228319; 
 Wed, 19 Jul 2023 13:57:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFLQI82PXe04TmP/q3eozKaXk38E3F+Qti+S7R2zewTlwbsEDY2//S9hJbdkbY4vyqMa8EZ9Q==
X-Received: by 2002:a5d:6808:0:b0:313:ef62:6370 with SMTP id
 w8-20020a5d6808000000b00313ef626370mr779410wru.10.1689800228058; 
 Wed, 19 Jul 2023 13:57:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b0030fb4b55c13sm6150243wrq.96.2023.07.19.13.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 13:57:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 maarten.lankhorst@linux.intel.com
Subject: Re: [PATCH] drm/shmem-helper: Remove duplicate include
In-Reply-To: <20230320015829.52988-1-jiapeng.chong@linux.alibaba.com>
References: <20230320015829.52988-1-jiapeng.chong@linux.alibaba.com>
Date: Wed, 19 Jul 2023 22:57:07 +0200
Message-ID: <871qh3k4bg.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, tzimmermann@suse.de, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jiapeng Chong <jiapeng.chong@linux.alibaba.com> writes:

> ./drivers/gpu/drm/drm_gem_shmem_helper.c: linux/module.h is included more than once.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4567
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

