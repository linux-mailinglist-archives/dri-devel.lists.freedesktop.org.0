Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81656B50133
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 17:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69EF610E797;
	Tue,  9 Sep 2025 15:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="DKXGzQ4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Mon, 08 Sep 2025 13:48:12 UTC
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DAD10E511;
 Mon,  8 Sep 2025 13:48:12 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588Dc8Qw3874616;
 Mon, 8 Sep 2025 08:38:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1757338688;
 bh=awQQu3rGBPmoT6Z/hGfapL01e4DEGu0HstmwbMkPvLU=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=DKXGzQ4JZXj5nh9aw1efczKmxuluwqOTnBdNNu1xswTJAuf+9OdClDg6tBuz6yiuP
 ipsnzqWWCdbPDcHiEqX9hSKo7jNzc5uFA3ghINlV3d+5/58NXWd5D5jKVQ9FoI2e3L
 037rlkYGHHWE4lyXMzCAIL3CHQz56skk9ZQdXtic=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588Dc7r93806024
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 8 Sep 2025 08:38:07 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 08:38:07 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20; Mon, 8 Sep
 2025 08:38:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 08:38:07 -0500
Received: from [128.247.81.40] (dtmz023nlv.dhcp.ti.com [128.247.81.40])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588Dc7Ch973710;
 Mon, 8 Sep 2025 08:38:07 -0500
Message-ID: <51cdf832-95a2-47bf-bc27-d43097883701@ti.com>
Date: Mon, 8 Sep 2025 08:38:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers: gpu: drm: msm: registers: improve
 reproducibility
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
CC: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
 <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
 <CAF6AEGvJnSiyUJvBPusBZ+mriiP_vRiAgZnTyLSseu8Sdf9PXA@mail.gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CAF6AEGvJnSiyUJvBPusBZ+mriiP_vRiAgZnTyLSseu8Sdf9PXA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Approved-At: Tue, 09 Sep 2025 15:29:21 +0000
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



On 9/6/2025 6:24 PM, Rob Clark wrote:
> On Sat, May 24, 2025 at 10:15 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Sat, May 24, 2025 at 09:25:37PM +0530, Viswanath Kraleti wrote:
>>> From: Ryan Eatmon <reatmon@ti.com>
>>>
>>> The files generated by gen_header.py capture the source path to the
>>> input files and the date.  While that can be informative, it varies
>>> based on where and when the kernel was built as the full path is
>>> captured.
>>>
>>> Since all of the files that this tool is run on is under the drivers
>>> directory, this modifies the application to strip all of the path before
>>> drivers.  Additionally it prints <stripped> instead of the date.
>>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
>>> ---
>>> The files generated by gen_header.py include the source path to the
>>> input files and the build date. While this information can be useful,
>>> it inadvertently exposes build system configuration details in the
>>> binaries. This hinders binary reproducibility, as the output will
>>> vary if the build environment changes.
>>>
>>> This change was originally submitted to the linux-yocto-dev kernel [1]
>>> to address binary reproducibility QA errors. However, the fix is generic
>>> enough to be applicable to the mainline kernel and would benefit other
>>> distributions as well. So proposing it here for broader inclusion.
>>>
>>> [1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=f36faf0f9f8d8f5b4c43a68e5c6bd83a62253140
>>> ---
>>> Changes in v2:
>>> - Corrected author id
>>> - Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com
>>> ---
>>>   drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
>>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>
>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>
>> Rob, WDYT?
> 
> I'm revisiting this one, in the context of trying to re-sync
> gen_header.py with mesa.. but it is only changing the contents of
> comments, so it's not quite clear to me how this ends up mattering for
> binary reproducibility.

The reason it matters is that for Yocto, the generated header file is 
identified as a file that needs to be installed into the sysroot.  All 
files going into the sysroot are checked to make sure they do not 
contain dates and/or paths to the build directory contained within. 
Since this is a generated header file that is included in the sysroot we 
needed to strip out the path and date.

The idea for the reproducible builds are that the same files on a 
different a machine at a different time should produce 100% identical 
files.  Including paths and dates violates that tenet.

Hope that helps explain why we needed this.  So long as the 
gen_header.py is being called to generate header files then we need to 
maintain the reproducible aspect.


> That said, since the generated files are no longer checked in to mesa
> or the kernel, we could probably just drop all of this if it mattered.
> 
> BR,
> -R

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

