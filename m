Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AC9430BED
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 22:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8346C6E027;
	Sun, 17 Oct 2021 20:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795806E027
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 20:05:30 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 64E0582849;
 Sun, 17 Oct 2021 22:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1634501128;
 bh=OGH8jHpMbhycl1uHbkq0BOiDGtX5UhTgnYlbMMeypDY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=D+kot3y3fDfh+doQwBM7ZaPR8rO435Q+xnDOrkq+cwuL/7VRQjqMRyb378KAI83+n
 +cqzb5C6yazNei+qbHtJWrG6I3WWNMqmpeBBp1ENbLl2jOeTxgTkSzEkRmnO1ABXPH
 0uxfcSF1amjYLQ9/LI2dKl9cKMcYxYf2E8NEHg42mw9aUl/X1ypeWl1AFIve4lDYgx
 bgIgKw81e29U+uiG5Onbi7Y6oSofaPP1fTVSCc5GPzyOOKFTkqb/oj2MDablsuJKMn
 xUWQEs6g9bDP3TQdCBqmdi9Yysp17HNG6je0plxFirOUy2CxJqr1Yu8A/IGjDz5QXS
 GtYA0DhT3931A==
Subject: Re: [PATCH] drm: mxsfb: Fix NULL pointer dereference crash on unload
To: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Daniel Abrecht
 <public@danielabrecht.ch>, Emil Velikov <emil.l.velikov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stefan Agner <stefan@agner.ch>
References: <20210907024900.873850-1-marex@denx.de>
 <YTj/1EIdhQ3245VW@phenom.ffwll.local> <YWxi7oc56nKU2OzF@ravnborg.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <9fe74edf-9606-9819-ad34-2195a6418ef9@denx.de>
Date: Sun, 17 Oct 2021 22:05:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWxi7oc56nKU2OzF@ravnborg.org>
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

On 10/17/21 7:52 PM, Sam Ravnborg wrote:
> Hi Marek,
> 
> On Wed, Sep 08, 2021 at 08:24:20PM +0200, Daniel Vetter wrote:
>> On Tue, Sep 07, 2021 at 04:49:00AM +0200, Marek Vasut wrote:
>>> The mxsfb->crtc.funcs may already be NULL when unloading the driver,
>>> in which case calling mxsfb_irq_disable() via drm_irq_uninstall() from
>>> mxsfb_unload() leads to NULL pointer dereference.
>>>
>>> Since all we care about is masking the IRQ and mxsfb->base is still
>>> valid, just use that to clear and mask the IRQ.
>>>
>>> Fixes: ae1ed00932819 ("drm: mxsfb: Stop using DRM simple display pipeline helper")
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: Daniel Abrecht <public@danielabrecht.ch>
>>> Cc: Emil Velikov <emil.l.velikov@gmail.com>
>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: Stefan Agner <stefan@agner.ch>
>>
>> You probably want a drm_atomic_helper_shutdown instead of trying to do all
>> that manually. We've also added a bunch more devm and drmm_ functions to
>> automate the cleanup a lot more here, e.g. your drm_mode_config_cleanup is
>> in the wrong place.
> 
> I have applied v2 of this patch today - but failed to see any response
> in v2 to this comment from Daniel. Was it lost somehow?

Hmmm, I'll investigate that ^ in the next round of mxsfb clean ups.
