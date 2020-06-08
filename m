Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B40621F1B17
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 16:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380A76E862;
	Mon,  8 Jun 2020 14:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FA06E862
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 14:35:05 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id g10so15557088wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 07:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ThWG7PLkTZsxbTGQI2QqS4ypuKcTM21qeWcb7Pqf2u0=;
 b=Wtu/IESN641sfnMFWfEgg6CJ6ybv0wkD6kDu6juOnd3HKmOlTwyYjpki6wx8lMkCZr
 II15j+zzfLYA2plLL6z1MfJ+VuPSoediq9yVINYJr3B9b++h/3U8OGqCoLCdI+I4QWXF
 DbwpgHLw1JchAiihgET+gCGvuI5T/DtkVVb2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ThWG7PLkTZsxbTGQI2QqS4ypuKcTM21qeWcb7Pqf2u0=;
 b=fKl5Vo8OD5uVCGMqSKc4mBnso+kyezrLQ/NpkoR7ENErVa1tEmIf+JJVZlDxQnNMus
 GWuqluLkdMUpYg5VbUVsuFDNFSs1xRC7auiTl406jNBRvOG6dPw5CEc30upRr8F309hE
 pcFcyH9B8KHIWU7PlZCO7W9xMCgL5a36VelR/Gda/Ri+mLIOziddaBrIDN20tPbYYWjw
 79+JHeaz6ADHF0rhAteE5BdqgH+38eJvzUNxlO/hI7+zN3KhnhOpa17XXdG9w8ttdr5J
 ifGfy4EwHw4ZgAYVc15JieqbEIattDBvq95VAh6DbilETcuaVZ9szizCHnLk7hQSdEPR
 tKEg==
X-Gm-Message-State: AOAM5315Ltq1jJ3G49umXyK1HkZqWtSUOyutGPIe9LS5S7a4Pk4Qtwua
 pVIa5aZmNGGPd6mjchlxDwEorQ==
X-Google-Smtp-Source: ABdhPJyXoO9cmG2YWT7CRaiLUKnDXmJGp9wEivXhk6yC+ifOrjoJSPuglGOvD7hufAunPazgABGmJg==
X-Received: by 2002:a1c:9acf:: with SMTP id
 c198mr16847442wme.172.1591626904265; 
 Mon, 08 Jun 2020 07:35:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b8sm23308626wrm.35.2020.06.08.07.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 07:35:03 -0700 (PDT)
Date: Mon, 8 Jun 2020 16:35:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: pwm/i915: Convert pwm-crc and i915 driver's PWM code to use the
 atomic PWM API
Message-ID: <20200608143500.GX20149@phenom.ffwll.local>
References: <20200606202601.48410-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200606202601.48410-1-hdegoede@redhat.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 06, 2020 at 10:25:45PM +0200, Hans de Goede wrote:
> Hi All,
> 
> This patch series converts the i915 driver's cpde for controlling the
> panel's backlight with an external PWM controller to use the atomic PWM API.
> 
> Initially the plan was for this series to consist of 2 parts:
> 1. convert the pwm-crc driver to support the atomic PWM API and
> 2. convert the i915 driver's PWM code to use the atomic PWM API.
> 
> But during testing I've found a number of bugs in the pwm-lpss and I
> found that the acpi_lpss code needs some special handling because of
> some ugliness found in most Cherry Trail DSDTs.
> 
> So now this series has grown somewhat large and consists of 4 parts:
> 
> 1. acpi_lpss fixes workarounds for Cherry Trail DSTD nastiness
> 2. various fixes to the pwm-lpss driver
> 3. convert the pwm-crc driver to support the atomic PWM API and
> 4. convert the i915 driver's PWM code to use the atomic PWM API
> 
> So we need to discuss how to merge this (once it passes review).
> Although the inter-dependencies are only runtime I still think we should
> make sure that 1-3 are in the drm-intel-next-queued (dinq) tree before
> merging the i915 changes. Both to make sure that the intel-gfx CI system
> does not become unhappy and for bisecting reasons.

Simplest is if acpi acks the acpi patches for merging through
drm-intel.git. Second simplest is topic branch (drm-intel maintainers can
do that) with the entire pile, which then acpi and drm-intel can both pull
in.

Up to the two maintainer teams to figure this one out.

/me out

Cheers, Daniel

> 
> The involved acpi_lpss and pwm drivers do not see a whole lot of churn,
> so we could just merge everything through dinq, or we could use immutable
> branch and merge those into dinq.
> 
> So Rafael and Thierry, can I either get your Acked-by for directly merging
> this into dinq, or can you provide an immutable branch with these patches?
> 
> This series has been tested (and re-tested after adding various bug-fixes)
> extensively. It has been tested on the following devices:
> 
> -Asus T100TA		BYT + CRC-PMIC PWM
> -Toshiba WT8-A		BYT + CRC-PMIC PWM
> -Thundersoft TS178	BYT + CRC-PMIC PWM, inverse PWM
> -Asus T100HA		CHT + CRC-PMIC PWM
> -Terra Pad 1061		BYT + LPSS PWM
> -Trekstor Twin 10.1	BYT + LPSS PWM
> -Asus T101HA		CHT + CRC-PMIC PWM
> -GPD Pocket		CHT + CRC-PMIC PWM
> 
> Regards,
> 
> Hans
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
