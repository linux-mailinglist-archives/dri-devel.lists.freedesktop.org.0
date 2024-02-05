Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE995849F67
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 17:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CD7112348;
	Mon,  5 Feb 2024 16:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KiiiYdF/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DA1112348
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 16:23:57 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-55c2cf644f3so5522959a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 08:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1707150233; x=1707755033;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UqFSrAEJyuKkYiecikc67XEFMHOq4AKZCrfCWi7N71c=;
 b=KiiiYdF/I1pEZSfZMaD2FwXjFQb51CPQZG2g+y3eLknOh8VIXNoIl1SjzsYrWDVnAA
 zLCfzESEPZ7EZ3m8dtlw+bnhANSRJghuQ7rTiGVqwCuVNRxxlrdD3zcNiz6aBBcKkrTK
 LmmzUpfpCigIJNZCqt2cusPF9A8kGzwFky/iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707150233; x=1707755033;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UqFSrAEJyuKkYiecikc67XEFMHOq4AKZCrfCWi7N71c=;
 b=u5lNfrnhlK2PYrMMVA3Hp47Dvftsb47Bk8mx6vIOSO5dbihE1UJzTebM5asSFonbzw
 weL/JUzi8CwS9OzE25AuB6ULEnBvzkTF1G42lx3Q+Nv/Da5CGdsDvHzCviaaMkxQSVhI
 Ordu2oOi/n73Ks4FwOW/Jo+etq2qLJ/nH7ba95tE8jIHhRpmTIx4BtXWn/Vc7ih9PHYp
 NxrcF4z30GguU3RBRBGSxyM4kuX6nq4aipL6cN9m9N7i8rXxlyOnuSjveRDcWw5iIDUz
 DGKjCOe/R/ULqqHOP41L53Xggnbc79WkySsffMRXudNGvRl0Zac2kgHlVsDgKLktH6IB
 0g9w==
X-Gm-Message-State: AOJu0YyNerzwgMtJBURCaxxhgRfAbgRE5ZaQadfPkU9PrGY6qjPxlfTT
 6+l8OmPTkaFM8gDiu7tUJEKVqdxI2bqOExuXPeKREctsJZtX0QeiBCPJElwnDXPPRE+jUhN3hhQ
 fSA==
X-Google-Smtp-Source: AGHT+IFcoBcmt6DSBmG5Np8th0KgmRzcCAaLx78P3LkwG7X69XAMgUjMV7SQUe7KROAuIdoCrOXbhQ==
X-Received: by 2002:aa7:d482:0:b0:55f:84a9:9000 with SMTP id
 b2-20020aa7d482000000b0055f84a99000mr5002649edr.3.1707150231366; 
 Mon, 05 Feb 2024 08:23:51 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 fe5-20020a056402390500b005608ebc2be1sm45324edb.18.2024.02.05.08.23.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 08:23:50 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-56012eeb755so19568a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 08:23:50 -0800 (PST)
X-Received: by 2002:a50:9b02:0:b0:55f:9918:dadd with SMTP id
 o2-20020a509b02000000b0055f9918daddmr272667edi.2.1707150230007; Mon, 05 Feb
 2024 08:23:50 -0800 (PST)
MIME-Version: 1.0
References: <20240202141109.1.I24277520ac754ea538c9b14578edc94e1df11b48@changeid>
 <87fry7dusz.fsf@intel.com>
In-Reply-To: <87fry7dusz.fsf@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 Feb 2024 08:23:32 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XOyMDRT9dtW_mC_yQy-38oOXugFXJdOY5pkVy7DJhAJg@mail.gmail.com>
Message-ID: <CAD=FV=XOyMDRT9dtW_mC_yQy-38oOXugFXJdOY5pkVy7DJhAJg@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: Don't attempt AUX transfers when eDP panels are
 not powered
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, eizan@chromium.org, 
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Imre Deak <imre.deak@intel.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Feb 5, 2024 at 3:17=E2=80=AFAM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> On Fri, 02 Feb 2024, Douglas Anderson <dianders@chromium.org> wrote:
> > If an eDP panel is not powered on then any attempts to talk to it over
> > the DP AUX channel will timeout. Unfortunately these attempts may be
> > quite slow. Userspace can initiate these attempts either via a
> > /dev/drm_dp_auxN device or via the created i2c device.
> >
> > Making the DP AUX drivers timeout faster is a difficult proposition.
> > In theory we could just poll the panel's HPD line in the AUX transfer
> > function and immediately return an error there. However, this is
> > easier said than done. For one thing, there's no hard requirement to
> > hook the HPD line up for eDP panels and it's OK to just delay a fixed
> > amount. For another thing, the HPD line may not be fast to probe. On
> > parade-ps8640 we need to wait for the bridge chip's firmware to boot
> > before we can get the HPD line and this is a slow process.
> >
> > The fact that the transfers are taking so long to timeout is causing
> > real problems. The open source fwupd daemon sometimes scans DP busses
> > looking for devices whose firmware need updating. If it happens to
> > scan while a panel is turned off this scan can take a long time. The
> > fwupd daemon could try to be smarter and only scan when eDP panels are
> > turned on, but we can also improve the behavior in the kernel.
> >
> > Let's let eDP panels drivers specify that a panel is turned off and
> > then modify the common AUX transfer code not to attempt a transfer in
> > this case.
>
> I guess my question is, why not make the aux->transfer function handle
> the powered down case and return the appropriate error?

The basic problem is that the aux->transfer() function doesn't have
knowledge of the power state of the eDP panel and that's the component
whose power state matters here. The aux->transfer() function is
implemented by the DP controller driver and can't access the internal
state of the eDP panel driver.

The traditional solution here would be to use the "HPD" pin to know if
the DP device is powered and ready to accept AUX commands. That works
fine for external DP devices where HPD is mandatory, but it has issues
for eDP as talked about in my commit description. If nothing else, the
eDP spec lists "HPD" as optional. In addition to that, however, we
have additional difficulties for eDP because of the "connected but not
powered on" state that eDP panels can be in. For DP if you see HPD you
know that the device is connected+powered on. If you don't see HPD
then the device is disconnected and/or powered off. For eDP you may
power off components (like the controller / eDP panel) when the device
is still physically connected and that adds complexities.

Another possible solution someone could come up with would be to use
the DRM state of the DP controller driver and fail all AUX commands if
the DP controller isn't powered. Unfortunately this doesn't work
either. Specifically at panel probe time we need to do AUX transfers
even though the full DRM bridge isn't powered. We had many discussions
about this on the mailing lists when coming up with the generic eDP
panel driver and this is fairly well documented in the kernel-docs of
the transfer() function in "struct drm_dp_aux". As documented, an eDP
controller driver needs to return an error for transfer() if the panel
isn't powered, but nothing says that it needs to do it quickly. The
slowness is what we're trying to solve here.


> For example, the transfer hook in i915 checks whether the display is
> connected and bails out early if not.

I'm not massively familiar with the i915 code, so I'd love a pointer
to the exact code you're referring to. I took a quick look and found a
Type-C specific check in intel_dp_aux_xfer(). That doesn't help here
since we're not Type-C, though the comments do back up my argument
that the long timeouts are something worth avoiding. After that I
don't see anything obvious so I'd love a pointer.


> Having to track and set the state all over the place seems more
> complicated to me than dynamically checking where needed i.e. in the
> transfer hook.

Huh. I was actually surprised by how simple/straightforward my patch
was compared to how ugly I thought it was going to be. I guess it's
just a different perspective? Specifically it can be noted that there
aren't many distinct eDP panel drivers out there since all but one of
them was able to use the generic "panel-edp.c". However, there are
quite a number of eDP controller drivers, especially considering all
the bridge chips out there. That means that this short patch means we
don't need to add weird logic/hacks to all of the eDP controller
drivers...

-Doug
