Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4504AB9EE70
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 13:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA8010E8D1;
	Thu, 25 Sep 2025 11:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F9/wK3Gt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011050.outbound.protection.outlook.com
 [40.93.194.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5960910E8CE;
 Thu, 25 Sep 2025 11:29:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUUHkAJvWdpzSP3cnmZ6cu6C/CNyxhwJojsW5/dGKOnanXIRvBE0HO49nz3xtdN3MvXp/Pxs5JSAOZzkaKB7t/YBYKaN0sWN7YqtVabg73kC50HCp8uuaYjTnx1qlSpwTg174o/ds0I7jJkvbsUAZZtD+yOheOwlA6Xd208/tgehGVK5iRXw6nTAE3o6VhtKOGYCvhi16V+gNE7l9AMxG0ocRv4tXeEsHTAYYqUjKkraaEsD3QlOles2IkBq+3ysi6NCD9kE4+JFVvOonzm2ZxueuAY+plvVS5hkvCkOPOmTr8/B+FzwS+BP1X5zE/S8J3CrarGSSKf6LhcrGmTJ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8S8BSZu0y34wC273Y2HRStx09qQ1I0gkJg3/GvpMj9I=;
 b=vW8GEIBFPIAK8P/kVvt9D5CwqG08243oD0L3Vk5lSTfdAoDIPchEYGg/Yxk9JuYIPmWVIRnVHQu3XPoIhlYy3Epp5Mp11VU2XtfkQD/n6Y4NFIwcw6UEZBiWKtf9GowWklpyfQf1Tp9F9GSL2bcYenfq09AHXIwsTJI3+1Oi1Tx2oHn+k5e5pjWwckxmY3MNDvzphUDS7n2xtg0zca7OU+0q+bCk6oEPJhDrixA/N+k8ACVhw57SSWlmXB5Sub8hESIQy1iJxYtdk6fEoCMpBXrmPIXgTCyaD7ps3l/Uzr5BptDmdy2cbuBv6RocOfN7q27cEq7G7HL9R3dkltzVQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8S8BSZu0y34wC273Y2HRStx09qQ1I0gkJg3/GvpMj9I=;
 b=F9/wK3GtMxK2yo8VK0h4XNHqFAlyLSF2X8S1iL1aGEgC8PR2qai/htyPC+vPTB8C3BSzxNshkmblfTQWZjG3+h6nuWuY8TKyYW+kDKibiOeWfOujqsUxrYAvX8ZsaD7Hcef8qLp322Ug3qI0Q1xGSrsGhN2Nb2RxUNpWukolbqg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH1PPF351A22FF6.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::60c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 25 Sep
 2025 11:28:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Thu, 25 Sep 2025
 11:28:59 +0000
Message-ID: <50c946f3-08c5-421e-80bf-61834a58eddf@amd.com>
Date: Thu, 25 Sep 2025 13:28:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <IA0PR11MB718580B723FA2BEDCFAB71E9F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <aNI9a6o0RtQmDYPp@lstrano-desk.jf.intel.com>
 <aNJB1r51eC2v2rXh@lstrano-desk.jf.intel.com>
 <80d2d0d1-db44-4f0a-8481-c81058d47196@amd.com>
 <20250923121528.GH1391379@nvidia.com>
 <522d3d83-78b5-4682-bb02-d2ae2468d30a@amd.com>
 <20250923131247.GK1391379@nvidia.com>
 <8da25244-be1e-4d88-86bc-5a6f377bdbc1@amd.com>
 <20250923133839.GL1391379@nvidia.com>
 <5f9f8cb6-2279-4692-b83d-570cf81886ab@amd.com>
 <IA0PR11MB71855457D1061D0A2344A5CFF81CA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <1d9065f3-8784-4497-b92c-001ae0e78b63@amd.com>
 <IA0PR11MB7185239DB2331A899561AA7DF81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ab09c09638c4482f99047672680c247b98c961c9.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ab09c09638c4482f99047672680c247b98c961c9.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR08CA0011.namprd08.prod.outlook.com
 (2603:10b6:208:239::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH1PPF351A22FF6:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b928953-08fa-4d03-190f-08ddfc26b853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0tKbkRzQkp1MDNKK2RJc2w0a2srUDJDZTNrNE1mM3E4YU5nSXkxOTcxTTNC?=
 =?utf-8?B?TUNXa1pjbGN0TThhUDFzM085U2VKQWx3eGZxdFdTd2ZQU2RJQ3dEbTJqdkYz?=
 =?utf-8?B?bWNyTFp3YVlUczd5TXZlZlhGTng2YktlNDlFUndiUjZXek14dWswMWFVUThS?=
 =?utf-8?B?akdrQmJReDl2UDNuL1IxWHVic3NRelFlc2VQQVdmMHFGZnM2NjI4a0RreGxN?=
 =?utf-8?B?Y1d1M0VFeStUVlQ4RTVDMzdUNGxxdmR1WHhkbzBQV1NEQkd1c3JXOWZHMmtz?=
 =?utf-8?B?elIzeHVkREQvemtMSzF2bmZGU3VZRW42Rzl5T21YK29uVVNhSGZVTHA5V3or?=
 =?utf-8?B?U0YwVlY5NjlWY0ZxYjFKcTFETXdhQ0htdS96UXVjUWNkdkNzMW1aV1pHNjhJ?=
 =?utf-8?B?U09uMzQzc3J0SzNJSHhTWmYvajQwbTloUERoS24xM1RwR2tRbTN2azUrNHFx?=
 =?utf-8?B?N2R3NkFKMFVMbDREQVByK2NnaG42THNneTFFREJ4OEdWSXFCV1ZnckRxUnJx?=
 =?utf-8?B?SDF5ZzMveW4xdHo4VWVCd2VKM0VaVlY1eDhrbFJXZVBTL1hzZ1R2VFlYL0d6?=
 =?utf-8?B?NHBvaTk5M29MR2d0RnkrL01uN3MxMytYMWlURXQ2cThHYnVMWmVEenZwcC9m?=
 =?utf-8?B?OTdrUmNpZ2JBOGg0bmN2Sjk5VVM1bzY2K2N5TklUVFNQaHhaS1FrTVovZkJl?=
 =?utf-8?B?OVVRbEVxTFh4SFliR0xRUGJIOCtuOHBma3FOQ3g5TzRLZmIyNWFPcEg4VDNl?=
 =?utf-8?B?OTBLa0ZGR3N2L1NxdG41MWNDQWxPM2drK1JVRjdMMDRnSHBYMEhNYnI0akgv?=
 =?utf-8?B?TXZpODFsSDJieEtHcjQ2Mnk2VENsRlhLSWs1TUdoV2wySDJaemdtRDgzYk5h?=
 =?utf-8?B?ekhHU0p6andhUWh1OGtNMzFpZ0o2bXNoczkrOEt5TSt2Nk1hZ2NlcURWK1Yr?=
 =?utf-8?B?RnZJQnpoVkJmVTNiaExLRFlKMmV1Um45TlBsZnYvMnNRVThhaVU5eUYyRzFE?=
 =?utf-8?B?M0N2NmhOelh5WUd3ZDF3RE9hRkhiWERUdTFvU21RVGdGK2MxVnZBbzZKL3ZS?=
 =?utf-8?B?d1VlYm5nak51UVJxUklDaDh1YTg0MEtJbysyZTY2bHhlV2V6RHUwcHhhNmp1?=
 =?utf-8?B?OS9IK0h5a29YSXdSbGlJNlZaWDNIVVFFOU9LdEpUU1hQdTlYVEJhaTBsYWE4?=
 =?utf-8?B?c2pNRk1oaHJEWGNhMDFMQ3cyZld4cDNqNFNHUHlMSXhtNnpReUsxalByTFJ5?=
 =?utf-8?B?dmdCSEJRL1pNZE9RUlJkSUREUSt5MlpuclowUDRXeS9TQXBqaU9iMTdWdmJh?=
 =?utf-8?B?bHZ5UnZRNjFzZ1ZqR0xFMDNwbkU2NTJ0N0RZaDVlQVhJemd2VlMxTml4bFhw?=
 =?utf-8?B?L3I5TUVqVk1iNzVxUzFqQ1VPMGlOYlVSQThQTmVkQ1JnZmpPb2pSYS9iaklz?=
 =?utf-8?B?NUR0dThXWHVGaGVla3VhQjljRmo3ZHdRWEc3RTgvT0dKbGJpR212SnB3eDAz?=
 =?utf-8?B?QjVvNzk5NWZFbG9IeXNoT0toNzNVaVlkakh6K3ZjN01CRFQzNzZQYVB3RlZ2?=
 =?utf-8?B?elNxTTAwRjJCQ085akY2VGtCOWxvUjAzUWVIMlRGT1EyblQycUwyUmp2SDVu?=
 =?utf-8?B?YlpPK1F2V29vM1dQREF3azMwNmxPVjY0ejEwc1VmODJqS2kyc1k4a1ZDNHVa?=
 =?utf-8?B?RUpGeGlwS3BxR1Zvc0trQUNVOENadWZtYTZ2bTNPdXpsWDVob2ZSWW1HTDJi?=
 =?utf-8?B?b1ZaNm9pdHpKOVFiWjZhN0VEZ0hKMWtGSWkxUjhtSFg4YlRaRlVIMmdjLzdL?=
 =?utf-8?B?b3FhUHpLT1YvRUQ0T1Q5Uk8xeGJQNWhFQWJrVFdpSFFpV0RxbmQ3ZCt3dyta?=
 =?utf-8?B?bkVqZjJndlhPelBCZ0dvZld1RmpYa1F5dHQyMkZSd1N3V0JlYitTcjkyNFov?=
 =?utf-8?Q?FqLMe++8/Hg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTVrYS9sV3huRjBtR3pjaytjR0V3MlVjV1pDZlpWdldTNHJBbXM1US9xZDIr?=
 =?utf-8?B?WXExd0ttb2tCcGV4SGFvVU1aMWcrdFEyVytvRzh3MXVYbWVQZ1FQRTF0dTJJ?=
 =?utf-8?B?V0d4RzRjWmJ5eFFtbVJCMzNMMU92RDVWY0JGa1ZqOTU2YU5Vc1B6d2VQNkRQ?=
 =?utf-8?B?cUR6Ym5vcUh5eE5uNjdmNFRzc3RlT214VTZPYjJkSE5tRjF6S1RtOVQzbWta?=
 =?utf-8?B?QUVCV2ZzaHBUVzREMlF6blNGNGdrVDYramVGOXBrMGVVZmJGZTZqUzRjZ3VE?=
 =?utf-8?B?UTIxdTdNMjZVb3BvbHZuQnBNaE53elQ5VVVoK3dXb1pHQXFpVi9WRW1TRjRR?=
 =?utf-8?B?RTVVcHp0aDg4elRMSjdtUlR0Q0xqYkh4ckdONVFDbTlRci9DendlZDRsam9L?=
 =?utf-8?B?KytPSWg5MEpNa2V2L1hyZ283d3kwdFRRY0lmc0FVSm50eHRiUkxSckJ5cDFv?=
 =?utf-8?B?azZCMFAyMU9Dbnk3MWlvRDRxZUVsSVlVODY0ZXN6cG9sbFVJTW5mbzZJS1JF?=
 =?utf-8?B?ekZoYTlPK0k5SngrcnBoSWhzT1pKbVN3blBibE94U2thMUpNemtBRjFydUE3?=
 =?utf-8?B?ZVliRlBCN2ZkajdvZ0VNYVdUOHM4MFBFNkEvUlZyV2pIcW9Gc3ZpanBiaUpR?=
 =?utf-8?B?K2xFYUZUUXZOb3hYdWRjVWhlTURuclZFSWJ3ZGhpTFc2QzN2Ynd4em9meFMx?=
 =?utf-8?B?ZmM1Y1Y1M1lqLzFaY1R2YXhXbEh1My9WbGZweWJsazlWeXlIV05PclNUS24v?=
 =?utf-8?B?NVlONkxmTGVQN25sNGVRaFh4ekRxdE03b3FOWE5tK2pxL0xSUjVVY0wvMTlG?=
 =?utf-8?B?alNFOFlLOC9hTVIyd3ppaWhhRTBabHI0bEl1RGZwV2VvWG9GWU5KWlI2bXhH?=
 =?utf-8?B?WkRCeW91TFEycnFhSWEwb1hHSmloV0pEbHpQWTBORUZ1TkRWV1BkUXpTY3JU?=
 =?utf-8?B?N0lTb29vVTdFSFl5UExMdzFMa0k3Y28yZ1Z6MmRSRUxCTTJiazB3Nkh6TGNV?=
 =?utf-8?B?TFBEVDRDc1J3V0h0YVJKWWM3RkVpaDJMakZEaWRDdUpjcnJ2R01VVGNRSExs?=
 =?utf-8?B?YUhWeW0vNkhvRXNuclpMNFYxVFIrNHhoMXpib1d0V3RuWE84MTdCNS8xQ05n?=
 =?utf-8?B?VTZieTQ4YUNqeDBRNmx4ZXQ0alNGTmE5VzR0ZEhIeVZ6bUN3SXhuR0NDUEdy?=
 =?utf-8?B?VnZ4bzE4SElqekorcWxyRGplVVFCU2krSDhJWno1N0E4TFFxWmJwS093bkR4?=
 =?utf-8?B?Yi9nc0dvQ1dBeEJjbUdJY1ZLOTh2Y1ErUVY3N1pTSHpoNzdWb3Zac1NrZnY1?=
 =?utf-8?B?eTVvN2E5RnNwZVdEbDBESURPVyt1U0E0blhLcEtNMWtmcFljeDFoUFdNYkUz?=
 =?utf-8?B?M3A0Nng3NFIxYW9WVERua3NBSkpRcHkyM3FJeklodTZIRzF2S05Wd1Q0STAv?=
 =?utf-8?B?NnRjNGhsY1k1SEMzUWFkeXN6dXZBWCtCdnR6c0ovU0V0Sk91Q29RZ2ZCOEZB?=
 =?utf-8?B?WXg3RUV4RTMxeE81NHFCUkMxRzJNd1JXNlZSMHRtVkpqUEtFOTFQcEpmbXZI?=
 =?utf-8?B?LzNmZ1FNNmIzTGg1bk9ZZklKRzE0V3ZaTVp3SUZNSkgvcDFrU1V3WldqcGtS?=
 =?utf-8?B?Ujc2YlptTFdyc3dnSDRCdDNaTUVvblRDU2NkRlB6M3k4MHlBRENiQTI3ejln?=
 =?utf-8?B?cUxsRWxrbnRIWk90ZGJVWXp2MDQyMUpQM25GSHc2UmM5YWx1d1BqRSs5WWdL?=
 =?utf-8?B?Z3duYlFHSDhqV3I0aFlOOGFQTzFldU1vaEFucjFQakNtbmNNbUtJZ2tNcjE3?=
 =?utf-8?B?RDFjYzZjQzBpaWxLelhzVHYvbkpEUXZIWlNVdVJDdkQ4T1RtNjRJdVlVYjl6?=
 =?utf-8?B?NHM4WHllRytCRE51aEZYcGtFajJwQzR4MVNNZ1VIdzVtbVRYbVdMR2g2aFNp?=
 =?utf-8?B?enpuWFQ5SFY0Z0tPall6S3d4Q2YyRUJoc2xKWnJRRWlKKzNBcURKcGtSZWEx?=
 =?utf-8?B?ZGU2bWI3eURRWVduS3M2MWU1VlQwKzlmNkV2MmVqOVk4T3REQ0tZd05NWVhT?=
 =?utf-8?B?M3I0Q3BuSWpVdzJjaG5OR0dlT3BTTmEyWnI0ejlPSWlQZTVOb3JPcDhlMU1J?=
 =?utf-8?Q?WyWcsdAdmh+R4mXKoP2kEA8nA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b928953-08fa-4d03-190f-08ddfc26b853
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 11:28:58.9358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +OXQOGgoqObQD1WSro7mjA8da0xPhw2Zz840pTXaZBca3vlN4GM5OmlOzliYePyO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF351A22FF6
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

On 25.09.25 12:51, Thomas Hellström wrote:
>>> In that case I strongly suggest to add a private DMA-buf interface
>>> for the DMA-
>>> bufs exported by vfio-pci which returns which BAR and offset the
>>> DMA-buf
>>> represents.
> 
> @Christian, Is what you're referring to here the "dma_buf private
> interconnect" we've been discussing previously, now only between vfio-
> pci and any interested importers instead of private to a known exporter
> and importer?
> 
> If so I have a POC I can post as an RFC on a way to negotiate such an
> interconnect.

I was just about to write something up as well, but feel free to go ahead if you already have something.

>> Does this private dmabuf interface already exist or does it need to
>> be created
>> from the ground up?

Every driver which supports both exporting and importing DMA-buf has code to detect when somebody tries to re-import a buffer previously exported from the same device.

Now some drivers like amdgpu and I think XE as well also detect if the buffer is from another device handled by the same driver which potentially have private interconnects (XGMI or similar).

See function amdgpu_dmabuf_is_xgmi_accessible() in amdgpu_dma_buf.c for an example.

>> If it already exists, could you please share an example/reference of
>> how you
>> have used it with amdgpu or other drivers?

Well what's new is that we need to do this between two drivers unreleated to each other.

As far as I know previously that was all inside AMD drivers for example, while in this case vfio is a common vendor agnostic driver.

So we should probably make sure to get that right and vendor agnostic etc....

>> If it doesn't exist, I was wondering if it should be based on any
>> particular best
>> practices/ideas (or design patterns) that already exist in other
>> drivers?
> 
> @Vivek, another question: Also on the guest side we're exporting dma-
> mapped adresses that are imported and somehow decoded by the guest
> virtio-gpu driver? Is something similar needed there?
> 
> Also how would the guest side VF driver know that what is assumed to be
> a PF on the same device is actually a PF on the same device and not a
> completely different device with another driver? (In which case I
> assume it would like to export a system dma-buf)?

Another question is how is lifetime handled? E.g. does the guest know that a DMA-buf exists for it's BAR area?

Regards,
Christian.

> 
> Thanks,
> Thomas
> 
> 
> 
>>
>>>
>>> Ideally using the same structure Qemu used to provide the offset to
>>> the vfio-
>>> pci driver, but not a must have.
>>>
>>> This way the driver for the GPU PF (XE) can leverage this
>>> interface, validates
>>> that the DMA-buf comes from a VF it feels responsible for and do
>>> the math to
>>> figure out in which parts of the VRAM needs to be accessed to
>>> scanout the
>>> picture.
>> Sounds good. This is definitely a viable path forward and it looks
>> like we are all
>> in agreement with this idea.
>>
>> I guess we can start exploring how to implement the private dmabuf
>> interface
>> mechanism right away.
>>
>> Thanks,
>> Vivek
>>
>>>
>>> This way this private vfio-pci interface can also be used by
>>> iommufd for
>>> example.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Thanks,
>>>> Vivek
>>>>
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>>> What Simona agreed on is exactly what I proposed as well,
>>>>>>> that you
>>>>>>> get a private interface for exactly that use case.
>>>>>>
>>>>>> A "private" interface to exchange phys_addr_t between at
>>>>>> least
>>>>>> VFIO/KVM/iommufd - sure no complaint with that.
>>>>>>
>>>>>> Jason
>>>>
>>
> 

