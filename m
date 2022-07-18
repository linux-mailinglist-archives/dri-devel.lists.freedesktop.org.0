Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 054A5577CEB
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 09:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA5512B0AC;
	Mon, 18 Jul 2022 07:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABD712B0A6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 07:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=19yok7hoQt4hNJn0aBxcWBSkPS9MkYzkDNamgK4iPxU=;
 b=H7lnzG4AgPU40aLlp06tKxdHS8XmJnR4WS3ULjhd2fvYyhf9LI2ltHvkGLTtfSN782JDnXdFZd/sN
 EC8Pf2oTOJmGvJVmsSBay5RnskDsoeyEppq19JNfH6LOhkM4qaPHs6CtjZYh44BSSahjrfzuMzvR7z
 w+DZvOjoExDwa2HVoT5zL+i+LQmjlgzuKWtkYyAgGiATn9aRSH8EEe31oiIXraLJq+Q1p/IbdnuZiH
 G00WjPyH6ysqSs8kYmi02htBYRji3wsDZQ0cYJFss1nQCjJ3GNORNEH3v2PFb39Yzt9uiPOOcPAybi
 US9yEVdV7eEhIICGyfus4FvCiUEWiSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=19yok7hoQt4hNJn0aBxcWBSkPS9MkYzkDNamgK4iPxU=;
 b=wulcQTwRKaDXue7f8hXp+uEMMtiOCfE7EkYcKvIwPzjmCYGhecTfT9A8bJu883pkGW27oshkJ8Uhq
 0X8W3ygCw==
X-HalOne-Cookie: 52dee1c0afa6c78f3641024dad2293c56c09fec0
X-HalOne-ID: 2865fd0d-066f-11ed-be7f-d0431ea8bb03
Received: from mailproxy2.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 2865fd0d-066f-11ed-be7f-d0431ea8bb03;
 Mon, 18 Jul 2022 07:56:40 +0000 (UTC)
Date: Mon, 18 Jul 2022 09:56:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v1 0/11] drm: move dri1 drivers to drm/dri1/
Message-ID: <YtUSNzVOvaQZ1+uS@ravnborg.org>
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <9ded7088-cb15-fe5d-5a4d-001d3d9bb195@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ded7088-cb15-fe5d-5a4d-001d3d9bb195@suse.de>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Jul 18, 2022 at 08:56:16AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 16.07.22 um 20:17 schrieb Sam Ravnborg:
> > While discussing the way forward for the via driver
> > Javier came up with the proposal to move all DRI1 drivers
> > to their own folder.
> > 
> > The idea is to move the old DRI1 drivers so one do not
> > accidentally consider them modern drivers.
> > 
> > This set of patches implements this idea.
> > 
> > To prepare the move, DRIVER_LEGACY and CONFIG_DRM_LEGACY
> > are both renamed to *_DRI1. This makes it more obvious
> > that we are dealing with DRI1 drivers, as we have
> > a lot of other legacy support.
> > 
> > The drivers continue to have their own sub-directory
> > so the driver files are not mixed with the core files
> > which are copied in the last commit.
> > 
> > The DRI1 specific part of drm/Kconfig is likewise pulled
> > out and located in the dri1/ folder.
> > 
> > Feedback welcome!
> 
> To be honest, I still don't like this rename. Especially in the case of via,
> which has a KMS driver coming up. It will now have an include statement that
> crosses several levels in the directory hierarchy. And what about the other
> DRI1 drivers? If we ever get KMS drivers for those, do we want to move some
> header files back into their original locations? Patches 1 and 2 look
> reasonable to me. The other driver patches have basically zero upside IMHO.
Until there are consensus, if ever, I will drop the patches moving the drivers.
There is a few DRIVER_LEGACY in Documentation/ that I missed, so will
send a v2 with these.

> In the case of moving the core files into dri1/, the resulting Makefile rule
> looks really ugly. I'd suggest to move all code into a separate file
> drm_dri1.c and be done with it.  For something more elaborate, there could
> by drm_dri1.c and drm_dri1_helper.c, where the latter contains all DRI1 code
> that is only used by the drivers.
If we do not move the core code, then this is a good way to tell this is dri1
specific. I may try to give it a spin - but just as a single file I think.

	Sam
