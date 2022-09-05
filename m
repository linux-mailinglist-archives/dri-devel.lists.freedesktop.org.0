Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC595AC9C4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 07:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B9310E116;
	Mon,  5 Sep 2022 05:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDB010E034
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 05:26:20 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 907904A8;
 Mon,  5 Sep 2022 07:26:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1662355578;
 bh=ZIS2sM0JMabntCUeGgPWf0WOLHcnI9Ueru0gCH+S8nU=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=JnCPhrOPzgFDbSXtD6F0N85Uu0vyiPgT3KxgixdgJev/8S8bx+ZAY0I4rvXXmaqPi
 7FbZTzdOr9Ss6Qe5IyExtSynBnGhRtyS3RalePMWE8xyfsZrtVXRzkcas+Gk0WY4qI
 WNM3Jrmt3p434wSI8480yo/h0MY1BkBkxX1MZc/o=
Message-ID: <a28a4858-c66a-6737-a9fc-502f591ba2d5@ideasonboard.com>
Date: Mon, 5 Sep 2022 08:26:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/bridge_connector: enable HPD by default if supported
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
References: <20211225063151.2110878-1-nikita.yoush@cogentembedded.com>
 <Yczy3UYpU2UMFQ6N@pendragon.ideasonboard.com>
 <164563304251.4066078.10022034509552549983@Monstersaurus>
 <YhZf+Fs2AP+btuJj@pendragon.ideasonboard.com>
 <164563575394.4066078.17104997030535169083@Monstersaurus>
 <7163f30b-6496-5762-0d9d-96834fb7452d@ideasonboard.com>
In-Reply-To: <7163f30b-6496-5762-0d9d-96834fb7452d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/08/2022 16:02, Tomi Valkeinen wrote:
> Hi,
> 
> On 23/02/2022 19:02, Kieran Bingham wrote:
>> Quoting Laurent Pinchart (2022-02-23 16:25:28)
>>> Hello,
>>>
>>> On Wed, Feb 23, 2022 at 04:17:22PM +0000, Kieran Bingham wrote:
>>>> Quoting Laurent Pinchart (2021-12-29 23:44:29)
>>>>> On Sat, Dec 25, 2021 at 09:31:51AM +0300, Nikita Yushchenko wrote:
>>>>>> Hotplug events reported by bridge drivers over 
>>>>>> drm_bridge_hpd_notify()
>>>>>> get ignored unless somebody calls drm_bridge_hpd_enable(). When the
>>>>>> connector for the bridge is bridge_connector, such a call is done 
>>>>>> from
>>>>>> drm_bridge_connector_enable_hpd().
>>>>>>
>>>>>> However drm_bridge_connector_enable_hpd() is never called on init 
>>>>>> paths,
>>>>>> documentation suggests that it is intended for suspend/resume paths.
>>>>>
>>>>> Hmmmm... I'm in two minds about this. The problem description is
>>>>> correct, but I wonder if HPD should be enabled unconditionally 
>>>>> here, or
>>>>> if this should be left to display drivers to control.
>>>>> drivers/gpu/drm/imx/dcss/dcss-kms.c enables HPD manually at init time,
>>>>> other drivers don't.
>>>>>
>>>>> It feels like this should be under control of the display controller
>>>>> driver, but I can't think of a use case for not enabling HPD at init
>>>>> time. Any second opinion from anyone ?
>>>>
>>>> This patch solves an issue I have where I have recently enabled HPD on
>>>> the SN65DSI86, but without this, I do not get calls to my 
>>>> .hpd_enable or
>>>> .hpd_disable hooks that I have added to the ti_sn_bridge_funcs.
>>>>
>>>> So it needs to be enabled somewhere, and this seems reasonable to me?
>>>> It's not directly related to the display controller - as it's a factor
>>>> of the bridge?
>>>>
>>>> On Falcon-V3U with HPD additions to SN65DSI86:
>>>> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>
>>> If you think this is right, then
>>>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> I do, and at the very least it works for me, and fixes Nikita's issue so
>> to me that's enough for:
> 
> So who disables the HPD now?
> 
> Is the drm_bridge_connector_enable_hpd & 
> drm_bridge_connector_disable_hpd documentation now wrong as they talk 
> about suspend/resume handlers?

To give more context, currently omapdrm enables the HPDs at init time 
and disables them at remove time. With this patch, the HPDs are enabled 
twice, leading to a WARN.

imx and msm drivers also seem to call drm_bridge_connector_enable_hpd(), 
so I would guess those also WARN with this patch.

Afaics, this patch alone is broken, as it just disregards the drivers 
that already enable the HPD, and also as it doesn't handle the disabling 
of the HPD, or give any guidelines on how the drivers should now manage 
the HPD.

My suggestion is to revert this one.

  Tomi
