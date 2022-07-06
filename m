Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A74256912F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 19:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39CC10F961;
	Wed,  6 Jul 2022 17:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65DA10F1EF;
 Wed,  6 Jul 2022 17:55:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaWtvd19aulZbPhwD9qcSquW7kMVXuXPvZRmKnKrxGhMDEGeGwOocL3jfUAD3J3tkx6EYYJFODcfoneqM6qx+0PFntX6lR1X9660C8vrrBdXIZNCYIPNO3iWoe6JnB2SJZV4IqTfJ0YLFdFuP+3iUt1BErRutsurdc312BWjhfp4yqGuJwonffS47l98BWeQPiz1c2B9qSzVlz54ef9pYx5MuJvUB/N8XsTIr8z/3l0LnQQMbz/GmiJ1Z1CoLLtrrgQY/vwfS5nuVmRYsmHH9g7HU2vEKKqOMYpLgEEocmkX30t2CaLn0PXHvzGROcAiADn6wkclXtrnHZzaPoGtCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5cTevNhm/cTglUKGGCWZ5XUBJxNK4qv5jWcrX81SHQ=;
 b=LXF7RJfrX7HFnGQo13bBInBO3twjndpmwfjIkNUi4YbaRgQMP3rbLLail4IZlzZBTUHUC/6kPjWFGUHJZQsdhR+beFxddE+C8eV6UZ0rws4jv6laJ6IOw03BiR5fFN6T6yeiUeS+CWkVmrBhupig4wKQOpUdw/N/MCSPVCGF5KK4YU811uvHd9ZGmgSSguMHu3VJbykkCuNZvzomIUd8UGmjtVM1I1YVbMxB5YnHsihZHCFqv3kZLWXmpDUI3uamFWVpqG+6i1ctV9+R3wRL6Jc+TUz8aT67CjcWW/yO2HYdoClUbrEcDn8WSS7DZd5smcSxypfROvwl+uFqw41bdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5cTevNhm/cTglUKGGCWZ5XUBJxNK4qv5jWcrX81SHQ=;
 b=hPG8rLDpi3E4m8QvjphSmjaIgtvwck3AIQdVpm8kntfgRZfw+DF3suSRBGEY28gXEetqI9wX28H5Xeonlp1IURyDNppstWFJ0ikcMcQVck9ftPpcbJxJ8Ss3kN3a5Wl8gNsfw5KlwhMjlOEqt3s0TkZs2dhOF7DgNdF1blWRbSrjcl5PAAsaednETrrwXFVkmKv2gbuE6om5UoeTz1Rv1ZjBdFM2HOo8uqPoc1KIT8l8F0c3wirPKVNlhosm0Eig5lnIgJVCvrb6fG1BdE18XSf94GPh6wKMKsmbGwODo0xqrrVx1LrxhHfD4SEa2/NUKUeLCyPyh9q9uYAq2gcthw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN0PR12MB6296.namprd12.prod.outlook.com (2603:10b6:208:3d3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Wed, 6 Jul
 2022 17:55:20 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 17:55:20 +0000
Date: Wed, 6 Jul 2022 14:55:19 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [RFT][PATCH v2 5/9] vfio/ap: Remove redundant pfn
Message-ID: <20220706175519.GM693670@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-6-nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706062759.24946-6-nicolinc@nvidia.com>
X-ClientProxiedBy: MN2PR19CA0035.namprd19.prod.outlook.com
 (2603:10b6:208:178::48) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97333205-4dac-4854-c829-08da5f78b13e
X-MS-TrafficTypeDiagnostic: MN0PR12MB6296:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QNFGHl6/RhePSPbBFS+Db5oSXnbssQ7wLudWtQTTP6Ksz+Xt00WSheQ4PsI+kARzx8bq+Hazfxuys/tkPg4FBTV+WZ5v6dGTW/CjzxweIk3+bHY5ATh+xo22H8NVKOOf7xSLnA9GsE4LJSWVHqgX7sy4Mc/XMPT5+xBavMez9gDIg7lNVdQ0ew3ZvVkqbhbzuNbnfMeO0qWoHptiLi9kmNxuNogXoVEdG1NZQc5maQrurKJeDsk9wYEOqLyeSy3wY1jZ+N7CztpC/AI6AIM/KqePaaRlXzS0QAN32lVOS8h+b1YhPHzAJIcPVFMAODy9zD1UCYfSjauuWkdATI/qLFnkKSWRYA7Sv17ugGpx0MKVIZgexRjNXatvmcqlBou5B4SdTYynXnldz2L3cL7UbP6+SeLrA9xVNSpjZgsCe8a4jzUqZ5diXjXUB8ZXHti3zmGVh63Xd1A3gTpbim1RsEsej26QaSHEvSgYinGmxonIrOthC4RCr1moAwufKhr+9H9bZfV57PoH9aK1kQzMhxmXdx2JN00o1H0gVKVbFawdWh8aMQfl0hoSDB1LM6Sqi2tZY1kY7yRny3hdrFSZu6DCt4UhSyien3DPw+0FP5I2B10k+AazDNZcffAMioNPsK6uGw+i9YO4SJrz1wha/3YsWuzoF+YXEKuQ7Cw2ps34iTYW6PGt/BDnzJWJWcbrO/f0vHXRD4nY3a1ZKFthRhHj3qsox+kqIkB4xDU8+WriiYhQcNTQDemBKJEPnaKpo+D90RKVuoex1dPGSwKfD2M0lXR3OX9czGXaXv+ZkcoZ6kD9oN03aOfxVoWOM2qB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(478600001)(5660300002)(6862004)(7416002)(8936002)(316002)(66556008)(37006003)(7406005)(8676002)(6636002)(4326008)(6486002)(66946007)(66476007)(33656002)(86362001)(83380400001)(2616005)(186003)(1076003)(26005)(6512007)(38100700002)(6506007)(36756003)(2906002)(41300700001)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kZDq6NxBcCZ/wRPySc8Wv+INmVWafff6iAxwgpHnuDqfh7i9uyZ7Z2Pi44ZW?=
 =?us-ascii?Q?Ldv5lxqRpVa3nDc2yK3QUfVS7OxQ99SrU/gnYkZvzFPhVjKtI8P55K1dcaxv?=
 =?us-ascii?Q?V68l+HCQftGTdidaph6FNEDiuYXzEEUq8fyKzmY83faqqTpmAu3lLLdhLYTs?=
 =?us-ascii?Q?m0G1Csc6F4qMuFmiG+9kyr059tv/IwZ4oSAvjKvDgNf8/V3z+Ca4Y31AqK9t?=
 =?us-ascii?Q?dmJVQKKBSEAGGcu+HKhIh4HNiip/T0lnwlEp6jGpA8tLFqgF5RYwC1M8PMSO?=
 =?us-ascii?Q?BHC/fG50VN4r2awKtD5gvjxvXalwagkXNjPvfFcTQqmwz07OaWwMH/uZjZQe?=
 =?us-ascii?Q?I7oUUOqWGxwBYbex404e02YaumtORD5CCYlgZrg4wn8JO9XexcSIoef8f0mH?=
 =?us-ascii?Q?TfeDuqgBrVqXNMoeisWGr4XQvPMHz2OkjIv57bt19OISL6b4HSUKaIK0LRGU?=
 =?us-ascii?Q?nIcBA8MO18dikSh/Ow2GCHmsW6mjFn7/QQMwFVty2A6E53jX6eXvYy/zUHk4?=
 =?us-ascii?Q?wPBrco0OgkANybOGEUUNFqQgZCrDj+SHblYQ5Foi+jxRpdzW6PmA/qRouxWC?=
 =?us-ascii?Q?0uDyvw+dSKkM0JZq64qE4N38c6sQiLwCMvmUwk9iKT61iBDk7juxQXVmRh5j?=
 =?us-ascii?Q?TSxwbnOH7qS/dhTet2bXpHeACilKlYBotkurOgEodk831owwbv+LhkOT0GUy?=
 =?us-ascii?Q?eQogBeszuhWi+ZX96vCpjqkpsFUO7mefw5WaCAMOcZoeuKaqZLRXYC8kwzbs?=
 =?us-ascii?Q?qOqyWkURcD6zVprAGrh3SnoB31DvuOv+kXsW3tOvwplJjrNsItilfTF6oBQz?=
 =?us-ascii?Q?6mkW4YREpl2ZFVMHtX4wxgcAkc20AfZMK2HeOjmBsq/F1cNaS6hfNF9OeLSe?=
 =?us-ascii?Q?6PvXX2pE9sWrERhwxBR9+PTWvZOVXgKE21muIGv8ut7zRThSo8OCPRX+JL7u?=
 =?us-ascii?Q?1ToyzyfHHuCfUJ/VHpqAiP8XdPSlE7V73v7A+fpAee2MRas7NN/ll8DQN9ad?=
 =?us-ascii?Q?2B6cJdF5347XVA+u2TB4+8nhqhetKHEMlVMX2n4B/AlpR+wL4wJRm1GngadH?=
 =?us-ascii?Q?JvaLI4WvTjgLex7QUbMpvON9jB+brAlJk++FfKKc242LWSz+if8Ed6rq0vzQ?=
 =?us-ascii?Q?ffqYhir3sHhJvRR4YaGZWoDJCzo7nfPDTfBk2CtlZAuyddiBlZUwf656wgt1?=
 =?us-ascii?Q?HqbfrTSIdXsvn7e1vFA9j2CHqdvtcXKV/MRipy78vMjRxjy8c2S2eVrRGygt?=
 =?us-ascii?Q?NJgkLrxsFNmnmIwOIFPHSfbHIIiseft8/wEhzBoajN2VhXPSZMycng/nwPzP?=
 =?us-ascii?Q?voPNTVbAFoonYuO7aKInEMPicNnZoxGlKBoDbNUeLb/OA0p7IgINhrK7IYZh?=
 =?us-ascii?Q?reeo3Vz08qrOiEgTcqOWwf2bX3TvKOiWkgMEtA9ooPk1fi+oaE70Wyr4UUrd?=
 =?us-ascii?Q?H57CQG2mzWJTfYDbCsu3pXMUpWjdYty3eTC/0JCHtgm40x63jsvMTTFjpjXl?=
 =?us-ascii?Q?KR5/7EIxK2+R+W73xjrpykVKbcTUA0htw324/JcVNs9rr9kSeBzobSpWS+Fl?=
 =?us-ascii?Q?BaxJc6kKj0Kald9P2n+jjI03Wwac3JRTm+IpMoja?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97333205-4dac-4854-c829-08da5f78b13e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 17:55:20.2304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLqRGVOde5F/Dg2d+amEbiFZzO+RP4FcOHOMTF4nRIrIGze4Mez2jgMh0+rGKMnj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6296
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
Cc: mjrosato@linux.ibm.com, linux-doc@vger.kernel.org, airlied@linux.ie,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kwankhede@nvidia.com, vneethv@linux.ibm.com,
 agordeev@linux.ibm.com, hch@infradead.org, kvm@vger.kernel.org, corbet@lwn.net,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, jjherne@linux.ibm.com,
 farman@linux.ibm.com, jchrist@linux.ibm.com, gor@linux.ibm.com,
 linux-s390@vger.kernel.org, hca@linux.ibm.com, alex.williamson@redhat.com,
 freude@linux.ibm.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 tvrtko.ursulin@linux.intel.com, cohuck@redhat.com, oberpar@linux.ibm.com,
 svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 05, 2022 at 11:27:55PM -0700, Nicolin Chen wrote:
> The vfio_ap_ops code maintains both nib address and its PFN, which
> is redundant, merely because vfio_pin/unpin_pages API wanted pfn.
> Since vfio_pin/unpin_pages() now accept "iova", remove duplicated
> pfn code in their callers too.

I would describe this as renaming saved_pfn to saved_iova

>   *
>   * @vcpu: the object representing the vcpu executing the PQAP(AQIC) instruction.
>   * @nib: the location for storing the nib address.
> - * @g_pfn: the location for storing the page frame number of the page containing
> - *	   the nib.
>   *
>   * When the PQAP(AQIC) instruction is executed, general register 2 contains the
>   * address of the notification indicator byte (nib) used for IRQ notification.
> - * This function parses the nib from gr2 and calculates the page frame
> - * number for the guest of the page containing the nib. The values are
> - * stored in @nib and @g_pfn respectively.
> - *
> - * The g_pfn of the nib is then validated to ensure the nib address is valid.
> + * This function parses and validate the nib from gr2.
>   *
>   * Return: returns zero if the nib address is a valid; otherwise, returns
>   *	   -EINVAL.
>   */
> -static int vfio_ap_validate_nib(struct kvm_vcpu *vcpu, unsigned long *nib,
> -				unsigned long *g_pfn)
> +static int vfio_ap_validate_nib(struct kvm_vcpu *vcpu, dma_addr_t *nib)
>  {
>  	*nib = vcpu->run->s.regs.gprs[2];
> -	*g_pfn = *nib >> PAGE_SHIFT;
>  
> -	if (kvm_is_error_hva(gfn_to_hva(vcpu->kvm, *g_pfn)))
> +	if (kvm_is_error_hva(gfn_to_hva(vcpu->kvm, *nib >> PAGE_SHIFT)))
>  		return -EINVAL;

This existing code is fishy. nib is either an IOVA passed to
vfio_pin_pages() or a GFN passed to gfn_to_hva(). These are not the
same thing and are not interchangable - writing code like this assumes
that the guest is running with iommu=pt or no iommu.

Someone should look at it..

Otherwise it looks OK

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
