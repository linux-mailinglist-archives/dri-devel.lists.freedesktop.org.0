Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9C84D4653
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 12:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8208A10E2A1;
	Thu, 10 Mar 2022 11:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9A910E2A1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 11:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HgKljzHhQ4Bf002QVjCn/emjPcGpta1nhggM0gHSyjQ=; b=htnOpkhPIaijhijq5CEJBkjcCV
 IMvFMbpwAEYKDlGDM2oTzpiIwVDEFpE2Z23MILnYuHr/91U+/akFfZZ1i7iqr51r1+xdpKQooOtw4
 lAyPY8alKL8HOAwB3jmFCGF5t9Z+fDdkP+z5l1sy21q3fUzD0LCnXtECKPBsAYQIwmgD3gJh1aWkA
 KxBt5tUnBwNdhvbBXoH6HsoVa1ifWS44vPZImuSwiErhgsl7IrdUp9bqcfkQJdKtli+g6nCa5/2YB
 y5hUc7eLAMWNaMnUWzRDZjs2d/tRY8hE3pDBtPUQbgV9N2M3DGZxX1xVjLv0nEkTxDYqd0acgi2ZH
 E25ra4TQ==;
Received: from ip184.dynamic.igalia.com ([192.168.10.184])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nSHNJ-0005ve-6d; Thu, 10 Mar 2022 12:54:33 +0100
Message-ID: <8e709425-b79e-0255-9b5c-3a4e75ade7dc@igalia.com>
Date: Thu, 10 Mar 2022 12:54:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/vc4: add tracepoints for CL submissions
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Melissa Wen <mwen@igalia.com>
References: <20220201212651.zhltjmaokisffq3x@mail.igalia.com>
 <20220225161126.6n7puj5p7saf57u4@houat>
 <20220301145826.6ofizv226oqzesed@mail.igalia.com>
 <20220310111244.fylou5ckcb2ilexm@houat>
From: Chema Casanova <jmcasanova@igalia.com>
Organization: Igalia
In-Reply-To: <20220310111244.fylou5ckcb2ilexm@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

El 10/3/22 a las 12:12, Maxime Ripard escribió:
> On Tue, Mar 01, 2022 at 01:58:26PM -0100, Melissa Wen wrote:
>> On 02/25, Maxime Ripard wrote:
>>> Hi Melissa,
>>>
>>> On Tue, Feb 01, 2022 at 08:26:51PM -0100, Melissa Wen wrote:
>>>> Trace submit_cl_ioctl and related IRQs for CL submission and bin/render
>>>> jobs execution. It might be helpful to get a rendering timeline and
>>>> track job throttling.
>>>>
>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> I'm not really sure what to do about this patch to be honest.
>>>
>>> My understanding is that tracepoints are considered as userspace ABI,
>>> but I can't really judge whether your traces are good enough or if it's
>>> something that will bit us some time down the road.
>> Thanks for taking a look at this patch.
>>
>> So, I followed the same path of tracing CL submissions on v3d. I mean,
>> tracking submit_cl ioctl, points when a job (bin/render) starts it
>> execution, and irqs of completion (bin/render job). We used it to
>> examine job throttling when running Chromium and, therefore, in addition
>> to have the timeline of jobs execution, I show some data submitted in
>> the ioctl to make connections. I think these tracers might be useful for
>> some investigation in the future, but I'm also not sure if all data are
>> necessary to be displayed.
> Yeah, I'm sure that it's useful :)
>
> I don't see anything wrong with that patch, really. What I meant is that
> I don't really have the experience to judge if there's anything wrong in
> the first place :)
>
> If you can get someone with more experience with the v3d driver (Emma,
> Iago maybe?) I'll be definitely be ok merging that patch

I've checked this patch and I've been using these tracepoints.
They have been working properly.

Reviewed-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>

Regards,

Chema Casanova

