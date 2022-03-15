Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5AB4D9774
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 10:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA4410EA93;
	Tue, 15 Mar 2022 09:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D14610EA93
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 09:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647335886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wBh8J9NNu5Aw3QyuGmWU4/1j/LKSodlLKfBbUhGiIe0=;
 b=RlovcAp9zcTP+8UgZlq1s2wCX3weVIC8aco5LwvDMwJXQfB/tgeR2BkHaPMArvdSrU9eKG
 NQBokOIJ8Kqa6PfE7mBlkXHY8A6z4tKpYP61d1eZHeoW9aGZKkmRBXmVu7LuJg9xYawCGy
 nd/mqnVUXVwdVzpoPSb5odq6g49ay9g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-tYhKT5XcNKqLPCjRcafHsw-1; Tue, 15 Mar 2022 05:18:04 -0400
X-MC-Unique: tYhKT5XcNKqLPCjRcafHsw-1
Received: by mail-wr1-f70.google.com with SMTP id
 e6-20020a5d4e86000000b001f045d4a962so5074886wru.21
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 02:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wBh8J9NNu5Aw3QyuGmWU4/1j/LKSodlLKfBbUhGiIe0=;
 b=gT/OXxB0c2Oqxr/ZZd6JnFD2gD9lA3knWVs9QIKaRyobNw/+l/nPb6wbaC/0PlsbDs
 pixAlFmkqNd9MUFiQQAr1NhyBezzrluRqKk5wKUt0GVcq8RLalm/hmfYJp7DY6pkz4H7
 EVncmzLSgF4dck+7WStYOUe2owzQCxZj+TELi8nYyMlSezf/J4kOb2mcnrna0fRM09nr
 oOlj9M4a8+PTzLCJeQfIHb+Cvi2w+R8Wi0cH9oFfFc5Al4K7jpNzuMJfljPukqN/BWcW
 5vbXMhAI+6zvgc/wDARsFv3HCnoP5+bS7jXhsK/N5wXo1N021ZC6FsTMNjmFsm6D7xiJ
 Lv8w==
X-Gm-Message-State: AOAM530VAMUNPJz/7Hoo0mGV1Quuq3oRVPhRVwovgYF1NYJT2F6ZnnMd
 bVqdU1gwUm4aAJHqUuLxFzvto9uOCuMd+mv/bTqUP6j2M63w14wsFItBYphgNG8H7PNVYbOGDLB
 YwlfiiEA+Z3cFAKpGJbdZ9qaf9Vn5
X-Received: by 2002:adf:ee4b:0:b0:1f6:3413:282b with SMTP id
 w11-20020adfee4b000000b001f63413282bmr19502567wro.354.1647335883035; 
 Tue, 15 Mar 2022 02:18:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziFUt0vjWLkTUV9oYH9rKLnYZc3d9TydrJ3H9L1hwi5ifBeuzXwpmzYV9LVn1GmGmVpcVktw==
X-Received: by 2002:adf:ee4b:0:b0:1f6:3413:282b with SMTP id
 w11-20020adfee4b000000b001f63413282bmr19502525wro.354.1647335882336; 
 Tue, 15 Mar 2022 02:18:02 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a1ca302000000b0038b6f235656sm1205577wme.19.2022.03.15.02.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 02:18:02 -0700 (PDT)
Message-ID: <08e81f07-99d2-62a3-8eea-b2c0432b4d18@redhat.com>
Date: Tue, 15 Mar 2022 10:18:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH -next] drm/solomon: Make DRM_SSD130X depends on MMU
To: YueHaibing <yuehaibing@huawei.com>, airlied@linux.ie, daniel@ffwll.ch,
 maxime@cerno.tech
References: <20220312063437.19160-1-yuehaibing@huawei.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220312063437.19160-1-yuehaibing@huawei.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello YueHaibing,

Thanks for the patch.

On 3/12/22 07:34, YueHaibing wrote:
> WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
>   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
>   Selected by [m]:
>   - DRM_SSD130X [=m] && HAS_IOMEM [=y] && DRM [=m]
> 
> DRM_GEM_SHMEM_HELPER depends on MMU, DRM_SSD130X should also depends on MMU.
> 
> Fixes: a61732e80867 ("drm: Add driver for Solomon SSD130x OLED displays")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Indeed. All the DRM drivers that select DRM_GEM_SHMEM_HELPER depend on MMU.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

