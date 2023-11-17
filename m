Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C247EFB45
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 23:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8632910E78B;
	Fri, 17 Nov 2023 22:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B7E10E78B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 22:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700259529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xb+39jMBjIG9e9EUVeLvv86Ka0wZnTphGetSvGEJ6aE=;
 b=jMHqSfojxfm5OoXrsh1jpiR5lDs9UHCE+RBkCS16e5PAHi1dmqNsuOjAmHaRd4Q2Ldwpj7
 QmyAvlixQcTjMKLShLn6KW6ijnGgGWZ7HwgVYzxlAXsD7UlS6B3U2j8yYjrJqlZJTHhCF+
 LsNnc49A5VaERug9HcZYh1F6pafD9EY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-G8ZFJGQDPpOXub-WmgSEEg-1; Fri, 17 Nov 2023 17:18:48 -0500
X-MC-Unique: G8ZFJGQDPpOXub-WmgSEEg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-408534c3ec7so14366395e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 14:18:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700259527; x=1700864327;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xb+39jMBjIG9e9EUVeLvv86Ka0wZnTphGetSvGEJ6aE=;
 b=DGVL6OqwAthSxyBsQ8qBbQjkWyJCVE3/laT0SvhXK+w+NDlgE8Cc0eBJZGk5TQqu3u
 dkTOAxK0pDQGiF8Da5vNp3i3FmQt8c26dz/LctbRTOWEZcu0vM/9RHclTDabXjn7bYlm
 LkWcm1WVltmMOD6klhosGp5cAYfZu+sr9ci1L+YSXOYWRQW4Qs8j0KN5XzjQGzdap3tU
 /RAHWGjfDNskNv9t/3HSJTfCoD1l2Tt+IfhsNtYNz2tcre+mF0gDCQukInenH50BK8yd
 OuqT6WNjh13wmWcsqyBDVRkrQf6uD/VMJvsAyqD6R/oRknj8mR85molpgZwE9xKcIGRE
 NM3g==
X-Gm-Message-State: AOJu0Yx7XKckC0it/W4J4Bsbx6buWcYNK/BGIWayWeYdjJShggpStodU
 TTZLqhUWZFV+RFcpY2grvSz677O7K3TtBEPrwQyi43+7pntZPGEzjhOzF1k7o3g/pPDBKgIoIwM
 S0VlPmtr6G4J0cowDS/3O586FnNx9
X-Received: by 2002:a05:600c:19ca:b0:3fe:2b8c:9f0b with SMTP id
 u10-20020a05600c19ca00b003fe2b8c9f0bmr283582wmq.23.1700259527246; 
 Fri, 17 Nov 2023 14:18:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1ki+IESh+gyMw/wvDuuRKAIdBZvjvrveHDpkuOxRGvzlqclzeFbtQ8juy0XxQQTk1lYkKRQ==
X-Received: by 2002:a05:600c:19ca:b0:3fe:2b8c:9f0b with SMTP id
 u10-20020a05600c19ca00b003fe2b8c9f0bmr283570wmq.23.1700259526834; 
 Fri, 17 Nov 2023 14:18:46 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x16-20020a05600c21d000b004063cd8105csm8421532wmj.22.2023.11.17.14.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 14:18:46 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/3] fbdev: ssd1307fb: Change "solomon,page-offset"
 property default value
In-Reply-To: <ZVfX5Tw71cqKFJ83@smile.fi.intel.com>
References: <20231116180743.2763021-1-javierm@redhat.com>
 <20231116180743.2763021-2-javierm@redhat.com>
 <ZVfX5Tw71cqKFJ83@smile.fi.intel.com>
Date: Fri, 17 Nov 2023 23:18:45 +0100
Message-ID: <878r6w10sa.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Sahaj Sarup <sahaj.sarup@linaro.org>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

Hello Andy,

> On Thu, Nov 16, 2023 at 07:07:38PM +0100, Javier Martinez Canillas wrote:
>> This is used to specify the page start address offset of the display RAM.
>> 
>> The value is used as offset when setting the page start address with the
>> SSD130X_SET_PAGE_RANGE command, and the driver currently sets its value to
>> 1 if the property is not present in the Device Tree.
>> 
>> But the datasheet mentions that the value on reset for the page start is a
>> 0, so it makes more sense to also have 0 as the default value for the page
>> offset if the property is not present.
>> 
>> In fact, using a default value of 1 leads to the display not working when
>> the fbdev is attached to the framebuffer console.
>> 
>> Reported-by: Sahaj Sarup <sahaj.sarup@linaro.org>
>
> Closes?

There's no report in a mailing list or bug tracker to reference.

> Fixes?
>

Since the default has been the same since the driver was merged,
it doesn't make that much sense for me to reference that commit.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

