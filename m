Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 146684F3D41
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 21:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F347610EE5D;
	Tue,  5 Apr 2022 19:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB03710EE5D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 19:04:02 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id z8so91275oix.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 12:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=f0FIrXkgSbJ3gra6ip39hjP/ylT1GDYYmm9Df2jVEBw=;
 b=ngqlpM5kh1S+hJPGd1Gng3gNBxkAndCxv/ne01qTc8+FU7IgOU1MscTKygOX5ATLgh
 nZd0uS8+pS8F7d+0fdG4jEXqCWnOwC+0s6bCm3uKYuURxl08zMmh1rDGkjszfqpaUT1Y
 CF4ZWe0FKZIHPn5GTpb1GC3qfpdaG3kRYkTZaCfitxSA31Ydo0AFVNGDt2Dx66C3up/X
 xwPPJ8AyqCRiRhXvpzYxso4fUCi7ArQq14Bp8MG/lcpf4c3C0gkkPL6YCQFutNhY8imK
 19OODxqhU1Dl8hVKGLmatW0h0zzJsFkmvKHCOjuDg5BUXB52LgISZxgQRS7WS6CDS3ur
 UTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f0FIrXkgSbJ3gra6ip39hjP/ylT1GDYYmm9Df2jVEBw=;
 b=ZZJUMC6fzFRP1vRFc7UCA4G6r436G+xYHU+EIHs4xwuqH2lbmzDDaAzOv+PXlHsLxU
 71sXZ7Jm5NS7KukfcOUjpp+Bn2w64XR89oafUU4NYY8UZJgDK/o62cMYFvn6Y5ZRjLu6
 u2afUx24xoCk8MeAvQtPglxf7r5R05flx1T+G17LdoObtSPVgckNAzbgAJEt2ILKspTB
 2JwMcx6FZjwc9Us6kgYEf1cMh8sL/RFCnXkhA7Rjql1ROL1EO8TOXeMUSoekHct5pYK2
 vVa872OAoe/2+THbFIJrRLZi7FPQrzV/XPx7WJSXoCQyJVDbIwCam7zcTEE7tJ+HstFc
 zOAw==
X-Gm-Message-State: AOAM530XVeRyXwTWO9+KCw3MqGbwEaoCGfNgj4tbBRrwGFNoVPPz/LQG
 mTGHxcKfgWqrxftaWpCOSysDV/wuYgw=
X-Google-Smtp-Source: ABdhPJwPiqgDAz69T/ySc/b7GEihpprBeWQMKmLEwYbIeptu5O+qt9UU3CNtE9NvS8O1IeuWoZee6w==
X-Received: by 2002:a54:4792:0:b0:2ef:7562:dcd7 with SMTP id
 o18-20020a544792000000b002ef7562dcd7mr2053747oic.263.1649185442010; 
 Tue, 05 Apr 2022 12:04:02 -0700 (PDT)
Received: from ?IPV6:2804:431:c7f4:7cc:26a1:e446:de76:c0b8?
 ([2804:431:c7f4:7cc:26a1:e446:de76:c0b8])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a056870831600b000ccfbea4f23sm6143118oae.33.2022.04.05.12.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 12:04:01 -0700 (PDT)
Message-ID: <f91a01b9-a11c-92a6-d996-de4b2708d1f7@gmail.com>
Date: Tue, 5 Apr 2022 16:03:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 1/9] drm: vkms: Alloc the compose frame using vzalloc
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@riseup.net>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-2-igormtorrente@gmail.com>
 <1d9f669a-d453-4792-67ab-cb82e3fd7bff@riseup.net>
From: Igor Torrente <igormtorrente@gmail.com>
In-Reply-To: <1d9f669a-d453-4792-67ab-cb82e3fd7bff@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: melissa.srw@gmail.com, hamohammed.sa@gmail.com, tzimmermann@suse.de,
 rodrigosiqueiramelo@gmail.com, airlied@linux.ie, leandro.ribeiro@collabora.com,
 Melissa Wen <mwen@igalia.com>, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi André,

On 4/5/22 11:05, André Almeida wrote:
> Hi Igor,
> 
> Thanks for your patch!
> 
> Às 17:45 de 04/04/22, Igor Torrente escreveu:
>> Currently, the memory to the composition frame is being allocated using
>> the kzmalloc. This comes with the limitation of maximum size of one
>> page size(which in the x86_64 is 4Kb and 4MB for default and hugepage
>> respectively).
>>
>> Somes test of igt (e.g. kms_plane@pixel-format) uses more than 4MB when
>> testing some pixel formats like ARGB16161616 and the following error were
>> showing up when running kms_plane@plane-panning-bottom-right*:
>>
>> [drm:vkms_composer_worker [vkms]] *ERROR* Cannot allocate memory for
>> output frame.
>>
>> This problem is addessed by allocating the memory using kvzalloc that
> 
> addessed -> addressed
> 
> OTOH, I would write this in imperative mood, as in "Address this by
> allocating..." or "Fix this..."
> 
>> circunvents this limitation.
> 
> circunvents -> circumvents

Thanks, I will fix them!

> 
>>
>> V5: Improve the commit message and drop the debugging issues in VKMS
>> TO-DO(Melissa Wen).
>>
> 
> Patch changelog are very useful for the mailing list, but not very
> useful for the git log. For that reason, I usually put this right after
> the --- in the patch, so the log will be dropped when the patch is applied.
> 
> Those comment applies for the rest of your series.

Well, drivers in the DRM subsystem maintain the change history. As you
can see in the commit below.

4db3189ce0621be901f249f8cd8226c977dd601d
d80976d9ffd9d7f89a26134a299b236910477f3b
84ec374bd580364a32818c9fc269c19d6e931cab
50fff206c5e3a04fcb239ad58d89cad166711b7f

Aside from that, the current VKMS maintainer asked me to add them to the
commit body.

And for that two reasons, I will keep them.

Thanks!
---
Igor Torrente

> 
>> Reviewed-by: Melissa Wen <mwen@igalia.com>
>> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
>> ---
