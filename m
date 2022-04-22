Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC2250BFDA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 20:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF3110E4A1;
	Fri, 22 Apr 2022 18:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0044B10E4A1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 18:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=tUVpDACuiG6bGhSbjQ5O94zigOp+XNHT2DBRA2rQsm0=;
 b=El5FsW26uSMCJ0BNcgF8K2OBcNTaBJq/fNYsOsuvKoSmsUI/1IjSQ9ZuHbSLaZqwHnJOXieGtP1KH
 55DFg3nSXYbbeN20KItbBIxHcUuegzlsuPfOh7P4WhVpZeVw32N2YzrRoXySYbT19Uf4VGWZnJqYwj
 Dku2EC+1H4F1iOEk2vz3DQRwUpYqV5ifHdXtYcM4ZPsUsWNT35lX5thy+Oyx6SbBEyVMuInq7Q6snU
 92zgXxHr+8KlWm1mxuZUK9QMXe5qTiOWAcNtSqMwF6tOXi4K9wkuwljNQy6EdGNxaSvvdon6NSj0KW
 WvbnKxTew04xxxsSjZSdKvTK7SNse4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=tUVpDACuiG6bGhSbjQ5O94zigOp+XNHT2DBRA2rQsm0=;
 b=4BK3MLkY8SdlfUi9SaUp25KeM6ExN8ZfBr7uw+29gfJWmCgRG5L0pdi6gDZcGgGKr2psRiQ0ZhG6+
 86KEM1BDQ==
X-HalOne-Cookie: 85fcbaf0d7696de5863fc93c3838a47c74d7612e
X-HalOne-ID: 3d57447a-c26b-11ec-8225-d0431ea8bb10
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 3d57447a-c26b-11ec-8225-d0431ea8bb10;
 Fri, 22 Apr 2022 18:37:19 +0000 (UTC)
Date: Fri, 22 Apr 2022 20:37:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v3 4/4] drm: mxsfb: Reorder mxsfb_crtc_mode_set_nofb()
Message-ID: <YmL13Y2NZBl34hJh@ravnborg.org>
References: <20220417020800.336675-1-marex@denx.de>
 <20220417020800.336675-4-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220417020800.336675-4-marex@denx.de>
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 17, 2022 at 04:08:00AM +0200, Marek Vasut wrote:
> Reorder mxsfb_crtc_mode_set_nofb() such that all functions which perform
> register IO are called from one single location in this function. This is
> a clean up. No functional change.
> 
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
