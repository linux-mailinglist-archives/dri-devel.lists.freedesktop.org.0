Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEA09C84C5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 09:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D6A10E33C;
	Thu, 14 Nov 2024 08:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Wwz1YrYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4279410E272;
 Thu, 14 Nov 2024 08:21:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ob4JptzwWs9U689hVLF0CrSwpfUpL9PDa84dV8uEbe2ymhYsCwAuTYSr44SZcNsz0A9+MWxumRh1XmpxKGCzzZYBVEwczAbF890/Qxb9PmcwXMkLEipynLzbTQ7g9H8eyyyiOOJbXThytnklh00lSolHeHlfuOpVWhHZ/NSXOBqEaVX9VLboZWiC+yKANOzO3ObpGuAh5L/i81VCMi3wlL5Y5MN19BwidUlJX48JvoEBPE2Ynla5IH1u3Q1OqROEMBthGc9uE4+e+4MWqEhqctIATBRXzrS5LKdnN/WHBkCACNibSoTY0DPNBKVKzeGeTOewe7Vqr/R8MNO5Gt6NBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avgMjeUEItCISHhC+dM6BO8pSs4256jQM018GewKim0=;
 b=qmBTKlGkyQbt+VUibkMOWYIxC9UaO5golapiqtj3/DhKFjeg+hYKDy0r74mbW71nkiGChWI/EwLZnh2JD2h6SaSBlc7fegYXb9bgbSf8NKNzp9KBZH6GTO7dIDavV4kYhoSVKsK1XhoJCi30onlshQ3dqvFQM9av28Uc8Nu7osDi7tWb1x8kow1eaTbAGxGeevz490jigAgBjdYuLn8m1LBJt0NLf9MgKf3ZbCWGTvEX/AAhRZcOn/qWVuJbxjnCc+BCLeskG7LluO6qanSmZX1FrMYzNR2iVKoFLNMqw5XCLsbCkdw7ldTUMnyOU2Xn1zfDOAvUcawa/z9Thwy0pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avgMjeUEItCISHhC+dM6BO8pSs4256jQM018GewKim0=;
 b=Wwz1YrYJLGXrm+s7/rvmIi+zfYOaIrsThBjvoDGiNG3VyYlk7AWSkVgNKrUj+lE/AyQzQD5v4QfP2hXQQIDzFUFWhSPcR93DLvOpsZCmhC/PUlOqs53QZ3bZjYwMN/KOJvfVjldbT2AYOc+GRxVeu86x68ZEtKyUggDyh3G/zZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7)
 by LV3PR12MB9236.namprd12.prod.outlook.com (2603:10b6:408:1a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Thu, 14 Nov
 2024 08:21:03 +0000
Received: from IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::d4cd:4112:1ce8:7f3d]) by IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::d4cd:4112:1ce8:7f3d%5]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 08:21:02 +0000
Message-ID: <c28a7070-b830-4fb1-9071-cce065a30147@amd.com>
Date: Thu, 14 Nov 2024 16:20:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amd/display: Fix null check for
 pipe_ctx->plane_state in dcn20_program_pipe
Content-Language: en-US
To: Zicheng Qu <quzicheng@huawei.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Dillon.Varone@amd.com, Alvin.Lee2@amd.com,
 nicholas.kazlauskas@amd.com, alex.hung@amd.com, aurabindo.pillai@amd.com,
 relja.vojvodic@amd.com, wenjing.liu@amd.com, george.shen@amd.com,
 mwen@igalia.com, yi-lchen@amd.com, martin.leung@amd.com,
 srinivasan.shanmugam@amd.com, stylon.wang@amd.com, jun.lei@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: tanghui20@huawei.com, zhangqiao22@huawei.com, judy.chenhui@huawei.com
References: <20241105140137.2465572-1-quzicheng@huawei.com>
 <20241105140137.2465572-2-quzicheng@huawei.com>
From: "Chung, ChiaHsuan (Tom)" <chiahsuan.chung@amd.com>
In-Reply-To: <20241105140137.2465572-2-quzicheng@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0032.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::20) To IA1PR12MB6604.namprd12.prod.outlook.com
 (2603:10b6:208:3a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6604:EE_|LV3PR12MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c9ef70e-71d2-411a-b85e-08dd048546f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnE5VEo5WnhWM1VwYXVYVjRuZU5JY1YzMzVHOWVIcHVmMWhGN1FMY1dQcjNP?=
 =?utf-8?B?d0VPTlVyd1VtUUwyeXZnemd2N01Tb21BMFA2UUIvUlRNNGV3SHNzZStFT2pB?=
 =?utf-8?B?ZS9nTHZSdS9SY1hWUEE3UFBIM0VtSFlTSCtwL0Nmb3FwR1RhbnIwU1JzSlhZ?=
 =?utf-8?B?Q2FrdjJsV3Y0OVdiYVJ2TGljU2FMaEg1ZlpUYVdJOUlVeVhzUWVCY2YrMEpT?=
 =?utf-8?B?YzdFa0liLzltRGJVblJFbHlGbnVGZTVMTXZHWi9YNzFkR2tvQVNmS2llaWVq?=
 =?utf-8?B?MWJOYVJ0K3hxY21PdElFdGNqZWNLQnhWTDRZb0FUMU1OSW01YjRnYkpNVGhO?=
 =?utf-8?B?R0FCbnBWdHFHNWcyOU9sNEoxNTR1VUFFQWtZSXZ6bno1cjdsQ05Sdy81ZHp3?=
 =?utf-8?B?cGZhaDdLWTIvUjdYVWxGSVZXWklDdVVNeFlpbGhBbGVNbERQdmxiSTI1dE5i?=
 =?utf-8?B?RTVLeit2VGw0dnBBcjZWWXRabE45OVpxbDlFdzhMZWI1SmtsNHZ6S2k1Wk5r?=
 =?utf-8?B?MU5pYlFEb3p5VnR5SUkwcUY0K1I5QVJxVENaaVgwT2F3bzZta1VZMmxtd01s?=
 =?utf-8?B?bnFieFlkVzJNUFVuaHVISzNvSWIzeDhieEFWcGJvaFNWWExUalY5RTFHUHFm?=
 =?utf-8?B?YTRwc1VpRjFJbk1VdnpUeXVKNi9OajdDWmNtcm8yclBhcmRJdUdhMysyUEcw?=
 =?utf-8?B?Y2NUUkNkakIxQmNnRUdNOE5WMERqdUlZUUt1N3ZtSjJUU25Wd0FLTHFaME44?=
 =?utf-8?B?dVBSdy83aXErdTlsOVl5cEFIdlp1NHBmR3IyR0s0Yzk4RG42cEE1WGxTUTl5?=
 =?utf-8?B?RnZOSDB6QUFRY0tadnk2am96TCsvUld2a0M4UFFYelhOYlYxRG1sNjlUUmpI?=
 =?utf-8?B?by8wbnMrb1VXd08rLzBNWmRzeGxoVkQvZXVMek4vbzlEbDlVOGhwdnVsQmdR?=
 =?utf-8?B?aFVPSUlsT3pkZVNSK3RkaFlQbDNmdml5dk5Ha2xTNWowSWRYeXRjR08rbGJh?=
 =?utf-8?B?SFZEQjhqUFRIZWVpTk5sRkRpNStuelR4alMxR20zcG5hamtOd3YvdkxhRTc0?=
 =?utf-8?B?bUYva3NlOG5nQzlCWnIxaG5VMWNiYXNON0VJWWc5d3pJSHk2UDhtbHFGL1NF?=
 =?utf-8?B?UHhnQVRlQ1lNdDlDQTFCM3lreG9GU0RoemJHcUExKzJlQ2Eza2pObmhTbVdk?=
 =?utf-8?B?TnZsQ0xPQlduRXRJYnBtWk0ySmp0amgzZUk2TW1VdnN0dVFoMFhHNkVOQ1lE?=
 =?utf-8?B?bGwrZFdCQitkdGZaWGVta1c5M21hTk5CcC9TVGE5M0RzV215QUsrTm1KUEM0?=
 =?utf-8?B?RTN6ME45ZjJoYlhzS0Z2RVRkZ3FuTHFwVHBvSU1OZ3F5c1R5T2hUUTFwdGZ6?=
 =?utf-8?B?UWFkV2tqbFAzSUxNaG5SVTNVU0hvNWpETzBaZFAzeGNYT2hQM0x5NTZBVU44?=
 =?utf-8?B?QWhrRmxBU3BRc0tFZnZmbFpvQ1FRbUhtSzVWWEp3ZWJFZ05UVy8yTkVPaits?=
 =?utf-8?B?bE53Mkh4VGhXYVFHU1o1R240cVI5R0tzSVVTSVdINktPY1MrNE5vV1h0OW94?=
 =?utf-8?B?YVdLWmNTSVFVNFF6eWRxTXBXYUFnb3hXRXYwbEIyWWFPNk5yOUU2YnJoVmtE?=
 =?utf-8?B?cTY5ZU1JUEliMEJzZHlmdElkZ25teUNyd1BzbHc1UWR2TjIyc21TMGJCV2lq?=
 =?utf-8?B?SVdMeXZFT1lEMis0QlhWWWl4eEhwYkhQcm5xMnVNZVNyV25lL2FNU3RoK1Ju?=
 =?utf-8?B?VnNzdGFaRW1aZkFBdWYzWFQ2aWJqNUhVYUN3cmRFYWloV0FXS2tlUUxhS0JU?=
 =?utf-8?B?S3laRmNuczU5ajdvd3V5UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6604.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXVCaUdIWVNWUzI1Q0FxN3V5VlAvcXpGU0dFNFRIVkVFTXkrTWc5cWdOM1VP?=
 =?utf-8?B?NDFOVzJXVkRmQXZ0OUhqT3pTdE93K2p6SjZtczFnVVJoTm80TmdGdXBraGt2?=
 =?utf-8?B?cnpqaHZRNUEyK0QxK1l1WVV5OGtFOFBxQjBwWEpBTW1xYU5taG8wUFAzanY1?=
 =?utf-8?B?TTNIZmlqV3l1MzlONmJJSDdGMUlEQWdNK1dmbWd5d1o5dXVjbmNPLzNUS3Nw?=
 =?utf-8?B?ZWRGaTRYc0sveUtJUGtVWVVoY1BUaTAvK1ZNcUdvUWhyL0ExTFNYWTJZQUFD?=
 =?utf-8?B?VHl3WjRLdVZEVXNGQVcxaTFNR2doMWs1cnZGRHJTS3pHb0d6dzNQZFhNYzVB?=
 =?utf-8?B?T3g1RlFvZXQ4SldGT0Nndm9CR0NvR2tYeVpleTd3bUFMRzBaR1loYk5SdkZT?=
 =?utf-8?B?Mytwc0twc01ZVmcvSkRYNzVxaDJvNFhjbzZnekJCK2c5K0kzdmlzUGJTSkFs?=
 =?utf-8?B?dnIwVnBjWmdhZUsxWGJTbWRpT1QzM2YyRXRrNEQ0ckFTU2lva2pyVk4rM3M4?=
 =?utf-8?B?ZzZuNCtEQzB4Ym9lWmY4Y1IzMkludHVpei84WHJQL0cvbHRLMVlha3p2Tmg3?=
 =?utf-8?B?djc3cUtIMHVRLzVSblZuNWZKNXMxSlJwR05ld2l1NnJ2bDNDNWRYSjJmVmNZ?=
 =?utf-8?B?QWpYUGtzTnJCTGk2eCtLNHRySmJxVHpGNDFZQVUxcWNacHYwU0lRazVZMHlT?=
 =?utf-8?B?a0FBaDN0WVFpVjhMN202NUc3SkcxVHpJY2JqOFZsL1BEK1Bwc1psNDZoRHNO?=
 =?utf-8?B?dnI2MHNEazZMcFV3am9hVUp2MklTeXYxS21ieEg1dUNGbE1NR2lydVFPbWdO?=
 =?utf-8?B?M1Fmdlo1OGowMDRxU1BaMTlaWjJzNldqVXIrdVVMcUFMQW1kLzdqa3VZVzJJ?=
 =?utf-8?B?MmFSQTQxOCtmeVhKZnRKQnVXbXlJUW5nQlJGSkRxb1pMSUtMUnc4MVZxeFky?=
 =?utf-8?B?TkozVExZSGhnK1VvTGIzTmo0SDE5SjQyd002WmRxSFNsVDBkeWZJRWVheHoz?=
 =?utf-8?B?Qlg3R3cxSFNBYzFWYTBqNTZDTmJnM0d6T21xSDNUNDVxMzZCOEI3WVlBeC9y?=
 =?utf-8?B?RStScHpJdGpFc2NMMkxoQm1ab2gyVE83MG1oS0pkV3ZFZC8za2tIWk5RT3pS?=
 =?utf-8?B?NTBYei9DWTdvZVlvMnJ1amVkdHNYWkFEWm5HQS9lZm1xbUduYVlwNEFaR252?=
 =?utf-8?B?bVdjVncxeFVES3IxNDhJbmx4Z2lZMGhnc1hLUm4yWVp3Q0JQVmxhZmZjMDRz?=
 =?utf-8?B?UDZoaWVFWEs0V3RMSjVHWitPMEtlUFZBZVVKclU3UDd0ZnJlRktHa0dZZHgv?=
 =?utf-8?B?YVl4NldMZzJPNmEvK3EzcFJqWHlZZjRpSEFZVWI0alBVMnRqKzg0YWRyTHRj?=
 =?utf-8?B?N2hMQXlKQ1dhS2FVeDAvaFVHb1g3bjhoRnFEajc5RTFib3RLUVR4T3lPbVJQ?=
 =?utf-8?B?QTd2eHpkMm1IZ3FTRlJjazBtTXhQcWZvV1RBUm5KVzhJelBBOHZmdGpTNzNS?=
 =?utf-8?B?WUYzT3FjTEtIVjFyRDk2OEx6ejVLUDNhdlVmcmpNd2tvRHhCdjB5OUNDQnV5?=
 =?utf-8?B?SWphSERjenlCTytRN2RPbnlzVDVIUnpWcTI5ajB0MWh1T3JRVllBWDVnWTFS?=
 =?utf-8?B?NUx5U2hHenc4dVJqZVpNU3c2RVBuNjdrMThEMUJvQlp6ek5La0NQMFEwbHdm?=
 =?utf-8?B?bExZNnVjYWVQbkJacnJMMEd2TWV2b3RyUUlmTkloaGxzUm1QcXFLNU5EWGxn?=
 =?utf-8?B?RE1NdlBOL2RZQWtnUmllTm5TWE1pdWVld2ZUeU5pTzFpb1oyTjgvV1lta1lQ?=
 =?utf-8?B?c3p4N0E5Q2tSTHM2Z2d5VDNmN0Yrc21iT2xOY1BVeG9OTkZGWFRJMW53ZUx6?=
 =?utf-8?B?OUcwTVNMLzRmak5sWmNhT2dDYnZLQkZCYVBiZklaM2ZCRm0vZEExYUU4TW9V?=
 =?utf-8?B?SGR1RWJoQmttOGVMbGFBd092ODhqWmNWTFFKb3JNSTFuKzQ0MmN1YjFaN1VF?=
 =?utf-8?B?OEFZSi83VmZ5ZU5WKzNzRWN3V3lUZGd1NURFa1FEUUhXMjZqQjNiUzlPNHVp?=
 =?utf-8?B?Qm8zU0NXUzQvaytCY2hNaUtBUm9ZS2lmOHJNYStaWGd5a3NidDRpbS9YeDVv?=
 =?utf-8?Q?b/PPawOku8F8HpFlp1DtrO7St?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9ef70e-71d2-411a-b85e-08dd048546f5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6604.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 08:21:02.7185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IxZ/BtHMbaqq/MVplUwm8PAWUOyQgzFM8T1LYKlsnfJ8Qh3ij9R7720JZ6T54spgZmsT9oKGOQqTP7lMraGcrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9236
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

Reviewed-by: Tom Chung <chiahsuan.chung@amd.com>

On 11/5/2024 10:01 PM, Zicheng Qu wrote:
> This commit addresses a null pointer dereference issue in
> dcn20_program_pipe(). Previously, commit 8e4ed3cf1642 ("drm/amd/display:
> Add null check for pipe_ctx->plane_state in dcn20_program_pipe")
> partially fixed the null pointer dereference issue. However, in
> dcn20_update_dchubp_dpp(), the variable pipe_ctx is passed in, and
> plane_state is accessed again through pipe_ctx. Multiple if statements
> directly call attributes of plane_state, leading to potential null
> pointer dereference issues. This patch adds necessary null checks to
> ensure stability.
>
> Fixes: 8e4ed3cf1642 ("drm/amd/display: Add null check for pipe_ctx->plane_state in dcn20_program_pipe")
> Signed-off-by: Zicheng Qu <quzicheng@huawei.com>
> ---
>   drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
> index a80c08582932..36d12db8d022 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
> @@ -1923,9 +1923,9 @@ static void dcn20_program_pipe(
>   				dc->res_pool->hubbub, pipe_ctx->plane_res.hubp->inst, pipe_ctx->hubp_regs.det_size);
>   	}
>   
> -	if (pipe_ctx->update_flags.raw ||
> -	    (pipe_ctx->plane_state && pipe_ctx->plane_state->update_flags.raw) ||
> -	    pipe_ctx->stream->update_flags.raw)
> +	if (pipe_ctx->plane_state && (pipe_ctx->update_flags.raw ||
> +	    pipe_ctx->plane_state->update_flags.raw ||
> +	    pipe_ctx->stream->update_flags.raw))
>   		dcn20_update_dchubp_dpp(dc, pipe_ctx, context);
>   
>   	if (pipe_ctx->plane_state && (pipe_ctx->update_flags.bits.enable ||
