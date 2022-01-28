Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C71449F26D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 05:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD9D10EEBA;
	Fri, 28 Jan 2022 04:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E7F10EEBA;
 Fri, 28 Jan 2022 04:22:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuLWyBFqwBrOqf1rd0awb4u2+puZCtR6vXi7Ez8LXn7aVREkup0Gv7rZHdIcYkopY5ziwEwLGRNYaoSVZFMkLBKCDJA0TI21kFZJXSa59r4ehHNmGosb5iL6z3agA6OLNq1tGATlSpAuk4cIydl3LR1JnKXvKpr3HJpJxzskRLTQs0JP5dF9QC3GPlkNfYC1pu0B+l2Lf8V1n+ecqeA3+9UbFdiWuoba7MeyiUPg/0K20lejtTAAJwc+7FBVcMDPpnn9WTaJxCf+Ojka0Upv6NNaYsHeT2VCYYHREBxPPbpzPJZ4isUSDsyJmOJNJHHPD7kiyf/0CiTaxJrHS17L9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KZzzHjcSlVAzM/FpTh1shMiUkvWvuZpXH50SUU2kpw=;
 b=EJYNVk8IfO40HRTJQOBje6tCdU1p2nYB1NWJiV0gSuSPy9/ZHPtzefZFa72scpHPVYY+IFZJirEOeJYI6vZcqgcp3TFeIVinfA6roWzaq4XEI184F4frcDdqedF5LzZWQ8/WsuNa5nIbgJtrMH5AmQg5lgK07yM2OIc9Jsuq02R0SSHd7+OOFAowZtdEA/iezF9UR19zQhkHfp6KBKSYv5FZYhH0ulfreO1B6AlZ9T5EhAiMrbOlrjU3gK6onQzMvUCpXtCgxZZG1jOgafoX2ID/0Gm93bwKhQ2xiiEKfscIDUOquQbeqxtF2yqw7YpfJSckxVyFGahsJ2tdLAOsQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KZzzHjcSlVAzM/FpTh1shMiUkvWvuZpXH50SUU2kpw=;
 b=sCz6fA9dL/ujPIF7FSdaUVFslnDk/AUinXn+3eCpRiuMgHwY7fQd2wWIWgXFjlXvqEoAZd0GYIbTiUt9oGc5CSuVvTzfyat9ZK3wM6L+CpuMP08FWKMliD6u+UjuQyuoawh2CcTywCIF7CTekxzF8q3i/SwZifMOVXPiEG8yE3og1zVy6/3HLd1HM7XDnLbcOdpstTy7OlNbOfVrpaMAFv08Vcq+We6wojnPwuRlQbE6eK7BpdqySKHOpNQmW8Bd3BnQS89slslQJ1/q+vMSQqre6QOVtRyrot0JOYm2SJ894zPSAmtyXqnWikrZeonMhR0kpzUTyO0OMef60148sw==
Received: from MW4PR04CA0328.namprd04.prod.outlook.com (2603:10b6:303:82::33)
 by MN2PR12MB3247.namprd12.prod.outlook.com (2603:10b6:208:ad::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Fri, 28 Jan
 2022 04:22:53 +0000
Received: from CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::38) by MW4PR04CA0328.outlook.office365.com
 (2603:10b6:303:82::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Fri, 28 Jan 2022 04:22:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT020.mail.protection.outlook.com (10.13.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 04:22:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Fri, 28 Jan 2022 04:22:51 +0000
Received: from nvdebian.localnet (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Thu, 27 Jan 2022
 20:22:48 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v4 07/10] lib: test_hmm add module param for zone device
 type
Date: Fri, 28 Jan 2022 15:22:46 +1100
Message-ID: <1953720.XltcCvqqDp@nvdebian>
In-Reply-To: <20220127030949.19396-8-alex.sierra@amd.com>
References: <20220127030949.19396-1-alex.sierra@amd.com>
 <20220127030949.19396-8-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: drhqmail201.nvidia.com (10.126.190.180) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 289a033c-2dad-4f9f-0712-08d9e215d9b5
X-MS-TrafficTypeDiagnostic: MN2PR12MB3247:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB324782C61C27A4FA2018246BDF229@MN2PR12MB3247.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IkaLWfd66SYA0BCiyU4wf23PASo33jVAFBzZW+KuwnVFm8tpioNRXCApP+CQZBrwrO6B1F3tP80fwHTUl+RoIUsOaBeM4FX0EOxiaR3zgtXzAtPW5E0eiFCv5qUsdbS9GhKkdaA21grLyOoEUCtNHREmsgVqKy2tyN33Rc1VyRY7dNIyY9eVdGU5Z9WrQgQ+MlC6ssDij8Fpk+WbOsqbvfTZvxpVoAr2J7EYqd95J9BQZaaeomLnh9veXtZoWP4dI3xR+MZv0fTbPCimCqcIjCmzD+EJ5Sxok/DlGFIquPg1VcmmiAELeKGKO+SOwDttccR8n7JYx7Xtf2zB5QO6XWB7k3ZDRg5EPrNI8F9vH8b0KIlft3jpFAesCxE4ePQcoCTvAKU7HxJiZPNuSGAb66sK+1MEMTjb/GnFf0k/5+qUlj+nYfMrfNB+L3Q+c87ypKoC8QK9KwWIJ+nUIZehdSdBckQ3nA3tfj5KH8N8S5BJIkrnxsiXMybLcyDeBQRnCZY/hRxPAdSSZ8hzoBIp1uXdjOmOXM344u7Fs3RDehk6FbXSUDs7dGkxfa2yqSIS9oI6uVXo535jtZFFk44toJCz3qZYJoiaQ8OvdkNw05MHfQaYH4xaphQUiMU6tnIdfbGoWXh3AJkuDCT9nIRULExE8qlr4Rbefatv+TF6tpzS2gs1rv9iCsniy2kxax9xvgYntgFHHTwpHWGglPgW96dkurJ3Mz6hO03FTqcVmeD/DYfT0jcukPcBw0WQ02x+6o5fUJi19dUA5I+LJAk5n0RXlnQbpbiMlodOSXHm9p4=
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(40470700004)(46966006)(36840700001)(81166007)(82310400004)(40460700003)(356005)(47076005)(70586007)(186003)(9686003)(426003)(54906003)(9576002)(110136005)(33716001)(36860700001)(86362001)(2906002)(508600001)(26005)(8676002)(83380400001)(5660300002)(7416002)(336012)(16526019)(316002)(4326008)(8936002)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 04:22:52.3096 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 289a033c-2dad-4f9f-0712-08d9e215d9b5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3247
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
Cc: amd-gfx@lists.freedesktop.org, willy@infradead.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the updates, looks good now.

Reviewed-by: Alistair Popple <apopple@nvidia.com>

On Thursday, 27 January 2022 2:09:46 PM AEDT Alex Sierra wrote:
> In order to configure device coherent in test_hmm, two module parameters
> should be passed, which correspond to the SP start address of each
> device (2) spm_addr_dev0 & spm_addr_dev1. If no parameters are passed,
> private device type is configured.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  lib/test_hmm.c      | 73 ++++++++++++++++++++++++++++++++-------------
>  lib/test_hmm_uapi.h |  1 +
>  2 files changed, 53 insertions(+), 21 deletions(-)
> 
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index fb1fa7c6fa98..6f068f7c4ee3 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -34,6 +34,16 @@
>  #define DEVMEM_CHUNK_SIZE		(256 * 1024 * 1024U)
>  #define DEVMEM_CHUNKS_RESERVE		16
>  
> +static unsigned long spm_addr_dev0;
> +module_param(spm_addr_dev0, long, 0644);
> +MODULE_PARM_DESC(spm_addr_dev0,
> +		"Specify start address for SPM (special purpose memory) used for device 0. By setting this Coherent device type will be used. Make sure spm_addr_dev1 is set too. Minimum SPM size should be DEVMEM_CHUNK_SIZE.");
> +
> +static unsigned long spm_addr_dev1;
> +module_param(spm_addr_dev1, long, 0644);
> +MODULE_PARM_DESC(spm_addr_dev1,
> +		"Specify start address for SPM (special purpose memory) used for device 1. By setting this Coherent device type will be used. Make sure spm_addr_dev0 is set too. Minimum SPM size should be DEVMEM_CHUNK_SIZE.");
> +
>  static const struct dev_pagemap_ops dmirror_devmem_ops;
>  static const struct mmu_interval_notifier_ops dmirror_min_ops;
>  static dev_t dmirror_dev;
> @@ -452,28 +462,44 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
>  	return ret;
>  }
>  
> -static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
> +static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
>  				   struct page **ppage)
>  {
>  	struct dmirror_chunk *devmem;
> -	struct resource *res;
> +	struct resource *res = NULL;
>  	unsigned long pfn;
>  	unsigned long pfn_first;
>  	unsigned long pfn_last;
>  	void *ptr;
> +	int ret = -ENOMEM;
>  
>  	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
>  	if (!devmem)
> -		return false;
> +		return ret;
>  
> -	res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
> -				      "hmm_dmirror");
> -	if (IS_ERR(res))
> +	switch (mdevice->zone_device_type) {
> +	case HMM_DMIRROR_MEMORY_DEVICE_PRIVATE:
> +		res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
> +					      "hmm_dmirror");
> +		if (IS_ERR_OR_NULL(res))
> +			goto err_devmem;
> +		devmem->pagemap.range.start = res->start;
> +		devmem->pagemap.range.end = res->end;
> +		devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
> +		break;
> +	case HMM_DMIRROR_MEMORY_DEVICE_COHERENT:
> +		devmem->pagemap.range.start = (MINOR(mdevice->cdevice.dev) - 2) ?
> +							spm_addr_dev0 :
> +							spm_addr_dev1;
> +		devmem->pagemap.range.end = devmem->pagemap.range.start +
> +					    DEVMEM_CHUNK_SIZE - 1;
> +		devmem->pagemap.type = MEMORY_DEVICE_COHERENT;
> +		break;
> +	default:
> +		ret = -EINVAL;
>  		goto err_devmem;
> +	}
>  
> -	devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
> -	devmem->pagemap.range.start = res->start;
> -	devmem->pagemap.range.end = res->end;
>  	devmem->pagemap.nr_range = 1;
>  	devmem->pagemap.ops = &dmirror_devmem_ops;
>  	devmem->pagemap.owner = mdevice;
> @@ -494,10 +520,14 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
>  		mdevice->devmem_capacity = new_capacity;
>  		mdevice->devmem_chunks = new_chunks;
>  	}
> -
>  	ptr = memremap_pages(&devmem->pagemap, numa_node_id());
> -	if (IS_ERR(ptr))
> +	if (IS_ERR_OR_NULL(ptr)) {
> +		if (ptr)
> +			ret = PTR_ERR(ptr);
> +		else
> +			ret = -EFAULT;
>  		goto err_release;
> +	}
>  
>  	devmem->mdevice = mdevice;
>  	pfn_first = devmem->pagemap.range.start >> PAGE_SHIFT;
> @@ -526,15 +556,17 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
>  	}
>  	spin_unlock(&mdevice->lock);
>  
> -	return true;
> +	return 0;
>  
>  err_release:
>  	mutex_unlock(&mdevice->devmem_lock);
> -	release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
> +	if (res && devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
> +		release_mem_region(devmem->pagemap.range.start,
> +				   range_len(&devmem->pagemap.range));
>  err_devmem:
>  	kfree(devmem);
>  
> -	return false;
> +	return ret;
>  }
>  
>  static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
> @@ -559,7 +591,7 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
>  		spin_unlock(&mdevice->lock);
>  	} else {
>  		spin_unlock(&mdevice->lock);
> -		if (!dmirror_allocate_chunk(mdevice, &dpage))
> +		if (dmirror_allocate_chunk(mdevice, &dpage))
>  			goto error;
>  	}
>  
> @@ -1219,10 +1251,8 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
>  	if (ret)
>  		return ret;
>  
> -	/* Build a list of free ZONE_DEVICE private struct pages */
> -	dmirror_allocate_chunk(mdevice, NULL);
> -
> -	return 0;
> +	/* Build a list of free ZONE_DEVICE struct pages */
> +	return dmirror_allocate_chunk(mdevice, NULL);
>  }
>  
>  static void dmirror_device_remove(struct dmirror_device *mdevice)
> @@ -1235,8 +1265,9 @@ static void dmirror_device_remove(struct dmirror_device *mdevice)
>  				mdevice->devmem_chunks[i];
>  
>  			memunmap_pages(&devmem->pagemap);
> -			release_mem_region(devmem->pagemap.range.start,
> -					   range_len(&devmem->pagemap.range));
> +			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
> +				release_mem_region(devmem->pagemap.range.start,
> +						   range_len(&devmem->pagemap.range));
>  			kfree(devmem);
>  		}
>  		kfree(mdevice->devmem_chunks);
> diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
> index 17f842f1aa02..625f3690d086 100644
> --- a/lib/test_hmm_uapi.h
> +++ b/lib/test_hmm_uapi.h
> @@ -68,6 +68,7 @@ enum {
>  enum {
>  	/* 0 is reserved to catch uninitialized type fields */
>  	HMM_DMIRROR_MEMORY_DEVICE_PRIVATE = 1,
> +	HMM_DMIRROR_MEMORY_DEVICE_COHERENT,
>  };
>  
>  #endif /* _LIB_TEST_HMM_UAPI_H */
> 




