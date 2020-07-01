Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55407210751
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 11:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA0E6E86A;
	Wed,  1 Jul 2020 09:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE90C6E86A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 09:03:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THOvmRVZ2jajf5/HjluTsi3HZX5o9DRj5CnESr3x636ZWSV6+P4aOfckUbsnLSmlcNUqWZwBiIPVqy5CMX/TLkAyq6Ge9niZKCRt5+TDhgNpXPkBinmlOtXyK8DC1hwsMyNjVok4rm3FWkoFL5NnzGvOxI6GvfvDk1BGumJ8Z8DJwJeziSxglSbMsSBRjDnXnBfLRAlNbfgPwp8eR6Bf9rRRPI2f1+z0VNczoLmSVZ17kHJQUa8Dgl+yjPAjtul7GdG/ujpVG6/dcbAuf3lvJewoN/4/bJ/h0VCDKApnx4vuLWnY1HqFP3yXxDQvwlZFptO4/urbGNjAybkJkhoxmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPzDmWb25pr5/waQduR4Mv4C3NpGiYFDbc274AI/zNk=;
 b=Jg66byMh+rpUiCTYM+hwtL716xg66NacwoGmG4g0M58mTiL1CgQnwSvPkTUNnszxehiNl8oEpPdn1hXljrwbg7H3KZ8eHhIVh+celgJ4SyavJ+5c6tXGUVMfEkNls14o0hu2PaFiCUiEpmqMeEh7uJuZraBfZc0OYmJtPkm3Hy1tuynkpBSdsQN45gQSVx4BNheOK4cd0osz2Bwt+RdtfcSkb80KowVKvonsn8BP2QB7+EgxD5avjLJvL7Z7+WHKOTyHUQW7w52iyJIFP+13fStJVTmAI7TWDeQyOvEKxGD05N3n0YEHGqu8gVDdT/aLgpp0/qgYJ32hpCk58fVMGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPzDmWb25pr5/waQduR4Mv4C3NpGiYFDbc274AI/zNk=;
 b=E49+ZnvNUyYgEnuTxZdenChuu09gm9Uybh34dNVWCiPlShIyuCMaDbcNV9pTD3EcSwt94jmsBavLoCRxLVg87O06GJTwuKAAhpvNVTyxfGNJvqlZkUDKAJcKO0e5F8rNBvH28Sum3BmYd03gvUzZTVdi1MYHDnN2VM1cbe5XK0Y=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3936.namprd12.prod.outlook.com (2603:10b6:208:16a::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Wed, 1 Jul
 2020 09:03:47 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3153.021; Wed, 1 Jul 2020
 09:03:47 +0000
Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>
References: <1593451903-30959-1-git-send-email-jianxin.xiong@intel.com>
 <20200629185152.GD25301@ziepe.ca>
 <MW3PR11MB4555A99038FA0CFC3ED80D3DE56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20200630173435.GK25301@ziepe.ca>
 <MW3PR11MB45553FA6D144BF1053571D98E56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9b4fa0c2-1661-6011-c552-e37b05f35938@amd.com>
Date: Wed, 1 Jul 2020 11:03:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <MW3PR11MB45553FA6D144BF1053571D98E56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.21 via Frontend Transport; Wed, 1 Jul 2020 09:03:45 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e0e0512d-ef21-4c0e-7c3b-08d81d9da98f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3936:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3936E9A6C05FB1F0D0BE7E3F836C0@MN2PR12MB3936.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3YFsZdC90r1o3rBdyt0v2/YW4agvs4wpPadU8OMRKUBAIjWUdUsdN+3wLHYnOmLEpJouxbRIVPnTjlJZlySm9C2uKSatoyaOL2bNhaWWDvAknUq1DUbLXtMVsCjfp/gX6OCLP/nZ0CGTiHBmXpO1hN8OHz9qzcXwYE2Jp75EIRWHZ9qB2cRCzjJA8UmfHvpNw09GcHL4m3+I1vmgFRvdcpGI7/PksH2vTbNJwBwQyR9tlTmWOdK4HcRLKFN6nEcjF+MgtNl1KFhPwjvEQ/8Dz7h20I7lgr2Ipa409QYf3TBzKtNoiXfb+J/6oVT5H154UnLPq0yiAn1BtTHJm+7iJNyGkRVCF7bKaXAh+mCPfxmmOeLAkeC4LrOuOeyN7xZK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(52116002)(66476007)(66946007)(6666004)(66556008)(83380400001)(316002)(110136005)(54906003)(2616005)(31696002)(478600001)(53546011)(6486002)(31686004)(86362001)(16526019)(186003)(8676002)(5660300002)(2906002)(8936002)(36756003)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ti2RJRmkCMtVJm1MCn/Rf4BjhTUd+Vy2ijFYppogjjN76MQ25ZV0LrTVaWuUXEF/VtPOFq/GhkD6CPKly1lUTiZ83BjST8riBJ8zKU5i1RCKlwiQoRmQta8drUQ0DaI/hnCuY/nPk9iEcXFy79hwivBylfFI6fbvn3OS0VvF5Ke9fkA1Oxi7LcwhnqBofIrkY2ScK80arIclDl0+6vK7W/C6UpDNUzZ809cuK0TkknjiUHPCyuBN5YmBWWuaUPNfxcsSxJwz04tW2EdXayoiJZRZsQ3CCA5jxhVtpMMHXR70gkJ4mM0dJCcPsQWnPex24QnR+ClyvcrZ8y4CYc49hk0Z8X19X1VEzwnPNgNkI6fb8wF7dz6RDQcLyEAP60elwKES/0VQhSRziB2PMPV2pW4qsEuw56jJb3x82BMSaGuPhlydtCILbRKp6I5Du+TFjJXzGvSTzIFCWZAr03uUvUHZwh0lbMnceK1N0IuVGa9FydM2AAGq1yWxN4PWZpsPCZNSHoDr8IROhHvYE87PYz8CTCRDAmVTpBIvVC5ns9hiX4fHYKkzuRja+cf+rPdW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e0512d-ef21-4c0e-7c3b-08d81d9da98f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 09:03:46.8576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEXHfPS4vt+j4iSuQtO/LtNBUgHXJwRAI4ouwnrBHO+cnzbhKOmjJ05XXMvmA593
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3936
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.06.20 um 20:46 schrieb Xiong, Jianxin:
>> -----Original Message-----
>> From: Jason Gunthorpe <jgg@ziepe.ca>
>> Sent: Tuesday, June 30, 2020 10:35 AM
>> To: Xiong, Jianxin <jianxin.xiong@intel.com>
>> Cc: linux-rdma@vger.kernel.org; Doug Ledford <dledford@redhat.com>; Sumit Semwal <sumit.semwal@linaro.org>; Leon Romanovsky
>> <leon@kernel.org>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig <christian.koenig@amd.com>
>> Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
>>
>> On Tue, Jun 30, 2020 at 05:21:33PM +0000, Xiong, Jianxin wrote:
>>>>> Heterogeneous Memory Management (HMM) utilizes
>>>>> mmu_interval_notifier and ZONE_DEVICE to support shared virtual
>>>>> address space and page migration between system memory and device
>>>>> memory. HMM doesn't support pinning device memory because pages
>>>>> located on device must be able to migrate to system memory when
>>>>> accessed by CPU. Peer-to-peer access is possible if the peer can
>>>>> handle page fault. For RDMA, that means the NIC must support on-demand paging.
>>>> peer-peer access is currently not possible with hmm_range_fault().
>>> Currently hmm_range_fault() always sets the cpu access flag and device
>>> private pages are migrated to the system RAM in the fault handler.
>>> However, it's possible to have a modified code flow to keep the device
>>> private page info for use with peer to peer access.
>> Sort of, but only within the same device, RDMA or anything else generic can't reach inside a DEVICE_PRIVATE and extract anything useful.
> But pfn is supposed to be all that is needed.
>
>>>> So.. this patch doesn't really do anything new? We could just make a MR against the DMA buf mmap and get to the same place?
>>> That's right, the patch alone is just half of the story. The
>>> functionality depends on availability of dma-buf exporter that can pin
>>> the device memory.
>> Well, what do you want to happen here? The RDMA parts are reasonable, but I don't want to add new functionality without a purpose - the
>> other parts need to be settled out first.
> At the RDMA side, we mainly want to check if the changes are acceptable. For example,
> the part about adding 'fd' to the device ops and the ioctl interface. All the previous
> comments are very helpful for us to refine the patch so that we can be ready when
> GPU side support becomes available.
>
>> The need for the dynamic mapping support for even the current DMA Buf hacky P2P users is really too bad. Can you get any GPU driver to
>> support non-dynamic mapping?
> We are working on direct direction.
>
>>>>> migrate to system RAM. This is due to the lack of knowledge about
>>>>> whether the importer can perform peer-to-peer access and the lack
>>>>> of resource limit control measure for GPU. For the first part, the
>>>>> latest dma-buf driver has a peer-to-peer flag for the importer,
>>>>> but the flag is currently tied to dynamic mapping support, which
>>>>> requires on-demand paging support from the NIC to work.
>>>> ODP for DMA buf?
>>> Right.
>> Hum. This is not actually so hard to do. The whole dma buf proposal would make a lot more sense if the 'dma buf MR' had to be the
>> dynamic kind and the driver had to provide the faulting. It would not be so hard to change mlx5 to be able to work like this, perhaps. (the
>> locking might be a bit tricky though)
> The main issue is that not all NICs support ODP.

You don't need on-demand paging support from the NIC for dynamic mapping 
to work.

All you need is the ability to stop wait for ongoing accesses to end and 
make sure that new ones grab a new mapping.

Apart from that this is a rather interesting work.

Regards,
Christian.

>
>>>>> There are a few possible ways to address these issues, such as
>>>>> decoupling peer-to-peer flag from dynamic mapping, allowing more
>>>>> leeway for individual drivers to make the pinning decision and
>>>>> adding GPU resource limit control via cgroup. We would like to get
>>>>> comments on this patch series with the assumption that device
>>>>> memory pinning via dma-buf is supported by some GPU drivers, and
>>>>> at the same time welcome open discussions on how to address the
>>>>> aforementioned issues as well as GPU-NIC peer-to-peer access solutions in general.
>>>> These seem like DMA buf problems, not RDMA problems, why are you
>>>> asking these questions with a RDMA patch set? The usual DMA buf people are not even Cc'd here.
>>> The intention is to have people from both RDMA and DMA buffer side to
>>> comment. Sumit Semwal is the DMA buffer maintainer according to the
>>> MAINTAINERS file. I agree more people could be invited to the discussion.
>>> Just added Christian Koenig to the cc-list.
>> Would be good to have added the drm lists too
> Thanks, cc'd dri-devel here, and will also do the same for the previous part of the thread.
>
>>> If the umem_description you mentioned is for information used to
>>> create the umem (e.g. a structure for all the parameters), then this would work better.
>> It would make some more sense, and avoid all these weird EOPNOTSUPPS.
> Good, thanks for the suggestion.
>
>> Jason

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
