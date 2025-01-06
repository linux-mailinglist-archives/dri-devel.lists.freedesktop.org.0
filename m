Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD240A02DBE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 17:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BEF10E202;
	Mon,  6 Jan 2025 16:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="V3b0V13M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C92910E2DB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 16:28:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u38o/BPaTYl9boRhzDQ9pEMhf5IJ5ey1TC4LebR4ApqpKu7FnHQ4tFlggPA74y3Vv3G/cW5FLt9V8NuvVINJ1hrChkcMaDyj6uXq2IRxUnORst0NUNLvhN6ywSLdnLvKkfdKbdsa9ZO0xfE2Rd/zk+LmIN5RBE7rpDvv+tRvo/1kl0hsFs32gxojc5yu5GiQX6pjY5Ng2I4p0FaniZUpHKm+iL+YsExGv5eVdP4wdPSPpo4XD5V+3Nqnu72nMxfUZyrOhAM3c3ELhxTfrP6gw6iJI5Ty7eWfMhupbgXs6Xh2tO35gkFae2VN0/S/no23Q8ti/1R5tdiJsqVWcyCPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WSrbi6D11G8VYI94BeDOUnWLQJc9xaHXsYvdaHVnck=;
 b=FBj+SC2TLsICjTXfGtkeqUXX6Tu4rlDKXR5Xzjp0wpGDliuOVzAEqwOhCtypOY2pG5UBmAdXyjH1cfvLhz4j/9UUSpKlAGcVD15q4qgLipyr4mF97joIN2k23xXFNWvqLLzUpB6ENUnrvmE9h+T+pnhbcJSJ3p3UrXqtM7aLtK3WnayW9qwMqTZ9YpgayUPs7us34VYWsTpFJb4X5WBqZlBrCMrEcYOec3u47WosWMwvYIkn0mgWqHPEE2QOj+dJfZWP3Vzow2ZVLAC7gFPijt2AtECZXxi4psqV8dTmlew/qPbekrcKARKM3MAmyY9v3OmjtkRtmm6sKW0+dbzEkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WSrbi6D11G8VYI94BeDOUnWLQJc9xaHXsYvdaHVnck=;
 b=V3b0V13MxxEXCptzalCCGHP9xoXrhb39PrRJ+mAIobc85+jDxbwEp54fm7sb3O5YT+rEsG4J9Vngtz6K1t8fHliDaCwvR5BqcXL86UGvu2QGqqUXgkEG8xHMu7mhMZmbuVXo8Xi7cr5+GfFdMu18MTjCCo7YHh23RfW8b5v3+htiq/WnA4I+lLdfNKtAnp+zfjerQ2DShbX2BUxyX33YAhzNfXoTtat7+ACZLy8mDtOzCYvqbAKqllKLMDrNMOQuiVVk2SKKtGfJn3G9R2+elW7qmx8CMneFAtftYhr0pbhakIYFEYW451AcCKPxvyrLGXOxTcQnvI+oovRcAQx1zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by LV3PR12MB9438.namprd12.prod.outlook.com (2603:10b6:408:212::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Mon, 6 Jan
 2025 16:27:59 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 16:27:58 +0000
Date: Mon, 6 Jan 2025 12:27:57 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Wei Lin Guay <wguay@meta.com>, Keith Busch <kbusch@kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Dag Moxnes <dagmoxnes@meta.com>, Nicolaas Viljoen <nviljoen@meta.com>,
 Oded Gabbay <ogabbay@kernel.org>, Leon Romanovsky <leon@kernel.org>,
 Maor Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Message-ID: <20250106162757.GH5556@nvidia.com>
References: <Z2BbPKvbxm7jvJL9@kbusch-mbp.dhcp.thefacebook.com>
 <0f207bf8-572a-4d32-bd24-602a0bf02d90@amd.com>
 <C369F330-5BAD-4AC6-A13C-EEABD29F2F08@meta.com>
 <e8759159-b141-410b-be08-aad54eaed41f@amd.com>
 <IA0PR11MB7185D0E4EE2DA36A87AE6EACF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
 <0c7ab6c9-9523-41de-91e9-602cbcaa1c68@amd.com>
 <IA0PR11MB71855CFE176047053A4E6D07F8062@IA0PR11MB7185.namprd11.prod.outlook.com>
 <0843cda7-6f33-4484-a38a-1f77cbc9d250@amd.com>
 <20250102133951.GB5556@nvidia.com>
 <Z3vG9JNOaQMfDZAY@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z3vG9JNOaQMfDZAY@phenom.ffwll.local>
X-ClientProxiedBy: BN0PR04CA0119.namprd04.prod.outlook.com
 (2603:10b6:408:ec::34) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|LV3PR12MB9438:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ed0fe6-030a-4a06-825c-08dd2e6f14fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|556444022; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzV3S2dhalljZHMzM3RiQmtBb3BMZS9tZERXQitQcTQ2b1FYRzJvVitGalR2?=
 =?utf-8?B?RmxMV0grRTRNMkYvdS9EYTJjbHhIU0FHYzd3clM3aW5hbUxUR1BVbVlqTXVQ?=
 =?utf-8?B?MHF4citqWlFJcVRKb2FMdTE0bEUwZks2eTBMcXRXS0pkcHNjelNLNkdlNTdM?=
 =?utf-8?B?TjRlcHhRam5BQm5xZXRlU0hKaXFwNmFqQmo5Z0g0QjFWdUNWcFJxRXZnMFhN?=
 =?utf-8?B?elQrNURIdFhobHRiT1hYVnRaN1FzL3VuR1JSakFPdGNlMGdPWW9MN2Q5ZDhx?=
 =?utf-8?B?c3JPVm1oS21UZlZIUk1DUzBtTVdOOW9NNWhUTS93VlBpUU0vaGdDcGZRZHBB?=
 =?utf-8?B?ekgvOWNmcjZIRUlYT05aMy85c0RySno4OWlhRlhUcjB6UGdKMmdyclI0UHlZ?=
 =?utf-8?B?cHNRSDBmZTh1U3NCQzBOaUlvcytKNWluTFZ6b3NMWEZQbXhjZ1JNaW9vWDlB?=
 =?utf-8?B?Z0dDUTdxcFZIRXpCUm5aa1dGOThXK2ZsM3dkdXBQTHdoMEkvbllqbWxudmRi?=
 =?utf-8?B?VG5YbzgyUStMZkNJZHdFM2JacW4vVFJjSzIwTHNWL2JDbWh5cmh0YTBuYUtu?=
 =?utf-8?B?ZVBVMFVDbVF2YWRKZXM4RGhkeUlaRm15WVBXVExIZzdIc0dvMHBKa0RCZEZk?=
 =?utf-8?B?dFIwTjFWVVN5c0pRanE5Uk1BUUUwSkJtUWRlanhYQ0tmQXFwc2pMeGEzbjVZ?=
 =?utf-8?B?RlJYNXJLWEhwRzMvUE5mc2RMTnVzR01jdTYrYmNQa3JhTFY4QUkxQ1pMVVF5?=
 =?utf-8?B?bml4ZURJTXBXVkVCL3BubURkWGtPekswUjh2Zyt3NlJydGc1K3poVStBZG1s?=
 =?utf-8?B?VUZyVWwvV2NWZmUzVFRkWWFha1NWamx1a2ZJeldPRFJ4SmtWM1JmOGt4dkxE?=
 =?utf-8?B?Qkh2QkdwdE9QbmhWY05BN2ZCdWRXclJWckNLNWdKNnVOTGhCNlI3ODZoSXZM?=
 =?utf-8?B?bzhoNWt0NWhlTUdsM3NPcEM3eEEzQy92ZjNpWS9ZT0hFVUNUNWNpM3JhRUxG?=
 =?utf-8?B?VitEUFRCZ1ZidkZsTU4zdDVYMWViNXFpVFZUUUljTU1qaWRuVm44ZDFjdThR?=
 =?utf-8?B?eDBiZGFselEySTNaUGxTNGMrQnViMlVqb3dPYkNzN2RXL0FTMWxvVDg4ZDlH?=
 =?utf-8?B?dVlIQlhpQ1Iyb2tpM2hNenZsellWSGJ6dWxEemM0VW5TczQxRUtydG9WSGxk?=
 =?utf-8?B?NGJzaXdQakYrbnMxdkdBdHNJZWROcnQwYXZTYXZUa0ptYVQyTU12TklQNXBO?=
 =?utf-8?B?Z0JzYmRHU3d0amJTK0cwWElVaXhza3Q2T0Mxemh1Y3dHMk0wK0ZxYldReXN5?=
 =?utf-8?B?Ty85VEpVdEFlUnQzT3VHWUNmTzVaT29OOGVTQWk3VW1sUGR0ZndvWjVKYis2?=
 =?utf-8?B?c1BNbmRQS3JPMER2RktQQXN2UzBYTlBqU0hLKzM5a3R2OTRhUXJmQWpIY1gx?=
 =?utf-8?B?VWMyT200QTZsYVBJTExpS0hDR0NqWWxCMXBoUDRIZ1d0RzVYT3ZLanNyRFFV?=
 =?utf-8?B?ZWVjVFBhTjRZay95eVdrZW9SV2UyZ1Z1UHRYYUtOSXZEVnJYcHoyTmc0cXRR?=
 =?utf-8?B?dFE3YjBRdjlobys0UjEwczdQdnNjaTlZUU5uSjZ5NldRSk9kYnBtdllyWU9u?=
 =?utf-8?B?S2ZtdVpSZG01c3RMSmRXWUdqeG4ydW91SkZVM2Q1dWx4SG51WTBoZ2lhTE5v?=
 =?utf-8?B?dENRdkpqRkh0dkx2UGdIRk5oZjlIOFQ2cTZ5RllzOGRLZlIrbVNFb2RidEc5?=
 =?utf-8?B?VndjYmt6V2UyV2dMSjh3YnRJU1BJV01nNXVpQm56d3ZNK1EwL3VlTWZYWU1T?=
 =?utf-8?B?anJPN3ZQaEtkbUlDWURJdUJvZkVmWFVFWnJYZ2RZSUhzc2pqSkZ6U0JOejdo?=
 =?utf-8?B?b1dlanVkWnR4b3lMcHJ5ODhpTTlJRzVZT1JueXFUR0JnZFhNNE5VVHdNNjNu?=
 =?utf-8?Q?N4mlV5Uro1/yAu0vv9NTUOd4Id+yaxfL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(556444022); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDdQRnV5ZG1ENXB3NmNMSFFHc1Mva2FtcWdURHF1M3hGR2E3TUJyY0NKVk40?=
 =?utf-8?B?OFNoZjg5RkRnUklCREF2MUR5aVhwL0NUMDNRVEk0aVNRZVNNd2xTWTBhWmg1?=
 =?utf-8?B?c05iTzBkS0xHdWpER1RReHp2cUZUMktWMFNxODNPb04vQXFTYmt2N0hVNHJa?=
 =?utf-8?B?TmNFekRuTndyTnI2WmJZQXZmeGFSNzU2RzZmNTg3YXhpUmRrRklWNUVtODlx?=
 =?utf-8?B?Z0JDaUJPZm52YjY2bDFnNm9YK0xSMHdZK1VXcDhrZVNFWVo3RlVHRzd4bzB1?=
 =?utf-8?B?UlY4aFhwNnJIWk1LNnBPMGRMMEVVN0dENlJkck1iN1hXZ2I3WWJFQXFSN2VF?=
 =?utf-8?B?SkpEVzlWR2xvdDJOUXR2YkhaODNRNWR3UU9OR0xyZW90RFBFcmk4S09yT2p3?=
 =?utf-8?B?SVhiRDRHOTY4ZTI0N2FIR2MvQjlmZTJDRSt2QjVLa3BGSXg4TzAzMnc2eEZi?=
 =?utf-8?B?YUxFTWFPYlkzaHVxTHhYZDhpK0ppSHVOOEFRVTBJSlR3cjl2c0RsNXBocEVh?=
 =?utf-8?B?eFZsblVVV2g2VTBsc3c4clJqQXIwYi9pZmtMRi9FWS9qbHNGeU5ndHJ5djlJ?=
 =?utf-8?B?WVduWUZVTkpsZ1oyeUh1UHo0RTA5bWNWejRJQ0ZhRzhuTGJSb2htSjZzMkZD?=
 =?utf-8?B?ajJEOTlhZ25pVXZJWGZ1RmhYYWlpMXFtdHhtbkVMS2dvc1lyRU5ONFJDcnho?=
 =?utf-8?B?MkdQSmo3Wi9uTE10NnZ5enR2TGpUY2hRQUM3di9rRmtTSks0dkxmc0xrZ1lw?=
 =?utf-8?B?dHZ1eTJURHN3T2xsTlVtNFpaWnl4RXhLZkR6SDNyTW0wRFpXU0RublpQNmY5?=
 =?utf-8?B?d3I2STlBWmUrcTFKWHVqSVNjcmRGTzh5dmE3RXQzOEZjMzU0RWNHa1QzRmhm?=
 =?utf-8?B?d3Q1b1J4aXFPb3NSa1I4cXliUFM5TndQbGVDRm41UHl5alVsVldVMEFkT3l0?=
 =?utf-8?B?bW9EYnplK1RoVVlDMW5rL25zOVZhWitqYWhXRG1teW9Rc0ZXVVcwbXlzWnlV?=
 =?utf-8?B?THRoNHJWSTZnc2JiMEZzd3BGd3ZRcnhCTkRjOXpnT0l4MklWTVFtOFl0TzRj?=
 =?utf-8?B?OEpWWThTbnRtUGZLUG9vSlFWZHNIcExMNzd2a3VydFRyZXFLNXhoVXdYUFA1?=
 =?utf-8?B?VkxCK0ZnSG1KUmlJQXVmZTZmczg1elVhaWFiY2J4Q3Naa3kzaDF4NGZ5dWF2?=
 =?utf-8?B?c3RJSThNQUdZdjNGY3FWOHJoTDBQaHM5Z3VhVk8yNzlrdVZ6QlZSSnUyaXRO?=
 =?utf-8?B?WmNFQllwTFFHV29lcEc2QXZxeXFnOEs2Wm83ZUpnSjFMMHZrSlg0SkdxaTVD?=
 =?utf-8?B?YkJlbFJQR1VDeGhQSTBxbm96ODZmLzJ5a2ljeXpZeXg3THZraVp0UTAydkpL?=
 =?utf-8?B?RVliT1pyQmhITkQ2VWFNSEx3Tm5hU1pVTmxUcmxCOUY0MUZlbk1EanplZzFS?=
 =?utf-8?B?U28xTlRKN3kwWVJCRmhMWmw5dmFhZER4VXpvbVBFOUF2SXhtcGVpc3pHWVo3?=
 =?utf-8?B?dU9SNHROakZPRGxFWHJUQU5wUzhoVzhyanlaUlh2YjBFOFlVVUhjZFZibFJL?=
 =?utf-8?B?L1RCdUEzWDVkdWRocjAxUm1uRE4rUkhlblZ1NkpyK2hEVEMxWVFsR1JtSUtn?=
 =?utf-8?B?ckVOM1RVSHBQN09mcDJNd09paldMZllsYmxKd29xK0xSdVRsYVNvVUFCT2pV?=
 =?utf-8?B?RFo3SFg4cEYyWFlCdUhKUWc0UzVvMExCWmt2c0luVm5uUHUwVytyeFRDL3RC?=
 =?utf-8?B?VDdvL1BYblNFM2xHSVN4ZjBJaFFJOVRSblRYZ29LbGM5ZjJUeVRod2FsNmZG?=
 =?utf-8?B?T0hhZitPTnVVYURzQzhJSUlUcmJNWms3K2JMQmVUemRpSHFoaEp5NUxlMDlQ?=
 =?utf-8?B?Uy9SRjU0SG1sUzdlYzNLbzBRNEdTaWxybGxyYVFtUEs2SDZUOXVRbXI2Y1ZR?=
 =?utf-8?B?alNBUklVVVV4bDQvMXJXOFFackhtSTI4ZXRBdHlFMHc5WW56Zm5QMnVjbDFT?=
 =?utf-8?B?eXZCdUVBdXNSeDZjWEp0TDVTK25xZHBBbGd5Q0FYYkRyVUtRZlN3Wm90VDJU?=
 =?utf-8?B?bDMrNWZSMDd3RjdPbTFhQk1BcEYzSHVybHNqTjI4QXdJQWpXMC9aV29tdTB2?=
 =?utf-8?Q?PinU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ed0fe6-030a-4a06-825c-08dd2e6f14fa
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 16:27:58.6644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nfsmu0RX7vkFPPWHQ1zdnGqfp6gkVB3TvUO9q1ZtnYfB+4K/PvBBtn1UfR7bAXIz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9438
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

On Mon, Jan 06, 2025 at 01:05:08PM +0100, Simona Vetter wrote:
> On Thu, Jan 02, 2025 at 09:39:51AM -0400, Jason Gunthorpe wrote:
> > On Thu, Dec 19, 2024 at 11:04:54AM +0100, Christian König wrote:
> > 
> > > > Based on all the above, I think we can conclude that since dma_buf_put()
> > > > does not directly (or synchronously) call the f_op->release() handler, a
> > > > deadlock is unlikely to occur in the scenario you described.
> > 
> > Right, there is no deadlock here, and there is nothing inhernetly
> > wrong with using try_get like this. The locking here is ugly ugly
> > ugly, I forget why, but this was the best I came up with to untangle
> > it without deadlocks or races.
> 
> Yeah, imo try_get is perfectly fine pattern. With that sorted my only
> request is to make the try_get specific to the dma_ops, because it only
> works if both ->release and the calling context of try_get follow the same
> rules, which by necessity are exporter specific.

We already know the fd is a dma_ops one because it is on an internal
list and it could not get there otherwise.

The pointer cannot become invalid and freed back to the type safe RCU
while on the list, meaning the try_get is safe as is.

I think Christian's original advice to just open code it is the best
option.

> In full generality as a dma_buf.c interface it's just busted and there's
> no way to make it work, unless we inflict that locking ugliness on
> absolutely every exporter.

I'm not sure about that, the struct file code has special logic to
accommodate the type safe RCU trick. I didn't try to digest it fully,
but I expect there are ways to use it safely without the locking on
release.

> > IIRC it was changed a while back because call chains were getting kind of
> > crazy long with the file release functions and stack overflow was a
> > problem in some cases.
> 
> Hm I thought it was also a "oh fuck deadlocks" moment, because usually
> most of the very deep fput calls are for temporary reference and not the
> final one.

That sounds motivating too, but I've also seen cases of being careful
to unlock before fputting things..

Jason
