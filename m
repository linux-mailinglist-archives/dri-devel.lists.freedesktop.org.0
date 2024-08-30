Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB3B965C0B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A051010E8DC;
	Fri, 30 Aug 2024 08:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JQ47eqoU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47C210E8AA
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 08:47:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVLc+EaSOYt25sIstwl/pcr+rtoJukvPyR3oSAoJD704FFzpfgbI6BMUMVNMd0ngNZIrWQBkMvpSZBtXuWfdhPwbg2alfsX3RYMIy+KYsmEnkIOIfUd0jG3FIMdauazKFoBComfItLNGUCgFJcaDQkLNXnVlcLQHyvDBemlmck4FECmJZS8OR/7mEEDQI0hbmBAfGISESWvlYRC9AFXNUEmsX8zB2tCyBNoNy8Fvf0dwCdLV2rXDxWFdrIWV3cg2Mi4IO40aIo6FTPV1iWlW6eYa1sY0dbW/rIDbvrppnePotEsRhjmcYwXSzsLNTJsaL8XP//LiEb4xOplv88267g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxNoJiwrPFBjmNnH6we5vltCbw7Lkg1og1x/2okJqv4=;
 b=sIcIeQ7H535idrQeVSWxu/znR1I+XdmedcUZo2X+myX4Oj4RrVdcuiw9GmxCR8xyCJTtB4xCoz367g4n3mm/Zim9i/LufGWZ47rEobJtQiDanvHZChme2yL3HCNQuQliAOfs8qIDq1QfJC4pBxU7SZH6S3U4TMX0uM4SW8OKOdBzGdqM6g4gsryPLEE91vbLLunISyhCpGZiHgax5Vnw0V0bH6umG0dHHT0jNLVSVuiy+CRxqMjysVdZ1Lkc5y1mt8/QgWZs4Gl8I9v+WWJN7+BzlI/H7DFd3vAobMnJktI69aVjf/HDeUUcYRAjQiwZuYK7rwaTdU1sCf0e80uKcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxNoJiwrPFBjmNnH6we5vltCbw7Lkg1og1x/2okJqv4=;
 b=JQ47eqoUo/vbK2sUYhpDtEg1K17rI9AmaHqobyYo4lqg1Frq59YWLQpvLQqMTBm3VPD6H8h7Xdqj/bFNETlDo167BR9S90ThKsFy6cVv4TIA/242/c1Pzml5IDOP8E5E2gCHcdMQCYejyHPgJJr65geuAHbFdAi8b6wxCoPLu5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6002.namprd12.prod.outlook.com (2603:10b6:208:37e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Fri, 30 Aug
 2024 08:47:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 08:47:05 +0000
Message-ID: <4a498990-2d9e-4555-85f3-d1d22e26b9dd@amd.com>
Date: Fri, 30 Aug 2024 10:46:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] dma-buf: heaps: restricted_heap: add no_map
 attribute
To: Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>, Sumit Garg
 <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-2-jens.wiklander@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240830070351.2855919-2-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: 52d67aa5-1c57-4e75-648a-08dcc8d05310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVhmSUJRcWxpZk91UDhQa2duV2EvY01EYkk1YzZXSVo1a0J2M2ZCUmF3QzAz?=
 =?utf-8?B?T0RYT2JrQWRjLzRmZitHeS95UlVhNXBSaVFHL082L2Y1VzI5VUlZeEUvN2pk?=
 =?utf-8?B?YzAyL3Ntanlwd0JSQUhqdXl0R1ZpNy9KNDh3VDJvTUJSeDBBdmY0Sng0SjZ0?=
 =?utf-8?B?Z0lSaGVCY0ZGd3RLYW9ScjBjNlFWcC9Gczc2dGVrcStyQkszbzJSTkYwQ1Y3?=
 =?utf-8?B?d1pnRFVaQTJDamtHS3h0UGdpOGs1Zlc0SjB0eFRET1hGRVBFK2Y3TWwyUVhw?=
 =?utf-8?B?azQvcUxRNGFUMGxmWktpMitwWkVSN2dOTzdUb2wvQWpxM3ZoSzVnUXplZ2k4?=
 =?utf-8?B?a2o5bmpQWFY2Si90b3VpZE04SGtIaXRNb3Z1eUhkb3duU3lxK3ZSQ0g5MEx5?=
 =?utf-8?B?OGtJYnhjYWwzd1psZjY3bUcybm4xRWIxbUp3SzU0KzhsNFlMOThZRmlZeldC?=
 =?utf-8?B?MUQzb0l6RTV1OGVTZzFtOHhVd2VqbDI1Q3Q1VU5FZVRtdm9yaS9WYWdvZENt?=
 =?utf-8?B?eXFxV1dNNGFXL0FrVnI0bXhyRURsZ2dkNXhRelNNMTBDZy8yVGdWSUlNT0cr?=
 =?utf-8?B?KytXcnVwbzl2NkZwNlRJenk2cFp1eENBczNiUjhETmJrWVlLQ3haVHBUVk5a?=
 =?utf-8?B?MkdWT0k2QmFtSTMrQ28xRUl5U1NmU1M1WTY5SjNGeUU5SVJIa001Y1BoL1I2?=
 =?utf-8?B?TngxYnZ6bE1taTVVMkFzK05RN0NoT0RKa1Qrbk5ZdjRESVVUdFZCL1NIVDNw?=
 =?utf-8?B?aGZjTUJ0VmZQRFdWQmhqa0pQNHlEN0c3bzhjZHhLbjYvd1g3RndnZXRvaGlU?=
 =?utf-8?B?cllCU1hldlV0QlN1bVYyR0JYQlJWTklGOFcwS2xiN1F3SzQ0VHp5OVFuMkF4?=
 =?utf-8?B?cFNveUYrRVQvUG8veU4rTTNKVXJVYmtOcVI0eW5EYWVxaUt0TUNVbVZZaDk0?=
 =?utf-8?B?Q29FTVhlanNCMUx1WmtML2ZWUXdKNEIyZE5zT2hmUGNvdEtjaU5nZTFYbk1h?=
 =?utf-8?B?M2RVN2pya0N3cy84WXNIQ0JmM1pyZlFGdUVXTkx6MEJZb1ozL1ZaTmp2eFRS?=
 =?utf-8?B?U2QxTTZybUJrWWl5cXptQ2U0UXoycStyL1FVOTRNT1FKbVZDdlZHZGFBNVBy?=
 =?utf-8?B?aktjZy9RaFhndWgxeUFyVURHUDBrU1YrbE9VMkpkMjc5ZlI2Ynp6OVRNTmNt?=
 =?utf-8?B?MGxWa05KeWc2RUNoM0FIay9lc1kzNW1Sdk5YMEIwN3lDcUx4ZDUycHFmcFpN?=
 =?utf-8?B?V3FybDNCRVhPdzBBM1ZieVprT01FYTFEQVRYeUVzbExjWlBiNWdadkRraGty?=
 =?utf-8?B?R0ZPNGRNWUk2bUJJcG5ya1VMQkpXaTFzT1ZWZTRJOTZpMEtKZ3lXMjZSb0hM?=
 =?utf-8?B?cUhxdGFhKzFzOHFNVmZTUzJYem1GOFJFMnRGM0lRam01U1czbURDSEVudVhw?=
 =?utf-8?B?UndXSWk4Sm9LT3F3VFBXMk1LQkRYRUNKVnpYSkZ6OWhWRVZpL2ZEVmlsUndo?=
 =?utf-8?B?NDZvcWQ0YXhiMk0zcTl4MVJiK1Y4MWZUam51eEp0eXRPT2EzdFByRlBDOWhY?=
 =?utf-8?B?QWdEcjRHY1JxaDM5SHlUdFdyUUU3aXRxYnNZcWRUOTlHZWlWMVgycWI0QnAv?=
 =?utf-8?B?eWdpaW43ZUwwWmJLR2xiK0UydG9LSU5ITzd3SENaY0xQbytEK2VhakZYcDhr?=
 =?utf-8?B?ZUh0U01yNUFkZTFocUE2MDdQTjZIclozS2NuOXA5Um1TQW85bmVJY25oSjMz?=
 =?utf-8?B?VDFxQzZqSTgwTWJZOGRGV09EOTY2UVhlRGgwdTBKMXIwUWVETFNlOXNoRk12?=
 =?utf-8?B?ejR4U3VTU0NheWFpemRiQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGJLSkhXdFI0SEhqNkdaeEZ2K2xXN3lMVEpWT0d4NGpNcFVmV3puZXZyZE1s?=
 =?utf-8?B?NXBoVFc2ZmNMTFlEaWxFSm5EVXJFYms1UnV5MW1CeUVjaXYxajBEWlJBY0dq?=
 =?utf-8?B?Y2FqVzhDVFpsaVFsNEVWa0lNRnVVb29jMzFVcFgwZFQrZStNRkxGanR2WHpU?=
 =?utf-8?B?ellvMWltWnZWU3U2MEtoTlYvaWRhUmxXYnZTTm53ZzBSVVU1VURPQ1htUktC?=
 =?utf-8?B?WXYrYzBoYTR4MFBXVkNDT3dhNWFmUGdmdFNxYjhMSUdaLzhmclhxWXZjMzJR?=
 =?utf-8?B?ZVRwemJiZkF0ZklRL1pQblJKZ3MySlhFd2pmMC93MFYwTTErcm9CdkNJZGJ5?=
 =?utf-8?B?NGZ6dEpxamp0d0Zta0dOc3A1UzYwTCtGVEFIRlRWeXlWa1pqS3ZxRXlzTlZX?=
 =?utf-8?B?L0JlekZLK3NCQ2Y0S3NOYUYrT0tkcTBqcGpXZ3JXZTYwOENBY09JeFVnVFha?=
 =?utf-8?B?Y2R5dnU0akYwZFZ6a2w1Z1J2K0pFYWZmalYrWUltWDFwdDJSMkc4VHdtSDNI?=
 =?utf-8?B?dDBjRlZuVGp5aEUwTVVMeUYrZVVrRXhCVjU0MkNQZ0xSQ1hLQ1AxeXNUU1Rl?=
 =?utf-8?B?akhHdjVpREJzY0h0OWpjTytPSlBuaDNrVnoyNGRFaXdCSjlIdlZGOCtNRmRW?=
 =?utf-8?B?Tk42bzVjT0VUd3JRMzhjQXhYS3NWa09rYThYbVZ4Mk9jaUdVZ3NEZCtDMUF3?=
 =?utf-8?B?TThpNGNBN09qdWs1SFBGSDRNUjJqOUNSOW00MGk4WEpUSTVsS2hnVkNVZzRn?=
 =?utf-8?B?bTNDOW9jMFhvY3gxeSsvN1RhL0NBOEtxZTM1MjduN3FwRWdTU0JpQjJickxp?=
 =?utf-8?B?eTdTZWtaNVRDeDRxTE9jdUN6clhIeWdSQlg5VmNhV3NCSDNvY1ZWcU5YbEs0?=
 =?utf-8?B?bzVVS3N3T2syY0FPd1YwQkpTYjRZWkxCRm00V3J6cTRmeXExempqQTA4cS9I?=
 =?utf-8?B?Y3Arall4WVYrb1c3NytUSS9kZmZqUDBkNFgrVXBGVHJET3hWN3VlakpYL09Z?=
 =?utf-8?B?dHRNVkZYdGZhcFBXdzY2Ty94SUNOYllWRldQOVU3WDM3Qzkrb2VNYnRPazdZ?=
 =?utf-8?B?MU5OSXdUMUVPSTdIWnBWb0V1ZHFzMTdObkhkcWozR09mR2s0TnBsd2Flcllu?=
 =?utf-8?B?eGFBWURZOWN5QjlsV2tnNlhXMzdGbC96eG04WTNqeXhXWC9HZ0lJSzRyQVo5?=
 =?utf-8?B?Q3ZZUm1DZHdaMXZFZHc1MU1NeUR3bkZTcnRpOHJmMHlaZDVQRTFIb2dRM2tw?=
 =?utf-8?B?RGozVlFWOVl1YUNFQityVW8xc0dQaFVZQm5mK255VG9yTXV6Y0UvUU91dXd6?=
 =?utf-8?B?SnAwejdJaUdsQ1hKdDBMU0lUTkw4bGhic2l6UU0xOVFZVEM5aFFhVzhGUUNN?=
 =?utf-8?B?blVvRnIyb21HNm1KTXp3NGYxZEhQTnpJRmpiYjVSTEJRRkIydGVOWjFvWXV4?=
 =?utf-8?B?aEU0WHBhNG11UDEva20vYmcyRGppdFhGbkpISXhQVVpLNmxjTXFlVWs5ci83?=
 =?utf-8?B?aWtuTE5pM01XN2JpdkJpaWtwNE12VjR0Vjh6a1BMcFU4QTJDb3ZmdllnZlor?=
 =?utf-8?B?VVBRNU9UYk9WL2VqUHlIeit3UEdSWGcwZjI4a2JNd2VOdWRHMTJKWHRCWVJS?=
 =?utf-8?B?V0tKM0FFRGlWcGZCT1BZeVFhTkxOZWtuRi9oWlhzMG1JaGNaTk1LNkFnNDNs?=
 =?utf-8?B?TFhtTWgxMkJqZ3pZSS9QVThmSzhGYWhmNjZaUUNuQ2h1aG1DaGlnZFNzSm40?=
 =?utf-8?B?cHBZRWRaWHBwb0VsMEhSd1lYZUlaY3lCREFHRituRi9wdUxTVWpOR3h6MDVi?=
 =?utf-8?B?eFd6MWt4MWJQWSswUm9PMzY3YXdGUHZYWTNkWHN5ZkFiMEdMU2Y1NGJlVXdM?=
 =?utf-8?B?L0lsWFpkTEROSGN1cXJmK3FNU3BSZWpkR043QytGeE0wMHZteDFFbDFZbUdQ?=
 =?utf-8?B?VWN3RXg3blhrUWhobW1FMCt3bWdkWWJKeG5VVnUycVdMZ0xxQUJTelBCbGtt?=
 =?utf-8?B?MmF1YWh2MWxWZ3R0ZmFCUDQyckJkUkc4Wk8vNXFsdjlwdUZYU2c3K0NhaDFs?=
 =?utf-8?B?Q2xmUTFVNU5Fd0FFbVB1N2EyaDhGNUJDcGVWR21WSlBXK1ZuYnJUTnpmN2FU?=
 =?utf-8?Q?3hmxXg7zjL7BOn3BXlhoNxuOd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d67aa5-1c57-4e75-648a-08dcc8d05310
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 08:47:05.3296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x41DR3UQ1E2B+XduNb3t/BCzYnp6SijkHzqVzE+RBxRdeTLH+aGDpBj2ujhzCbPd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6002
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

Am 30.08.24 um 09:03 schrieb Jens Wiklander:
> Add a no_map attribute to struct restricted_heap_attachment and struct
> restricted_heap to skip the call to dma_map_sgtable() if set. This
> avoids trying to map a dma-buf that doens't refer to memory accessible
> by the kernel.

You seem to have a misunderstanding here dma_map_sgtable() is called to 
map a table into IOMMU and not any kernel address space.

So please explain why you need that?

Regards,
Christian.

>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>   drivers/dma-buf/heaps/restricted_heap.c | 17 +++++++++++++----
>   drivers/dma-buf/heaps/restricted_heap.h |  2 ++
>   2 files changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/heaps/restricted_heap.c
> index 8bc8a5e3f969..4bf28e3727ca 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.c
> +++ b/drivers/dma-buf/heaps/restricted_heap.c
> @@ -16,6 +16,7 @@
>   struct restricted_heap_attachment {
>   	struct sg_table			*table;
>   	struct device			*dev;
> +	bool no_map;
>   };
>   
>   static int
> @@ -54,6 +55,8 @@ restricted_heap_memory_free(struct restricted_heap *rheap, struct restricted_buf
>   static int restricted_heap_attach(struct dma_buf *dmabuf, struct dma_buf_attachment *attachment)
>   {
>   	struct restricted_buffer *restricted_buf = dmabuf->priv;
> +	struct dma_heap *heap = restricted_buf->heap;
> +	struct restricted_heap *rheap = dma_heap_get_drvdata(heap);
>   	struct restricted_heap_attachment *a;
>   	struct sg_table *table;
>   
> @@ -70,6 +73,7 @@ static int restricted_heap_attach(struct dma_buf *dmabuf, struct dma_buf_attachm
>   	sg_dma_mark_restricted(table->sgl);
>   	a->table = table;
>   	a->dev = attachment->dev;
> +	a->no_map = rheap->no_map;
>   	attachment->priv = a;
>   
>   	return 0;
> @@ -92,9 +96,12 @@ restricted_heap_map_dma_buf(struct dma_buf_attachment *attachment,
>   	struct sg_table *table = a->table;
>   	int ret;
>   
> -	ret = dma_map_sgtable(attachment->dev, table, direction, DMA_ATTR_SKIP_CPU_SYNC);
> -	if (ret)
> -		return ERR_PTR(ret);
> +	if (!a->no_map) {
> +		ret = dma_map_sgtable(attachment->dev, table, direction,
> +				      DMA_ATTR_SKIP_CPU_SYNC);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}
>   	return table;
>   }
>   
> @@ -106,7 +113,9 @@ restricted_heap_unmap_dma_buf(struct dma_buf_attachment *attachment, struct sg_t
>   
>   	WARN_ON(a->table != table);
>   
> -	dma_unmap_sgtable(attachment->dev, table, direction, DMA_ATTR_SKIP_CPU_SYNC);
> +	if (!a->no_map)
> +		dma_unmap_sgtable(attachment->dev, table, direction,
> +				  DMA_ATTR_SKIP_CPU_SYNC);
>   }
>   
>   static int
> diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/heaps/restricted_heap.h
> index 7dec4b8a471b..94cc0842f70d 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.h
> +++ b/drivers/dma-buf/heaps/restricted_heap.h
> @@ -27,6 +27,8 @@ struct restricted_heap {
>   	unsigned long		cma_paddr;
>   	unsigned long		cma_size;
>   
> +	bool			no_map;
> +
>   	void			*priv_data;
>   };
>   

