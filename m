Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217305776F7
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 17:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16D890F13;
	Sun, 17 Jul 2022 15:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6564B90F16
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 15:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658071081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U5MYx2V2E2oHQrL5mS9aZorRjQp7I+8tFb9fRt7muuQ=;
 b=QpSog45Es+v2UzmkWQAX5MuWYH77cIvnle3q4DsHlEHZWFca95R1Eu5geJhgMMnG3bGLlA
 sSyd6gZQUNgcKdO+3R8rzXicJW2WNdX7J0o1yUK5oqlTZynpWwLONVpRTL7H62jAa8EyyW
 P54AadhoAH9iENMBENyYvAcjHzQpTvo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-WkaIaQlDMiSsQKhEyXwTxg-1; Sun, 17 Jul 2022 11:18:00 -0400
X-MC-Unique: WkaIaQlDMiSsQKhEyXwTxg-1
Received: by mail-wm1-f70.google.com with SMTP id
 v67-20020a1cac46000000b003a2be9fa09cso4429244wme.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 08:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U5MYx2V2E2oHQrL5mS9aZorRjQp7I+8tFb9fRt7muuQ=;
 b=HlyJFStZahRemDHmymkGjK0KzB0dB5fIzcddyWm1kyWd3o5Iw8/ca4WgP6itqE+Nw1
 CCDkCnwN1+ugqwNdly2f9UB88pc5IrbyL4n10BJ3IVxLPIrQ1XKjbtINNYdzwHDdEozn
 96tgDK8PUZssgNuZXMnyYqQAEjJE+p2TFvjKp3Dj4eUVg8jasE+KrMfXX6NkH0WDqkCF
 mtXFuhwZ3nPngnBNi4h4nLI5t8NdWtGWiuQt4H8xlBnK/74FF54xu1VVJlBJJWkwngCi
 SgKFyv/7M2c4FQgjqOnpcxil1Z6cPvrVZ9bBTZfB/8H0FPM8JgQH1u0/lFLKxcIfTEaH
 zg7A==
X-Gm-Message-State: AJIora+fNG6Tg7CP+ZhbshgZYUoVTFLiNN75z2c/thV75qDIS2cueMS0
 9xNurjh/dsCvZ4bPHguUhi5fxl79ZTaMmdkEAJ3bN8BvKM/P7wdzs3iBIoIXVKKq9O4Qwj6xUF6
 7GoHdxdpB7oZtimiWT2n4YiwpNdMU
X-Received: by 2002:adf:f151:0:b0:21d:76a7:76d3 with SMTP id
 y17-20020adff151000000b0021d76a776d3mr19510434wro.702.1658071078895; 
 Sun, 17 Jul 2022 08:17:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s3JWuxFajCAa2dGoZWkiP8HNQW9JVujUtI+l1fYd95phAoBGnho476LMiDh91IMtoezZHjxw==
X-Received: by 2002:adf:f151:0:b0:21d:76a7:76d3 with SMTP id
 y17-20020adff151000000b0021d76a776d3mr19510426wro.702.1658071078731; 
 Sun, 17 Jul 2022 08:17:58 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m65-20020a1ca344000000b0039c5a765388sm12267003wme.28.2022.07.17.08.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jul 2022 08:17:58 -0700 (PDT)
Message-ID: <682a99b7-d3a4-3092-11b8-a4e1017c27f6@redhat.com>
Date: Sun, 17 Jul 2022 17:17:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 04/11] drm/r128: Move the r128 driver to drm/dri1/
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <20220716181750.3874838-5-sam@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220716181750.3874838-5-sam@ravnborg.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/16/22 20:17, Sam Ravnborg wrote:
> drm/dri1 is the new home for all the legacy DRI1 drivers.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>

Ditto here and other patches.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

