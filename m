Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD6740407B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 23:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17326E303;
	Wed,  8 Sep 2021 21:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CD86E303
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 21:19:07 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 74A1683430;
 Wed,  8 Sep 2021 23:19:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1631135945;
 bh=DExphSjis5EP6wvAaYawT+BPVlujx67EFThyFYIGSKw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qb4BVjGljBAoCJdO3o0Kus7tXVsulb1XVs9Wf1zI7N4ub2zPFpqSoANRhB50/ATRs
 nMquXtSSNtwE46MyMFHl7BoaVG5fCV3xcS9Oe1zcTYrK1Kft88sv+U/0od0AznDPPA
 BbJZZaT8Wqrs3Ve8A0EW74IZGJ+U1vMXqPvqg8y06H+OVmnpqEcrzX/pouAEll3rs9
 rdppb72hC+FW/pLOr3h6mD7H4Gv5RcVPEcTp5QxeyNMI35jPOoMWVO49QNAiJ3JfV4
 Bu6M7IMji56JeJRN7CsgVqDtOksrQDos6XCv61Ws+vidFO+/AQcTJFWPvBcn9retuY
 z3FX8K5vEeLuw==
Subject: Re: [PATCH] drm: mxsfb: Fix NULL pointer dereference crash on unload
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Daniel Abrecht
 <public@danielabrecht.ch>, Emil Velikov <emil.l.velikov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stefan Agner <stefan@agner.ch>
References: <20210907024900.873850-1-marex@denx.de>
 <YTj/1EIdhQ3245VW@phenom.ffwll.local>
From: Marek Vasut <marex@denx.de>
Message-ID: <746d5873-7411-7244-2e50-bd3d883e80ad@denx.de>
Date: Wed, 8 Sep 2021 23:19:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTj/1EIdhQ3245VW@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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

On 9/8/21 8:24 PM, Daniel Vetter wrote:
> On Tue, Sep 07, 2021 at 04:49:00AM +0200, Marek Vasut wrote:
>> The mxsfb->crtc.funcs may already be NULL when unloading the driver,
>> in which case calling mxsfb_irq_disable() via drm_irq_uninstall() from
>> mxsfb_unload() leads to NULL pointer dereference.
>>
>> Since all we care about is masking the IRQ and mxsfb->base is still
>> valid, just use that to clear and mask the IRQ.
>>
>> Fixes: ae1ed00932819 ("drm: mxsfb: Stop using DRM simple display pipeline helper")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Daniel Abrecht <public@danielabrecht.ch>
>> Cc: Emil Velikov <emil.l.velikov@gmail.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Stefan Agner <stefan@agner.ch>
> 
> You probably want a drm_atomic_helper_shutdown instead of trying to do all
> that manually. We've also added a bunch more devm and drmm_ functions to
> automate the cleanup a lot more here, e.g. your drm_mode_config_cleanup is
> in the wrong place.
> 
> Also I'm confused because I'm not even seeing this function anywhere in
> upstream.

It is still here:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/mxsfb/mxsfb_drv.c#n171
as of:
999569d59a0aa ("Add linux-next specific files for 20210908")

Is there some other tree I should be looking at ?
