Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52394984ADD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 20:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7855810E73C;
	Tue, 24 Sep 2024 18:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mIDEwdM4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC3E10E73C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 18:33:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oj+kkXkSZOXMdZnhj+w9pRUvQm2y+egvUfDJ49A2f5ryreeXtkJsGZMeisaGZ/fYgyirvb37sFofcZ5/WPOUmFW4ZwCfgwWmeGpy9mdfW/VcL34llwvIkZWKThZl1R44ZEaLiTqfE2lvrQUBfueHTKhC8S4Aq0+NS1KDXIGnOlDKnVZneC3N1RdfUJFzwzEOYIMAvL/nua2U+rcEu+RaJ5Onlhh4cq69fuYQmmai24hjDOetZOFodtH+JLrhel1RV/oxFlCXRooa5hPoOLvqax/JeZ8NSttebp3AEjS3VqYmy+7AdH+2ZfDk4JztHV/bPM8+/fzgEqOFcUTt1oGu6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+uDL5FStjJAEE0+NwsiGKN69lVh/jmotVD/9mT7Kx8=;
 b=jtHTJoo3vnGuShhUjEy6Ffle0n2CVJt5AR/ez9ZbbULh9+y9M4BfIBU6N2V4dtkWTOJiz14pkA/J5QZ2QqqZnSCt8wJN5z7AL67yIl12tV1qool3da8EeL16BOOK5YCRGT/qFz/BqP8eftyNFVR5jxOEJmfey2+pD++5M0rE93Fptd+MP7UGllLGVRzq+v5LoHIfgysKFHTK167o3m/InLjIaU3hCKZcPnmOKcClA7ZUH5QE02JyIvSze8Ty23PxoI1bOq/ftnzr2A+SkEqqEVlcpDJmMexDzC4ishsoRUjdWUbpaBy+LTwuaZQzovnqVQ7VTClKlD0lPtD6xorL1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+uDL5FStjJAEE0+NwsiGKN69lVh/jmotVD/9mT7Kx8=;
 b=mIDEwdM4a8mKVa0zQS7ZpWZ9OpiUyqVPBLxznZsZR+OZgdjIce1sAPQDVKD3CxBdSzJnMKuoTV4EawkuWqfG0xaUYoB19OAEIdPWARVLE7PVZaIU0fmE3geJBHR5Yw/eYEoafZQMJREpghUCTOoNp5V0MTSab1DVpb7JqJyLRBfQv01PcwdSiuZ40SFlvOBP+fQdu+p28FyNYQP4eRq9s83ilTxlfnPqHhN7ZRiiGUJCT6Zgn4R2p9O7FS2FAWrA/sDTWir5wCP+n/L0zvrfLD2IZsrELqaXDTFEvJayQu0cqQUvh7k1T7m/L577SIom/txhMagxCIBEAdP3bQCPVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5447.namprd12.prod.outlook.com (2603:10b6:8:36::7) by
 SN7PR12MB7809.namprd12.prod.outlook.com (2603:10b6:806:34e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Tue, 24 Sep
 2024 18:33:06 +0000
Received: from DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b]) by DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b%4]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 18:33:06 +0000
Message-ID: <18b6c018-618d-42e6-81f4-48bfb4eba206@nvidia.com>
Date: Tue, 24 Sep 2024 19:33:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: host1x: Request syncpoint IRQs only during probe
From: Jon Hunter <jonathanh@nvidia.com>
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org
References: <20240531070719.2138-1-cyndis@kapsi.fi>
 <f0720898-aadc-4e98-9369-05ec5821414f@nvidia.com>
Content-Language: en-US
In-Reply-To: <f0720898-aadc-4e98-9369-05ec5821414f@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::31) To DM8PR12MB5447.namprd12.prod.outlook.com
 (2603:10b6:8:36::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5447:EE_|SN7PR12MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: 2742f602-93be-446d-bfbc-08dcdcc75506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHVRRm1JWkVOazBOelluV0Ura1Z3L2lTRDdXNXpqWDJjSVpQVmFLQlV4ZU56?=
 =?utf-8?B?aTllelk2S3U0YUhFRndCcVFma2VheUluWU1GQzFsbVkwSDlsNGhIY0hOWjRO?=
 =?utf-8?B?T203bFhMNk5kb3JHQ3hjZEFONDIyQjVweDNjR1AxNEIzSHduY2IwU0hneFIx?=
 =?utf-8?B?K0NQKzBDZzJmeCtNMGVFRThQQmc3d3ByRm9YTWRRYjJLUU11RVdjRUxialJk?=
 =?utf-8?B?SnRCNHhRRThKS3RQT0xNbHBYaTlHc2Q3RTVoZVFid0NobXAxMHpWVDYyNURt?=
 =?utf-8?B?NDRWZmJiWTRLSUpOMDZ3ajVRMkZKbEpIcHJkaGd4OVJMdUxJZ3lMOFdYM3BE?=
 =?utf-8?B?M2RDdkJBdndTWktlV3VMMGdCOFV6RVpOUVhRTzJMRGJId1lkeWp6djRJOXhR?=
 =?utf-8?B?VXBLY29yNFB2dnZpdWRvMS9FUWhZMzdCNThOWEthSXBwTjdDTmhPUkF6Z1c3?=
 =?utf-8?B?ZzYyNmVJbFBYRjlETkx3T3U5aHJsUG4xbzBrd1Jzc0lGVld6T0lXbldFZGFo?=
 =?utf-8?B?T1kyejFDRkdWYi8xaG5DUFIwOXNlcXVqVmc5UjFUMGNTa3Fuc0k4OG5QMzB1?=
 =?utf-8?B?alFxUmlITVpsaXVJa1hvZXlYQVJGWVAyWDhuWmtybTJwYlNHNkh2bDQ0WUJF?=
 =?utf-8?B?TTZtT2RjanVzSldWTDQvSTJsTm5xcmtTRGRRTVl5a096R2I3QVFVTkNDU2dN?=
 =?utf-8?B?TmFJOEFhbG04M1ZwY3hYa3JYR3h6NVNoQWhVODUwRUYvUTBnZ25UbFlCL2Jx?=
 =?utf-8?B?cTR5eWlBeFNRQklkdHFNWkEwY2ZhQVdLQWFSbXJsMnhDZUNSU3BqUVJHY3ZC?=
 =?utf-8?B?NXlOUXVUR3FBVWpKZUltdm1ZMEdzYTE1U1lkWHhXTGZTM1FzdG9LT1UyUHpk?=
 =?utf-8?B?OEdjTWdRWFd0OGtPSVljMVgxbFd2RHlNejVUNEpaRU43TVhKOEUwRmx1UVdC?=
 =?utf-8?B?L2VxY2hCdkdETUxRNllVYWtXUEMwbUZZZ3Ezd01aWGhJeTlLNmtqTzZaL2tY?=
 =?utf-8?B?VmU4bUhyeXZuZW9BSE5FdzVXNXo2bkFQb29keHhJd1RCMTdzUmV4MDJIdEFO?=
 =?utf-8?B?MGRlNDU2bWlTWkFuQWxxZFVsbjZrNThCSVV6bnJSZVBJN3dnZGZXazQxcXBW?=
 =?utf-8?B?Qkk3SityWDZCQ25SK0k2akNWS1FURXkwSTJ0SElEbjdnTUsyeDNHaUFnY09G?=
 =?utf-8?B?c0ZtcWxOWElweWhlNytybVVaRzRwZ0tHTEc2NlJxbkNsTmdCT1pyNmtWUk1Q?=
 =?utf-8?B?S21ZMndJWXRwZEhZYlFNWWlyZXVxenU5ODMxMGY1aytLaXV2bjRGNkRmdUtH?=
 =?utf-8?B?N29wZ1lxTVBlazZJZmRnMWtFeFIzS0p0cmgrMXRGcFUxTUF1dU9oUElhZ2Fv?=
 =?utf-8?B?blZaMzZGUXEwZjFPeEQwbkVHWlhzR1pCZGloVEJsaG5JMmpUTzBqa1huNTYx?=
 =?utf-8?B?eHZlUkk4a3VkdjNoYSt6V0dZMWJLdS8zY2doVWRHQ0dlT0IweG9qUlVSR2Er?=
 =?utf-8?B?SkUxZFZzQTZiOVZ5ekJWNTFvU1JuWHBhVzd1ZkZwcUQ0b0VxVUJzSmM4d2F6?=
 =?utf-8?B?ZzBnS1MrRTYzQko3YmdVYTZxN0pJQVBsSlZESGF0RisxaGtBelNGMmlsZ2I1?=
 =?utf-8?B?VjFuTnE3RHUvamFSU3o5RUQreWVLMUJMNzNzWTRjNUl4OGc2TWNCb0ptRFpX?=
 =?utf-8?B?ajIwQkExMFduS01WbmR2ekNDZWdWK2RpdzUwbTlwMUtnNE1Mb2UzaXFydzlY?=
 =?utf-8?B?SXF3bCt6WGI4Q2IrMmdDUFdNbE9zWWJwRnlCUUdEY3ZSTDRsZThiMXlUdVo0?=
 =?utf-8?B?cnZGeStmSHg1U0hvd000UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5447.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VytHV2pJZForNDZZWGJzUWIvODFUeGFvQWcweksyTkNNT1k4d3pvMVJnZlNE?=
 =?utf-8?B?Zk13UThzODhPTWdjWU93Q3FCOExDdVV3TFdxbGhrK25uWEJuUENaZGdUUHgw?=
 =?utf-8?B?QmpEK21TWWZsNEI0S1FreGZHUmkyK1NuTnVkc0JFUjVDZ3Fmb1h0KzBjMVZZ?=
 =?utf-8?B?WnYxVmwyeFVNOXRBRWZmZWFrbkJkM0I5cm9KRlI4V2FoSUthNFI5UExQR21O?=
 =?utf-8?B?WlNXMXJxZWFrUE5RZk9STEtaMHoyRHVhQjhOWkVsVVI5bFlINWVqYTliOFd4?=
 =?utf-8?B?TzM2L1YrcjNPbVJ5amRqZ2U5cnV6U01ROUxQRU5JNXI1ano1S0RvbXJRWFFY?=
 =?utf-8?B?MUtKV2g0RG5MWWJNd2dXRHFqREx1WkdHY3R2M0g0Vm52a25hcjBkMFVwZXhK?=
 =?utf-8?B?Rnk2YXVZcDlYcjRCMUZhbnBvZEVUdkowS0l6ZmtneEZFSFIzVElHdzdqMytq?=
 =?utf-8?B?Q2dsVFhraitjWlF2RzRjenI3WnNienpFRTlZUXZ3L0RMb2pSNE1kWXY0VlVo?=
 =?utf-8?B?QVRaQ1dlRXY3WUhLVGlWRG44dWo3cUdxeU9ndU0wRFhtM2NtNjZSMFZTMEln?=
 =?utf-8?B?UkMvL3RiWGl6cmw2S2w2ck5TUG5LUW1GbVhVakkrbG90cUU1b2gwT1EyTXhM?=
 =?utf-8?B?dlR2Y2ZwR0RHS0RkdDRqeC9IN3Z3NEU4QzkzMU9LeElaUzROcEkxZ2Z5cFkx?=
 =?utf-8?B?R2FITnNLWVZPUDllZUxxVUk4TVBtUnRoUHRzanQxdkhyalNEenUwU2craFFa?=
 =?utf-8?B?S1JlWENFcjJtMFZYZzNSNno4Q3VXeGhrV2VHc3Rxd2JTeEs4bVpRYlUxYXdW?=
 =?utf-8?B?RGdiaFc5eUNoWXRBZWJxcTJSMFQ1R2xucjhoNEgyNlNMa1lmeGNMQ2RxcVc1?=
 =?utf-8?B?bGNHUUU4Ly9ac2o5SExJSERxVGZOaEVJeVhSMktmY2pRWWVOT3FmRnh6aHB4?=
 =?utf-8?B?UU1lZm93R2lqYVlZZkhML01ZNTVlSlBDNmY4WkJSRHdVRUtFTEVDY2V4bmd3?=
 =?utf-8?B?MW1NVi9PaDdYcVN4bGR3U3ZHR0grRytSb3F1NUhBNWxRUnVIcHlTUndoSUFx?=
 =?utf-8?B?M3NpVzFwQTdFcTYwQ2MrWC9YanQyaE5ONXd4byt0dVVpK25hYXFBdTZCQ2RU?=
 =?utf-8?B?QWtZdHMwenRISVdKZHRwSWIveDg1aWU4d1k3akRNeFAwNUZsa1BGbld3S0NH?=
 =?utf-8?B?N0JScFVSYS9OT3BnQlNSYW1oVWZVSUtlSStsMFRvV1lvZGkvVWtVR1krWTNF?=
 =?utf-8?B?cHI1SCsxQ1hoSkZSNG5aZ08xSXdtZEpjYmVYNUVOKzJjTERjLzgyb1VQZG5P?=
 =?utf-8?B?cHovUlM2dGEvRENNdHJBYTBhUU1RbEdNMXQrSXV3YTBCWlRNL2tNeHdNY2xU?=
 =?utf-8?B?TmxQaFlQV25xZ0JjOGNGTlZWZ2NxTTVOWGVyNDgxb0xRKzFQM2VqNDUvNWt2?=
 =?utf-8?B?RkNqaU1uc1JxWnJCaUJsS1hCemIyVThvZGN5bU1aV0EyOEFtMHpJR3R5dWVN?=
 =?utf-8?B?Rm5BNTh4MEpkOUxKNFhleWNabDlxQi9sQWN4ZEtMWnhoY0s2RXpwTisrRWpp?=
 =?utf-8?B?d3RQOXViNEVOM0hLMkdsbXNBY3dXdmo3SFdra0loZVhnaEx4Qm5tdW9OQ0l1?=
 =?utf-8?B?elROREVOUVlldXFXTzFEeUdqOGlsaHhpOEkvamZmdytBczJ0WmpQeGZIeGJa?=
 =?utf-8?B?b2FzbEp3Sk5meHFnQ3YvWTJZN2hpZCswVnVyNExVNFVtcmV2T0NlY0hxTWY1?=
 =?utf-8?B?K3JLR3IxcWpGeUwzUzdoTUhkOWowNno4Ui9raC9CcW5zSHhhUVR1amRlTGlJ?=
 =?utf-8?B?RHRaalhNUDJrd3UxL0w2VWFTd3htYUw5WXBGSG1obGVybWR2NWh5OEg4MmpD?=
 =?utf-8?B?VUw4SDNYTU9xVXdHMmlnaXI4QXRJUERjVGUrK3NSNStGbUg4ZytmN1pwMHEz?=
 =?utf-8?B?aHUwQmw4alZUNGhEYjBwQk8zeXB2ZEZtQnZhRklkMlR4elVvTkZNYkJZY1l6?=
 =?utf-8?B?bWcxWkMzSnR2RERpZ1d1V2NhR0FSU3lGYTZMSWt0V1NMK0hvcDc0dGVjUDlE?=
 =?utf-8?B?czY0VS9UVEhIdmZaQmlGZzRnc0JsZHVadW5jUzlkcCtYT1l5WjJRN1paV2pk?=
 =?utf-8?Q?iFtotb5B7w2S5bk3hDXd3pC+a?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2742f602-93be-446d-bfbc-08dcdcc75506
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5447.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 18:33:06.3996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYzDoDDuWXbSTHTWYIS7d/KMiKlNsu0OxZvd6n2nIZZPnfrGB/SGLjyEyEowHTlYNshnpsiUd2CbdS6Nc1OxQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7809
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


On 06/09/2024 09:38, Jon Hunter wrote:
> Hi Mikko,
> 
> On 31/05/2024 08:07, Mikko Perttunen wrote:
>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>
>> Syncpoint IRQs are currently requested in a code path that runs
>> during resume. Due to this, we get multiple overlapping registered
>> interrupt handlers as host1x is suspended and resumed.
>>
>> Rearrange interrupt code to only request IRQs during initialization.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>

...

> This change is causing a boot regression on Tegra186 with the latest 
> -next. I have reverted this to confirm that this fixes the problem. I 
> don't see any crash log but the board appears to just hang.


I had a look at this and I was able to fix this by moving where
we initialise the interrupts to after the PM runtime enable ...

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index b62e4f0e8130..ff98d4903cac 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -625,12 +625,6 @@ static int host1x_probe(struct platform_device *pdev)
                 goto free_contexts;
         }
  
-       err = host1x_intr_init(host);
-       if (err) {
-               dev_err(&pdev->dev, "failed to initialize interrupts\n");
-               goto deinit_syncpt;
-       }
-
         pm_runtime_enable(&pdev->dev);
  
         err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
@@ -642,6 +636,12 @@ static int host1x_probe(struct platform_device *pdev)
         if (err)
                 goto pm_disable;
  
+       err = host1x_intr_init(host);
+       if (err) {
+               dev_err(&pdev->dev, "failed to initialize interrupts\n");
+               goto pm_put;
+       }
+
         host1x_debug_init(host);
  
         err = host1x_register(host);
@@ -658,14 +658,11 @@ static int host1x_probe(struct platform_device *pdev)
         host1x_unregister(host);
  deinit_debugfs:
         host1x_debug_deinit(host);
-
+       host1x_intr_deinit(host);
+pm_put:
         pm_runtime_put_sync_suspend(&pdev->dev);
  pm_disable:
         pm_runtime_disable(&pdev->dev);
-
-       host1x_intr_deinit(host);
-deinit_syncpt:
-       host1x_syncpt_deinit(host);
  free_contexts:
         host1x_memory_context_list_free(&host->context_list);
  free_channels:


Thierry, do you want to me to send a fix for the above or do you
want to squash with the original (assuming that OK with Mikko)?

Jon

-- 
nvpublic
