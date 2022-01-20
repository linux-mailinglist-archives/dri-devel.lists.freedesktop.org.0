Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFFA4946C6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 06:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5BB10E692;
	Thu, 20 Jan 2022 05:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6609910E692;
 Thu, 20 Jan 2022 05:23:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uc/3BGLrr0LLmxm39s5lwRZzivBWutjukTXGexf/LpRm9NLRvx3J3AI92idNkgaeUgUHimof5dClFM2FbhTfhsUPMbhmvfuaiTajTkFQ+/q93VJ+8hVDtqOzT9dNwWSCuKj60JggnxQFfCL0+n/C8EyqOfEn063u+6O7jUQ+PCz3LIj4zxDFXB7JJSKjFC4nuJxip+3e3i0TmgihcDAvURykWnCRHQTyo/63sTaJYk/YtDDMmkRg619mFvp5dUEbMT8+CH/4yq/mDccE1U0EmB1uMX3MUrad4rAaGDrq/jECR/JJ3uZd+TGS6UsT9jrd7z1p5iBiQ7XUTeM5F03o2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tqgyT7KUs0dgHrDS3fMbZMfbZ2wohUDOsIB+k8xXIA=;
 b=UNm7donu0xQ6PI3HOlG7ILVqIb3MGlwpRIlLibAcq+hFZAz6ubkOWUowlIY533bsgJaHcmiBG3AbGIvULZDLbOrQkyjy1+QxZHn1Mg0/qHuRe6iQC6OG2lvy7A6S1Rp8BdoP0u/MHNRBIGSyY4e9fQU/PavdDWUFgBT3RRRNu9nIieRbgn7zQLm4OJrIIYoIs9uo3r9h14llRLs5OhDLQCitpnLGPz/+XiVfRivNYKfTCO9dbkpvdSXPUQknMbrSqeeY9Z70DSL6DkneLuFVHAqS/ejrxErzc/ZtM0kNpqM34ixDxA0cU2Q0K6kC+fmU4n+4325oHoUMlSNtyHWVIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tqgyT7KUs0dgHrDS3fMbZMfbZ2wohUDOsIB+k8xXIA=;
 b=jI34DeuyHeE1FYdBcei6Y+UhissR9MMSu3+CxsDnXmhq65XJSB6+uIfvq6l9ekQCwl/iXTVauxxBq8SV+QkLxT2iCvhHmNwvsaOHdkWM7SYlBb7UMT2KQ8kftA6ZkQZ/xtZq47gLi4PL/ClhR5RIuH8R0gapoudpcPpzMQmGAQJISuhJxxv8sxDTlod/PIUWguNJ7w25X41pHkwKYBMDkWtf5Dibk8lWMszZabW3aqT/89jEHrrgttpsg/OzVJOELwpGLULT+a0V5DotFLrm9xao2gsmkWFFCq6RciFOIFduFPfvX4qQXDVyL5VxGoO3A/c+24Ki0wzQXbnslpzKkQ==
Received: from DM6PR04CA0014.namprd04.prod.outlook.com (2603:10b6:5:334::19)
 by BN6PR12MB1172.namprd12.prod.outlook.com (2603:10b6:404:1f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 05:23:16 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::8a) by DM6PR04CA0014.outlook.office365.com
 (2603:10b6:5:334::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Thu, 20 Jan 2022 05:23:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Thu, 20 Jan 2022 05:23:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 20 Jan 2022 05:23:15 +0000
Received: from nvdebian.localnet (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.9; Wed, 19 Jan 2022
 21:23:12 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v3 07/10] lib: test_hmm add module param for zone device
 type
Date: Thu, 20 Jan 2022 16:23:10 +1100
Message-ID: <2313181.3HZiDsDWk4@nvdebian>
In-Reply-To: <20220110223201.31024-8-alex.sierra@amd.com>
References: <20220110223201.31024-1-alex.sierra@amd.com>
 <20220110223201.31024-8-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea3cb3ae-8da7-4688-7478-08d9dbd4f684
X-MS-TrafficTypeDiagnostic: BN6PR12MB1172:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB11726D497D406D267FA81AC4DF5A9@BN6PR12MB1172.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FMJ9Z93O12mkPj5DCCUweUxKe9Kcp8Zegmi6vy/dhBucV8jo/ktF+lMbcvia5SoN/BPtcO+UKNakyf6PpwB/003wZ8xsJiCL7GEM35ufdMJnjOBhX7quU/BnijU5sK1DRW443SB61R1JUgEyYjwATmoEgyznX6+2XZaDY7gvVzacrmacl5IetyEJDjgI+5FcQpTD7WiuKbOGiwplgfDkMtkja6P3vxDg65j4ZcRtev94/QMXqIg0dpCBxh+9AsJG8K4f8N+Kg70yBkZIvWf4l8joqW76pkzcLokcbY+GBvBPfr8hoCFxFejjiaFIvcvFpB6Bgx4TsCo4up2fkzhn5RV0PCbdkG/4XmcRL4hOP3+naAos8xfZ3n3zVUv2YZnZDhPpjZ3u3bPzLLlT2edRqG+edB3VwbUW6v/PqSALIad2yYaZNFAYiCEixRG7bSnSF6Gg5eGHYSnfUG6zrEQD1GgnUGJ9pnsdO9ZMfI/wd+uSAzIOMTVlLaKDGzU4grPsJT4RY2bpptjeJ/E3Gdgn/OeMC8XtY/by3kcX0PQJ221uDT58fJHxJjafr6ApWvE4W1z0utzZA5D0N0DEUiYURLx7UhdbMLMaf++Zax38hL/kQ4pzI2rkKS6W+LbPQEfoCW0ZOfqt1bKuTpx25G1yBKu0UJ29Jyx95+wmYIGdADWKA/BvCHlaT6LR5DV7bFEDbtKKLmSOIQCsuHpiSBweBxpO1dRUtyX2r0qY4VCR51ONbEMtv5fEtycz+eX/lzNoaCgZAwZxiUCyWBj8Q+aJe03UlJq+AGDvezbhNuLPMD5WDYGcUfBNGJswp5u4hD2j2RYU81qpIVIy2Ra9NE/RJCzRmTcv1lednpGdzooU9R8=
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(46966006)(40470700002)(36840700001)(356005)(26005)(36860700001)(508600001)(81166007)(336012)(82310400004)(426003)(83380400001)(70586007)(8936002)(8676002)(186003)(47076005)(40460700001)(16526019)(7416002)(9686003)(316002)(4326008)(86362001)(9576002)(5660300002)(2906002)(110136005)(33716001)(54906003)(70206006)(39026012)(334744004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 05:23:16.3811 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3cb3ae-8da7-4688-7478-08d9dbd4f684
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1172
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

Thanks for splitting the coherent devices into separate device nodes. Couple of
comments below.

On Tuesday, 11 January 2022 9:31:58 AM AEDT Alex Sierra wrote:
> In order to configure device coherent in test_hmm, two module parameters
> should be passed, which correspond to the SP start address of each
> device (2) spm_addr_dev0 & spm_addr_dev1. If no parameters are passed,
> private device type is configured.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  lib/test_hmm.c      | 74 +++++++++++++++++++++++++++++++--------------
>  lib/test_hmm_uapi.h |  1 +
>  2 files changed, 53 insertions(+), 22 deletions(-)
> 
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 97e48164d56a..9edeff52302e 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -34,6 +34,16 @@
>  #define DEVMEM_CHUNK_SIZE		(256 * 1024 * 1024U)
>  #define DEVMEM_CHUNKS_RESERVE		16
>  
> +static unsigned long spm_addr_dev0;
> +module_param(spm_addr_dev0, long, 0644);
> +MODULE_PARM_DESC(spm_addr_dev0,
> +		"Specify start address for SPM (special purpose memory) used for device 0. By setting this Coherent device type will be used. Make sure spm_addr_dev1 is set too");

It would be useful if you could mention the required size for this region
(ie. DEVMEM_CHUNK_SIZE).

> +
> +static unsigned long spm_addr_dev1;
> +module_param(spm_addr_dev1, long, 0644);
> +MODULE_PARM_DESC(spm_addr_dev1,
> +		"Specify start address for SPM (special purpose memory) used for device 1. By setting this Coherent device type will be used. Make sure spm_addr_dev0 is set too");
> +
>  static const struct dev_pagemap_ops dmirror_devmem_ops;
>  static const struct mmu_interval_notifier_ops dmirror_min_ops;
>  static dev_t dmirror_dev;
> @@ -452,29 +462,44 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
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
> -	mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;

What initialises mdevice->zone_device_type now? It looks like it needs to get
initialised in hmm_dmirror_init(), which would be easier to do in the previous
patch rather than adding it here in the first place.

> -	devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
> -	devmem->pagemap.range.start = res->start;
> -	devmem->pagemap.range.end = res->end;
>  	devmem->pagemap.nr_range = 1;
>  	devmem->pagemap.ops = &dmirror_devmem_ops;
>  	devmem->pagemap.owner = mdevice;
> @@ -495,10 +520,14 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
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
> @@ -527,15 +556,17 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
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
> @@ -560,7 +591,7 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
>  		spin_unlock(&mdevice->lock);
>  	} else {
>  		spin_unlock(&mdevice->lock);
> -		if (!dmirror_allocate_chunk(mdevice, &dpage))
> +		if (dmirror_allocate_chunk(mdevice, &dpage))
>  			goto error;
>  	}
>  
> @@ -1220,10 +1251,8 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
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
> @@ -1236,8 +1265,9 @@ static void dmirror_device_remove(struct dmirror_device *mdevice)
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




