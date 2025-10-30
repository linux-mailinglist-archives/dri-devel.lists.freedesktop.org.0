Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F4AC21382
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 17:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E217010E296;
	Thu, 30 Oct 2025 16:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y1tv4rfk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2129610E296
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:35:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 490AC60207;
 Thu, 30 Oct 2025 16:35:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBEE6C4CEF1;
 Thu, 30 Oct 2025 16:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761842156;
 bh=CfnYUWF6HP6k/DFvfFErDlrFLZvLTOj+ynI24ImztDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y1tv4rfkEtG/H8aTguT6cQ9sYYapqEvRcduBQmIkAPSiriNlROWulWjQNirQWZQXk
 6st8s+bvdYw/u8GqRBtcSAIO/eSlRrp1D71FHF61CLdn5Npif5GOj77gNASf/BgJbW
 PamGKSJeZznZi3djmxUwdAnD+Bm9kYOPreFObhdPJZawlwvrxKVbdVOoGyOE9LEd5n
 k8W5+FHRluzZBY2r3An52q6zXKKG9c1nSOc66vwHt2UUDBbR0z8gV1lSUuimcAnGlc
 /7BTPfMjrLkEjga5dioUWGP4WUfn9yUPOw3aEeWwjCZfHJrDGOuahw3RdGiItGSNb2
 tzYCLG2bkAY3Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vEVd5-0000000048K-2wdE;
 Thu, 30 Oct 2025 17:36:03 +0100
Date: Thu, 30 Oct 2025 17:36:03 +0100
From: Johan Hovold <johan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/imx/tve: fix probe device leak
Message-ID: <aQOT8zD1hsK4SJ_c@hovoldconsulting.com>
References: <20250923151346.17512-1-johan@kernel.org>
 <89a86fc1c48f921aa3b06146f43a32dc58515548.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89a86fc1c48f921aa3b06146f43a32dc58515548.camel@pengutronix.de>
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

On Thu, Oct 30, 2025 at 04:27:39PM +0100, Philipp Zabel wrote:
> On Di, 2025-09-23 at 17:13 +0200, Johan Hovold wrote:

> >  static int imx_tve_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > @@ -546,6 +553,11 @@ static int imx_tve_probe(struct platform_device *pdev)
> >  	if (ddc_node) {
> >  		tve->ddc = of_find_i2c_adapter_by_node(ddc_node);
> >  		of_node_put(ddc_node);
> > +
> > +		ret = devm_add_action_or_reset(dev, imx_tve_put_device,
> > +					       &tve->ddc->dev);
> 
> I think this needs to be wrapped in "if (tve->ddc) { }",
> of_find_i2c_adapter_by_node() can return NULL.

Indeed, thanks for catching that. Just sent a v2.

Johan
