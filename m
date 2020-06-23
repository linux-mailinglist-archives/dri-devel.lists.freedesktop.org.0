Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB948206D24
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 08:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30508967A;
	Wed, 24 Jun 2020 06:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FE089BFC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 11:34:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1592912056; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ojMpDcyOcmVyb93+ClmEb0KwpIVbseVdym/zizyhRtA=;
 b=M/BD81rRkt2RMLhgt9KyR/d6wVxIgZ3LhlCH6+Zqgdb8j2Y5Q3iO+e2P6da9FlY3sSHh3cRD
 /GruQIhU/N2MIWgC4VceHbESnfnBMqB+lXErm2Nx8Qij5W+hjTbcfSflONjOMy8yx54ni3WS
 r5Bt60ZBRQOsVp8w5/VICg8Rz90=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-west-2.postgun.com with SMTP id
 5ef1e8b2117610c7ff8324ed (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Jun 2020 11:34:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 14920C43395; Tue, 23 Jun 2020 11:34:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.102] (unknown [183.83.143.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: charante)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B8258C433C6;
 Tue, 23 Jun 2020 11:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B8258C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=charante@codeaurora.org
Subject: Re: [PATCH v2] dmabuf: use spinlock to access dmabuf->name
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "David.Laight@ACULAB.COM" <David.Laight@ACULAB.COM>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
References: <a83e7f0d-4e54-9848-4b58-e1acdbe06735@codeaurora.org>
 <14063C7AD467DE4B82DEDB5C278E866301154BAE9E@FMSMSX108.amr.corp.intel.com>
 <97f2313e-a690-b5ab-567d-6887384debf5@codeaurora.org>
 <14063C7AD467DE4B82DEDB5C278E866301154C1A5E@FMSMSX108.amr.corp.intel.com>
From: Charan Teja Kalla <charante@codeaurora.org>
Message-ID: <16cc8de2-9f91-c64a-2f36-759ceb7cf23d@codeaurora.org>
Date: Tue, 23 Jun 2020 17:04:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E866301154C1A5E@FMSMSX108.amr.corp.intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 24 Jun 2020 06:58:05 +0000
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
Cc: Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Mike for the inputs.

On 6/22/2020 5:10 PM, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: charante=codeaurora.org@mg.codeaurora.org
>> <charante=codeaurora.org@mg.codeaurora.org> On Behalf Of Charan Teja
>> Kalla
>> Sent: Monday, June 22, 2020 5:26 AM
>> To: Ruhl, Michael J <michael.j.ruhl@intel.com>; Sumit Semwal
>> <sumit.semwal@linaro.org>; David.Laight@ACULAB.COM; open list:DMA
>> BUFFER SHARING FRAMEWORK <linux-media@vger.kernel.org>; DRI mailing
>> list <dri-devel@lists.freedesktop.org>
>> Cc: Linaro MM SIG <linaro-mm-sig@lists.linaro.org>; LKML <linux-
>> kernel@vger.kernel.org>
>> Subject: Re: [PATCH v2] dmabuf: use spinlock to access dmabuf->name
>>
>> Hello Mike,
>>
>> On 6/19/2020 7:11 PM, Ruhl, Michael J wrote:
>>>> -----Original Message-----
>>>> From: charante=codeaurora.org@mg.codeaurora.org
>>>> <charante=codeaurora.org@mg.codeaurora.org> On Behalf Of Charan
>> Teja
>>>> Kalla
>>>> Sent: Friday, June 19, 2020 7:57 AM
>>>> To: Sumit Semwal <sumit.semwal@linaro.org>; Ruhl, Michael J
>>>> <michael.j.ruhl@intel.com>; David.Laight@ACULAB.COM; open list:DMA
>>>> BUFFER SHARING FRAMEWORK <linux-media@vger.kernel.org>; DRI
>> mailing
>>>> list <dri-devel@lists.freedesktop.org>
>>>> Cc: Linaro MM SIG <linaro-mm-sig@lists.linaro.org>; LKML <linux-
>>>> kernel@vger.kernel.org>
>>>> Subject: [PATCH v2] dmabuf: use spinlock to access dmabuf->name
>>>>
>>>> There exists a sleep-while-atomic bug while accessing the dmabuf->name
>>>> under mutex in the dmabuffs_dname(). This is caused from the SELinux
>>>> permissions checks on a process where it tries to validate the inherited
>>>> files from fork() by traversing them through iterate_fd() (which
>>>> traverse files under spin_lock) and call
>>>> match_file(security/selinux/hooks.c) where the permission checks
>> happen.
>>>> This audit information is logged using dump_common_audit_data() where
>> it
>>>> calls d_path() to get the file path name. If the file check happen on
>>>> the dmabuf's fd, then it ends up in ->dmabuffs_dname() and use mutex to
>>>> access dmabuf->name. The flow will be like below:
>>>> flush_unauthorized_files()
>>>>  iterate_fd()
>>>>    spin_lock() --> Start of the atomic section.
>>>>      match_file()
>>>>        file_has_perm()
>>>>          avc_has_perm()
>>>>            avc_audit()
>>>>              slow_avc_audit()
>>>> 	        common_lsm_audit()
>>>> 		  dump_common_audit_data()
>>>> 		    audit_log_d_path()
>>>> 		      d_path()
>>>>                        dmabuffs_dname()
>>>>                          mutex_lock()--> Sleep while atomic.
>>>>
>>>> Call trace captured (on 4.19 kernels) is below:
>>>> ___might_sleep+0x204/0x208
>>>> __might_sleep+0x50/0x88
>>>> __mutex_lock_common+0x5c/0x1068
>>>> __mutex_lock_common+0x5c/0x1068
>>>> mutex_lock_nested+0x40/0x50
>>>> dmabuffs_dname+0xa0/0x170
>>>> d_path+0x84/0x290
>>>> audit_log_d_path+0x74/0x130
>>>> common_lsm_audit+0x334/0x6e8
>>>> slow_avc_audit+0xb8/0xf8
>>>> avc_has_perm+0x154/0x218
>>>> file_has_perm+0x70/0x180
>>>> match_file+0x60/0x78
>>>> iterate_fd+0x128/0x168
>>>> selinux_bprm_committing_creds+0x178/0x248
>>>> security_bprm_committing_creds+0x30/0x48
>>>> install_exec_creds+0x1c/0x68
>>>> load_elf_binary+0x3a4/0x14e0
>>>> search_binary_handler+0xb0/0x1e0
>>>>
>>>> So, use spinlock to access dmabuf->name to avoid sleep-while-atomic.
>>>>
>>>> Cc: <stable@vger.kernel.org> [5.3+]
>>>> Signed-off-by: Charan Teja Reddy <charante@codeaurora.org>
>>>> ---
>>>>
>>>> Changes in V2: Addressed review comments from Ruhl, Michael J
>>>>
>>>> Changes in V1: https://lore.kernel.org/patchwork/patch/1255055/
>>>>
>>>> drivers/dma-buf/dma-buf.c | 11 +++++++----
>>>> include/linux/dma-buf.h   |  1 +
>>>> 2 files changed, 8 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>>> index 01ce125..d81d298 100644
>>>> --- a/drivers/dma-buf/dma-buf.c
>>>> +++ b/drivers/dma-buf/dma-buf.c
>>>> @@ -45,10 +45,10 @@ static char *dmabuffs_dname(struct dentry
>> *dentry,
>>>> char *buffer, int buflen)
>>>> 	size_t ret = 0;
>>>>
>>>> 	dmabuf = dentry->d_fsdata;
>>>> -	dma_resv_lock(dmabuf->resv, NULL);
>>>> +	spin_lock(&dmabuf->name_lock);
>>>> 	if (dmabuf->name)
>>>> 		ret = strlcpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
>>>> -	dma_resv_unlock(dmabuf->resv);
>>>> +	spin_unlock(&dmabuf->name_lock);
>>>>
>>>> 	return dynamic_dname(dentry, buffer, buflen, "/%s:%s",
>>>> 			     dentry->d_name.name, ret > 0 ? name : "");
>>>> @@ -341,8 +341,10 @@ static long dma_buf_set_name(struct dma_buf
>>>> *dmabuf, const char __user *buf)
>>>> 		kfree(name);
>>>> 		goto out_unlock;
>>>> 	}
>>>> +	spin_lock(&dmabuf->name_lock);
>>>> 	kfree(dmabuf->name);
>>>> 	dmabuf->name = name;
>>>> +	spin_unlock(&dmabuf->name_lock);
>>>
>>> While this code path is ok, I would have separated the protection of the
>>> attachment list and the name manipulation.
>>>
>>> dma_resv_lock(resv)
>>> if (!list_empty(attachment)
>>> 	ret = -EBUSY
>>> dma_resv_unlock(resv)
>>>
>>> if (ret) {
>>> 	kfree(name)
>>> 	return ret;
>>> }
>>
>> Is it that the name should be visible before importer attaches to the
>> dmabuf,(using dma_buf_attach()), thus _buf_set_name() is under the
>> _resv_lock() as well?
> 
> That is the name that was being freed in the error path of the lock block.
> Alternatively:
> 
> dma_resv_lock(resv)
> if (!list_empty(attachment) {
>  	ret = -EBUSY
> 	kfree(name)

We can free this buffer even outside of the lock with out any issues.
This is just a user passed name copied into local buffer yet to assign
to dmabuf->name.

> }
> dma_resv_unlock(resv)
> 
> if (ret)
>  	return ret;
> 
> I was limiting what was happening in the lock block.
> 
> You have two distinct locks, that protect two distinct items:
> 
> dmabuf->attachment
> dmabuf->name
> 
> Nesting the locking is ok, but if the code ever changes
> you can get that nesting wrong, so:

Your suggestion below looks clean, but what I am still not sure is that
is there any condition like "there should be no attachments to the
exported dmabuf before assigning the name" -- If yes, then _resv_lock
and name_lock should be nested while assigning the name which otherwise
breaks under below scenario:

P1					P2

buf_set_name() called and
no attachments to this dmabuf
yet.
				attaches to the exported dmabuf by P1.

				Say it tries to get the name with the
				assumption that name is already set.
Now it tries to
change the name under
just name_lock

In the above case P2 didn't get any name of the exported dmabuf despite
name is set.


If not, then I can give V3 with the suggested changes..			

> 
> 	long ret = 0;
> 
> 	if (IS_ERR(name))
> 		return PTR_ERR(name);
> 
> 	dma_resv_lock(dmabuf->resv, NULL);
> 	if (!list_empty(&dmabuf->attachments)) {
> 		ret = -EBUSY;
> 		kfree(name);
> 	}
> 	dma_resv_unlock(dmabuf->resv);
> 	if (ret)
> 		return ret;
> 
> 	spinlock(dmabuf->name_lock)
> 	kfree(dmabuf->name);
> 	dmabuf->name = name;
> 	spinunlock(dmabuf->name_lock)
> 
> 	return 0;
> }
> 
> M
> 
>>
>>>
>>> spinlock(nam_lock)
>>> ...
>>>
>>> Nesting locks  that don't need to be nested always makes me nervous
>>> for future use that misses the lock/unlock pattern.
>>>
>>> However, this looks reasonable.
>>>
>>> With this current code, or if you update to the above pattern:
>>>
>>> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>>
>> Thanks for the ACK.
>>>
>>> Mike
>>>
>>>
>>>> out_unlock:
>>>> 	dma_resv_unlock(dmabuf->resv);
>>>> @@ -405,10 +407,10 @@ static void dma_buf_show_fdinfo(struct seq_file
>>>> *m, struct file *file)
>>>> 	/* Don't count the temporary reference taken inside procfs seq_show
>>>> */
>>>> 	seq_printf(m, "count:\t%ld\n", file_count(dmabuf->file) - 1);
>>>> 	seq_printf(m, "exp_name:\t%s\n", dmabuf->exp_name);
>>>> -	dma_resv_lock(dmabuf->resv, NULL);
>>>> +	spin_lock(&dmabuf->name_lock);
>>>> 	if (dmabuf->name)
>>>> 		seq_printf(m, "name:\t%s\n", dmabuf->name);
>>>> -	dma_resv_unlock(dmabuf->resv);
>>>> +	spin_unlock(&dmabuf->name_lock);
>>>> }
>>>>
>>>> static const struct file_operations dma_buf_fops = {
>>>> @@ -546,6 +548,7 @@ struct dma_buf *dma_buf_export(const struct
>>>> dma_buf_export_info *exp_info)
>>>> 	dmabuf->size = exp_info->size;
>>>> 	dmabuf->exp_name = exp_info->exp_name;
>>>> 	dmabuf->owner = exp_info->owner;
>>>> +	spin_lock_init(&dmabuf->name_lock);
>>>> 	init_waitqueue_head(&dmabuf->poll);
>>>> 	dmabuf->cb_excl.poll = dmabuf->cb_shared.poll = &dmabuf->poll;
>>>> 	dmabuf->cb_excl.active = dmabuf->cb_shared.active = 0;
>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>>> index ab0c156..93108fd 100644
>>>> --- a/include/linux/dma-buf.h
>>>> +++ b/include/linux/dma-buf.h
>>>> @@ -311,6 +311,7 @@ struct dma_buf {
>>>> 	void *vmap_ptr;
>>>> 	const char *exp_name;
>>>> 	const char *name;
>>>> +	spinlock_t name_lock;
>>>> 	struct module *owner;
>>>> 	struct list_head list_node;
>>>> 	void *priv;
>>>> --
>>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>>>> Forum, a Linux Foundation Collaborative Project
>>
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>> Forum, a Linux Foundation Collaborative Project

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
Forum, a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
