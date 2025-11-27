Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F266C8D460
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 09:07:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BDA10E781;
	Thu, 27 Nov 2025 08:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Fpdg8Znw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011011.outbound.protection.outlook.com
 [40.93.194.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8742F10E781
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 08:07:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHkKuAz+nqznPJTfbXH7WpC7nHMQfLvF+bntNtE5TAwuHy8gs4wp37QSpDnQLN6OhcETkOxcx8JeT+nH05AW6f6vH0kgB5Ev7mjrGw+SplXs3PZYy3e6y0xuP/5ux8Hutj6RX9ougZmru1sv82nsxskigiihQReYvBCu9R8bEfXmdzJmf/JVsE1WJuqEpLJZHxmNT9iw2Bn/8tYSemYRKn+B9KcChuwy/h/8XjJrhk17VMf4uEtCprZuo0sI1sGSSbm/R1cbGkWwMi480v2NEFwzpE72WQNpvlxbnivPw4BORvgHPp8kxHXvl3oCj2fBAX2gY6lhr0KqnUtmVVgCjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tih2qnJxlY99My/GU3kHzSLia5o8n5diB9aHN4aG2jU=;
 b=AWDtnGfBmleBfsdclpJsqvvB19cw5hK5oC7qCkztraLFddLlkMcotk400ilhwiIJ6YQd1acRPQiYfod23hmi0dIhQiDGt3QhtU7cyQLwUdIIdtPbQ0dY5sdUf8lojChG23JAk5NzCxHawxh06kTnYRYH6AQIEmR4UYwV3r38M5IDYA7i5EX1DrmZHlcELv0dzaApKEAMxMEYxozSwdFZUQ4c3ROvk0EWtbraUJvhr/XPC0MgaDsCA/pKzelWvtPUesB5FnNQzZWQC4a/h3/plaqHEKOzqArHVnuS3LsG27geYixpIpPNxbXxwjOqt3uRbyGPZFdT+wFM2DdxaEbYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tih2qnJxlY99My/GU3kHzSLia5o8n5diB9aHN4aG2jU=;
 b=Fpdg8Znw/FgFlPE/NzYB11Y5zmZHlcIMWfqlNwPVp7GuNAvkJruEMD6C5puanYPSRTmFW0t78uSz8E9ZpHj+3O2Q5kB8KPuYEywjOz8rZhAPYt7WYqBw5pj8XyLes6PeFWHcAxpijufVK8q92zDNBS6RrqIfcSsu5cKOZXFuEx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB6876.namprd12.prod.outlook.com (2603:10b6:303:208::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 08:07:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 08:07:09 +0000
Message-ID: <8d5ae067-e1bf-46a7-9137-d5936197ad5c@amd.com>
Date: Thu, 27 Nov 2025 09:07:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: add no-op stubs when CONFIG_DMA_SHARED_BUFFER is
 disabled
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <6202945f4af2d10e0fb6602b25ff9cb454c1ee85.1764229204.git.viresh.kumar@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <6202945f4af2d10e0fb6602b25ff9cb454c1ee85.1764229204.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0384.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: 058c7690-0df0-4aa5-e20d-08de2d8bf6a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1FNdm1reWc1ME9ZZGVJeHNrc2hpSERqQ2llU001bzZHbTJTd2FweFIyQW42?=
 =?utf-8?B?Q2NRSmI3TnlPczhVQzk0eXQrSVFISldkZHEraU1EWVpwWG5Wc0xmMUlKcENK?=
 =?utf-8?B?RlFCM0p4SFJiTU1FQU50ZmF3Q0QyOW1sZGVVcWh5b2FBQkJUay9ZUWlkdW9k?=
 =?utf-8?B?MVZjNUYyKzhoNDl3UnJHOG5vTHpyMW9ZM3lvS1B0VjZnTkdlME05OVdCUUc4?=
 =?utf-8?B?Z2w5bHNxU0wyRElCc0JNOHZYZ2t1MzZEWXp6UFdIRWlFMEVERjN2aGdpMC9o?=
 =?utf-8?B?VThLNDBRZGFqZHBlcW02NmJndzhuQk5XWmQ0QjdSOXpQQ1BERU15Y2Z5NllX?=
 =?utf-8?B?RS96OGQ4L1hNUlgxc3RWdDVPQ2Q5eWU0Z1Rpd3FOVSt6K2QvMzJaOXE1NGpn?=
 =?utf-8?B?Z2p1VWFEOHkxeHR1bGY0S1g4VlRHcEY0dkxtVDBIcThYSXdkSUFJczBSMHBl?=
 =?utf-8?B?S2owNnRMdDFoeUhJT0tZWkgzNGM0SFNZWnBaSVI4Zy8vVi9GZENSQnRJTlFT?=
 =?utf-8?B?V0MwVXk5YmFyaml6Ym5wMGJCTHdqQVVRdzgvZW9YVmJCRWhhcnRZdGQ3REtz?=
 =?utf-8?B?b2p0ckV3OFdZWXd1aVNBOGRldUhyaG9MOXUva3MrR2FrSmFZSWpta09USVcr?=
 =?utf-8?B?NmQwcWhsU0RXL3VPK25WVWx6RzZQVEx4dFVFd0tROUxZOFFZUXo0WGltU2Fq?=
 =?utf-8?B?T01VZDl2VmtQYlRSdzZENE5keVMzcnB6akFiQlV4YmF1UmtYWUlFdUNRUWZD?=
 =?utf-8?B?M1BuMCtXc3dSTkpjMTRuTGZrOURkSm9qQnVTN3RkWDdzSHVIRXlTL0EvU3Ri?=
 =?utf-8?B?UWxPYnJsSWVoRmVHNTRGL0pxRVN2R1pkWExNYkxvalNYc0l3Uk9aei9TYzBt?=
 =?utf-8?B?YjdLNzcvQjFGeTZBUE1Na3h2blkvRUF3SEowZ1RaL2hnUWNDUlZsalYxSmV5?=
 =?utf-8?B?L1Npc0ZGM1luY3RBQW5FeWxvajMxSzZGTG90UGxkY2dJdjZxTjJRUVpId2xE?=
 =?utf-8?B?MWJnOGpuMVc2Z3F4VGNxU0M4eHp0QXY4M0RVRGszN0RleFVQM3Z6bnNveUYx?=
 =?utf-8?B?Tnlkak5aWHc1SnRUb2daQU5RZzlnOWtLQ0MvMEhMbWNWSHI1MzFRN3dVVHF2?=
 =?utf-8?B?cmpLRnk0R2dVWlFjb1FuZERIL0g0TDgxOEFsRXNzdHRubllrMm5ZRDErOFZR?=
 =?utf-8?B?NmFTY2lUdyt6bkRTWkxFRnBuWXBibVgyV2t5VmdkVTRaelRObzZBclhBdm9S?=
 =?utf-8?B?N3FVditPa1o0ODhqQlFsaXJEbWlhaWpmcTZiU0hGdldWRHJyUk5ReXJIZVVu?=
 =?utf-8?B?UFg4SFptMGZlUVlXcVB6V1c4dXN6Nmk2V0NVanI0ZWptaXJseE82V1lsVlVF?=
 =?utf-8?B?amx3NURNY2FiVG8vTTZiUGVRaWQ0K2FLOUtqa05nQVdPS0JndU43OTVBSUZ2?=
 =?utf-8?B?dCtic01ZYUZZY0g2VmdycmlPdFJlNEtFdmNnN3h0RFRYNlZJTXhoR1dSN3FK?=
 =?utf-8?B?T0V5N2haSzQ5YmpYZDFRWmMxamV3Q2hld3FJOTMzQk04M0dON1BMZ0k5Z0ZJ?=
 =?utf-8?B?MUp0QmJDOXYwRW82Sm4yOTBXeVhQdzRSTmFBaEtILzVUSHFEYUVRNWdUK1h4?=
 =?utf-8?B?N2lVR0RCVEJnS2F5WDFSYUt0WEhyMytQMnhGaEZzYy9lUE4zVE9xMVk5S1VE?=
 =?utf-8?B?bkRqV2JjS1QzdDRDQkJrSW9FbWpoclVkNE9QekJ4NGE1bHd5TVdYRXFUNENp?=
 =?utf-8?B?WmdtSnNaa0krZncvRzRwZHZGeXF5UG1ZZnB1V0c0eDA0L0ZldGk5NXozVjNn?=
 =?utf-8?B?bnowaTB0K3UxRml1TjEwRUZsR1NTN3JlZ2dwaHBTbVNWV0tsQ2VMbnRrenJH?=
 =?utf-8?B?WGQ2N1NNUm96RDduV080aXFnVld5cVp2b1dIN0ZwV2NOZjcyS0doL1prVE9W?=
 =?utf-8?Q?/2VoIymhkur5IjgcE1fakFFcQeIeJN4j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXM4SldnVno2OGlKREN0YzRBalB2T0hXdnM3SDNGenNUM2lqLzM4cDhGVFdP?=
 =?utf-8?B?cll2VW9WalpiYXRqY29YeEVrWU5ZU3cvQjZQUmhYSlNvR2gyeFhQVHo3OWo1?=
 =?utf-8?B?TC9Mb3ZoYWJqbGpJR1dWc3F1MVlTK01aeitGR0ZRR3FyZ0hreWYxekVBZk9I?=
 =?utf-8?B?em12Z0VvLy8wVEhSTmpoOEs4QzJNblI4MmVtS2xaZTRwK2FSVmYxeWFGS2s5?=
 =?utf-8?B?OVZRVTc5alFGQVVSNjd2a1k5M1gzOGxScjdhZFliNTFibnp1Rk1JOEwzbVl4?=
 =?utf-8?B?UWpxK21MN0dUK1Z6THppS01pVTVhdW5FaEg5WWFpc0dkZDZCU2l5emNkNW5j?=
 =?utf-8?B?eUN1N1ZRV1lYT0daNTQyZENuaG1QWGhmeE8rUWU2OXVOSksyUmpRZkROVHJx?=
 =?utf-8?B?eFh6RVdwQ3pYaytWSEFZU1hOREIzTGd5MzZQT2tYaityWmorNUZpbjZUYkU1?=
 =?utf-8?B?akY3WXVTU012eXNoZ090R1Z4VnpGNDA5YjY0VnUzWlZwMmVPQ0lTbTFQYkp2?=
 =?utf-8?B?UU5SdFNocXRyc3Q5TTh3QTRHODd1dThrOGQwMmJqWEttKzExb2hNTFFJbGly?=
 =?utf-8?B?TnFNdk4wdEJISzBUY1p6bTYrQWpnTnl3STJSRzJmM3Q0Um02TkVRSThtc0V5?=
 =?utf-8?B?eWoxdkpzVzFWNXJtcnVSZWVzSlR0WmdpZjlmakhhTmZ6SWV6UEVuTmVFaGFy?=
 =?utf-8?B?ZHVJYjFUTjlFVzgrTUlxZVlqaTdxVkxLM0VncjVsNS95Wk9kcTU3Wm9ibFp0?=
 =?utf-8?B?RE1pSmd0aXo2bG9MWlloUzZUYk43alZReVhVN1p3RkRtZmNqQ1F5RUpiNTZU?=
 =?utf-8?B?Si82M1gwVkdKSlBVN05TaS8xS1pZUWJ6QXlNQ0MwYkdYeWd6dS8yYkxoWVZ6?=
 =?utf-8?B?NnVPK1pJY0JPYjVZcEFuajljeDV2NHp3TjltOVVLNFdPQ1NSUUxmRERvVlhu?=
 =?utf-8?B?MWxrUmwvOVdRT2dIcmpDd0VFSzYyNXVtbExmVGsyL3ovUlc0djN3V3dKbkFu?=
 =?utf-8?B?VTk2aVhSd3Yrc1M1NEZwalFKWXNtOS83d3poZzdmTmV2YitlUkxuZkN6U1dP?=
 =?utf-8?B?M2pFUGRLWS9ZbnM1Wm5kTE5ia05rVzVqd1dnQW13L3daTk1BWWVMWnJDc2lo?=
 =?utf-8?B?YU9VSUxNQ2U4S1pFYUxmV2psUXR1YXhVaEZGWEFKdzhmVmlSUXhid3c1K0Ux?=
 =?utf-8?B?c25pT0U1cnYvbkdPdUsxbTByVGRDdnd1VkNzY3hmUzV5dFI1a1hEZWVSQ3ND?=
 =?utf-8?B?dStkcFNnZHp1aUFNU3pwZCs3bFVINkQwY3lhY2RVVE1vOHlZOTd2dVc1VFhM?=
 =?utf-8?B?WGhIaWxqSmFHWnRHbVhacjAzQ1RXUzRSaXJ4blE1d29PcGY2a0FQRzJHTHhJ?=
 =?utf-8?B?TmN3QWsrdmtiQUY0UTBzRHZEMlE5SFJ2ZDN3UnBGSTRFdGRYSFlOVjExdXgv?=
 =?utf-8?B?ZWIyeitUN3QwSWt6TWduT0xqTGNWVFcvbW1xZ0RLNGNrNHFFZWdaVExoNFo4?=
 =?utf-8?B?VXlQTXFka2RWYVVnQmNwSnZLMnJEOEhnV2g3clNhTk5CZURtZHlISzMyUVcy?=
 =?utf-8?B?d20xd1llSjExWi81aW5sQzJwZE9lS3lUWTU0QjNXVXc0RlAySEMvR2Rqa0RR?=
 =?utf-8?B?RjJRdFJyRmtVeHBJN1ZDdi9IU1I2SG9nN2NvY2w1ZkRTUlMyT21uNUw0eW1w?=
 =?utf-8?B?cnJKZnU4UE5RSnFTdTRGcHFUeXMwdWYxU3dYbGxObGEvSm5NbkZGcFdHWkc3?=
 =?utf-8?B?UFp6RUxRRnAzWXM2ZUlWN3c1bGtkNDFVRWpwTGovOFZXYWtYQkpSMGpYb3Rz?=
 =?utf-8?B?dE1oVFA1aUs5OXpLTm5IdHp6TjRqeWZFUXBHaGE1OVltUUNZbkNjNmNDRUZo?=
 =?utf-8?B?QVM5OVNDVGQ2K3gxVmpyYkQ1YVBRZEFoV0lUOWtITnpkKzJDNldEQWFKeHls?=
 =?utf-8?B?d1M4em16VXRUZEtXcEZrTHF6bmV2V0NnMzA5MGdZMXV6dHZOTjhVNEQwMEFq?=
 =?utf-8?B?K1lobHhlM3JLY1VuWkh5ZG1ad0IzcExoait5RW8wc2ZieG4rRUxURjFlb2VL?=
 =?utf-8?B?ejZ1emtOQ1YxNWR3UE5GU1Z6Mk5ibFh5YS9vV2liTnBacnoxVHpZc1JpMk5z?=
 =?utf-8?Q?kABcdQZ2zo9nPNkpY5XBD9AcE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 058c7690-0df0-4aa5-e20d-08de2d8bf6a3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 08:07:09.5987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVbLdKe9TgwJcGLNwreGFdF93QRVq3HfN7rkWrHWzSglLQHDlvWuQWsD13rgfiBW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6876
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

On 11/27/25 08:40, Viresh Kumar wrote:
> Move several dma-buf function declarations under
> CONFIG_DMA_SHARED_BUFFER and provide static inline no-op implementations
> for the disabled case to allow the callers to build when the feature is
> not compiled in.

Good point, but which driver actually needs that?

At least the whole DRM subsystem selects CONFIG_DMA_SHARED_BUFFER and others (like V4L) usually don't compile their whole infrastructure when that option isn't selected.

In other words there should be a concrete example of what breaks in the commit message.

> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  include/linux/dma-buf.h | 116 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index d58e329ac0e7..06e494d8f6b0 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -568,6 +568,7 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
>  	return !!dmabuf->ops->pin;
>  }
>  
> +#ifdef CONFIG_DMA_SHARED_BUFFER
>  struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>  					  struct device *dev);
>  struct dma_buf_attachment *
> @@ -609,4 +610,119 @@ int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
>  void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
>  struct dma_buf *dma_buf_iter_begin(void);
>  struct dma_buf *dma_buf_iter_next(struct dma_buf *dmbuf);
> +
> +#else
> +static inline struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
> +							struct device *dev)
> +{
> +	return NULL;

This should probably be an ERR_PTR(-EOPNOTSUPP);

> +}
> +
> +static inline struct dma_buf_attachment *
> +dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
> +		       const struct dma_buf_attach_ops *importer_ops,
> +		       void *importer_priv)
> +{
> +	return NULL;

Same here, ERR_PTR(-EOPNOTSUPP).

> +}
> +
> +static inline void dma_buf_detach(struct dma_buf *dmabuf,
> +				  struct dma_buf_attachment *attach) { }
> +
> +static inline int dma_buf_pin(struct dma_buf_attachment *attach)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline void dma_buf_unpin(struct dma_buf_attachment *attach) { }
> +
> +static inline struct dma_buf *
> +dma_buf_export(const struct dma_buf_export_info *exp_info)
> +{
> +	return NULL;
> +}
> +
> +
> +static inline int dma_buf_fd(struct dma_buf *dmabuf, int flags)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +
> +static inline struct dma_buf *dma_buf_get(int fd)
> +{
> +	return NULL;

And here ERR_PTR(-EINVAL).

> +}
> +
> +static inline void dma_buf_put(struct dma_buf *dmabuf) { }
> +
> +static inline struct sg_table *
> +dma_buf_map_attachment(struct dma_buf_attachment *, enum dma_data_direction)
> +{
> +	return NULL;

ERR_PTR(-EINVAL)

> +}
> +
> +static inline void dma_buf_unmap_attachment(struct dma_buf_attachment *,
> +					    struct sg_table *,
> +					    enum dma_data_direction) { }
> +
> +static inline void dma_buf_move_notify(struct dma_buf *dma_buf) { }
> +
> +static inline int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
> +					   enum dma_data_direction dir)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int dma_buf_end_cpu_access(struct dma_buf *dma_buf,
> +					 enum dma_data_direction dir)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline struct sg_table *
> +dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
> +				enum dma_data_direction direction)
> +{
> +	return NULL;

ERR_PTR(-EINVAL)

> +}
> +
> +static inline void
> +dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
> +				  struct sg_table *sg_table,
> +				  enum dma_data_direction direction) { }
> +
> +static inline int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
> +			       unsigned long)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
> +{ }
> +
> +static inline int dma_buf_vmap_unlocked(struct dma_buf *dmabuf,
> +					struct iosys_map *map)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf,
> +					   struct iosys_map *map) { }
> +


> +static inline struct dma_buf *dma_buf_iter_begin(void)
> +{
> +	return NULL;
> +}
> +
> +static inline struct dma_buf *dma_buf_iter_next(struct dma_buf *dmbuf)
> +{
> +	return NULL;
> +}

Those two are only for BPF and not driver use.

Regards,
Christian.

> +#endif /* CONFIG_DMA_SHARED_BUFFER */
>  #endif /* __DMA_BUF_H__ */

