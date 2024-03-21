Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FF9885D01
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 17:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AF810ED37;
	Thu, 21 Mar 2024 16:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="TGlqxFn8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com
 [91.218.175.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BE410EBC7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 16:08:52 +0000 (UTC)
Message-ID: <76831c1e-216f-430b-bacd-2d50f352e61f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1711037331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nYGs6j1CcJBZpXqqpvnZVExRCl/iMQ6GtORK4GaVepw=;
 b=TGlqxFn8rv4WjNNL+kr5zeS2uvA9xjrL/AHHaAsiK+u4aCpDCFl/lLQwqqfKew/PAgKd6i
 h2BG1OVzI3HWvHRBnzpGgGbl7a2NFHZbuZDP/SUhcfBZxardWlIVB5JgFmrue+WtCjvcwm
 KAII2X78oz7JI4lt6vzOWy7op1WzAyU=
Date: Thu, 21 Mar 2024 12:08:44 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v2 8/8] drm: zynqmp_dp: Add debugfs interface for
 compliance testing
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Michal Simek <michal.simek@amd.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20240319225122.3048400-1-sean.anderson@linux.dev>
 <20240319225122.3048400-9-sean.anderson@linux.dev>
 <7aa16340-6a87-4110-8114-c1b863b100c9@ideasonboard.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <7aa16340-6a87-4110-8114-c1b863b100c9@ideasonboard.com>
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

On 3/20/24 03:49, Tomi Valkeinen wrote:
> On 20/03/2024 00:51, Sean Anderson wrote:
> 
>> +/**
>> + * enum test_pattern - Test patterns for test testing
> 
> "for test testing"? =)
> 
>> @@ -1655,6 +2321,9 @@ static void zynqmp_dp_hpd_irq_work_func(struct work_struct *work)
>>       u8 status[DP_LINK_STATUS_SIZE + 2];
>>       int err;
>>   +    if (READ_ONCE(dp->ignore_hpd))
>> +        return;
>> +
>>       mutex_lock(&dp->lock);
>>       err = drm_dp_dpcd_read(&dp->aux, DP_SINK_COUNT, status,
>>                      DP_LINK_STATUS_SIZE + 2);
> 
> Why do you need READ/WRITE_ONCE() for ignore_hpd?

It's not protected by dp->lock so we don't have to take it for
zynqmp_dp_hpd_work_func. Although maybe we should make a version of
zynqmp_dp_bridge_detect which assumes we already hold the lock.

--Sean
