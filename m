Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCC8411166
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 10:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9146E444;
	Mon, 20 Sep 2021 08:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6086E444;
 Mon, 20 Sep 2021 08:54:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXfGo+t/Nvfaakr2fHfVcx42RKJMA8tv5nPlaqs5Hhpb/cUyM++nOZFHUNPOEXUwI0cJfR4ToYFD06ILfqHF3xfHklA6HngA37XWxut35zOouGWZpuzyqfWARPzBpxLXQhcbv8gM2FtZNYnY/OkT4mB5RfkM1vi9oRv5NfXBF0x6ZmXqujObmbEkW2vlqP1S2jFSsN6m71B6k58KLGq4xySZRBTiPMxFhPS9UwsmcdQ9/cV1FoKIVm0bkMEV6XGS/UkO/YlkRHqpOICmA5Zq2WhHzOCAmGwgRNMPRyMB0iqhegDcnw5Se4ORJLjI8YbZs5EqS0QtSzYS9VEhJovxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=JUceIt+GM9seT7Gz/liB7RnLt3FCLSaU1FsaVVvPJaw=;
 b=UNwM6iUpwDn62Pl48qVx82l2WMeKtz4tm9zKpJGX5ydWEB3V0KbRdohYLdwFo/hD9u53awXunBQp0osbu4ywx93pz3HIaC+ebEMoDyPmsZGvixT9DVMEJ63ld5TociKpItaJNPgvDMqqMGRuNJcMh9H6g3lD8r7d1gta7ifi1JhvgfEPPs0YcdOBINyFtymyIU+zBxq50X0c4A1oVX59NVtmeDaF3qnWW/fTpSQtoN2cCyGCysKzjlSY5Mnwg+RARso37YN19uiGZyVTG3US2gxh+hNfhVBvHKYQRrptuReR2yJMHqtEx2WOxgv3LrDn+FOUI9GU0M7rfmD5Ab5qgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUceIt+GM9seT7Gz/liB7RnLt3FCLSaU1FsaVVvPJaw=;
 b=nPGetTB52J2c3kuyw3rUZEp4FhX6q5UuOK+MpGIwI54IKpaAev4JiIxZBmRKLMl2ta8zBvUtidGNwhc3O9lCJnC4XAFV/V7yft3182+TjoTUs0W6o1RL2IS6gOvWpxFxlguIoRnKfI8leYGtHX9azpM4lDXgxZ19MDu7FvWCx/5GCnFpNfV55WGCtwJo+6lBYkCgCyKHtSqAWyD84se+t8p1V53uwvELlsVf/Bf8cBD6YjLx9/L5U+uRk15bVwXvX4e+aAcujQWaOy6wR26PLmVNRbTOm8Xbe3Qf99eDxo973i8neMoLx3SW6S9z6at3YNkOxncgCB/x8GRJlPJFYg==
Received: from DM5PR18CA0081.namprd18.prod.outlook.com (2603:10b6:3:3::19) by
 MWHPR12MB1390.namprd12.prod.outlook.com (2603:10b6:300:12::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16; Mon, 20 Sep 2021 08:54:01 +0000
Received: from DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:3:cafe::c8) by DM5PR18CA0081.outlook.office365.com
 (2603:10b6:3:3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Mon, 20 Sep 2021 08:54:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT019.mail.protection.outlook.com (10.13.172.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 08:54:00 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Sep
 2021 08:54:00 +0000
Received: from nvdebian.localnet (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Sep
 2021 08:53:57 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <hch@lst.de>, <jgg@nvidia.com>, <jglisse@redhat.com>
Subject: Re: [PATCH v2 09/12] lib: test_hmm add module param for zone device
 type
Date: Mon, 20 Sep 2021 18:53:55 +1000
Message-ID: <2139200.KYAmxeAneQ@nvdebian>
In-Reply-To: <20210913161604.31981-10-alex.sierra@amd.com>
References: <20210913161604.31981-1-alex.sierra@amd.com>
 <20210913161604.31981-10-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f01788d0-56d4-4643-682a-08d97c1430df
X-MS-TrafficTypeDiagnostic: MWHPR12MB1390:
X-Microsoft-Antispam-PRVS: <MWHPR12MB13901A254C8B26A2C138E6E5DFA09@MWHPR12MB1390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DHI0CdFcf90nTAB1Q53qLgqGngc/Sst9xJlCS5SPPemi1iWBVK3oTyeRN9GJEoqWobJUvskUR/BCIH8F4HC0iB6fHlABSo2G+vFbQk2mTqYp4PFb0jZN1w/6wU2nUAOTpiByPzoHb81ddui1VWLE/UsN8HgY7EcqcKEllhUuqFJeFpitqsWFZf1xbYlji42l4n2jYpWosBo7G0c3+knFA6vkUG2PozxGWM04gdW1Rkyxs62aczfm8DLIzkOTmuRfzl0M7/fj/7Qz3BYnWeIW7xa6CWGwhEK7RaVgusZJaX7Q+Oc5MNwwV1cZJ0R4Qs6OJwxqnZw4BF1y/AKsfhJrCceLVWk4Cdl0JOAZKrXKHXn/f+2tKUy2jU/St9GOUjkiP3dod7j8wNyzmvZar+ix89nXUkCp9YIHZf6OO9bDdviReAefPh/O9aQb3u2eK4RJSYr+qIhZVXeZRX+2IHsaYHN4DcAUS+UecFT4J7pWLR+wrnOnOzDcX7/bBGDHPnZmYXLXcuXnLSoNYwr/ztGK0PGPA1ni3M6EmS4IQfkr7GzysnWwtEgyB1NnHZA+Y1+tydTWtohjHXJItmF4TjdGkQ+eFpMOeqzodbrlGmhnJOgCkIxgpo0IFmSzB/Aj2ef3/uEJBXgQPNx8nvBy8qu+OMDNRDaEC9iMPBPG4qSAD1+1+COGbGDoBZvYUAaaVatdkAOUU2gIlRo68Jtp1coFBw==
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(36840700001)(46966006)(4326008)(8936002)(9576002)(7636003)(336012)(16526019)(356005)(7416002)(70206006)(82740400003)(9686003)(8676002)(316002)(83380400001)(26005)(110136005)(36906005)(36860700001)(54906003)(426003)(86362001)(5660300002)(33716001)(186003)(82310400003)(478600001)(47076005)(2906002)(70586007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 08:54:00.9744 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f01788d0-56d4-4643-682a-08d97c1430df
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1390
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

On Tuesday, 14 September 2021 2:16:01 AM AEST Alex Sierra wrote:
> In order to configure device public in test_hmm, two module parameters
> should be passed, which correspond to the SP start address of each
> device (2) spm_addr_dev0 & spm_addr_dev1. If no parameters are passed,
> private device type is configured.

It's a pity that testing this seems to require some amount of special setup to
test. Is there a way this could be made to work on a more standard setup
similar to how DEVICE_PRIVATE is tested?

> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
> v5:
> Remove devmem->pagemap.type = MEMORY_DEVICE_PRIVATE at
> dmirror_allocate_chunk that was forcing to configure pagemap.type
> to MEMORY_DEVICE_PRIVATE
> 
> v6:
> Check for null pointers for resource and memremap references
> at dmirror_allocate_chunk
> 
> v7:
> Due to patch dropped from these patch series "kernel: resource:
> lookup_resource as exported symbol", lookup_resource was not longer a
> callable function. This was used in public device configuration, to
> get start and end addresses, to create pgmap->range struct. This
> information is now taken directly from the spm_addr_devX parameters and
> the fixed size DEVMEM_CHUNK_SIZE.
> ---
>  lib/test_hmm.c      | 66 +++++++++++++++++++++++++++++++--------------
>  lib/test_hmm_uapi.h |  1 +
>  2 files changed, 47 insertions(+), 20 deletions(-)
> 
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 3cd91ca31dd7..ef27e355738a 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -33,6 +33,16 @@
>  #define DEVMEM_CHUNK_SIZE		(256 * 1024 * 1024U)
>  #define DEVMEM_CHUNKS_RESERVE		16
>  
> +static unsigned long spm_addr_dev0;
> +module_param(spm_addr_dev0, long, 0644);
> +MODULE_PARM_DESC(spm_addr_dev0,
> +		"Specify start address for SPM (special purpose memory) used for device 0. By setting this Generic device type will be used. Make sure spm_addr_dev1 is set too");
> +
> +static unsigned long spm_addr_dev1;
> +module_param(spm_addr_dev1, long, 0644);
> +MODULE_PARM_DESC(spm_addr_dev1,
> +		"Specify start address for SPM (special purpose memory) used for device 1. By setting this Generic device type will be used. Make sure spm_addr_dev0 is set too");
> +
>  static const struct dev_pagemap_ops dmirror_devmem_ops;
>  static const struct mmu_interval_notifier_ops dmirror_min_ops;
>  static dev_t dmirror_dev;
> @@ -450,11 +460,11 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
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
> @@ -462,17 +472,29 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
>  
>  	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
>  	if (!devmem)
> -		return false;
> +		return -ENOMEM;
>  
> -	res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
> -				      "hmm_dmirror");
> -	if (IS_ERR(res))
> -		goto err_devmem;
> +	if (!spm_addr_dev0 && !spm_addr_dev1) {
> +		res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
> +					      "hmm_dmirror");
> +		if (IS_ERR_OR_NULL(res))
> +			goto err_devmem;
> +		devmem->pagemap.range.start = res->start;
> +		devmem->pagemap.range.end = res->end;
> +		devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
> +		mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
> +	} else if (spm_addr_dev0 && spm_addr_dev1) {
> +		devmem->pagemap.range.start = MINOR(mdevice->cdevice.dev) ?
> +							spm_addr_dev0 :
> +							spm_addr_dev1;
> +		devmem->pagemap.range.end = devmem->pagemap.range.start +
> +					    DEVMEM_CHUNK_SIZE - 1;
> +		devmem->pagemap.type = MEMORY_DEVICE_PUBLIC;
> +		mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PUBLIC;
> +	} else {
> +		pr_err("Both spm_addr_dev parameters should be set\n");
> +	}
>  
> -	mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
> -	devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
> -	devmem->pagemap.range.start = res->start;
> -	devmem->pagemap.range.end = res->end;
>  	devmem->pagemap.nr_range = 1;
>  	devmem->pagemap.ops = &dmirror_devmem_ops;
>  	devmem->pagemap.owner = mdevice;
> @@ -493,10 +515,14 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
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
> @@ -529,7 +555,8 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
>  
>  err_release:
>  	mutex_unlock(&mdevice->devmem_lock);
> -	release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
> +	if (res)
> +		release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
>  err_devmem:
>  	kfree(devmem);
>  
> @@ -1097,10 +1124,8 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
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
> @@ -1113,8 +1138,9 @@ static void dmirror_device_remove(struct dmirror_device *mdevice)
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
> index ee88701793d5..00259d994410 100644
> --- a/lib/test_hmm_uapi.h
> +++ b/lib/test_hmm_uapi.h
> @@ -65,6 +65,7 @@ enum {
>  enum {
>  	/* 0 is reserved to catch uninitialized type fields */
>  	HMM_DMIRROR_MEMORY_DEVICE_PRIVATE = 1,
> +	HMM_DMIRROR_MEMORY_DEVICE_PUBLIC,
>  };
>  
>  #endif /* _LIB_TEST_HMM_UAPI_H */
> 




