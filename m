Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DFEC99C18
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 02:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD1310E4FB;
	Tue,  2 Dec 2025 01:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OHYsdp25";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010015.outbound.protection.outlook.com
 [52.101.193.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D2010E4FB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 01:32:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plGkL8z8GdqyPFXIbS6nEhhUclIMYmSpiTzVQzyDAeCbtFY86eWbQ8vxhNSQP1SOMVIFuED7wGEVfhxXFCx0xf+Ob8u326P5bd2t9Az4ROoGSAYX+rMihiJ7HUjXIIvBNH7Svq55gRrTIiAb1Dyw716G86Le3pE59Ej+HT2UhBtjK9CNjdFVz/nxaDcJ/b6Mwz776j6z3joKBnpIorIQjhrDu1GUWG2FYL/E8sWuNZxC6kZwZ/f5sw8izmJmK7VeVg8cwP10sOxpIoxQct1L58LKAwnVRyAY3G4DvZhw20oAY5ULXIPDJYrpCcTUJux2aikNM/cveR2iaHc0uh5stA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zm1LlW6rdqpo87g9BD85hbKX4DKn87Dgy0T9CrGdbIU=;
 b=XWr4STy7OObzbcxEUXrgkf6Zu3KM1YvOVxr21NzUwO5N8yTaOpznnWtykD3/59YF4gTAraKKG2s66x2xeSa4Sv4Xy9yogq10EGTiGLD4/1MO+ZdpzUm0/nWqsVE2Q6NDOfG+wWWGXFILlioBuWkBIE8PJVVEN/aZzEdxayuAkDTcacj8tT4hWYBoMGzqvB8ycWOFMXI3AQkAtCPxfjz1yuvYim8sT9ncLpaAFz1RRRyf8se4NNuZLf6jzlUQioVPLJ8puYpm8j1gVogcySubT+IYdwbmaoy7a8pVifHY3DyP+2N9lnX2PyI0NUxq7iWvsmrrdch2SrlcmFc4zousRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zm1LlW6rdqpo87g9BD85hbKX4DKn87Dgy0T9CrGdbIU=;
 b=OHYsdp25rXYJfJHeQK13JtGvaN7HD3d+mTo8rTlkv6VCdhTQyLIj0IlK4fUXGrQHQYiKsSIB1bkzNQxu1NqUXivDhI0/25RAZMbldNIvVQS+TqL0aUnKXfrsJRPquEF64m1wVyPgnlx/P5+Yfrdcl+iMChwnfbZWeG0LWaSJOTKRPYNUznGpzOyedSwPMLePGQwJH5Xo2tGUiiD4NY9s//MsEEA4gRimWm1+mL1R7Ea+Xx+6tnptZP9ziLmtD+wu82BCdG8C6ABeBbafezOook/IXUDh+oVD0xfqFk28eEtgXxSGwOkqGczS0PRuPcv1mw3pNEp4dMETLzUn4s0ZpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 BN7PPFDE2ACDA69.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 01:32:46 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%3]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 01:32:46 +0000
Message-ID: <9a32a182-26e7-431f-810b-a2f4db5ce592@nvidia.com>
Date: Tue, 2 Dec 2025 12:32:39 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] Remove device private pages from physical address
 space
To: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>, linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com, jgg@nvidia.com,
 willy@infradead.org
References: <20251128044146.80050-1-jniethe@nvidia.com>
 <584671b7-f1a5-4e9b-af94-3e284b3edcf3@redhat.com>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <584671b7-f1a5-4e9b-af94-3e284b3edcf3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:a03:333::18) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|BN7PPFDE2ACDA69:EE_
X-MS-Office365-Filtering-Correlation-Id: fd533b75-0c4d-4983-e759-08de3142b284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RndveU04Umd3UllodGtLOVpadmZJbk5YdlNIVGJGUHNqZ0hkQmV1eFZQTjVD?=
 =?utf-8?B?cjRCazNtVU1LUTF4ZElzVFdjeHFsWWJXWTdzWENtRTljd29zbUVyWjJYa1Ju?=
 =?utf-8?B?NnpsUVU2NTZTTWhlZ1FwQ1BJOC92QmptRW41bDRkOEtYajc1Z2R1ZzZBMjJm?=
 =?utf-8?B?WGdoZmVCdHBla01abUVDZGJLem42MmFObUYzcCtiNm5oV2QzQXc5SWRpQ3hw?=
 =?utf-8?B?VnROcm5yUW1LQVJ3MW9keDhhSWVIZDE0OHZhQlZER0Nlc0NBbFFyZ1k3QjF4?=
 =?utf-8?B?anp4dGpDcEs0by9jZUNLc1BSYVAxOElqYmhYMmJzZU1IUTJGNW4zR2JNUnU5?=
 =?utf-8?B?RXM1KzQ4aS90KzhYcmkvZFRvRjdBRFgvMUlFeXdybk9COUxMT3Y3VGdJME1x?=
 =?utf-8?B?Wi95cEF4NllkME5GSTdYNjdPbzF2QWZ0SFg2SGx6SjNVbFZHZC9EYnpYbHJJ?=
 =?utf-8?B?aWlJaG5POEVSRDVRd1VVN1d5S3FGLzBYbEFZYS9mTEdZT0J1VEJtakk0SDVQ?=
 =?utf-8?B?T1VWL0dXOVBQZ250V2k0cTZQd3FTZkNRcTFTSklQVUtSSlhVci9weEtzL3B6?=
 =?utf-8?B?clNDeGcvMGlrNVRQR05QVFRBQUVydnNWZVNiaFpGS1lWSXF0RGRIWEdCMUtG?=
 =?utf-8?B?VFFMK1haMTA0U1YzMExJTHJGU01GLzQ1b3dQQTFCYzJkU004b2NjRnpRcnhI?=
 =?utf-8?B?SWxnK2p3OGhhYTNiaGkyRndqVElFS24yYnRVKzhJdFNndnAzQURBQ1k4L2VT?=
 =?utf-8?B?dVBqSjU0a1JmNVpKV2dpOFY4ZTZ4dXJtOSt1M25GbUVjcENTQVFLUGVGTWR6?=
 =?utf-8?B?enZjL0ZNOVpHOWNHc2dvUFZqOTBENFRuenlYVGZ5WSttV0RnNTFsSTd3cXBF?=
 =?utf-8?B?ekNXL051eUgzenozcXdZcTNidEZVZUd5SkpRemQ3WTFYL0tKRFQyNS9GcCtJ?=
 =?utf-8?B?eFd1T0xoVThSbXY5eTY3U2M1ZWF4YnpmUUhFa1JvS05pcVZhZjJsc3g5TU90?=
 =?utf-8?B?TVdpdVBqanM1Mzdsb0loN2ZNSGh1aG1oZlREb3ZqYW5acmNkS0svWmNnWVNX?=
 =?utf-8?B?azJIcXlzQjcwbnlRcmllZlJWc3VETjhIZjliQm04U1hXYURlUmFtbXhEZEZW?=
 =?utf-8?B?R3FGcmw3VXgzZDFFdDE3cU1KQVlkcjVaT015TDlMRUc5MnY5elJTc0hzOEZI?=
 =?utf-8?B?Z2k4QmF5WWx3ejNuNXpQcGorUnBtSzM5TkRNMFVhZzRqaksvMGN5MlVRSVA5?=
 =?utf-8?B?MkhrM3YwYjQvZ1ZrQzN6cEdpMzBSZXBaLzZKL0JxYzF2a0h4L2ZGYm04MzZn?=
 =?utf-8?B?NFJ1U0tuaWRxL0cvMUNPeDlyM2ltdm5vWi9tTmtaYlg0TU1raVlYUWdqblph?=
 =?utf-8?B?dFRySyt6eWFsb0diTUNKaWVFU1FaTlhUMHhHZ1ZXb0NieUNHRUpVbnpNdFU3?=
 =?utf-8?B?b29VUC92dVhHdHFUbTZRMFFxTXZLYmFYWVdBRHlUc3BGT2lDT25vb3lQN3ZT?=
 =?utf-8?B?eDlNbkg3bjZ2dGU4Q0szTmhWTTg4cXBhZWFxUkp1TDZ3RWpmNWJEbjEwekZ5?=
 =?utf-8?B?RW1oVTducGgzV2hpandoRElvUTdTeUU5RlZNcUpVL1ZXWC9JQWlxMHdlcHNs?=
 =?utf-8?B?TjY0ZDVmTEt5QTdMN2V6eXd0RXRlVGdoWmlkbG1vWUprczZYMmVyOGp6UVM3?=
 =?utf-8?B?SDhMNk5DcEtuK0xGSm81cnBKVldRQ3pjTWFxU2JneFBIQ1hNcGpFWUlmT3pC?=
 =?utf-8?B?QU9VdUMvQmFSYm5CbnplMXA5L3ZPSFl6SHB5REtsdXA5YUh1ZnFjZ2xCdGFs?=
 =?utf-8?B?UE9BTHJNV1BGdXh1bjlFUU96V1h0bGNjeHBYakRmYllTREVJMjBrb0VXc3pZ?=
 =?utf-8?B?ZGtIWXo3T0RZQ0Vxbnp4S2dlUFVaTmZ1aHFGeDFqTmVLdGxCQXBKYjVXcVdt?=
 =?utf-8?Q?qT2UvEtGGg5V6rgvNtQYokvFBdYriTU+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHd6WGdlZ1RoOEltYVFETXZWU3lhVFlSTElNN3FVVFo4ODJ4TTRVcFhmcWg0?=
 =?utf-8?B?RndTcEljMmVlbzZmVkEzQlZPZ0VKclpXeGVSaHdtQ2d2dzhoc00vNEJuaVBX?=
 =?utf-8?B?b2NLWnpSV1VCTkd1QnlqQWtRUmFGYVdnSTI4MjVneTZSRk1DOGQrMUhsS1hF?=
 =?utf-8?B?ZmQ1Q001bFd1azNvOG5sN3JXMC96Q2gwTjVCMTRMajZldm0wM2h0MllBY2FL?=
 =?utf-8?B?UkJOSzM4cW9mZ093Z1ArUndYRHBmZkt3S3Y4WXBZN3VrdUJnQWdkaWVpanJl?=
 =?utf-8?B?TVY4T2svb3RsVmZNTkFYQ1BKOFJnd0NnL2Q2Q3VlTFJTbkU1QkJBSTZ2Z0ZH?=
 =?utf-8?B?aHdEdVJMYmt6bm54RmdYbWNFbkkzNElDcDU2bHl6MHFST01jVWVTVUN4citU?=
 =?utf-8?B?NTVGdjNkSGlYbHF1czA4bmVXZUppOC9ETVEreGFRaEZPdm1oUlExdTBva0pp?=
 =?utf-8?B?YTY0bUlDemE5Nm9GcXFQL0FjZWFmYWtNTVRqaUpQZnVTZFdQOWg5NGhOR3o2?=
 =?utf-8?B?YmJUTmJFNG56Q1ErYVJ5cFFJRGk3MkdlcldVMUZYMVlPZmpWbkRwcWxkOE5W?=
 =?utf-8?B?ZGxtZUhDUjJDUTBWemQrbjgvaC9QR3FKeU8veUswbWQ4Vkx4aWZ0Rk9tRlRL?=
 =?utf-8?B?KzdtdnNZUG5Cbm5nUnJBQ3NwdDNvUlZNcDRMNXVhdHFPVFBxVTJkdjdYRW1D?=
 =?utf-8?B?VlFVV1p5OWFFNFZVYnpzNGdnUTZtbk9wVE5aaXgwSE1GL0U5bHo2VGpXRW1p?=
 =?utf-8?B?REhmSEJLdVpFRXlpU29DTHNzRmRkUmZhMUIySFZPMG1URjE2VWluNDUwOUMy?=
 =?utf-8?B?ZXVrMUxnZzg1U0I0emg5aG1RRU14NFdZOVV1M3ZSRGhOZ1FqWjZnaDczNWJh?=
 =?utf-8?B?WG1FOUQyek4zeHZwZHhsUWFEOEtxUUdCN3JoOVBjRGVFM3lMNVNSZEdXN1Z3?=
 =?utf-8?B?MmdNNjREand2OWZIRlQzLzhteW91K2xYbU1NRExrVmpkVkE4TTZkRC9OWEgr?=
 =?utf-8?B?cTZSQXk4N0pZa0ZSTm9naW9MUXJJSzVjQkx5emE2anhseDVPbWdmZHByR3lF?=
 =?utf-8?B?dEF0K2ltSDd6eWN4YXJ5ZEJqY2VmRlB4Q2JUOWgweGl2RDV4cE9VU1RURVVl?=
 =?utf-8?B?Vzl4cHJnbU5UNGdDd1Y0QlNBMmQvQ2MwOEoya3huYzRBL2pQeEdEUzlaMHNr?=
 =?utf-8?B?TFNSUlYxN0hhOEhGZjFtYm5Rc2lXMWZyY2FzR2ZiV2pUZm9yVTB1b3k5TitI?=
 =?utf-8?B?M25pbnBPZFVpNFFhNm9sbzMxWGl3Z2ZjajZQNmhCL1NoMEFXNDdSTDVBUWN2?=
 =?utf-8?B?U1c5NmVqTTREWE50c29haEg3QURoZ0MvVi9BMlMyQ1dqb3FISlIzSk1ReW1D?=
 =?utf-8?B?RGU0dFkzRHc0WWFFVDI5eHNXTHlvb3owRWxjQU5LN2kvRGZwYUEwSVRJd3Jx?=
 =?utf-8?B?cWtDUkYxazBSL0RFYUtwNjI5Y0NoV3czV1Vsb09zTWVLMnNhVklwYlVyWXRj?=
 =?utf-8?B?SjFPMW5wY01ic25YdVgzNklZTk8vejBBMGoxYXRQK0hTcndvVG5vbzBjYjVU?=
 =?utf-8?B?QTkwUnZrQmRzTjR5RjYvbHdLN3dMVXFXVjdnNGZ0TEVaNEg2V3ljaEI0eTFk?=
 =?utf-8?B?M1RnYW85K0ZQamxxdWtGdWhHYnYzRUY3ZitoZmxiTVBuWnNoeUJKZnJOOTBl?=
 =?utf-8?B?czlOWXQzRTJPY2QrdjAyUTR2NG5SNEViRGFhSFd6cFVDOWlBcnNXNzJhZkhW?=
 =?utf-8?B?eGtlNTZCeFdUaVFUYVJNc1d2Mnh6V1N2ZnBGVC9tdEwvQjZKR3ZSOVhDbEJE?=
 =?utf-8?B?Y3lmQ0VtTVVnUzAzaHZrUEROazBuY25ubWdJUjYwNzVkVHQ0OFErL3dTeHpy?=
 =?utf-8?B?YVd5S1QyZVphOEFNU1lNamk5TjJyV3c0aFZxRHN2bGI1cmU1RndVUDNOekNv?=
 =?utf-8?B?enFIa1V3VzBsck1BTThWSE42YlNNZ2JRTGFXSHZ1bHZyRktiRmNNa0VmVk9N?=
 =?utf-8?B?VDR0ZG1qZ3hiS1lSOUFhaGR0WE9UcGozcUdPTW5mWjZnUmNnWUg3QUhLV3Yr?=
 =?utf-8?B?bmJ1TzZRWXlISXNkekZMR0hlaUdTSGtZcVlSZ2F5Z1lrV0c0TktDZzk5MFA4?=
 =?utf-8?Q?j+tBhpbpi6rsCxEzvmvs7LMxQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd533b75-0c4d-4983-e759-08de3142b284
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 01:32:46.7895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lyi4M3bkI/Px4GN4oEsfg4HUydbyk2E6iudhIlgMMqhuFX3aPpfg/hmR+L/IiV2Gb6TUMhKMGfT7VRlqAK/o0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFDE2ACDA69
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

On 29/11/25 03:07, Mika Penttilä wrote:
> Hi Jordan!
> 
> On 11/28/25 06:41, Jordan Niethe wrote:
> 
>> Today, when creating these device private struct pages, the first step
>> is to use request_free_mem_region() to get a range of physical address
>> space large enough to represent the devices memory. This allocated
>> physical address range is then remapped as device private memory using
>> memremap_pages.
>>
> I just did a quick read thru, and liked how it turned out to be, nice work!
> 
> --Mika

Thanks Mika.

Jordan.

> 
> 

