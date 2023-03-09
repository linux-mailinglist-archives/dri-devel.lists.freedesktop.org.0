Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5536B2BA9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 18:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0639810E185;
	Thu,  9 Mar 2023 17:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1C410E185
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 17:09:15 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so4103656wmb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 09:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678381754;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=o5wND0fd1Z3rtFlrd7Cp/13ujKlgxha1tgzRC1bLZd4=;
 b=uGmFYUzHnNV3C5TNGAUoIaJQkGsd+hWv3ltwc5E3iMzQxTOyaZIwafzulKKhGhg/Bs
 qmslhKXYxaCciZUC8wbskC/jJ3sU1kRiHuO3GJmQlMDaOtS367exmWToQEq9dqpA8um0
 tB+9/0v2yXHBgej67DrmtQqX2S5Yb/e1XYMNmBu986bX7DNDrrwb2pO0J8kHpU3UT3d+
 70jACtOeLfxuu+Njr7RPLEep8Wie+pZYjexDyOa14kcsG2mf2eX1cgppsY3MeVfN4o0Q
 CE56MNmtF6uKzuf8Jbmn8zPQIgyRVHRx0E9vX1r+c6tRmZatSQCqvAff5gs+6HWi8kX3
 JgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678381754;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o5wND0fd1Z3rtFlrd7Cp/13ujKlgxha1tgzRC1bLZd4=;
 b=CemJJepkD99gvczSkUi7Sp7vNo1wFymXckE0ouqXxyOxPmKvaBNginXFD9IyUjwdWO
 1NU1BfWTJpwBatCnXBGF8eZV/IlApw9pLVb/hyEIvCIDpwmDQ9BUJprrTKB8K5Ty913w
 0bEt5K80qwycTYvJ4YRJ+1pYW8pKBPKBsHDzk0msSIC2CjWP1Wp8q2eZXJ2c2MxIwSiL
 Dv+gaxJcR2YX6EJw3OMIr0jjlLjz7EKh8gcQHkCBchc3wszWoEXXSOnUJSVev7sEEScD
 /K5wFw8TMiUt82xI9XBD24OXtGyT9pkJP2k3cMBALybuWZuurbdYC4wweDyX4o/RLunO
 LRLQ==
X-Gm-Message-State: AO0yUKXR+A0WoSoEIdHLofulxHvAol/wlbWUPp01yUy3AYe492B/NC9j
 4oOjnH7cQFwvm8FpCaXLkyUrCQ==
X-Google-Smtp-Source: AK7set8MMBZWwqPrZ6maUN532SudklucvR9ks2z0HcQ0YATPkl1I3mXhCbwZmTdnQxXEaG1Fv/9dyA==
X-Received: by 2002:a05:600c:3c87:b0:3eb:39e2:9157 with SMTP id
 bg7-20020a05600c3c8700b003eb39e29157mr21582110wmb.22.1678381753784; 
 Thu, 09 Mar 2023 09:09:13 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c294500b003e2232d0960sm403152wmd.23.2023.03.09.09.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 09:09:13 -0800 (PST)
Date: Thu, 9 Mar 2023 17:09:11 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] backlight: apple_bl: Use acpi_video_get_backlight_type()
Message-ID: <20230309170911.GC96419@aspen.lan>
References: <20230307120540.389920-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307120540.389920-1-hdegoede@redhat.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Mark Gross <markgross@kernel.org>,
 Aditya Garg <gargaditya08@live.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 01:05:40PM +0100, Hans de Goede wrote:
> On some MacBooks both the apple_bl and the apple-gmux backlight drivers
> may be able to export a /sys/class/backlight device.
>
> To avoid having 2 backlight devices for one LCD panel until now
> the apple-gmux driver has been calling apple_bl_unregister() to move
> the apple_bl backlight device out of the way when it loads.
>
> Similar problems exist on other x86 laptops and all backlight drivers
> which may be used on x86 laptops have moved to using
> acpi_video_get_backlight_type() to determine whether they should load
> or not.
>
> Switch apple_bl to this model too, so that it is consistent with all
> the other x86 backlight drivers.
> [snip]
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

but...

> ---
> A note to the backlight class / subsystem maintainers, this change
> applies on top of a similar patch for drivers/platform/x86/apple-gmux.c
> which makes that driver use acpi_video_get_backlight_type(). See:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>
> I believe it is easiest to also merge this patch through
> the platform-drivers-x86 tree, may I please have your Ack for this ?
> ---

... please don't treat above as an ack. Lee Jones will hopefully be
along shortly to discuss that!


Daniel.
