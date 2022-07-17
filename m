Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E663857770C
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 17:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF3D90FFC;
	Sun, 17 Jul 2022 15:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DB790FF6
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 15:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658071465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QhYqsgYcHBQtRIYVw4tczvIkg2PMb1ahLsrNXKcHPeI=;
 b=Ar41RzOwqeKPZeNoUAUqr3i4clLtEsf3iQGUhhbdYZSlhDUTSZDIiICsBAM4qvRF6VOLsA
 8hNkNDYi45OCQRknUkSwMD6CQt833488aSrLX5j0fSop70kwCVoxNUOzslxRM4hSmhGE/V
 98pups3DDgO7vz2FHK7qq+fZw3pfww0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-OnJs2sZKMSm_KepaVlKxug-1; Sun, 17 Jul 2022 11:24:24 -0400
X-MC-Unique: OnJs2sZKMSm_KepaVlKxug-1
Received: by mail-wm1-f72.google.com with SMTP id
 n18-20020a05600c501200b003a050cc39a0so4431193wmr.7
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 08:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QhYqsgYcHBQtRIYVw4tczvIkg2PMb1ahLsrNXKcHPeI=;
 b=HTAEiKOgxLhsCc0gig/hwDkAHDOzChLLxQ18mr6tvfmHkBu8MYvU1Tpv3VoGvSsy9d
 Cp3tie9X6mrvCWqCRwMUNihuIa5attKlljDMOHYVZN9766GpgI7NpUcuMWtucyn8LZ7Q
 N+9TytIBmEpme4ZmPkUCVsKBf9BnzjKk4OLJFREfpCZFn+XnLQPnUEQ61QZ2C8oTNtKb
 W582160LN7vWl/eQltG8XEiytjbOV7jhyuI7dVp4VtT52r0YBjeKK+LJH5b3BJF63m+Y
 M5Ld2ZGLPA3vNNgceO75eN2yKbQSOgfDSs61JdUaIiWnzBKRmgzHMCGRA+PuUcE3he+w
 912w==
X-Gm-Message-State: AJIora935obLSnTarR4IkE4GDeA94Lh5zHY5rPWa/KhaZh86noSZEwmR
 S2Q8E/kBQbWF6wtEwDF4Ytg0ywzRkxSFBmpkZnMQZ/n0WmM4ERPQWxyMRIAukZhvV7WhdLynB4D
 JHIhXApWQJdlriM5y8MtVPbVlcPrv
X-Received: by 2002:a5d:60c3:0:b0:21d:6ebb:4231 with SMTP id
 x3-20020a5d60c3000000b0021d6ebb4231mr19432975wrt.306.1658071463360; 
 Sun, 17 Jul 2022 08:24:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tqn7riCmfDbpOhtBkHHQd4++V6ONc37b5ER88+zsKXex9xXPq1GQYs2O+z7Db7d0W/ZDOhKg==
X-Received: by 2002:a5d:60c3:0:b0:21d:6ebb:4231 with SMTP id
 x3-20020a5d60c3000000b0021d6ebb4231mr19432965wrt.306.1658071463113; 
 Sun, 17 Jul 2022 08:24:23 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y11-20020adff14b000000b0021db7b0162esm8447283wro.105.2022.07.17.08.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jul 2022 08:24:22 -0700 (PDT)
Message-ID: <b23773e5-6b08-cfa7-9ffa-38b4d10d577c@redhat.com>
Date: Sun, 17 Jul 2022 17:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 06/11] drm/mga: Move the mga driver to drm/dri1/
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <20220716181750.3874838-7-sam@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220716181750.3874838-7-sam@ravnborg.org>
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
> ---
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

