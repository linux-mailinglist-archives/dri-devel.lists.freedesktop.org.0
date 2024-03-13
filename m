Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889F787AE8A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 19:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868AF10F832;
	Wed, 13 Mar 2024 18:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="jHylGeIv";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="jhFCSZBv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [46.30.211.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE11010F832
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 18:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=4rlXTwAFyuTm9avHYsJU7aqjVe3TlVfEuupS9PnmcmI=;
 b=jHylGeIvg1EqZg33U1cBL0AE4k6y3QBTOqlL04mnFXMsdMPrmRypJ2ydnguQJZ5cVsBi07MpCm49C
 vFXkQia1PI1i0AzXy3FCghpUTL52SGjWJroWEO6LGERZ+1XiYPiQzjo+P/LzO4p40QBCfQcXkco//P
 nWbAyMv3eeobvANOKOspRpgGWAST/3LgjAfDotbDxUwjXfzDlWn1eXNsiO0l58c9OXQwdzKk3eh6AX
 DnCwDDKaloa8RLGc4G5RvjyWDWwyIewhM8An36V5n7kndjcMqFSy0mes88nxcXqAkIuKQeY9c0MBBb
 NjRFiEQMbyCu2UgPSyz299220Ut/oPg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=4rlXTwAFyuTm9avHYsJU7aqjVe3TlVfEuupS9PnmcmI=;
 b=jhFCSZBvgXRzc76qH36LZTh0Bd7D1jojW03Yfd7T10v468cP+qf4PA2CnqUjWcTavOaKfYKH3IV3E
 VDj1ZZjDg==
X-HalOne-ID: 927d3bf4-e163-11ee-8bee-119507214a65
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id 927d3bf4-e163-11ee-8bee-119507214a65;
 Wed, 13 Mar 2024 18:00:28 +0000 (UTC)
Date: Wed, 13 Mar 2024 19:00:27 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 3/6] backlight/omap1-bl: Replace FB_BLANK_ states with
 simple on/off
Message-ID: <20240313180027.GB96726@ravnborg.org>
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313154857.12949-4-tzimmermann@suse.de>
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

Hi Thomas,

On Wed, Mar 13, 2024 at 04:45:02PM +0100, Thomas Zimmermann wrote:
> The backlight is on for fb_blank eq FB_BLANK_UNBLANK, or off for
> any other value in fb_blank. But the field fb_blank in struct
> backlight_properties is deprecated and should not be used any
> longer.
> 
> Replace the test for fb_blank in omap's backlight code with a
> simple boolean parameter and push the test into the update_status
> helper. Instead of reading fb_blank directly, decode the backlight
> device's status with backlight_is_blank().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

My biased opinion is that the approach in this patch is a little bit
better:
https://lore.kernel.org/lkml/20230107-sam-video-backlight-drop-fb_blank-v1-13-1bd9bafb351f@ravnborg.org/

I never came around resending this series it seems.

	Sam
