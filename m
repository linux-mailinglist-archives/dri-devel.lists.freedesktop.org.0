Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMKWKV13fmlZZQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 22:42:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105F5C40D5
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 22:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950C010E135;
	Sat, 31 Jan 2026 21:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y2+fOWUm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011052.outbound.protection.outlook.com
 [40.93.194.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFB810E058;
 Sat, 31 Jan 2026 21:42:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSD0kDYMdtfa+zfSplJs6LkDPC2rK8GXWo8rFXV6Je3WfRn2yClAcf8swvpsspAaiiX5dYrc828OC0vu6LcnSXmAoGotX3fy8Cv+HNxqljfKSuiFrz17pCGnTtNvkMlSNvRw9pnnGX4t3ZhdFzzCNuUWLjsICTBzpYMQtQAKTfC3Ht6tPpp247haNTVdFGFZkzmui4F68IYyQJv0GFEsOtXxYwQ5HhwSlMgiN2N/9T0AkRG4t9aNiN24ZdWQuVumnb5nvNM7MNcO+U/952IvDEtK8ZlR2YsHOY0YxerTTuek/pbSS8fjYJgOHOO6V5DaU5r2UR8fYCWhvjx2tM4IXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1vjb21EHkUhG+j/x+FSqD7oAN1X6Agdegi4IiplFZw=;
 b=V22Udnd7yiCSiwThT4eG87/y7Ve0HnbZGDESVc5L4smvH5ywOyy8NKkx4ToREV2uty/6JwLSGhovLmSVPPk0eE+LQgdReERwPnNp+IvTrWAUmu5zsu5Uwr7qCfZ2QR+1B28pZpRu/JuJ2BoQVrDb8V/cMHB1+6hog/Tcgw/UlacnERVf73yKL4D+1PwLya8WI/OFcbZfwDruapX6nJXXsALMbtIu64MZea2E9McDJFkzohQ8UxKnNIQMrjl73nV8GpJF1J9xsG888cwVI2MjnaksozOaubcnYfiICrHVyPzjP9mcCL+prMoOgrgXEL7+qPMJTfe7wZYQiQ2na21PhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1vjb21EHkUhG+j/x+FSqD7oAN1X6Agdegi4IiplFZw=;
 b=Y2+fOWUmNUe+x1pPZhgURsqjbtk5Xno1RAjH3amaRaIa/pvZvdY+cuS2ZfwMa4HWEYNJL7NAWJ8IlUruETEwqYzZaqRL9ldcUK83FhleKukH7rZl938A/3GJB1Q0AK5hAVAuOuBs/RC3oTdtWa2W+KqIS+/JPYtiMi1VvDMmWO9fNJFmxpuiYU0v62JrEKq1nKHHsJLTF7XMgLOsFHk+wl/RLSiAEeqBlNEE253CdZzjqBaFI/OviMBeNDdWca5RNXMpnogoQOOrN/9iKepyd3cNMHE45m08TZmllDiHKRCtKOIUMr5wU+wdAWL8j2da9k/a0+W4bQG5eIs2osTtDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ0PR12MB6943.namprd12.prod.outlook.com (2603:10b6:a03:44b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Sat, 31 Jan
 2026 21:42:42 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.014; Sat, 31 Jan 2026
 21:42:42 +0000
Message-ID: <0025ee21-2a6c-4c6e-a49a-2df525d3faa1@nvidia.com>
Date: Sat, 31 Jan 2026 13:42:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 intel-xe@lists.freedesktop.org, Ralph Campbell <rcampbell@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 linux-mm@kvack.org, stable@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
 <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
 <57fd7f99-fa21-41eb-b484-56778ded457a@nvidia.com>
 <2d96c9318f2a5fc594dc6b4772b6ce7017a45ad9.camel@linux.intel.com>
 <aX5RQBxYB029/dkt@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <aX5RQBxYB029/dkt@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR16CA0017.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ0PR12MB6943:EE_
X-MS-Office365-Filtering-Correlation-Id: 492bab43-388f-4668-2d43-08de6111a941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFJTeVlQeXhpeDJwL2VTb3MvallGdGcxOHI4N1pUTDBhZnN5Z1J6NDlNZ1pB?=
 =?utf-8?B?WGxkZzVvWGE2eHg2TkJUUTI2aFJtRURyWGNLMEVHM2NPSDNteGN5YS9malZM?=
 =?utf-8?B?amFUOGRwNTdBRFQxL2tYaWdOZ25ZeUNveWxMM0Erd1h0UmgxdTdoQStaK0Ny?=
 =?utf-8?B?LzRMcG5yTnNmZGlOajJJb2hxWDFSTS91WVdFaWFyYnZRN2t2V1IrcjIrYmtu?=
 =?utf-8?B?Q3o2eG1ka1hBbWZWcFNJbkZaNjBrYmQ1R2R3a1ZYSmlrUVdVU01aTk1Ib0Fr?=
 =?utf-8?B?NUJSZ3BMWWlvN0Foc29NcG1DNmRRVGtkRFZPSmkvRjNOM3c0U2ZIQjR2M01n?=
 =?utf-8?B?YTE0V3Iva01NaXZ1ZGpuOStGcmdLenNFanpSSzBYU1ZVNGNlTWNxUnF0UmhB?=
 =?utf-8?B?MXZvQWRqdHFDR3BUMFlQRytCeU43Z3VXcy9Xa0xtNTZrc0NZcGswNWc5QzVJ?=
 =?utf-8?B?eWJ1OU4xTFpxajR5MnNSRWlxcFRUbDlhZ0tvdno5Nmd0aHRSVisrRDhTV29C?=
 =?utf-8?B?UHNHMkNBZFhNd3YyNGFXVHVSaWpNcytzWEJzQ0pja2h1KzdnRlVXTGprWGNM?=
 =?utf-8?B?VHdxSlk5ZUp4QXlwS3M5YWMzQk1GM29UMnV1SFZ5S01CS3pDQkNiekczendE?=
 =?utf-8?B?WWV4UFFHOXZVN1NuZFhzYmlrYnJaZHRrUFIzKzRNREw4WWR3WXJpRi93dVdK?=
 =?utf-8?B?WlJ5N2lybDBMbjdyY2RVZEZqaDFueHJDR1MyWVhPZGZRMW1DRk5udGhvUUJ5?=
 =?utf-8?B?QVhjUzNRMEtMMFloeDBLOTZ3MElaSmoyb0h2T2pSL2thc2tNM0VSTUxwRTkz?=
 =?utf-8?B?MW12c2s0SG9QUnJPTHFDcEpnRTFUTkdpYkhOd0RsT3I2cjFqSHNvalU5amtM?=
 =?utf-8?B?TGJRY2crc2oyNXZUbVp0d0VEd3JsN1h0N3J1Q1BqZDZRcE9YQVEwKzNlOWMx?=
 =?utf-8?B?cmRXZGFCTTUwYTRJQnREdDRYd2QrNjM1N0JzdWF5U21UYWs1K0M2Vk05RjIv?=
 =?utf-8?B?R0JiWkNvVzBCYlAyVUsvdUNhYnMwelhMS1d6UXNGK1dISGxGakphbDB1NkE1?=
 =?utf-8?B?RDczNmdaRXpuaStSeTA3eExuN1A2R2s0U2RZdzhZT3Y3bDNNYStudEJNTzB3?=
 =?utf-8?B?cjNINEE2K0R2aUowT1JMS2xkTUhqYXc0dndERVRpVzNoMDRGajZOSkc5WnFK?=
 =?utf-8?B?bUJPZStibVVIMlJnNno1MTZnenhBMkFYRFZZeG9nUU9QMVFVRXdzQm5qejVB?=
 =?utf-8?B?Z1c2N2FUZTlYQ2NWUmZvcUNpRGd1bW1BaXcwN2hZd3ExSTJUaTFNR2tOUWFB?=
 =?utf-8?B?QW5YZ084WWR5S2p0UTVWZ0xYTEdUd3FVTFFIY0VYeXg1d296RTVFTkkzMU5T?=
 =?utf-8?B?dUNPd3JXZzYrSlRFc2hVczRWc0NyTTlqd05Vdkk1SnJwcHZWQnV6dWVaSXJB?=
 =?utf-8?B?NzI3NHlub0VnVEpNR2Y2dVVJZkx0K0dxOTF1WTZnTTdFTjNpYVdxOXcvUnRp?=
 =?utf-8?B?bVBObmk1Q0wrUkFnbHRsVTRoTkZrTGZZaDhPRmlGbEhiTm9LYUhxWnZXbHhW?=
 =?utf-8?B?S0ZhMWxiTjJkUHlnSXpGVzZ4K3Q5VkhIUmVKSDB5S0h2WmN6Y3dmUzZsSTc4?=
 =?utf-8?B?SWdWVW9LOExXNTQzL0hCTiswci9KMlRtTkM2YkltU3FrWU5jREJKNjNMeG5m?=
 =?utf-8?B?KzhYL1hZZDFENmVtVXczM3pnS2xHRDVqYTFRLzM4TzRHanpwMmN1R0FZWEVK?=
 =?utf-8?B?d2JYMm5BZXVkaEIyQVpFK3dkNlVDclVoUG9SYnk4WnZoRDNDNExCTmc2SlVU?=
 =?utf-8?B?bXlSeXpnSk5KYnRRZ2tvT2UvT0Z0ME1wYW9Scmd3YUVVdHc0UFB3SStTMDN5?=
 =?utf-8?B?SU5raG5jMk8xMml4QUd3S2ZCR00zamhackJVcEtlRm1ORFhkNlBuSlluSW9R?=
 =?utf-8?B?emFlL1JZbUhFSU5XNk92MFplN1FXblpxbkY5Wlo1SzdUdGo0QXRQbEhIY0Uz?=
 =?utf-8?B?VXlVclQ5MitXbU9VMUwrUUFJcUpCNHB1SnJ0dTBadi81czRGWHVJeTdndlJO?=
 =?utf-8?B?R0ZscTlKTzBsUE5WdGs5UEU4UW1nV3oyT2lkR2tLQ0FNU2pseUtON0wybHBT?=
 =?utf-8?Q?z394=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WENEQW5Dd0RCY0RkWjJDSCs0U1VwalBsRkM0KzA0L2l5UlRnMlR0a3hPSHlI?=
 =?utf-8?B?TFZLV2s2bzNtR2JsTVdUeVA1ZlhnK2Z6SmFsZlgwZTJFVjlyeEdHMmg0MmZ5?=
 =?utf-8?B?WXJqTkZFajRTUUNNSVp0aGhIbTRiQnlKZThrUnB5d1gweFZrbi9rWGx5UmVQ?=
 =?utf-8?B?NWJsMjZTaEg1TTdtL2FKdUd4RkZYMlBDNU9QblQ4U2xzOUxUN3kvYk01Sjlp?=
 =?utf-8?B?RVhtZC9iN0JSRk5mQ1g3SktBS0JqQkpncHBNRnBaODZRamZxTXhYaXdNNWhq?=
 =?utf-8?B?dnBzT3k5Z0pWbnl4MmROWU9RU0UzN2M1L2FGL0FKeHlWbUg0QzI2d3R5ZGlD?=
 =?utf-8?B?QXZ0YlpibWs2S0QxUDVaRDVKKzFiNFhEaUxZaUQ1WjZaeG5kanRCYUNCNUo2?=
 =?utf-8?B?MlB3Z3MwaUoyNDdhU2oyMmpWS2NMZWM1dFhJT2FFdDgzekg1eXZaUS9wVmFU?=
 =?utf-8?B?UDhPMmcyODB3dVpaMmJOODkwcFBmTHF2NEJDcUErNnF1U3o1YnlITTN4SXBG?=
 =?utf-8?B?ZGhFQ0hXMHlEUHJwbjJxSC93M2VIeDRDeFdoWDZNb2J1WHBmcTVwVlN1S0hy?=
 =?utf-8?B?WlNMUmtpYzROUGpnNWphL3BKOFZ0K3oyT295VmczNDlOb1ZJRXk3Yzl6WVpj?=
 =?utf-8?B?aDVjdk54NS9zaGtuSFJGa0R2OUNFdG15TytrT3F6NzZMVW1NdC8zTG5xUGJP?=
 =?utf-8?B?c1dBUWs0Wk1DOXJaVWRucUVFOGZQZmhmNkRvTEVRQ2o0eEZ1Tis3Y0NNdE8x?=
 =?utf-8?B?aFZTeHZ0MHFWWWRWa0h6d0dlV0UyQzR5QWhLazhBbStMNVdsWE11M0RmSC9h?=
 =?utf-8?B?QldlWmRXa2FXV1pLSXRsZFJreEtGZHd5cnFKWUs2Y1lLbCsxcThuWUp2VkZ0?=
 =?utf-8?B?a0FmN0d2R3lVUlhEdHlrT3k3WWdiN0ZIZEQzTmYzYXdXV1hKbE9RMk9UUkRM?=
 =?utf-8?B?WVlwZlNTUEdBc28xcVkzVE1lS3VULzRCQS9IUnhsRUFDVHcyOHV5Z253ckp4?=
 =?utf-8?B?WXRvcUU2NEhUNW1YQ0w1ZXlweWgwb0UzQW9YS080c0p0YlFDSFRWTUpuUDln?=
 =?utf-8?B?cjFNMVA1akxaaFhrcW15ZGRhbUtSUlhpMkNnazVTZFpFOE1PRlcxY1JZMWo3?=
 =?utf-8?B?ckNRV1YxT1NDL240NnQ3VllCRDJnblgxTkNnTVR5SnZNeWJxNm10d0Z5Q3I0?=
 =?utf-8?B?aUljZVZrY0h2WGY2R0lmZUJhYXg5Z1E5eFJzaHpPZGlsZFl0VlZGbnU5Z1dt?=
 =?utf-8?B?M0JJWjZFSXcrNXNzNmNZZ25hMC81dWFQTGlRUis3QitOczNUd2EvUVJPSkpZ?=
 =?utf-8?B?VkE4ZXZ5SVlqSDBYTnoxU081a21jU1AwWDhvMWlpUWQ3RFBWV0lxYVJqT2tm?=
 =?utf-8?B?RTlVUnRwUHptM1ZSYmVjZlYyYnRWOGJ5bEEwRGtnSEdKaEZLWkFDaFA0aUZr?=
 =?utf-8?B?dnZaVTFGNFExYmErN1pBV1pKZEdVanphSmNVS1AxcmZSK0ViSjV3RnExQ2N3?=
 =?utf-8?B?bmVUK05GYzBtNVhHRDY5WFM4cUQ0L0NwK0xPRitiQjQ2dlB4UGh1enVkQnJB?=
 =?utf-8?B?K01SSEVsUG9aOXZ6VDhpQ3dUakMvQU4xWVl5di9GUGlXU3NrbW8wamh2Mzdr?=
 =?utf-8?B?cjZ4eHhkRTRSUHFGMGNqRmVGS1o0QTBzVmFHNTFXYTJlMDd5SStyVzVEbXNh?=
 =?utf-8?B?ajlFY3QzR0RaQTZtWUR4OVBJdm14SENZRjkwSXhvbHkzOXcreEZnVnl5Yk5v?=
 =?utf-8?B?amVXRG5obEF3b3J4c1VFR3NJVE16YWdQU3ljSDRBcTlzSkVJRjZxVVBabmx5?=
 =?utf-8?B?MndpTXlSd1M4aDFWcmsvZVhBQXlGaFF4TXBjMjRsNGIrMGJTRTg5TzVRdWdS?=
 =?utf-8?B?WnFVRWJZMHdRbG9UeEtFaGtERzdmUjl4QitVUWRPaElYbTdBa21vbG51bmVD?=
 =?utf-8?B?aldyWGlNaENRRGFJSHRNdFRQUjd3N3E3bWgyMGxsUlVsUzB0UXZUY2srOTc3?=
 =?utf-8?B?WnRzSWR3WWdTSTF5bk10Z01qMThjUk1lTDI0MzdyOSt1K1RjVjFWcGF3Um1a?=
 =?utf-8?B?dDhEbHBPeE1GVjZsTkhTQjJ6bWJCVGlTUHlkeDdacjN0dHRHd3FXckJDUjNk?=
 =?utf-8?B?K2VFTWptbE9wbGFTa2o0a3BtK3FGbG1aZy9IS1c4VSt1T05OYlR0bm1GKzAy?=
 =?utf-8?B?eHgxVlF0Z2VqWFNRZVBGUzhQdUZlRW01SGIrQzJjUkExVVU5a1Vya2ptdmRW?=
 =?utf-8?B?U2F5cWlrbC9XTWxHUXAvKzlyV3R3Z01QOUhjcXFSMGhQajF3YVM3elowL3hk?=
 =?utf-8?B?YTdhZnFBZWp6Sm1mb004dnpqSjAwT29HaUNtVGdCbWhGZXpOclR6TjNlRkh4?=
 =?utf-8?Q?oG0jCjqXgCyb/UEg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 492bab43-388f-4668-2d43-08de6111a941
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 21:42:41.9843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMUGCE2r09ay7YuGMmnKa3Nt6007Bp/GJMe98CUDD1d8p7pVVffaAmVoGw4COtGuDxqzYqwd0k6xg7NOiWFDPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6943
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
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 105F5C40D5
X-Rspamd-Action: no action

On 1/31/26 11:00 AM, Matthew Brost wrote:
> On Sat, Jan 31, 2026 at 01:57:21PM +0100, Thomas Hellström wrote:
>> On Fri, 2026-01-30 at 19:01 -0800, John Hubbard wrote:
>>> On 1/30/26 10:00 AM, Andrew Morton wrote:
>>>> On Fri, 30 Jan 2026 15:45:29 +0100 Thomas Hellström
>>>> <thomas.hellstrom@linux.intel.com> wrote:
>>> ...
>> It looks like lru_cache_disable() is using synchronize_rcu_expedited(),
>> which whould be a huge performance killer?
>>
> 
> Yep. I’ve done some quick testing with John’s patch, and
> xe_exec_system_alloc slows down by what seems like orders of magnitude in

ouchie!

> certain sections. I haven’t done a deep dive yet, but the initial results
> don’t look good.
> 
> I also eventually hit a kernel deadlock. I have the stack trace saved.
> 
>>  From the migrate code it looks like it's calling lru_add_drain_all()
>> once only, because migration is still best effort, so it's accepting
>> failures if someone adds pages to the per-cpu lru_add structures,
>> rather than wanting to take the heavy performance loss of
>> lru_cache_disable().

Yes, I'm clearly far too biased right now towards "make migration
succeed more often" (some notes below). lru_cache_disable() is sounding
awfully severe in terms of perf loss.

>>
>> The problem at hand is also solved if we move the lru_add_drain_all()
>> out of the page-locked region in migrate_vma_setup(), like if we hit a
>> system folio not on the LRU, we'd unlock all folios, call
>> lru_add_drain_all() and retry from start.
>>
> 
> That seems like something to try. It should actually be pretty easy to
> implement as well. It’s good to determine whether a backoff like this is

This does seem like a less drastic fix, and it keeps the same design.

> common, and whether the backoff causes a performance hit or leads to a
> large number of retries under the right race conditions.
> 
>> But the root cause, even though lru_add_drain_all() is bad-behaving, is
>> IMHO the trylock spin in hmm_range_fault(). This is relatively recently
>> introduced to avoid another livelock problem, but there were other
>> fixes associated with that as well, so might not be strictly necessary.
>>
>> IIRC he original non-trylocking code in do_swap_page() first took a
> 
> Here is change for reference:
> 
> git format-patch -1 1afaeb8293c9a
> 
>> reference to the folio, released the page-table lock and then performed
>> a sleeping folio lock. Problem was that if the folio was already locked
> 
> So original code never had page lock.
> 
>> for migration, that additional folio refcount would block migration
> 
> The additional folio refcount could block migration, so if multiple
> threads fault the same page you could spin thousands of times before
> one of them actually wins the race and moves the page. Or, if
> migrate_to_ram contends on some common mutex or similar structure
> (Xe/GPU SVM doesn’t, but AMD and Nouveau do), you could get a stable
> livelock.
> 
>> (which might not be a big problem considering do_swap_page() might want
>> to migrate to system ram anyway). @Matt Brost what's your take on this?
>>
> 
> The primary reason I used a trylock in do_swap_page is because the
> migrate_vma_* functions also use trylocks. It seems reasonable to

Those are trylocks because it is collecting multiple pages/folios, so in
order to avoid deadlocks (very easy to hit with that pattern), it goes
with trylock.

> simply convert the lock in do_swap_page to a sleeping lock. I believe
> that would solve this issue for both non-RT and RT threads. I don’t know
> enough about the MM to say whether using a sleeping lock here is
> acceptable, though. Perhaps Andrew can provide guidance.

This might actually be possible.

> 
>> I'm also not sure a folio refcount should block migration after the
>> introduction of pinned (like in pin_user_pages) pages. Rather perhaps a
>> folio pin-count should block migration and in that case do_swap_page()
>> can definitely do a sleeping folio lock and the problem is gone.

A problem for that specific point is that pincount and refcount both
mean, "the page is pinned" (which in turn literally means "not allowed
to migrate/move").

(In fact, pincount is implemented in terms of refcount, in most
configurations still.)

>>
> 
> I’m not convinced the folio refcount has any bearing if we can take a
> sleeping lock in do_swap_page, but perhaps I’m missing something.

So far, I am not able to find a problem with your proposal. So,
something like this I believe could actually work:

diff --git a/mm/memory.c b/mm/memory.c
index da360a6eb8a4..af73430e7888 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4652,6 +4652,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
  			vmf->page = softleaf_to_page(entry);
  			ret = remove_device_exclusive_entry(vmf);
  		} else if (softleaf_is_device_private(entry)) {
+			struct dev_pagemap *pgmap;
+
  			if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
  				/*
  				 * migrate_to_ram is not yet ready to operate
@@ -4674,18 +4676,13 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
  			 * Get a page reference while we know the page can't be
  			 * freed.
  			 */
-			if (trylock_page(vmf->page)) {
-				struct dev_pagemap *pgmap;
-
-				get_page(vmf->page);
-				pte_unmap_unlock(vmf->pte, vmf->ptl);
-				pgmap = page_pgmap(vmf->page);
-				ret = pgmap->ops->migrate_to_ram(vmf);
-				unlock_page(vmf->page);
-				put_page(vmf->page);
-			} else {
-				pte_unmap_unlock(vmf->pte, vmf->ptl);
-			}
+			get_page(vmf->page);
+			pte_unmap_unlock(vmf->pte, vmf->ptl);
+			lock_page(vmf->page);
+			pgmap = page_pgmap(vmf->page);
+			ret = pgmap->ops->migrate_to_ram(vmf);
+			unlock_page(vmf->page);
+			put_page(vmf->page);
  		} else if (softleaf_is_hwpoison(entry)) {
  			ret = VM_FAULT_HWPOISON;
  		} else if (softleaf_is_marker(entry)) {

> 
>> But it looks like an AR for us to try to check how bad
>> lru_cache_disable() really is. And perhaps compare with an
>> unconditional lru_add_drain_all() at migration start.
>>
>> Does anybody know who would be able to tell whether a page refcount
>> still should block migration (like today) or whether that could
>> actually be relaxed to a page pincount?

Yes, it really should block migration, see my response above: both
pincount and refcount literally mean "do not move this page".

As an aside because it might help at some point, I'm just now testing a
tiny patchset that uses:

     wait_var_event_killable(&folio->_refcount,
                             folio_ref_count(folio) <= expected)

during migration, paired with:

      wake_up_var(&folio->_refcount) in put_page().

This waits for the expected refcount, instead of doing a blind, tight
retry loop during migration attempts. This lets migration succeed even
when waiting a long time for another caller to release a refcount.

It works well, but of course, it also has a potentially serious
performance cost (which I need to quantify), because it adds cycles to
the put_page() hot path. Which is why I haven't posted it yet, even as
an RFC. It's still in the "is this even reasonable" stage, just food
for thought here.

thanks,
-- 
John Hubbard
