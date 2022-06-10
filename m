Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE55546E70
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 22:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F779113520;
	Fri, 10 Jun 2022 20:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BA1113510
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 20:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=jVE3ilMvZWY8ulhyEsb0pHfa2vvSKMMxY1N2fKgs7GA=;
 b=pbwE7X9Cwge6vAGV1ENPX+f92h7omwg6fTGR+DmDlcqkUu9KLlaUMF/rrf5A3VcrTR31RwJQbEktR
 gL90KHJCPmFgld7tbkB/UUIvoD2dPEYVbR3GP2BwESzFdItvtXH8QjtxGdKHup7JiEeHe57JENQqVW
 /gh1ilAGR7VdXh4s/M76X/fSekgCkwLFcRftWJOHYdAsGnyLlhE+q9dkSoTAqc6gkZV+L2f2KIrf41
 CUGgxsWR73gP4GJ94Y2ICN/2yYQzZoxFGkfMBkmteLvntgM1mejo9z9M/A8pbwhuVfVMbvv93LhvZE
 vXmjCGheZ2gIqGfa5RQVksG6VGr9VDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=jVE3ilMvZWY8ulhyEsb0pHfa2vvSKMMxY1N2fKgs7GA=;
 b=3WPqGsdp8JyO2QUhe9rqiozMBx2X4xWbmHpb86WISBX2TwkV0DtCJIU6A38H6euilIiqBcE9LzP+3
 v3cd9W1Ag==
X-HalOne-Cookie: 97e8025a86500fcb8587d22aeeebba46565afd88
X-HalOne-ID: fe1b27f0-e8fb-11ec-a912-d0431ea8a290
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id fe1b27f0-e8fb-11ec-a912-d0431ea8a290;
 Fri, 10 Jun 2022 20:29:14 +0000 (UTC)
Date: Fri, 10 Jun 2022 22:29:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH 1/7] fbdev: aty128fb: Use backlight helper
Message-ID: <YqOpmKlLl909F/Ib@ravnborg.org>
References: <20220607192335.1137249-1-steve@sk2.org>
 <20220607192335.1137249-2-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607192335.1137249-2-steve@sk2.org>
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
Cc: linux-fbdev@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stepehen,

On Tue, Jun 07, 2022 at 09:23:29PM +0200, Stephen Kitt wrote:
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org

This and the other 6 patches in this series are all:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I did not receive the cover letter, which is why I reply to this mail.

	Sam
