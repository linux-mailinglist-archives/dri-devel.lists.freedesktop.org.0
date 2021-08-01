Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D040F3DCD07
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 19:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE57F6E1A3;
	Sun,  1 Aug 2021 17:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2516E1A3
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 17:59:08 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 2e21abd2-f2f2-11eb-9082-0050568c148b;
 Sun, 01 Aug 2021 17:59:13 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id DF666194B5A;
 Sun,  1 Aug 2021 19:59:29 +0200 (CEST)
Date: Sun, 1 Aug 2021 19:59:03 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Li Tuo <islituo@gmail.com>
Cc: thomas@winischhofer.net, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com
Subject: Re: [BUG] video: fbdev: sis: possible uninitialized-variable access
 in SiS_SetCRT2FIFO_300()
Message-ID: <YQbg5yt0QUOC9dop@ravnborg.org>
References: <e0f988f3-f010-6299-d000-5c035e5f2e2e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0f988f3-f010-6299-d000-5c035e5f2e2e@gmail.com>
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

Hi Tuo Li,

On Sat, Jul 31, 2021 at 02:28:39PM +0800, Li Tuo wrote:
> Hello,
> 
> Our static analysis tool finds a possible uninitialized-variable access in
> the sis driver in Linux 5.14.0-rc3:
> 
> At the beginning of the function SiS_SetCRT2FIFO_300(), the variable
> modeidindex is not initialized.
> If the following conditions are false, it remains uninitialized.
> 5346:    if(!SiS_Pr->CRT1UsesCustomMode)
> 5438:    if(!SiS_Pr->UseCustomMode)
> 
> But it is accessed at:
> 5466:    colorth = SiS_GetColorDepth(SiS_Pr,CRT2ModeNo,modeidindex) >> 1;
> 
> I am not quite sure whether this possible uninitialized-variable access is
> real and how to fix it if it is real.
> Any feedback would be appreciated, thanks!

First, the report looks correct. There is a path where modeindex may not
be initilized.
But I find it very hard to care for such an ancient driver.
If this was somethign we hit is real life we had heard about it - and
the risk of introducing bugs is higher than the the cance that this
fixes a real life bug.

So my advice, find something more relevant to look at.

	Sam
