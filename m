Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 618617C4D59
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 10:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A95B10E5A7;
	Wed, 11 Oct 2023 08:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8A810E5A8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 08:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697013425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wNiZ707hWfgMdwGwI76kVGiufj3fbxMgM4PKRHavANs=;
 b=X1Hp+B9yiHeWqqkTs3M1MOCeVD5zwPtb+4nSRczRKIpIoADyyaog6Rw8MZqj+iHuvllO12
 J+4y8ywyKjta5nszGM1UNQ5N/maCNvsCM1w1lGf7C58wrDJCKow9pNK1c8V1mQkY4fCB2F
 itl1uyqmtc+6cUd2n5VdGfWNoLKSp9o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-BYpLG9E_N1uvw4Qvi_B1ew-1; Wed, 11 Oct 2023 04:37:03 -0400
X-MC-Unique: BYpLG9E_N1uvw4Qvi_B1ew-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4064e7a166dso47118105e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 01:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697013422; x=1697618222;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E7J164Jv856pwHwwnBhSJ7e6PzthL3kRqEqL41tQ+DM=;
 b=jFVoJBH2lDsaQ84hr15G8Pcz646MaTQn++sd0Oy5B5MP7AkfZMRns/f04s8tLMKjMn
 5tw4audmV0kyns5PlfkLG2xREuoKRmrsEPfEhp+BqrKc8bk2VZBmnbuPihp2klPqAb6q
 FVo/GwfBCzoHnicRE3nNc+XIk2L7CkDEFRp4zKIgOUX/J0IW4IFA1hJrbCcaU3tdPPeQ
 l9Gfdb0OaLRpRc1Elo7sjjTuZzojmamN8ynE9osdTCuIoF/ICLkVY0hazffqAUTgakgr
 xadUUnd+IJHeqDCanmk712wws2YOozarB/Zi+OP3aMGO9cxbn2cXz+83+3lRnoO15YXn
 54iw==
X-Gm-Message-State: AOJu0Yz1m1SJnIqwbcXKjXLsOqSaMe69nhuDtknc3jxVRifv+zlJnBKk
 wNzQNcYAQ9YYpxifOrx2XihkCPcduTTUt69gheSPCqsrEwil5yKMPFiR3/s4lA+WU7IAGhfmjSs
 hiOlovkae53lK6Gd/CoBPqyokrl4s
X-Received: by 2002:a5d:6549:0:b0:319:6caa:ada2 with SMTP id
 z9-20020a5d6549000000b003196caaada2mr17296325wrv.47.1697013422246; 
 Wed, 11 Oct 2023 01:37:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLdbdkbYyfLcflQYmxxFwpoj7vs8zsEEpQXxYh+0xujwPn0ZUzvlgXcWRbym9VmYKIK7f2lA==
X-Received: by 2002:a5d:6549:0:b0:319:6caa:ada2 with SMTP id
 z9-20020a5d6549000000b003196caaada2mr17296309wrv.47.1697013421899; 
 Wed, 11 Oct 2023 01:37:01 -0700 (PDT)
Received: from localhost ([185.124.31.160]) by smtp.gmail.com with ESMTPSA id
 j13-20020adfe50d000000b003196b1bb528sm14727110wrm.64.2023.10.11.01.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 01:37:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/8] drm/ssd13xx: Use drm_format_info_min_pitch() to
 calculate the dest_pitch
In-Reply-To: <CAMuHMdWmzUx6iOhSSfNz4NyMZ0vY6Md6cn86S0BjOjhzzPuO=g@mail.gmail.com>
References: <20231009183522.543918-1-javierm@redhat.com>
 <20231009183522.543918-5-javierm@redhat.com>
 <CAMuHMdWmzUx6iOhSSfNz4NyMZ0vY6Md6cn86S0BjOjhzzPuO=g@mail.gmail.com>
Date: Wed, 11 Oct 2023 10:37:00 +0200
Message-ID: <87mswpsggj.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Javier,
>
> On Mon, Oct 9, 2023 at 8:36=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> Don't assume bpp of 1 and instead compute the destination pitch using th=
e
>> intermediate buffer pixel format info when doing a format conversion.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Thanks for your patch!
>
>> --- a/drivers/gpu/drm/solomon/ssd13xx.c
>> +++ b/drivers/gpu/drm/solomon/ssd13xx.c
>> @@ -148,6 +148,8 @@ struct ssd13xx_plane_state {
>>         struct drm_shadow_plane_state base;
>>         /* Intermediate buffer to convert pixels from XRGB8888 to HW for=
mat */
>>         u8 *buffer;
>> +       /* Pixel format info for the intermediate buffer */
>> +       const struct drm_format_info *fi;
>
> This is really intermediate, as it is removed again in the next patch :-)
>
> In fact 60% of this patch is changed again in the next patch.
> So perhaps combine this with the next patch?
>

I actually had it like that but then thought that maybe someone would say
that should be a separate patch :) I will squash it then.

> Gr{oetje,eeting}s,
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

