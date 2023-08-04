Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA2C770BA1
	for <lists+dri-devel@lfdr.de>; Sat,  5 Aug 2023 00:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F7D10E139;
	Fri,  4 Aug 2023 22:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B13210E139
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 22:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691186559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vXzpEUWdN4SLt2rhGexfL6X3wS8/Bi9/wvDHMwbVeD0=;
 b=SgdG6kyOKaATyKZoFSLyP+WzutGRQ4PmtGiGg9rWN3/zEp2fPHZd83vMgq907AQVH1AEqZ
 VR5fmc7V3kLHDXfUrIB10FOBGumMzL/tsgDhrqpwVdvG5g3gwhTp89FLrIh0WcZXhz+KAV
 LtrNGPUsxuWZEz3pLVW8mfBg96SITHM=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-Wgn2kdQaO6yraRL_Jp6OZA-1; Fri, 04 Aug 2023 18:02:38 -0400
X-MC-Unique: Wgn2kdQaO6yraRL_Jp6OZA-1
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-56d11c2fc66so3551014eaf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 15:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691186557; x=1691791357;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vXzpEUWdN4SLt2rhGexfL6X3wS8/Bi9/wvDHMwbVeD0=;
 b=V6UVTeu+hY5fwxPXOgGjX1oGSQUtXDnYIfp4G8qDdFI0VVk24n5SgGN2CP7O3B7lXS
 kW+M7rowEakxHEzk3PgMqO/qgN9C6Y93lYviZFama7q4vLCS9INpj8QXOA1Pry0ugINl
 5/Tfi9Hb6bowlE0zCOTjR9t464ZVZB1MTP/9lr+EUSQR1/V7288rAgGYBiJlaRunPGIv
 z5TJK2aS2wc4ruixVVxbmp89Uyn7oeA7/x/uq9E8IUks2Pn1dzIxHzhIcys5A4jck6ma
 3WHUvko4yQOHflYAz/P/mI/vSEQxdJgyCPgCl3pzTaLmDt+dKDr4RSzjhCJBX2/K8FF0
 svJA==
X-Gm-Message-State: AOJu0YxiL4X6y5GM9S2elVKGMtA5OJFPaBbD9AZI1FH9Iu9FZyfIRwWB
 zPq8GYdaqADuFfWWq4+ucyet0U76bP6FYR9IEk+dPTzgTUfKHrvGs5BfgodcjJsw6VUv9T+gfVO
 PiHxbaEnjQCy9gcGivzKhZdAf8Z1h
X-Received: by 2002:a05:6870:9a1d:b0:1bf:4f5e:55e2 with SMTP id
 fo29-20020a0568709a1d00b001bf4f5e55e2mr3810523oab.53.1691186557637; 
 Fri, 04 Aug 2023 15:02:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFibSEktTsTzniXcgNYUQlqWW7plBeiVw+TGTzHJSGuSRMOkvkMo+5wIPlRNMRenI850kABsQ==
X-Received: by 2002:a05:6870:9a1d:b0:1bf:4f5e:55e2 with SMTP id
 fo29-20020a0568709a1d00b001bf4f5e55e2mr3810498oab.53.1691186557318; 
 Fri, 04 Aug 2023 15:02:37 -0700 (PDT)
Received: from localhost ([181.120.144.238]) by smtp.gmail.com with ESMTPSA id
 c12-20020a9d67cc000000b006b9cbad68a8sm1677676otn.30.2023.08.04.15.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 15:02:36 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: Drop select FRAMEBUFFER_CONSOLE for
 DRM_FBDEV_EMULATION
In-Reply-To: <77cdbbed-e64d-0c55-bf0a-6dfcfbdb8b20@infradead.org>
References: <20230804125156.1387542-1-javierm@redhat.com>
 <77cdbbed-e64d-0c55-bf0a-6dfcfbdb8b20@infradead.org>
Date: Sat, 05 Aug 2023 00:02:33 +0200
Message-ID: <87msz6foue.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Randy Dunlap <rdunlap@infradead.org> writes:

Hello Randy,

> On 8/4/23 05:51, Javier Martinez Canillas wrote:
>> The commit c242f48433e7 ("drm: Make FB_CORE to be selected if DRM fbdev
>> emulation is enabled") changed DRM_FBDEV_EMULATION from 'depends on FB'
>> to an effective 'select FB_CORE', so any config that previously had DRM=y
>> and FB=n now has FB_CORE=y and FRAMEBUFFER_CONSOLE=y.
>> 
>> This leads to unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
>> as reported by Arthur Grillo, e.g:
>> 
>> WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
>>   Depends on [n]: VT [=n] && FB_CORE [=y] && !UML [=y]
>>   Selected by [y]:
>>   - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && !EXPERT [=n]
>> 
>> Arnd Bergmann suggests to drop the select FRAMEBUFFER_CONSOLE for the
>> DRM_FBDEV_EMULATION Kconfig symbol, since a possible use case could
>> be to enable DRM fbdev emulation but without a framebuffer console.
>> 
>> Fixes: c242f48433e7 ("drm: Make FB_CORE to be selected if DRM fbdev emulation is enabled")
>> Reported-by: Arthur Grillo <arthurgrillo@riseup.net>
>> Closes: https://lore.kernel.org/dri-devel/20230726220325.278976-1-arthurgrillo@riseup.net
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
>

I have already pushed this patch so I won't be able to add these tags but
thanks a lot for testing and confirming that the patch fixes your issue!

> Thanks.
>
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

