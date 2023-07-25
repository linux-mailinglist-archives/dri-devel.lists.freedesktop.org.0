Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ADF761FB1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 19:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0253410E3F2;
	Tue, 25 Jul 2023 17:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EC510E3EF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 17:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=HEYKn4NMMmasVQNcFwCa+HiHodnKGFk+SvBVj8VNFfw=;
 b=A6DQf5Av/0e8e9EBLoEAHflwSlep3BKEYaCQ8x3w8yy18fUjuqioILQ4kcrmtzIGnZSMImZqt0fQd
 Axs2ah8kn6ezQiWIRvbFdIT4NJiIMiFpYK4hiOs72oEDrkZ+EWAZaVpHfddUSZoOjFtqJDlC7A0bDE
 hXWfitYQq6BPSRl9hzdhNhsOOqBtA9SOUbj2ZQ0UN5VSPqC1sxtQp5DgU7bpjcTag54vCmPa9O+UJp
 45jGC8PgzZSLIMmYZI3VQnQCs5kLKVIN3suAtIDGfVbKp6/zS2W11KoKrvSpGuTNE5BkJ+qnhT7wGV
 +IzVsrL2O1loZCqU2Z7Vp5lGtRuhtyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=HEYKn4NMMmasVQNcFwCa+HiHodnKGFk+SvBVj8VNFfw=;
 b=uh0ldvFXcrw7PKCrKzTWVanDCUzmOkVysrpJQxgzGrITYOjs6QsEC3OQYjLhhQ5wH1lioJT7lDnzL
 L8AZXoNCA==
X-HalOne-ID: f087e3ad-2b0c-11ee-9e67-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id f087e3ad-2b0c-11ee-9e67-99461c6a3fe8;
 Tue, 25 Jul 2023 17:01:49 +0000 (UTC)
Date: Tue, 25 Jul 2023 19:01:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Subject: Re: [PATCH v6 1/3] drm/panel: Fix IS_ERR() vs NULL check in
 nt35950_probe()
Message-ID: <20230725170147.GB838289@ravnborg.org>
References: <20230725013957.1237590-1-cuigaosheng1@huawei.com>
 <20230725013957.1237590-2-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725013957.1237590-2-cuigaosheng1@huawei.com>
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
Cc: neil.armstrong@linaro.org, quic_eberman@quicinc.com, quic_gurus@quicinc.com,
 sean@poorly.run, linux-arm-msm@vger.kernel.org, a39.skl@gmail.com,
 liviu.dudau@arm.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, james.qian.wang@arm.com,
 angelogioacchino.delregno@somainline.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 25, 2023 at 09:39:55AM +0800, Gaosheng Cui wrote:
> The mipi_dsi_device_register_full() returns an ERR_PTR() on failure,
> we should use IS_ERR() to check the return value.
> 
> By the way, use dev_err_probe instead of dev_err to print the error code.
> 
> Fixes: 623a3531e9cf ("drm/panel: Add driver for Novatek NT35950 DSI DriverIC panels")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

Looks good, thanks for the update.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
