Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F53A01295
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2025 06:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D10B10E35A;
	Sat,  4 Jan 2025 05:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L3BvkciO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3068E10E2BD
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2025 05:42:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4wXT53Cn0uXnZIkTDk9KZz10BfqpFPilp9XfCi7JeWuA7jM7WqbKL9sNeLCEnuUDhKeBwouxfaWx3petpKiMQCWUkfcq/0Cr0nPOhFVUpgN/ZYDxwg7zieW76u7G6VfVcUg/bXuPZ0IKh8UIEV/AKJ2wKCl0UPYWvcVca4ev24MAQJ3dD5Gc2upfJeromIW1Y9L0G3Jo4V+U8g6AunnNT4NmlP+7T85JAf8cdJmOU2kjlT7u+F9oNiKcn8jqYBqMbeOWCufpM0wz4FhWLhsJes+88v5axESNtFkKaisE1kKrGc+NWOEkABXL3y+YrADskKQssT+nhFrAVR/LKtXBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXzuZpXqfMP8qzfCsWWp71om9GxZ2vpLcYSwBZ8QzCA=;
 b=VQPUc+3RJanOmYEhESFdumYFasa33BZIZ6J57cCxA2meznkDVz69qlZxxRp+tGzpQoSDzKcATGo/NeeWUgOcyH/bwL83NCEUuxAHLOAuvshLgRoRvsq9QGXX3h2kyzrfCMhh7fdXlNuVs6ZMY9j5ybqfReZO1y7Ay8PwjAGKsxvA3BEPAgr9/q+lAg7q5bfrIHr5uwR3iX0LD8aABwWjVupUm9q+CrbjmcdbWJRd9F9cWAARc57S1nnbTOhCFwFqoSDSW7DXzEqKxcquRnvx1zDqVCU9/91sNLJP1mVbbcLOIn0K2owAB5+JDSRh0PL672lZK44mk4TBLpz6i0reRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXzuZpXqfMP8qzfCsWWp71om9GxZ2vpLcYSwBZ8QzCA=;
 b=L3BvkciOWj/icZA+cryj0fF5H4NOPi5EJF9wDTN2kLO/PLp0ziM2wvRFnd4VJL8JBq2/wyc1kh+OpLf1gNAWHOCr5OH8d/8zwbUcs1L+ShZgTCq2xHGo5WgcWGtmlFbdvBvTzPZQMpYMTh5vrxqhFuhL8OJl0JmLERqPWxOzDwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 PH7PR12MB6562.namprd12.prod.outlook.com (2603:10b6:510:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Sat, 4 Jan
 2025 05:41:56 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%5]) with mapi id 15.20.8293.000; Sat, 4 Jan 2025
 05:41:56 +0000
Message-ID: <aec31869-5290-4d76-be13-644a8b76e6ec@amd.com>
Date: Fri, 3 Jan 2025 23:41:54 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/7] accel/amdxdna: Declare npu device profile as
 static variables
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com, kernel test robot <lkp@intel.com>
References: <20250102212244.1586340-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250102212244.1586340-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::16) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|PH7PR12MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 693c4fb0-7db9-43b7-05dd-08dd2c82800f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXJ0b0N4ZWszcTE4c3ZYL1NzOTNoVmhWQ3FHdXVaelVEa0Nubm01YlBoSkJD?=
 =?utf-8?B?QThsN3l4dGZkaENaYTFUQ1ZTc3VCUlcvdzFqa1F1b1owYnQ5YkxBbWNlTk9Y?=
 =?utf-8?B?bmpnOHBCTnJyWWNLdXRFT2JBeUlTdTBtVHFvTVNpeFd4QmFmVHpnOHowQ0U1?=
 =?utf-8?B?ZGpNY29CY1VmdFpuZ2JDaGdvY2Y1YVhaZHlhSWFWM3NubmI2S2pWalB2UUJX?=
 =?utf-8?B?OWZmczZhS01vM1R5dDcrZTVrUzNjZE5xNkRZeW9WMG1BVEVxTXVvb1dpN3JB?=
 =?utf-8?B?K0FkaUd1ZGNIc1lha21PZEF3UklRUFNiU3liUjFSdnkyOUM3b2tTU21OZ3hC?=
 =?utf-8?B?dzNjQitqbytlRFVmWm5HNUdoclV2UDI0UE94VU1yNGFwckRvM1cyRmNHTDdK?=
 =?utf-8?B?aTVHK0hNNlNUS2RzUlFtUXBxamlXS2tDaEdYc1dYM1FEWkwxcmdjUCsvTzI1?=
 =?utf-8?B?YWNFSm0rOU9kL0JwdzU1OE5ucEltaDRrYVlWdHhFVFROdWJEL3FOc09VRWEx?=
 =?utf-8?B?UUNkNUw4cHpnQllGeVBJVGpNTXJSajRkTmo3dHZRdmpRWFE5Qys5UEs2VDlZ?=
 =?utf-8?B?RTBFOWVqb1ByWFhNSFk1R0NDTGZWeWZzYXZZOE5KbEhEOXFjRzBHN2ZlTWJO?=
 =?utf-8?B?QWxCdW5RMHZZSUF4UkRoQVpDOTVQMGQwZTRPalBGaU4wQndiVW1ORmNDUG9G?=
 =?utf-8?B?bDRNT0JmYzQ5WFFIRHFDbUxrdUtWUE9lemFnKzJNanU5ek1abGlqTVhMTG0z?=
 =?utf-8?B?YTg0TVFtVVpRRCtwNkdmckEzWFNLbkNXSU1SeUlNRWV5VU1Jc3Zrd0E5ODVV?=
 =?utf-8?B?cU5qRUFXTXM4ZVNta3hBcWI2amhqVGtvZmtONG1SNGJlQVBBaEVGUnBOc2JE?=
 =?utf-8?B?MHF5Z2VPUEtoeXNyRHVKOEVkaUNoM0dNMUtPSDJxWU9jRThubEQ3V1MrNDBy?=
 =?utf-8?B?b3FPcVUrdUh4WDhESjJabHhkamxua0hVWWY1NUNQK09DSnc5ZkdmSVpJR1lU?=
 =?utf-8?B?WWt0SGlzRHlRK2ZKTytMUWg4NWpPT2V5MmFYTXRLSmFmN0RacHZGaGYyS2FY?=
 =?utf-8?B?ai9XdHBlUDdiMndGQ2o2RGRzWDRhRzc0WTFPRjBXQnNIeGpURXBTWnhzU2Zy?=
 =?utf-8?B?NWFOT2RtVnJMbld3ZmNJd05WcDFhRkxCcXlyTnk1Rjh0Q2RzUHh0YXBkUnIv?=
 =?utf-8?B?NU5LQllGVXpGcnlVQ29IZmx3ZVNYRlM5WmdGZGl1YWpSWmVXdllTV3Iwa2lC?=
 =?utf-8?B?R1dEVWV2TCtTN0UzRjltU29nU2NTOC82M1l0ZEVhTmkwRDNrZVpVYXQrZk9O?=
 =?utf-8?B?cFRmSmRtR051bVhodEd1WnU3MEY3WFhQSStLb2d6cWw5WGRYaU9scVRjRGU3?=
 =?utf-8?B?d1BuTmVqb1Bhdyt3RG96cThiYVcwU0tKdFdMeEIyeUFYOUlFV2Jtd0NhTkJR?=
 =?utf-8?B?LzR4cnAraWhoK2pPb3lEb25qejA0Ukp2dlh2cHRiWGFGUFIwTEhqSEJtaThQ?=
 =?utf-8?B?dEVwYzNhUExJbTJiZ0s0NUhLOURpNVVJVldURi9aUUY1SWRQY1VsOEd3cmw5?=
 =?utf-8?B?TUo0VUtWZ2dHc3A3MG9WUkRaSXdMd0hxbks2UXdDU0wybEl3UGxHL0RyeStn?=
 =?utf-8?B?UWd2cHZYUTBnWGtqR1RUTmM3d093Ykxyam9yeTdlS2xIcEs3TXNGTGFpbHph?=
 =?utf-8?B?T3l4VHJyUU94QW94QlZUVE1JbVlrTDBJV25mUE1EdC9pOFJ5Ny9OWXQ5bG9I?=
 =?utf-8?B?VVpnd1dBcEE2YVpDbkdpQmZiTkVkVGN5aFJjWDNEelFWT3YvbXFvcGUwbnVr?=
 =?utf-8?B?QTQzY3NoNThTUkdGSjI1YlVUMTdja2JXSTF2QlF3QXlHWUhENis4azRhak9P?=
 =?utf-8?Q?Lp8suW8HuW/9w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6095.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3B5QW5NdkhveUREQW4vcFJaY25iTWwxcDdhRlg2K1cwdFZJL1g1VzYreThV?=
 =?utf-8?B?NE0zR3hoWjBscDZCS2VsNjh3VDlBSERXY1B3NG93ZnlzWVpjcXVCTGVBc2p2?=
 =?utf-8?B?ajJKU2lHdlNoa3huRGZUT1Q1akYxS2NBQWZzYm51WEpJa09PV3FIaEFwd3FW?=
 =?utf-8?B?SlphTEJKd21Ddkd2RlVoNkdqTkt6cEo1MHZoeU8wRGJWMzlSTGt0Vk8zenIw?=
 =?utf-8?B?NGdwalJFYmtGa2ZYQysyVCs2MTZZd3VDWm5naDZBM3l2Zk94MU9NWUZLWmov?=
 =?utf-8?B?eXlyMGhlM3pwUCsrdlJOZFZraWlLUTZ6SEduSmdoVFBYUEFrRk1uMzIySUhP?=
 =?utf-8?B?RHVkSGlPRVRndXdrTGdiektXaUwyZEY4YnJBRGJMQlhwSTZReUVya1cvU1NE?=
 =?utf-8?B?SFBMT0NaTGVPc01ObGpKOXA0ZGRMRVBNem9KSThTR3I0M3pVck4waDlvZHI2?=
 =?utf-8?B?Z1l3dUordGpyK2I0YThzdk1wUkpmQ2dQOUNqNVBaS3ZnemRCZHFTSjNhalRL?=
 =?utf-8?B?NUpoQ1F4RFBITXcwMG9ISExHaDIwbkVNVDlxR0o2eWdIMVZ1UjZKTXZyOE1v?=
 =?utf-8?B?amRQdnBQb1NnU0d2dE9aNzJ6STdxS1lVb1RUbUlrcll3eG0zd1ljdjQrdHQ1?=
 =?utf-8?B?MWl0Y2VXbUJVYnVxTlM4Wm0yNHNiL2w1OFlGZVdUZXJtM1U4YmlEaVlJVVd4?=
 =?utf-8?B?REwwbUdIcFhhVlN1Wm1sNldPK3lUb1I5NTNBZUk5M1pGeXNBSHV0aENwQ0hQ?=
 =?utf-8?B?d0psS28ycTB6QmJIVjZJczNwT0lqZzVNc0oyVTJDQVViK0xsUjhSUlovN2RH?=
 =?utf-8?B?blBlTFA0UE1NY3owQVVjWDR1Nm1aMU4zZ2NyRkRvUDNzWTFkV0VqQ0lvd2ht?=
 =?utf-8?B?SFhNRU05Nkg3V1czUmJBQ0ZOTU50aFRlelJad1ArS2ttU2pzbjlnbmN0SGJH?=
 =?utf-8?B?VHBsbXZ5WG81QTBOZmowaUZFOENtUDBpaStEQXd6eGpQUTFXSDNzZWN0Mzlt?=
 =?utf-8?B?SWJJUHJPVXVqRDRDU250WGFnSitJSkIrYjFKNnY2THR0VkpzaG5PU2UxbWth?=
 =?utf-8?B?Szdrc201Z0JrWTNnQllYM0tmRVp6eCtlbHlCSDk0anF0eDNMa2FXTEVEQlNz?=
 =?utf-8?B?YU5ZSVdKWHoyZ3pRQ2RSazNhbE1pKzd0cjZkUVlqVWUxcVVqd05acllEdnZQ?=
 =?utf-8?B?eFU1VzFEcE5VaDNCTk9CbzVzalkxcGRzQ000MzFyUlg5cDdJZTFqZXlwOXA0?=
 =?utf-8?B?NGpZSUdWRXZGNkM1QWttWFo3Si9sc2JaV01ON2IwL1ZsNEkxZGEvRTlwNVNK?=
 =?utf-8?B?WW9TT0FUQ0JDczUzQ09hTHhhVzFiOUl5UzJjWFE5MFdic3pHTXdxdXcxSk9K?=
 =?utf-8?B?SFNCcSsvMXQrQ0hMcEYrcTUzOU5uR2xCVk5sTlkrZ0dIcjZaejdWQm5GNkdv?=
 =?utf-8?B?dzBaaUt0N0FNblhPTjRJVThUcWFadXFTaUVjQ0lreHdOSEcxUzlZYSszbzkz?=
 =?utf-8?B?aGNTZ3lkdVBkdW5JWGJoZzR3UDFKS1FBcjNnWW5HMmVsOXF4RzRjb2ZnZmJo?=
 =?utf-8?B?emc0TEZjR3NJT2lJRTlJWU8yckcrZ3k3WVlBbkJzOXZ5QkE4Qi9uY2xvY0h6?=
 =?utf-8?B?dU05Q0Fpa2FrWEZsc0NSeENma09WeTlWOXJBSG9PdnE0K0ZpVmdWbWFJbWJN?=
 =?utf-8?B?SitrN1lYVmVtZytMdGdpd29jekpRSjFHamsxZ1dCcWZFU0docGhRblhHT1JF?=
 =?utf-8?B?bG1MZlNCQU5hWEt2MEZrclJJUmo3ekJlaG96cHJvK3dXS3hkb0VqaHNXZW5B?=
 =?utf-8?B?blNJUGIrSGxyaTM3WTJHUG0zWjI5Tld1aUNtQzEwaW42T1pJT1dKczZjalVS?=
 =?utf-8?B?enE2L2xHSlU3a2x3NVFRWVZCTjd6M3FYRkpSaEhyRDd5OEptVlNMTGt2Y1dH?=
 =?utf-8?B?VEcwdnZaYTdrZnJ3Ly8ySzduUEh6NG5ZNW1sTUtBOXNhZUxiZEhwYjBwcjhW?=
 =?utf-8?B?ZmFvWi9aL3hGZDhaeXc2OEZwTTFDYlN3RWVnZTNqQysweDVJenBHdXZ5VGVo?=
 =?utf-8?B?akJ3MVJ1enF5ZlZNdlloaFJ3NEJWRjc3K1o2WXA4NXFIZ2p3MXN4cUt3elU3?=
 =?utf-8?Q?dAbEgmF+Lvi/RuldoYsfUJ/No?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 693c4fb0-7db9-43b7-05dd-08dd2c82800f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2025 05:41:56.3556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SdYSxvHzz3nQnSvEDfio8bv2LCy0ov7Kz13e7rWsueJEWwhyZnwcDlfMlfQqR53Ef9taOOGc2Ji9qFWZQJyVKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6562
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

Thanks for the patches.  For the series:

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

I've committed them to drm-misc-next as well:

fee7aaee11f52 accel/amdxdna: Declare npu6_dev_priv as static
3b5bcf64a65b3 accel/amdxdna: Add __user to second parameter of 
aie2_query_status
72e487b47d249 accel/amdxdna: Declare force_cmdlist as static
1f74400529488 accel/amdxdna: Use rcu_access_pointer for __rcu pointer
c199310be29a0 accel/amdxdna: Declare aie2_max_col as static
3c8cfec3fcc4f accel/amdxdna: Declare mailbox register base as __iomem 
pointer
71486e48370e8 accel/amdxdna: Declare npu device profile as static variables

On 1/2/2025 15:22, Lizhi Hou wrote:
> Declare the variables as static to fix the sparse warnings:
> symbol 'npu5_dev_priv' was not declared. Should it be static?
> symbol 'npu1_dev_priv' was not declared. Should it be static?
> symbol 'npu4_dev_priv' was not declared. Should it be static?
> symbol 'npu2_dev_priv' was not declared. Should it be static?
> 
> Fixes: 8c9ff1b181ba ("accel/amdxdna: Add a new driver for AMD AI Engine")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412310648.dtMHgGem-lkp@intel.com/
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/npu1_regs.c | 2 +-
>   drivers/accel/amdxdna/npu2_regs.c | 2 +-
>   drivers/accel/amdxdna/npu4_regs.c | 2 +-
>   drivers/accel/amdxdna/npu5_regs.c | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
> index e408af57e378..e4f6dac7d00f 100644
> --- a/drivers/accel/amdxdna/npu1_regs.c
> +++ b/drivers/accel/amdxdna/npu1_regs.c
> @@ -62,7 +62,7 @@ const struct dpm_clk_freq npu1_dpm_clk_table[] = {
>   	{ 0 }
>   };
>   
> -const struct amdxdna_dev_priv npu1_dev_priv = {
> +static const struct amdxdna_dev_priv npu1_dev_priv = {
>   	.fw_path        = "amdnpu/1502_00/npu.sbin",
>   	.protocol_major = 0x5,
>   	.protocol_minor = 0x7,
> diff --git a/drivers/accel/amdxdna/npu2_regs.c b/drivers/accel/amdxdna/npu2_regs.c
> index 286bd0d475e2..a081cac75ee0 100644
> --- a/drivers/accel/amdxdna/npu2_regs.c
> +++ b/drivers/accel/amdxdna/npu2_regs.c
> @@ -61,7 +61,7 @@
>   #define NPU2_SMU_BAR_BASE	MMNPU_APERTURE4_BASE
>   #define NPU2_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
>   
> -const struct amdxdna_dev_priv npu2_dev_priv = {
> +static const struct amdxdna_dev_priv npu2_dev_priv = {
>   	.fw_path        = "amdnpu/17f0_00/npu.sbin",
>   	.protocol_major = 0x6,
>   	.protocol_minor = 0x6,
> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
> index 00c52833ce89..9f2e33182ec6 100644
> --- a/drivers/accel/amdxdna/npu4_regs.c
> +++ b/drivers/accel/amdxdna/npu4_regs.c
> @@ -82,7 +82,7 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
>   	{ 0 }
>   };
>   
> -const struct amdxdna_dev_priv npu4_dev_priv = {
> +static const struct amdxdna_dev_priv npu4_dev_priv = {
>   	.fw_path        = "amdnpu/17f0_10/npu.sbin",
>   	.protocol_major = 0x6,
>   	.protocol_minor = 12,
> diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
> index 118849272f27..5f1cf83461c4 100644
> --- a/drivers/accel/amdxdna/npu5_regs.c
> +++ b/drivers/accel/amdxdna/npu5_regs.c
> @@ -61,7 +61,7 @@
>   #define NPU5_SMU_BAR_BASE	MMNPU_APERTURE4_BASE
>   #define NPU5_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
>   
> -const struct amdxdna_dev_priv npu5_dev_priv = {
> +static const struct amdxdna_dev_priv npu5_dev_priv = {
>   	.fw_path        = "amdnpu/17f0_11/npu.sbin",
>   	.protocol_major = 0x6,
>   	.protocol_minor = 12,

