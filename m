Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37D33C5E28
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 16:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822B789C7F;
	Mon, 12 Jul 2021 14:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7D789C3B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 14:18:31 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 0ca98735-e31c-11eb-8d1a-0050568cd888;
 Mon, 12 Jul 2021 14:18:37 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 46010194B38;
 Mon, 12 Jul 2021 16:18:40 +0200 (CEST)
Date: Mon, 12 Jul 2021 16:18:27 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 06/12] drm/mgag200: Store values (not bits) in struct
 mgag200_pll_values
Message-ID: <YOxPM4hFNt3Yzv+z@ravnborg.org>
References: <20210705124515.27253-1-tzimmermann@suse.de>
 <20210705124515.27253-7-tzimmermann@suse.de>
 <YOlHBdXYeLtRga+k@ravnborg.org>
 <b82e6ee2-00a3-e50c-8980-83896369fe45@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b82e6ee2-00a3-e50c-8980-83896369fe45@suse.de>
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
Cc: John.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, emil.velikov@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

> As I mention, struct mgag200_pll_values should store the PLL values. But the
> individual compute and set functions for each hardware revision mess this up
> completely. Sometimes they use 'function values' sometimes they use
> 'register values'. If you'd try to debug a failed modeset operation and have
> to look at the PLL, the stored values would be meaningless, because there's
> simply no logic behind it.

So this is the reason for this chage - and then it makes perferct sense
to do it. Without this explanation is was to my eay useless chrunch, but
this explanation makes sense.
> 
> The purpose of this patch is to make all compute functions store function
> values in the struct and make all update function compute the register
> values internally.
> 
> Do you think the change would be easier to understand if I change the
> original _set_plls() functions *before* splitting them into compute and
> update steps?
Na, this would still be very difficult to track down.
The only way I would trust myself doing a proper review would be do code
it myself and compare the final result.
Alas, I am not going to do this.

I will take a look again when you post the next revision, and unless I
stumble on something I can ack the code as in I have at least looked at
all the code changes. That should be enough to have it committed and the
time will tell if there is some fall-out.

	Sam
