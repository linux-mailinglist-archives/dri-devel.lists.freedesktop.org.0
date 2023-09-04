Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A89791ACF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 17:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA4710E388;
	Mon,  4 Sep 2023 15:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9865510E388;
 Mon,  4 Sep 2023 15:44:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6DBE4B80BE6;
 Mon,  4 Sep 2023 15:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FDFC433C8;
 Mon,  4 Sep 2023 15:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693842265;
 bh=qdTA8V0KXUZLUrgT6HNemfUGewlGYuqtThrUKMyrcZ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dH13EUrJ64qj61MXG8wG386P+QT4XaAFmRFAw2/w72eMe0857orK3vQj6JAk6cgVn
 iJPLJFgL4Xi2O2SNHeIBZpMEIWf4FuRG3eNTendu87z3KgGSqv9O8Xgvzm8PGCWnza
 H4LOYfFM8wDC1Gx6gyv2CLr/GHaVHs5C72QJc28/WX0sK+r7ChVixP1RvWUSyzHQUR
 1OnGvXh+m8TFv2dKEJ+GqWDrV/0kR0v9oG0AIVXpdl1T3EesqgAxQ/qiYHwwlKMqA0
 Bg3WOp7I6xyGVbCc6xi+MYgY1igO4ezDYIoR+KdjLtiT/IAIgZP1ObXexiiQuvWyAw
 HpNYGylUAzweg==
Date: Mon, 4 Sep 2023 08:46:40 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH v1 00/12] drm,usb/typec: uABI for USB-C DisplayPort
 connectors
Message-ID: <tsvdc6jm7rtnqjcygn7lhzspheomqbwjejoastr7kcfs22btdr@gy2s57cuwsxy>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 04, 2023 at 12:41:38AM +0300, Dmitry Baryshkov wrote:
> During the discussion regarding DisplayPort wrapped in the USB-C
> connectors (via the USB-C altmode) it was pointed out that currently
> there is no good way to let userspace know if the DRM connector in
> question is the 'native' DP connector or if it is the USB-C connector.
> 
> An attempt to use DRM_MODE_CONNECTOR_USB for such connectors was
> declined, as existing DP drivers (i915, AMD) use
> DRM_MODE_CONNECTOR_DisplayPort. New drivers should behave in the same
> way.
> 

Sorry, didn't see the commit message before posting my complaint about
USB -> DisplayPort.

> An attempt to use subconnector property was also declined. It is defined
> to the type of the DP dongle connector rather than the host connector.
> 
> This attempt targets reusing the connector's PATH property. Currently
> this property is only used for the DP MST connectors. This patchset
> reuses it to point out to the corresponding registered typec port
> device.
> 

Still interested in understanding how the path string should look like.

Is the path expected to be consumed by machine, or is it only there for
human convenience?

Regards,
Bjorn
