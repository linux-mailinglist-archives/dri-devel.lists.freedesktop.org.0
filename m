Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6C958CE2D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 21:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9156111BC20;
	Mon,  8 Aug 2022 18:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9AC10F2B9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 18:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=s+0IzkHyklav4T4uKNIPC8LopLc1E14ktyVPjmXa5fo=;
 b=ofvJIALLPeLtYlXYuzkfTVRzn/6JQBW2j3y7Y9Osrp3KMGYQpv0E15FDHX4cqeKgDhEaaZm2O6FMn
 W6jYN5Sv9+hHxowCS1/0blyi4P068NEHuTE5uhz5+0AQ4HmB4kJYu2oUNiL2BFtR01CimUpVTWCLsA
 3Yybrj07eXNOLkU4NEh8FxDVBv1Yz9FVEYF3Pz+VdtJlpchq4GiVEM248zuHkZvmkFV8O2WFJHUlaW
 VjiAxkB3nw5yOUM6fnHRgP9lpu5wGeT4QvxiJDzGbPBg6//IyiyJnKcJrvR2ztRjHxoFTgTAHDF2iC
 T2J0pfOXSJ9bRLQ3lyeU1GqCabObZ6Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=s+0IzkHyklav4T4uKNIPC8LopLc1E14ktyVPjmXa5fo=;
 b=ZuyWonf+u7HEq4n4GnMb3ltEwU1vl+o1dVh7eBOuIZiawi/GirMN9+hC6O+ncnrnzhli4InIb6RoG
 cyPi23YDg==
X-HalOne-Cookie: a9907ca109aae20e7cc54585a792875938ecdf2c
X-HalOne-ID: 100811f6-174b-11ed-a6cc-d0431ea8a283
Received: from mailproxy3.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 100811f6-174b-11ed-a6cc-d0431ea8a283;
 Mon, 08 Aug 2022 18:51:08 +0000 (UTC)
Date: Mon, 8 Aug 2022 20:51:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 00/14] drm/format-helper: Move to struct iosys_map
Message-ID: <YvFbGry6dvfTwceK@ravnborg.org>
References: <20220808125406.20752-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808125406.20752-1-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, david@lechnology.com, airlied@linux.ie,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org, javierm@redhat.com,
 virtualization@lists.linux-foundation.org, drawat.floss@gmail.com,
 noralf@tronnes.org, kraxel@redhat.com, jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Aug 08, 2022 at 02:53:52PM +0200, Thomas Zimmermann wrote:
> Change format-conversion helpers to use struct iosys_map for source
> and destination buffers. Update all users. Also prepare interface for
> multi-plane color formats.
> 
> The format-conversion helpers mostly used to convert to I/O memory
> or system memory. To actual memory type depended on the usecase. We
> now have drivers upcomming that do the conversion entirely in system
> memory. It's a good opportunity to stream-line the interface of the
> conversion helpers to use struct iosys_map. Source and destination
> buffers can now be either in system or in I/O memory. Note that the
> implementation still only supports source buffers in system memory.
> 
> This patchset also changes the interface to support multi-plane
> color formats, where the values for each component are stored in
> distinct memory locations. Converting from RGBRGBRGB to RRRGGGBBB
> would require a single source buffer with RGB values and 3 destination
> buffers for the R, G and B values. Conversion-helper interfaces now
> support this.
> 
> v2:
> 	* add IOSYS_MAP_INIT_VADDR_IOMEM (Sam)
> 	* use drm_format_info_bpp() (Sam)
> 	* update documentation (Sam)
> 	* rename 'vmap' to 'src' (Sam)
> 	* many smaller cleanups and fixes (Sam, Jose)
Thanks for the quick respin - I reviewed the remaining patches and looks
good. Nice cleanup of the API and it makes is easier to add more
conversions.

	Sam
