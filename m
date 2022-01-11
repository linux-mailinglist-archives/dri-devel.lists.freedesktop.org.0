Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16A848A422
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 01:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD7010E406;
	Tue, 11 Jan 2022 00:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C603A10E406;
 Tue, 11 Jan 2022 00:03:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/TGntkCFuJHKBk3SfFJPNEQFT+MlYYT1TKpNtbti1ypazMLHKZfdfbO1Z4o/y9WxLalCaGtRi/Yd2zJ9c7i/Q+Gulh+Cb7QCwG2B1kUGDHuBAuyaLapU87P5HbyvhCaClSWa99arVZK6H3Akx7Acjhw7jDmGTpU89fuN6ZAVmQpnEahmufll0MZer+RsJrSXemEhyHaB1ZqhLDz6229nDlrEQy82X8bcIEnDUDXl3e1CKld73lsXF1+nOk+V8ppGmNCKU5/YziyV0ilDAbVXKkU0D825vY/DzSmrMzVRUnk+t7EdbTKh3TWqYDs0JYRjcK/OFeHKBpHzTKxn+W4Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZsewE8IBrlVPLwjNNF4MqeRRO4ZXGJWj5qm4qQYbyA=;
 b=JycL73w/sMdy4V2hKgmbLK/CdY1CaGpaNx0u1sWdornQAYRFxZVOb0y2YTZLg4zLbRQYTgkvb8JrdlndUGQGe2UhzQ0MFggolKlTC4hjSycrN7g7v6IcKGZgd3+YdmPvSuZNY6fNf5J7M6fur+ubsb9DF8D6zw0ikUpbdH/1Zrrb0AhIghg7nl7WpVekGpbeZqkH51Ds4JuOHy1XGwvDGleuUQZBCrFIDTRakWcLNF8ktLdVQSmy/DeU6NEsVd4hq4SaqxEdrb//GttDk2nuKMh5FQFEHxlsBz+jIbO8+/TX+r3FTfhRTdrimJ8iAMZgbXApyCSl48bAJIDM91fNdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZsewE8IBrlVPLwjNNF4MqeRRO4ZXGJWj5qm4qQYbyA=;
 b=RlkiPepjjiqEHKE76x+zfQKs2deMJU8zwgMCJSO/7xb0MAjWS8quxtJscBZqxc3r/zZlryBPg+MoAbTFwJ2GE3lApJaNJ9bVqlXi0bNhwURYAx+EExZM/zCQemGFo1lAGtAoudwGET9LdKThXNzQ3gh6AjfhG6RVELTa4NRdQu8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5382.namprd12.prod.outlook.com (2603:10b6:408:103::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.16; Tue, 11 Jan
 2022 00:03:17 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 00:03:17 +0000
Subject: Re: [Patch v4 24/24] drm/amdkfd: CRIU resume shared virtual memory
 ranges
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
 <20211223003711.13064-25-rajneesh.bhardwaj@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <655d7468-bf18-498b-fc74-0a12a48ef079@amd.com>
Date: Mon, 10 Jan 2022 19:03:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211223003711.13064-25-rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: CH0PR03CA0323.namprd03.prod.outlook.com
 (2603:10b6:610:118::6) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91cb72f5-ec5e-4c7e-a6f7-08d9d495c551
X-MS-TrafficTypeDiagnostic: BN9PR12MB5382:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB53822763D5A7ADFCF9CA97EA92519@BN9PR12MB5382.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: imcxMe730F+F68JYE6wjdlOkrv/TsEeCU+eC12kPbCea2bkmqRb/NUx/cOYBtmvhjxBXppfLntNRlze17kx6y5RDXWSldD/heW9i0l97D24edcxeAheBfAX5nzrag2L/ecGqtriN9ayLRc5KW/+380aVtICB2SI0E8jhMgxCLvwbeLKIbEzRH6L+XeIHh2pVwAHDvkqh8D8s+av64UoC9oddoHXS3LjsuVhGZgOn4Twuo61jnKl0pEQC2sX991g91QIZtgChj+dOz3KdnHYlV3SvPSAvTf/4NuxulQr9Lv0K+5WDVti3/PuddNU3jTGytVhkhK5JFENKGCxL4g2owiTaC3I/lXgAXxKj6XSaiRUQT3wv1utsrByuIbCvqXtQ99HT/MAgTjmSnZoNLbY69hRoD6nmWIH4l5ehRm+HEsOyqbjc4tZ1xurDtmNasbVIe6Ji4kQNjns9dthD7QTA2Z6RRz0mXdSO1E3NDRL/gXD6nZiy2yfZu8+oJ4HzYs2RrDQUULtwjTouV6ALSK+CoVid9FV8Z7Sfx9i638qlSTaBcY437qXk5B8tHnHBIeWuKMDmj3Rjogs7gWEDzzM7slOec5D9QvXFnMTjl8+Ialfl5SpFucdhTZZ85PNZ7f7qzgjzANLBqf8eYJD87JAuZY1lvMnj91rO3HjMlI05lu4Q/PIZxjAkaqBkVjXZNYPxwqp3p7hp+we7yEHvcjwtoOGZwqdmNCr54R3C5ez7FWYxh4UBfj0TCxzRADIchAd6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(6512007)(83380400001)(6486002)(86362001)(36756003)(5660300002)(8676002)(38100700002)(66476007)(66946007)(36916002)(31686004)(26005)(4326008)(2906002)(4001150100001)(508600001)(66556008)(44832011)(8936002)(31696002)(186003)(53546011)(316002)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c254RWlJUjFGbC9BUFBnQTlFd0lVLzVjOCszZWl3U3RMNzVIbFFiTWlGWUgy?=
 =?utf-8?B?U1NlbUJCWlE2ajJTVW1xai9YbmUzQTNra1grWk1HdWNMSEdJVk4wN3FPZ1A0?=
 =?utf-8?B?RjZhWDlHQURoSFFuVUIwdWNYbStJbU1zVnJuSnEyOXBmRmVudmRqYVNpOVNv?=
 =?utf-8?B?a29IZ0pnWFAyNE5wc3VzWkFGNGdOMlZjMHlDdmtDYUJ0T1VGZ0VQZld3VGdz?=
 =?utf-8?B?a2NIeGxzTEw1b1ZiaFppbnRaeWJjZjNGMHBhWlp0T3JXMS9Pci9TUUhwRk9y?=
 =?utf-8?B?UUlpU1JoNCtLUmt0RzI2Z2RhSU1Ld1pIaSsvM05qTUNLM3V3TnNUaTNSMFoy?=
 =?utf-8?B?Vk9GMHYzc1BDSk1rcS9VVVdHRWhMY2h4Y05wMnRmZGVoR1kwUTVnRDJvMHFv?=
 =?utf-8?B?TGhKUjA3eU44aDdOSE03VC9odkIyMFNyLzRBNVA2Rm56ZlRad1RFb3YrZjdR?=
 =?utf-8?B?ZElJV2F3SExJQmNzb1JJMHJhcjhkQXhOMVBPZ0hMdnVJN2pTUko4cWJVSldn?=
 =?utf-8?B?b0xWcFd1NUQ2a1c1YklkNSt4SWNNNmFPeWl1N0FaQzRTS3ZUVjBPb1BtMGx5?=
 =?utf-8?B?bUdhWjdkN25rZWpCUkVoWngvWlcxUzRUMkxVM3pLaVEya2YzUURWNXREbEsv?=
 =?utf-8?B?K3ZyaTZHbk5oYTFia0hoamhaUXpXWWdJVWVrbm9NeGEzMk5leUxYTC9sREVh?=
 =?utf-8?B?bkhub0RWdEoyZzAvNmtZbHM3TkM2UFhJN1Z2NUxTQkFiV2t0eFZoM01ZKzFU?=
 =?utf-8?B?T3B0SGJ6eiswQmZKb0dVbi8wUXVNTjVwdnhGK1l4TllaSGJMTm1VM29kalJD?=
 =?utf-8?B?WGpXdmdlSmtrNkxFZTZrNjh6aWpBc2FlRWM4dWFPSDRWV3Z3ZTA1cWZrU1ln?=
 =?utf-8?B?UkFKVE1DaUpHUmdqdmFCbWlPM244cGp3OTFuL0tlT3h3TXBOUDg4UGUrZFJ6?=
 =?utf-8?B?L0NsRTlUeWlOYW03UjBUaER5U0t1b0paWG8zelNLMGdqZzlHZzUyeEJMakNJ?=
 =?utf-8?B?NGJ1UHNXK3VLTWVjaGkvMHZNcGx0RlhPWTAwOG13dEVYMXBjZUJGZ2tNaVVr?=
 =?utf-8?B?dDFzTXdPeWE2NmpFcGdoOHhpSnkybklVYkNQZ01rWmJoeWZkaEVZaEZiN0R0?=
 =?utf-8?B?QmRLUGEyL1RMRGJXL1VLMmNFS2lIZ3ZMdENjRFhNcGpLSkI0UzVnNndFSWto?=
 =?utf-8?B?SjZOSHFTMFBSN1RSb2pPREhKejJuV05DRytJRER6enM2SkVVeEkyMi9xenM4?=
 =?utf-8?B?dG4xRGFEeFQ3OG1xQkpxa2Npa2xtTlRIQkF5dEF0YzQ2amNUZEtiWnhaWko5?=
 =?utf-8?B?YlhRaVRwaWc5QTVqbWhONEFnQUp4aDZoVHhsWUtFbnNQOEV6TTB3UktXSFlQ?=
 =?utf-8?B?aXI1Sm1idkNXeW9QblhrSUQ5QW4vNmpmc2NQby9kUFdaSFVLRXNtd2QveVNL?=
 =?utf-8?B?ZWpJLzZ3ZDd6ZkNUZWpSS3ZzajUrdlpBZkN4VmV0YzJoOXdtdkNvWmtsRkw0?=
 =?utf-8?B?cHoralRsWGtJM2N2STRqaDFvZXRqVVN0RzN1UTlLcVArRTZ5SnJBbExRL2pU?=
 =?utf-8?B?VEZTQXQyT0x0N0xmM3ZRTEFuaktoQ01GWlRLbW9NTXdpSDRYNDQ3S0ZvQWtz?=
 =?utf-8?B?Qi8wN0Z3eThIaDgxcjJpYndUMFRsMVRZdE9wVVI5Qkx0SWllTjl2K0pxNGlm?=
 =?utf-8?B?UFlzb2VlZjFJSlFBaHZwQ2NWNXhwTForaG9wVXBCWkNGdmFsMFhpdzlka1lM?=
 =?utf-8?B?bmMrL0VCL05DcCtIdzJ2eHdFOThIc3JhdTBWZWwxcUI2OTJZNE9qcjRZUmNj?=
 =?utf-8?B?V2JmdE1rcW1DOHdGb0VUajFSRmRXWU5YYnNtRDRSWGdvd0huSjlzNkJsQ21r?=
 =?utf-8?B?TnlvYVd0WHNEYTlGRnRDV05CKzdlbkNmKzB0RHhvS04zRlhEZUlHNytqd2lI?=
 =?utf-8?B?MlpJYzdhMUlBa2hVQVpMTFdDMnF6WjgyWjFacFI2VGpGSDN4WkNkcEVsaks1?=
 =?utf-8?B?WnVYL21MR1NCN3hySzRMU3NUN252YXpPUkZpWlZBeVJCbmxIK1ZBcEVyTzJ1?=
 =?utf-8?B?R2UyeHBrNEpoaGkxcWhQNEJWdFlGQTBPTURsbUFPM3R6NUtIWUxJT1l6bklV?=
 =?utf-8?B?ckUzaEc1cGRIMUw4RnJsRVdVcTJCcUpLY0xYazUyOUNhVDVteEgzUitVMVhT?=
 =?utf-8?Q?3iQ6RqIhP1huq8whKoszpEs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91cb72f5-ec5e-4c7e-a6f7-08d9d495c551
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 00:03:17.6563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5mLRIk7VNK3+Xx2IM0pfYpsGj1zrl9gj55WrqLnQ4giQDA1MaA4fSmKVG69TpDn/ebd+j5eWeGytuCx8SK6SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5382
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
Cc: alexander.deucher@amd.com, airlied@redhat.com, christian.koenig@amd.com,
 daniel.vetter@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-22 7:37 p.m., Rajneesh Bhardwaj wrote:
> In CRIU resume stage, resume all the shared virtual memory ranges from
> the data stored inside the resuming kfd process during CRIU restore
> phase. Also setup xnack mode and free up the resources.
>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 10 +++++
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 55 ++++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |  6 +++
>   3 files changed, 71 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index f7aa15b18f95..6191e37656dd 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2759,7 +2759,17 @@ static int criu_resume(struct file *filep,
>   	}
>   
>   	mutex_lock(&target->mutex);
> +	ret = kfd_criu_resume_svm(target);
> +	if (ret) {
> +		pr_err("kfd_criu_resume_svm failed for %i\n", args->pid);
> +		goto exit;
> +	}
> +
>   	ret =  amdgpu_amdkfd_criu_resume(target->kgd_process_info);
> +	if (ret)
> +		pr_err("amdgpu_amdkfd_criu_resume failed for %i\n", args->pid);
> +
> +exit:
>   	mutex_unlock(&target->mutex);
>   
>   	kfd_unref_process(target);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index e9f6c63c2a26..bd2dce37f345 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -3427,6 +3427,61 @@ svm_range_get_attr(struct kfd_process *p, struct mm_struct *mm,
>   	return 0;
>   }
>   
> +int kfd_criu_resume_svm(struct kfd_process *p)
> +{
> +	int nattr_common = 4, nattr_accessibility = 1;
> +	struct criu_svm_metadata *criu_svm_md = NULL;
> +	struct criu_svm_metadata *next = NULL;
> +	struct svm_range_list *svms = &p->svms;
> +	int i, j, num_attrs, ret = 0;
> +	struct mm_struct *mm;
> +
> +	if (list_empty(&svms->criu_svm_metadata_list)) {
> +		pr_debug("No SVM data from CRIU restore stage 2\n");
> +		return ret;
> +	}
> +
> +	mm = get_task_mm(p->lead_thread);
> +	if (!mm) {
> +		pr_err("failed to get mm for the target process\n");
> +		return -ESRCH;
> +	}
> +
> +	num_attrs = nattr_common + (nattr_accessibility * p->n_pdds);
> +
> +	i = j = 0;
> +	list_for_each_entry(criu_svm_md, &svms->criu_svm_metadata_list, list) {
> +		pr_debug("criu_svm_md[%d]\n\tstart: 0x%llx size: 0x%llx (npages)\n",
> +			 i, criu_svm_md->start_addr, criu_svm_md->size);
> +		for (j = 0; j < num_attrs; j++) {
> +			pr_debug("\ncriu_svm_md[%d]->attrs[%d].type : 0x%x \ncriu_svm_md[%d]->attrs[%d].value : 0x%x\n",
> +				 i,j, criu_svm_md->attrs[j].type,
> +				 i,j, criu_svm_md->attrs[j].value);
> +		}

Is this super-detailed debug output really needed?

Regards,
   Felix


> +
> +		ret = svm_range_set_attr(p, mm, criu_svm_md->start_addr,
> +					 criu_svm_md->size, num_attrs,
> +					 criu_svm_md->attrs);
> +		if (ret) {
> +			pr_err("CRIU: failed to set range attributes\n");
> +			goto exit;
> +		}
> +
> +		i++;
> +	}
> +
> +exit:
> +	list_for_each_entry_safe(criu_svm_md, next, &svms->criu_svm_metadata_list, list) {
> +		pr_debug("freeing criu_svm_md[]\n\tstart: 0x%llx\n",
> +						criu_svm_md->start_addr);
> +		kfree(criu_svm_md);
> +	}
> +
> +	mmput(mm);
> +	return ret;
> +
> +}
> +
>   int svm_criu_prepare_for_resume(struct kfd_process *p,
>   				struct kfd_criu_svm_range_priv_data *svm_priv)
>   {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
> index e0c0853f085c..3b5bcb52723c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
> @@ -195,6 +195,7 @@ int kfd_criu_restore_svm(struct kfd_process *p,
>   			 uint8_t __user *user_priv_ptr,
>   			 uint64_t *priv_data_offset,
>   			 uint64_t max_priv_data_size);
> +int kfd_criu_resume_svm(struct kfd_process *p);
>   struct kfd_process_device *
>   svm_range_get_pdd_by_adev(struct svm_range *prange, struct amdgpu_device *adev);
>   void svm_range_list_lock_and_flush_work(struct svm_range_list *svms, struct mm_struct *mm);
> @@ -256,6 +257,11 @@ static inline int kfd_criu_restore_svm(struct kfd_process *p,
>   	return -EINVAL;
>   }
>   
> +static inline int kfd_criu_resume_svm(struct kfd_process *p)
> +{
> +	return 0;
> +}
> +
>   #define KFD_IS_SVM_API_SUPPORTED(dev) false
>   
>   #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
