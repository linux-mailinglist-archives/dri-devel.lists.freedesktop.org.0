Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B1E94D6C5
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 21:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1727610E9DE;
	Fri,  9 Aug 2024 19:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="YmRVIDw7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 380 seconds by postgrey-1.36 at gabe;
 Fri, 09 Aug 2024 19:01:31 UTC
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [95.215.58.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BC510E9DE
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 19:01:31 +0000 (UTC)
Message-ID: <98826ab8-856a-4bd6-ae8b-bbfce945bdf4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1723229708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JocOi7P3PjNGxJXi85Ya63UzzmF3ct3nIXqmRfsseYc=;
 b=YmRVIDw7k2/37Z6EOMldslDBm4DczE3AbIQt9+QBJSgTTso7Hoy7CYBO8ID5Nh8CRMQ7RR
 XrGcgKsfmndxddCmO+f1WRhvLFSuFWfKNND0ez9JAsKk2IqPIa3sEJqWedDuPxe+t73UMd
 vwaeYadfizEmSt34bODbewXhiMlsi5E=
Date: Fri, 9 Aug 2024 14:55:02 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v5 00/10] drm: zynqmp_dp: IRQ cleanups and debugfs support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-arm-kernel@lists.infradead.org, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20240503192922.2172314-1-sean.anderson@linux.dev>
 <e5ca9be5-2918-427a-b7eb-28f1915b5d31@ideasonboard.com>
 <5c5aa8ae-75c4-4f0f-ad19-50ad57c61216@linux.dev>
 <f44fd8f1-2e65-4cdd-b6ba-49398f5d8c7c@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <f44fd8f1-2e65-4cdd-b6ba-49398f5d8c7c@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
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

On 8/8/24 08:46, Tomi Valkeinen wrote:
> Hi Sean,
> 
> On 17/06/2024 17:48, Sean Anderson wrote:
>> On 6/17/24 03:47, Tomi Valkeinen wrote:
>>> Hi Sean,
>>>
>>> On 03/05/2024 22:29, Sean Anderson wrote:
>>>> This series cleans up the zyqnmp_dp IRQ and locking situation. Once
>>>> that's done, it adds debugfs support. The intent is to enable compliance
>>>> testing or to help debug signal-integrity issues.
>>>>
>>>> Last time I discussed converting the HPD work(s) to a threaded IRQ. I
>>>> did not end up doing that for this series since the steps would be
>>>>
>>>> - Add locking
>>>> - Move link retraining to a work function
>>>> - Harden the IRQ
>>>> - Merge the works into a threaded IRQ (omitted)
>>>>
>>>> Which with the exception of the final step is the same as leaving those
>>>> works as-is. Conversion to a threaded IRQ can be done as a follow-up.
>>>
>>> I tested this, and the "drm: zynqmp_dp: Convert to a hard IRQ" causes a hang for me when unloading the drivers. Unfortunately I'm not in the condition to debug it at the moment.
>>>
>>> I have picked the first three patches into drm-misc-next, though, to decrease the number of patches in the series a bit. They looked independent and safe enough to apply.
>>
>> Are you running into [1]?
>>
>> --Sean
>>
>> [1] https://lore.kernel.org/dri-devel/4d8f4c9b-2efb-4774-9a37-2f257f79b2c9@linux.dev/
>>
> 
> No. Afaics, it breaks because the irq handler is requested with IRQF_SHARED, and that means the handler can be called at any time. The handler reads DP registers, but the DP IP could already be powered off.
> 
> You'll probably see it easily if you enable CONFIG_DEBUG_SHIRQ, and unload the module or unbind the device.

Ah, looks like I need to use devm_free_irq instead of disable_irq.

And after fixing this, [1] turns up again. I guess I'll take a crack at it...

--Sean

