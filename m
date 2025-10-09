Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDB6BC91EB
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 14:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B009410EA2D;
	Thu,  9 Oct 2025 12:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 56BB910EA2D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 12:51:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3C51176A;
 Thu,  9 Oct 2025 05:51:14 -0700 (PDT)
Received: from [10.1.34.29] (e122027.cambridge.arm.com [10.1.34.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0CA93F66E;
 Thu,  9 Oct 2025 05:51:20 -0700 (PDT)
Message-ID: <f3b04a09-561f-4eb6-9730-7084e5b9697b@arm.com>
Date: Thu, 9 Oct 2025 13:51:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Ensure MCU is disabled on suspend
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Ketil Johnsen <ketil.johnsen@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251008105112.4077015-1-ketil.johnsen@arm.com>
 <d526aaed-b29d-4e19-aab4-aa735282055e@arm.com>
 <20251009134544.4502df0d@fedora>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251009134544.4502df0d@fedora>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/10/2025 12:45, Boris Brezillon wrote:
> On Thu, 9 Oct 2025 11:29:14 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 08/10/2025 11:51, Ketil Johnsen wrote:
>>> Currently the Panthor driver needs the GPU to be powered down
>>> between suspend and resume. If this is not done, then the
>>> MCU_CONTROL register will be preserved as AUTO, which again will
>>> cause a premature FW boot on resume. The FW will go directly into
>>> fatal state in this case.
>>>
>>> This case needs to be handled as there is no guarantee that the
>>> GPU will be powered down after the suspend callback on all platforms.
>>>
>>> The fix is to call panthor_fw_stop() in "pre-reset" path to ensure
>>> the MCU_CONTROL register is cleared (set DISABLE). This matches
>>> well with the already existing call to panthor_fw_start() from the
>>> "post-reset" path.
>>>
>>> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>  
>>
>> Reviewed-by: Steven Price <steven.price@arm.com>
>>
>> Do we need a Fixes tag? Or is this only actually an issue on newer GPUs?
> 
> I think it'd be good to have a Fixes tag, if it's known to be the right
> thing to do after a HALT, even if it's not needed on the GPUs currently
> supported by this driver.

Yeah, at the very least it won't do any harm. I'll add a:

Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")

And merge this to drm-misc-fixes.

Thanks,
Steve

