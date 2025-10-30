Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B105EC203E8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 14:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B3310E973;
	Thu, 30 Oct 2025 13:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WCbtYi4f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010067.outbound.protection.outlook.com
 [40.93.198.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B40710E277;
 Thu, 30 Oct 2025 13:32:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgT4g09qOmrBkn9MJeXEozF2WYrJIBKjWybZd33BNysyD5/lGCePaqr4lzjPfu3sVtAdra3wkGAI+9B8JmeC0o3P9Ylj8YjxzBUbwftBHqF/b8HzFsCYMnVFrb9kq871VtOlVK1WAjwn/G0uu6sonOTZr0l6Z3r1BRUI7CKjVcVkKr4ntLrDbwu4BHKUXaU7hdf5NUfm3ifM+/LeoX8p/L3iFYfNPn0VOl2nS3eVAnDNUptlv8CJ0aw9KQ2WTNpcV6LqcvXEtzwqbM7c84TxVCGpp7hV1h98ee51KD5AhwXw/A51CyyYSnsYAlaGtnI2Ob4GOonSknU8mmczE/9CFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZWoMa0vPR2c2zl+M+3+W7saQZ/7lv+mSbTXtZ4fVqc=;
 b=owNa9VxZYMaouJLnEjgzfv7MRnF0zJybsUbuPjyGvKG7Y1uXx/CTn/iJmXPD6PtMU61NMbGD96Zd8ssyCTXjWspDY6a/q8XwemyJ+OaxXTP/+BQQlxK/SUwg6/ljMWchE2qJmUdCk32hI6BvxPza2js3MLx2hnkNEFYDVx6uL58hFcIHc6sSAEw8onaJT08SoZg9JgV5aYaFHFaBZnnuJDCp10on8lBrOSqGUgPEN4UBlpMaI8LVfzXOrYiE4tcGE7XXIGOVQOdgZl48bBigC2cvj21CyiMpVNyCN2Y6+kDl6FIWioOggK8p634SragZOeX8eqDMSGMsUTo7AwbhKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ZWoMa0vPR2c2zl+M+3+W7saQZ/7lv+mSbTXtZ4fVqc=;
 b=WCbtYi4fwgUNiQ6hsaWPLT8JBFyK7iAbtfjA+eg2E9kHlavE8fVAIwHvgc9s6yGUbKF4xGur/JbpoYh6LvVz4RJWhsl5qcYNPVJj6HBAOOp/Hreg4yPJvQvCE9shJjd6Z3cFUDDZ7hdZfFal8z0vXnT1rR/1X3ixAyrsUNT3v2U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6808.namprd12.prod.outlook.com (2603:10b6:a03:47a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 30 Oct
 2025 13:32:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 13:32:54 +0000
Message-ID: <11e23ba7-d1dc-4471-b52d-a9f5eb879ba0@amd.com>
Date: Thu, 30 Oct 2025 14:32:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Take a breath during dma-fence-chain subtests
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>, intel-gfx@lists.freedesktop.org,
 chris.p.wilson@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250226155534.1099538-1-nitin.r.gote@intel.com>
 <Z8Bf9HRqOg7B3W79@ashyti-mobl2.lan>
 <76445047-a5e8-4590-8e61-5570bd051b13@amd.com>
 <vce4mknkfnycv44vrtz6dlkjylyv2ixgvfzsky6veqau4rsczk@4chlio3vhmhq>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <vce4mknkfnycv44vrtz6dlkjylyv2ixgvfzsky6veqau4rsczk@4chlio3vhmhq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0102.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6808:EE_
X-MS-Office365-Filtering-Correlation-Id: a2c3e6d2-5c66-4389-5be8-08de17b8d419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVRhYTcyTmEvcE0zRkVadEs2c01IbGIxY2VlK05ucUN2bEVmTWVmM0hPamZh?=
 =?utf-8?B?eE44am1LdGJwV2xOdFNmdHN4bENqMlNjRGRCYmV2WjNOMnhsRzJsNkZlZ2xW?=
 =?utf-8?B?VDF6SjdkK3ZSelFMcGZEbTlBTkpVNnFaTVZGMC80RnZReWp3OFVwanY1SnJ3?=
 =?utf-8?B?ZjJzeVVPd1prZlp2VVRsRFJsZWYrTWxKUmVLU2xtWHUzNk9KQjhOdWJrSyt1?=
 =?utf-8?B?aE91RXk4QUpCUmp2YnBlMHpROUxpRE5kcTdKWWxJVGlUcXZpRjF2cC9nK3lC?=
 =?utf-8?B?RjMzZm9NS3JKT0ZxcC9tbnpNbWZYZDJ4b0p0alUzM0dWWENvM0ZxOXA2UDNk?=
 =?utf-8?B?ZlBBSC9OT1ZySzJsZHJIeW1JdEFycVB1cElPYmRuNVVIR21IQ0hDdUZvZVRz?=
 =?utf-8?B?dCtLRndiV29oVWdPY1VNVUZpTGpSWG5UUHNONWs1aTNmc0c0T2NFSk82bU5v?=
 =?utf-8?B?dFQ1K2czZWhDdFhTNE9MZ0QwbkNGRmRmQ3pHMVVLcS8wSUNuZmFKdFNZSVNN?=
 =?utf-8?B?cmNvNWFhN1h2bVlFbmZnTFVJMFovZ2hzbmprK3g3aUcveFo0dmVha0llSHNx?=
 =?utf-8?B?YjI1Vm9pUU04YVFrTXNnSk5PbFBOZEpGaG9iR25xOGtpYmt2V3gramQ2aHVE?=
 =?utf-8?B?ellIUU9YUEVZWENUNW9jbkx0Lzh3UDgrbFFxd3lLdlIvYlB2YStTWjlvQVJV?=
 =?utf-8?B?RitVc0xtU3U5ZFlvWmFEVWRIRzlyczZyblluQk1VTFEzWXR1VmtVL3lwZVgv?=
 =?utf-8?B?UXBvL2RYNTZJd0c5enRwMGFCVDJMS1FNYnVVK1JlMEg2Rkx3MzlqdDdWaGdC?=
 =?utf-8?B?K0lqU0FlVXhMeHBKQ082N3hPOUJ0ZjVjdjAycWxzL2lJYXRqcWcyNWpwSFR5?=
 =?utf-8?B?U2FaVWFnTmxhQlhlM1RaV2hHT0dzY25HOUFYWGVaUndrOVB3ZURUZlRzSnlr?=
 =?utf-8?B?YWlZRER2RGNIbmJzcGlLVmlnRnNROG1XanhHUVlHNEZ1RlpORHNJbDZ5VzZT?=
 =?utf-8?B?WU5PdlRZUHIzZlRHelhYYUdpRjAweW1BcXJGV2h2VXV4dUQwNi83bU01TVZ0?=
 =?utf-8?B?S3Y0cjE5dTJUaWFoRHdjSGpobkJKWDRsUCtScFN5ZGNsMU5kbEtIVUtKSW9H?=
 =?utf-8?B?S2EyZTdRZ09PeUF4THhPcXZlRWFVTGdPanp6SmlycmRKVXRFbTdzMHlvVE11?=
 =?utf-8?B?dlQwUUt4L0F3MUwybkg4Um1BQk1TWGlkZVhzN3NyOC80eDRrd0FVemhOdjEr?=
 =?utf-8?B?SFROTFAxaHBCbmhZMXZJNE5MMTFBZjVwMVdzcFN5WVFNN01iY2JDMzV1bXJ5?=
 =?utf-8?B?Mzk5NjNKdXY4ZWd2WFpUNG9KRVZWemZicTBhVXRHTHB5NTk5aE5SWWFKZURL?=
 =?utf-8?B?bi9Ldlg0ZFIvSEJXSUsycGRRYUY5V05jcWR6UENxcmZLVW5SRkFsem5GQUZk?=
 =?utf-8?B?TStoS2w1Z29qcmZWMVJreUZLWXpVTlB6TS9kaS8wYUFDaklOY09iUUdydHJ1?=
 =?utf-8?B?U0g1ZWRkR3RCT3NBYTJPVEJrZjJlRllHc3NCSmhpcnErTlU2RUpyU1lkeTRo?=
 =?utf-8?B?d29rR21zY254TnJMTWpqTlJWOXZBQlhldXNmRE1TRGJ1clRIZXQ2bExJY080?=
 =?utf-8?B?RGdCTXVuRm9rQ0J1cnNYeWtlc3BXVWdMMEtacHRXZGZRVVBZeW9JczdocHRN?=
 =?utf-8?B?aTBKdHRIbFpMK3VxUFJQSEZqcWRKcDdCRHhiU3Fob1J4KzZ6M3o2SXJFQlFY?=
 =?utf-8?B?VkpkS29temxQSGI4WWI3SXR1WlVCWXlpTVg0LzhUVmdNS0NRN2xidzZVdUxV?=
 =?utf-8?B?eFFiM3V6TG53eFhSZDJZZmRjSkxDRHBYOXM0ejlNMmFHWnhOUmJmalVWOEFh?=
 =?utf-8?B?VE04K0NjTW5MLzk2MHhSZk9YSjljMjV1bXlRL2h0Nko2UVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEkySFprRksrTm9EZm1BbEluK3dBK3RGaksxZjZQeHNTYlIvZ2NYeE41cFY4?=
 =?utf-8?B?ajdwc2QvR2ZQVkxmazJBWVpzVEdkU2dSbVFNK1ZDOG9RY0hjZzQrYUk0bFBx?=
 =?utf-8?B?RkF6RWE2aVczd2Q3UzN0YjQzUE42U002RElTbUd6dm8zQjdUSGt6OXJsM01w?=
 =?utf-8?B?Tnhndk1nZDVoSUc5V2V4aWNGQ2htMmF1QWpZR0ZhRzF5Z2RyTERPK3lBWHJV?=
 =?utf-8?B?ZEFYZVRCN2FVSW02czkzN2NFTXVIbElyRHdqZVJEWXV1UU9vMUxVZlZuZi9D?=
 =?utf-8?B?b2ZvU2hSWFR0dGRPcXl5WUlhaUY2SEVxbkpPUWkxdS92NmwwVkF2R3pLb0Fq?=
 =?utf-8?B?ZmkwdGsydmdVdElIN2RCTG1PNG93WGwyYU9aZ0xYTnNSRkFLUkVVOUdUdkhX?=
 =?utf-8?B?N21xZkd2Yithc21iYlFmTEZMaXRRN2E2Y1QzL0xsOVN0cnBGTWR2amw0NnJM?=
 =?utf-8?B?QWVSMFRFd1JCV1p1L0t0dkNvTzBhQ0dJdmVmWTRpRzJmbDZZR3NRUFQvK0JV?=
 =?utf-8?B?UzhSK01QbEJ1bVc0Y2FRVGdBM1hyMmsrdnhpd1NSTGovK3pBOEZMUk9FRDlW?=
 =?utf-8?B?OFo1RWFqNjJqdW82bnRYU3JwQ0ZDWHRmeURWZEk3TmptTXVhMXRsN1REM2p5?=
 =?utf-8?B?SHpKZ28weWJiR3BHS1RlTGxLMzEwaWFMNnVoS1hSdEJBdHNBeFZSYXZ4KzRl?=
 =?utf-8?B?dFdMRFlBVE9ETlNPbXV1QnBvVUViVDZ4MWczdW9Lbm9lL3pkWXdyV3ZqTXgw?=
 =?utf-8?B?TFhuRmdGZndSOVdWQUg5OXdRMm5Ya01HWXRtYUhHbUFWME1nTFlxZ2NxcXpz?=
 =?utf-8?B?Q1Q4NnZTTmV0QmhiR2Zoa3FXS1lxYWxWL29IakdmZTNhTFpmUnBsZXpYVjIr?=
 =?utf-8?B?ZUM3dENnSXRoS3NTRkdVcHpVRTY2OVJPOHBqR3E2bGo5Y3dhTzRZMkl0VlRt?=
 =?utf-8?B?OURaNklvYW56RmprY3pZWG91T2xLVTgyallWSFowdE5UYklWblNKQkgvYWVE?=
 =?utf-8?B?dHQ0QWh4cFNQUXFXUFpvRzNpdUJZKzhDWDFDdysyOVBmYkFyb1k2VGE5QUYx?=
 =?utf-8?B?dXlwUUtQTTFpQzIwOFRWaDRhcG1TMXZLTzhLQUhCK0hoQ0FMc052R3hBdGti?=
 =?utf-8?B?dXlqbFRHQ3M0SXdiTXFEVElFSXhPZTlrVmlteURMbWg3VzlZNE9kdmMwcHpD?=
 =?utf-8?B?aDM3SitwYTNwbTUwOUJWZUdiSmU3dDg4ZHdtajdiQUpCWXJvRmRYcmNtLzFp?=
 =?utf-8?B?UTRLTHRSQmQ0ZGJMS0tsZG5CSHhEMlloN2FPUTB2bHdvSG1Ia3pQUE1nVkFT?=
 =?utf-8?B?ZmgzTk9sT3UzUUpTMHcvNnMwZWlhSU1nZWMzYjJtLzBYUmNLY1FFUms1RFFJ?=
 =?utf-8?B?MjYyZ08zNHpxME1lbTIvVUtSVCtqaE1lZ2UvT3VQVzNnYmJkcjJzVyt4eDNo?=
 =?utf-8?B?eTFzN0lGaDRUWklLd3BEcVF6YXVheWFDOTcybTBmNDhwZ1RIWUxHWWFGRkxp?=
 =?utf-8?B?MGNJbXF5MTBIN2hGR1RZWHhqY0c5NEVyNUZ5a2JTcXFXZWV6RGF5TlBtWTJN?=
 =?utf-8?B?aVZSTE4zZEs4QlgyZDRnNFNDbHVNeHNtc1hTVkZBV3k3OFhhUlRZdG9mR21W?=
 =?utf-8?B?ZXc2N0Zxc1J2bDZhTDhMNGlCK25pWVVFZTNhSVlBN2VvdlRLbkg4VCt4TjY4?=
 =?utf-8?B?M3NmUmxNdHZtRmJKZGdtOHg2Q1RGbDlKQ1YwNHJNWUtGQlBXWGx2NmNNalRk?=
 =?utf-8?B?bWlUa3VDZnlDVVdCbWdRNHhKSzBOaFFjUFZoYjg2QWY3dzRJK1VTWTBrTUVK?=
 =?utf-8?B?b3FqYlNjNXMwaGhtUTdYT0JjSWFlaTlBa285Qzhwb3BhZ3UyNGxneThjTDln?=
 =?utf-8?B?dWYxcjVibEZuRDBzRDEvaGw4OEJqeU9tT0VwQVlTS0NmWnJQU1ZqUGcrVnBE?=
 =?utf-8?B?WmNZRjJvakFtUlVMamE3RmRRby82UFVPc1NteFEvZE9WSXdOdFgvMVZDb09E?=
 =?utf-8?B?cDdkMHFuQmEvSGwxbC9oSFBISUE3S09UQU95TDc2VWVQUGtKVGxHb2ZzakZw?=
 =?utf-8?B?b2RIRThRVGZVQUtsVitBWmJSZlJnVUYvUCtaU0oyOGJCN2VlRUZIN2NmOGhD?=
 =?utf-8?Q?HjOXG+AmEU4DD8lKXC/cOUHw+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c3e6d2-5c66-4389-5be8-08de17b8d419
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 13:32:54.6117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bp+JthCllmaCuO6M7wy0hINO62ePf6EbcQPsyja9sHUOsMuWH499Ip+WCbSKsvWk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6808
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

Hi Andi,

On 10/30/25 14:20, Andi Shyti wrote:
> Hi Christian,
> 
> I'm now jumping into this discussion as there have been several
> patches from Nitin, Janusz and in igt as well.
> 
> On Thu, Feb 27, 2025 at 03:11:39PM +0100, Christian König wrote:
>> Am 27.02.25 um 13:52 schrieb Andi Shyti:
>>> On Wed, Feb 26, 2025 at 09:25:34PM +0530, Nitin Gote wrote:
>>>> Give the scheduler a chance to breath by calling cond_resched()
>>>> as some of the loops may take some time on old machines (like apl/bsw/pnv),
>>>> and so catch the attention of the watchdogs.
>>>>
>>>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
>>>> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
>>> This patch goes beyond the intel-gfx domain so that you need to
>>> add some people in Cc. By running checkpatch, you should add:
>>>
>>> Sumit Semwal <sumit.semwal@linaro.org> (maintainer:DMA BUFFER SHARING FRAMEWORK)
>>> "Christian König" <christian.koenig@amd.com> (maintainer:DMA BUFFER SHARING FRAMEWORK)
>>> linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK)
>>> dri-devel@lists.freedesktop.org (open list:DMA BUFFER SHARING FRAMEWORK)
>>>
>>> I added them now, but you might still be asked to resend.
>>>
>>> Said that, at a first glance, I don't have anything against this
>>> patch.
>>
>> There has been some push to deprecate cond_resched() cause it is almost always not appropriate.
> 
> Yes, there have been ideas and patches, but so far I haven't seen
> anything concrete to deprecate cond_resched() and so far I see it
> used normally. Or am I missing something?
> 
>> Saying that if I'm not completely mistaken that here is also not 100% correct usage.
>>
>> Question is why is the test taking 26 (busy?) seconds to complete? That sounds really long even for a very old CPU.
>>
>> Do we maybe have an udelay() here which should have been an usleep() or similar?
> 
> mmhhh... it doesn't look right, sleeps and cond_resched() are
> different kind of beasts, I wouldn't like random sleeps added, as
> you explained in Nitin's second patch.

This issue has developed quite a bit and is now understood much better.

The problem is that the test cases tests what happens if userspace makes 1k of submissions in the order A..Z and that the HW reports back that those submissions finished in the order Z..A.

While there can be some parallelism and out of order execution that the HW reports back that 1k of submissions completes in exact opposite order is really unrealistic.

So what we should rather do is to completely remove the test cases or at least make it somehow realistic.

Regards,
Christian.

> 
> Thanks,
> Andi

