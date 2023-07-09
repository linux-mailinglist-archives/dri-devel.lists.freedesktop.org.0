Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BD174C664
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 18:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA64F10E0F8;
	Sun,  9 Jul 2023 16:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D71F10E0F8
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jul 2023 16:19:19 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B9648856A7;
 Sun,  9 Jul 2023 18:19:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1688919557;
 bh=hwZixr7rx4yGpMOPQwiRxQYXS38RjkRsK4LZErM+XKk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IctZS0N9Q9+KyGSW4REE9SNtfAGomYoDNL5jt+0IKSEG2KXVU2fraUD5pzONLWzMP
 6Vy4jlP7rKmDaAxVHdmRBAwBausWEBVVm30e4xM68ITc/y7vjS5MfhTdYo1G4/g7aw
 jLKERUE1hj4kKq7Os9n+ICkXJilGP0HLwvgD50teY9JxR3xVyz6dTFay2Nn7IZvWTx
 tlADoIu+N5bNO7dL15G8KHRf/cPjIv5k6VVvBuZgYBEfw8J4rot7EsvRX9rLpbx6ka
 ztPxBxWH3997O4LG60Y+UwC1F2GG5Uma42+OiGo2rFdZ+S4OK+YhMILaQsdHvdurq9
 2UXQ8wzNR21yw==
Message-ID: <9e68cd40-55fd-b0f2-71ab-4e95447c6372@denx.de>
Date: Sun, 9 Jul 2023 18:19:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/panel: simple: Initialize unprepared_time in probe
To: Sam Ravnborg <sam@ravnborg.org>
References: <20230709135231.449636-1-marex@denx.de>
 <20230709150824.GA697428@ravnborg.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230709150824.GA697428@ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/9/23 17:08, Sam Ravnborg wrote:
> Hi Marek.

Hi,

> On Sun, Jul 09, 2023 at 03:52:31PM +0200, Marek Vasut wrote:
>> The unprepared_time has to be initialized during probe to probe time
>> ktime, otherwise panel_simple_resume() panel_simple_wait() call may
>> wait too short time, or no time at all, which would violate the panel
>> timing specification. Initializing the unprepared_time() to probe time
>> ktime assures the delay is at least what the panel requires from the
>> time kernel started. The unprepared_time is then updated every time
>> the panel is suspended in panel_simple_suspend() too.
>>
>> Fixes: e5e30dfcf3db ("drm: panel: simple: Defer unprepare delay till next prepare to shorten it")
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Looks OK,
> 
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> It looks like prepared_time is not used anymore.
> Could you dig a little into this while you are in the waiting area.

Good catch, seems that has been replaced by RPM so whatever is left is 
just a remnant and should be dropped . I can prepare a patch, but let's 
see if Douglas has any further comment on this.
