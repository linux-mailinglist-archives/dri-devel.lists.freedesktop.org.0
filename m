Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F66A300DD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 02:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAC110E62F;
	Tue, 11 Feb 2025 01:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.213])
 by gabe.freedesktop.org (Postfix) with SMTP id BA16B10E62F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 01:45:03 +0000 (UTC)
Received: from [172.30.20.101] (unknown [180.167.10.98])
 by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id BFB24602A71E9; 
 Tue, 11 Feb 2025 09:44:58 +0800 (CST)
Message-ID: <23763bba-5524-fe6d-4b6c-53ed2af12e82@nfschina.com>
Date: Tue, 11 Feb 2025 09:44:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] accel/amdxdna: Add missing include linux/slab.h
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, min.ma@amd.com,
 lizhi.hou@amd.com, ogabbay@kernel.org
Cc: quic_jhugo@quicinc.com, George.Yang@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Content-Language: en-US
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <43eb87f7-0d47-43a7-b34a-9180f50de3b2@linux.intel.com>
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

On 2025/2/10 17:43, Jacek Lawrynowicz wrote:

> Hi,
>
> please move the header to the include block above an keep it sorted:
> #include <linux/iopoll.h>
> -->#include <linux/slab.h><--
> #include <linux/xarray.h>

Ok, I will send a v2 patch for this.

Su Hui

> On 2/8/2025 9:05 AM, Su Hui wrote:
>> When compiling without CONFIG_IA32_EMULATION, there are some errors:
>>
>> drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘mailbox_release_msg’:
>> drivers/accel/amdxdna/amdxdna_mailbox.c:197:2: error: implicit declaration
>> of function ‘kfree’.
>>    197 |  kfree(mb_msg);
>>        |  ^~~~~
>> drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘xdna_mailbox_send_msg’:
>> drivers/accel/amdxdna/amdxdna_mailbox.c:418:11: error:implicit declaration
>> of function ‘kzalloc’.
>>    418 |  mb_msg = kzalloc(sizeof(*mb_msg) + pkg_size, GFP_KERNEL);
>>        |           ^~~~~~~
>>
>> Add the missing include.
>>
>> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>>   drivers/accel/amdxdna/amdxdna_mailbox.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
>> index 814b16bb1953..80b4b20addd6 100644
>> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
>> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
>> @@ -12,6 +12,7 @@
>>   
>>   #define CREATE_TRACE_POINTS
>>   #include <trace/events/amdxdna.h>
>> +#include <linux/slab.h>
>>   
>>   #include "amdxdna_mailbox.h"
>>   
