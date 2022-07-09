Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC9A56C991
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 15:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A81F113AF0;
	Sat,  9 Jul 2022 13:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE73113AED
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=XmkcfsDh57jd1J2jvUdL+BZKRd9qAe04YaTvDGQ4b5o=;
 b=Zo5LqVUaSgfH1W5v9cXv82HIf2UTJGKnsGbh9Q5tzQ5DCQVt79EHEiPIYgGqC+LE6cN0xxGkryJDx
 Sp02VZSmTBldxoUo61et9Qo2JEd9uUmzNkIIKYq559XURbuO8uDvFwZs+u32a+rWhq/PQyS+SnSw89
 HimmnJkdp5Ju4TTcVkXNMc+L2IeyHNsCPV2femt6bvayQs9DetIkw6DnJsrkIu6ezP+gWpDC4pnLst
 MmlDrPUqgq5sjtMzIVIKVwzsiOI0OI5XKk+7BUokSL7RTJio7Y5RPlUoZCByQ+PeVKO4Mp7rt24cRZ
 p4HI8rrjcytPKML9EX1DQLjkw3fSQDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=XmkcfsDh57jd1J2jvUdL+BZKRd9qAe04YaTvDGQ4b5o=;
 b=6o3gycdRpEHGoNrAwURicgyEGwLg1iuyxseqGoOk4kRzw82swxTrUITH5wBxDFk1KMBrTPUNWvZOh
 dt2Z1nrAQ==
X-HalOne-Cookie: aedeed65c7618423d082425d94c8b2f248725526
X-HalOne-ID: 6b4eb816-ff8c-11ec-be7e-d0431ea8bb03
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 6b4eb816-ff8c-11ec-be7e-d0431ea8bb03;
 Sat, 09 Jul 2022 13:38:30 +0000 (UTC)
Date: Sat, 9 Jul 2022 15:38:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 00/10] drm: Add support for low-color frame buffer
 formats
Message-ID: <YsmE1D8lGp4XKs99@ravnborg.org>
References: <cover.1657294931.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1657294931.git.geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-m68k@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Fri, Jul 08, 2022 at 08:20:45PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> A long outstanding issue with the DRM subsystem has been the lack of
> support for low-color displays, as used typically on older desktop
> systems, and on small embedded displays.

IT is super to have this addressed - thanks!

> 
> This patch series adds support for color-indexed frame buffer formats
> with 2, 4, and 16 colors.  It has been tested on ARAnyM using a
> work-in-progress Atari DRM driver supporting 2, 4, 16, 256, and 65536
> colors, with text console operation, fbtest, and modetest.
> 
> Overview:
>   - Patch 1 introduces a helper, to be used by later patches in the
>     series,
>   - Patch 2 introduces a flag to indicate color-indexed formats,
>   - Patches 3 and 4 correct calculations of bits per pixel for sub-byte
>     pixel formats,
>   - Patches 5 and 6 introduce the new C[124] formats,
>   - Patch 7 fixes an untested code path,
>   - Patch 8 documents the use of "red" for light-on-dark displays,
>   - Patches 9 and 10 add more fourcc codes for light-on-dark and
>     dark-on-light frame buffer formats, which may be useful for e.g. the
>     ssd130x and repaper drivers.

Applied all patches to drm-misc (drm-misc-next), including the last two
RFC patches as we then have the formats ready when a user pops up.

	Sam
