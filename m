Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA379BA860
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 22:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EDD10E027;
	Sun,  3 Nov 2024 21:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p31OJw6w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092EE10E027;
 Sun,  3 Nov 2024 21:47:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecjRN0wk02RvghQcxNxWoEQqGV5ZRQWSeXXcjByyiperJwiehdkySsFM7H+sVrRBcV+xeg+qGEbJarOO3S1tTMATtxhXvgZH0dirXfhUWOPGizdsbVPCazN8QYgdOCHQOz3x7rx/2hnKV+dAcg9YNPwvbcwAEQSTLMBhPakynP8yzVNdBDSIbuk5Cb/AaXga8rOwqTiJruurclLTET1BB3JQWaz3N7J3myTDuquT3a5evq/m6HNIw6aNij2xsl0DtiIaBbbqxEiXVn9i5BdfDVy2dhAIa2vnforcHRYWwjbGaD4l3OOqzmxI/BL0xMccTDCCR0WL0JTGdVnues0fPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGvcVTtwz9L5dyvA0wgY6HPdBBjt98bm6KSv9Bbk1OA=;
 b=xAx37wmPNoGhKhSNcaxVK8vrWso/g+AvYXYT+IfFXjwddIIitwZRvO3kIs+xDtwoQV74CfIVYrlsVocJ12yc1xw4xR1CILL+ZFLhAoP3sfvUH5DYU/tEAH10jTZgnOGRqFxKLznh43cQ8FyiFQBuBuzWi5SzQ0plW89ouL2EkowCuf9GdD3tF9mHyeAIn+K8OTAu5alXJDF765n3QdKkaeGmCKzhcd+z1famu8WtNSsvSIHggvo0aZQk0qzXQf/gCd3AoWN5mMBQedwHB3EuwE3jdqEBKoVRkIFjdq+Xo9RaE2pO1w1d9cPGau/7vu0OZC9fRCVgCmvuWmAQgw36AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGvcVTtwz9L5dyvA0wgY6HPdBBjt98bm6KSv9Bbk1OA=;
 b=p31OJw6wRf5JBdfgoIRQu+/GUfT5ZXNyb/z/X2SUtFCAVZS7OqPSy3daOQ7Z64I4U6OhlJHO6H9ijV5oHVSjw6Mm4subqeicrfWqeZ5RIwvRBV+emwMmiWfcoCIvaDZGZWGl8/c3oM3PN3dSI0XI7NMGbratdPb/F1li55l8IKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB8722.namprd12.prod.outlook.com (2603:10b6:806:373::9)
 by SJ2PR12MB7919.namprd12.prod.outlook.com (2603:10b6:a03:4cc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Sun, 3 Nov
 2024 21:47:39 +0000
Received: from SA1PR12MB8722.namprd12.prod.outlook.com
 ([fe80::8a1e:815e:ff80:599f]) by SA1PR12MB8722.namprd12.prod.outlook.com
 ([fe80::8a1e:815e:ff80:599f%5]) with mapi id 15.20.8114.028; Sun, 3 Nov 2024
 21:47:39 +0000
Message-ID: <52ff3c29-0e45-4f56-9677-a6fb299c72b6@amd.com>
Date: Sun, 3 Nov 2024 14:47:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/amd/display/dc: Refactor remove duplications
To: Luan Icaro Pinto Arcanjo <luanicaro@usp.br>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, LipArcanjo <luanicaroarcanjo@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20241009153424.15256-1-luanicaro@usp.br>
Content-Language: en-US
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20241009153424.15256-1-luanicaro@usp.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0083.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::19) To SA1PR12MB8722.namprd12.prod.outlook.com
 (2603:10b6:806:373::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB8722:EE_|SJ2PR12MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: 51cf1e08-afe4-47b0-367c-08dcfc5122f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3J6d1Z1YnB3MUdKUzVlb3lrenpLK2FiclRqYnRqQ3pvSlFSVHd4NG16N0dT?=
 =?utf-8?B?VFVzckdoVFh5T0RvSHE1UVhMSmRZSGM2c3NyNmgrY1ZVRU54N1N5K0RET09w?=
 =?utf-8?B?b1FwSlFjUW1pU1JoVWZGVmIrakR4RUFUc0Q1M0VZL29nbnFUOXZ2Wng0cUxB?=
 =?utf-8?B?K3U0VkNkSFU1eDNEZU9hNlNHZUcxbFlTVUh0aHlPN3YzZjRXNFN2VWNYYkxu?=
 =?utf-8?B?eFJoazFpSG5MY0hYMWRSRVVmNHRLWlA3UUZaSUpOTVB5VFJURUJVTHprYU9E?=
 =?utf-8?B?QnRCa3BoTWhEZS81WitoUm9OTE45bUlhOUEwV2g2UUsvNFkvZFhBWkl1TGp5?=
 =?utf-8?B?VEJwWGtwek1NaGk2WHhDSk41VUUrN29qUEcyTlZGRDY2NG1lYUp4STVHUGt4?=
 =?utf-8?B?enhOWm9RNlYwMERBcWRWc2J0RmhqZ3VMY0VtLzhRMkZjNlp4am43WEs4akFE?=
 =?utf-8?B?MGoySGE0RVhTakQ1S3ZUaGpWVkRoSm1lQ3Bia1NUbDAwaTM2ZkdBS016SkE1?=
 =?utf-8?B?UnpPeEl0Z1ZPK20wTWtzMk5HSDFqZ3FWUjZoWVdONVhpbmViNCtjcmp4aDkv?=
 =?utf-8?B?YjF1dU5VaU1Ld1lNMll4bmJBUXRxbDlKdFBjbnA3TlJBMmQrUGIwTjlWa2E4?=
 =?utf-8?B?Vm1JaXMzZ0FlejI4bjhwTWwvVzBqbUMza1NJVmFoa3d2Y0dxSkxzLzBsaGxL?=
 =?utf-8?B?Nm01ZE5XRnBxaGh3cDhyZTg0ayt1UGpaampneDdhQVN1RDhtZTgyYmFJZjZ3?=
 =?utf-8?B?QnJ1Nno2dVhCeXlVMExyT0tPd243bWJWaUNDVzJEY1pkakx6Uk5FRUhKSENo?=
 =?utf-8?B?d1hxNHB0RkhIQWg3L3c5Q0IwVkcyVnZGeldOSzZLUTRZUGVJMi9iNVpjQ0lW?=
 =?utf-8?B?aWZtVXV6czVPZlRCb3lYNGE1N1B5RnkydG9UbVpYVW5RcjJnS3puQm8vWnpl?=
 =?utf-8?B?ZGdIVnNYTGNEbGgxeXJiK2JvZldyTHNYc0dkMEd5QW5XTlN5aFVkdmVnbGdy?=
 =?utf-8?B?eFdVOWYvYXluRFErdmVITnd5YWd1OWtYUk9MZWwzMDh4YmtvVlJUTE5vSGxS?=
 =?utf-8?B?eU56dndvTzArOGNzNzQ2RnA3TlRwa1NLUytHV3NJYjFPeEFkaFhMWlJkMk5V?=
 =?utf-8?B?MC9mN2xobEJXMHBBZzhPbXhGNG8vb0NqTU5MYmlOWENwbEx3OXNWQmtWdHlB?=
 =?utf-8?B?VmRxM2dIZWJqZHJYVTdTWXhKQVlpZDhtemluQ00xU1I3R1EveUdTeDZ1NFJW?=
 =?utf-8?B?UXdkKzN6UTdiZ0NrRi9iYjVOdjRScHg2cklLZExlVVZMZlhSSWQrNzVtWUVR?=
 =?utf-8?B?Vy93bmpSMENPRjlmQm9SdUtXNHd1bmcyRXlud3dWTUJwbTEvWTUvNHJHWWJu?=
 =?utf-8?B?azFaeDVieGVIK3BrNHRGNTZsOWQzdnVwQnF0Yk1HbklZb0dCQkJoZ3htdzAw?=
 =?utf-8?B?V2wyOHhpRkI2cHp3blJHMFNWeHY5YlVnTllTakZFY2w3NGowT05kb3lMMTho?=
 =?utf-8?B?c29mck95MUt5OXVSVithejlWaGZwdkhmcmFKV3BjWlprTXE0dXVCUW5VdWxm?=
 =?utf-8?B?bCtqNlNFb3FzWENtbmxZZ09pbkswNzE0TVJaQUp1OE5jbk1aTXd1Zm02LzZI?=
 =?utf-8?B?ak1HRG1KUXUzQTFEWkNsaWlXdHM4a3dRK0JMVXNibW1qK2RhRFNIUS9BcENq?=
 =?utf-8?B?MUMxaTg2cDhYY2dIS1U1M2NwN0JKbXpxbDQ4V2FLdmNtTUNaWE9yTWdzVlFQ?=
 =?utf-8?Q?+5dwrtOX9RVTNL+NZs46HG20vHVdxuq/IvdsIs/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8722.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjM3ellRbmdZMHlMQmtVaTFnTUJTYi9wTUs0aXpoV1F5MFl5M0FVc0JkbDJ5?=
 =?utf-8?B?WUNYN3dJdElHbm9IY2hYbjltWFRDYzFqdUZkbnF2TDFVM2lkaFBrQ2VESUpm?=
 =?utf-8?B?WEhyb0Vjeko3dS9LYVpYcHNOejRkc3hiMzNBMHJFRFRRZHBGVE1ZcnlHaTBn?=
 =?utf-8?B?Z0dhT3Y0WUFrSHNMODBwb1ZTeHE5TXdhWTVZNjRSbW1mRm0zNm8zRWJsR0Zr?=
 =?utf-8?B?VGI1a2pMdjZNeVpnTlRYS28rSTNIdWZZbFlick1Qd2RpNDZmcldYVzM2dWdV?=
 =?utf-8?B?Wm95cXQydTlKbmRhL1V5d0p0dVFEQnpFOHVCSU13MVR2TjdBN0dWWVYxL2ZE?=
 =?utf-8?B?amRPOE9wbFYyMTNlbGJPQ1ZBZ3JNNHl1ZXMvNjltOVlwUlVNTE56c3JqL2JX?=
 =?utf-8?B?RUh5UmhQT3RQYzFMSlcrUnQ5VnlFUVhFRGxCQ1I3MG0waDNBTEN6OUR1b2VR?=
 =?utf-8?B?aHBOdVRRd1ZSQTJWY3dHVVVGdktyUFVSOVdqYjlrQTV3V2M2dWFMMy9CM0d6?=
 =?utf-8?B?UHhuSXlxdmRZc0hnaFQ4QkhTaERacFc4Z2kraUZrVndJeThTUTlZUk1oZXdq?=
 =?utf-8?B?MDBxZ3dzcG1FYSsxc3VqdmFsOXFUZVp0MWZhSEFPUSs3YnVtVk1RYklQTktS?=
 =?utf-8?B?NW9lVkZrb0RmdWNmMFJnRllvc2VQQnhNUTBNb0c2ZWNPejRJVzZvVlkrSTNP?=
 =?utf-8?B?SEM5RWxOenZkSHVONDUxSE1TMEFsUFdna3VVTlNvUDhHMnRZUWdJUy9ncTdC?=
 =?utf-8?B?Y2h3dHZndnhNMGxjUWNkSlBIYlBWZ0VEVVQ2R2Qxa00zNWNvZVkxTWNDNUkz?=
 =?utf-8?B?RGZ1dytCTHBXclpsQ1FKYkRWVWFpSU1CWUxHZVNYa25JQllMTGk0clkzcHJt?=
 =?utf-8?B?RXQyVmRXY0ZvWDRnc3FyWktNUHJxQVNMSjRmQkRzY25wTzZpOS92S2R5RkQ4?=
 =?utf-8?B?R1RqL0ZIaXhqcDQ5VWNicFFaVk1hS2xqbHlMakhuUUt5NEk4cTlZYnF5ME45?=
 =?utf-8?B?NlBFbmI3TU5MK1o2VjFqUWVXNTFPclNOYTYxbVNjZ0pRVjhBOGlmQ2Mvbndz?=
 =?utf-8?B?Q2tzU1RkU2h0TFZNcUtuTVE5aG1QcU1vMjlUVXJxblNSNk5XRGU4Y1lKa3Bw?=
 =?utf-8?B?TGpsQmJrK08xYjBoN0o0R2ZxcnZMTkh6dzZESVBrbHlQWWFENFN3aHk3dEx3?=
 =?utf-8?B?ZnVhWSthdU94cmFFbkFHdVRwa2dKeTBWQTMram4rUUljMS9ncm0xZHFUU0Yy?=
 =?utf-8?B?MGg3TlRpVGdQTndWSjh3R3AwUGxXbGJ1VmVZbUFBK1FSOFRDRzluOXIwZ2Ev?=
 =?utf-8?B?UWZjR3duWm5OdTlITDZEUWFINzFObVp1YXJrSDJBNGZHb1lWMm94VGQ4c1lP?=
 =?utf-8?B?TlNoQWE1T3NQa29hUUNwY3dkVjZKZVVlN2tBZktqczF0WUR3VStrTnBUakEv?=
 =?utf-8?B?Q1EvVytmNnpIMUNlVDNNNzhKMml0OGIyK2xYWlhnbVlaVnoyaFZJS3lkNkhH?=
 =?utf-8?B?MHl5Mmp3ZC8rZi9CeTF4bUpZK29GL0xyQTdweFlKZXVBZ3pMYTloUGtYOURk?=
 =?utf-8?B?NUdVZWcxOFZmdFZkNlNoTzRtRmN6Zk56M05JODlSaHRsMUFFbk9FL2tkVVh5?=
 =?utf-8?B?dndWNDNuZXRFaHNHRDF4UjNVSzNBM0F1b2pxcE1PTk9CUWdBQmQ1ZUcvTERO?=
 =?utf-8?B?RU5kVytUUW5TRUM0VGY0UDh2bXZXL2t1SXlWcTFZL3B2azJ4TnpDOEpGT2xK?=
 =?utf-8?B?anJjV1BMTXVpYmxaRWZLNkhZeklsay9saVdGRGVPVzJJYm1tNE4xOVFiTWNY?=
 =?utf-8?B?KzY5L1ZrS1IxdmgrL1lzUW5tNU1nRlIwcHRUMmxlb3NBNFA5SFprMjllWTlh?=
 =?utf-8?B?MFVPZXlqUWR6czB6UHFoS3h4U0VGTEVzVExlbGtYSyt2emR1KzNFOEU4VHIv?=
 =?utf-8?B?a2VORU9aaFRMSE5Jd2xZN0laYWhWSThEaDhpZ0U2TGVtWE5pS0YycHhxZjZX?=
 =?utf-8?B?U0JDOWdrUERnV0taTTk2SUtBdExheVVqWmZlVWI3djlUNkFkQ2RSSTdNMjlI?=
 =?utf-8?B?Q0FpMm91MDMrNmhBQUJoNHZOdjhabFBlemltNkw5aXd5ZHBXY0hIQW1lM3ZV?=
 =?utf-8?Q?uLPFUAcviM+DpOi6zJn1hy9B7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51cf1e08-afe4-47b0-367c-08dcfc5122f9
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8722.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2024 21:47:39.0990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4AOe2KdhRz/Wx5+CxTQhKkRf1GTSUHX0HVqlCvxJO7/4LqhSvq89jKXTBRM4zplGtmiKfgQicsOHkWRlvFJUjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7919
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

Hi Luan,

Sorry for the delay.

Anyway, I ran your changes in our CI, and overall, everything looks good.

I just have some comments for your V1.

On 10/9/24 9:34 AM, Luan Icaro Pinto Arcanjo wrote:
> From: LipArcanjo <luanicaroarcanjo@gmail.com>

It looks like your Signed-off-by does not match with the author.

> 
> All dce command_table_helper's shares a copy-pasted collection
> of copy-pasted functions, which are: phy_id_to_atom,
> clock_source_id_to_atom_phy_clk_src_id, and engine_bp_to_atom.
> 
> This patch removes the multiple copy-pasted by creating a
> common command table and make the command_table_helper's calls
> the functions implemented by the common instead.
> 
> The changes were not tested on actual hardware. I am only able
> to verify that the changes keep the code compileable and do my
> best to to look repeatedly if I am not actually changing any code.
> 
> This is a re-sent PATCH, as I did not receive any reply to
> the original one for about 2 months.
> 
> Signed-off-by: Luan Icaro Pinto Arcanjo <luanicaro@usp.br>
> ---
>   drivers/gpu/drm/amd/display/dc/bios/Makefile  |   6 +
>   .../bios/dce110/command_table_helper_dce110.c | 104 +-------------
>   .../dce112/command_table_helper2_dce112.c     | 104 +-------------
>   .../bios/dce112/command_table_helper_dce112.c | 104 +-------------
>   .../bios/dce60/command_table_helper_dce60.c   | 106 +-------------
>   .../bios/dce80/command_table_helper_dce80.c   | 106 +-------------
>   .../command_table_helper_dce_common.c         | 133 ++++++++++++++++++
>   .../command_table_helper_dce_common.h         |  37 +++++
>   8 files changed, 183 insertions(+), 517 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.c
>   create mode 100644 drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.h
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/Makefile b/drivers/gpu/drm/amd/display/dc/bios/Makefile
> index ed6b5e9763f6..0d2f7ca1d0c2 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/bios/Makefile
> @@ -27,6 +27,7 @@ BIOS = bios_parser.o bios_parser_interface.o  bios_parser_helper.o command_table
>   
>   BIOS += command_table2.o command_table_helper2.o bios_parser2.o
>   
> +
>   AMD_DAL_BIOS = $(addprefix $(AMDDALPATH)/dc/bios/,$(BIOS))
>   
>   AMD_DISPLAY_FILES += $(AMD_DAL_BIOS)
> @@ -55,3 +56,8 @@ AMD_DISPLAY_FILES += $(AMDDALPATH)/dc/bios/dce110/command_table_helper_dce110.o
>   AMD_DISPLAY_FILES += $(AMDDALPATH)/dc/bios/dce112/command_table_helper_dce112.o
>   
>   AMD_DISPLAY_FILES += $(AMDDALPATH)/dc/bios/dce112/command_table_helper2_dce112.o
> +
> +###############################################################################
> +# DCE COMMON
> +###############################################################################
> +AMD_DISPLAY_FILES += $(AMDDALPATH)/dc/bios/dce_common/command_table_helper_dce_common.o
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce110.c b/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce110.c
> index 11bf247bb180..6f8fec224b88 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce110.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce110.c
> @@ -31,38 +31,7 @@
>   
>   #include "../command_table_helper.h"
>   
> -static uint8_t phy_id_to_atom(enum transmitter t)
> -{
> -	uint8_t atom_phy_id;
> -
> -	switch (t) {
> -	case TRANSMITTER_UNIPHY_A:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
> -		break;
> -	case TRANSMITTER_UNIPHY_B:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYB;
> -		break;
> -	case TRANSMITTER_UNIPHY_C:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYC;
> -		break;
> -	case TRANSMITTER_UNIPHY_D:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYD;
> -		break;
> -	case TRANSMITTER_UNIPHY_E:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYE;
> -		break;
> -	case TRANSMITTER_UNIPHY_F:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYF;
> -		break;
> -	case TRANSMITTER_UNIPHY_G:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYG;
> -		break;
> -	default:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
> -		break;
> -	}
> -	return atom_phy_id;
> -}
> +#include "../dce_common/command_table_helper_dce_common.h"
>   
>   static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
>   {
> @@ -94,32 +63,6 @@ static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
>   	return atom_dig_mode;
>   }
>   
> -static uint8_t clock_source_id_to_atom_phy_clk_src_id(
> -		enum clock_source_id id)
> -{
> -	uint8_t atom_phy_clk_src_id = 0;
> -
> -	switch (id) {
> -	case CLOCK_SOURCE_ID_PLL0:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
> -		break;
> -	case CLOCK_SOURCE_ID_PLL1:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -		break;
> -	case CLOCK_SOURCE_ID_PLL2:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
> -		break;
> -	case CLOCK_SOURCE_ID_EXTERNAL:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
> -		break;
> -	default:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -		break;
> -	}
> -
> -	return atom_phy_clk_src_id >> 2;
> -}
> -
>   static uint8_t hpd_sel_to_atom(enum hpd_source_id id)
>   {
>   	uint8_t atom_hpd_sel = 0;
> @@ -207,51 +150,6 @@ static bool clock_source_id_to_atom(
>   	return result;
>   }
>   
> -static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
> -{
> -	bool result = false;
> -
> -	if (atom_engine_id != NULL)
> -		switch (id) {
> -		case ENGINE_ID_DIGA:
> -			*atom_engine_id = ASIC_INT_DIG1_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGB:
> -			*atom_engine_id = ASIC_INT_DIG2_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGC:
> -			*atom_engine_id = ASIC_INT_DIG3_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGD:
> -			*atom_engine_id = ASIC_INT_DIG4_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGE:
> -			*atom_engine_id = ASIC_INT_DIG5_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGF:
> -			*atom_engine_id = ASIC_INT_DIG6_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGG:
> -			*atom_engine_id = ASIC_INT_DIG7_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DACA:
> -			*atom_engine_id = ASIC_INT_DAC1_ENCODER_ID;
> -			result = true;
> -			break;
> -		default:
> -			break;
> -		}
> -
> -	return result;
> -}
> -
>   static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
>   {
>   	uint8_t atom_action = 0;
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dce112.c b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dce112.c
> index 755b6e33140a..3392277ac3b6 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dce112.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dce112.c
> @@ -31,38 +31,7 @@
>   
>   #include "../command_table_helper2.h"
>   
> -static uint8_t phy_id_to_atom(enum transmitter t)
> -{
> -	uint8_t atom_phy_id;
> -
> -	switch (t) {
> -	case TRANSMITTER_UNIPHY_A:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
> -		break;
> -	case TRANSMITTER_UNIPHY_B:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYB;
> -		break;
> -	case TRANSMITTER_UNIPHY_C:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYC;
> -		break;
> -	case TRANSMITTER_UNIPHY_D:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYD;
> -		break;
> -	case TRANSMITTER_UNIPHY_E:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYE;
> -		break;
> -	case TRANSMITTER_UNIPHY_F:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYF;
> -		break;
> -	case TRANSMITTER_UNIPHY_G:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYG;
> -		break;
> -	default:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
> -		break;
> -	}
> -	return atom_phy_id;
> -}
> +#include "../dce_common/command_table_helper_dce_common.h"
>   
>   static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
>   {
> @@ -91,32 +60,6 @@ static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
>   	return atom_dig_mode;
>   }
>   
> -static uint8_t clock_source_id_to_atom_phy_clk_src_id(
> -		enum clock_source_id id)
> -{
> -	uint8_t atom_phy_clk_src_id = 0;
> -
> -	switch (id) {
> -	case CLOCK_SOURCE_ID_PLL0:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
> -		break;
> -	case CLOCK_SOURCE_ID_PLL1:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -		break;
> -	case CLOCK_SOURCE_ID_PLL2:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
> -		break;
> -	case CLOCK_SOURCE_ID_EXTERNAL:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
> -		break;
> -	default:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -		break;
> -	}
> -
> -	return atom_phy_clk_src_id >> 2;
> -}
> -
>   static uint8_t hpd_sel_to_atom(enum hpd_source_id id)
>   {
>   	uint8_t atom_hpd_sel = 0;
> @@ -209,51 +152,6 @@ static bool clock_source_id_to_atom(
>   	return result;
>   }
>   
> -static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
> -{
> -	bool result = false;
> -
> -	if (atom_engine_id != NULL)
> -		switch (id) {
> -		case ENGINE_ID_DIGA:
> -			*atom_engine_id = ASIC_INT_DIG1_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGB:
> -			*atom_engine_id = ASIC_INT_DIG2_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGC:
> -			*atom_engine_id = ASIC_INT_DIG3_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGD:
> -			*atom_engine_id = ASIC_INT_DIG4_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGE:
> -			*atom_engine_id = ASIC_INT_DIG5_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGF:
> -			*atom_engine_id = ASIC_INT_DIG6_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGG:
> -			*atom_engine_id = ASIC_INT_DIG7_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DACA:
> -			*atom_engine_id = ASIC_INT_DAC1_ENCODER_ID;
> -			result = true;
> -			break;
> -		default:
> -			break;
> -		}
> -
> -	return result;
> -}
> -
>   static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
>   {
>   	uint8_t atom_action = 0;
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce112.c b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce112.c
> index 06b4f7fa4a50..39b199b388e4 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce112.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce112.c
> @@ -31,38 +31,7 @@
>   
>   #include "../command_table_helper.h"
>   
> -static uint8_t phy_id_to_atom(enum transmitter t)
> -{
> -	uint8_t atom_phy_id;
> -
> -	switch (t) {
> -	case TRANSMITTER_UNIPHY_A:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
> -		break;
> -	case TRANSMITTER_UNIPHY_B:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYB;
> -		break;
> -	case TRANSMITTER_UNIPHY_C:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYC;
> -		break;
> -	case TRANSMITTER_UNIPHY_D:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYD;
> -		break;
> -	case TRANSMITTER_UNIPHY_E:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYE;
> -		break;
> -	case TRANSMITTER_UNIPHY_F:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYF;
> -		break;
> -	case TRANSMITTER_UNIPHY_G:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYG;
> -		break;
> -	default:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
> -		break;
> -	}
> -	return atom_phy_id;
> -}
> +#include "../dce_common/command_table_helper_dce_common.h"
>   
>   static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
>   {
> @@ -91,32 +60,6 @@ static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
>   	return atom_dig_mode;
>   }
>   
> -static uint8_t clock_source_id_to_atom_phy_clk_src_id(
> -		enum clock_source_id id)
> -{
> -	uint8_t atom_phy_clk_src_id = 0;
> -
> -	switch (id) {
> -	case CLOCK_SOURCE_ID_PLL0:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
> -		break;
> -	case CLOCK_SOURCE_ID_PLL1:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -		break;
> -	case CLOCK_SOURCE_ID_PLL2:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
> -		break;
> -	case CLOCK_SOURCE_ID_EXTERNAL:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
> -		break;
> -	default:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -		break;
> -	}
> -
> -	return atom_phy_clk_src_id >> 2;
> -}
> -
>   static uint8_t hpd_sel_to_atom(enum hpd_source_id id)
>   {
>   	uint8_t atom_hpd_sel = 0;
> @@ -209,51 +152,6 @@ static bool clock_source_id_to_atom(
>   	return result;
>   }
>   
> -static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
> -{
> -	bool result = false;
> -
> -	if (atom_engine_id != NULL)
> -		switch (id) {
> -		case ENGINE_ID_DIGA:
> -			*atom_engine_id = ASIC_INT_DIG1_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGB:
> -			*atom_engine_id = ASIC_INT_DIG2_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGC:
> -			*atom_engine_id = ASIC_INT_DIG3_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGD:
> -			*atom_engine_id = ASIC_INT_DIG4_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGE:
> -			*atom_engine_id = ASIC_INT_DIG5_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGF:
> -			*atom_engine_id = ASIC_INT_DIG6_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGG:
> -			*atom_engine_id = ASIC_INT_DIG7_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DACA:
> -			*atom_engine_id = ASIC_INT_DAC1_ENCODER_ID;
> -			result = true;
> -			break;
> -		default:
> -			break;
> -		}
> -
> -	return result;
> -}
> -
>   static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
>   {
>   	uint8_t atom_action = 0;
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce60.c b/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce60.c
> index 710221b4f5c5..49b3c6fd648d 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce60.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce60.c
> @@ -33,6 +33,8 @@
>   
>   #include "../command_table_helper.h"
>   
> +#include "../dce_common/command_table_helper_dce_common.h"
> +
>   static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
>   {
>   	uint8_t atom_action = 0;
> @@ -58,51 +60,6 @@ static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
>   	return atom_action;
>   }
>   
> -static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
> -{
> -	bool result = false;
> -
> -	if (atom_engine_id != NULL)
> -		switch (id) {
> -		case ENGINE_ID_DIGA:
> -			*atom_engine_id = ASIC_INT_DIG1_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGB:
> -			*atom_engine_id = ASIC_INT_DIG2_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGC:
> -			*atom_engine_id = ASIC_INT_DIG3_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGD:
> -			*atom_engine_id = ASIC_INT_DIG4_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGE:
> -			*atom_engine_id = ASIC_INT_DIG5_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGF:
> -			*atom_engine_id = ASIC_INT_DIG6_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGG:
> -			*atom_engine_id = ASIC_INT_DIG7_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DACA:
> -			*atom_engine_id = ASIC_INT_DAC1_ENCODER_ID;
> -			result = true;
> -			break;
> -		default:
> -			break;
> -		}
> -
> -	return result;
> -}
> -
>   static bool clock_source_id_to_atom(
>   	enum clock_source_id id,
>   	uint32_t *atom_pll_id)
> @@ -149,32 +106,6 @@ static bool clock_source_id_to_atom(
>   	return result;
>   }
>   
> -static uint8_t clock_source_id_to_atom_phy_clk_src_id(
> -		enum clock_source_id id)
> -{
> -	uint8_t atom_phy_clk_src_id = 0;
> -
> -	switch (id) {
> -	case CLOCK_SOURCE_ID_PLL0:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
> -		break;
> -	case CLOCK_SOURCE_ID_PLL1:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -		break;
> -	case CLOCK_SOURCE_ID_PLL2:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
> -		break;
> -	case CLOCK_SOURCE_ID_EXTERNAL:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
> -		break;
> -	default:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -		break;
> -	}
> -
> -	return atom_phy_clk_src_id >> 2;
> -}
> -
>   static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
>   {
>   	uint8_t atom_dig_mode = ATOM_TRANSMITTER_DIGMODE_V5_DP;
> @@ -270,39 +201,6 @@ static uint8_t dig_encoder_sel_to_atom(enum engine_id id)
>   	return atom_dig_encoder_sel;
>   }
>   
> -static uint8_t phy_id_to_atom(enum transmitter t)
> -{
> -	uint8_t atom_phy_id;
> -
> -	switch (t) {
> -	case TRANSMITTER_UNIPHY_A:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
> -		break;
> -	case TRANSMITTER_UNIPHY_B:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYB;
> -		break;
> -	case TRANSMITTER_UNIPHY_C:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYC;
> -		break;
> -	case TRANSMITTER_UNIPHY_D:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYD;
> -		break;
> -	case TRANSMITTER_UNIPHY_E:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYE;
> -		break;
> -	case TRANSMITTER_UNIPHY_F:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYF;
> -		break;
> -	case TRANSMITTER_UNIPHY_G:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYG;
> -		break;
> -	default:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
> -		break;
> -	}
> -	return atom_phy_id;
> -}
> -
>   static uint8_t disp_power_gating_action_to_atom(
>   	enum bp_pipe_control_action action)
>   {
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce80.c b/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce80.c
> index 8b30b558cf1f..f8c66e3a8f08 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce80.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce80.c
> @@ -33,6 +33,8 @@
>   
>   #include "../command_table_helper.h"
>   
> +#include "../dce_common/command_table_helper_dce_common.h"
> +
>   static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
>   {
>   	uint8_t atom_action = 0;
> @@ -58,51 +60,6 @@ static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
>   	return atom_action;
>   }
>   
> -static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
> -{
> -	bool result = false;
> -
> -	if (atom_engine_id != NULL)
> -		switch (id) {
> -		case ENGINE_ID_DIGA:
> -			*atom_engine_id = ASIC_INT_DIG1_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGB:
> -			*atom_engine_id = ASIC_INT_DIG2_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGC:
> -			*atom_engine_id = ASIC_INT_DIG3_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGD:
> -			*atom_engine_id = ASIC_INT_DIG4_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGE:
> -			*atom_engine_id = ASIC_INT_DIG5_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGF:
> -			*atom_engine_id = ASIC_INT_DIG6_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DIGG:
> -			*atom_engine_id = ASIC_INT_DIG7_ENCODER_ID;
> -			result = true;
> -			break;
> -		case ENGINE_ID_DACA:
> -			*atom_engine_id = ASIC_INT_DAC1_ENCODER_ID;
> -			result = true;
> -			break;
> -		default:
> -			break;
> -		}
> -
> -	return result;
> -}
> -
>   static bool clock_source_id_to_atom(
>   	enum clock_source_id id,
>   	uint32_t *atom_pll_id)
> @@ -149,32 +106,6 @@ static bool clock_source_id_to_atom(
>   	return result;
>   }
>   
> -static uint8_t clock_source_id_to_atom_phy_clk_src_id(
> -		enum clock_source_id id)
> -{
> -	uint8_t atom_phy_clk_src_id = 0;
> -
> -	switch (id) {
> -	case CLOCK_SOURCE_ID_PLL0:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
> -		break;
> -	case CLOCK_SOURCE_ID_PLL1:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -		break;
> -	case CLOCK_SOURCE_ID_PLL2:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
> -		break;
> -	case CLOCK_SOURCE_ID_EXTERNAL:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
> -		break;
> -	default:
> -		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -		break;
> -	}
> -
> -	return atom_phy_clk_src_id >> 2;
> -}
> -
>   static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
>   {
>   	uint8_t atom_dig_mode = ATOM_TRANSMITTER_DIGMODE_V5_DP;
> @@ -270,39 +201,6 @@ static uint8_t dig_encoder_sel_to_atom(enum engine_id id)
>   	return atom_dig_encoder_sel;
>   }
>   
> -static uint8_t phy_id_to_atom(enum transmitter t)
> -{
> -	uint8_t atom_phy_id;
> -
> -	switch (t) {
> -	case TRANSMITTER_UNIPHY_A:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
> -		break;
> -	case TRANSMITTER_UNIPHY_B:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYB;
> -		break;
> -	case TRANSMITTER_UNIPHY_C:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYC;
> -		break;
> -	case TRANSMITTER_UNIPHY_D:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYD;
> -		break;
> -	case TRANSMITTER_UNIPHY_E:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYE;
> -		break;
> -	case TRANSMITTER_UNIPHY_F:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYF;
> -		break;
> -	case TRANSMITTER_UNIPHY_G:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYG;
> -		break;
> -	default:
> -		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
> -		break;
> -	}
> -	return atom_phy_id;
> -}
> -
>   static uint8_t disp_power_gating_action_to_atom(
>   	enum bp_pipe_control_action action)
>   {
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.c b/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.c
> new file mode 100644
> index 000000000000..44793c3a28e0
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.c
> @@ -0,0 +1,133 @@
> +/*
> + * Copyright 2012-15 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: AMD
> + *
> + */
> +

Just use: // SPDX-License-Identifier: MIT

> +#include "dm_services.h"
> +#include "atom.h"
> +
> +#include "command_table_helper_dce_common.h"
> +
> +uint8_t phy_id_to_atom(enum transmitter t)
> +{
> +	uint8_t atom_phy_id;
> +
> +	switch (t) {
> +	case TRANSMITTER_UNIPHY_A:
> +		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
> +		break;
> +	case TRANSMITTER_UNIPHY_B:
> +		atom_phy_id = ATOM_PHY_ID_UNIPHYB;
> +		break;
> +	case TRANSMITTER_UNIPHY_C:
> +		atom_phy_id = ATOM_PHY_ID_UNIPHYC;
> +		break;
> +	case TRANSMITTER_UNIPHY_D:
> +		atom_phy_id = ATOM_PHY_ID_UNIPHYD;
> +		break;
> +	case TRANSMITTER_UNIPHY_E:
> +		atom_phy_id = ATOM_PHY_ID_UNIPHYE;
> +		break;
> +	case TRANSMITTER_UNIPHY_F:
> +		atom_phy_id = ATOM_PHY_ID_UNIPHYF;
> +		break;
> +	case TRANSMITTER_UNIPHY_G:
> +		atom_phy_id = ATOM_PHY_ID_UNIPHYG;
> +		break;
> +	default:
> +		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
> +		break;
> +	}
> +	return atom_phy_id;
> +}
> +
> +uint8_t clock_source_id_to_atom_phy_clk_src_id(
> +		enum clock_source_id id)
> +{
> +	uint8_t atom_phy_clk_src_id = 0;
> +
> +	switch (id) {
> +	case CLOCK_SOURCE_ID_PLL0:
> +		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
> +		break;
> +	case CLOCK_SOURCE_ID_PLL1:
> +		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> +		break;
> +	case CLOCK_SOURCE_ID_PLL2:
> +		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
> +		break;
> +	case CLOCK_SOURCE_ID_EXTERNAL:
> +		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
> +		break;
> +	default:
> +		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> +		break;
> +	}
> +
> +	return atom_phy_clk_src_id >> 2;
> +}
> +
> +bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
> +{
> +	bool result = false;
> +
> +	if (atom_engine_id != NULL)
> +		switch (id) {
> +		case ENGINE_ID_DIGA:
> +			*atom_engine_id = ASIC_INT_DIG1_ENCODER_ID;
> +			result = true;
> +			break;
> +		case ENGINE_ID_DIGB:
> +			*atom_engine_id = ASIC_INT_DIG2_ENCODER_ID;
> +			result = true;
> +			break;
> +		case ENGINE_ID_DIGC:
> +			*atom_engine_id = ASIC_INT_DIG3_ENCODER_ID;
> +			result = true;
> +			break;
> +		case ENGINE_ID_DIGD:
> +			*atom_engine_id = ASIC_INT_DIG4_ENCODER_ID;
> +			result = true;
> +			break;
> +		case ENGINE_ID_DIGE:
> +			*atom_engine_id = ASIC_INT_DIG5_ENCODER_ID;
> +			result = true;
> +			break;
> +		case ENGINE_ID_DIGF:
> +			*atom_engine_id = ASIC_INT_DIG6_ENCODER_ID;
> +			result = true;
> +			break;
> +		case ENGINE_ID_DIGG:
> +			*atom_engine_id = ASIC_INT_DIG7_ENCODER_ID;
> +			result = true;
> +			break;
> +		case ENGINE_ID_DACA:
> +			*atom_engine_id = ASIC_INT_DAC1_ENCODER_ID;
> +			result = true;
> +			break;
> +		default:
> +			break;
> +		}
> +
> +	return result;
> +}
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.h b/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.h
> new file mode 100644
> index 000000000000..6c9246a6e4e6
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.h
> @@ -0,0 +1,37 @@
> +/*
> + * Copyright 2012-15 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: AMD
> + *
> + */

Just use /* SPDX-License-Identifier: MIT */

Thanks
Siqueira

> +
> +#ifndef __DAL_COMMAND_TABLE_HELPER_DCE_COMMON_H__
> +#define __DAL_COMMAND_TABLE_HELPER_DCE_COMMON_H__
> +
> +
> +uint8_t phy_id_to_atom(enum transmitter t);
> +
> +uint8_t clock_source_id_to_atom_phy_clk_src_id(
> +		enum clock_source_id id);
> +
> +bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id);
> +
> +#endif

