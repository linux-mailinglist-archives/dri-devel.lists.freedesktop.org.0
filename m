Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F251FBD7
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23D810EE1D;
	Mon,  9 May 2022 12:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8384610EE1D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 12:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652097780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+jA91KD3Qo7aDwn2TaWu5EYyZ95sCwgta4F8PTBJp0U=;
 b=PykE2SsJAvKo1cr5zT6dm50L+1rIiDEoAPx0hJzITBAtuloo8/xClCxAc14B2v1Xb162Um
 UyFaT4KIXIjeRm7+aqYL52CIcWJe9zbRUxEE3r1ajI15iYKHm/AIzonJvYUEYfkHkK+f4q
 TVgrxhyu54lKTaNgS7YQw+b6YSFZJe0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-IGELlHQpP7Khspuin41fFA-1; Mon, 09 May 2022 08:02:59 -0400
X-MC-Unique: IGELlHQpP7Khspuin41fFA-1
Received: by mail-wr1-f70.google.com with SMTP id
 s8-20020adf9788000000b0020adb01dc25so5698383wrb.20
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 05:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+jA91KD3Qo7aDwn2TaWu5EYyZ95sCwgta4F8PTBJp0U=;
 b=TJ65qcKJi3Hx7nOL6jEo9HphXnIBp5iMXUR1CYw0fPa/ocJ91TaYrJ5DPZLmANRMl7
 SM1NZz8gr6V83O31d18rgnfJ08t2w+pIaWkVInR3u3tm1p/QSpvtjqu4o674yYZjqyeV
 ChHRaR5iicY4F3wq/CCHO+fNClxo3NwEwvy6pwSc8PB25All7scYwoSq0XOiuOmoBnRh
 hYybdHb1f6XKE7V6hbvDeLRyQU1lUunTV6yTxa0x58xCXVFHmm0IxW9Dsjv7S7MiZzwA
 hVA1XEF89uQjzHeJ0jXksxsm5bAf0t9ihZkb+gGK1IBCM1p/r96IYHHsqtOgOodLXRs/
 DtYg==
X-Gm-Message-State: AOAM531cqKoNTwiIKNScthbevWnY0ZP1JGicghqfC/V88KGlaI3VS78N
 oqHPZgER5xa56ht3u+voCkhBBBXudH7R+7o6xHNL+lKTX4zIYrsq068NuW/8pELATJdixjSfXLq
 HPd4hTNaBPkfYLKLoZVC7/TV6uofA
X-Received: by 2002:a05:600c:3658:b0:394:725:be12 with SMTP id
 y24-20020a05600c365800b003940725be12mr15810383wmq.192.1652097778542; 
 Mon, 09 May 2022 05:02:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkJ+UL2kkyRXt/a9dkRGekoUt3UPddsaJAJ8Av7Mpo3gu47KHgtfk+ogG8dpWpE4IObJ4UcQ==
X-Received: by 2002:a05:600c:3658:b0:394:725:be12 with SMTP id
 y24-20020a05600c365800b003940725be12mr15809936wmq.192.1652097773472; 
 Mon, 09 May 2022 05:02:53 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y9-20020adfdf09000000b0020c5253d90dsm11200631wrl.89.2022.05.09.05.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:02:53 -0700 (PDT)
Message-ID: <f460b87a-a53c-0570-9c87-9997519ebb97@redhat.com>
Date: Mon, 9 May 2022 14:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/vmwgfx: Fix passing partly uninitialized
 drm_mode_fb_cmd2 struct
To: Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Zack Rusin <zackr@vmware.com>
References: <20220509110425.165537-1-hdegoede@redhat.com>
 <6eea44ce-4057-7267-8a0b-096cdc61dd94@redhat.com>
 <aa4c0305-c99b-050b-80a5-d13e8e10b78c@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <aa4c0305-c99b-050b-80a5-d13e8e10b78c@redhat.com>
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
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/9/22 13:55, Hans de Goede wrote:

[snip]

>>>
>>> Fixes: dabdcdc9822a ("drm/vmwgfx: Switch to mode_cmd2")
>>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=2072556
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>
>> Zack fixed this already:
>>
>> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5405d25b9e8e6
> 
> I see, but it seems that this was never pushed to drm-misc-fixes,
> so this is still broken in 5.18-rc#
> 

Indeed. Agreed that should be cherry-picked in -fixes as well.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

