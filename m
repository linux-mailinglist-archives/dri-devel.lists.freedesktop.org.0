Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EC66F4035
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 11:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D258C10E4CF;
	Tue,  2 May 2023 09:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764CB10E4D4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 09:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683019945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qGbrqqVaDpm05AHuHwpsi1G8xPM+DXbg5Uuq7VcQFf0=;
 b=FnLPvUMGHeF2UYdCOXxDN5MZVj/S9yqjGViCRDEfm/V6hLlL7F6DhRkl/mf9r7WBY+yeCd
 o5+52E6zsVbOmSN89IFBAVsxc+0Gw1ifDzenM/YfR+QtR7e6X2MxltSMi+L7D7d1b0VX4R
 P5Gt3WQa72yfVytH7VAa0yvzVHQycns=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-YYOgWISCM7Kk1ig41TpwrQ-1; Tue, 02 May 2023 05:32:24 -0400
X-MC-Unique: YYOgWISCM7Kk1ig41TpwrQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f3157128b4so99987625e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 02:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683019943; x=1685611943;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qGbrqqVaDpm05AHuHwpsi1G8xPM+DXbg5Uuq7VcQFf0=;
 b=arSsV7pLBky6Ka/lYHHORlNW3pgK0F8bUpqMAUONlqGnD3+jZpn7PnXPk59oDUoOqy
 vZjwukF6xrkUGfJzZk2riN84f5puy7nj4HaQ/qg7l5dWMjVlBNPiqyeTtsQfJLdocMFC
 cRIq0BywMowB22NySfSszlZNJ8yqUJ9bLGoq0Bd+ZL/rOCcBDr7hRSzOb3zgWyUnSb36
 G+rSLhlKf5ZeuY8GJA6x+mjv8hhg6Qy8qhpG3ItP3ub6FRdRFMRA5JR7atJ7bUdlFxU2
 GMUsAiR1petyRaPTA7/WRI34w6mrZpxbRoAEd6Stmld6zEciwwgzBhZMTfIbRW9xNSJB
 DEDQ==
X-Gm-Message-State: AC+VfDxX9rCs4UnDaNCKApMma7YJ1U1eIksk46hQ1a5nG/M1THsvy42r
 EDaNeXoGbRPRtlL8Ulu9Lb6wvBVdManuHZJTiwSh8P+h1GXgtCFDcmZ8TrKbp2Yz99YStruO4NL
 Ulyh7TtDmPyppetiyvJDDcoRGLUKK
X-Received: by 2002:adf:ed4c:0:b0:2fa:d00d:cab8 with SMTP id
 u12-20020adfed4c000000b002fad00dcab8mr10523010wro.18.1683019942996; 
 Tue, 02 May 2023 02:32:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Ny0SyxqPYdHROomDFuM2aXgIRoSLjZ8P4kUjzBL7vSVfqP59DeMhAr12tCEWBDTuCR61IBQ==
X-Received: by 2002:adf:ed4c:0:b0:2fa:d00d:cab8 with SMTP id
 u12-20020adfed4c000000b002fad00dcab8mr10522995wro.18.1683019942677; 
 Tue, 02 May 2023 02:32:22 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h16-20020a5d5490000000b00304b5b2f5ffsm12180965wrv.53.2023.05.02.02.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 02:32:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>, Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH v2 1/8] drm: Disable the cursor plane on atomic contexts
 with virtualized drivers
In-Reply-To: <YvPfedG/uLQNFG7e@phenom.ffwll.local>
References: <20220712033246.1148476-1-zack@kde.org>
 <20220712033246.1148476-2-zack@kde.org>
 <YvPfedG/uLQNFG7e@phenom.ffwll.local>
Date: Tue, 02 May 2023 11:32:21 +0200
Message-ID: <87lei7xemy.fsf@minerva.mail-host-address-is-not-set>
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
Cc: krastevm@vmware.com, David Airlie <airlied@linux.ie>,
 Bilal Elmoussaoui <belmouss@redhat.com>, stable@vger.kernel.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, spice-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, mombasawalam@vmware.com,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Vetter <daniel@ffwll.ch> writes:

> On Mon, Jul 11, 2022 at 11:32:39PM -0400, Zack Rusin wrote:
>> From: Zack Rusin <zackr@vmware.com>
>> 
>> Cursor planes on virtualized drivers have special meaning and require
>> that the clients handle them in specific ways, e.g. the cursor plane
>> should react to the mouse movement the way a mouse cursor would be
>> expected to and the client is required to set hotspot properties on it
>> in order for the mouse events to be routed correctly.
>> 
>> This breaks the contract as specified by the "universal planes". Fix it
>> by disabling the cursor planes on virtualized drivers while adding
>> a foundation on top of which it's possible to special case mouse cursor
>> planes for clients that want it.
>> 
>> Disabling the cursor planes makes some kms compositors which were broken,
>> e.g. Weston, fallback to software cursor which works fine or at least
>> better than currently while having no effect on others, e.g. gnome-shell
>> or kwin, which put virtualized drivers on a deny-list when running in
>> atomic context to make them fallback to legacy kms and avoid this issue.
>> 
>> Signed-off-by: Zack Rusin <zackr@vmware.com>
>> Fixes: 681e7ec73044 ("drm: Allow userspace to ask for universal plane list (v2)")

[...]

>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index f6159acb8856..c4cd7fc350d9 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -94,6 +94,16 @@ enum drm_driver_feature {
>>  	 * synchronization of command submission.
>>  	 */
>>  	DRIVER_SYNCOBJ_TIMELINE         = BIT(6),
>> +	/**
>> +	 * @DRIVER_VIRTUAL:
>> +	 *
>> +	 * Driver is running on top of virtual hardware. The most significant
>> +	 * implication of this is a requirement of special handling of the
>> +	 * cursor plane (e.g. cursor plane has to actually track the mouse
>> +	 * cursor and the clients are required to set hotspot in order for
>> +	 * the cursor planes to work correctly).
>> +	 */
>> +	DRIVER_VIRTUAL                  = BIT(7),
>
> I think the naming here is unfortunate, because people will vonder why
> e.g. vkms doesn't set this, and then add it, and confuse stuff completely.
>
> Also it feels a bit wrong to put this onto the driver, when really it's a
> cursor flag. I guess you can make it some kind of flag in the drm_plane
> structure, or a new plane type, but putting it there instead of into the
> "random pile of midlayer-mistake driver flags" would be a lot better.
>
> Otherwise I think the series looks roughly how I'd expect it to look.
> -Daniel
>

AFAICT this is the only remaining thing to be addressed for this series ?

Zack, are you planning to re-spin a v3 of this patch-set? Asking because
we want to take virtio-gpu out of the atomic KMS deny list in mutter, but
first need this to land.

If you think that won't be able to do it in the short term, Bilal (Cc'ed)
or me would be glad to help with that.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

