Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F1856BE73
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 19:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE8A10E3F2;
	Fri,  8 Jul 2022 17:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D8810E70B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 17:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=DwnQ5mOVvFXfweHTjcj4JFuiyeV+Mv7V1HFBrmJ+S8I=;
 b=V4or1xJMh23MrcAN8YmkjEBhE96PXw/o60LlLJDtfa9DUqZQFMkg3tb4f43kjSJez/PK0I3s+Y9q9
 zwbWNorFfozeH0ymB7vBZwzJt5bdKqx8YbzWcxdgBpw/pHE34R8v2FzTyFbdXTfWkrHFmKSupZZ2z8
 wh8TEVzxfVHd1SFaSKsKvNja8xFsTPcZkj+Te+hm0j/6zrvtMZZowjfuGLjouiJlWQWOy8o5Pv8xgs
 RkgOL5nAwJwoV/jPQX2Z+ycVm9ewaJeRFDRgCIsT8FSboov9AXpnQ8T7QbD/cOBuVbF1WCvpL6dQz/
 hVBtdjFf8oCPn0yQCg9spYF/UQXtY3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=DwnQ5mOVvFXfweHTjcj4JFuiyeV+Mv7V1HFBrmJ+S8I=;
 b=qx1dIPMuw1TgxQfDB8Tsoo+vs82mlyLTLSf9EpjifETktceQWkRA+JxcNlTeL+jfrlIi63gRwKQZu
 M9VcvsHBQ==
X-HalOne-Cookie: 4c5e4ada996b8985e8dc1de94620f2edc10ab5da
X-HalOne-ID: 9e015f16-fee2-11ec-a917-d0431ea8a290
Received: from mailproxy2.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 9e015f16-fee2-11ec-a917-d0431ea8a290;
 Fri, 08 Jul 2022 17:23:01 +0000 (UTC)
Date: Fri, 8 Jul 2022 19:22:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/14] drm/mgag200: Move model-specific code into
 separate functions
Message-ID: <Yshn83t1ByD6Q6Qf@ravnborg.org>
References: <20220708093929.4446-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708093929.4446-1-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, airlied@redhat.com, jfalempe@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Fri, Jul 08, 2022 at 11:39:15AM +0200, Thomas Zimmermann wrote:
> Mgag200 still mixes model-specific code and generic code in the same
> functions. Separate it into distinct helpers.
> 
> As part of this effort, convert the driver from simple-KMS helpers
> to regular atomic helpers. The latter are way more flexible and can
> be adapted easily for each hardware model.
> 
> Tested on Matrox G200 and G200EH hardware.
> 
> Thomas Zimmermann (14):
>   drm/mgag200: Split mgag200_modeset_init()
>   drm/mgag200: Move DAC-register setup into model-specific code
>   dmr/mgag200: Move ER/EW3 register initializatino to per-model code
>   drm/mgag200: Acquire I/O-register lock in atomic_commit_tail function
>   drm/mgag200: Store primary plane's color format in CRTC state
>   drm/mgag200: Reorganize before dropping simple-KMS helpers
>   drm/mgag200: Replace simple-KMS with regular atomic helpers
>   drm/mgag200: Set SCROFF in primary-plane code
>   drm/mgag200: Add per-device callbacks
>   drm/mgag200: Provide per-device callbacks for BMC synchronization
>   drm/mgag200: Provide per-device callbacks for PIXPLLC
>   drm/mgag200: Move mode-config to model-specific code
>   drm/mgag200: Move CRTC atomic_enable to model-specfic code
>   drm/mgag200: Remove type field from struct mga_device

I have browsed the patches and they looked good.
I was about to complain about several things, like bmc init, but then
later this is all nicely cleaned up.
Especially the pll setup stuff did not get much scrunity, as it like
most of the patch looked like code movements.

All patches except "Move DAC-register setup into model-specific code"
are:
Acked-by: Sam Ravnborg <sam@ravnborg.org>


>  14 files changed, 2804 insertions(+), 1586 deletions(-)
This is not a diffstat that makes one go - yyipeee.
But the improvements makes it worthwhile.

	Sam
