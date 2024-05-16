Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9854A8C729E
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 10:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DB010E4AF;
	Thu, 16 May 2024 08:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Dvn7rcxv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDFD10E4AF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 08:17:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbKZCcrlL5R4rcYy0gVVZPIHBVFWhhm/HqsbgrrgEO13i2dPn0ZOtShGm2aG+KLjX4n0CCOuhGYT6mOgEKH0v0NKvKbpQxvqi+nYEw3VUUjvVZekoH6zxzA50dyvonuJFT+LbBdtKGgs2DDJM6Vh6VkYCRTX9y6JRS8TKAQnL7eLSs8JrDoRAy5ATAAepFJ0wzyi9Uizw8PEh/fvsqatw6FBbn8E4ThtS0bhOn/pDrtiRCPcuT9bDR7DxmPPrr54UrFr81m5It5YKlelgxuHAkjxv9IQCeZPuZIWZPm42LiNCAQRi9PoIvxi+X/SGvqUj3FUfHXpd2iyZs+dSrv98Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+azLIRRDgAuQHkgqIunPWdxDv5P7+tRkVYiQ1DJ4UM=;
 b=KQRpWF6gJ1wmAbYn012Ldp8iTz6KVUjQLte7ugL0f1ph6XCDg6Rt2Jc+1TST6XqEpFzNMlGdaAyddQurNlPV5QYapEEEZkdZzlQKJzRA/yRzSutM+g5ajMN1UfC8znZcaiSmArDWqQeTeELSeRd+egSR12hxG80RuaPSCMALypnRwA88L+rYdlgPgl+PFl10yug6zqryJ/IV4d+fM9H9hb3MwS8t4HnZoOEXHTgzF/ddRb/99xQ2nmZl7DnGOM3iAYmv3mx0vQ4F7U4syBUt1+qQliLxZIEnr8hTbevUAdncRThbA6YmIG39Wy+gYSWQBXmx/WwRlNlceEJ4gEj6xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+azLIRRDgAuQHkgqIunPWdxDv5P7+tRkVYiQ1DJ4UM=;
 b=Dvn7rcxvIR36UojGAFZ1jo9nCG7cRGzS9JO9paoOH+he4c11U9sGAhXLUeulIzr2bcwrviQI1IokPbGpN6q+aocSe9JFxqKtDEo7q+QSP7Ymquf5033vkB+bijsXnfELIOEutqkskq92o8hQfLJ3nC2HXSP4/vFsuIKtZRfF+jw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6919.namprd12.prod.outlook.com (2603:10b6:806:24e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 08:17:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7587.025; Thu, 16 May 2024
 08:17:23 +0000
Message-ID: <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
Date: Thu, 16 May 2024 10:17:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 tjmercier@google.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>,
 Joakim Bech <joakim.bech@linaro.org>,
 Jeffrey Kardatzke <jkardatzke@google.com>, Pavel Machek <pavel@ucw.cz>,
 Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>,
 willy@infradead.org, Logan Gunthorpe <logang@deltatee.com>,
 Daniel Vetter <daniel@ffwll.ch>, jianjiao.zeng@mediatek.com,
 kuohong.wang@mediatek.com, youlin.pei@mediatek.com
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-3-yong.wu@mediatek.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240515112308.10171-3-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e9e231d-7fe7-4221-66a4-08dc75809d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWl6SVNuR2lDcHpncXBJWW9HV1dQK0U3c3dRbkQ5YTBoV2R5YTB1cDljV21k?=
 =?utf-8?B?V2NQb2RFZ3haUlhoUnpMbDhpTmNIQkJrZDgvT1A0Ry81blNMRWNxT3IvNnI3?=
 =?utf-8?B?ckJITFZYcjlrOUUybnByY09SZDZibmVOL2RyQ1lmcHYvcmlZZXBYcEI5RVpM?=
 =?utf-8?B?ZHJVa25sY083dDZRK2d3QXpYeklLdzFnRnNBU2tuWlhSU1BFSHM4aFR6Z2h6?=
 =?utf-8?B?aG5qYmNXU3JwR0ZmTDM5cCtjM0krTitQVGVTR1FjSEFDUlNtYWgvZlNCWm1M?=
 =?utf-8?B?SkpXYi9zNkhYajR4RnVLbVlBRmhJd2hxOEM3dHJlaTBneGZjNnVXVW9rd1hC?=
 =?utf-8?B?UEFRY0RxRkpLWTVHcng5RjQyQ0hlQ05oaDdQR2NqL25qY2MxcnNtQlFiUk5i?=
 =?utf-8?B?YXgzdmhJTlVEVVI2aVE3dC9rVHY1dm9PQU9NcDU3aUdRMnQra1gvY2hMcmhT?=
 =?utf-8?B?Z05Uc2FGTGxpdTZQWmhQNmlOMVc1M2tHeUVBNjNTeUlrQVlLWjh4YzJIOVlw?=
 =?utf-8?B?Q0hHdHRLTlMyMEU5bXNIWW1KTXk3RjZITnlwbXZQNHNRQ0JkLzVxRFRzeExp?=
 =?utf-8?B?YTZleERQU2R1SE9tQmdHWFhXdU5xSkRHSnFqVUZOcm1MV3NVYVdoZjZSTGpE?=
 =?utf-8?B?eWllcDRYbWkydTZoeWxteWY3ZTY0RXF6bWt5L2JQcGxKR3Q1WldyVTB4SEor?=
 =?utf-8?B?V213OHIzemhlL3ZRYk1OZW9wTTEzaUNnalFPVjJOcHMzVWF2dnMzL3lUeHNP?=
 =?utf-8?B?dmY1Zk1pODVhQTAxR3FjaThpRXQ3UkFPTkRPRFlMdVB5U2p6aE8wSjdvZVp6?=
 =?utf-8?B?SUZDR0JGTnhQZDc4enl0c1VTYU8xaE52MGt0V2NBTDZYaUg4MWlUcm4wd2Jr?=
 =?utf-8?B?TDJjQmtHR2ZrTVAxcmVoS0Q1M0U3OHMvUHlTUzhRYnJmNXFlR0V3dTMxZTJq?=
 =?utf-8?B?MjNHME82emVrODVhbjJzNTFLSERqcGhrb2RLWUVnWkhZVE1SVmtYNEp3b0NO?=
 =?utf-8?B?ckpyZnQ1UktqNlJ4MjBzd2xIUTR1NnFBbmN5bzJRSmNYTUpqOWVIK25oQjF0?=
 =?utf-8?B?emZuMnlEV21GbGptQ2RUUUxWWXAwVjJ6NDZiSHlDWFQ2UUkrNlEyQVRJUEN3?=
 =?utf-8?B?dU1HbjBrWkpaNnpzQkhDMHkzTE1XSmdka21NMVFtS09EZ2xnN2wxM2IwQ3ZZ?=
 =?utf-8?B?OHlIU0RTc2ZKUGZCSzg1R3UwWTQ4UFM3UWRwb3RmRzZjdE5NSGhJSlpSU0xB?=
 =?utf-8?B?RmJlZ3MvZDZ5Yk16aytrRlIvRDBhOFRJQTFZenNjRkl3U3hvUFliaWpzVEVJ?=
 =?utf-8?B?RDdkNTBwd3dobGdJNk5ZVUl1c2tGYWJqQzFPUUgwdnk1UUJHSlhtdys1RFIv?=
 =?utf-8?B?ektpNkl0a0NFYnNPZVk3WlVCN2loTm1Za255aUlXajltMW1oZFRDc0NucEpi?=
 =?utf-8?B?Z1ZGVXFDTUIyeWJKZjl3NmUxWHVGd0FlcEF3WXpTMXFNalhTSTk0YlRhQmNU?=
 =?utf-8?B?dFpiSjBSZjlkTFRFVTZXS0xnbU0rOE0rOENXcW1NUkxheEY4SDZWdFM0VE4v?=
 =?utf-8?B?YWNwQ3BnVzMyN3dXUDhsTmQza1NiQ0MyV2F0bGk4VmVRQ053UXZZQ0xBTjlq?=
 =?utf-8?B?UkR1T3I2R1Q4TjBNc1FOUVNnSkNWaEErYlZqcC91eXNPT0JEQWZUMG9zSzZK?=
 =?utf-8?B?Sjk3NW9jdHlKclg5OWxuUUl0d3BsenJlYnNUYXI5TTl6UFYwakh6USt3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3lPekRCYmwvWm4yVno3U0hKQ1pGNFlMRk4vV0N2MDQ4dXlTd1d2L1JiT25o?=
 =?utf-8?B?YmF4akF5SS92eTdzUVdKRThFcjM3NlpjL1lod2xPQkNDQldIUnVKZzNKYWJm?=
 =?utf-8?B?emJ4dEpnNTNVbSt2aWJiQit1NHpzUFJ4NS9MOW5qbUNNZ3gyeWdyTWQ2OWxE?=
 =?utf-8?B?K29SR1pscVlDWTUwNkdhZThMZDFZbFNEQ2FMN2tvUitZTjcrdVhoQzdNelJp?=
 =?utf-8?B?bzV4Z2hMMTVxRnJSelZvaHdVVUxVaHpjclIra0h4ekxjWCtzS1dGTWVaSEI3?=
 =?utf-8?B?SmNGeTJhSEhucDJIYjBSRFNvVi9OVGhiVjBlTHVFeVBMd2cyWFExTTZlQkQ1?=
 =?utf-8?B?SHNIZ3BFZWhuOWo1V0Z5K3dFRVZpWU5mMU1ueXA2ZkJUelRQczM3amFSMGpk?=
 =?utf-8?B?aG0zWTd3bys3S1ZBVy9NY241STZENVByY1ZZT2Nkb2FQUjJHQ1pqZ0Z0TUVQ?=
 =?utf-8?B?N29LZVFTa2xBZkd3dmFoUUwrQUg5YndDOTlxSFl3YWZaYVFkMmltTnJmVTBL?=
 =?utf-8?B?MklFdThaeWoxcDNTeEdSang4bHhpa2dHRFFwSlU2UHlNT1BlTkY1ZzRRMDNs?=
 =?utf-8?B?bVdTRGJkSlM4bHNrTWJtbklzZEIyQXdBRGNseEwxTUZsYWRBSFBIY2FxbFFH?=
 =?utf-8?B?alFra1NtMXpiaEEvZEFERCt1a2dlNUZwVi9HZisyTDBHZWo3bHlkTlpmWnFE?=
 =?utf-8?B?T09rU0JOUG1pUDZDUzZKRHFQVXB1UCtZZTVmbENGNllvYWN0TGtCVEFNVHgz?=
 =?utf-8?B?ZlQyQldlYkVxYlg0a3p2VnFhRk1admI5YWZyVnE2VkhoZENxNmo3N2RtaW1X?=
 =?utf-8?B?blR0SmdaSC9sbUlrYnBjV1Bxc2lCWE5FblNSZ2xhcnN0N3o0UmJjSTdRMWtn?=
 =?utf-8?B?eElBNGtBRWQ1cUdlaUk0cWxEdkdPZnBkQjlKSnhacHlNVWVKNFlhNExSZDUz?=
 =?utf-8?B?QUQxVVF6UVZOY1FqU0RvZGh1aHhzOVZvY3BCc1A1NSttaFI3bVNscVNtd0hB?=
 =?utf-8?B?Y1dla2crV2dPT3o0TFVLdDRMcUVNR2g3Z2taV0tyaStkVVZlV29GNzVlQzk2?=
 =?utf-8?B?VVJ5akRlUXkvajNaV3dUYWVqQ05GSnd6TUIrajdlQWpiYlp0eVZsUVlCQzdu?=
 =?utf-8?B?ZStNb1N3Y3NLOSswaUprdWV2cndzclRYNitXYTdYL3BUNkpLZEZZQTB0bEhz?=
 =?utf-8?B?SDlWZGFjdGVsek9hQ3Y5M0RrOHVzcmVhaHB0UlBDZ1NnYXYrVUxnRytXcU12?=
 =?utf-8?B?bFJ6ejhxR2I2bTNkMURxQUtVR3RsSndTcTlhcFhQL1IzVlNHeURNNXQxbzVt?=
 =?utf-8?B?Q1JwSjQwd3czQ1RZN3ZEamdRRldvL2g4VllqVXZTNE9vUmRKMXNqOVRGcnFj?=
 =?utf-8?B?enhTKzcxcFBjV291amg0RXhLWFV6NlFxZ2NiaW5yZmg0a0FwSUI5ZGtkcVMw?=
 =?utf-8?B?a3ZVTnBpMmdqdi9hVE4yR0RHMDRmVFhlQW5nSm0xOHRvOVJyYzgrOEVWVXlq?=
 =?utf-8?B?ZlZxbUtBdERBVHB1TW1TRHRqZDhya3FtVDIwQnNTL0diNUpVdWcrbE5XL29O?=
 =?utf-8?B?OHA2M1VLcEVjMVhYQTMxclVnOG9tdjE3b1pNcXM5RWdtSTJxQ1p2Q2tyS1Rk?=
 =?utf-8?B?NkV3REViUXVyU3hQbWpDRGJYQ2c4RnJjVVNLSWtiTk5IRDlDZDY4ZUxkNnF5?=
 =?utf-8?B?bm00NXFXT1RLVDRVcGZvTE5QSC9LS0FYaUdmVkw5aTU2TXZlcUFoVGppUDdO?=
 =?utf-8?B?Z2RDeXBrR1Fzc2N1SnVwVm00NzRBclJ4a2t0OFdMNFE1QjBHdGRvTHlHUGdt?=
 =?utf-8?B?VmVicEZpTVFXTUdFN01vVU14Qko5b05zdFA2RG1EZkV4bldwOVJWVHJIWldH?=
 =?utf-8?B?cHFQR3VkUzlKVHlaaC9PK3IrWkQ4a09INTlJWlZnc3N4eGlud0pMc0dnaFYw?=
 =?utf-8?B?WCtBQ2dvSlNOK21McVZEb29RRjRDeGVhV1kzWm54NDlZVjB5WCtLK0pMVkxL?=
 =?utf-8?B?bGdZY21jUXprZzNlT2xHZjVicE9lRWhQa1laS3MzSGo5WGZBQU1sS2d5UG9E?=
 =?utf-8?B?TjFneTVZdmNGczBrYW9xTy9ST2Vta2FFaHlTbEZrY0dRYWRQd3RLNnF4Qnpm?=
 =?utf-8?Q?i2y61XutfjVzBrFH7EIbgF2a+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9e231d-7fe7-4221-66a4-08dc75809d15
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 08:17:23.2867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/3J65Vpjj8VR/q3lBtToWEE/e44ViWcRRQm415hEkXgXUyQHRW4Lf24FVTjTjs4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6919
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

Am 15.05.24 um 13:23 schrieb Yong Wu:
> Introduce a FLAG for the restricted memory which means the memory is
> protected by TEE or hypervisor, then it's inaccessiable for kernel.
>
> Currently we don't use sg_dma_unmark_restricted, thus this interface
> has not been added.

Why should that be part of the scatterlist? It doesn't seem to affect 
any of it's functionality.

As far as I can see the scatterlist shouldn't be the transport of this 
kind of information.

Regards,
Christian.

>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   include/linux/scatterlist.h | 34 ++++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
>
> diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
> index 77df3d7b18a6..a6ad9018eca0 100644
> --- a/include/linux/scatterlist.h
> +++ b/include/linux/scatterlist.h
> @@ -282,6 +282,7 @@ static inline void sg_unmark_end(struct scatterlist *sg)
>   
>   #define SG_DMA_BUS_ADDRESS	(1 << 0)
>   #define SG_DMA_SWIOTLB		(1 << 1)
> +#define SG_DMA_RESTRICTED	(2 << 1)
>   
>   /**
>    * sg_dma_is_bus_address - Return whether a given segment was marked
> @@ -352,6 +353,31 @@ static inline void sg_dma_mark_swiotlb(struct scatterlist *sg)
>   	sg->dma_flags |= SG_DMA_SWIOTLB;
>   }
>   
> +/**
> + * sg_dma_mark_restricted - Mark the scatterlist for restricted buffer.
> + * @sg:		SG entry
> + *
> + * Description:
> + *   Marks a a scatterlist for the restricted buffer that may be inaccessiable
> + *   in kernel if it is protected.
> + */
> +static inline void sg_dma_mark_restricted(struct scatterlist *sg)
> +{
> +	sg->dma_flags |= SG_DMA_RESTRICTED;
> +}
> +
> +/**
> + * sg_dma_is_restricted - Return whether the scatterlist was marked as restricted
> + *                        buffer.
> + * @sg:		SG entry
> + *
> + * Description:
> + *   Returns true if the scatterlist was marked as restricted buffer.
> + */
> +static inline bool sg_dma_is_restricted(struct scatterlist *sg)
> +{
> +	return sg->dma_flags & SG_DMA_RESTRICTED;
> +}
>   #else
>   
>   static inline bool sg_dma_is_bus_address(struct scatterlist *sg)
> @@ -372,6 +398,14 @@ static inline void sg_dma_mark_swiotlb(struct scatterlist *sg)
>   {
>   }
>   
> +static inline bool sg_dma_is_restricted(struct scatterlist *sg)
> +{
> +	return false;
> +}
> +
> +static inline void sg_dma_mark_restrited(struct scatterlist *sg)
> +{
> +}
>   #endif	/* CONFIG_NEED_SG_DMA_FLAGS */
>   
>   /**

