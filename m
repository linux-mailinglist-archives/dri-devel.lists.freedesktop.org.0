Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59966A2B375
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 21:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB2C10E30A;
	Thu,  6 Feb 2025 20:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="pBG5+4mV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com
 [91.218.175.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E34910E30A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 20:37:54 +0000 (UTC)
Message-ID: <c10a8643-6f6f-4428-91a7-e7f5c92a3f58@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1738874272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/WyK6vRoG5SvaOVIStlOKOP4rX2lqtxKCb+Y8Y6C15k=;
 b=pBG5+4mVjB1wCwVfamE6jbu2Sp4OgvrtK4kKPXsOUOYbYZ47J0onJi1xzn5vqNhXDlyRAY
 rqs93SbLUS5C4BHgrpb7jrGORPH9aeagOaEDLkJ78/XP+gcJHXMaqfjexUnQQd6QPBd0gy
 39hovJ3GT+kdg0GIvNOQlePzERbQnXU=
Date: Thu, 6 Feb 2025 15:37:48 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] drm: zynqmp_dp: Use scope-based mutex helpers
To: Bart Van Assche <bvanassche@acm.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "open list:DRM DRIVERS FOR XILINX" <dri-devel@lists.freedesktop.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Michal Simek
 <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20250206194117.1496245-1-sean.anderson@linux.dev>
 <20250206194117.1496245-3-sean.anderson@linux.dev>
 <373d62da-810f-492c-af2f-53b32cc90b33@acm.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <373d62da-810f-492c-af2f-53b32cc90b33@acm.org>
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

On 2/6/25 15:31, Bart Van Assche wrote:
> On 2/6/25 11:41 AM, Sean Anderson wrote:
>>   static int zynqmp_dp_enhanced_set(void *data, u64 val)
>>   {
>>       struct zynqmp_dp *dp = data;
>> -    int ret = 0;
>>   -    mutex_lock(&dp->lock);
>> +    guard(mutex)(&dp->lock);
>>       dp->test.enhanced = val;
>>       if (dp->test.active)
>> -        ret = zynqmp_dp_test_setup(dp);
>> -    mutex_unlock(&dp->lock);
>> +        return zynqmp_dp_test_setup(dp);
>>   -    return ret;
>> +    return 0;
>>   }
> 
> Has it been considered to combine the two return statements into one
> with the ternary operator (?:)?

I didn't consider it, but the line is short enough that I can add it.

>> @@ -2053,7 +2039,8 @@ static ssize_t zynqmp_dp_custom_read(struct file *file, char __user *user_buf,
>>           return ret;
>>         mutex_lock(&dp->lock);
>> -    ret = simple_read_from_buffer(user_buf, count, ppos, &dp->test.custom,
>> +    ret = simple_read_from_buffer(user_buf, count, ppos,
>> +                      &dp->test.custom,
>>                         sizeof(dp->test.custom));
> 
> This change has not been mentioned in the patch description and is not
> related to the other changes in this patch?

I think I made this change while refactoring, but it turned out not to
be necessary. I will remove it for the next revision.

--Sean
