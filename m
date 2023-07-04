Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B57B746B34
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 09:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC3C10E2A8;
	Tue,  4 Jul 2023 07:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADBF10E2A8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 07:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688457285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2mvIcAvyCjib7MCwv+ANmUWmiWOuPWDTlYpmYYbg+LE=;
 b=OByUVb2+14iWum9wb+JSrTklZCsVFo18dDJVjSwD/5/qmrSy6xwwFPD4dnVfJAFSoS2435
 8g/XnOB/WIW9D7bpyXTvV5kYGOxhRhuVqd9jN6MhZMw6zlgfG7qUSl40zS2ZRriRIy80La
 RbBiKCpIcxPAYj3sVEdO3BstUZjstTE=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-yKtDeSvFO4SsQP1jjd3C5w-1; Tue, 04 Jul 2023 03:54:42 -0400
X-MC-Unique: yKtDeSvFO4SsQP1jjd3C5w-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4fb76659d44so4897623e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 00:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688457281; x=1691049281;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QKrB5YS08GogmNSu7Y0RQRA2Szw+Z40s1lTL+YoBbo8=;
 b=agXaQM6UYg5u8t3y9nnfk69mZB8hdWieTNHg1GF6+P2CxJEpDVjWBK8e20o52RES/B
 Gx+VYm6IJBsGkayYrcCujbZD9dq6KrpNS2uHDDe/MD+9p/kpiYCdXifQDW2ocysT7V/W
 tqJMndBbejk7zuVMzRWyw7gUYVy4qjp5MrcBIg3V3qOJt402hnlMYAkeqscyACqGxWu9
 4lFtDD1tKD+YSC/Bhzg7ludzQX9uozNMLDBoEtlxS79NRZfW7tjjy/rtahZ5JhqqeczS
 qVkVDapApKJv2sSewxNy5Dh2vUglFC4eMvyeN5pcALLxRmz5ZURHD1pv7XeIn2T330xx
 4KXg==
X-Gm-Message-State: ABy/qLYjUkq2/Uavx6bHmBZr07xleblkTQ6LbmL8YEtdNcoPmHpKzZvX
 lNY2CrSINsbanQzKFypQjR9ZgUdxculbeOXxJvOzcYznSzLlxAOxyCbKkuDVGqRCLPsgQtV5tOC
 EJ0Gwb42gz9u5EIy0s5VRZR5jv8X5
X-Received: by 2002:ac2:5f92:0:b0:4fa:a0c3:efa1 with SMTP id
 r18-20020ac25f92000000b004faa0c3efa1mr8124399lfe.7.1688457280934; 
 Tue, 04 Jul 2023 00:54:40 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGv5H/b0zhH/dQl8i//ZbCh57DUE2bTT97eL1Mf3dlGQfF99dJp+Ktbu5zRXTh1sOMdVeb8dQ==
X-Received: by 2002:ac2:5f92:0:b0:4fa:a0c3:efa1 with SMTP id
 r18-20020ac25f92000000b004faa0c3efa1mr8124377lfe.7.1688457280294; 
 Tue, 04 Jul 2023 00:54:40 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 7-20020a05600c230700b003fa968e9c27sm24443386wmo.9.2023.07.04.00.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 00:54:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 1/5] video: Add auxiliary display drivers to Graphics
 support menu
In-Reply-To: <CAMuHMdXRg1OUy6UHuH4H+qkK-qO+jTKdVoG_SRM3q_PkyD+Bbw@mail.gmail.com>
References: <20230703230534.997525-1-javierm@redhat.com>
 <20230703230534.997525-2-javierm@redhat.com>
 <CAMuHMdXRg1OUy6UHuH4H+qkK-qO+jTKdVoG_SRM3q_PkyD+Bbw@mail.gmail.com>
Date: Tue, 04 Jul 2023 09:54:39 +0200
Message-ID: <87h6qkyuv4.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Nipun Gupta <nipun.gupta@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

> Hi Javier,
>
> On Tue, Jul 4, 2023 at 1:05=E2=80=AFAM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> The drivers in this subsystem are for character-based LCD displays, whic=
h
>> can fall into the same category of the DRM/KMS and fbdev drivers that ar=
e
>> located under the "Graphics support" menu. Add auxdisplay there as well.
>>
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Thanks for your patch!
>
>> --- a/drivers/video/Kconfig
>> +++ b/drivers/video/Kconfig
>> @@ -30,6 +30,8 @@ if HAS_IOMEM
>>  config HAVE_FB_ATMEL
>>         bool
>>
>> +source "drivers/auxdisplay/Kconfig"
>
> This is inside the "if HAS_IOMEM" section, while there was no
> such limitation before.
>

Gah, I missed that. Thanks a lot for pointing it out.

If I move the source outside of the if block, are you OK with this patch?

I think Thomas is correct and would make sense to put the character-based
drivers next to the DRM and fbdev drivers since all these are for display.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

