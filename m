Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F3F4DB4B2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 16:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134B410E6AF;
	Wed, 16 Mar 2022 15:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D5D10E6AF
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 15:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647443885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w/uVU27MUQYVU+wgJKpbBvrcqEJY7UjfllrQP2RhSbk=;
 b=dTQBUtzX3h0/frdZ2FQ+nBlTGHIcpqRC/ZDhktfHVHf3ZCuN89yPUi0fKQIwERvU80/1ES
 lcJGt5ntkeaPqM+Voo2Y2XguOAPgCMCQV21m3VbzlxUs7+xGtXWJQsDXhCO/eotC+OUqyB
 23b7kde0pRlbp+aBkDO9dmZi+1OX1rk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-40uPgShpM9K4gEdLcX86mw-1; Wed, 16 Mar 2022 11:18:04 -0400
X-MC-Unique: 40uPgShpM9K4gEdLcX86mw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k26-20020a05600c0b5a00b0038c6c41159bso1178682wmr.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 08:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=w/uVU27MUQYVU+wgJKpbBvrcqEJY7UjfllrQP2RhSbk=;
 b=497r1qHQzgjvsK+JTPVJYC4NN/sSCGrwdll7HIWigVNt/fbFH/csWpjq4ilAXWuXrn
 GQ0EyHcLQEBVy+wRXXNj1v6IWTk23SlJmDpiVcnEDnMjsh6eEebfsu/Y/y7Px6wOmWhK
 Y5vuW5rPLQmT8KwOtYzG5hDKBVHz1sxPHXJzaw1j8J4HIaK3muRRsz/0pL5P7EKLSe8T
 yrKihFYjfUMzwAcgKZj3a+KcbPoUwKzZxdoajfwCzysmoDRP6zfSLJcmXT+6W5eZVsUN
 tEUaxFxd3ll1mSod2+fVSbIVyBVd7UtU6JgRd+32hIJVkAQsoP9K2Vy+WWreXt8au0W0
 B5Zg==
X-Gm-Message-State: AOAM533I4sUgtf5JqXqu/ixmX+i/5c0Dz3/+npJwrxMC+8v7f8ms3yCz
 tTkLlF6K9Ia5VWSthly0It52h6MVD6Nql2p7NJ3xohQC+kniqsA54+J9LFOetIRzyU/8irjuqqV
 p3u+OUNf1rY/jkvhC6DPVKJSOoMO0
X-Received: by 2002:a5d:6610:0:b0:1f1:e606:f097 with SMTP id
 n16-20020a5d6610000000b001f1e606f097mr384068wru.134.1647443882867; 
 Wed, 16 Mar 2022 08:18:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgX7M3pSLfvswnCZinlxjE/UiPfGgG3EjL14bFT0DvEZXH3YwTrW3SFlGgJ6FkbccoaVZgJQ==
X-Received: by 2002:a5d:6610:0:b0:1f1:e606:f097 with SMTP id
 n16-20020a5d6610000000b001f1e606f097mr384044wru.134.1647443882590; 
 Wed, 16 Mar 2022 08:18:02 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 bk19-20020a0560001d9300b001a65e479d20sm1847666wrb.83.2022.03.16.08.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 08:18:02 -0700 (PDT)
Message-ID: <0fa87883-829d-93d0-f0f3-7d3faa8d060c@redhat.com>
Date: Wed, 16 Mar 2022 16:18:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH -next] drm/solomon: Make DRM_SSD130X depends on MMU
From: Javier Martinez Canillas <javierm@redhat.com>
To: YueHaibing <yuehaibing@huawei.com>, airlied@linux.ie, daniel@ffwll.ch,
 maxime@cerno.tech
References: <20220312063437.19160-1-yuehaibing@huawei.com>
 <08e81f07-99d2-62a3-8eea-b2c0432b4d18@redhat.com>
In-Reply-To: <08e81f07-99d2-62a3-8eea-b2c0432b4d18@redhat.com>
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

On 3/15/22 10:18, Javier Martinez Canillas wrote:
> Hello YueHaibing,
> 
> Thanks for the patch.
> 
> On 3/12/22 07:34, YueHaibing wrote:
>> WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
>>   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
>>   Selected by [m]:
>>   - DRM_SSD130X [=m] && HAS_IOMEM [=y] && DRM [=m]
>>
>> DRM_GEM_SHMEM_HELPER depends on MMU, DRM_SSD130X should also depends on MMU.
>>
>> Fixes: a61732e80867 ("drm: Add driver for Solomon SSD130x OLED displays")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
> 
> Indeed. All the DRM drivers that select DRM_GEM_SHMEM_HELPER depend on MMU.
> 
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
> 

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

