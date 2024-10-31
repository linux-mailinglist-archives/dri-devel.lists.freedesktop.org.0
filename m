Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D2E9B7E89
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 16:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B99610E8CE;
	Thu, 31 Oct 2024 15:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="g3TCnlZo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133E510E8CE
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 15:31:52 +0000 (UTC)
Message-ID: <664a1251-203d-4d29-86c4-6edd36c23eb9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1730388710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1FsbTOlKbKVtI/UbvwBD7+VePpEQEZip+EtLwmeq1hc=;
 b=g3TCnlZooYIDOinnZd6O2mliVhJVxCI4EWURNoQ5SGuegjVoMZka6XQCMwC2VcreiTLoSY
 eKw6S5DC7gG6/cOqbaMg/J77oLm0vCF3h59a+2MNz0fRnrk7nVaSayVvXfKy1mZFGA99pq
 rbDWupTLmeS5G5KTPttnp5qQ+7mK8/A=
Date: Thu, 31 Oct 2024 23:31:41 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/bridge: Fix assignment of the of_node of the
 parent to aux bridge
To: Johan Hovold <johan@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
 <172951608323.1285208.3162107667310691864.b4-ty@linaro.org>
 <230b5910-6790-44cb-90ed-222bee89054d@linux.dev>
 <c2a4cc3a-2ffc-46f3-8636-238cd561f7aa@linaro.org>
 <ZyOOEGsnjYreKQN8@hovoldconsulting.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <ZyOOEGsnjYreKQN8@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,

On 2024/10/31 22:02, Johan Hovold wrote:
> On Thu, Oct 31, 2024 at 01:31:47PM +0100, Neil Armstrong wrote:
>> On 30/10/2024 15:49, Sui Jingfeng wrote:
>>> On 2024/10/21 21:08, Neil Armstrong wrote:
>>>> On Fri, 18 Oct 2024 15:49:34 +0300, Abel Vesa wrote:
>>>>> The assignment of the of_node to the aux bridge needs to mark the
>>>>> of_node as reused as well, otherwise resource providers like pinctrl will
>>>>> report a gpio as already requested by a different device when both pinconf
>>>>> and gpios property are present.
>>>>> Fix that by using the device_set_of_node_from_dev() helper instead.
>>>>>
>>>>>
>>>>> [...]
>>>> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)
>>>
>>> It's quite impolite to force push patches that still under reviewing,
>>> this prevent us to know what exactly its solves.
>> It's quite explicit.
> It's still disrespectful and prevents reviewers' work from being
> acknowledged as I told you off-list when you picked up the patch.
>
> You said it would not happen again, and I had better things to do so I
> let this one pass, but now it seems you insist that you did nothing
> wrong here.
>
> We do development in public and we should have had that discussion in
> public, if only so that no one thinks I'm ok with this.


Yeah, extremely correct, Johan!

While I am really don't know why a child device have to
share the referencing of the OF device node with its parent device?
Is possible to pass a child device node via the platform data to reference?

I means that, in DT systems, the child device can easily
have(find) its own device node to attached.
I'm imagining that it probably should be belong to the USB
connector device node or something like that.

Sorry, I'm confused. I understand that you also might be busy.
I think I probably should go back alone to think for a while.


> Johan

-- 
Best regards,
Sui

