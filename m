Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC0DB0D497
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 10:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5CF10E62B;
	Tue, 22 Jul 2025 08:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B383610E62B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 08:28:09 +0000 (UTC)
Message-ID: <60257b86-bba4-4f52-a5e4-1e4caeb3412f@lankhorst.se>
Date: Tue, 22 Jul 2025 10:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Remove lockdep_assert_irqs_disabled()
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
References: <20250715165919.33754-1-dev@lankhorst.se>
 <f14e9187-e3b1-494d-b04f-9e7875a17e5a@linux.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <f14e9187-e3b1-494d-b04f-9e7875a17e5a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hey,

Den 2025-07-22 kl. 09:53, skrev Jacek Lawrynowicz:
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Thanks, pushed to misc-next.

Best regards,
~Maarten
 
> On 7/15/2025 6:59 PM, Maarten Lankhorst wrote:
>> This breaks on PREEMPT_RT, and should be unneeded since
>> lockdep can track irq disabled status itself.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  drivers/accel/ivpu/ivpu_ipc.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
>> index 39f83225c1815..5f00809d448af 100644
>> --- a/drivers/accel/ivpu/ivpu_ipc.c
>> +++ b/drivers/accel/ivpu/ivpu_ipc.c
>> @@ -141,7 +141,6 @@ ivpu_ipc_rx_msg_add(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
>>  	struct ivpu_ipc_rx_msg *rx_msg;
>>  
>>  	lockdep_assert_held(&ipc->cons_lock);
>> -	lockdep_assert_irqs_disabled();
>>  
>>  	rx_msg = kzalloc(sizeof(*rx_msg), GFP_ATOMIC);
>>  	if (!rx_msg) {
> 

