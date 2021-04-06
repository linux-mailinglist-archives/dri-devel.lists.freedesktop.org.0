Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B3335570A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 16:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974DD6E187;
	Tue,  6 Apr 2021 14:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22436E187
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 14:54:42 +0000 (UTC)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi
 [91.157.208.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B8378D8;
 Tue,  6 Apr 2021 16:54:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1617720880;
 bh=jqoL7WKjJ45qOTeebhws9l2DPNRQsxR4rahdVHSzeKM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=X+lHlA8D1GYN6wgt1AkprOHJPveyMlXfIAofLIEsN9r/f8ASjWLGz+/oLGfNu3MQ2
 6E0Gm/5ERNBXko8aazyWCbJl3Ufd3oRdk3LM9j+oTSlAH7rnX1wjgFa6MjCRGXjoxy
 55XP06h7eLYv7R6zVuWfGxXOwkfMvzHaSk0ObXzg=
Subject: Re: [PATCH] drm/panel: panel-dsi-cm: disable TE for now
To: Thierry Reding <thierry.reding@gmail.com>
References: <YDnyVV/O78sQjtWb@atomide.com>
 <20210227214542.99961-1-sebastian.reichel@collabora.com>
 <c8d624ce-5cc5-ba83-4446-4c7a7903b344@ideasonboard.com>
 <YGxnXS8hQ5fkTCfe@orome.fritz.box>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <252f3b2e-0358-30f7-ea6b-988fbcff2030@ideasonboard.com>
Date: Tue, 6 Apr 2021 17:54:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YGxnXS8hQ5fkTCfe@orome.fritz.box>
Content-Language: en-US
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
Cc: Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/04/2021 16:51, Thierry Reding wrote:
> On Tue, Mar 16, 2021 at 04:11:30PM +0200, Tomi Valkeinen wrote:
>> Hi Sebastian, Sam, Thierry,
>>
>> On 27/02/2021 23:45, Sebastian Reichel wrote:
>>> From: Sebastian Reichel <sre@kernel.org>
>>>
>>> Disable TE for Droid 4 panel, since implementation is currently
>>> broken. Also disable it for N950 panel, which is untested.
>>>
>>> Reported-by: Tony Lindgren <tony@atomide.com>
>>> Reported-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> Fixes: 4c1b935fea54 ("drm/omap: dsi: move TE GPIO handling into core")
>>> Signed-off-by: Sebastian Reichel <sre@kernel.org>
>>> ---
>>> I suggest to start by fix the regression like this and look into
>>> proper Droid 4 TE support separatly. Assumption is, that Tomi
>>> tested taal panel, droid4 panel is 'broken' and N950 (himalaya)
>>> is untested [*], so choosing safe default. Patch is compile-tested
>>> only.
>>>
>>> [*] N950 display is not yet functional on mainline, since it needs
>>> the omap3 FIFO workaround:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-n900.git/commit/?h=n950-display-tony&id=d4cbc226a30b29bf2583ffff97b052c9ec68c8a3
>>> ---
>>>    drivers/gpu/drm/panel/panel-dsi-cm.c | 12 +++++++++---
>>>    1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>
>> Sam, Thierry, will you pick this up or can I push to drm-misc-fixes?
> 
> Sorry, I had missed this. Feel free to take this through drm-misc
> yourself:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

Thanks! I have pushed this to drm-misc-fixes.

  Tomi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
