Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FECD13E81
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 17:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC0A10E1A9;
	Mon, 12 Jan 2026 16:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JCsXoa8f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012052.outbound.protection.outlook.com
 [40.93.195.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC7510E1A9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 16:12:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXpVryo49rB68dQkd7saWYKwVFqqVR8LGBs4La5MWW0NQWA2ZENuXsIs+SeaeJwgFt3b4CWYnZcMnLef7S3h482twTuLUMrmshWvqvwfpBiH6rKl0O87ez2fnVpcOoRNGdmrQqd0Dd7ro0zje8BQ5DZgUgDKSDtdfF5YEYtPUsnan5QkoMI7x2hX20gR3LdQYSHK47NqqV69yVPqAYqwaIAht2ofoh0zklDalUzCfsUOXUxIriQZNJLlgkIHqOGmrhlrheHMGxWjGRGAJOm3WZdiCzbqRM6cpWtMgkvSwqbVzYvYLazEdStYBND3fWxZMygU1gc+Nw8qZt7oJ8UXqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fC/KvDgBIrcs7qx7bxB780DfAXfGbI7n0cltj83rVEY=;
 b=fCp8hMRoRksqgy6orfG2LJhcaYZmdvTYbgC4ieRpCYk2/hHOpBjbgAAsJFblrGVX278w7oTqe/mOe/XGEODe2LQD/blIif++0g87MuEbIYDHb6aRe7mf1cjY+SgYGNP5iuQdUGPT7jmFQkw57133lN8iURfwCzYzgaC8XSZrs09w59uK/OlALmkcG6npm1YiJWFKeW+pG1epc0Gq1CVMUA+47td0xrwwDudF81AUODfGKaxIdg9sFUsPctcJuO/0Q7bzWxrAgydutedGRZEo3k3Tfpm/vz0zAj4wMFgjvIaarQGs7x2YTu115ycVKh1UlgY55LWJ/BeZRcwGSPObPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fC/KvDgBIrcs7qx7bxB780DfAXfGbI7n0cltj83rVEY=;
 b=JCsXoa8f+p2B+m4gw/5HdiEeT4RqFwwova5ZC5Z19Pn5Uc6rVyfDihL5WdxsbMF3wqjJBq1TIBQXmJ1Fc4/nNwZbbWFcV0UQSyEsb40QwX3+WNoA9MEzvEg9kIUzZjk0jWtP0evKvU6XOfjZLPAm4Nf7QynhOJab7s7Vxx21CIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 16:12:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 16:12:45 +0000
Message-ID: <f2f82341-3799-4379-a0e7-6e9d56a7eda1@amd.com>
Date: Mon, 12 Jan 2026 17:12:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] dma-buf: add revoke mechanism to invalidate shared
 buffers
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Leon Romanovsky
 <leon@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Williamson <alex@shazbot.org>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kvm@vger.kernel.org, iommu@lists.linux.dev
References: <20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvidia.com>
 <eed9fd4c-ca36-4f6a-af10-56d6e0997d8c@amd.com>
 <20260112121956.GE14378@unreal>
 <2db90323-9ddc-4408-9074-b44d9178bc68@amd.com>
 <20260112141440.GE745888@ziepe.ca>
 <f7f1856a-44fa-44af-b496-eb1267a05d11@amd.com>
 <20260112153503.GF745888@ziepe.ca>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260112153503.GF745888@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 90daa5e2-d153-46e6-6946-08de51f56b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXArem0yRHRrNnQ2VUxlbWpTZ3hWUE8yYVE5NlE5ajhpVWZLSUJuZ01SZEtJ?=
 =?utf-8?B?dk1YQUplbHdVVDNybnhkSi9QMFlKM0xBYkJhTkc5M2dra2hvb0FvUFhWVjFS?=
 =?utf-8?B?VzVXakQxajV4dUh2M0VPRWFKYVhJZVhkby9aT3FmUERHUHlFQkZJMWJGSjB1?=
 =?utf-8?B?WkJWcmo0WXFaTitQdTRkSlZaald1SU1kUVF5cGNtL2F4bWFGK0Ztb1NRTi9t?=
 =?utf-8?B?cGw1UVhlSTRoRHc3aVhrMHIxRXkrNXJrS09YekprS1M4U1VLZlNIT05rbHFT?=
 =?utf-8?B?NlpIOWtSdlp6Q0ZBR1oyQk5HcnNMRFpwKzVMandPdkQ4clkwaExtaCtpd1Z6?=
 =?utf-8?B?WWxDbEszMGFpQkMwYWtSbmFJY1kzckhEemJ4RXpTalVPRXRhdFdpTEczVXdi?=
 =?utf-8?B?NjJHb0lTbUNRU3lQZGFocTY0RXNscmJzL0pYdko1RmtKYjdRL09OVmNaaVUy?=
 =?utf-8?B?R2VUcG1WeUtIZngzYURFa01nSys0T2l1RHlhdjhibHlqVU9KMzgyd3h4anBm?=
 =?utf-8?B?RmRMQzg4eFQwV0pYbUUxQkJiSklxSkRqMS9nSDh0WERhWFI1U3lqZ09aeFA4?=
 =?utf-8?B?N05PWWlhYld1YWtzM2lXYXhmRXlXQ1ZZUGNzWHBqNEE0bWg2TzJTSmh6cmY4?=
 =?utf-8?B?RHo1eEFXakFGd291bkwxSnpBNFNXczVvMWt1NjgwaW80Tkh1L3NPSHhLM1E5?=
 =?utf-8?B?L0IwZktWMHNFYlVEV0xwOEEzNXRZZTRXWUMxL0kvTDM1dDh3cU9aZVQ2TXF4?=
 =?utf-8?B?S0lCdkxNaXl6NDFLNzE0SGhnanJZeGNKdHB5ZFZwb2c3c1dVZ3d4dGFFZDdr?=
 =?utf-8?B?VjN4K0RzWGp5eGNBN095c0YrL0F5T0JIT3dlR05ONXlmams4bW1tZnpkMVRs?=
 =?utf-8?B?QWpHNU13bFBOa3hHelMrMkZyaGl2TmdleXJrYkNBa09hcmI1OFYvVkN0Y21y?=
 =?utf-8?B?RmZwdTJnYVBySEJ6bS9tRGFCMEhzb0RFSkNvY3lXbDZnRElsMktBMjFOU2pl?=
 =?utf-8?B?dnJZUHhXRUVxRFc3RGh5d2RpTytTVTJsZmU2d3VFY3MvbEhLUmN5S0RaTnEw?=
 =?utf-8?B?V2E4d3VsMDFxZlFIVnpvWTY4Rm5oM2RYZFp4MldKMWV6OStEUUJvTnVETkxm?=
 =?utf-8?B?ZXljMDhoR0NNemFYSWUrYUJKTzdYb0VCcHIydkVHUUJreXZUQlVYbUJ1VjFm?=
 =?utf-8?B?dUovU0o5NmQ5R3FmRUJyYjV5NzNSVTJGUEZMdmUxYmduR0pCcHNIL25Tckxu?=
 =?utf-8?B?dE94bzAzUU5HaGVDeElLQU1LVzc4NERsOVlrdTlyWHo2YVNTM1ROTFZXcUVT?=
 =?utf-8?B?OTIrOURYSVpwZ3ZCWUFvaWgxQzJiYVd2WDd2bDA3dmxqY2llWXNuaysyMkpv?=
 =?utf-8?B?RFlUYjlGbnN0WFFiWHZDNnY4THpNaXkxSmtFWHRRMUQ4d2xubmE2RnhqejZl?=
 =?utf-8?B?S0lHbTFMREYrYUFtcUdHQjhWRWw5bnZYWmRMU1p4ZnZheVhVclliV1NaTFYr?=
 =?utf-8?B?aEdnVEdLNmhTWDRqWXYvNWNEWGFKbnVkK0piZ0EvRHZqL0xkK05XcTFuRXZ5?=
 =?utf-8?B?eE5DeUhTVElaUkxBQ0JJc091cUsrbVpuYUpvRXg3T3Bqanh0Sm5lTHUwZTZm?=
 =?utf-8?B?aEIwc2dCZmprZWZ2alB5OFNGZmdsMnFZT0dlQ1RlYk42SFYrR01YckJsa3JG?=
 =?utf-8?B?TkVSMmpZT2tyY0FnY3VKanVKNzIwVUZ0R3VwREZYM0V3aEdGblJHNFk2ejRy?=
 =?utf-8?B?aHZYdmEwKzlLOGppQmVSZFIvMW9ha1ZrY3RPMzNVMEZMc2VBK1JxWWMrOWEw?=
 =?utf-8?B?QytBQ1RBTTNoa05nejNLSklYSnVXRk5mTnZwNitPOTlScW40ckFtWVZhbk9z?=
 =?utf-8?B?eldha3pNbTI2bmFWVkwycUJ5M3lDSzhYSHBlWUE4V3h2L2pKUlRaMkxUcUFM?=
 =?utf-8?Q?R3pqXw1TNHfwgonysu5Yt15NLczYVrVA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3F6TDJvL1Vid1NvaGQ5bUVlYnVrbGNPeThBWFZsS21YdGx1c1lRRXFyRWZ6?=
 =?utf-8?B?SW1VOWg4dVpLMnNxbnlITFBFMEZkeXpwSUhMK3hxRUFGeFJjU1lPMXlIdVoy?=
 =?utf-8?B?a09CMHR2N0pPdlpWQ282Nmt4VkF5MEtzb29GdUdLWS9UWlliS3E4ZDRXeDVt?=
 =?utf-8?B?aDhidWc2T0dQaE5PV25JekVoTlY0TzlGekhONUdyM2gvcWZCbjRrbTMzQ3Nw?=
 =?utf-8?B?YjdZeGpBUGRHWHJVWHV6ancwajVZTWZXOVZ5T1R2c2NxM25XWW1GZkx5ZGV1?=
 =?utf-8?B?WTlQVmViK04zYmJIKzlwY0hPdE5FOWt0MXhPc1ZpNWhmYzBUWnIxOHJZS2M4?=
 =?utf-8?B?TTh4NmJFYW1xWmN1UmZnLzVaVVFYMG5kYmJiL25WTThnUzF1aUxXL0dCUmty?=
 =?utf-8?B?WUNoVWtaMEwxWXMxWGpkN0ZmRW04aVpnVjhEeHJTV244Uk9BZFhsdWRUYXEx?=
 =?utf-8?B?SUQ3b2pOWklTaE5oZE1sTnhMTnZIVXduQ2Z2SDljdm10RHI3UUxpWHBvamQ4?=
 =?utf-8?B?cjVYcnIzb05vMWlKV1RKWlp4NG1hcnpFMXovTXgxajB2WThaTWIxczg4U0dw?=
 =?utf-8?B?TllWNndabTk0dkZlUUl6NDM5d2N5bFRqUzd0ZlVZMk5EdzlDdEh1TWVKZGpq?=
 =?utf-8?B?VlVzS3RTSHFCaFBhNWlzUW0zeUo5bnN2dWRSUkgrVDg2YzJrL0Q5ZEFXTWE5?=
 =?utf-8?B?SjRpMEs4aGN6U28wRUFoWnNKMG5oOFYvSDdDWDEvazQzY0F1K1hxN3lwc01m?=
 =?utf-8?B?b25Id2VuZG1xc21SMmlRTTI1RFRyRkFTaWI0T3FFM0lqVll1akhhQ25DcW1Z?=
 =?utf-8?B?MlQ5ekxXckJvSmpjZU85TE9MeHAra2lneVk0UWtHWlNjU3hpWWlvK0t1Y0hW?=
 =?utf-8?B?Y1FDeEsyb3NXMGdGUGpaSDVudWlzZ3VORFMyNzVDSytRTDdYK3o3dXZRYXd3?=
 =?utf-8?B?Vmt3Y0JWRHZER2s0VVV3SEZYYVlUUFZSZ3E2Q2grNmcyeG5MdmlqdUt1L1Vy?=
 =?utf-8?B?SHY3NmpqaEV6OG80dmRLWXE1SndOWmdPeXg0STBJSXNsY3luTnN0dDZKSVVY?=
 =?utf-8?B?U0czNVdwakhRN1Uxd1B0MXltZ2N1WTIycjZaemMycDB0cE9IQlk2Z282Q3hH?=
 =?utf-8?B?b1FYeUo5ZDFDQ3lWUkZxZlh4aDJjMldzR3VSQXRYYWJHSHVzNzZUT1NuYUhT?=
 =?utf-8?B?RmtrOEVKUEUwNzJjV2t0UWdsWUpnWVY0ZHdZSEF6NTgzQitCbDVGdW13Y1py?=
 =?utf-8?B?OFByNVdxK2VuRlI0QVU0SVp5YUZ2OWQ1NngwR2x6MlRkcWIwVVhqdm5rYnJl?=
 =?utf-8?B?M05ydjdDdXl3Q0FrcU9wcklZUnZxUlN3TEtXaEJyRSs2cVdmQ3dDQUNtRlBW?=
 =?utf-8?B?dHBJcXkvR1JUVk9HMmFaeDNQWllUK0lRdVlGcDJtOVN0aWlzYkkwUGRRMnpp?=
 =?utf-8?B?TndkL3AvSUNycWZ1cE1OWDhscDl4RXVHRUNUOVl2TzZ0bGY4ZVpNOUhjZ2lZ?=
 =?utf-8?B?VnQvc2RRM1RCM1R4Q1JTQ2p3bS9lTnFyNjdJUEREYVFEOU8xdzl6Y00xck1v?=
 =?utf-8?B?aXZWMlpNZUN2UHRaeDNQUW5rQ0oweGgwUWtER01MVEx6TXhlOGEyNCtZbXBN?=
 =?utf-8?B?RU5zc0dDa0F0UXhoa0x2YXYwa3NpTVZRdlpHYnlJa2xBTHc2WjRFWVl3RzJl?=
 =?utf-8?B?RzFFTFlPS0hpbGJjMlNQRHM0SjhYekVuaC9KOTBsYjFrVTNoQ3ErNjIwZGda?=
 =?utf-8?B?alQ1cjBCT2JMcUVwMkx4NXRJb1RyYitDc29KZmZKK0I1SWtOYzdCaXJTb3Bs?=
 =?utf-8?B?MEU3Zmp5dUg0eFlHZThTekJGY0pab01QdUdHWkR6N0w0WDRVY0Z6THNnVkJx?=
 =?utf-8?B?cmVaa1YrQnFWTHNSbWsvdTA5V1pvVk4ydEhiRmp3c0lMWUp3dTVJY1IybFU4?=
 =?utf-8?B?MEg0YndzbWtpSTRQYzhHcysxRENwUFlBZGo2bUl2VEFYYm5nOTBGcWRQcWhw?=
 =?utf-8?B?VkdZZlAvTGRiR1ZRUWoyMjVIaENrVXVZOVdIZmZ4NkdmaDNsVnZmL2RlTHdM?=
 =?utf-8?B?VEVtS3VUbFFZeVByc096RW0yRHJodE1jMkphNTBmdDNtMzRJZGVXclJDVHV2?=
 =?utf-8?B?SEVqeVpKbDlxUDBCSkFOYnBCZEovSzJ2TkowMklBTERka21jdXFWa3BHN2Ft?=
 =?utf-8?B?L21mOFZ6MUVLaTlFZHNYUG03czFxWlJLRmFsYVJ0QnRlWWdUZW5wM2puN3NV?=
 =?utf-8?B?bmFOaytIRHB0YnUwb0UrTnZyaVBLUVBEek9ob0RCY2R1WXdDeFFlbStrdFNl?=
 =?utf-8?Q?PaswKQQmBB3VUf/9X2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90daa5e2-d153-46e6-6946-08de51f56b7b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 16:12:44.9722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQyKTMz/V0odcoaSlsxz5hvScDy7lQ0ZmC2xm2gv1cSajp+QjwC21HH2nZwOHNJZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888
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

On 1/12/26 16:35, Jason Gunthorpe wrote:
> On Mon, Jan 12, 2026 at 03:56:32PM +0100, Christian König wrote:
>>> The problem revoke is designed to solve is that many importers have
>>> hardware that can either be DMA'ing or failing. There is no fault
>>> mechanims that can be used to implement the full "move around for no
>>> reason" semantics that are implied by move_notify.
>>
>> In this case just call dma_buf_pin(). We already support that
>> approach for RDMA devices which can't do ODP.
> 
> That alone isn't good enough - the patch adding the non-ODP support
> also contained this:
> 
> static void
> ib_umem_dmabuf_unsupported_move_notify(struct dma_buf_attachment *attach)
> {
> 	struct ib_umem_dmabuf *umem_dmabuf = attach->importer_priv;
> 
> 	ibdev_warn_ratelimited(umem_dmabuf->umem.ibdev,
> 			       "Invalidate callback should not be called when memory is pinned\n");
> }

Yeah, I know. That's what I meant we have to better document this.

> 
> static struct dma_buf_attach_ops ib_umem_dmabuf_attach_pinned_ops = {
> 	.allow_peer2peer = true,
> 	.move_notify = ib_umem_dmabuf_unsupported_move_notify,
> };
> 
> So we can't just allow it to attach to exporters that are going to
> start calling move_notify while pinned.

The point is exporters are already doing this.

> Looking around I don't see anyone else doing something like this, and
> reading your remarks I think EFA guys got it wrong. So I'm wondering
> if this should not have been allowed. Unfortunately 5 years later I'm
> pretty sure it is being used in places where we don't have HW support
> to invalidate at all, and it is now well established uAPI that we
> can't just break.
> 
> Which is why we are coming to negotiation because at least the above
> isn't going to work if move_notify is called for revoke reasons, and
> we'd like to block attaching exporters that need revoke for the above.

Ah, yes that makes sense. This is clearly a new requirement.

So basically for PCIe hotplug was a rare event were we said we have some problems with non-ODP but we can live with that, but for this use case here it's more like a perfectly normal condition that userspace can trigger.

So the exporter wants to reject importers which can't handle a mapping invalidation while the BO is pinned, correct?

> 
> So, would you be happier with this if we documented that move_notify
> can be called for pinned importers for revoke purposes and figure out
> something to mark the above as special so exporters can fail pin if
> they are going to call move_notify?

That would work for me. I mean it is already current practice, we just never fully documented it.

> 
> Then this series would transform into documentation, making VFIO
> accept pin and continue to call move_notify as it does right now, and
> some logic to reject the RDMA non-ODP importer.

I think we just need to expose this with flags or similar from the importer side. As far as I know RDMA without ODP is currently the only one really needing this (except for cross device scanout, but that is special anyway).

Christian.

> 
> Jason

