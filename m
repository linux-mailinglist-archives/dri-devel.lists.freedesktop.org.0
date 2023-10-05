Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF87D7B9D1E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 14:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C481710E3F0;
	Thu,  5 Oct 2023 12:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F4F10E3F0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 12:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696510713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6W8sT9rAMhqD2oqvCfRGrk/xzbFEyEVtrK+7IWn6j3c=;
 b=TZUYkXe+YvtCqF8ADTLxA0MFFwPbU1K4nJ2MgbqP4VByzw7n8LEBNrBL/oHzQjn/T//aXD
 K65osYPExtEwsEIg3kusZyIkYO41kLMD9MZDKx+u3DtsjSAxttvBNSiHiHN122BsBrVZ+W
 LcTtwUP6JP9cE+zvIoK0lqrHsEJvAs4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-lFuCTyeLP1q144zur1iDPw-1; Thu, 05 Oct 2023 08:58:32 -0400
X-MC-Unique: lFuCTyeLP1q144zur1iDPw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-405629826ccso7345585e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 05:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696510711; x=1697115511;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6W8sT9rAMhqD2oqvCfRGrk/xzbFEyEVtrK+7IWn6j3c=;
 b=FSITgNfBzHq2jZeEX8/xbYZOenAUpnuUUibfn0Olcjmf07CEN02NE4X28wTjZ1K9FW
 aN5dDS8ZQz2AHoIx4Ie7Mz5YSGX4UAMPE9OMmMxgzdf4sj/MwSFgR59Os0I/AMp8KXy1
 +VBZ2F+NaeXh1e0yR/bLVA9A9BF1fYTs2dvcfjXXgHQ8xN886jZqYtyToVPPkLhe8CLE
 yrAZwOLbBxxstcQcK2rsiuQ/kIsqT5oE4hn/5UXqk/tqwLvgGp9kcP58ZGbuvztmO/O/
 WN24v1S0coP6BP0a8maQdEcT6ID87KYrV/zXZbk1/yDUFomzGHmg1A1WVohBlVLMGNHC
 zUFw==
X-Gm-Message-State: AOJu0YzFEkx130TRLmCxYuiNXkL7i+APApnvAwmUdeyK0T7of3yGzwPQ
 iuV3BO4RizQOKlBJIveXnHFbJQrq2rIY+o/WLa3ugVmrtxxX+Bh1X5CqoAobsvefsyvlpj3w/qa
 OrX5UefuF0IMoiwCgP11uELuZ8BmK
X-Received: by 2002:a05:600c:294a:b0:3f5:fff8:d4f3 with SMTP id
 n10-20020a05600c294a00b003f5fff8d4f3mr5201225wmd.7.1696510710729; 
 Thu, 05 Oct 2023 05:58:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtSZioHDIpsJ2OM6grBNmo9B+wCvOmaWLkRX/V9k6TMbXNzk6hFc0KBkh6U6OaIXS9+73h2Q==
X-Received: by 2002:a05:600c:294a:b0:3f5:fff8:d4f3 with SMTP id
 n10-20020a05600c294a00b003f5fff8d4f3mr5201211wmd.7.1696510710434; 
 Thu, 05 Oct 2023 05:58:30 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w21-20020a05600c015500b0040652e8ca13sm3702877wmm.43.2023.10.05.05.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 05:58:30 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH v4 6/7] drm/ssd130x: Fix atomic_check for disabled planes
In-Reply-To: <874jj58c10.fsf@minerva.mail-host-address-is-not-set>
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-7-tzimmermann@suse.de>
 <8734ypwb9w.fsf@minerva.mail-host-address-is-not-set>
 <c4fd1d91-7d9b-483f-8b1d-10857a6f1016@suse.de>
 <874jj58c10.fsf@minerva.mail-host-address-is-not-set>
Date: Thu, 05 Oct 2023 14:58:29 +0200
Message-ID: <871qe98buy.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> Thomas Zimmermann <tzimmermann@suse.de> writes:
>
> Hello Thomas,
>

[...]

>>
>> You have a atomic_disable in that plane, so you're taking the branch at 
>> [2] for disabling the plane. No atomic_update then. If the plane has 
>> been enabled, you should take the branch at [3]. Without being able to 
>> move/scale the primary plane, I don't see how plane_state->visible could 
>> be false here. Right?
>>
>> AFAIKT there should not be a NULL-deref here. Can you do a test?
>>
>
> You are correct, there's no NULL-deref and in fact you are fixing the
> plane not disable bug, so your fix is correct and should be applied.
>
> I still prefer as mentioned keeping the drm_plane_helper_atomic_check()
> call instead of open coding it, but regardless of what is decided:
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

And also for patches #1, #2, #3, #6 and #7, feel free to add:

Tested-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

