Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458B3C23DFE
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 09:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8173A10EAD0;
	Fri, 31 Oct 2025 08:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HxkCp65Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012065.outbound.protection.outlook.com [52.101.48.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FD110EAD0;
 Fri, 31 Oct 2025 08:44:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5poUMddNrx7yih7o+10kPoW1mv71Dmx2UbfSvTbj55H5/fbwiUwqF/DZ4yALPrYVC4aUoi/+9qwNpKWjOkhED/c7DBU+Jb/u7lqCiphnKvHSvRGUv0PvJVg8H9xkpGjEs/tFkIzmyMyaP5D+EkkScpgSVwOiELU5la73fEdQbYuXPw1mc04Emu5SCJtw+2aN+LoqvRBkZfbUSca3MPijadLr3n3h2VQynybE1c82uKYlOxwiSPqnts2lH7mZpeBvMsk4a4ZxlzhmRlDiVnrnSsmBcDL37K5euMKMcdmmxgc0GRh0/RukJOAXCAJNsSGVhvvo2X4SMmaEHSXuyX2Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEkV+5wJqJTG8BeH3ax7CyxVE0VfWi8wVk+gH33wy5A=;
 b=N/vHciXI3nB024QHpw1ObQ/DuvC5lL6dV7js3NTWBalMNsIzqjLmXNLEiSsvlZ4s/kiJUBpXfCt97aPTNeFKYLEOKvL2J+rF8I5DWenVflEF7SF5yPRYDVB8Nkjqh0a8fN9bxUK630NZGSr8atIHp/TLZzbFAg45xKrmN9bEDjPFC8yacsvqIQ91zTm4+8V8DJ6sEDsr6NrRiH+y+W26LpbvuV3YhM4vNl+BfbT1nfLZVhROKt3TPaCXw3xopk94CHHdejX0G2pNQUqy5OltcNbmgBGiOM1YR5MXxVFo/XvD5YpWgsWMzmwboL5cLCM9Fp4pNDsO6ixvyeCJ+vU5pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEkV+5wJqJTG8BeH3ax7CyxVE0VfWi8wVk+gH33wy5A=;
 b=HxkCp65QTb6E6/iEiEJo5af6KU9FMc9GiOpF7SXalsPYgcoTDOHTXbkdTN9x/iTXeVioDEvXc9vAxghqKOqgw0QMuu7iFXBO8IMlpK+q3kPNv1D72LXCsdLxZ7xPVlhhtzY5k1cSwNuq1Zk5uUTCU+zBMHjlo5d+b+6vI5auznw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4048.namprd12.prod.outlook.com (2603:10b6:208:1d5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 08:44:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 08:44:34 +0000
Message-ID: <841680ea-1086-4380-910e-8a836b711a42@amd.com>
Date: Fri, 31 Oct 2025 09:44:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/amdgpu: replace use of system_unbound_wq with
 system_dfl_wq
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251030161011.282924-1-marco.crivellari@suse.com>
 <20251030161011.282924-2-marco.crivellari@suse.com>
 <813d07f7-b430-4c95-bac3-931188415593@amd.com>
 <CAAofZF7d+t8Qqojawes8WAR2YOWz7vMtgt2y=ofJHN6mChX6DQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAAofZF7d+t8Qqojawes8WAR2YOWz7vMtgt2y=ofJHN6mChX6DQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4048:EE_
X-MS-Office365-Filtering-Correlation-Id: 21b4f6fc-7518-4f54-40ba-08de1859b73c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnJicXNFMmN3RHFiNmM1MUtlOHovaWdBUHlWalJtdE43RHNIWldjb3hYM2ZD?=
 =?utf-8?B?K2U2dzZXUDdDSUxXMHlPK1J3ZU5WeG1BQnFsWml1Y1J5T1FSVkZiYkVqajBm?=
 =?utf-8?B?cWQxTzdjUHNxMEMrYXNlK3BEc3dobVNHYVgxdTVnSjJ4Y2JQUlN6cE0xV1kw?=
 =?utf-8?B?Zkp1aEJvMk81Mit2OTdvTlFFT2twS1l5Nk1TT2RDNSt5RkEzdnZZQitwTEV2?=
 =?utf-8?B?SUFKNFhmSWJ0SmJENnFHMnd4TFdGdnFCVjRDMHN5RWlXVDlRYjFPT2V6Mm9D?=
 =?utf-8?B?T1liYUo2SEdQZmp6R0tMdmNmdmNiSG04SHZjVkRScGRPQ08zaXlIc1pPbkJS?=
 =?utf-8?B?NmpEcURLTXJ3S2pVanNLdUVoNVlFZTVaYVlhRDl2T0RhUVRuUzV0YjVWeW9r?=
 =?utf-8?B?Y094ZkUvcVhhTDNOZGRYcjZtSFB3WWpaWFFzeWczZzdZNFBVQVlsK0pTNkk5?=
 =?utf-8?B?dnovbUZwbWZLZXEzUUZBMlArczVsRDRsV0p4ZWFXamNMTElXcUpla2JvTlJi?=
 =?utf-8?B?ckxRRk1DQWt2Tk9hUThCQWZYVW4vNjlMZGdCWGxuUjZSMVlUZFBVUFdMOGVZ?=
 =?utf-8?B?YS9ydnM2d2NQbWZIQnhXcC9NVktleEhMMDNDZS9jT3IyeU5sd0Q4bERkOHQr?=
 =?utf-8?B?VklMYkpia1R2WGJRQ2VJbWJ6QjllZmxBMzdOYjZJdUYwb1FJTmJHb1p1enR4?=
 =?utf-8?B?MDZmQjlidkkyaXZTYko2QU9DOXltaEwrNmwzS0R5d2ZkbHZCUkQ2bEZ6UDBn?=
 =?utf-8?B?SmhpOUZtZDMvUmlMc040dk1OMEF1MTJvQXlqaE9ZWHBnZDNtcHZXRTBIbnht?=
 =?utf-8?B?V095b3Nvam1FSWpoK0doa1F6enFnR3VJdG1mcmxaaDRvMUJ4d294Y2wrK25n?=
 =?utf-8?B?MTJraW96UzhXTGEwWFpzajFNek5SRDg4enRLN3pHdTVhcGVUVXZld3F1RVNZ?=
 =?utf-8?B?UDVIQ0NmdnJ5VnVmd1NoT3FFQjRzWHV3OXk2U1EyTWE3WjRjRkxUMFJJZnh2?=
 =?utf-8?B?cThhWHVOU0tBTnJCZmt0U2xlTitKQ2UzanN4NDRyRmR6MExzRDZodTZla0FI?=
 =?utf-8?B?UVp6NGkwV0lxMlNodGJ0SG9QVWpjTFZMZWpnSjQyWVNrTXNrcFIvYlFGYjZv?=
 =?utf-8?B?RTZwbmw1UU9tS2l2ZkNnMklmZWw0M3paMW1xdlZ3dFZuVTFTbWZNa3BoaS81?=
 =?utf-8?B?RlI4dkdiNStGR1hYTGxCTG9OTmt6b0VEcGE3bHZJTHI0VU1WakhTMXY1TTYx?=
 =?utf-8?B?cFE4RERHNkFBLzQvWksrWWFFQUNUUmxIN2FCV3ZMQW5WSVVoSEFGTEFJT0V1?=
 =?utf-8?B?SEtuaXZHSVNERllEVm5BTTZyUTl4WDNidlB5YU5UN0U5ZVlyaHduQUppYkFK?=
 =?utf-8?B?SDlmL3U1eHZnSXJvdnZWK3MwSnJPVkIyU2JuOVJNUWt5MGZnYTVHRlM4YXJN?=
 =?utf-8?B?UlZxNWNUd0lhR0dqYlZaSXo3V050SWUyb0RzeWFVdUpkNkxXOC9lc2ZoZDF5?=
 =?utf-8?B?NlIyeWI1OHVTNHY3VTJpb1ZPcjZEUWxudExlZXNjeU5jak9qQnJIYUMzeTl5?=
 =?utf-8?B?UFR1UnJ0UERkQVRwU1dIQTdtWEFPQnk1ek9HY0I5TDEvdEt1STV2UzJiNTAv?=
 =?utf-8?B?eGp0SThhallpbnBOWm1ETUtVNVVkamNzMDFFeEErWU1KMnNEaDdTWmRvWHhQ?=
 =?utf-8?B?cys4eCtuU01jSmhSaHd0OEFFTlFacS9wWkxTcTc0dWFPSUduUzc1ZkQxdElz?=
 =?utf-8?B?SG5wdEY1QjNLTkRzamY4aDd6VW5aclVETHU2ZGpjelREZ2hLcURDZ0FFWDZV?=
 =?utf-8?B?S0VlTVI3NmwxL2g5OFVoRlNpWTJFRlFCTWxHdGthR0c3MCs0enNiaEJoU2l5?=
 =?utf-8?B?Q2JBOVNxZFlxVis2UEJaWmhLQ0N1ZmVyY2QvUE1kUW8rSEYwYXMyUklVNzJq?=
 =?utf-8?Q?OFgQrn5onixVTG2aj++jQZ9jgAPaIq3d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3BpSFkxTlVzL1hGMythOWVJYURBemhxMnlSc1g0V050Y09Oc1VEd3FLS1dH?=
 =?utf-8?B?aFlRSVBXSFZYbXAxVnoybWNSV25hQUYvbUMxbTQ0WkMzcWR4ZkU1WDZpL0pE?=
 =?utf-8?B?S2JFUzFNUU5xSWRScTlmQ1BJSTFQaXp5WXRrOVhPV3AxSDZjYi93OEx1bXJE?=
 =?utf-8?B?ZXhsRURXckQ1ZTR2SXRuUlVpU00vMTArYUo1cGhheEVESlFhZ0Q3UnNCNWha?=
 =?utf-8?B?KzZMY09zS0s3WVZOc2h3a1Y1ZC8xU0dLbHpFSDdjLzU4Tm44dVJyb2ZjTHpE?=
 =?utf-8?B?ZUthcmtGM0FaNjNaOFRLa1M4TFZHZUJUc2ZDd1Q0cmFMYmVRT0l2SWJVUnE2?=
 =?utf-8?B?YUZSZ1BEVXY1K0l6L1J4QVF2VVZhdDFYWkxRRzZtUXRxdVNrbDYvby9nejl1?=
 =?utf-8?B?L2xWNkJSdmdUV1B2dFNiNGhMWDhraUpIaFY2dmJGaFZmSjk4Y1JRYVNXZjN0?=
 =?utf-8?B?a0VKeXBtanMwREMvbDY0M0RKUzE5YjV3WXVNZ3FFQnVoYnRGWmFmdFpPY042?=
 =?utf-8?B?eWo3Y3RRb0VFRFducThiTG8vOXNEWlJXMncrUFFQOWZCdkZ3Y3pHcHZmSTZQ?=
 =?utf-8?B?Z0FEUmxRZzlvamtnNDB3eVJFazYveDlZSTV5KzlJcTBSdDE1dUZ6dnpWYzJD?=
 =?utf-8?B?aXVXK0wwMUxsN0ZFOWYwTWQ3eExtRDhUY3NVaGJIWE1wcGlZQ3orOWxlL2hW?=
 =?utf-8?B?ZncrREVBdllEejJ1MXRKcFN3WXJlZmdkWU84aVY1US9pclVkemVqU09Kb1Va?=
 =?utf-8?B?RmNlQTZpaFB2ckVBblhUaTFXU0dER080VkFCNGEzaFEvb0RRdGZObnpjNVl3?=
 =?utf-8?B?Ynp2dGx3QVhPbENxRFl2SjRVQVJKQUxrc1hQWXZtUzFWakp0NEV5b3RscHdG?=
 =?utf-8?B?dlY5NXJBQXZrbUlOdjZTMzV3RHhhYmE0YWdWUkx1UXJObGtJNTVPbHgyNUlI?=
 =?utf-8?B?Q1hmZVJXM3JNakxvWEVROVZvTnZXU3BTbHBQeU96SktIOWcvTzJwT3NkUThm?=
 =?utf-8?B?Z09HNUdxRmU4cWM3ZGFmOXZMNlloOFlJbjdYS25ZbkoxVi9VUUhiQ01JY0Y1?=
 =?utf-8?B?YlozSnJKQXYxcEJWWm9ZOVE2bXN6aFZLRDNodFpOa0JjbEc4NERBcjUyM2lZ?=
 =?utf-8?B?S0F6clljendUN0hSYUJNbnJJWGZkYWRxSEJXNHVaV3FSS0EwQkVpRys1Q3pX?=
 =?utf-8?B?d0t2K3dQaCs5a2FTK2ROS2hBTHdzdnNJbi9Za0N4RU1UcFFpYnRQYS9RYjlZ?=
 =?utf-8?B?ek9DbFd1Ym1ldW10MGtuK0g4RVBlbnB6ZWwwZUl1OTZxekpZcnBlRk8wMnJT?=
 =?utf-8?B?VjdsSjJuSWJ5WDAyU2tIVDZ6TGxyZXZzYXZFTUJFQ3NOaXJLY1UwVmRmbnkw?=
 =?utf-8?B?eGplVVMzMDZCYWpCOWdkSjI0NzE4M2w1UFd2ZWdNaG1ibTVQMjMrK2xjYUJk?=
 =?utf-8?B?eEhzc1FQeU1wR2M2VjR4aTY5WFJTdFJwaGVrL2p6NE5UZFF1Y21pNHYyM3hn?=
 =?utf-8?B?SHdZeU9CZVN6eWMrNkVGL2RqZkZMdmtsaWhZblQ3YjJnQXdBUmJTTlBYajNs?=
 =?utf-8?B?Tzg0RE9GRnVidDNSemZ3Z2EvZ1ZKanZjNStLWUJxdjhKTk9SNk1jS25kTW1C?=
 =?utf-8?B?K3hzTi81SVlIdlJJYnBwQjZrK1l4ZDR5MzZBK0xvanNoaHBHVzJDaHE4K3Z6?=
 =?utf-8?B?V2FSNlJpM0VPckkzdStZaUhIRkM2dUZZdExBVStkaDE3VnVXZGZ6WjM0eFZs?=
 =?utf-8?B?WEFyUnNZdzNtSVJRK2wvQXdiMWE1ZWVrSDdqUElFaVZ6eHlWckZlc0pNSCsz?=
 =?utf-8?B?RDUxUldaR3JYQktSbG1LNEpDZmtqRkVFSkhxbEF6ZzF0VlRHdCs1YVdxbEFr?=
 =?utf-8?B?UExsY1RQNUIzTlVFOHR2U3V1cm4zbmZqUG5BQmJzSUsrYWNkMjMwTG80SUlm?=
 =?utf-8?B?NVh3U3hPV3h0a3I0akVka2NYTU9EYTRjenQ4Q2FYclhOQzJUbTRpb2J4bVNZ?=
 =?utf-8?B?LzNHb2J4RGtmZHFFTUtPTFVFUXBLTE55M2FNMkVpczdoTDViOFRkMlo4M3dx?=
 =?utf-8?B?L1d1LzI1eUUxb2NmRnRUaDFCYVFNSU1YYXNKV204R1lQKy9BZkVuOWJra0Qv?=
 =?utf-8?Q?qlDhNYfo3kXC8nBW+jwGievEu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b4f6fc-7518-4f54-40ba-08de1859b73c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 08:44:34.1464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+NQmDjjesw9NS9mMSEyfNWiFf99+/u0vZgqHOxw4R8XFnv6DgtqmBlg0XZbjUub
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4048
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

On 10/31/25 09:42, Marco Crivellari wrote:
> On Thu, Oct 30, 2025 at 6:14 PM Christian König
> <christian.koenig@amd.com> wrote:
>> [...]
>> In all the cases below we actually want the work to run on a different CPU than the current one.
>>
>> So using system_unbound_wq seems to be more appropriate.
> 
> Hello Christian,
> 
> system_dfl_wq is the new workqueue that will replace
> system_unbound_wq, but the behavior is the same.
> So, if you need system_unbound_wq, it means system_dfl_wq is fine here.

Ah, ok thanks! In that case I'm fine with the change.

It sounded like system_dfl_wq is the new per CPU wq.

Regards,
Christian.

> 
> Thanks!

