Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FAEC0C543
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3BF10E382;
	Mon, 27 Oct 2025 08:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qoKZhMCt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012009.outbound.protection.outlook.com [52.101.43.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C460510E382;
 Mon, 27 Oct 2025 08:36:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVFVW7qNmi6LM4B1wYeJUKmXgmzv4dbuKuINiSbcx1+5P7iDM/szZmfzf8a+jB+7WA+kWkmpNsUJ8zNsvNEY4iErxeiWPlEsyNiHaG7W9JFbp5HnKtI2tSFAxlEPJJjsoQsto/cDF65/Y2XVyg7JEPGFHnHQbI/K2SB/evgrz5+LWwIrQdqTTg3j5VrRX6wmK6+Z8KxDlAWQx5lSz3ZleSeSRZqM471ytsEAIt+x4Z100AW9EjagYGxT2OynogR1MlronY15Z8EuYwuAgO6AZMIHPpl4Z2vnG4kM9lK+wfBDogQTsL2PGqyLnoDNeJMI8Ro4RAGzY3+07yVObzEatA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJMlApntBUZBLGWfQtcRU6B9xi/4ghf/Cz4qX1Fc/rI=;
 b=IFT88Aw77uEAueszake5lmGTJ5QsgVP0Qzq3Plz/4JRPoS9qzBrm3uO8HvtEyBqjMCCkJL/dXf9bk89vp4ue0vO4wmO6XNdfAgEtRdwstiENCag3TVL4oxmWami2DO1s67qCw/NMw1lKs7sNalOoJXfj0RTBISdHyJIO5GnyunDyKnWnhEVqqX0uaZszZ+QJs63kGeM9t/p7bI4BcuJpC1XlQOHykAtPPPfwSxBHL6VpMYTAvNYoEMTTMDSjPCiol++xxPxrepb0vvXR1LyXFGAqiUBz9+Rlwcd0logXCFq0jLOWdwTJ3xbQKFQsrBjSfMiTEA5ZkNCuRrz58Wb/bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJMlApntBUZBLGWfQtcRU6B9xi/4ghf/Cz4qX1Fc/rI=;
 b=qoKZhMCtqFeoMvMNovHWHdyJfm2vnGWfKwRYs7vy8CWAYwe061ks/l4bZOqY1Gp5sbj7Rqq9qjrhvlKEMOZ47jCZlUT7wFmNNifJl5w8eW73W+ILCL5hXTFbXEVqilOjMGIwpl9k3ReNuBkxRUCsZpoVABPznDGZnDFnZ3IbROE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA0PR12MB9012.namprd12.prod.outlook.com (2603:10b6:208:485::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 08:36:28 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:36:28 +0000
Message-ID: <13fd3b12-03a0-457f-a5da-fe018b032211@amd.com>
Date: Mon, 27 Oct 2025 14:06:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] platform/x86/amd/pmc: Add support for Van Gogh SoC
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 Antheas Kapenekakis <lkml@antheas.dev>
Cc: Alex Deucher <alexander.deucher@amd.com>, Perry Yuan
 <perry.yuan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Sanket Goswami <Sanket.Goswami@amd.com>
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-2-lkml@antheas.dev>
 <3792db59-7dc1-4e34-9436-84df4b6c3e10@amd.com>
 <CAGwozwFTDD2QrHy37axhanwQYv6ty9K_hfhxS05djKpv8HfY6g@mail.gmail.com>
 <2684d3ab-d7cf-4eab-acd4-91bdd5debb6b@amd.com>
 <058eda7c-ab93-40a5-b387-54f7a18f3922@amd.com>
Content-Language: en-US
In-Reply-To: <058eda7c-ab93-40a5-b387-54f7a18f3922@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0134.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::11) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA0PR12MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: cb30bdb2-7441-4680-b65b-08de1533ec2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWZoMUc2MlFvKzUyaVk5SEZaUE1Xdlo1c3pmRUE2RXh6NURaRWhpSG9xdnFO?=
 =?utf-8?B?OHVRdjNSOTJ5RXBTZXkwbDFXMmFsYUdjeDBwejNKMWNTbzZPcTBlcXhMRjZR?=
 =?utf-8?B?b3F6WU1sN203a1d2R1RnOFg1Q2ZBMEpnNE9vNm1IRm5kVW9ETGxSRmdoNHRZ?=
 =?utf-8?B?KzM5RktyeC96U1BpUVA3QlhPRlE0ZmhrTTFqSS9KTWwzOUh1VVpXbVdRSTRG?=
 =?utf-8?B?UWVRSElyT04xaFhoSHpteUJyWWFJWC9aV0YwdU9jMGh0cDY3WloySHNWc1or?=
 =?utf-8?B?MDRVQXA5U01iUUJFMFBzd3REZ1IrYmwrZ3FNUU5hdllCZ1V1OXZSeE9qTEVO?=
 =?utf-8?B?Y3d4L0h4aG9IMTgzWHpsSVpJai9yYXcyWWprb2h3VldkQWVyd1pNd3FUZ0Qx?=
 =?utf-8?B?OUlleHBBYUNEb0dpMG5ORm8rVDFvVG9MdFFNQTF6R25mcyt6Q1FjRkNtYjdT?=
 =?utf-8?B?UUFlbjh5cFVQL0FNOEpaUUdCZmo2TXp4VDZLU0dsYzIwZSt6SDBzaHd1b2Jj?=
 =?utf-8?B?R0Z6cjhkTjNnb0JiUzdYZCtmaEU3Zk0yeTBDd29IZVBXL3BudVVGMWh6UXQr?=
 =?utf-8?B?d3BNMmhBay9mZmUzQVcvRWcxMmE3aWhjYUpwekZiMDhpM3J4WjFVajVnU29I?=
 =?utf-8?B?eXh6MUx3OXA2QVlhYUg2Um81Y0RpZ0FIeHFZd2dxTXRUaFFJdTBVbnFmV29Q?=
 =?utf-8?B?S2RoVXVGcFdKaWtpZkdQM2VvbXk3aWtudFpNRWxNOXBLZ3hEdnJsOWVZVzhz?=
 =?utf-8?B?Z0NtSXJIQ0lYQW5wU1ByN1VCVWpTRzNiWEtRL210dVpCRHNobjVaajVKblQ5?=
 =?utf-8?B?bHk0VDhtTi9wcUN2dFNJOFIwd0RIM1ZJOFcwU2w3Z2hZaTBqOGlUd2dLRFpG?=
 =?utf-8?B?a1FCV2FzQWtvRnRPTFduNWRsL2RLWTNiN3QycTRkTXFOUWFyck5mUDBrT1BM?=
 =?utf-8?B?c2pIcVVlTGxmSnlDS21YV2RZN3o4U2ttS0F2NURUZ005TnZUVG1pQXIwWlRY?=
 =?utf-8?B?ZDJsVDhHTWRYdzlVS0daRlhnWmd2N0s4UkwrTWViL2lycXRWdEFKZ0JOSEk0?=
 =?utf-8?B?cjc1VldaSko2TmxzUjVWclM0R3hDdnFpdUZmK3dEM0g4cE0rZzk2VmlXNXJB?=
 =?utf-8?B?SDFQaVRMaTVackVjVzZKMmwwZEJNK3FDTEFJaDl1dUpvRVdYLzR6c3V1L1Yr?=
 =?utf-8?B?d2d5b3RXY1crTHNqckVUaTZNSGpjK3UxR2Y4bUdyMzEvakVCaXhLWm1BMXpR?=
 =?utf-8?B?M01VWWYybFJkL3I0SEkrcU9CZUhEdUpvQis1T3Nuckk3Zk5TWE9kTnZCcUJ4?=
 =?utf-8?B?dEFOc2FpMzhBd1kxdTRwc3pxM1JQcXRkQmg0SFoyeXZ2c2t5bXp2WEJqc3N1?=
 =?utf-8?B?aE9BNW55YTYvMUEwdjBSMnVDTVBibzB5QjVKNExGd3I3ZyszbE5BRGRzWFZy?=
 =?utf-8?B?a3MxUFVvZUtPSTBpNFNwbGozUjFXVHFQMzcwQ1FQTEtUaDBHV2htL0RXeXhI?=
 =?utf-8?B?RHl2NGxZemNFSlFFZ1pyR0UxOWxJanAzdmpsQkc1cElhU3dsZVVUUUNpb2ZS?=
 =?utf-8?B?QmpteFZvbnBpbWk4azRzSmNPUmdCNlBHQzk4V1B5eVdlWHh4SHp3ZXFOdkZm?=
 =?utf-8?B?WlBHR3pDUzQvR242TGx6Y25RQmpiZ0JTSVJXVVBHQkpGRFBjNjkyMGs2ZjBx?=
 =?utf-8?B?RWw2Skd6T2NYS0NzZzFaQlZHTGVEckh2VllVN1liK2hUeHJQRlpEc2t2Rk9G?=
 =?utf-8?B?c3dTMUtlcHkxcldLNW1aclhnU28rejBGWWwwUFNHQXc5TnBKY0VHQi95ajdw?=
 =?utf-8?B?YlM2ME8ybzhVUXBBcVdLODNHSE1RazdIak1tSEVmQnJmeGEwcTBSVEVjSFNZ?=
 =?utf-8?B?cU9SV2hXNW13ZDE3bmJRam9DV095M2Npc0FSMkUzTjhzY3ZIWG5EdGVSd3Q0?=
 =?utf-8?Q?xv3q5DWjEY5/ENnYYyDw7suAgXBL+vpu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODdDN2p4akpKM1h0eHNuK2NLeTR0T05YMXZvdllHNEVXMjR0c3hkZWI2N0tx?=
 =?utf-8?B?VWloTDI1WG9BcUNGYTRreUYwV1JocjFYYkhkWEUyRXVIbHJrMTk3bkhKMTJW?=
 =?utf-8?B?VXRUa0FxN2xVUGxaUEZOVTRibFcvK2JvVllDbElTWXFJeGtUVzR5bXQ1dVkx?=
 =?utf-8?B?WExmcEFHRDRnVDQybkl2Z1dycGtQNnQ2SFo5ZzJqTGR0Umt3UEEzRmJEMkI0?=
 =?utf-8?B?YXlTajFZelZ0MzJIZ0VrcEt6NEs1MnlKSmFYSXRlTGlLZXQvUjc1d2dXUG1S?=
 =?utf-8?B?SWxiOVd6amMzTWw2V2E5b0NVdGJZM0lzYzBoL1czOFQvVWZqSVozczNwRHNH?=
 =?utf-8?B?cE4zZ0tBSU9uWVZ6aTZGZkJ2U1p3QTF1am5XcHovT3ZlZWdQaWZldmlSUlJv?=
 =?utf-8?B?NnMxZDh1N0RHa3B2VDR6d1k4clJMamMxbVRuQ05hc1VNVnhtTHhlaGk2SEFz?=
 =?utf-8?B?MDBGelQ4djF5V1JTSExVcks3UEtVcTFJRk5CVFpxK1pOZ1U0NStIZ2ZLdXI4?=
 =?utf-8?B?VC9ETGFEVnRTdWlxMzBzSEp6S0gvdXZYdXFBRTdJNkQra3prYW5HcDRIZkpY?=
 =?utf-8?B?R1FtUmx5UitpczBjMnJiM0FWdkd5M2lTMU5wN3RkeHZRZUd5QlVoVjAwaHlU?=
 =?utf-8?B?bnp2NUNSVlJVb2N0ckNrMVFmKzN5RnhQVWZQRTF4dDRBVlJrbVVEeVpLTk9P?=
 =?utf-8?B?WEs3OEhxOUVac2xWY3VLNm9BSjAxN3l2ckpIdEJTZk9OUGt5MnZnWjZDaXZH?=
 =?utf-8?B?aUJKdlRRZGVsbmI1N2pvZHBrUWYyM09NMFJWNktGSGNQSGppUEJoSEwrUk5j?=
 =?utf-8?B?OVFvSjNIWGlzdlJRa3VFbW1YcGg2TW10cEFxb09iZGdpWGZNR1psYUhBV1Ji?=
 =?utf-8?B?aUtRWmpoeURaV1VXVnlIVmNLS21kcm5tMTRJeTNOTE1XaittOWdLTDlZdm85?=
 =?utf-8?B?UldsZ0gwcmhaNWloVlcrNE5tdnNUdWlNQjd3QU0zZmhxdVRVTFdmajZoWnM0?=
 =?utf-8?B?Q1lSRWVoMGovcWlJUCtXdFlaeGdkbEQ1cVMrZHgwN1BPb2RzZlBtOXl5UzBo?=
 =?utf-8?B?V1poemtSTysyMVBnaEttamtvSTdhZytneVJoczRHSmk5a1BmM2hHbEZ0NndZ?=
 =?utf-8?B?bHpJWTd6OTViL0Z5eSt0d1AwR1crelByRm82VVRYS1U4NERCMUdqVDl4NENM?=
 =?utf-8?B?ckRURVpOU3lFMUFyVU05Vk5jdFIwMlBHaXRqdGVTai9CT0JnTlZjU1hwQ21K?=
 =?utf-8?B?V05VSUZ6dzQyM0F5My9EM0hXUjAwVUhNa2w3a2lqZ3c4RmlMdVdNeWJqa1J1?=
 =?utf-8?B?TVNMOHJOM0dieWFtQWxLdjRrZkp1dVhqSG1FdTBtSHd6czBUU2pPcFQvM3da?=
 =?utf-8?B?emMwMlg4K2FjSHBtUVhiWTNseXRnckFXaFB0ZXhKdDVheEZqZUVDem5MSHJP?=
 =?utf-8?B?R0QxdTI2aXdxNjY4WkdVNndha1lsZUpDMnNES0c1L3NrbUZhWVRZaFo5TEVv?=
 =?utf-8?B?dmVqZmtzWjBRTDhIbVArTWRGYTJsSUFUMm44TnNNRjZhdlppVUczblJaN1dQ?=
 =?utf-8?B?dlowdDQyZ3NuRWtkVDlmWG5CZUg3bUp0MjN6SDgrY1dIdmtrSHUxTWtsaDk2?=
 =?utf-8?B?d1dNMjE0TG1KODFFcWVTZG1KN1BWRGNIOWVhTDFKdlVKS3Q1S2F0YVErWEJW?=
 =?utf-8?B?LzVNZUZCS2tFdXNGRFQwUkY2YzdKR0Z5clJUakgrYjZmMlozeEMwc3VqTFF0?=
 =?utf-8?B?ZENsRTU2RTN3M3laRHdzVU55VzFYUCtmY3phak81bWpVaUxjejJHa3U5Ujh5?=
 =?utf-8?B?ZEtuRnFOaHFTM21vTHlwTml5c3ZLSHlDem5Xc1ZIRGNveFVHQ3F5NmxuWXNB?=
 =?utf-8?B?aCtNY0dkN0gvbFYyVjhKQ2pSMFh0N1ZlUFJSL2FRMHNFZnpPRnFXckZJMzlJ?=
 =?utf-8?B?a28xZnIvMDJDaWFwczB5L3ZDRVF2d3puUFpRdnFjRFJ0cWl5TmtlY3VwK1lY?=
 =?utf-8?B?SXdWSTN1SjY0MGxOZVBNZDRtcXdheFlyM2lTOWtpanU1aFJmSFZFQnBiczVo?=
 =?utf-8?B?RGhjVmJuelNDY2VySW9QOXk0UU56dHVPanpBMlArUWZsamdhRzk3Kzd2WHVh?=
 =?utf-8?Q?5BpKEHQibEZTSlL4HNqjC1bH1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb30bdb2-7441-4680-b65b-08de1533ec2b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:36:28.7904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pifp8VilW8a0PPGLGWoRYLKaKOEYXIyqSfe1aPJaofanlWc98YqQf40C5nB9By6x0PBLwb3xeUHPT0HDCfANfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9012
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



On 10/27/2025 13:52, Shyam Sundar S K wrote:
> 
> 
> On 10/24/2025 22:02, Mario Limonciello wrote:
>>
>>
>> On 10/24/2025 11:08 AM, Antheas Kapenekakis wrote:
>>> On Fri, 24 Oct 2025 at 17:43, Mario Limonciello
>>> <mario.limonciello@amd.com> wrote:
>>>>
>>>>
>>>>
>>>> On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
>>>>> The ROG Xbox Ally (non-X) SoC features a similar architecture to the
>>>>> Steam Deck. While the Steam Deck supports S3 (s2idle causes a crash),
>>>>> this support was dropped by the Xbox Ally which only S0ix suspend.
>>>>>
>>>>> Since the handler is missing here, this causes the device to not
>>>>> suspend
>>>>> and the AMD GPU driver to crash while trying to resume afterwards
>>>>> due to
>>>>> a power hang.
>>>>>
>>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>> ---
>>>>>    drivers/platform/x86/amd/pmc/pmc.c | 3 +++
>>>>>    drivers/platform/x86/amd/pmc/pmc.h | 1 +
>>>>>    2 files changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/
>>>>> platform/x86/amd/pmc/pmc.c
>>>>> index bd318fd02ccf..cae3fcafd4d7 100644
>>>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>>>>> @@ -106,6 +106,7 @@ static void amd_pmc_get_ip_info(struct
>>>>> amd_pmc_dev *dev)
>>>>>        switch (dev->cpu_id) {
>>>>>        case AMD_CPU_ID_PCO:
>>>>>        case AMD_CPU_ID_RN:
>>>>> +     case AMD_CPU_ID_VG:
>>>>>        case AMD_CPU_ID_YC:
>>>>>        case AMD_CPU_ID_CB:
>>>>>                dev->num_ips = 12;
>>>>> @@ -517,6 +518,7 @@ static int amd_pmc_get_os_hint(struct
>>>>> amd_pmc_dev *dev)
>>>>>        case AMD_CPU_ID_PCO:
>>>>>                return MSG_OS_HINT_PCO;
>>>>>        case AMD_CPU_ID_RN:
>>>>> +     case AMD_CPU_ID_VG:
>>>>>        case AMD_CPU_ID_YC:
>>>>>        case AMD_CPU_ID_CB:
>>>>>        case AMD_CPU_ID_PS:
>>>>> @@ -717,6 +719,7 @@ static const struct pci_device_id
>>>>> pmc_pci_ids[] = {
>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SHP) },
>>>>> +     { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_VG) },
>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD,
>>>>> PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD,
>>>>> PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
>>>>>        { }
>>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/
>>>>> platform/x86/amd/pmc/pmc.h
>>>>> index 62f3e51020fd..fe3f53eb5955 100644
>>>>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>>>>> @@ -156,6 +156,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>>>>>    #define AMD_CPU_ID_RN                       0x1630
>>>>>    #define AMD_CPU_ID_PCO                      AMD_CPU_ID_RV
>>>>>    #define AMD_CPU_ID_CZN                      AMD_CPU_ID_RN
>>>>> +#define AMD_CPU_ID_VG                        0x1645
>>>>
>>>> Can you see if 0xF14 gives you a reasonable value for the idle mask if
>>>> you add it to amd_pmc_idlemask_read()?  Make a new define for it
>>>> though,
>>>> it shouldn't use the same define as 0x1a platforms.
>>>
>>> It does not work. Reports 0. I also tested the other ones, but the
>>> 0x1a was the same as you said. All report 0x0.
>>
>> It's possible the platform doesn't report an idle mask.
>>
>> 0xF14 is where I would have expected it to report.
>>
>> Shyam - can you look into this to see if it's in a different place
>> than 0xF14 for Van Gogh?
> 
> Van Gogh is before Cezzane? I am bit surprised that pmc is getting
> loaded there.
> 
> Antheas - what is the output of
> 
> #lspci -s 00:00.0

OK. I get it from the diff.

+#define AMD_CPU_ID_VG                        0x1645

S0 its 0x1645 that indicates SoC is 17h family and 90h model.

What is the PMFW version running on your system?
amd_pmc_get_smu_version() tells you that information.

Can you see if you put the scratch information same as Cezzane and if
that works? i.e.

AMD_PMC_SCRATCH_REG_CZN(0x94) instead of AMD_PMC_SCRATCH_REG_1AH(0xF14)

Thanks,
Shyam


> 
> 0xF14 index is meant for 1Ah (i.e. Strix and above)
> 
>>
>>>
>>> Any idea why the OS hint only works 90% of the time?
> 
> What is the output of amd_pmc_dump_registers() when 10% of the time
> when the OS_HINT is not working?
> 
> What I can surmise is, though pmc driver is sending the hint PMFW is
> not taking any action (since the support in FW is missing)
> 
>>
>> If we get the idle mask reporting working we would have a better idea
>> if that is what is reported wrong.
>>
> 
> IIRC, The concept of idlemask came only after cezzane that too after a
> certain PMFW version. So I am not sure if idlemask actually exists.
> 
> 
>> If I was to guess though; maybe GFX is still active.
>>
>> Depending upon what's going wrong smu_fw_info might have some more
>> information too.
> 
> That's a good point to try it out.
> 
> Thanks,
> Shyam
> 

