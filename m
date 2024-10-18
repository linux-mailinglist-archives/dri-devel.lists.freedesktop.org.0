Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A639A40F4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 16:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A5810E934;
	Fri, 18 Oct 2024 14:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9C64810E14F;
 Fri, 18 Oct 2024 14:18:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEF09497;
 Fri, 18 Oct 2024 07:19:27 -0700 (PDT)
Received: from [10.57.78.54] (unknown [10.57.78.54])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E86E3F58B;
 Fri, 18 Oct 2024 07:18:56 -0700 (PDT)
Message-ID: <545e23ed-85fb-48f1-8d34-58c5f0b6506e@arm.com>
Date: Fri, 18 Oct 2024 15:20:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/gpu: Check the status of registration to PM QoS
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org,
 quic_abhinavk@quicinc.com, marijn.suijten@somainline.org, airlied@gmail.com
References: <20241018111811.3534385-1-lukasz.luba@arm.com>
 <dpwmookr5owd43efowmnoxbtbzstvezgczpbzwxb5rwu3h3zaf@luim5srcbo6f>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <dpwmookr5owd43efowmnoxbtbzstvezgczpbzwxb5rwu3h3zaf@luim5srcbo6f>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/18/24 13:02, Dmitry Baryshkov wrote:
> On Fri, Oct 18, 2024 at 12:18:11PM +0100, Lukasz Luba wrote:
>> There is a need to check the returned value of the registration function.
> 
> Why?

The question can be:
why this driver doesn't check errors from frameworks during the
registration?

Is it a generic practice in that code (I hope not)?

When you check the API doc you will see that this fwk can fail and
return some error and the other functions in driver shouldn't
assume blindly that it was OK.

All other places in the kernel check that return value from
the PM QoS framework.

> 
>> In case of returned error, print that and stop the init process.
>>
>> Fixes: 7c0ffcd40b16 ("drm/msm/gpu: Respect PM QoS constraints")
>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
>> ---
>>   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
> 
