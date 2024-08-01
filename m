Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE909449AD
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 12:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61ADA10E88F;
	Thu,  1 Aug 2024 10:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Jg4z1PRL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1805610E88F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 10:51:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KcIOefE0O6jMLmGziVvtCaDuSv3P7j5T+0XWVyuJ+mJNtHk901QfEO8CZNEJbxB0u+zMIpJbcv9iKursh2ApwSFhTKWx/Z65ivftEFirnEqkXbphVVNrUVGjWwiVSr0+R7mttAAClpGRf1Fe/O/a6NbX7H1Wu4WtyxSn69mDvVHEPUetgpRfEEvVeai1vaSg0qIDvKadGNY3Z1P831nISoT2yg6HCRO+LvgTdCb2iIuMZ+6BpyU7grownzuyXplOUNAz+h/qvvRY7UwyhVt3yoWYA76ilxQ+AEaWqEugeoUgdgQi74KT78f8SPVw+BfepWmg6q4NuwpFB7gz9E7sJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UVdl8316DUMxjeYz8jc40IPWKonFFiQC98ROgbGQNI=;
 b=magrQE8+Pv85sSDUhhw+wY+eRFaejihJ+VYd4umtLvEvlECzQnpyFjPY7XD7rYx/2cu+6djWNi8rK4Mfyj4cOlHt/Cssifo3GHgf8UAioxIrClXmWL9w5Nks1rD2xRGrz5iJi9U+cF5dEhNcoFM8p2qF3iQ2k9WSq9eU1pzyn7cKysLUkYNB2/83y9nLRl3erGpJz2DyaJ46ynrMLCIX1gmyaavKsqWHq+oWYznMRrbQMgMc0pMZx2LyTrAujnhXddRL5EbPFq5EjBc0O+brrZorRThlUk22fIgeG8X4kekmyNwaURN7wlJqZ4DHq4gdMVEUhVBLzLP1fogrbdGBsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UVdl8316DUMxjeYz8jc40IPWKonFFiQC98ROgbGQNI=;
 b=Jg4z1PRL1YGWd3meCwW//iSiXNVYzaNr9WDYLc2ft2puXAQxnODxiBrfD+lh9LstTEFisWV445GY+XwZmLREUhcq1rQMapKdLEzBXsLbDnaREWMA8vKjgTTl/ZP6703qXgzWQIFAuD/xND+pvQ/DcrrMpw6g8QAXydqiDC6eKRU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB8758.namprd12.prod.outlook.com (2603:10b6:303:23d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.33; Thu, 1 Aug
 2024 10:50:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 10:50:59 +0000
Message-ID: <46d00d9a-b86b-4e4d-863f-48d71060ef2a@amd.com>
Date: Thu, 1 Aug 2024 12:50:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] udmabuf: cancel mmap page fault, direct map it
To: Huan Yang <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240801104512.4056860-1-link@vivo.com>
 <20240801104512.4056860-2-link@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240801104512.4056860-2-link@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0434.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cbc1d0b-038c-442a-9c50-08dcb217d442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUMrV3c1K29QdHBTRVdETjFpc1hkbGE1cXlvU3V2QnhrRnAyRkhSOTJsaFdU?=
 =?utf-8?B?STBZQkxYRmdUeC9RTG90eGpYVWFRS2JJV3AvcXd2anQxSW1CaFRqT005bHFz?=
 =?utf-8?B?cjZnMEZaaXlvZjNlTzlDcnB6VE0yMThGR3czYXlMUGcreHA3dG5JNHA0YzdW?=
 =?utf-8?B?R1RDT055bmtmcTlwaU5RY0ViLzNuTmxEKzFrWERiVThISGlyNnRHQ1prREMx?=
 =?utf-8?B?OWZadENpMTZnQ3J4Qi8wT2VkSXdBWFNiQk01Q1R1U0tJY1l2SGd6RVpqQ2NS?=
 =?utf-8?B?b295SkFSblViRVlXTGIwazhrUVRoM3Y3aUlDcXprUDhCckZTQ3p1ZmxpWlV3?=
 =?utf-8?B?K0pZUkxPd2lqVnhLUnAwam56QzU0bHBUTWtVcHdNelNJQ2taVUlQekJWNFdL?=
 =?utf-8?B?RkY0ZjNIcTZDNHB3ZmlENDdLNldiSERkejArcG1xVWtiL1lpcWNJam5LVjFj?=
 =?utf-8?B?V0d0aFpmNnphaURTYmJqeVVRT3FYL3JnckJ2OEd4TVZtL1pSN2J1OVZlblZX?=
 =?utf-8?B?Q1hkUjV1T3lHQy9RU2I0VnhSN2NEcHZ0YzkwOHBwTjhBT3UwOCtRYXVqZTZo?=
 =?utf-8?B?RDZhWGZDdEVjazl4WlFnNVI2Qm85T2M5WFBXTCs5S24vclcxYnNnanNwem9S?=
 =?utf-8?B?cmJJVldRbmYrN0xKNy9QTFR6VlU3aW0zdE1Qc1ZmNysxZ3ZpNURSUVU0Mng3?=
 =?utf-8?B?MWtDODRObWhsUEk5MFN1MnZrMCtmMnhOelNpRmNOcDh4am5rNWE0d3d1dVg3?=
 =?utf-8?B?VTJqK3AvbUdDcUxtSEE3OVlZeTFpQmQ0MU1GTXRGN2JaY0R6RVZpMXZwK2xh?=
 =?utf-8?B?bWxZV0tpVHczVnRNeEc3UlF1eExFYWZJWlpYSHg5d2pPNkk0VGp2MFI4ZWtR?=
 =?utf-8?B?empyclQ2SHBnVDIwcW81aEJkV3YwdlBGU3JBWjFXTGF6cmZ2ZnBGTlB4dXd1?=
 =?utf-8?B?Y3hOOXJzT1YrV3RWU1lOTVFQOThvZzcxWGxKV0Z1aTYwWk9MZWx3NlJQZHB1?=
 =?utf-8?B?YVY5cFlmc2Rzb1pvN2hTTmVXRUo4UVFkRWZKVGgveUU3TzZsN0lFWU5oczg4?=
 =?utf-8?B?emxrUTZpbE8vYWNlcmpTVXgvaSt6Y1JXa0pKNG5MaWJHQzF4ckt4YU0wdTNZ?=
 =?utf-8?B?TkYvMUh3OEY3NngwWHZna0tvV2FWZFBRdUFieXN2SXZRNlprRitXTXM4YnUz?=
 =?utf-8?B?U1g4ZmQxTmlmTU1YNHduaVNGSk5YbVJkdEE1cXEwYWJDaC9nNE9lQU45c2xN?=
 =?utf-8?B?UlkzTzVtTytlRzE2elJUaXJRUWpFbGpaSTdGTS9QV3J0Q2FYQmxvTUVxQmNO?=
 =?utf-8?B?ZEQwa25DN09JYU41bW9vQkIzay9EajAwdDJyemtqb2xrenpFeUJSOU8rS2tq?=
 =?utf-8?B?VmVlN3djRVQ5akxtQk83OVM2V1hkd3hrQ0F4VUFyOXBGbWdKZ2tRSTd4VWJo?=
 =?utf-8?B?VlJiU0VCUFhOZWlhN0RFU2dSSE8wQ0dTK0V5M0JIRDBnSHIzZlAzZE80YTE0?=
 =?utf-8?B?bGNPWGdIZVBmTDJZM0lhUG5NVUNLWERhMHdIRmd5ZUEwWU1RVnorMHEwNGdG?=
 =?utf-8?B?bVFqNXV1RitLUXVlYUQvSkROazdkUGV3MHlNNk5sb2YwNFZtRWFpNnFWT3lR?=
 =?utf-8?B?ZmozSVlPczFrbzgyZUhWa3VnSktYNHpHNHp1cThFc09uano0Kzk2alc2c3cr?=
 =?utf-8?B?ajJ2d3Z5SDNicktCcTJyeThwRkNVYnVXeEtJRXhIWDIxK1VkcGo1cFFRQ2py?=
 =?utf-8?B?bXdsYkJQUWo3V1FrRkFuRzM1UmJSSk5hL3FxLzMyWDgzcU1WQm5BVGo4SWRV?=
 =?utf-8?B?MVBWRU5wMmorTkJ2MmxHdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWtCKzZaaFNOcExnZ2pKWEI0clNXNXBsdXl0OFI0MVl0bFBKanU2RDVpbWdp?=
 =?utf-8?B?YlErdy9wWEw3TjRIandVVEo3Qytodk8vdHViMzFVTFpPSlFLbHhlM1JyQnFQ?=
 =?utf-8?B?blZvbWVvcG5hcXU3QzhQSEgyU29GUDZ4SjNhS1F5U2RhTHdrRmNPd3djOUN4?=
 =?utf-8?B?SllzUm9EaTRySEs0dHZ1dThvWVhxYXdSWVVsMFF1UnJReU04b0p4WktJSnJZ?=
 =?utf-8?B?TmZxWTJ2akNocm9tWlY0WEZEN0ZWK016Q3NHam1pRDZ2UHhsbHhJZDJ1NUlv?=
 =?utf-8?B?Q1d0SmdUaHVmcDZ0aUx1azY1VVBJRWc5ZGxTeGNybXRZbHZjYmQxcWdxci81?=
 =?utf-8?B?L2d0Z2lnUzlzZ0Q5TXMvRUVGKyt4Y1lxMnRQeFJIOFJsYVNrNXBPaXFDZlN1?=
 =?utf-8?B?aHFuKzFsUWtPaTRuNnh1cmpLZVFId3FFUlJtRGdydDZjaCthRGM0NWcycVFv?=
 =?utf-8?B?VzVuMW9sUXNQVldBVjcrVGQrMWdMbUM2WVl6QUErbUZlZHBVYzRBVWR6bzRR?=
 =?utf-8?B?QmxHTmRMSVVaZmx5WTJGcXFBOHMrR25JaDA0N0NvMXNEOXloN016QnUxZ3Bz?=
 =?utf-8?B?N3pTYWd0U0F4OWVYQVY5UHJsUzFBNHo1V2hQYUp6Rmtudmh1Y0FSRjU5clhV?=
 =?utf-8?B?V21lYVdOSVJZeUhNQWEvT2YraWxDY2NnSHdqWnZBYVNzU2Y0QnQzTjJWRUZB?=
 =?utf-8?B?U1cxYVp0VnFMTHpXUTdXQk83OVVuditQTlRoU3d1K3E4UzRJcE8yR0lmMmZq?=
 =?utf-8?B?MjlXcHkzb3dLTDJtMjBsZFZKcTlpUDFWQ25pM2ZpY1g1MGNaUzQ1WFNIZXNR?=
 =?utf-8?B?YjUyYUx6czd1WitIQUswampBajE0SEV0WEZoODhraFBCKzNORDlrWThsZzhR?=
 =?utf-8?B?Z0ZMdGJMaTlvd2JXOGFwM21NSGI2b3BIMFltQmdSTU8xRWFUOEpaSEFPNG13?=
 =?utf-8?B?QVBUTXJvWWRjSThTdEdkb0pWSkc0VWErTW5wM2hmdUFWK2NtT0xtU20xaHJM?=
 =?utf-8?B?RElWWGpFaGNrUll6UjllUlltbFdrV1pwMGkvMytpZVdYb1ZTeUNrcWliZTU3?=
 =?utf-8?B?MGtNczBraGJtOU54TEtXZTVqZXNDNTNIWi9RaXRFNHkyaUJkR0tYQXBzV3Zk?=
 =?utf-8?B?ek54eEU2MlR0ejB2dGJ2S1p6MXEvcGdjNGN4OXhHb0ZZamYvVW15S2xReVND?=
 =?utf-8?B?MXpBMVlaMUhIaGpBcmM3UGVvM0FyL1ZaTFlwTUo5OFpKb085a3MvV1hiR2RJ?=
 =?utf-8?B?bFJ1SGRLb0VjZENCZm5hMml3YkRUUjVMVmhCYm5vcXFPZFF1RzZoWTJ1UkZm?=
 =?utf-8?B?b3VhMmZ4ZzREdGtqZ0crOE1GZ0ZTVXlCQitYRDk4a3RJMUkyclUrQTJvbE5F?=
 =?utf-8?B?OWlhR3o5OThxL1g3VWUvcks5SFJrRld1Y3VpVjRWMTY0SkwxL0NQdjBwaU5J?=
 =?utf-8?B?WnphOGZqRkZ2SGxGaVkxalpLYkZ5cFVEQ0FxdGsxdk12T3puVEtKbEF0cHA2?=
 =?utf-8?B?NkxwSk5GSis5ZFdkNU4zcDVaSnhBcWUxUElhTGFweEJpeVVwbUlzNFRwbWFY?=
 =?utf-8?B?a1ZwalpJM3A3R1hJWUZqOWZBY1h6V2xWNnVJTWxMU05zWFkwaFZScWR4ZVJs?=
 =?utf-8?B?WFJ1bnp5STY5bWYzcHJ3RzRrdk5veThiWFFzNFM1VnhTdytPa1UxaEVGN2w4?=
 =?utf-8?B?MlNnYTZ0WkJGWVlEMFJ1U3VERGE2RW1Vd05oUVRDWlN2Z3AweVZ3L1RyVzhh?=
 =?utf-8?B?YzFBMmVvOHNmMUswcWNlV3Q4RTVqZXF0d284aUhBbjE3b04rWEVGQUJ5N3Fl?=
 =?utf-8?B?MnVFMWJPK0lodkt4YlFDOEVLV0Vaa2cxVUcxa082K2gyckZkUHNEbjNreWFo?=
 =?utf-8?B?azdEWFBXTDVmOWhOSmhTbzBrWU16eWNXd0U4amZvVVFCYzVvSHhsa0ZsQmZC?=
 =?utf-8?B?NEF4SzMwL016WWFhdTYxTTRaVjdyK1R0bDJZR1dtdlh5Nkt2em1tTkh4SVhT?=
 =?utf-8?B?NFBLZ0R0djNPRU1ST2Q5T1E4VjZOQ3FQbXkvMm1JOHZqYVpZbzZEbHl5aTBM?=
 =?utf-8?B?ZGh0Y1RhMnZNMHJNZHRjeDRWTTIzNC92emQ5dnE2czEzMjQ3bG1lOVl6RWFB?=
 =?utf-8?Q?yLi1+s8SogqkItOzvn/gvm9eb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cbc1d0b-038c-442a-9c50-08dcb217d442
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 10:50:59.7393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUFdcgJf/qbiPqNOJd/+dSFz2577fL2xF/GnP/WY37p0TsklKLvHQkkMh1KRibT3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8758
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

Am 01.08.24 um 12:45 schrieb Huan Yang:
> The current udmabuf mmap uses a page fault mechanism to populate the vma.
>
> However, the current udmabuf has already obtained and pinned the folio
> upon completion of the creation.This means that the physical memory has
> already been acquired, rather than being accessed dynamically. The
> current page fault method only saves some page table memory.
>
> As a result, the page fault mechanism has lost its purpose as a demanding
> page. Due to the fact that page fault requires trapping into kernel mode
> and filling in when accessing the corresponding virtual address in mmap,
> this means that user mode access to virtual addresses needs to trap into
> kernel mode.
>
> Therefore, when creating a large size udmabuf, this represents a
> considerable overhead.
>
> Therefore, the current patch removes the page fault method of mmap and
> instead fills it directly when mmap is triggered.
>
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>   drivers/dma-buf/udmabuf.c | 70 ++++++++++++++++++++++-----------------
>   1 file changed, 39 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 047c3cd2ceff..d69aeada7367 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -38,36 +38,39 @@ struct udmabuf_folio {
>   	struct list_head list;
>   };
>   
> -static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
> -{
> -	struct vm_area_struct *vma = vmf->vma;
> -	struct udmabuf *ubuf = vma->vm_private_data;
> -	pgoff_t pgoff = vmf->pgoff;
> -	unsigned long pfn;
> -
> -	if (pgoff >= ubuf->pagecount)
> -		return VM_FAULT_SIGBUS;
> -
> -	pfn = folio_pfn(ubuf->folios[pgoff]);
> -	pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
> -
> -	return vmf_insert_pfn(vma, vmf->address, pfn);
> -}
> -
> -static const struct vm_operations_struct udmabuf_vm_ops = {
> -	.fault = udmabuf_vm_fault,
> -};
> +static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
> +				     enum dma_data_direction direction);
>   
>   static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
>   {
>   	struct udmabuf *ubuf = buf->priv;
> +	struct sg_table *table = ubuf->sg;
> +	unsigned long addr = vma->vm_start;
> +	struct sg_page_iter piter;
> +	int ret;
>   
>   	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
>   		return -EINVAL;
>   
> -	vma->vm_ops = &udmabuf_vm_ops;
> -	vma->vm_private_data = ubuf;
> -	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> +	if (!table) {
> +		table = get_sg_table(NULL, buf, 0);
> +		if (IS_ERR(table))
> +			return PTR_ERR(table);
> +		ubuf->sg = table;
> +	}
> +
> +	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {

That might not work correctly. We intentionally remove the pages from 
the sgtable when it is shared between devices.

Additional to that the sgtable is *not* a page container, but rather a 
DMA address container. So that here is also a rather bad idea from the 
design side.

Regards,
Christian.

> +		struct page *page = sg_page_iter_page(&piter);
> +
> +		ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
> +				      vma->vm_page_prot);
> +		if (ret)
> +			return ret;
> +		addr += PAGE_SIZE;
> +		if (addr >= vma->vm_end)
> +			return 0;
> +	}
> +
>   	return 0;
>   }
>   
> @@ -126,6 +129,10 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
>   		sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
>   			     ubuf->offsets[i]);
>   
> +	// if dev is NULL, no need to sync.
> +	if (!dev)
> +		return sg;
> +
>   	ret = dma_map_sgtable(dev, sg, direction, 0);
>   	if (ret < 0)
>   		goto err_map;
> @@ -206,20 +213,21 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
>   {
>   	struct udmabuf *ubuf = buf->priv;
>   	struct device *dev = ubuf->device->this_device;
> -	int ret = 0;
> +	struct sg_table *sg;
>   
> -	if (!ubuf->sg) {
> -		ubuf->sg = get_sg_table(dev, buf, direction);
> -		if (IS_ERR(ubuf->sg)) {
> -			ret = PTR_ERR(ubuf->sg);
> -			ubuf->sg = NULL;
> -		}
> -	} else {
> +	if (ubuf->sg) {
>   		dma_sync_sg_for_cpu(dev, ubuf->sg->sgl, ubuf->sg->nents,
>   				    direction);
> +		return 0;
>   	}
>   
> -	return ret;
> +	sg = get_sg_table(dev, buf, direction);
> +	if (IS_ERR(sg))
> +		return PTR_ERR(sg);
> +
> +	ubuf->sg = sg;
> +
> +	return 0;
>   }
>   
>   static int end_cpu_udmabuf(struct dma_buf *buf,

