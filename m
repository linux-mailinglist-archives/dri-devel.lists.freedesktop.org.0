Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD483D950B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 20:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC8C6E8D4;
	Wed, 28 Jul 2021 18:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B236E8D4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 18:11:25 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 420b82a7-efcf-11eb-8d1a-0050568cd888;
 Wed, 28 Jul 2021 18:11:41 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id BB770194B3A;
 Wed, 28 Jul 2021 20:11:41 +0200 (CEST)
Date: Wed, 28 Jul 2021 20:11:18 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Dan.Sneddon@microchip.com
Subject: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
Message-ID: <YQGdxtV0BGZ8VOpm@ravnborg.org>
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <20210727182721.17981-4-tzimmermann@suse.de>
 <YQFi96yaYbTG4OO7@ravnborg.org>
 <e28b1a2f-015c-c81b-eb64-5323df9ed35d@microchip.com>
 <YQF7bKyeup8n3awU@ravnborg.org>
 <3d2f6b84-dd07-d925-a8b8-2bfd5fc736d9@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d2f6b84-dd07-d925-a8b8-2bfd5fc736d9@microchip.com>
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, amd-gfx@lists.freedesktop.org,
 anitha.chrisanthus@intel.com, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, tzimmermann@suse.de, edmund.j.dea@intel.com,
 s.hauer@pengutronix.de, alison.wang@nxp.com, dri-devel@lists.freedesktop.org,
 sean@poorly.run, linux-arm-kernel@lists.infradead.org, tomba@kernel.org,
 bbrezillon@kernel.org, jyri.sarha@iki.fi, Nicolas.Ferre@microchip.com,
 christian.koenig@amd.com, kernel@pengutronix.de, alexander.deucher@amd.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

thanks for the quick feedback!

On Wed, Jul 28, 2021 at 05:50:34PM +0000, Dan.Sneddon@microchip.com wrote:
> On 7/28/21 8:44 AM, Sam Ravnborg wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Hi Dan,
> > 
> > On Wed, Jul 28, 2021 at 03:11:08PM +0000, Dan.Sneddon@microchip.com wrote:
> >> On 7/28/21 7:00 AM, Sam Ravnborg wrote:
> >>> [You don't often get email from sam@ravnborg.org. Learn why this is important at http://aka.ms/LearnAboutSenderIdentification.]
> >>>
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> Hi Dan,
> >>>
> >>> I hope you can fine to test this patch from Thomas.
> >>> If this works then we can forget about my attempt to do the same.
> >>
> >> I'll test this as soon as I can and let you know.
> > 
> > Thanks, crossing my fingers... (which explains the funny spelling from
> > time to time)
> > 
> >          Sam
> > So I ran the test on an A5D27 XULT board with a PDA5 display.  Our 
> graphics demos that come with our linux4sam releases seem to run just 
> fine.  modetest -v seems to run just fine.  However, vbltest returns 
> "drmWaitVBlank (relative) failed ret: -1".  I don't understand why 
> modetest -v is working and vbltest isn't, but that's what I'm seeing.

Strange indeed.


Just to be sure...
Can you confirm that vbltest is working OK *before* this patch?

	Sam
