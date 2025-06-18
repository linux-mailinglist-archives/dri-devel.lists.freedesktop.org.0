Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A28ADF5A7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 20:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2AF10E1DE;
	Wed, 18 Jun 2025 18:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oUupRg4C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3A910E1DE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 18:19:04 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-73a44512c8aso4667a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 11:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750270743; x=1750875543; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Vep4PV2pZ+9tPEurvQr9lDJXe4H1SpULEo3WQUGiLXg=;
 b=oUupRg4CwdC5xEe7YnEV4tgs2zwM9s+xzJDFDFctXIMleybu4W+AJK7bNTwlQGVVAl
 Pfi5z/hZc6gqVb6o7e4BGSEk3DqK5M4rrHlnlVNKKlI4Vp1PjFJOvpWz7Y4jAXqVCjV3
 fv81nn3NikAEL5oHzzmy+KMY/s//IjBlICPWI1vbCtDNfU5xX+U51ZJbSwezJbCQDpwC
 6yPDZnoB5RHoXzsfnFuIZFguEmSVgUD/nvpfWQPfjWboO3naEqgedG8TVHg+LJ6tNbu5
 +vnffzre/RuE8+10pVOLSauWQpwdWcIqKI0U+FA7ux7G7Ysvct5f90nOSTb0/tmroTso
 TPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750270743; x=1750875543;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vep4PV2pZ+9tPEurvQr9lDJXe4H1SpULEo3WQUGiLXg=;
 b=Pb7gyxENDbwQ3iiUwVY7kiuyE7Fb792fLaB9yEFr4w8Xf2vcGNA6ZVscmdmFCFQyll
 RuCZQbZj1GWheedPm1GWX3OvW95knIo+DPf3XRaMkwlb02mHnFVNpGTniWqXHjKHff3G
 YYnfHKYOXwiwjIuYUaR1WEHCZPJ1f8KHzDe5xS4s3soFlEEfD4VGPJBf55YY0KeLIEXH
 9cMYQjEebJzpTitYiLja67neZCR8yXFOWmeS+qkMBFP4LJLctvMfd+XkrHm8EU24yIzL
 s+eMyZqtRl/sqGEhlhx8kkDsCfb2O7avZt89S71kmpfmEc/R82RKDlzwCSSrbV5rlTTO
 v0dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbA+mVsn5LDtX48Yz4igR5Pbp+xdT0Bym/k+x1wc1wEITuU+yZ7DGFqlaztuLugWWRhhimLy9779I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydM8gjn88HR3QQv+diOsvvpLT1PNiEjMDXbdoXshno9hAW5qEP
 mMkZAIHiOCYpna4ChIa8dsoT8iT+1zedSdky7eqdcP7ha/de9sXz/gJMUsggKDN0reU=
X-Gm-Gg: ASbGncuWlSM91PPkoJBu2nLXlzoEBCncGGniIKZyeSEUTiwYSFBIwiLoYeEuYJABKvk
 42bV5Wo71Ik6brBJOhtg/xE+5O5/0CItdYhv77OoVanrKqwZRr/cAmivFtLhp/GShU0+OKMSLsf
 MMS6kxsjCsz4KxDXwqerZNEP1qyq0AV3vXXuNWGoR88gqD5zJNW4xvrFkRQncAsdeDdIts4LGs/
 6FNnVorr+9ufiWYS55Du+TgBVUA3GrLnVzJS8y0rQe9aJkt8qTY5PgbqWBw8TYVdL9kI1ZiqY5B
 GNXHLs6yXNfr9OP2gozARR6ewW0SPAILTvK+fwBjo5ctRNvPKDblBbF9i1rly8CUiJqBFA==
X-Google-Smtp-Source: AGHT+IFKnX0nztNeiuWkt0W77J0j5V4cIVncVTmr2DaNrpLni49egH0ASp6YufKpwNA2PVb7YBrY6Q==
X-Received: by 2002:a05:6830:6f42:b0:72c:320b:f827 with SMTP id
 46e09a7af769-73a3626800cmr11319258a34.6.1750270743621; 
 Wed, 18 Jun 2025 11:19:03 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-73a28403dc8sm2055669a34.27.2025.06.18.11.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 11:19:02 -0700 (PDT)
Date: Wed, 18 Jun 2025 21:19:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Melissa Wen <mwen@igalia.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Alex Hung <alex.hung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Roman Li <roman.li@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Tom Chung <chiahsuan.chung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev, cocci@inria.fr
Subject: Re: [PATCH v3] drm/amd/display: Fix exception handling in
 dm_validate_stream_and_context()
Message-ID: <7ae66816-f682-45f1-b848-eeb5a57a68d9@suswa.mountain>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <e6656c83-ee7a-a253-2028-109138779c94@web.de>
 <ea0ff67b-3665-db82-9792-67a633ba07f5@web.de>
 <32674bac-92c2-8fc7-0977-6d2d81b3257f@amd.com>
 <da489521-7786-4716-8fb8-d79b3c08d93c@web.de>
 <8684e2ba-b644-44c8-adf7-9f1423a1251d@web.de>
 <5ebybqjohsoz7qhsenufkpkkw52w6tgikkbrzpegwotmefhnpn@m2cnzvsfai7v>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ebybqjohsoz7qhsenufkpkkw52w6tgikkbrzpegwotmefhnpn@m2cnzvsfai7v>
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

On Thu, Jun 12, 2025 at 11:08:10AM -0300, Melissa Wen wrote:
> On 06/10, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Tue, 10 Jun 2025 07:42:40 +0200
> > 
> > The label “cleanup” was used to jump to another pointer check despite of
> > the detail in the implementation of the function “dm_validate_stream_and_context”
> > that it was determined already that corresponding variables contained
> > still null pointers.
> > 
> > 1. Thus return directly if
> >    * a null pointer was passed for the function parameter “stream”
> >      or
> >    * a call of the function “dc_create_plane_state” failed.
> > 
> > 2. Use a more appropriate label instead.
> > 
> > 3. Delete two questionable checks.
> > 
> > 4. Omit extra initialisations (for the variables “dc_state” and “dc_plane_state”)
> >    which became unnecessary with this refactoring.
> > 
> > 
> > This issue was detected by using the Coccinelle software.
> > 
> 
> Hi Markus,
> 
> Thanks for working on this improvement.
> Overall, LGTM. Some nits below.
> 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202506100312.Ms4XgAzW-lkp@intel.com/
> 
> As the patch wasn't merged yet, don't add these two kernel-bot-related lines.
> 
> You only need to add these lines "If you fix the issue in a separate
> patch/commit (i.e. not just a new version of the same patch/commit)"
> 

If you're going to fold the fix into the original commit then it
doesn't matter what the commit message says since it will be gone
in the end either way.

regards,
dan carpenter

