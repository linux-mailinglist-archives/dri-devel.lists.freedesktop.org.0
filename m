Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C661FD3A6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 19:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A046E976;
	Wed, 17 Jun 2020 17:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6DC6E976
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 17:43:42 +0000 (UTC)
IronPort-SDR: NQN64PTrmJvt1kE77gM4Yy4wrHPd2yZYxZCMkWh+3mvPTQAKE3HbuhRKw+Z49iCTuoqax3cXUH
 59KsmEx+7Rgg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 10:43:41 -0700
IronPort-SDR: KssePl707NL+g/0XryV7jrDcWNF5Zz0RRjreHnojgTajk+bksPVulyDBfGWIBKQfikc6CLTUhE
 TFRhgpH89zuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; d="scan'208";a="309550149"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2020 10:43:41 -0700
Received: from fmsmsx102.amr.corp.intel.com (10.18.124.200) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 17 Jun 2020 10:43:41 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.193]) by
 FMSMSX102.amr.corp.intel.com ([169.254.10.33]) with mapi id 14.03.0439.000;
 Wed, 17 Jun 2020 10:43:41 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Charan Teja Kalla <charante@codeaurora.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, "open list:DMA BUFFER SHARING FRAMEWORK"
 <linux-media@vger.kernel.org>, DRI mailing list
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] dmabuf: use spinlock to access dmabuf->name
Thread-Topic: [PATCH] dmabuf: use spinlock to access dmabuf->name
Thread-Index: AQHWQWvsYI6eTL2/6UmOYEBVkPsE9KjbRi5AgAADWlCAAYoMgP//5V2g
Date: Wed, 17 Jun 2020 17:43:38 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E866301154B8339@FMSMSX108.amr.corp.intel.com>
References: <316a5cf9-ca71-6506-bf8b-e79ded9055b2@codeaurora.org>
 <14063C7AD467DE4B82DEDB5C278E8663010F365EF5@fmsmsx107.amr.corp.intel.com>
 <14063C7AD467DE4B82DEDB5C278E8663010F365F7D@fmsmsx107.amr.corp.intel.com>
 <5b960c9a-ef9d-b43d-716d-113efc793fe5@codeaurora.org>
In-Reply-To: <5b960c9a-ef9d-b43d-716d-113efc793fe5@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.107]
MIME-Version: 1.0
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
 "vinmenon@codeaurora.org" <vinmenon@codeaurora.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: charante=codeaurora.org@mg.codeaurora.org
><charante=codeaurora.org@mg.codeaurora.org> On Behalf Of Charan Teja
>Kalla
>Sent: Wednesday, June 17, 2020 2:29 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>; Sumit Semwal
><sumit.semwal@linaro.org>; open list:DMA BUFFER SHARING FRAMEWORK
><linux-media@vger.kernel.org>; DRI mailing list <dri-
>devel@lists.freedesktop.org>
>Cc: Linaro MM SIG <linaro-mm-sig@lists.linaro.org>;
>vinmenon@codeaurora.org; LKML <linux-kernel@vger.kernel.org>;
>stable@vger.kernel.org
>Subject: Re: [PATCH] dmabuf: use spinlock to access dmabuf->name
>
>Thanks Michael for the comments..
>
>On 6/16/2020 7:29 PM, Ruhl, Michael J wrote:
>>> -----Original Message-----
>>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>>> Ruhl, Michael J
>>> Sent: Tuesday, June 16, 2020 9:51 AM
>>> To: Charan Teja Kalla <charante@codeaurora.org>; Sumit Semwal
>>> <sumit.semwal@linaro.org>; open list:DMA BUFFER SHARING
>FRAMEWORK
>>> <linux-media@vger.kernel.org>; DRI mailing list <dri-
>>> devel@lists.freedesktop.org>
>>> Cc: Linaro MM SIG <linaro-mm-sig@lists.linaro.org>;
>>> vinmenon@codeaurora.org; LKML <linux-kernel@vger.kernel.org>;
>>> stable@vger.kernel.org
>>> Subject: RE: [PATCH] dmabuf: use spinlock to access dmabuf->name
>>>
>>>> -----Original Message-----
>>>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>>>> Charan Teja Kalla
>>>> Sent: Thursday, June 11, 2020 9:40 AM
>>>> To: Sumit Semwal <sumit.semwal@linaro.org>; open list:DMA BUFFER
>>>> SHARING FRAMEWORK <linux-media@vger.kernel.org>; DRI mailing list
><dri-
>>>> devel@lists.freedesktop.org>
>>>> Cc: Linaro MM SIG <linaro-mm-sig@lists.linaro.org>;
>>>> vinmenon@codeaurora.org; LKML <linux-kernel@vger.kernel.org>;
>>>> stable@vger.kernel.org
>>>> Subject: [PATCH] dmabuf: use spinlock to access dmabuf->name
>>>>
>>>> There exists a sleep-while-atomic bug while accessing the dmabuf->name
>>>> under mutex in the dmabuffs_dname(). This is caused from the SELinux
>>>> permissions checks on a process where it tries to validate the inherited
>>>> files from fork() by traversing them through iterate_fd() (which
>>>> traverse files under spin_lock) and call
>>>> match_file(security/selinux/hooks.c) where the permission checks
>happen.
>>>> This audit information is logged using dump_common_audit_data()
>where it
>>>> calls d_path() to get the file path name. If the file check happen on
>>>> the dmabuf's fd, then it ends up in ->dmabuffs_dname() and use mutex
>to
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
>>>> drivers/dma-buf/dma-buf.c | 13 +++++++------
>>>> include/linux/dma-buf.h   |  1 +
>>>> 2 files changed, 8 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>>> index 01ce125..2e0456c 100644
>>>> --- a/drivers/dma-buf/dma-buf.c
>>>> +++ b/drivers/dma-buf/dma-buf.c
>>>> @@ -45,10 +45,10 @@ static char *dmabuffs_dname(struct dentry
>*dentry,
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
>>>
>>> I am not really clear on why you need this lock.
>>>
>>> If name == NULL you have no issues.
>>> If name is real, you have no issues.
>
>Yeah, ideal cases...
>
>>>
>>> If name is freed you will copy garbage, but the only way
>>> for that to happen is that _set_name or _release have to be called
>>> at just the right time.
>>>
>>> And the above would probably only be an issue if the set_name
>>> was called, so you will get NULL or a real name.
>
>And there exists a use-after-free to avoid which requires the lock. Say
>that memcpy() in dmabuffs_dname is in progress and in parallel _set_name
>will free the same buffer that memcpy is operating on.

Hmm...  I can see that.

However, note that in dma_buf_set_name, you cannot use the spinlock
to protect the dma_buf->attachements list.

I think you need to do this:

	dma_resv_lock(dmabuf->resv, NULL);
 	if (!list_empty(&dmabuf->attachments)) {
 		ret = -EBUSY;
 		kfree(name);
              }
	dma_resv_unlock(dmabuf->resv, NULL);
	if (ret)
		return ret;

	spinlock(nam_lock)
	namestuff;
	spinunlock

	return 0;

Mike

>>> Is there a reason for the lock here?
>>>
>>> Mike
>>
>> Maybe dmabuf->name = NULL after the kfree(dmabuf->name) in:
>>
>> dma_buf_release()
>>
>> Would be sufficient?
>
>I don't think that we will access the 'dmabuf'(thus dmabuf->name) once
>it is in the dma_buf_release(). So, setting the NULL in the _release()
>is not required at all.
>
>>
>> M
>>>> 	return dynamic_dname(dentry, buffer, buflen, "/%s:%s",
>>>> 			     dentry->d_name.name, ret > 0 ? name : "");
>>>> @@ -335,7 +335,7 @@ static long dma_buf_set_name(struct dma_buf
>>>> *dmabuf, const char __user *buf)
>>>> 	if (IS_ERR(name))
>>>> 		return PTR_ERR(name);
>>>>
>>>> -	dma_resv_lock(dmabuf->resv, NULL);
>>>> +	spin_lock(&dmabuf->name_lock);
>>>> 	if (!list_empty(&dmabuf->attachments)) {
>>>> 		ret = -EBUSY;
>>>> 		kfree(name);
>>>> @@ -345,7 +345,7 @@ static long dma_buf_set_name(struct dma_buf
>>>> *dmabuf, const char __user *buf)
>>>> 	dmabuf->name = name;
>>>>
>>>> out_unlock:
>>>> -	dma_resv_unlock(dmabuf->resv);
>>>> +	spin_unlock(&dmabuf->name_lock);
>>>> 	return ret;
>>>> }
>>>>
>>>> @@ -405,10 +405,10 @@ static void dma_buf_show_fdinfo(struct
>seq_file
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
>>>> @@ -546,6 +546,7 @@ struct dma_buf *dma_buf_export(const struct
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
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>--
>The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>Forum, a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
