Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95317ABB62F
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 09:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C8210E205;
	Mon, 19 May 2025 07:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="phek9eAa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0F610E205
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 07:32:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7B2075C3A5B;
 Mon, 19 May 2025 07:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A0DC4CEE4;
 Mon, 19 May 2025 07:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747639933;
 bh=9KcIlxiyFV6HmPWWWgrjFCEfEvyEUAzr3hGhU7xi/+0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=phek9eAa05F0CFybSrZ8B9zO47AcbdY+ip5nD6Bek6gv1D2wOn20L+qPl84W09/66
 jNaqih8tQXCYpBBfGP09n2JKsKozwj0A0PaHq6K1/cXO1ZRWa0No7OEwy+77L6LCZZ
 QApkxp9/Ybcd8WpZhgPM+WudPyNl1jI44Ohz+aExJ/j5umPH2FvFcP9f74hdJVEZpq
 9HdA71m/1bgqP9Ib3+NOpWeamTeROSy0LPajHEoTUT5pR1rPPwp5u6+3q5L1GAjI3b
 i/2fztJ+8yHQHD2LPh6nmFFtbBpqdIsEn6rg3E7pJXXAHszwqY2Og3hNLHVMLyZi5K
 u3xrXZHpH7kgA==
Message-ID: <6048aa6f748b965571ea6125eedc6ffc@kernel.org>
Date: Mon, 19 May 2025 07:32:10 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 07/10] drm/vc4: hdmi: switch to generic CEC helpers
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-7-35651db6f19b@oss.qualcomm.com>
References: <20250517-drm-hdmi-connector-cec-v6-7-35651db6f19b@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>,
 "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Sat, 17 May 2025 04:59:43 +0300, Dmitry Baryshkov wrote:
> Switch VC4 driver to using CEC helpers code, simplifying hotplug and
> registration / cleanup. The existing vc4_hdmi_cec_release() is kept for
> now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
