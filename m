Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC588CD01F
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 12:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8F110E79A;
	Thu, 23 May 2024 10:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YAKsAwEE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBB710E79A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 10:17:25 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-51f4d2676d1so7575245e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 03:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716459443; x=1717064243; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=80bP7y7qA9MMuEwQlAA7CumJ5PPSgBtdUbjEPN31H7U=;
 b=YAKsAwEEeFgCd18GAjE07gApPNHtbM5qBscYKoAxYvi0um7bjnGWxbckTaavnXPMIG
 y0Lvv0m+qrR0EAqxs4OzLcq91ob9Ip17D2/VbmissXBnTZJ39c+UNRZlzUTjYMiOR9da
 RP1kGTQeztMywlg0b3AhNkY8fbC0566MWophxWd2EquMhhr/8bX/ToM04zgQGUgT3frz
 BXkc8MOfpRuMPjn3L0PkKLJ98Tnw220uljh/uvIulDV8SXHC/DXGRI012+ijzq6NOGZM
 YZ89uAUNw/oRboemhbxXZuNNfbUsPKDUx1I3gt2W7THD/5prqWPnP77wjXjxH6lh3DqU
 H6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716459443; x=1717064243;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=80bP7y7qA9MMuEwQlAA7CumJ5PPSgBtdUbjEPN31H7U=;
 b=QnH2Fg5pd6olHoelfGgm/QJwnvavfFkpoEWUxiQ5LLCPYEzap2FTFb3aTLSSVJDJZp
 /YcEVxDEwtAsObACdOLeIHQEMjaozEB7E9dJkiN7FjQtbyVtE4DCBg0rCW+ntIBS8BE7
 OUe0YUleDLk3fhsjYclidOxF3Sj4XBevIZJhmG1JFUszMz97l4Kp0Ltlmr1k319wz5nh
 x9j888UeOqUqKtFeidmEEwlSwAa9DTBfkSETUSW+ADvwCPkb9vuDEHrl00QKp4lreTqV
 +xOLZIJOUaqqtNUPogHKWx0fin9a4ScU6MS0+9V32PDFrAr1oQraTU89PTkpXYACJpxK
 hz7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV91+SS0QrU247eYoCF1f/P9ThoaQQWL3lKy6jWw4uEuQmwe+ZdbTPzvQPEaB91P9qXFYL07TZmA/7u7RaQqRdQecJfBhRwZJ+Cc3AoXY9
X-Gm-Message-State: AOJu0YwQ24Hj0whNJkwjjZ8pn5/T16CxlZ2piOqpr+CTxC87n36gay4e
 SqAaWtuSbm7u8dv8/wreQnKtdsN/0p+1vJynZ/0FY8AwLZAfT5Wi4S9ehkDa7Ys=
X-Google-Smtp-Source: AGHT+IHf7awBjw/9D/TT+Rgq+OAeb8dHAhP0xUpM418Uxoc/FOiPxZ31oJO7H7MbUzlhcOAfgCiNgA==
X-Received: by 2002:a19:f618:0:b0:523:89b0:b03f with SMTP id
 2adb3069b0e04-526bf35ccf2mr2563834e87.28.1716459443132; 
 Thu, 23 May 2024 03:17:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52812cf2e1bsm215911e87.254.2024.05.23.03.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 03:17:22 -0700 (PDT)
Date: Thu, 23 May 2024 13:17:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v14 16/28] drm/tests: Add HDMI connector bpc and format
 tests
Message-ID: <7xvmyypalx7letzlyxoootpc2e7io5f2no3pu7jnmh36m4su44@6sewdztpjqfz>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-16-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-16-51950db4fedb@kernel.org>
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

On Tue, May 21, 2024 at 12:13:49PM +0200, Maxime Ripard wrote:
> The previous patch added the bpc and format an HDMI connector needs to
> be set up with for a given connector state.
> 
> Let's add a few tests to make sure it works as expected.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 509 +++++++++++++++++++++
>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 160 +++++++
>  2 files changed, 669 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
