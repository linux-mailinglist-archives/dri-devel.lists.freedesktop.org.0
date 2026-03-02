Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CC6aEYvBpWmBFgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 17:57:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9952A1DD5B1
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 17:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEB310E1B9;
	Mon,  2 Mar 2026 16:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T+R08nkh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D73010E1B9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 16:57:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BFC4943F1D;
 Mon,  2 Mar 2026 16:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05436C19423;
 Mon,  2 Mar 2026 16:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772470662;
 bh=dFpRP7qa71QBzXcZjL3mTyogLAhxixOzu35HlZrr+YQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=T+R08nkhFGWxSDeYLOighO8vF8JEt/HTwF9QpK5VrSEElYSAeKpK86u1gEQnUJlGB
 GMc+4B8x2xs8iB2DBTJ+P1o5CNcE6oCQ9gKDgKFRoeFeWvpglP1ROWSiOfj5PLZCvx
 NvEoK2dCSgqlRYR+RwDfvYO3rthrq8l3MbKn967/hN6dr7tms7Ak4E5Nx6P31NzlA/
 Kaubls0InB1vTgeXAjAyLgqNAueyzR4aScy/yVMZGytsskFB4E+SAYzN39EY7s7lG1
 mhjz65dZR8SKrtzpGd1qp2rkNQm7wqaCoesxClJw3RLvpcUDE2WiEpbAY8KZkgKmmq
 bnZw6ByCvS5sQ==
Message-ID: <6a429976-dd1d-4c87-a49f-163f876895fd@kernel.org>
Date: Mon, 2 Mar 2026 10:57:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix NULL pointer dereference of
 mgmt_chann
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260226213857.3068474-1-lizhi.hou@amd.com>
 <e666947b-30b7-444c-9400-966009373e8c@amd.com>
 <7806bdea-7ec4-23c2-aef9-6da395cc181d@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <7806bdea-7ec4-23c2-aef9-6da395cc181d@amd.com>
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
X-Rspamd-Queue-Id: 9952A1DD5B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

On 2/27/26 9:16 PM, Lizhi Hou wrote:
> 
> On 2/27/26 12:11, Mario Limonciello wrote:
>> On 2/26/26 3:38 PM, Lizhi Hou wrote:
>>> mgmt_chann may be set to NULL if the firmware returns an unexpected
>>> error in aie2_send_mgmt_msg_wait(). This can later lead to a NULL
>>> pointer dereference in aie2_hw_stop().
>>>
>>> Fix this by introducing a dedicated helper to destroy mgmt_chann
>>> and by adding proper NULL checks before accessing it.
>>>
>>
>> Is this actually going to fix it?  It sounds like a concurrency 
>> problem, no?
> 
> It is not concurrency issue. The code is protected by dev_lock. That is 
> why I added
> 
>        drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> 
> in my fix.
> 
> This is actually error code path issue. Normally, xdna_send_msg_wait() 
> will not time out. This only happens with broken firmware. That is why 
> it was not found before.
> 
> Lizhi

Got it thanks.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> 
>>
>> Do you want a mutex in the helper perhaps?
>>
>>> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>> ---
>>>   drivers/accel/amdxdna/aie2_message.c | 21 ++++++++++++++++-----
>>>   drivers/accel/amdxdna/aie2_pci.c     |  7 ++-----
>>>   drivers/accel/amdxdna/aie2_pci.h     |  1 +
>>>   3 files changed, 19 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/ 
>>> amdxdna/aie2_message.c
>>> index 277a27bce850..22e1a85a7ae0 100644
>>> --- a/drivers/accel/amdxdna/aie2_message.c
>>> +++ b/drivers/accel/amdxdna/aie2_message.c
>>> @@ -40,11 +40,8 @@ static int aie2_send_mgmt_msg_wait(struct 
>>> amdxdna_dev_hdl *ndev,
>>>           return -ENODEV;
>>>         ret = xdna_send_msg_wait(xdna, ndev->mgmt_chann, msg);
>>> -    if (ret == -ETIME) {
>>> -        xdna_mailbox_stop_channel(ndev->mgmt_chann);
>>> -        xdna_mailbox_destroy_channel(ndev->mgmt_chann);
>>> -        ndev->mgmt_chann = NULL;
>>> -    }
>>> +    if (ret == -ETIME)
>>> +        aie2_destroy_mgmt_chann(ndev);
>>>         if (!ret && *hdl->status != AIE2_STATUS_SUCCESS) {
>>>           XDNA_ERR(xdna, "command opcode 0x%x failed, status 0x%x",
>>> @@ -914,6 +911,20 @@ void aie2_msg_init(struct amdxdna_dev_hdl *ndev)
>>>           ndev->exec_msg_ops = &legacy_exec_message_ops;
>>>   }
>>>   +void aie2_destroy_mgmt_chann(struct amdxdna_dev_hdl *ndev)
>>> +{
>>> +    struct amdxdna_dev *xdna = ndev->xdna;
>>> +
>>> +    drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>>> +
>>> +    if (!ndev->mgmt_chann)
>>> +        return;
>>> +
>>> +    xdna_mailbox_stop_channel(ndev->mgmt_chann);
>>> +    xdna_mailbox_destroy_channel(ndev->mgmt_chann);
>>> +    ndev->mgmt_chann = NULL;
>>> +}
>>> +
>>>   static inline struct amdxdna_gem_obj *
>>>   aie2_cmdlist_get_cmd_buf(struct amdxdna_sched_job *job)
>>>   {
>>> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/ 
>>> amdxdna/aie2_pci.c
>>> index 85079b6fc5d9..977ce21eaf9f 100644
>>> --- a/drivers/accel/amdxdna/aie2_pci.c
>>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>>> @@ -330,9 +330,7 @@ static void aie2_hw_stop(struct amdxdna_dev *xdna)
>>>         aie2_runtime_cfg(ndev, AIE2_RT_CFG_CLK_GATING, NULL);
>>>       aie2_mgmt_fw_fini(ndev);
>>> -    xdna_mailbox_stop_channel(ndev->mgmt_chann);
>>> -    xdna_mailbox_destroy_channel(ndev->mgmt_chann);
>>> -    ndev->mgmt_chann = NULL;
>>> +    aie2_destroy_mgmt_chann(ndev);
>>>       drmm_kfree(&xdna->ddev, ndev->mbox);
>>>       ndev->mbox = NULL;
>>>       aie2_psp_stop(ndev->psp_hdl);
>>> @@ -441,8 +439,7 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>>>       return 0;
>>>     destroy_mgmt_chann:
>>> -    xdna_mailbox_stop_channel(ndev->mgmt_chann);
>>> -    xdna_mailbox_destroy_channel(ndev->mgmt_chann);
>>> +    aie2_destroy_mgmt_chann(ndev);
>>>   stop_psp:
>>>       aie2_psp_stop(ndev->psp_hdl);
>>>   fini_smu:
>>> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/ 
>>> amdxdna/aie2_pci.h
>>> index b20a3661078c..e72311c77996 100644
>>> --- a/drivers/accel/amdxdna/aie2_pci.h
>>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>>> @@ -303,6 +303,7 @@ int aie2_get_array_async_error(struct 
>>> amdxdna_dev_hdl *ndev,
>>>     /* aie2_message.c */
>>>   void aie2_msg_init(struct amdxdna_dev_hdl *ndev);
>>> +void aie2_destroy_mgmt_chann(struct amdxdna_dev_hdl *ndev);
>>>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev);
>>>   int aie2_resume_fw(struct amdxdna_dev_hdl *ndev);
>>>   int aie2_set_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, 
>>> u64 value);
>>

