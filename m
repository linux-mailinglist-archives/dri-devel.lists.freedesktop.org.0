Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6622CBF912
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 20:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F74110E4E3;
	Mon, 15 Dec 2025 19:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J7MPALOt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8126310E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 19:38:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5982D60007;
 Mon, 15 Dec 2025 19:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D15C4CEF5;
 Mon, 15 Dec 2025 19:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765827508;
 bh=hIeek/+0MdWQYlZcXnKls8JnXuBUgxFzR+zkIb3RYVY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=J7MPALOtEoP6CPsFsGZ8RxmOdwNYUHES4fyB76hpzHVdnmKLCGwARMkjhbMHT+BeZ
 maqwZps0U34S5Q8IbRcfi9wods50ZlyABqOLwDgklKjVRVm5YTy1RcqYBpqvhj6CpV
 RpK/CQWBuXhpuo0jsx0azznmsPeVorqB39Ekwwzxb7cY1dm8Le8K6J1eu3suuCN3E4
 4xvq5FnGmn7d2mIjzyX6YyMuECMeS+xHz3FH/mT8OqUd0t9BpHU4VV/kuxL8IbEuzf
 fyQwoGCkLcLh7zoqtgImD+naJskPUeey+rVkzvlaUI60lmG+PwP00HtNJgLzU9V2aC
 FTZ4g5kBZR7Ng==
Message-ID: <c1957c6f-1201-402b-96be-31416d2de84c@kernel.org>
Date: Mon, 15 Dec 2025 13:38:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Block running under a hypervisor
To: Lizhi Hou <lizhi.hou@amd.com>, mario.limonciello@amd.com,
 mamin506@gmail.com, ogabbay@kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <20251213054513.87925-1-superm1@kernel.org>
 <bb8065d2-7ab9-ac1f-cb7d-81cad9a2f7c9@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <bb8065d2-7ab9-ac1f-cb7d-81cad9a2f7c9@amd.com>
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

On 12/13/25 1:45 PM, Lizhi Hou wrote:
> On 12/12/25 21:44, Mario Limonciello (AMD) wrote:
>> SVA support is required, which isn't configured by hypervisor
>> solutions.
> 
> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
> 
> I think it is because aie2 can not load firmware in hypervisor solutions.
> 

Thanks. Pushed to drm-misc-fixes.

7bbf6d15e935a accel/amdxdna: Block running under a hypervisor

> 
> Lizhi
> 
>>
>> Closes: https://github.com/QubesOS/qubes-issues/issues/10275
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4656
>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> ---
>>   drivers/accel/amdxdna/aie2_pci.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/ 
>> aie2_pci.c
>> index ceef1c502e9e2..d892b412e4c0e 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -17,6 +17,7 @@
>>   #include <linux/iopoll.h>
>>   #include <linux/pci.h>
>>   #include <linux/xarray.h>
>> +#include <asm/hypervisor.h>
>>   #include "aie2_msg_priv.h"
>>   #include "aie2_pci.h"
>> @@ -508,6 +509,11 @@ static int aie2_init(struct amdxdna_dev *xdna)
>>       unsigned long bars = 0;
>>       int i, nvec, ret;
>> +    if (!hypervisor_is_type(X86_HYPER_NATIVE)) {
>> +        XDNA_ERR(xdna, "Running under hypervisor not supported");
>> +        return -EINVAL;
>> +    }
>> +
>>       ndev = drmm_kzalloc(&xdna->ddev, sizeof(*ndev), GFP_KERNEL);
>>       if (!ndev)
>>           return -ENOMEM;

