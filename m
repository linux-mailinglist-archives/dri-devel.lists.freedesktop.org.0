Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB15186766
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 10:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8296C6E394;
	Mon, 16 Mar 2020 09:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190A76E394
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 09:05:51 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z13so646060wml.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 02:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oPCmoFFrKYp/3bnxyKnj8h+h5zDtfc4YHiEF5mCDEio=;
 b=LIPE1DcKRpwkYjXJp80rvX4cAGU9/MqM+wTuQYV2XeQccBuMGwVzzfZMZdV/0rX1IZ
 Qm2RN3iS7Yuckhw6qzXj/iqokqk2MrfBMwZ4WG557zzePMrkvnw1RPdyb39kwxL4pcqS
 omtTjtr2Rac877d8r0u0J5P8Seq2so58aAmX+2bVVqqgFMGzD8zsdGVsCqreVi5BhH5S
 HZayX/je+fFEPKPZ9R760tKGgYKGMaqNtEzbs7KAhpkXDi4LKCBsW3em1iDTIgYLdlI+
 P2Ms3vB8YII8kY+fqGTwq984TRkifByilceEOHZijm5BCrU0LY1UgXzzohk0DxVmyn8A
 QmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oPCmoFFrKYp/3bnxyKnj8h+h5zDtfc4YHiEF5mCDEio=;
 b=Eh1TsgsEaj/KjJl1rnmUIEmsnzwAKiqsyPnO1F9RXsEnYN78Z6nzInmvKDa+Dr61e8
 +ETkDz0+uMpMb0Hn7DRG0/zdhi7tJfMCk/FYISMXc7VZOn3Yk8J7QUNY4iGGEDq6VsJQ
 pqhuTYZE7mrY4IdoncIr3mBIxE0RBv6nLnIQMeO+XPYmWCw7r446Wussz24rC/F7Q0Zu
 GPvhbK/S3IEjNrz/rLCFpYTZRlSWeO4ZBMgnDUdR+3oL04RwzFtmYnSRtiM+cfQ+bwfu
 yypKBAZgO02bQQ2YoCBk4gx4LfNMWh/vwoCeX7p6PH6fFlj75z6vhNOcynLH5m6LneyE
 izBQ==
X-Gm-Message-State: ANhLgQ0Bd4FrxP7wRxr3YYfZrDjPUvBTRD6MbSDjzba78CAIQE4XArJf
 WY8pd/aOBro0FB/eHjtRk+6erA==
X-Google-Smtp-Source: ADFU+vtTbJN2j0t0MmV90WL70+p4V0kNL8o0e+BtASxYEDGFH4cHMmfu00aobz2Hxf/DkXDDo8qxYA==
X-Received: by 2002:a1c:1f0c:: with SMTP id f12mr26641787wmf.179.1584349549730; 
 Mon, 16 Mar 2020 02:05:49 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id f9sm13603031wro.47.2020.03.16.02.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 02:05:48 -0700 (PDT)
Date: Mon, 16 Mar 2020 09:05:46 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] backlight: lp855x: Ensure regulators are disabled on
 probe failure
Message-ID: <20200316090546.5eufi423ahstz6v3@holly.lan>
References: <20200224140748.2182-1-jonathanh@nvidia.com>
 <20200224143732.rreev3ypou26hvx3@holly.lan>
 <6ec74817-968b-ab5e-6566-56bbb9b67599@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ec74817-968b-ab5e-6566-56bbb9b67599@nvidia.com>
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
Cc: Milo Kim <milo.kim@ti.com>, Jingoo Han <jingoohan1@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 13, 2020 at 02:16:16PM +0000, Jon Hunter wrote:
> Hi Lee, Daniel,
> 
> On 24/02/2020 14:37, Daniel Thompson wrote:
> > On Mon, Feb 24, 2020 at 02:07:48PM +0000, Jon Hunter wrote:
> >> If probing the LP885x backlight fails after the regulators have been
> >> enabled, then the following warning is seen when releasing the
> >> regulators ...
> >>
> >>  WARNING: CPU: 1 PID: 289 at drivers/regulator/core.c:2051 _regulator_put.part.28+0x158/0x160
> >>  Modules linked in: tegra_xudc lp855x_bl(+) host1x pwm_tegra ip_tables x_tables ipv6 nf_defrag_ipv6
> >>  CPU: 1 PID: 289 Comm: systemd-udevd Not tainted 5.6.0-rc2-next-20200224 #1
> >>  Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
> >>
> >>  ...
> >>
> >> Fix this by ensuring that the regulators are disabled, if enabled, on
> >> probe failure.
> >>
> >> Finally, ensure that the vddio regulator is disabled in the driver
> >> remove handler.
> >>
> >> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > 
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> I received a bounce from Milo's email and so I am not sure that his
> email address is still valid.
> 
> Can either of you pick this up?

Lee generally starts to hoover up patches about this stage in the dev
cycle so I'd expect this to move fairly soon.


> Not sure if we should update the MAINTAINERS as well?

Sounds like a good plan, yes.


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
