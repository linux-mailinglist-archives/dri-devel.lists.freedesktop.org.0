Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9A4AED983
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 12:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7138410E3F1;
	Mon, 30 Jun 2025 10:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kLB7J3PJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4F910E3FC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 10:12:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t40+emctrPByF6Z3cbaL9v9RnF7CHcG2ZzWUWmcnBRTypv8hD00Torbh2p1x1lLRRu/LD1cVYRttslTMZsW/lsDcqis4WBfHOuUamdbg1dCOv53dZqBFP+pa0Ybl9lZE33DDLNV2a1HLCQydjnHK2/PRKhUC8WyWAqfp2/2ekkh3OZvK45lkLcU6E0qNRzGejH6UF0Hl8AOfpphxiubTHTA2qhPcYTllSlCAWqLSL0a2D5n4PfQ5vF7gx+72nMaInDWSNjRIk/psT7XsfRGztBjEQVK4FrpSB8LxUuOrUgmQ8J9Wi6/vVz5igs8NcCKaZUI6UK9fZc45um5n0XUayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7loDP4uHKykJXdaJen2dAyTLFgpTv3mOu58t+BFZ5+4=;
 b=tOnedIiwI4nMwQa66Y7W6R8odkDo8dKR8FIKQcaC/XKZlj1FlXTXts5JviaQPs/AfYYvrnMPHIlhdG8MAapQuykKYVko2kdaVwEYFswRfyymizPkWkbRrT08+iR6UAeHYBphR55ozvgmmNSH8hyXbnK2WfH1F96tQlYKtFHFFIGuWrYtbVurzih26brmISZDazMrT5ZMc1zvwt6pOLKTADKP8w8JMEVPSeEA/tPBYseKVby3IeXxNK/11PYjHtbx3JFaQ5DAbV50jFZHttJfQrwsP44v4e0rD36PpIb56GmOxHtfOZVdOgENdAqeRI8OGG+WSLXHKRb5l4E8Ks+z6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7loDP4uHKykJXdaJen2dAyTLFgpTv3mOu58t+BFZ5+4=;
 b=kLB7J3PJw53zISKAm1WQzKWFv7zQjwq0OVaEkSfx+ciB+cMraXOqGEFh3NYf4MFAXjqoGu0gJoXZLjyp45BuLvPxQtFDITacz58beQwepIg+j1YisBVGn9I8WnMaaamPUi6Ip7AqcoBt3tR6mf5XTMev/vkyS1AYqeknLcfXWbs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 10:12:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 10:12:48 +0000
Message-ID: <87bd3e60-e709-4ec4-9f01-5a4d903c379d@amd.com>
Date: Mon, 30 Jun 2025 12:12:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] ttm/pool: drop numa specific pools
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>
Cc: Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>,
 Dave Airlie <airlied@redhat.com>
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-6-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250630045005.1337339-6-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:208:236::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: bcedd214-d51f-4c65-1314-08ddb7beaa3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDBXWUVTNmdjWk9yK3hjRFVKMGM1b0NlYTRqSHdjQXBiMGZJdGp3Ymo3cEI3?=
 =?utf-8?B?L3FhQnlaNlFZV0ZMV1gxdTRFSGF1Q05yWTZCOUlNaTJDTGIyU0dwK2dpc0tx?=
 =?utf-8?B?ZUdNWDYwZU5LNTdMcG9PTkZHQ3VMTFdjdmtRTHVtSzh1NkJQejZLOHBhQVN2?=
 =?utf-8?B?ZUlLREZYbkRjTHdrN3h6eWF2TUQ1ZzBKRVJvQU0xM3NSTlVFcFJtamREQkxz?=
 =?utf-8?B?L2pIZFVmLzZJVXNHOGM4NHp3aFE0VTlKY29mSGd2QTNVZWhKZ2Rya0ZTbVFP?=
 =?utf-8?B?VDMxdnV1WS9qOGRBUmlFLzlTYi9MdUxlS0lGMmtnOTNjUmhmUEVVcEdWN2Ew?=
 =?utf-8?B?S1BvVExhSU5uSE12NWVZNEpHNVUybWZXb2JQdmsxQ3VBYzdtOE11dmpIRThM?=
 =?utf-8?B?VVloQ0lYLzcvUDd3YUlFb2xLQktLZHlwTmZQaXJXOXBLN1Foa1dyMU5KWUEy?=
 =?utf-8?B?VS81Z0dNaDB4OElkZHlSNFphbnhxUjBJT2xXWWF6WTFJSmx1UVlMeitrcDBh?=
 =?utf-8?B?T3Ixa3l3WmFUS3lVc05nZ0NLOVVrZ3Z5SjVpZm93Wk5mR2tFQTdpbUZwb0VH?=
 =?utf-8?B?aHB0KzEyQVppRlg1NTRQRGEwMkVrUUdQV1dLOTlwdWU0dlFnNEFNSndjaTZk?=
 =?utf-8?B?NGhWRnVveTJZYmxIOHh6ZWJhWFhBNG93RHU2RmluZjNTNHpsditUQWNRc2NJ?=
 =?utf-8?B?NmZzNUNIeEUwaXg2MDhoYllSdkJqMFRLV3JUT1VJNXZORUNKSHdyMHplNVZz?=
 =?utf-8?B?L2kzUVU5NjJYdTUvSXdJUXliTityOU9iTVN6c0pKMk9sdjdoT0duRWxsNUF3?=
 =?utf-8?B?U0xSNWZRZXc3QTlrbndyUVlVWXdZcUExQ3gwOW9Xb0lBNzNyZzBYaFFKSGE5?=
 =?utf-8?B?UlErYjd2WTZyNkVPbndjN0loTGlXeSsvSzZJU0hhYTNyVWJhUStUcHg5YWtH?=
 =?utf-8?B?Y0dYejQ4VEJrbTFXMmZFUHpwUFdrOFJicS9kd3ZCcGpFWU8rSlVpTG13cGo3?=
 =?utf-8?B?YjBhcS9EVmIwcWJVWlc1Y2ZLdEZxaTFvZDJQNXozbDh4LzlLeVUvdEIvbkht?=
 =?utf-8?B?WEhmVVIzM0NLcnVYVnpnZ1VGalJQMVRoR1p3dzBWOWo5V3ViODhxcXZiNlAw?=
 =?utf-8?B?VGpqYlIzSE5NM3pWZnk1SmdqWnV1TGQvSDJPR28raE9wTnBXK05RRHBXME1G?=
 =?utf-8?B?R1c0K0JNVi9oQ0VWam40WTFBeXVsSVppS3NMcmZVR0oxZ3BWQ3RHR2dSSjhO?=
 =?utf-8?B?TWtGYTBwamVBVVR2T01RL1N2SWZ2WW9GUnhjTkNuTmxTeHZ5QmI2UUY0RmRm?=
 =?utf-8?B?d04xU1gzTXlJYklxWUNjTmdLYXBrcVJQMG8ydVVMMnVHSUd0Lzc5WFJRUDFI?=
 =?utf-8?B?YU9IUzQwUGY1VGRVcGNza0U3MjhKVzJmMXhtUWVnMUdXdklmNUxsRkJvbzJt?=
 =?utf-8?B?Vm8xa3YwQzFQRzdnY3pic2crT3k5bG85OGdNWDFVS05wUTB2MUREcXJwYUh5?=
 =?utf-8?B?Zm9XWXhidVNuZHJvaXFsMDM0enlRRlkzeGNkb0ZXWTh2VC9VSUpBdDMxTEFa?=
 =?utf-8?B?ZCtFcGgyOUMrM1k1dnhWT29TRklUWFhHMUN2Ykk3TzhFcE1OVitSNzJYOHFV?=
 =?utf-8?B?QXJCUDQrYitDckNVRnhjTWQ4UlExSEVmMkRqaU8renZDYmhqKzdVNWtyS1ZQ?=
 =?utf-8?B?TUNOZjlTYjVnL1BaRU4rempnd0ZXYWFySndPQVpHWkthTVpaTDBJRTNkeEUv?=
 =?utf-8?B?dDhGbjdKQ2tsZTlybG9CcDlmTzc2K3ZXbEU2aUNWckdEUFNaYXByVnNWYzdU?=
 =?utf-8?B?VVBmaUZqb1R4RlJNREJEYVdyRC9jZHFKOVg2ZTI0dGlkeFJ1Q1g2NmN5RlI1?=
 =?utf-8?B?bFJqaDJER05ncXo1bUNXdHUrVWFVQ2tCY2E4VlNGYk5RQnoybERLUjkzSEl4?=
 =?utf-8?Q?6wHyvoMENF0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnRjRkhlVnRTWVNncm9rOFhWTFZVb2tiWUdYTEdUT0p1R3dsZHlHNDdNcHJN?=
 =?utf-8?B?N0xZSVAwWjVBQm9OcE04TkdLOHc5MlRTc2lHdGRTTjN4QmVSQkkvbkgxWUsx?=
 =?utf-8?B?NEduY0U0Q1VxRnJVazA0VmcvaWtBSUtNaTBCWjVCTEV1dVhrY2VzNzNYUnNS?=
 =?utf-8?B?SjdrajhMWEFrSW5IZVFGbVFDTEJRb2d3S2t4czJCc1pWVTJpRHE4d1hGVHJL?=
 =?utf-8?B?aDhsTjJMOXJiTDhTNEErY3M3RzRka0ZSMG4vM2RsT1NobWxKY0Zjd0Z3VXcr?=
 =?utf-8?B?d0ZQc0Z1VHlOcGtCMFN3aEhGTkxQVjNWT3NPRmJZandXMzE5dGlLS015T0ZI?=
 =?utf-8?B?V0Q4eFBJR2lZTmg1YnFYdENUbHNDb0IzeDVHTStzbGo5bmFHMEliVE9nekpC?=
 =?utf-8?B?Z0VjQ2UrdkVCTzhpakFwcGIxVFNzQ2p4UXBCS0Y0clVzQVM3bmFWTjZORHBp?=
 =?utf-8?B?K3lBbHpVa1pzdG16cE1xQmFtV0p1OUNtbEpyZWF0L2tZR2xuNGNDaHZhTUNs?=
 =?utf-8?B?aXFPRjlRQVUrVlozUHlja1NaSWNDRVJaeCt0ZWJ5dXdKdERpRnYwcmZIN2hI?=
 =?utf-8?B?bTNmUEovV25Wa1VmT0IyWURCYksyT1pTZTcwVU1KVjZKWWovV3VNdUMzWWx1?=
 =?utf-8?B?ZnBvWkE0TW1ZZFJLT3ZoTmlId0pKQW5DU216ZjRxSnRCN1hTTXA0cTNpMnZE?=
 =?utf-8?B?TnBpQkZqN0J5NVBudDJWUnpYNStLeHBCMzRrVjhLdWp1bEozUHBmNUJmbUdC?=
 =?utf-8?B?VzQ1bXlKSXJPQ1MzTjZlQ2F3M2s5eWlwbm5xbHg3NCtqS3VZcUUwVWVEYXQv?=
 =?utf-8?B?RURoTjkzME9sa0tJUmV3c0x0QWhqV0NuazZ0RHdRcEViTWM5SkRiOCt0UXAr?=
 =?utf-8?B?bmpFQld3T2l0T2tFeDhtc1hXZS9VRzlPQ3plWVdtSGozamxFYkVzUndoaDNR?=
 =?utf-8?B?V3B6dTBGcU0zRlZDbGVlMUI2QWFwdlgyTUdHbjhCNTJQZ0FMQjFsUlgyeTcx?=
 =?utf-8?B?c3I2aTlheUpWbDVlaW8veGZQYVFyWFRtcGd6MjFxOGYxdVN3MlpCbEVsTm8y?=
 =?utf-8?B?STJ3bnAraXAwWndxRWRhQTJxdXJrcmZBdkM3ekRQN1pQamgxbm1uTC9wTWhz?=
 =?utf-8?B?TVk5ZnFxNHhSQ0hEc0Q4bjIrMG5oUVl0OXl6cEZJRHZEWlZubzZ6eHlzTERP?=
 =?utf-8?B?c3ViblNDWndjdVlpclRjblAxRnRXUXZKalo3eTRYRmtnTU8vZ2hWN3dTcUQ5?=
 =?utf-8?B?NW1iTWxBUklVbFlseTY4d0Z1b3hyTDBMQXpTNnF2UmJEdlF5ZjBSRFNwck84?=
 =?utf-8?B?YnZFbnlXWWZCbVpyRlR2Y3JDVFQrY0kyWW1SMUxIekdIWitWUXlSL3RkaTBx?=
 =?utf-8?B?UlNjL1pwTmZoeGFQSmhmb3FXenlSZ3NhM04xNlg0V25aSGhQK2JzNlVyVGZy?=
 =?utf-8?B?Tnc3L3dCUlcrdmt1a2xRUlZNQW9GeWpUNEoxL0hjdm9zNmpWejZCM0Q2RG8w?=
 =?utf-8?B?QlkvZ0tBYTVOenpXbFdBMzZzcmg2ejl3TmNqa1kwY3hVK094citKenVjWkZM?=
 =?utf-8?B?cGQ4Um5maXFKR2lVM3U1bVprT3hqbUc4RjJEMVd4Z3l3b3VJalhGc0o4ZkdV?=
 =?utf-8?B?SVpBOW9VZnMwdXBJc0ZBUThtcXNVQmcybmcwL0dyYjF6ZGkrbXM2MitUWUk4?=
 =?utf-8?B?WWtNSndhVUw4RWJIeWZhSXEralgydE5sM0FVcmZzMlYwU2JXQXVESlVta09P?=
 =?utf-8?B?dm1JK01SeU9DZklOWnVPVE9VZEVZWUJOU0N5bDJhMW1lYzRuSng4Zkt2dlll?=
 =?utf-8?B?WUszMC8zc3h0NlJzYjBkeGwrVFlCcHFaVmd2RGM2SFFsQjFzcGN0YkE1MnlV?=
 =?utf-8?B?enNjQ3lwenF0T1hyUktieHZNTUFUbmxMU1EzdVg0US8ycERkSzJLemNtcHlq?=
 =?utf-8?B?NGp6TEFESVk4UXJtUlR4Uk50ZVAyZk12OFdNemhDUndBTE5LbkZ3T3IwYURj?=
 =?utf-8?B?VnkxUGprTGtOYkZLYjFuQk9iZEZmQ21VS0VJZ3BFbTFWZEdPb0c1Qjh0T2xP?=
 =?utf-8?B?bXdSajNLaERxbHhaVWF1akorSmNCTElDLzUxQlFIa3Z4T3lPdW9XQWpKVEFK?=
 =?utf-8?Q?VPsPkwlwmMNZYnvxExC1qBhIO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcedd214-d51f-4c65-1314-08ddb7beaa3f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:12:48.6113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXqI5ygcF1kUJCHpXDh2Qtm3pP+kgXj8bx+oIuzRzqpvdWNb5I5WD/asbb5dEizJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7473
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



On 30.06.25 06:49, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> The list_lru will now handle numa for us, so need to keep
> separate pool types for it. Just consoldiate into the global ones.
> 
> This adds a debugfs change to avoid dumping non-existant orders due
> to this change.
> 
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 4372f0cc4a57..95bbbc843b97 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -399,17 +399,11 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>  #ifdef CONFIG_X86
>  	switch (caching) {
>  	case ttm_write_combined:
> -		if (pool->nid != NUMA_NO_NODE)
> -			return &pool->caching[caching].orders[order];
> -
>  		if (pool->use_dma32)
>  			return &global_dma32_write_combined[order];
>  
>  		return &global_write_combined[order];
>  	case ttm_uncached:
> -		if (pool->nid != NUMA_NO_NODE)
> -			return &pool->caching[caching].orders[order];
> -
>  		if (pool->use_dma32)
>  			return &global_dma32_uncached[order];
>  
> @@ -1295,6 +1289,8 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>  	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>  		if (!ttm_pool_select_type(pool, i, 0))
>  			continue;

> +		if (pool->caching[i].orders[0].pool != pool)
> +			continue;

That here makes no sense any more. The NUMA aware allocation goes into the global LRU now, so we can completely drop the debugfs for this.

In other words drop parts of the "if (!pool->use_dma_alloc && pool->nid == NUMA_NO_NODE) {" check above instead.

Regards,
Christian.

>  		if (pool->use_dma_alloc)
>  			seq_puts(m, "DMA ");
>  		else

