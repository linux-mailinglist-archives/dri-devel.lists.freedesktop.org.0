Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B3758CE28
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 20:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EDB113452;
	Mon,  8 Aug 2022 18:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653E8112F0B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 18:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=BhhRnrAt9wyuOY21AkpBELEGGKnK2sl/WTGi2e4pR6Y=;
 b=P2rPpRRutX2GxTjySu/NEabaRTyGMieEn/XPhmxRH+gihWaj1c7fYxSWiScgNv0zNsbwV5Mcgw0gD
 uhqLAu1vzJI3N68YCQqlcKbWfHYU+GRIw7W3ILjsglfkGEI5pBVqkOibjFN+AtbaH11TrMUlzU0Iqb
 sLYVsG8wJ01tLH+Dlqfq8IbWIunE7lq/xkRl3ixfBmIgkW+eICUWxNeiqvj75r1x+yrl4SE6EDxAsN
 nEo7v44xo5vyKmGY3JZq48DXP029e6xS+FOHF4+8vcrtnXVbBXLmP2rFMOIg71F9fUQDZgipkiDh4r
 wVueqbzh+S5xI6RS9KN0zWxx8iWUgQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=BhhRnrAt9wyuOY21AkpBELEGGKnK2sl/WTGi2e4pR6Y=;
 b=s9QBiZO6o2FS+3Z8d6BzQSoFZiXrsu1f56QjqReWzKR4p7rbTRqjGpew8WCzJIGEg380mtWM9JGUu
 1L7KLdTCA==
X-HalOne-Cookie: c556d9ec8f471dba3901cbcfc1141056435aafd9
X-HalOne-ID: a32d9dc2-174a-11ed-8244-d0431ea8bb10
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id a32d9dc2-174a-11ed-8244-d0431ea8bb10;
 Mon, 08 Aug 2022 18:48:05 +0000 (UTC)
Date: Mon, 8 Aug 2022 20:48:03 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 13/14] drm/format-helper: Move destination-buffer
 handling into internal helper
Message-ID: <YvFaY9qRZ+zIPiTS@ravnborg.org>
References: <20220808125406.20752-1-tzimmermann@suse.de>
 <20220808125406.20752-14-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808125406.20752-14-tzimmermann@suse.de>
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

On Mon, Aug 08, 2022 at 02:54:05PM +0200, Thomas Zimmermann wrote:
> The format-convertion helpers handle several cases for different
> values of destination buffer and pitch. Move that code into the
> internal helper drm_fb_xfrm() and avoid quite a bit of duplication.
> 
> v2:
> 	* remove a duplicated blank line (Jose)
> 	* use drm_format_info_bpp() (Sam)
>  	* fix vaddr_cached_hint bug (Sam)
> 	* add TODO on vaddr location (Sam)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
