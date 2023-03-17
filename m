Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A74BA6BEFD7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 18:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D82210E3DB;
	Fri, 17 Mar 2023 17:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4D610E3DB
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 17:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679074738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W5igOX9Uv7sYkEvQwXODf9CZvRxNpFSAdyMQhy74jlc=;
 b=HPFY14czm57amWhBsszM5lzQVuwkGGfz8bmUdMolue5NjiPJGshm75YjGLtLF7urcBZyKb
 pMwJHJC3hUCNA0Ts1DVhodYHdWRnhpMIn5/pfk/uFRLUlsFXpxXaRydEy8UIIHoZl3Ws75
 lgU4mz7urVIIbmNQPbOISyaDWxsKEn8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-MPFdz8PoORu1ixwqmvTVXw-1; Fri, 17 Mar 2023 13:38:47 -0400
X-MC-Unique: MPFdz8PoORu1ixwqmvTVXw-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay12-20020a05600c1e0c00b003ed201dcf71so2557572wmb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 10:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679074726;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W5igOX9Uv7sYkEvQwXODf9CZvRxNpFSAdyMQhy74jlc=;
 b=V6Eur2KH4io0lq46Syiau0yTHNG+2g3bwOA7bgPZcnxW+mKVPXUKsJ1xu4CZkn/X+A
 w+w9M5AXIOQ5JSK4u7xpGvxmSSj8G1RZfX0JDm6vFmoQThkFFx+ihQZvgGH4vxsvzm4A
 1U6nNTdSbT/MfueuKhzLRgKFz8jKK5rfe1TljCePRmF+NPmskVbgMrPg6PPlOFTvNLfK
 CVFU/QzBIhhnhwsnlB5cI2B8QeFgzGZ80U1j4o7PNsXCDkp3vLfvD0DrJq42lYkCL9Bm
 JzQagVYd31DDo0qcNlUWWGe70YODcoXlsGsu1tmFy/u6UoDFR17ZFzxlduTPePBoGxvB
 UFbQ==
X-Gm-Message-State: AO0yUKXZme7xZzLoiygodo+S6RDKCKn+JhOE7NdRtXcWzW9UOwdg+L35
 1MdRDxCNQJoFPvP819rvefM/e2oCPurU7AmaZjds/Lvty7yqsqGelXoQC7kiJQDUBBtqWyvQms5
 iEzK0Vg6SchmWL/qV2Vj77MoFDJuO
X-Received: by 2002:adf:f605:0:b0:2cf:e449:1a9e with SMTP id
 t5-20020adff605000000b002cfe4491a9emr3202826wrp.30.1679074726451; 
 Fri, 17 Mar 2023 10:38:46 -0700 (PDT)
X-Google-Smtp-Source: AK7set/+ae3GwRd47AXIKw0cf03azn2wiPwxPLPHv3vayi16W0DR57E4TsNrw9o1MvTAss5UWm0uLw==
X-Received: by 2002:adf:f605:0:b0:2cf:e449:1a9e with SMTP id
 t5-20020adff605000000b002cfe4491a9emr3202812wrp.30.1679074726127; 
 Fri, 17 Mar 2023 10:38:46 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l10-20020a5d4bca000000b002cfea3c49d5sm2451189wrt.52.2023.03.17.10.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 10:38:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/format-helper: Use drm_format_info_min_pitch() in
 tests helper
In-Reply-To: <0a1a0765-8f9c-90f5-b848-2931904269a7@suse.de>
References: <20230316223404.102806-1-javierm@redhat.com>
 <0a1a0765-8f9c-90f5-b848-2931904269a7@suse.de>
Date: Fri, 17 Mar 2023 18:38:43 +0100
Message-ID: <87jzzfp9b0.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mairacanal@riseup.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, David Gow <davidgow@google.com>,
 =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Am 16.03.23 um 23:34 schrieb Javier Martinez Canillas:
>> There's a nice macro to calculate the destination pitch that already takes
>> into account sub-byte pixel formats. Use that instead of open coding it.
>> 
>> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

