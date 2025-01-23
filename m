Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A634CA1ADBC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 01:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B873910E03A;
	Fri, 24 Jan 2025 00:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="BMuauh09";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 530 seconds by postgrey-1.36 at gabe;
 Fri, 24 Jan 2025 00:05:32 UTC
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com
 [91.218.175.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9746310E03A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 00:05:32 +0000 (UTC)
Message-ID: <11b81c8b-5ef1-470c-836a-a436ecadf0f4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1737676594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nKnjB9QFtA5GWFQs3FvapprWdMQNbXukoRejQDs+ZtA=;
 b=BMuauh09Hah9j32wLPh8Uc9gIYcPh7uft6ysJVcYGJQE1XqW7FREugCabFu3MVWHK8Jipy
 HROYK1a2b0T4NyZ/Cd1ECDmUPICsf1zpRCmHYfqyqUh7OZoSCTheJWqIonXfv0i5IVhh+R
 sDqWwoatdZG2QNpOmyPa1TZW10vCAM4=
Date: Thu, 23 Jan 2025 18:56:29 -0500
MIME-Version: 1.0
Subject: Re: [PATCH next] drm: zynqmp_dp: Unlock on error in
 zynqmp_dp_bridge_atomic_enable()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <b4042bd9-c943-4738-a2e1-8647259137c6@stanley.mountain>
 <20241112052754.GB21062@pendragon.ideasonboard.com>
 <37be000a-3ef8-4df4-aefa-b4d73487ad27@linux.dev>
 <20241112164305.GA24067@pendragon.ideasonboard.com>
 <5c2c6883-d81a-4869-9f32-48d23c0728ea@linux.dev>
Content-Language: en-US
In-Reply-To: <5c2c6883-d81a-4869-9f32-48d23c0728ea@linux.dev>
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

On 11/12/24 12:22, Sean Anderson wrote:
> On 11/12/24 11:43, Laurent Pinchart wrote:
>> On Tue, Nov 12, 2024 at 09:41:58AM -0500, Sean Anderson wrote:
>>> On 11/12/24 00:27, Laurent Pinchart wrote:
>>> > Hi Dan,
>>> > 
>>> > Thank you for the patch.
>>> > 
>>> > On Mon, Nov 11, 2024 at 12:06:10PM +0300, Dan Carpenter wrote:
>>> >> We added some locking to this function, but accidentally forgot to unlock
>>> >> if zynqmp_dp_mode_configure() failed.  Use a guard lock to fix it.
>>> >> 
>>> >> Fixes: a7d5eeaa57d7 ("drm: zynqmp_dp: Add locking")
>>> >> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> > 
>>> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> > 
>>> > Sean, how about replacing all the mutex_lock()/mutex_unlock() calls
>>> > you've added in a7d5eeaa57d7 with guards ?
>>> 
>>> I have no objection to that.
>> 
>> Would you send a patch ? Otherwise I can do it.
>> 
> 
> I can send a patch, but it will not be for a week or two.
> 
> --Sean

Just following up on this; will the above patched be merged? I would
prefer to keep the bugfix and the conversion separate.

--Sean
