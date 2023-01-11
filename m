Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 724CF666266
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 19:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F2A10E7D5;
	Wed, 11 Jan 2023 18:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87E810E7D5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 18:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673460135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pY9wjzOlET6NgpsLk7OxHRJG44T8VHI0VhpQAw4fLs8=;
 b=S+1YAsIKjkqtGCa4ugi/ztCu1fw09o+fX4jrgx2eWYiOxMOEqzb/MAlmkTT6ijOVSum3no
 FsN3EU0p0PLH99Q3oEcl4dtNbVLMJlHJ1MUnSiNqK9LV9SJCKkgPkWFE3tSVOsA9Zst26l
 8d6GDfZ2pCAzJC/ITIb2R/kGXVC/MMc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-581-LVqYGh6PNTq2lVoyYY6AQA-1; Wed, 11 Jan 2023 13:02:14 -0500
X-MC-Unique: LVqYGh6PNTq2lVoyYY6AQA-1
Received: by mail-wr1-f70.google.com with SMTP id
 d27-20020adfa35b000000b002bc813ba677so1824024wrb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 10:02:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pY9wjzOlET6NgpsLk7OxHRJG44T8VHI0VhpQAw4fLs8=;
 b=cKVqr5IweE7p+M/gMk/XV8d9pjFS8DPmdPYJOLAEbX3z4PBpxo556tgPsLRlw9vfm0
 IWqZ5VGGX5FBzkGYHU5u1bxsdgIQMGk9x1ue+4EZlqjE0uITRRKJ+mhXS0MvSoSzca81
 mfF6o1qd2OB6miTz7ktdDpL/hf0FWlDDKnZQO4ca5CvKfDpnRTntD3v7lCVxwuMnOyB5
 p8UIBE0gdVg1xU3rQQMvsX42oSpIfu5fvuJiuMfmVVbyHKMpo1BdBoJxOxFOOL64dThv
 hdP+pgYzg7xL3wGp9pJNMudUlaa/4ZI0gkOnsG7RY7CP0FuFCYefOydBYIP4MBjD4dxb
 vnVw==
X-Gm-Message-State: AFqh2kqyYVUHS46wd7wp+USnIsU7qIwADeeyY3Yz0juQ1WpSYTQqrNgl
 5ZzlYe+YQVfChb48SiGx019kOa4D/icSJX64eGoUshDBqooHZy4H76IaFarKVy92c6FvYwFU32v
 WMVnWizSAQVmetpHrXaJHX/uflDWW
X-Received: by 2002:a5d:534e:0:b0:2bb:6d44:5d1 with SMTP id
 t14-20020a5d534e000000b002bb6d4405d1mr10835399wrv.28.1673460133571; 
 Wed, 11 Jan 2023 10:02:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvEAnBAgxxVJFKjZj6KyuVimR0Aghe3ogMbbBk5im+gWTyBWJFPn6ki5yeX9EmsP5c4UpCvmg==
X-Received: by 2002:a5d:534e:0:b0:2bb:6d44:5d1 with SMTP id
 t14-20020a5d534e000000b002bb6d4405d1mr10835388wrv.28.1673460133362; 
 Wed, 11 Jan 2023 10:02:13 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m13-20020adfe94d000000b002714b3d2348sm14400789wrn.25.2023.01.11.10.02.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 10:02:13 -0800 (PST)
Message-ID: <75725b53-2df4-1cbf-5a78-60e491757d9f@redhat.com>
Date: Wed, 11 Jan 2023 19:02:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 00/13] drm/panel: Make panel drivers use existing DSI
 write macros
To: linux-kernel@vger.kernel.org
References: <20230107191822.3787147-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230107191822.3787147-1-javierm@redhat.com>
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
Cc: Ondrej Jirman <megous@megous.com>, Purism Kernel Team <kernel@puri.sm>,
 =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/7/23 20:18, Javier Martinez Canillas wrote:
> Hello,
> 
> This series contains cleanups for DRM panel drivers that define their own
> DSI write macros instead of using what's already in <drm/drm_mipi_dsi.h>.
> 
> This is a v2 that addresses issues pointed out by Sam Ravnborg in the v1:
> 
> https://lore.kernel.org/lkml/20221228014757.3170486-1-javierm@redhat.com/
> 
> The changes are quite trivial but I've only tested this with allmodconfig
> and `make M=drivers/gpu/drm/panel/` so please review and testing would be
> highly appreciated.
> 

Pushed this to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

