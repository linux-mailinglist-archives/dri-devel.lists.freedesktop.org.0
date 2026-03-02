Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NFrIIBhpWmx+wUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 11:08:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E358C1D60F0
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 11:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F6310E482;
	Mon,  2 Mar 2026 10:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ijRKskdO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013037.outbound.protection.outlook.com
 [40.93.196.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7786E10E482
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 10:07:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U77wpS5bfmMN22ursMz4meGedEykHRg1OZ7zFvXR6Tq2PkIZVxpOc7ivm4yc+PG6RB9eea3+r7TQOliNgFm1+q7IBheOAGqqHrc3/Af2HlOUtfKU1sUwbiVb89hJpRWMXMVW20dAakevKFlnRa/woniyZ/etewkXGd2oytWAChOXLQLNTx3CwFCEQJ+n9TJ3pyQ8RySH9WlNPJbLYEYRUzLlJ/blUeYbfBn5DGWbcY+kOyOLojPIMCED19ZJE3GW0fLJViRMhMetvoZ02fpL9BlnBN7qM8CyH0CTJ50qLtCQo+706hLOZmP1KEjDPFKRxk84DIy72GDGgu5hH0YNhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/2NCaDgDDIB3WoYgBV7wMKYg0cWRLRw544yATMvLUg=;
 b=vPRsrPU+z9uS5UUkgfRkJsTF8ZX08iJAQezGRGq42MX04Z+n7G3LNYodpSoQlmeX6a/0YwO7ilG2ShiXfkSGhbHczLtKUXXFl7qzZzP1F4OHB6ApxWiVZimUhCBGXYvxSViXCDrYb86jn92RvseVJKy6IbAwNlzalhQLkX/pzFFOOqzixFij31g5PEuyfUOB4EGTE5RNIbLgEhYPZ9tYS6vIDEJEt/0MNkL2nagT1W9c06qhl0KPFRWo6LYVpAFJKi3dNfDwpj3AtFBpMyQ3ZV+VD+/PwVVDpoxJT0P0bA1j6wAxXmn0Gl+/yRHf5NytsGrWMo405XrTzSs5wt8b7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/2NCaDgDDIB3WoYgBV7wMKYg0cWRLRw544yATMvLUg=;
 b=ijRKskdOq8y6nPf9qIQz+Fnkv8PCgeaurLjwB9PWPTtaO6e57ikENJOK4jrXGjea91g0jK5+hLEL/garDVbyX74q2egW0AFL3GI+XhCrR2VaiC7pcqyZQZlO/QklvnTy8x8IvaAGYGLg2xvF2whlrq3U3y6PCMPgEDVeiOMJErQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL4PR12MB9478.namprd12.prod.outlook.com (2603:10b6:208:58e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 10:07:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.014; Mon, 2 Mar 2026
 10:07:52 +0000
Message-ID: <b729ebe1-aea2-4f45-bb3f-3b4b59078c8d@amd.com>
Date: Mon, 2 Mar 2026 11:07:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/7] vfio/pci: Support mmap() of a DMABUF
To: Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>
Cc: Matt Evans <mattev@meta.com>, Alex Williamson <alex@shazbot.org>,
 Leon Romanovsky <leon@kernel.org>, Mahmoud Adam <mngyadam@amazon.de>,
 David Matlack <dmatlack@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>,
 Pranjal Shrivastava <praan@google.com>, Alistair Popple
 <apopple@nvidia.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kvm@vger.kernel.org
References: <20260226202211.929005-1-mattev@meta.com>
 <20260226202211.929005-4-mattev@meta.com>
 <90bd4185-1e87-4393-b9e1-1318a656a7d9@amd.com>
 <20260227125109.GH5933@nvidia.com>
 <c5a8f318-20af-4d80-a279-2393192108c3@meta.com>
 <20260227194807.GL5933@nvidia.com>
 <aaISD4mw1XzQl1S8@devgpu015.cco6.facebook.com>
 <20260227220427.GM5933@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260227220427.GM5933@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0321.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL4PR12MB9478:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a235ec-eae0-4325-5967-08de784390b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: gv+j/TvPCDdvnk9Chohp8oXFeSWr8oYjlxeFBYEk7A13Ia3rDzTF4Z4dNJvbm6wNEW+ZmRegeZwWY6PfEiMLcvVpHRKyk5BF4ktWy9OS7F1LgLj/DZ/bGoX3+jE3DoAZU3c79FLN9QvyyJH1fUCAMKKgAAEgj27WC/yN+Hcs0An8TtJqaHbmtqvJk+Fa4lsAVXX9UBAh0roZ3Rfqd+meLMLg5qHvQo0q4RjdjALo1Kj9+6qho2XOYyl7n6Pcf1Ysoi9K9hit4ObxVkr4lFFpF3Nxgf89G6TG1JJA+sSfHpd97cZq92MpA0Ony1wQCwXpWhlOfmmgEIOV//aeo0A+cA5EhpBqTaR04Jr/2gbnzpv7VsFGs3cXhstj6AsGsgwMV5djorImozv7aW5euHA9PY5aq1qoEmco1fhtX/YBes509rh+x3fMBR614AdQyF7ppBR300kF3j2kQJBTGhJQUtWv/YVFfdJ7qnBl/HDVjdz2nwm0TRKposQ5/goflzUIJZEbPXe6bvheoZ43eA28i9siCOLtxrPmghi6xU+igE1MtXcA/zLG5DwjwGno6khq6j53Y53sHF6PecCzdOX5wYWcOsSwTjHPPTIalipZtyoJB/nFuBAFnCu8Brr4RL+Sx/rkX668fkugFk988qG0yRo7rFkanzGJDF1+2nRlD+6/OuMHOQGD45aUPoQKHcCg91mjwoKxST6KvP5OkCx3foQyCak6UDSgRrajHyoVjzw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVlVaDN0V25zRExWd252WGlIZ0pRVklJcXNqa3BnQkZhZXJWS2FvSlVXU3lS?=
 =?utf-8?B?Y2VrK0xndU5CU1BNc0QzUDVxY2ZnMlNNVVl0SDRxTDRqMWJ6SlNCUWFuVUd4?=
 =?utf-8?B?dEk1ZXRBTURjcFduTVpIdkpJV2wvY01vUi80Z3NnSFpQcW5NWldOb2syNGZl?=
 =?utf-8?B?V2tmRFNZUzZyWE8wbUd3NXZkNUVlNnZqRUdmR1Jib3J4TUdKaUpMejNPSEx6?=
 =?utf-8?B?SFF0cW9QaUpMdUJQaDZIS3gzOWNiLzQySUx1Y0drYnlJOWlVUS9veWJNQnBR?=
 =?utf-8?B?Z3JQUm85NmFmM3FjaE5OenZhSlVNTXNsZDFCWDRiZTZXbGxUM0ZMNzk4cHRp?=
 =?utf-8?B?THczdUNBaEZxbVh6enZMUW5OUTJRbFVCR0tvMWhYZE9xcmIyeTByditkdFVq?=
 =?utf-8?B?UnlBMTZsc1dQdlRoNmhzTTlEK3BiZXNSNXhwVFJ1L3RxaTVGck5uL0hydHc3?=
 =?utf-8?B?L3RFK0I2UzI3YnlUODZGbGpSdktabFdaaGJhRW4xbUFPSFFVOEdzdWRJQWl0?=
 =?utf-8?B?NnUzdjZBWnNZdjROM2dhcGNBdlF4Rk1QUllPSTdrdm5FK011cXdoS3FDVWJj?=
 =?utf-8?B?ZkhCdEIyd2QzNzI0UFJpTGxhSzZnT1NLUWROZ2k5TzJ3TmhaOGlRY3ZTQUlM?=
 =?utf-8?B?YjRSclgyMUtQSjN1Z0FtcGg2cFFhWW5uYS9scUNKYVhsODV3THRzcHdJd0Q3?=
 =?utf-8?B?cHlaWDhOWG0wcnhST3JIRHFBMk8rVnpmUUt3OTlKZEZnQ1h0OW5XZ2N5c2hX?=
 =?utf-8?B?cnp5MndINVhNWEZVbW10UlBrUzhhczYwUythYmxrc2MwV2llRjNoSUNqaUtn?=
 =?utf-8?B?aTB6ZFZ5YWd4NFhkcnFlZndLT0liU0s2eklzMkc3RGdTMS9YU2Z2MEpSYXhx?=
 =?utf-8?B?ekNDOW9BcE9oaWl5dkE0YnIzd3BpUTVGYlZSdlkwMlc5bVcxRHJaZW1CbW53?=
 =?utf-8?B?aThVNjEwcUN1K1VDcGsxNFpHMGZYaWQvNDBQL21hTE1rZ3hZUXBqdldjTWt5?=
 =?utf-8?B?VFhGSEorU0RrMzZNbjhweHozWGhVbnBkY25DZnlTUE1zbjVZSFFjMk1QdWlu?=
 =?utf-8?B?Z2VWcnBUYjl0NHR6M0dVanV4a2VKYU9Qb2hOQ3F0QVBZeHRtMjNTSGJ2UmRo?=
 =?utf-8?B?RjZOOVYxeFZ5eWFlWFJaK2p2NUx0N2JQMHBDdFp2YmRPcWNJNzYxaWc2NjVO?=
 =?utf-8?B?dG9kdXg0Y0l2RjB4TjNFWExnM2xqUE1QYXNBK2RnWjg0aFVlUFhXcEtnSVVY?=
 =?utf-8?B?bHRJZ1dKQ3hQbjIwV2FMVFZCZFkxdURodU5GMVFQbUhTOTRHMkdadkhFblo3?=
 =?utf-8?B?SXBRekpucTllYjJaQVl4a0YzdnFONjBKR3A2SUs5MFUvcDlEUEhhSWdqUmVH?=
 =?utf-8?B?aHp3ckxEa3BxclRHSitRYWNxbC9mdTFmVWJXY1dEb0hOMU5xSEFYVUZQWWp1?=
 =?utf-8?B?dkYrdXNwcFF5WXJqbm1lbzcvS1dPZkRJYWRFSzhhN0lGbllZVmNoRmxRSGlz?=
 =?utf-8?B?M3Rmb0xxa2psZ2xlQmJJMU1BSzgydGFTbUt5K0plMEllNzBacmdmc3lVcDYv?=
 =?utf-8?B?Y2hDYzZMV0wyczBxQzIreUpsa0dKYkdvTTQvRG9NdDFFRk82b3lGM1ZCV2ox?=
 =?utf-8?B?YlZEUHM4SExtZmxlcDhLaDVVWlQyNm5JdlE4ZlZ3OUtpNlVXTHRJcHRrRWxq?=
 =?utf-8?B?MzErMGFTNHlBQzQ3eHVXQll0ZklrNkdOaFhkTDRqcnl5VVF3Vm5wa1lacCtX?=
 =?utf-8?B?STEyWXdQZ3RqbE9xbkxLLy8vSVE4S1haZExaKzIyUmxMTnV2VDd3WmVjazJZ?=
 =?utf-8?B?L0NCdjYzdXNaNXRFTXg2MFN1R0F2MVMybjNFUXVvTC83cGxicTE1MGx4Uk9w?=
 =?utf-8?B?Ry93T1djVTRRUkM1LzdnZ3h3cnZRNHNETVlzM2NnaXBvZ3pZZGVWNi8veDl2?=
 =?utf-8?B?bzBKL2ljOHZKaFBnMG1peWd0YitIR2ljNEdNU0NlcC9pNHBOWFRJbmxCSklD?=
 =?utf-8?B?US9QUEFRckdENjdJelRFdlAxYk85SUNKUnVZWStST1RPL0wrdzR6VForZGk4?=
 =?utf-8?B?MG1wL3o1MnhHVy9IcjlaOWtUMGVDcE9Sa1hmQTFrZW9oK0dyWjRSblpvSUs0?=
 =?utf-8?B?WnBRMlN2YVBHRjZZd1VjU2UyVzBnbUJhdy9ZdFZmRTR6QUJMeit1a3FJbkJi?=
 =?utf-8?B?WUV1RXFpcTVlbzJmaFJOOXp5cFZpUE1icHRYSmhiNjRHNzZtc20wY2JBZ1Ix?=
 =?utf-8?B?S1hvQy8yUlFZRkFXdWV1MDJVd2Izd25ydHo3dGI3WmZWOFcyRDlHb1VQcTdz?=
 =?utf-8?Q?VVJswcN5vUFAGlJZHa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a235ec-eae0-4325-5967-08de784390b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 10:07:52.0313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMVcuhRSfJY1Wc3qa+zw/vkoaTQG1ULErrk06G3qUh5T93V6M6nGfxaqwWLOE4u0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9478
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgg@nvidia.com,m:amastro@fb.com,m:mattev@meta.com,m:alex@shazbot.org,m:leon@kernel.org,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E358C1D60F0
X-Rspamd-Action: no action

On 2/27/26 23:04, Jason Gunthorpe wrote:
> On Fri, Feb 27, 2026 at 01:52:15PM -0800, Alex Mastro wrote:
>> On Fri, Feb 27, 2026 at 03:48:07PM -0400, Jason Gunthorpe wrote:
>>>>> I actually would like to go the other way and have VFIO always have a
>>>>> DMABUF under the VMA's it mmaps because that will make it easy to
>>>>> finish the type1 emulation which requires finding dmabufs for the
>>>>> VMAs.
>>>
>>> This is a still better idea since it avoid duplicating the VMA flow
>>> into two parts..
>>
>> I suppose this would also compose with your idea to use dma-buf for
>> iommufd_compat support of VFIO_IOMMU_MAP_DMA of vfio device fd-backed mmap()s
>> [1]? Instead of needing to materialize a new dma-buf, you could use the existing
>> backing one?
> 
> Yeah, that too
> 
> I think it is a fairly easy progression:
> 
> 1) mmap_prepare() allocates a new dmabuf file * and sticks it in
>    desc->vm_file. Rework so all the vma_ops are using vm_file that is
>    a dmabuf. The allocated dmabuf has a singleton range

Interesting approach to fix this, but I would suggest something even simpler:

Use the same structure as base class for the VFIO and DMA-buf file for your vma->vm_file->private_data object.

The DMA-buf file actually contains the real ranges exposed by it and pointing to the exporting VFIO, while the one for the VFIO is just a dummy covering the whole range and pointing to itself.

This way you should be able to use the same vm_operations_struct for VMAs mapped through both DMA-buf and the VFIO file descriptors.


Independent of how you implement this just one additional warning: huge_fault has caused a number of really hard to debug problems on x86.

As far as I know background is that on x86 pte_special() only works on true leave pte but not pmd/pud.

That in turn results in some nasty surprises when your PFNs are potentially backed by struct pages, e.g. for direct I/O. For example on the resulting mmap() get_user_pages_fast() works, but get_user_pages() doesn't.

I hope that those problems aren't applicable here, but if it is Thomas from the Intel XE team can give you more details on that stuff.

Regards,
Christian.

> 2) Teach the fault handlers to support full range semantics
> 3) Use dmabuf revoke variables/etc in the mmap fault handlers
> 4) Move the address space from the vfio to the dmabuf
> 5) Allow mmaping the dmabuf fd directly which is now only a couple lines
> 
> I forget how all the different mmap implementations in vfio interact
> though - but I think the above is good for vfio-pci
> 
> Jason

