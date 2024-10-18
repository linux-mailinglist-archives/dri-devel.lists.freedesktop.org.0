Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FDE9A3AEC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 12:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F5B10E35C;
	Fri, 18 Oct 2024 10:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OkNB9Re5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D31D88F78
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 10:08:51 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2fb3ce15172so28298341fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 03:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729246129; x=1729850929; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qk9WTW9hJ0HLpI2frlqV2574MIbcC9FM2Cyz3zKihm8=;
 b=OkNB9Re5ObZABrPXOc55g6tsyFz90YHoKPj460AnwgWulYpxa4yegGuMGZXs85Sosr
 gGBCxLTR/v6icRKvdka9eoVZx7zsb5W8dL/s0cqbwIDOIyx1RY6XSztx7BuUlK6BKXJY
 d9jrc7cb1ih6rpVApksT2OlksMmMaTNKwzFVgJhYJQLYFKm/l1uw4WMrHFSTacbrhq42
 RQGT3bW3w/3R0rSUs2OJG0bFw7wrTfA3gArImgS1opUKzhPDSYe4R/GSPVIlFUxzs3Fs
 CJaWXs1eZCGjuxXjxF1FtMe41+sE5fty1BgR0RFJQx6e7+RalLzZzj1+YxTps5dVrUVQ
 j2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729246129; x=1729850929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qk9WTW9hJ0HLpI2frlqV2574MIbcC9FM2Cyz3zKihm8=;
 b=MAE+1d7eo4HfqFVjLoefk/tfm1NM2khzkxnSJZ18BJA+8RPaOSzBu3XvAeDWbgGNUM
 VMrPiHVIOi55DvHdfn8xdmCCKXrjWJrtU6BhPe8qybTxE5iI2DLtTNayM8rgqHSQDnkQ
 e7BVFSByHdpIKL4qjtRh2ju2xYXDr9czzAdW5aAAwCaYBPKQJpR+lrN4bB9C7dwKfpeB
 n0uZqCyMIb3zY4dfDU2T8oeXxt/wpYrGepenD733W9q+CuA2UmOflLqIt/eI0pEIBaT5
 CT6NEN7AQAcFIeAde0ZZN5mIAupVGi8xSUGEhDXWmp2xz+ASuVwauYo+j5V6RXNptXEG
 pR/Q==
X-Gm-Message-State: AOJu0Yyq5BwS24nHcwyn4SstTXgvY3IAkEIOMYWJbPUrxaF98lGKHm6N
 U9UcBV+6sZmX5at9p2+mQ2We36LV+yK/3svsOnvpr/O2d9JU1bShLzsd/ZBLb6y/FNXsarUAx9h
 VqLg=
X-Google-Smtp-Source: AGHT+IF5BdtYgj8eLuIeP4n7uW2ZtO7LlEmm7Isl+ir5rs31M8lPn9H8E0qea2dNKu8q0aBrINVKoA==
X-Received: by 2002:a2e:bcc1:0:b0:2fb:5ebe:ed69 with SMTP id
 38308e7fff4ca-2fb6d9cfa6emr24964591fa.6.1729246129451; 
 Fri, 18 Oct 2024 03:08:49 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb809a6cadsm1832361fa.13.2024.10.18.03.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 03:08:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Doug Anderson <dianders@chromium.org>, YueHaibing <yuehaibing@huawei.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v3] drm/display: Drop obsolete dependency on COMPILE_TEST
Date: Fri, 18 Oct 2024 13:08:46 +0300
Message-ID: <172924610467.2547396.14111365804696461882.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015134606.5b87093e@endymion.delvare>
References: <20241015134606.5b87093e@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 15 Oct 2024 13:46:06 +0200, Jean Delvare wrote:
> Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> is possible to test-build any driver which depends on OF on any
> architecture by explicitly selecting OF. Therefore depending on
> COMPILE_TEST as an alternative is no longer needed.
> 
> To avoid reintroducing the randconfig bug originally fixed by commit
> 876271118aa4 ("drm/display: Fix build error without CONFIG_OF"),
> DRM_MSM which selects DRM_DISPLAY_DP_HELPER must explicitly depend
> on OF. This is consistent with what all other DRM drivers are doing.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/display: Drop obsolete dependency on COMPILE_TEST
      commit: 2063ca42486bc07b49bc145b5dfcb421f4deebaf

Best regards,
-- 
With best wishes
Dmitry

