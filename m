Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C95669184
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD0410E9B6;
	Fri, 13 Jan 2023 08:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F056110E9B6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 08:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673599610; x=1705135610;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3vN+dDWEQ062+4d1PiAsynv7VXvTvFbT9q8UcNY4RYQ=;
 b=WQ8lM28Ed7E7WKdjJEiRJAlw4avEBiuyd8r/UXdYJdL9e1o0qUNjf3G/
 r/rs2P0dbAj8BGi8eAt+CBLnby8qEr652UDDt8mH5xIVSDN0GfR+GDzek
 +542EYXh0WcdOg1nYsKQYLj0AvIQDuL/5o/Ck2hMI3aa7RXihCDTULvUY
 cRGUCtTbwRJMsURWx1I0MQB1TfOkTS8qSko0s4V0jVEEPTbWCZ3wMFvd8
 9V8QIQxx9h8gL2JrvDvd7VwGwOh3Rdc52YITxwhOYx1hzdxg/nRhkiLTd
 WZDMQIOEXdZb6vQe/77kmrB9eacscfRNjr/Ryx9KFsABKj5qDvks3jrcQ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="303645076"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="303645076"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 00:46:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="800533319"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="800533319"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.132.57])
 ([10.249.132.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 00:46:47 -0800
Message-ID: <4a699fdd-cc9e-7a4e-b757-cb52552dc4f8@linux.intel.com>
Date: Fri, 13 Jan 2023 09:46:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 4/7] accel/ivpu: Add IPC driver and JSM messages
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org,
 oded.gabbay@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de
References: <20230109122344.253994-1-jacek.lawrynowicz@linux.intel.com>
 <20230109122344.253994-5-jacek.lawrynowicz@linux.intel.com>
 <6811c853-aaa7-3bf1-c098-d6ca0e875e75@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <6811c853-aaa7-3bf1-c098-d6ca0e875e75@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: andrzej.kacprowski@linux.intel.com,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12.01.2023 19:18, Jeffrey Hugo wrote:
> On 1/9/2023 5:23 AM, Jacek Lawrynowicz wrote:
>> The IPC driver is used to send and receive messages to/from firmware
>> running on the VPU.
>>
>> The only supported IPC message format is Job Submission Model (JSM)
>> defined in vpu_jsm_api.h header.
>>
>> Co-developed-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
>> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
>> Co-developed-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
>> Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> 
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
>> +int ivpu_ipc_irq_handler(struct ivpu_device *vdev)
>> +{
>> +    struct ivpu_ipc_info *ipc = vdev->ipc;
>> +    struct ivpu_ipc_consumer *cons;
>> +    struct ivpu_ipc_hdr *ipc_hdr;
>> +    struct vpu_jsm_msg *jsm_msg;
>> +    unsigned long flags;
>> +    bool dispatched;
>> +    u32 vpu_addr;
>> +
>> +    /* Driver needs to purge all messages from IPC FIFO to clear IPC interrupt.
>> +     * Without purge IPC FIFO to 0 next IPC interrupts won't be generated.
>> +     */
>> +    while (ivpu_hw_reg_ipc_rx_count_get(vdev)) {
> 
> Ick.  Please no in the long term?
> 
> This is an infinite loop.  In hard IRQ context.  Controlled by the device, which you probably shouldn't trust.
> 
> However the real fix for this is to move to threaded_irqs.  Which is going to be a huge refactor for you.  Rate limiting doesn't appear viable.
> 
> If I understand things correctly, the chances that the device will generate a large count, or update the count as fast or faster than the driver are low, but it should still be fixed.
> 
> How about a high priority todo to convert to threaded irqs?  At the same time you can update the return value for this function which seems to not be checked anywhere, and also the comment here which is not proper multi-line style.

OK, I've added this at the top of the TODO and fixed the comment.
Regarding the ivpu_ipc_irq_handler() return code it is checked in the next patch in ivpu_wait_for_ready().

Regards,
Jacek



