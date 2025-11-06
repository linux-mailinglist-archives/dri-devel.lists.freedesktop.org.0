Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B8BC3D12C
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 19:31:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CD510E9AE;
	Thu,  6 Nov 2025 18:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H5aYtNzS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FFC10E9AE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 18:31:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 115AD42A2B;
 Thu,  6 Nov 2025 18:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5977CC4CEFB;
 Thu,  6 Nov 2025 18:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762453898;
 bh=70HnRDx3FkZUD2hlC+mCI8rhN3NqCBxqmvVYvxqXTD8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=H5aYtNzSRTaTzOKqBlTAo1EwKXonT6gfzejA8KL9YM12/Q/qiABcWJd6z8/B7gqy4
 OuNY3zS7JM4a41zlbBMleiCiX08DJVGH1h5tjnKvGpASZBLLxxCBMAuY4DODtdNbBY
 BOxho5bNqlvqtuCYk7/SNEMPvNqVpuhPDyzEtQ7i1R702AXhzLNIDcq1vXK5B5LSSN
 kuRJ2gQmBb4Y8hOG6JLKGHiU7HCLenjO9bjsQnLI/IKIxZgAtFmuq7XOSO+Y5/XCXB
 H1C+mn/QlLepKfgPqTnkT+EKXiuGIr0I9YBPF7z6nT+gDFE8wlNPyWIwvm6gVUyP1N
 ByRsmcBtVUdjg==
Message-ID: <2dcb4668-2c4d-4c73-9805-1af1338c9e7d@kernel.org>
Date: Thu, 6 Nov 2025 12:31:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Treat power-off failure as unrecoverable
 error
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251106180521.1095218-1-lizhi.hou@amd.com>
 <d21ece5b-d27b-447f-8a8e-5d672fa0c473@amd.com>
 <978dcea6-4d25-3b33-695a-632a9f58884c@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <978dcea6-4d25-3b33-695a-632a9f58884c@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/6/25 12:19 PM, Lizhi Hou wrote:
> 
> On 11/6/25 10:12, Mario Limonciello wrote:
>> On 11/6/25 12:05 PM, Lizhi Hou wrote:
>>> Failing to set power off indicates an unrecoverable hardware or firmware
>>> error. Update the driver to treat such a failure as a fatal condition
>>> and stop further operations that depend on successful power state
>>> transition.
>>>
>>> This prevents undefined behavior when the hardware remains in an
>>> unexpected state after a failed power-off attempt.
>>>
>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>
>> Presumably all versions of hardware in the wild can handle receiving a 
>> power off command if they're already powered off?
> 
> Yes for the aie2 platforms. This was verified by xdna-driver pipeline 
> tests.
> 
> 

OK LGTM then.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> Lizhi
> 
>>
>>> ---
>>>   drivers/accel/amdxdna/aie2_smu.c | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/ 
>>> amdxdna/aie2_smu.c
>>> index 11c0e9e7b03a..bd94ee96c2bc 100644
>>> --- a/drivers/accel/amdxdna/aie2_smu.c
>>> +++ b/drivers/accel/amdxdna/aie2_smu.c
>>> @@ -147,6 +147,16 @@ int aie2_smu_init(struct amdxdna_dev_hdl *ndev)
>>>   {
>>>       int ret;
>>>   +    /*
>>> +     * Failing to set power off indicates an unrecoverable hardware or
>>> +     * firmware error.
>>> +     */
>>> +    ret = aie2_smu_exec(ndev, AIE2_SMU_POWER_OFF, 0, NULL);
>>> +    if (ret) {
>>> +        XDNA_ERR(ndev->xdna, "Access power failed, ret %d", ret);
>>> +        return ret;
>>> +    }
>>> +
>>>       ret = aie2_smu_exec(ndev, AIE2_SMU_POWER_ON, 0, NULL);
>>>       if (ret) {
>>>           XDNA_ERR(ndev->xdna, "Power on failed, ret %d", ret);
>>

