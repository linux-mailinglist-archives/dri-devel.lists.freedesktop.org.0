Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBBE16A968
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 16:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C5D6E52D;
	Mon, 24 Feb 2020 15:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 66B936E52D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 15:06:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD3641FB;
 Mon, 24 Feb 2020 07:06:14 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF20F3F534;
 Mon, 24 Feb 2020 07:06:12 -0800 (PST)
Subject: Re: [PATCH 3/3] drm/panel: add panel driver for Elida KD35T133 panels
To: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org
References: <20200223150711.194482-1-heiko@sntech.de>
 <20200223150711.194482-3-heiko@sntech.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <ec42b04a-4727-cbd4-d0c4-21a8def8abd0@arm.com>
Date: Mon, 24 Feb 2020 15:06:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200223150711.194482-3-heiko@sntech.de>
Content-Language: en-GB
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>, robh+dt@kernel.org,
 linux-rockchip@lists.infradead.org, thierry.reding@gmail.com, sam@ravnborg.org,
 christoph.muellner@theobroma-systems.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/02/2020 3:07 pm, Heiko Stuebner wrote:
[...]
> +#define dsi_generic_write_seq(dsi, cmd, seq...) do {			\
> +		static const u8 d[] = { seq };				\
> +		int ret;						\
> +		ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));	\

Nit: in the rocktech driver, dsi_generic_write_seq() is wrapping 
mipi_dsi_generic_write() which seems logically self-consistent. 
Therefore shouldn't this wrapper be called something like 
dsi_dcs_write_seq()? I have no idea what any of this actually means, but 
the dissonance is enough to make my reviewer-sense tingle ;)

Robin.

> +		if (ret < 0)						\
> +			return ret;					\
> +	} while (0)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
