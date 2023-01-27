Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E306067EC87
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 18:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A0910E11A;
	Fri, 27 Jan 2023 17:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7A710E11A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 17:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=3c3PSAeAVS44hPgNdwEqNOZLOf+JgUO0UlF9QWeiCn4=;
 b=WHqgcCH9V8CvGGVIxavfbPOdwm4QA3894vFUnPXY0TgxjZEFhcCS8VaXg2QAheoD7PrkTs1rSFWrU
 VNM4VF5Z6bHirvHCRcm3WqcSupGUyNBXo2NgbbFArKIcLI8xy8sWocSF+uN4OC5mal3FuEm300Hqyo
 kZ1SoniLLq2yK6QoIlwzFXv0lJAZApX1rKRHJ9VS7wQpvCetzC88nT1hyG5NQbL/Ih6CMcFgVY53tx
 rr/hCiDMvxgrf8M9rE/Ud81NjzCdzOMXs3Nwf4fjxyE8aMD9szbV2EGenW6M5LY4PbCu2P+bAUsxNB
 RmG+6pzao5Eb9qQO8UVJR2w3OMy3pbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=3c3PSAeAVS44hPgNdwEqNOZLOf+JgUO0UlF9QWeiCn4=;
 b=E465coUFu3DysWYGV/GEsYK/S36FRsGdBEysns+r/qoNqP9g5mz7ipRH5TuyIE0713LQkX+EbBd2l
 QQYV3RaCg==
X-HalOne-ID: a9381d42-9e68-11ed-8608-11abd97b9443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id a9381d42-9e68-11ed-8608-11abd97b9443;
 Fri, 27 Jan 2023 17:33:08 +0000 (UTC)
Date: Fri, 27 Jan 2023 18:33:07 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 01/10] drm/client: Test for connectors before sending
 hotplug event
Message-ID: <Y9QK09hRM8tR1Du+@ravnborg.org>
References: <20230125200415.14123-1-tzimmermann@suse.de>
 <20230125200415.14123-2-tzimmermann@suse.de>
 <Y9GWfi4EiCDPa6BJ@ravnborg.org>
 <bf1aa950-3b58-3e33-4849-2ee7fbefcfcc@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf1aa950-3b58-3e33-4849-2ee7fbefcfcc@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 27, 2023 at 03:13:50PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.01.23 um 21:52 schrieb Sam Ravnborg:
> > Hi Thomas,
> > 
> > On Wed, Jan 25, 2023 at 09:04:06PM +0100, Thomas Zimmermann wrote:
> > > Test for connectors in the client code and remove a similar test
> > > from the generic fbdev emulation. Do nothing if the test fails.
> > > Not having connectors indicates a driver bug.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > > ---
> > >   drivers/gpu/drm/drm_client.c        | 5 +++++
> > >   drivers/gpu/drm/drm_fbdev_generic.c | 5 -----
> > >   2 files changed, 5 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> > > index 262ec64d4397..09ac191c202d 100644
> > > --- a/drivers/gpu/drm/drm_client.c
> > > +++ b/drivers/gpu/drm/drm_client.c
> > > @@ -198,6 +198,11 @@ void drm_client_dev_hotplug(struct drm_device *dev)
> > >   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
> > >   		return;
> > > +	if (!dev->mode_config.num_connector) {
> > > +		drm_dbg_kms(dev, "No connectors found, will not send hotplug events!\n");
> > > +		return;
> > This deserves a more visible logging - if a driver fails here it would
> > be good to spot it in the normal kernel log.
> > drm_info or drm_notice?
> 
> But is that really noteworthy? AFAIK, this situation can legally happen. So
> if it's expected, why should we print a message about it?
I was reading it as a driver error - as that's not the case current code
is fine.

	Sam
