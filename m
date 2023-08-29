Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 259C778CE9D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 23:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3F010E0BC;
	Tue, 29 Aug 2023 21:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B71D10E0BC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 21:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693343581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a+GUVbCk86qh5EQhmd6PqgeyLWByDTt+LjF9LcbM2Qk=;
 b=cGmDli8NUu+Hm9mtrIe3YWXh/7qcPm3RWH0NGyrYyoUwct02a8GjZmygVcixNPb1eaCC8+
 lRjBZEQlAYSHeBaajw7zhp2qwzlbpOywtgR6QFIWvroYFu7tMb2IWf8tFzoZg578Eg7sGb
 ziV5B4pkFukUxIza0LmAwiZ2gjppXk4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-nycweorPN5OR1wS4smZmqA-1; Tue, 29 Aug 2023 17:12:59 -0400
X-MC-Unique: nycweorPN5OR1wS4smZmqA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-31c5c55fd70so72628f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 14:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693343578; x=1693948378;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a+GUVbCk86qh5EQhmd6PqgeyLWByDTt+LjF9LcbM2Qk=;
 b=fL4tb9+wU99exOTz9Dy8qCCHTDYPlsTOYPcCOHCxH+5sb/nziq56HP3dHXoOGNBS+s
 Fzl99heqsoHODd49LMR75txnMfcUeb90DBNhzxMhQoUY8y9YQNAbvWnLOKpVHisnpd+d
 lcQlMJapnpCktoSzE3olDutXbsJ3msvsxhX1Mk+MSzLxT34nJ8G1nIr3L6K4+JQ10uhy
 he1nDOU/swiDDeQFcjQuPZJRzYTSsz+3W65+auQxkIPMeAWIva+tfHsAsUvpoqtHfTyu
 SjNa4XMhGdgxJXqMaWcRD7fuRR9FkbQT3R0wxkFtIQtGPXPvlPR2tWO0p6nYOPMlLTHs
 9bbw==
X-Gm-Message-State: AOJu0YwB2+a6z2xOETr17r7/WF8NOr0zeDAK4ao8NTdX5SRPUDhd39xk
 7GQc8XK1uik4ng+qJGcoAY+VCbRnp1lJ83gV8zzNgTgmh+eZhwUX62s0dRBIHMzv80vm/8ZfzfV
 MkZfQFKZj6xxZjJUXw6j6uW61HkWJ
X-Received: by 2002:adf:e54f:0:b0:319:7ec8:53ba with SMTP id
 z15-20020adfe54f000000b003197ec853bamr246338wrm.14.1693343578540; 
 Tue, 29 Aug 2023 14:12:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbYAzItfIpAHRZHGuf/sij5R/jrO6m8qBFwVYhGmG9FXiUVA+MnWStuS6opJ/GGpZlcmJh1w==
X-Received: by 2002:adf:e54f:0:b0:319:7ec8:53ba with SMTP id
 z15-20020adfe54f000000b003197ec853bamr246325wrm.14.1693343578190; 
 Tue, 29 Aug 2023 14:12:58 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y6-20020adfd086000000b003179b3fd837sm14792695wrh.33.2023.08.29.14.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 14:12:57 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 4/8] drm/ssd130x: Add support for DRM_FORMAT_R1
In-Reply-To: <87ttsite67.fsf@minerva.mail-host-address-is-not-set>
References: <cover.1692888745.git.geert@linux-m68k.org>
 <d5f342b5382653c1f1fb72dbedb783f9ea42416e.1692888745.git.geert@linux-m68k.org>
 <87ttsite67.fsf@minerva.mail-host-address-is-not-set>
Date: Tue, 29 Aug 2023 23:12:57 +0200
Message-ID: <877cpdd02u.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>
>> The native display format is monochrome light-on-dark (R1).
>> Hence add support for R1, so monochrome applications not only look
>> better, but also avoid the overhead of back-and-forth conversions
>> between R1 and XR24.
>>
>> Do not allocate the intermediate conversion buffer when it is not
>> needed, and reorder the two buffer allocations to streamline operation.
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> ---
>> v2:
>>   - Rework on top op commit 8c3926367ac9df6c ("drm/ssd130x: Use
>>     shadow-buffer helpers when managing plane's state") in drm/drm-next.
>>     Hence I did not add Javier's tags given on v1.
>>   - Do not allocate intermediate buffer when not needed.
>> ---
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

Tested-by: Javier Martinez Canillas <javierm@redhat.com>

> -- 
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

