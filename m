Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A40DBC99C96
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 02:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BDF10E0AC;
	Tue,  2 Dec 2025 01:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gTZ/a5tA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013058.outbound.protection.outlook.com
 [40.93.201.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013F510E0AC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 01:40:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDFTIo9hZwxYjGgxjcvjGIDXmpacE19z3ePn9495W+oBUfNtQkKRK4FzKc1dClB+CHw1lPVvqxaAkrZxkZRvCjIgJ5wsXEYWEeyAM/S0LKVk/5VZDtjemhVSeiYR1hvNfF7K3jJXiQPtc6JrJnQX0+n90/bwH3aSoTy4k6yzdCX16rn2PmcJ5ZB6pOjfHmkvORzhuStbPtMNop+clI0ZOgRlOyMAhcJcxgwbXCMqemJcsKvPaJ4Z0YNlS7tQ9NAugptw14TN8DQe7IEX+UA0aI9BFzbiPt4Db5rHZDtEA6NRv+YvKQ74pObkSqMJvX683YbuGiZJeizp8EugcpFcCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cic9kYpLfw9/EWY4ZPm6kHcFPKMYADuL41i2kZHmtyc=;
 b=CdoQZGiCwkupaDBH/AZQrYstJn8orz23GVs9Z7JBqL7EIFbpg/reTambUPgYoUApwEClRrDKLbPmD1U41GP34nkiEhpmoDLYXCt6Amwuec+gO2xUHsGLL4Wem9QhelUYKfOH535JrrkqWaV8MRABWYu+3mpoxxM1iGDI8brsWmGLs2QtcDLXi0bNO1jNbt4sKcN14AHFZxP/IZ6ZfM3S55B+4LLFI6W+G8Z+WrQKMikyo/iux0E73/mTvpQjm/lAylAk99k1Jjg8BEoUDYsiR+o9XV5p6jPvQTLXwmqBrUimrozciTE5z0GfvLfHxLRDLJIp2MByLJqhLYweiTY6iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cic9kYpLfw9/EWY4ZPm6kHcFPKMYADuL41i2kZHmtyc=;
 b=gTZ/a5tA5GNI9wBAJGwkdl6BH4YuSl6pYEBbWiPgiL0e28JKRj9FcQlL+FmP96Vv3NDE0N5edb/2MmXTP4qSrylrSEjcgLFw2/RyYqeFXC7Q8E8UKCk+s3hCi4o0u7heSR/UPYvIt6+2tYvkbSdTiFjERH+oi7YN3aTAqWcPMgzd3Lk7GWGPXvGDvRqo6BzrKj4sJPg8gYHDobEzNOeCPWml75RNJdCY61VnL/e5qC8woC2vslkFhEbqNe5zzwYU7PdPIdJwEU8vq0I1EFufCMSpt5rXLcplBzmBM0nOPzMApYZK6p7z9up0Gw3i1+Rh8OaVcjXdSyOdbg1lN8aJ3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 SJ2PR12MB7961.namprd12.prod.outlook.com (2603:10b6:a03:4c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 01:40:52 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%3]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 01:40:52 +0000
Message-ID: <06e7db09-319a-4ac9-a3cf-17cf5017d4ec@nvidia.com>
Date: Tue, 2 Dec 2025 12:40:44 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] Remove device private pages from physical address
 space
To: Matthew Brost <matthew.brost@intel.com>,
 Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, lorenzo.stoakes@oracle.com,
 lyude@redhat.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 rcampbell@nvidia.com, mpenttil@redhat.com, jgg@nvidia.com,
 willy@infradead.org
References: <20251128044146.80050-1-jniethe@nvidia.com>
 <aSn2kXNG7X0UZJFW@lstrano-desk.jf.intel.com>
 <anu425gyhd5w3boribueuyckjlg73r356kkoy6iv6dcsy6b5ar@5qnbvtymgmje>
 <aSz0s8plXN/6t7fD@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <aSz0s8plXN/6t7fD@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::8) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|SJ2PR12MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: b9a3eafc-3ada-4082-9abd-08de3143d3d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2JkYThaWmhqdVV3WlU2WnpTNzNERU14N0FmNEVhL3NxZ29iYVBMOWZuM1Ir?=
 =?utf-8?B?MVZkWkcwK1ZOb3BQNHpsMWxxenJmdWJKMjNJdFlEOW54L1RxT0tYRmZ6WC9F?=
 =?utf-8?B?aVp2UXRMUUd0UXlVZlcwTCt4eUZyWStpSUhwUit5Vzd2ZU1KQVRMT2hKazRu?=
 =?utf-8?B?czJQaVlMWnk1NzJPQUt2SVVNNUQ5cmtndW5DZHRickRPUTR1T21QWENKcnNJ?=
 =?utf-8?B?aXFiTmVuNmJQVnRXamFvc2dRVGRLTllVQnZFNEJtS09aUnF3Snh2cHh6c2d1?=
 =?utf-8?B?SXVSSmd1NzBwSXJxSTF5Q2lVVXZ1WVc1cStnaENuOGhkRmZHZUYweTFKeURC?=
 =?utf-8?B?LzhCSitubWZCR1o2eGFEMUNKQUhOdFoxS2dZM2xXd0ZacFhnN3g1VDRqRnk2?=
 =?utf-8?B?WUNaN1hlaVlRZ2pvRDJKcVM0Zy9DVUJNM09TYmR2cVNJNDVsb2ppYnF5bGlt?=
 =?utf-8?B?NURSUk5wRTNWa2RXNnJiak9PMTlleVBiNUVYN3NHcDFlZTVSVEsxandCSkZm?=
 =?utf-8?B?REpCeTBMZjZBNVhibENaRzdLd3NTaVRrQk0vOGFPZ2U5UTRZdDFUTVV3Tmxj?=
 =?utf-8?B?dTlVUEpUU0YzTFhHMFlPS0tQQjNib2RZdW43UkZVNDdFdHhmQjdPVktCcTJG?=
 =?utf-8?B?ZnZSd2doOTd5UnBOSEJIZEFKaTRCMUx0WkJHaDcvTm1HcWp6ZjdPaEpkMCt4?=
 =?utf-8?B?ckpLRGFGYmkzLy84Zi9NcCtlVkJxcmZnbitlQUZSZnZFdmxyS1M1NDVvMlZq?=
 =?utf-8?B?cVM1bFlJZjRhTTloM2xlM3gzN1ZPbTlVbU56cWVWQVFZVHhoZjhzaWhOZlVq?=
 =?utf-8?B?Q0JReGxUaUVCVFZKT2lsZ0kzeG5wKzVDV0xBOXQxeXRaS1NjSEp5OUtWR2lz?=
 =?utf-8?B?RVdLVXpSeUZ6dWhnR2R1eW45OFpoZ1E2b3RaakFacXEwWkZRbk8vc2lCQWZ5?=
 =?utf-8?B?NSs0cGVuSk1oLy9SVW41c2pWOTBBenVEdUhJYU5DZFFMb0NVUnFNcnRFT3Nk?=
 =?utf-8?B?cUJZSnFBM09lZnpRaUQwTnh5UGphaDRuTEJPWVYvUXRKNmdYK2lvMFViQ0F5?=
 =?utf-8?B?KzRqdnI5aUpBQjJCK1dIK05ZTk1pMExzRHpveVZuUmxaSDlDblZZSDZXYnhq?=
 =?utf-8?B?U0NRSGdFZEpQdS9QT0JKY2hNVmkxSGdKVjJBMmozUTVwbm9PSHlxdnFrU0xW?=
 =?utf-8?B?R3VmSWNkTGNHWm5Za21qaCtaOG1ZbVRGeHNRM2YvU01HcmJKanc2TTUwemNw?=
 =?utf-8?B?WldtdGgwOVRGaExoNTRRTGgwajNWNkxjSWVKWGJ4OFZUZjgvSXVlcURVZENh?=
 =?utf-8?B?VUtBM25TZC9rNXJFYnFTTythaHYxa0FnVnpKbVc0b2NFZjdIWHcvbEtLSXlT?=
 =?utf-8?B?Y3gwRGwvbHcyS29nMTNRZm1kaGxXS3NnbkNJY0lPVjJBUWxDSHFvcGhQU3BC?=
 =?utf-8?B?MHd6dHNnWUk3Wk84VkwvaVRTcXJtdFBxdTY5TTVuMVV1Rm9SZWxURFIrQ1dN?=
 =?utf-8?B?Y0VwOEJRRktTM3ZCWkoyMUZMbjlkaDVndTh0VXNhNUwySkZqSnNaY0x1UFhT?=
 =?utf-8?B?UjF3OWltRmg0bkxwbnBMbkFKUEkxc29KaGVvWEZWWklXOEtteFJwMXZzWk1i?=
 =?utf-8?B?anZUM0pOK0gyZk1mVitlcTNweFBFc3NOeFlNRisrZVA0SDQrOGdWcHI0UHRz?=
 =?utf-8?B?alJVTDNFam5xdWh2ZDBQWnVvNmwrWitvUlFNVXZTUjFPUVZld1M3YVRxZnlz?=
 =?utf-8?B?aWVFd0IzTTZSNXRBN2FkZ0F5bUFLMmt3QjRCNGFqYUUvK3ZSeG9xeFJMS1FP?=
 =?utf-8?B?VFhnV1BmeXRjZm5GZEhEaDZ6UEZrSjFkc3FaaHR0bTgxSlBCcHFzZE1RTU5X?=
 =?utf-8?B?cS9GSzhBSjF4MnRtQzRPSE9tNk9JaytCNGdUZGxrM2tUV2ZBQTZTdFN5YlI0?=
 =?utf-8?B?QWR4b0RhOW02UHptQnFyVjNJaGc0cWwwbC9pWnJiZG03QVVwdUZIU21IZDBS?=
 =?utf-8?B?RkhybkNycXpnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3BlT0hsSEEybWJ6N01kSEN3T3BQdkQ3eVRWejEwM1BvQnFTYkJUcDFCZXls?=
 =?utf-8?B?bkVxYmk4ZVdoUFk1NEhZaGdPeEw2NisyeTRlUWxmSmpqWGlWQmNja2NiU3VW?=
 =?utf-8?B?SlVNckQ1UUtPL043SzlrdTRXWDJuRFp6MGQ2NmRyeXdHWG5Mak4xa1RVdHNZ?=
 =?utf-8?B?c1F4U1BOTDgyeWtUQkpjRGRIT2ZqYWxiNWZWRVd1dkVXOXlTQXhZbmRBLysy?=
 =?utf-8?B?dFRWQ0N6ZVBUWXk5RXduZGhDTllJWEJxZHNmanpHN283TTc0UHlqanVxTS81?=
 =?utf-8?B?TDY2Qzh5TGsxcU5YcWtCeTJXZW1UVm9oUm45bWkxWUxkSDRtcURmRVVzMTNH?=
 =?utf-8?B?d0dQdFoxYVVDTjYvRmMrNHgwL09mRkROaDBKOEphMmtsbFFlUXNnZnlyU1JK?=
 =?utf-8?B?eWQ2dlZYU0o2ZlkvYWpCR0JaZjBGRFlvY2dxbEtycnRod2M2ckRjbGVTSDA3?=
 =?utf-8?B?MmJTQkE1Y3NGZlhFUzFOM0VjcERJVm5KNDIyQzJid3lqdloyT0NzSXJuamR4?=
 =?utf-8?B?bkU0c0hQVjRLZ1JYeVVLSEdWQklTemJJRlNoc3hxbzRXa1dkcC9hSUUzYkUy?=
 =?utf-8?B?S2NFdUwrTUU2ZGd0cVVRSzd0UHN0MWNMSGM0eVRjcUppRWp5NTJkazAwZXMz?=
 =?utf-8?B?cGRsYlRaUTBKd1U0OW5lYTRsclNlR2h1VXUvcmlJZ2RhaVBJQkROcmp1dENi?=
 =?utf-8?B?SW03U2c3SzF5cjMxVmxwWGtPakRCYklNdHNndlkwYUh1U2ZRYzBvRlBpcnRs?=
 =?utf-8?B?TkRHSFJiL3FFNHpvY1pPNXR6SG1hNlg2WTZZck9odVp1WXNhTmk5ZXRQMHZE?=
 =?utf-8?B?MkJHYkFmVDVPRzNQbEdPeFc0ODVGUWVucnBRa3UwcU5iQmt5ZURIdmRST3Fn?=
 =?utf-8?B?R0xlRGt6ellUdy9PVk5hRm5mNTVDYW55WnRtbWlZdjBNS2pUWVpRZEpYbGlD?=
 =?utf-8?B?RmNLUkZPWVQ4VnZwM3Rqa2RNZGFYdHdhZGxiZzNnZ3hzRCtaTldYMnVhcTZO?=
 =?utf-8?B?NWtFTk5kRFNJSDhROHVNdjNyQklSaytER0N2TkhUZ0FubU5wTHptY2tOWU0z?=
 =?utf-8?B?V2M0TnRCNE52bk9Uc0ZQSVcrdlNpU0xYNzV0MDV2Nlk1V1lCMUI4WEd5U056?=
 =?utf-8?B?TTN1b3FDZ21CWXlJN3JJUmZaUmNwWng4QUN5TlQ2YXpQRlZ2NDgrR0k0M3Z4?=
 =?utf-8?B?Y0FMcDEvdm9NYTRnRjE0aVRmY1gzV1puZ29obHdET1h1QlpYMmdWaDZERGZv?=
 =?utf-8?B?bmxGUmZVd2Q3Y3ZpVzFqUEFUamFBNUJONmFCS0Y2ZmJ0Q29yQ0VVdUp3cW9m?=
 =?utf-8?B?YXpjN2FqSjJxeTdoU0RRNG5UVlhVVU9haC9aOStMaVNoWmxUbXV2dEdJbW5C?=
 =?utf-8?B?WGx3Q3oxZlBtNHU3UlcrSFFoQloxNGRTMTBJdWMwamtlbWQxeitmQWNma2tn?=
 =?utf-8?B?UUg0MTVzbEZCQXhmSVBYSFNXK1QvZVVPcFJWb29jdlpubUZPUUtFeEF5Y1R6?=
 =?utf-8?B?UGhNK3M1a01nZWtIaHRWeEYrVStxdUg0Wnd2d0YzcklPS3c2Z0k3Yk5Hd1p5?=
 =?utf-8?B?NTQ2WkxwWWNzV25QaUNxL2E1eXdyYmF2bWc2OWFVRXNjSndDTVVHRU0zUHJj?=
 =?utf-8?B?NUx2MWxVWDZqN00vTTNzdWJBOUQvbVpKNnBqZ3NQY01sWVNNeXRCc0pERm5i?=
 =?utf-8?B?OS9ER2JZL0VlZ2FhMit5UU1wNEFxV2lJVUM5RVpkMVJJL2JVUlZRZjY5MUJv?=
 =?utf-8?B?a1RUTEg4ODB6OC82S0ZjSmZxZGlPZXRlWE5MaGcwaTBRWUc3NmdaN2o1K0lT?=
 =?utf-8?B?akVBWW41RWlLc3l1MG9lUmkrMWcwSmhDMUNxVWFXQTlGYnEwWGpFSlBRUTlV?=
 =?utf-8?B?VWZONDRzQ0dFVFRoTVp5S0t1TkFrY0FPQ0NvM3Z3dWNEVUYrbldsWlgvL2xO?=
 =?utf-8?B?ZWhYM2s2ejJmMEhzbHpMUk9XdnQvUTZNL1hvNUZIeDNGaDZXRzhaWkt6NVRI?=
 =?utf-8?B?TGh1Wk1YYXAzaTU4VjdhTG0rMVJORlkzM09hZUljcWJSaTFKcndIbzduaFBt?=
 =?utf-8?B?blI0emtzTC90L2MwOUQxcHRQbTBRbnpGbmpKMlA0TFhPaUhNRGttckptZVBH?=
 =?utf-8?Q?dBafDpLq0mpGdg14Gy7oALN+P?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a3eafc-3ada-4082-9abd-08de3143d3d3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 01:40:52.1522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZVcDB3wGjBF1+x2UGacVytbKa76MB4EnR2rNUsnhdV4y2+72HrAuAMsJngq5SSjCKHvQNshukoG53i4O9auog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7961
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

Hi,

On 1/12/25 12:51, Matthew Brost wrote:
> On Mon, Dec 01, 2025 at 10:23:32AM +1100, Alistair Popple wrote:
>> On 2025-11-29 at 06:22 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
>>> On Fri, Nov 28, 2025 at 03:41:40PM +1100, Jordan Niethe wrote:
>>>> Today, when creating these device private struct pages, the first step
>>>> is to use request_free_mem_region() to get a range of physical address
>>>> space large enough to represent the devices memory. This allocated
>>>> physical address range is then remapped as device private memory using
>>>> memremap_pages.
>>>>
>>>> Needing allocation of physical address space has some problems:
>>>>
>>>>    1) There may be insufficient physical address space to represent the
>>>>       device memory. KASLR reducing the physical address space and VM
>>>>       configurations with limited physical address space increase the
>>>>       likelihood of hitting this especially as device memory increases. This
>>>>       has been observed to prevent device private from being initialized.
>>>>
>>>>    2) Attempting to add the device private pages to the linear map at
>>>>       addresses beyond the actual physical memory causes issues on
>>>>       architectures like aarch64  - meaning the feature does not work there [0].
>>>>
>>>> This RFC changes device private memory so that it does not require
>>>> allocation of physical address space and these problems are avoided.
>>>> Instead of using the physical address space, we introduce a "device
>>>> private address space" and allocate from there.
>>>>
>>>> A consequence of placing the device private pages outside of the
>>>> physical address space is that they no longer have a PFN. However, it is
>>>> still necessary to be able to look up a corresponding device private
>>>> page from a device private PTE entry, which means that we still require
>>>> some way to index into this device private address space. This leads to
>>>> the idea of a device private PFN. This is like a PFN but instead of
>>>> associating memory in the physical address space with a struct page, it
>>>> associates device memory in the device private address space with a
>>>> device private struct page.
>>>>
>>>> The problem that then needs to be addressed is how to avoid confusing
>>>> these device private PFNs with the regular PFNs. It is the inherent
>>>> limited usage of the device private pages themselves which make this
>>>> possible. A device private page is only used for userspace mappings, we
>>>> do not need to be concerned with them being used within the mm more
>>>> broadly. This means that the only way that the core kernel looks up
>>>> these pages is via the page table, where their PTE already indicates if
>>>> they refer to a device private page via their swap type, e.g.
>>>> SWP_DEVICE_WRITE. We can use this information to determine if the PTE
>>>> contains a normal PFN which should be looked up in the page map, or a
>>>> device private PFN which should be looked up elsewhere.
>>>>
>>>> This applies when we are creating PTE entries for device private pages -
>>>> because they have their own type there are already must be handled
>>>> separately, so it is a small step to convert them to a device private
>>>> PFN now too.
>>>>
>>>> The first part of the series updates callers where device private PFNs
>>>> might now be encountered to track this extra state.
>>>>
>>>> The last patch contains the bulk of the work where we change how we
>>>> convert between device private pages to device private PFNs and then use
>>>> a new interface for allocating device private pages without the need for
>>>> reserving physical address space.
>>>>
>>>> For the purposes of the RFC changes have been limited to test_hmm.c
>>>> updates to the other drivers will be included in the next revision.
>>>>
>>>> This would include updating existing users of memremap_pages() to use
>>>> memremap_device_private_pagemap() instead to allocate device private
>>>> pages. This also means they would no longer need to call
>>>> request_free_mem_region().  An equivalent of devm_memremap_pages() will
>>>> also be necessary.
>>>>
>>>> Users of the migrate_vma() interface will also need to be updated to be
>>>> aware these device private PFNs.
>>>>
>>>> By removing the device private pages from the physical address space,
>>>> this RFC also opens up the possibility to moving away from tracking
>>>> device private memory using struct pages in the future. This is
>>>> desirable as on systems with large amounts of memory these device
>>>> private struct pages use a signifiant amount of memory and take a
>>>> significant amount of time to initialize.
>>>
>>> A couple things.
>>>
>>> - I’m fairly certain that, briefly looking at this, it will break all
>>>    upstream DRM drivers (AMDKFD, Nouveau, Xe / GPUSVM) that use device
>>>    private pages. I looked into what I think conflicts with Xe / GPUSVM,
>>>    and I believe the impact is fairly minor. I’m happy to help by pulling
>>>    this code and fixing up our side.
>>
>> It most certainly will :-) I think Jordan called that out above but we wanted
> 
> I don't always read.
> 
>> to get the design right before spending too much time updating drivers. That
>> said I don't think the driver changes should be extensive, but let us know if
>> you disagree.
> 
> I did a quick look, and I believe it pretty minor (e.g., pfn_to_page is used a
> few places for device pages which would need a refactor, etc...). Maybe
> a bit more, we will find out but not too concerned.

Yes, the existing drivers will need to be updated to use the new
interface. It should be a mechanical enough change that I can include
the driver updates myself in the next revision, but will need some help
testing. Just wanted to get some feedback on the general approach first.

> 
>>
>>> - I’m fully on board with eventually moving to something that uses less
>>>    memory than struct page, and I’m happy to coordinate on future changes.
>>
>> Thanks!
>>
>>> - Before we start coordinating on this patch set, should we hold off until
>>>    the 6.19 cycle, which includes 2M device pages from Balbir [1] (i.e.,
>>>    rebase this series on top of 6.19 once it includes 2M pages)? I suspect
>>>    that, given the scope of this series and Balbir’s, there will be some
>>>    conflicts.
>>
>> Our aim here is to get some review of the design and the patches/implementation
>> for the 6.19 cycle but I agree that this will need to get rebased on top of
>> Balbir's series.
> 
> +1. Will be on the lookout for the next post and pull into 6.19 DRM tree
> and at least test out the Intel stuffi + send fixes if needed.

The next revision I will rebase on Balbir's series.

> 
> I can enable both of you for Intel CI too, just include intel-xe list on
> next post and it will get kicked off and you can find the results on
> patchworks.

This will be very helpful, will do.

Thanks,
Jordan.

> 
> Matt
> 
>>
>>   - Alistair
>>
>>> Matt
>>>
>>> [1] https://patchwork.freedesktop.org/series/152798/
>>>
>>>>
>>>> Testing:
>>>> - selftests/mm/hmm-tests on an amd64 VM
>>>>
>>>> [0] https://lore.kernel.org/lkml/CAMj1kXFZ=4hLL1w6iCV5O5uVoVLHAJbc0rr40j24ObenAjXe9w@mail.gmail.com/
>>>>
>>>> Jordan Niethe (6):
>>>>    mm/hmm: Add flag to track device private PFNs
>>>>    mm/migrate_device: Add migrate PFN flag to track device private PFNs
>>>>    mm/page_vma_mapped: Add flags to page_vma_mapped_walk::pfn to track
>>>>      device private PFNs
>>>>    mm: Add a new swap type for migration entries with device private PFNs
>>>>    mm/util: Add flag to track device private PFNs in page snapshots
>>>>    mm: Remove device private pages from the physical address space
>>>>
>>>>   Documentation/mm/hmm.rst |   9 +-
>>>>   fs/proc/page.c           |   6 +-
>>>>   include/linux/hmm.h      |   5 ++
>>>>   include/linux/memremap.h |  25 +++++-
>>>>   include/linux/migrate.h  |   5 ++
>>>>   include/linux/mm.h       |   9 +-
>>>>   include/linux/rmap.h     |  33 +++++++-
>>>>   include/linux/swap.h     |   8 +-
>>>>   include/linux/swapops.h  | 102 +++++++++++++++++++++--
>>>>   lib/test_hmm.c           |  66 ++++++++-------
>>>>   mm/debug.c               |   9 +-
>>>>   mm/hmm.c                 |   2 +-
>>>>   mm/memory.c              |   9 +-
>>>>   mm/memremap.c            | 174 +++++++++++++++++++++++++++++----------
>>>>   mm/migrate.c             |   6 +-
>>>>   mm/migrate_device.c      |  44 ++++++----
>>>>   mm/mm_init.c             |   8 +-
>>>>   mm/mprotect.c            |  21 +++--
>>>>   mm/page_vma_mapped.c     |  18 +++-
>>>>   mm/pagewalk.c            |   2 +-
>>>>   mm/rmap.c                |  68 ++++++++++-----
>>>>   mm/util.c                |   8 +-
>>>>   mm/vmscan.c              |   2 +-
>>>>   23 files changed, 485 insertions(+), 154 deletions(-)
>>>>
>>>>
>>>> base-commit: e1afacb68573c3cd0a3785c6b0508876cd3423bc
>>>> -- 
>>>> 2.34.1
>>>>

