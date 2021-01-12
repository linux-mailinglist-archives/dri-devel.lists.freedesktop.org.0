Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD7B2F3054
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 14:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C954B6E200;
	Tue, 12 Jan 2021 13:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F846E200
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 13:11:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E76E2311D;
 Tue, 12 Jan 2021 13:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610457114;
 bh=vP2DCagVtAMu9x56EKZAmURKgDbYatteSbiEwLNkbDc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VtmmSSY2umtEYzqFZ97n8qo1zKpm2Q/ov5UyeApaJAOCFKVKtbv6QoOwErR68J5i8
 J0TcbtmwpjzN13nNYzNrXmUH5G4ZCyHhYYeFhhlgW46WKYqEwA/+l7SYi1CDGS8Z5l
 QcJ7wYW3hDLfJTB0qIokccmUbQjNTkt0C6KFc1hbF42t2CeiD+AfVEBXk1HNkqYXg/
 PQYYRyoKFnMz9qW23cbQtFYM6DzdGlbWizGUDrqxN8R2G9YxnElWzrefWvtRD79qQq
 lmnBBRKN0lv80UzGCREXpvTL2+XmFo/4GZxyx9MBszv4ihPIhctyG/I/cB0jCgzECM
 kn8y3tXwiRuag==
Subject: Re: [PATCHv1] video: omapfb2: Make standard and custom DSI command
 mode panel driver mutually exclusive
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20210108122540.657501b2@canb.auug.org.au>
 <20210108112441.14609-1-sebastian.reichel@collabora.com>
 <20210108195839.GA1429715@ravnborg.org>
 <20210112120246.ujhjyylrlgfrfvig@earth.universe>
From: Tomi Valkeinen <tomba@kernel.org>
Message-ID: <4b39c036-fb70-4a5b-ddda-08ce2f0a6db5@kernel.org>
Date: Tue, 12 Jan 2021 15:10:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112120246.ujhjyylrlgfrfvig@earth.universe>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12/01/2021 14:02, Sebastian Reichel wrote:
> [replace Tomi's TI mail address with something working]
> 
> Hi,
> 
> On Fri, Jan 08, 2021 at 08:58:39PM +0100, Sam Ravnborg wrote:
>> Hi Sebastian,
>>
>> On Fri, Jan 08, 2021 at 12:24:41PM +0100, Sebastian Reichel wrote:
>>> Standard DRM panel driver for DSI command mode panel used by omapfb2 is also
>>> available now. Just like the other panels its module name clashes with the
>>> module from drivers/video/fbdev/omap2/omapfb/displays, part of the deprecated
>>> omapfb2 fbdev driver. As omapfb2 can only be compiled when the omapdrm driver
>>> is disabled, and the DRM panel drivers are useless in that case, make the
>>> omapfb2 panel depend on the standard DRM panels being disabled to fix
>>> the name clash.
>>>
>>> Fixes: cf64148abcfd ("drm/panel: Move OMAP's DSI command mode panel driver")
>>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>>
>> For a backport this looks good:
>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Thanks.

Thanks. I'll push to drm-misc-next, as that's where the commit that
breaks this is.

>> But why is it it we need omapfb at all when we have omapdrm?
> 
> I think there are two reasons omapfb has not been killed yet. One
> reason was missing support for manually updated DSI panels, which
> have been working since 1 or 2 kernel releases now. The other reason
> is some people using it in combination with an out-of-tree PowerVR
> kernel driver. There is currently work going on to use a more recent
> PowerVR driver based on omapdrm driven by Maemo Leste people.

omapfb also has a custom sysfw API, so applications that depend on it
would not work anymore. I don't know if there are such applications, though.

>> Can we sunset all or some parts of omap support in video/?
>> If not, what is missing to do so.
> 
> IDK the exact status of the PowerVR work and have not been using
> omapfb myself for years. I don't think there is a reason to rush
> this, so my suggestion is removing it in 3 steps giving people
> the chance to complain:
> 
> 1. Add 'depends on EXPERT' to 'FB_OMAP2' and add deprecation notice
>    referencing omapdrm in help text in 5.12
> 2. Add 'depends on BROKEN' in 5.13
> 3. Drop drivers/video/fbdev/omap2 afterwards

I'd love to remove omapfb, but I also fear that there are still people
using it. We can try the above sequence, but it's probably better to go
slower, as people may not be using the latest kernels.

 Tomi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
