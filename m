Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B32768485
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 10:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B043110E04D;
	Sun, 30 Jul 2023 08:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 137794 seconds by postgrey-1.36 at gabe;
 Sun, 30 Jul 2023 08:55:43 UTC
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:403::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABA510E04D
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=mFakZeALJNGvZSohmf/wWFUZxBT4BMrnbpl3ezu/8xg=;
 b=BU2t5HBt6AxOY9DWmwd6uVqDKEE6+EORAWwGLRuq4UorA+nAmmNoiWomF9qfvGspOvbS5ZvS18F1t
 sk62CSt8rHuLirMkNIcpKQKLW7KrCzbBDjjwykcMa8eZYeSzO/wWRhEl4ModKf6VdkdQ6HCO+OufGP
 ZQv1d1Ee75zSjQdI2Y3Vhu2MskkhjLvfmey4l70qsJZ1sw2yDfEA6inc15z6WgcmYapS8KN56uoTTq
 SW+OgaZgrWr0daiw5leZG4aHgHGTzRnYv2HkRLTyTJx68fTSbKyyW03gzmi6+T3qJb1begPp9VdUKt
 Z4Pvdt0SX24tWwnnDBMxh5Iu9oHsmZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=mFakZeALJNGvZSohmf/wWFUZxBT4BMrnbpl3ezu/8xg=;
 b=PuqQNp88Cg2L0KD+9U1TyBW/+zsbjIekPa25mUj+6EtxjJ32lV2tqPeMPZhXBf85jc+srwd8PN3mi
 ADw66rFCA==
X-HalOne-ID: dbd268c0-2eb6-11ee-a19a-592bb1efe9dc
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4 (Halon) with ESMTPSA
 id dbd268c0-2eb6-11ee-a19a-592bb1efe9dc;
 Sun, 30 Jul 2023 08:55:41 +0000 (UTC)
Date: Sun, 30 Jul 2023 10:55:40 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/47] fbdev: Use I/O helpers
Message-ID: <20230730085540.GB1322260@ravnborg.org>
References: <20230728182234.10680-1-tzimmermann@suse.de>
 <20230728183541.GA1144760@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728183541.GA1144760@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, deller@gmx.de,
 linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org,
 javierm@redhat.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 08:35:41PM +0200, Sam Ravnborg wrote:
> Hi Thomas,
> 
> On Fri, Jul 28, 2023 at 06:39:43PM +0200, Thomas Zimmermann wrote:
> > Most fbdev drivers operate on I/O memory. And most of those use the
> > default implementations for file I/O and console drawing. Convert all
> > these low-hanging fruits to the fb_ops initializer macro and Kconfig
> > token for fbdev I/O helpers.
> > 
> > The fbdev I/O helpers are easily grep-able. In a later patch, they can
> > be left to empty values if the rsp. funtionality, such as file I/O or
> > console, has been disabled.
> > 
> > There are no functional changes. The helpers set the defaults that
> > the drivers already use.
> 
> I have browsed all patches - they all looks good.
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

When you post v2 with MEM added the review still holds true.

	Sam
