Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FA419023E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F136E432;
	Mon, 23 Mar 2020 23:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0896E432
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:50:57 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 27E9C5C0BDA;
 Tue, 24 Mar 2020 00:50:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1585007456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ftIndbhIUZerLL+kkoWVJ4M/yaQkNoGtlNzhNsbN58M=;
 b=G31UMRIpXyq3lhPXLpt8e5yip5Tqv1YuFes8oegLYANW7DmJmhl3xCSp7dePvogCe6SpXV
 eFNqfQxNi/ATpzwdtoBXRHFcFxufrnLHd6FRZKPMu6OmpahbzmiRTMYsr+fYblMpEzhenN
 ndAHBv0uVKnOMYRVTxOn0XHry7Nk/qs=
MIME-Version: 1.0
Date: Tue, 24 Mar 2020 00:50:56 +0100
From: Stefan Agner <stefan@agner.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 02/21] drm: mxsfb: Use drm_panel_bridge
In-Reply-To: <20200323213844.GA15505@ravnborg.org>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-3-laurent.pinchart@ideasonboard.com>
 <eb16f03d670a424a4a63d9c855fabe65@agner.ch>
 <20200323213844.GA15505@ravnborg.org>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <21afc032a6625ed88cbbb643c37b8a05@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de,
 linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-23 22:38, Sam Ravnborg wrote:
> Hi Stefan.
> 
> On Mon, Mar 23, 2020 at 10:27:21PM +0100, Stefan Agner wrote:
>> On 2020-03-09 20:51, Laurent Pinchart wrote:
>> > Replace the manual connector implementation based on drm_panel with the
>> > drm_panel_bridge helper. This simplifies the mxsfb driver by removing
>> > connector-related code, and standardizing all pipeline control
>> > operations on bridges.
>> >
>> > A hack is needed to get hold of the connector, as that's our only source
>> > of bus flags and formats for now. As soon as the bridge API provides us
>> > with that information this can be fixed.
>>
>> This seems like a nice simplification.
>>
>> I gave this a go applied on today's drm-misc-next using a Colibri iMX7
>> (imx7d-colibri-emmc-eval-v3.dts device tree). This device makes use of
>> the simple panel driver. I get this when booting:
>>
>> [    2.976698] [drm] Supports vblank timestamp caching Rev 2
>> (21.10.2013).
>> [    2.983526] ------------[ cut here ]------------
>> [    2.988180] WARNING: CPU: 0 PID: 1 at
>> drivers/gpu/drm/bridge/panel.c:267 devm_drm_panel_bridge_add+0x25/0x28
> 
> ...
> 
> I think you hit one of the panels that does not yet specify a
> connector_type.
> 
> If this is the case, we should fix the definition in panel-simple.

Yes, this indeed the case, I used the "logictechno,lt161010-2nhc"
compatible string. Will get this fixed!

But I think its still worth defining a default in the driver as DPI is
what this IP outputs...

--
Stefan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
