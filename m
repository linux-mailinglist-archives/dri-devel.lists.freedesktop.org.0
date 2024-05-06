Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B67F8BD0DA
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 16:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFE51120CC;
	Mon,  6 May 2024 14:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="egkMcHdm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com
 [91.218.175.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6820410F94F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 14:57:23 +0000 (UTC)
Message-ID: <97811bfe-a1fb-419c-a148-74e3d84aa0e2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715007440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UNOU17a7+9y01wIiMXK3gS5QhQyxMPKDGnxAA5DiTWg=;
 b=egkMcHdmBidVkS8JLCA1vU+/AjS9tHSraXTHXo7UrU+0zJAT3oxkNukxv1Ni4xKqK0j/zg
 qfUqyw85DMilp4AFoWiSfC8ec1d41ydAwJN2n7R9h9oD+9L20d597GBfZJJ6pS3FyGl0F3
 TSGRvYRCyv9jt0SWgqQGDw6Hlaojwok=
Date: Mon, 6 May 2024 10:57:17 -0400
MIME-Version: 1.0
Subject: Re: [BUG] drm: zynqmp_dp: Lockup in zynqmp_dp_bridge_detect when
 device is unbound
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <4d8f4c9b-2efb-4774-9a37-2f257f79b2c9@linux.dev>
 <20240504122118.GB24548@pendragon.ideasonboard.com>
 <20240506-charcoal-griffin-of-tact-174dde@houat>
 <20240506073531.GA10260@pendragon.ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20240506073531.GA10260@pendragon.ideasonboard.com>
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

On 5/6/24 03:35, Laurent Pinchart wrote:
> On Mon, May 06, 2024 at 09:29:36AM +0200, Maxime Ripard wrote:
>> Hi Laurent, Sean,
>> 
>> On Sat, May 04, 2024 at 03:21:18PM GMT, Laurent Pinchart wrote:
>> > On Fri, May 03, 2024 at 05:54:32PM -0400, Sean Anderson wrote:
>> > > I have discovered a bug in the displayport driver on drm-misc-next. To
>> > > trigger it, run
>> > > 
>> > > echo fd4a0000.display > /sys/bus/platform/drivers/zynqmp-dpsub/unbind
>> > > 
>> > > The system will become unresponsive and (after a bit) splat with a hard
>> > > LOCKUP. One core will be unresponsive at the first zynqmp_dp_read in
>> > > zynqmp_dp_bridge_detect.
>> > > 
>> > > I believe the issue is due the registers being unmapped and the block
>> > > put into reset in zynqmp_dp_remove instead of zynqmp_dpsub_release.
>> > 
>> > That is on purpose. Drivers are not allowed to access the device at all
>> > after .remove() returns.
>> 
>> It's not "on purpose" no. Drivers indeed are not allowed to access the
>> device after remove, but the kernel shouldn't crash. This is exactly
>> why we have drm_dev_enter / drm_dev_exit.
> 
> I didn't mean the crash was on purpose :-) It's the registers being
> unmapped that is, as nothing should touch those registers after
> .remove() returns.

OK, so then we need to have some kind of flag in the driver or in the drm
subsystem so we know not to access those registers.

--Sean

