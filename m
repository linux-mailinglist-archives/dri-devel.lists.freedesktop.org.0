Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B51ACDB3B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 11:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B75010E683;
	Wed,  4 Jun 2025 09:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gGIITc0I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2C110E683
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 09:41:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azSGvCxrFnFGLy917EN8r1aU0S/cvDdaO/MRrHlQ1vsMiYWyBlfAXI7Trxfe+5JBs/MwQMUB5c8PRT4W2BlB01q2qtFIsGvylpa8YiUjuUMZfFaHjk4dGZFb3bcUMoG5LNrarMgKcTqSdPiPexbMPKBO35OeJnSL890AGonXscV9sM3WfipRh/tRaAE66UJDUT9SdtBXU6tkNjFZ5l7gEBvxeYHquYXXipSvzdNvzaL1Coz75etUeDP30SmuVIZ3PvAn/tW3JMjsNgDLH9N0yzg1oN/hQay0vAXxi/U/FWzKu5h2H4aqhHQo41xi1lf5COKkXKOpxQwzXajZdPMEpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGEF3J08d+swR2tgj1s+awhXI5njELkPmhhIr2nmSQQ=;
 b=soeJlETQxvrAcpvZZmHG1wIcNuKM3jfBmpwZwTeh/8uDhUD21KSvbiXHAZHB55GO6VuUObtYvpx5UrVK/L/TtxHoNlhmEEDqZR4s8omTOMbRyD1c12WC73Ql3I21+lZVCsBj59aiiQ3cj8sthOrySxuw/NOTUbfDj+mCWG4nDkOcuRzSPOm0mEV65fdFZUOUsKSt7Hajlm+oyDr13uF2oFMSylw+EuiEOCi17rhe/bLO3hW9mRVe0TQp0+qB2BDQbEN4Qs3u9A6Tr858XbLo4l1EapPnCHghyMl+DaNTshuKWvcmU5y5XfTzhFiRtVt8MUsaghmtHl3Wjk5RpYk8Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGEF3J08d+swR2tgj1s+awhXI5njELkPmhhIr2nmSQQ=;
 b=gGIITc0IeIZkjRA8KHqResENqReoy48Yyd0Fmedow5tp3sAH3FzMwKEULoEsUVUb8TdzeD0y5ykWwc3Jo+V5h0x43+ccX+TV95SBK9np73fWOkYByhH3UIxj4nAjCz8AeRiFyOQ/9q8148mEMYzxR6Td25nBZLkhkIgQOMvLYps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 09:41:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 4 Jun 2025
 09:41:31 +0000
Message-ID: <7a09c357-2d28-4dd6-b637-4387cc430938@amd.com>
Date: Wed, 4 Jun 2025 11:41:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Discourage usage of separate workqueues
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250604081657.124453-2-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250604081657.124453-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0345.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ca2334d-f009-4c3c-2c8e-08dda34bfc6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mm5oeVhoN1J5cSt4ZlhRWjVxVEJjSThFLzVIM28wWndLSFZtdWtOcVgxbXVK?=
 =?utf-8?B?RjJ5WGFMcTZnSWowd09mZThhNTNkRUR4OFl2bTFSdTFqMndGc2o2YytiOUor?=
 =?utf-8?B?NnVPMlZrQStpa3J1bGk3WXhTOVh5a2puczVaMC9Na0YrSitLQ0JEd1hHR0VY?=
 =?utf-8?B?RWwrc2lsRjFkMW0yYzNlZW8yWUFIczRLUHRldUdwZWlhVVRwTWh4SmtBQldq?=
 =?utf-8?B?NG5yV1R0NTJTNG92SFdhZVQ3R0g1MVdhdVc1cVdnekpuekVWRGdURzFvWmNV?=
 =?utf-8?B?bHBEcytsNVVWdlhIS2xOcm5EMk0xc25LY0tTOFA0NHFyRFlWV3ZvY1JVdHZ3?=
 =?utf-8?B?QjdTcnloTFpVa0xsY2lwQnN1SXpVZ0NxeVlhQkt2T09ZR1VKdU02TVVLbHVO?=
 =?utf-8?B?d0t0R0VZTDlsSkJsTlh5bHBhZDRoQVpxSitUWEs0d1VRN0tYMEpzSlFSSGNz?=
 =?utf-8?B?T25GdXlVdTJ6ZDZvczZ1d2FSakpqa291b1pJY0J1d2lLVG0vQyswaU5pYzdU?=
 =?utf-8?B?bHA2Ymwzbzd3S3RlWkI5bDVFa2U3SlBZQUptQUJnVlBtOHNtUGVIN3A1S0Vz?=
 =?utf-8?B?QTBtRjJzY2Q1dFNEeW5mTmxsR1M3SWFPNG5nemhQdi9JZ2hlRWRuSzFZQ1dB?=
 =?utf-8?B?NTdaU0ZjSkNRaEgvRUpXcVkzK2hocHVIYURjTDZNTGJUT1Brb1ZOVm5Ra0VC?=
 =?utf-8?B?c2FUSG5HalNJQW1LMEQxUktHc1htT0VnOW1BcnFCd0diUnVidk5YOWh5aUN6?=
 =?utf-8?B?ZjdqVHB6YTI5T21jMlFUQmlBeVVPZjJwTEcyem14VmZsZWpnZXBtZWFHejUz?=
 =?utf-8?B?UVNTK0drRXlkdExPcnFwbFFSZEtnZ2ZZbjJERlZGWHkydUdrU0Nnb0hjWEh1?=
 =?utf-8?B?OUtGblNQRXA5TmFFYXNnSUx2VWgzcjdoeC9veEVTNUIvZE9uVEc5SzdieE5y?=
 =?utf-8?B?ZWxsR3VpOVRtK2pCTmlYbmFQM1R4SkxHRFcyajhtUWUwNmt5czRtdkZIRnoz?=
 =?utf-8?B?cnA4UUZ0UTJXQVo5TTJkQXh0aXVPcjJBQmdsU0g2bWlvNFJOT0tFbTc3aUI4?=
 =?utf-8?B?eW1Jd2Uvdk0zRUlCZkpzdUhETU1BTzNoUk9qaTVVbzlCcnlWMkNOckxYSTV5?=
 =?utf-8?B?d0RCU1BYUnhxeHRkYWdScUY2WERKd2tWR095eGc5SVhiR21XZUhQYW14SnNy?=
 =?utf-8?B?UlRQSFZtZFZObHppcXJCQXM4eHdxK0tvRWpWTGx2SEprRC9nY2tqVkZoTUIz?=
 =?utf-8?B?VHpXb3JJdFhQb3VZUHo3QUhRWXg4aUtnR2RSTHVyRVE4bTU5bUNwcHcvQm8r?=
 =?utf-8?B?ZjNEU3h5S2hlZnRFc2c0dE1SeXZvL1pYQnd1SGtwYmhhQTE1Z1VtN2M0VGVs?=
 =?utf-8?B?UmRYZkRCekx3YVBoQnh6MUJJK20yU1YveTdLVjJCblVQbVpzK05wOWdrRmta?=
 =?utf-8?B?b01hWFlFbFFGOTYzSjV3SmpOWGlkVGs1S3JMZUNGMUZrWFhVeFU4MGEwQVYw?=
 =?utf-8?B?WlhFUFJlNE10UXZnTXdpbG5KUTI5cGtxeHhRQm40TmdVVHR5cEwrS1dkdENG?=
 =?utf-8?B?NzRacXBIdE52TGdSK25SUndGZVRjdU1yUmo2TXAzOXA3MEJDU1hQcWE3c0NX?=
 =?utf-8?B?UXZ4ekxXelZBQkxVV1FUK2tCS3Jmbkp2TFI3cDVsb3ozWDc1NzF6Nm5hZnRO?=
 =?utf-8?B?cUNwTGNraGt3YmZjWVppbWs0Z1NqTW5MWFg3aEF5amxYZXRUa2V0VXZGa0FG?=
 =?utf-8?B?SWdkVjFUc0Z0RjN2UXRRT25KQnUwc09vNzlTaDhCVHZHb1Z4ZVpualM3blNo?=
 =?utf-8?B?WWRNVmFXWEtmYkV5RS9SU3RZN1NFZU1OOThkcGFZdE01Qm1KT0VCWmtmYVQz?=
 =?utf-8?B?Y1h5c1JnOEczVGswS1dJcjQ0Y2xYaUcyQ054TEdaemtkUnUzeUtQU2syUTJo?=
 =?utf-8?Q?F4+hoWYnBe4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGVzT3hyU3UvSktYTkd0THEyNkZuV0RINDdzWEl4UXpqWno2Zm5YZVpocGhw?=
 =?utf-8?B?ME84OGdKMEF0NmNRbW1LdUsvTHNuam90VWV2Q2xmZWZVdmJieDh1T3FybFpC?=
 =?utf-8?B?cVN0VXg5ZXZwcm40YnEyYytJb21VcmlJRHNIdDMzTUVTbXZ1aHBIWDd4dU9k?=
 =?utf-8?B?OWsrZDUzNHJxTC9mWGJVMjdiaEUzcXVrOVdTNmZOVmZ1ZGc1Y2pGQXhZZ1Bh?=
 =?utf-8?B?NER4YXZnVjlXSmw4SDN2S2JKdVhXSS8rTEhRQ3NTL0Q3cmpYa0dXQWcyemk3?=
 =?utf-8?B?Z2FselJlTXFJYXI4VVYwS3NQdjFRaG16TER6ZnV2NHV5cnYvd1hIbVY2OTd4?=
 =?utf-8?B?ZHgzOFg1MnVleDJUcHdwVzh0RWV3RzdJbU5uRVYyekxNcmhYVTN3UHFXM1Nm?=
 =?utf-8?B?NmRwT3Z1VWxZaVhYRG1rNXBjRlh1SGFOVjE0UWtXbHVsVHU2N1p4U3RITHRx?=
 =?utf-8?B?USs2a3V6S2RTeFB2WStEMExVVGFYN29EeGFWeTRoaVZPeStMTnZNa3YrZ2FP?=
 =?utf-8?B?dmhTbkQ0M2h2dU0vOGlRVUJaRUJYcnhoQlZ6Q1JiM1NUblpiVi9YNmlSMWJH?=
 =?utf-8?B?a3QzMFBpTkF0b2EzalNJUlJpKzlkSy84c0hCSEd0cUFkdzh6ZTVtUEV3Rkts?=
 =?utf-8?B?TXhxK2hXRWMxZVQzd0VtQnB0dDd2Qk9JbUNMaytwMm9yR3B0ejdxMVdzdll3?=
 =?utf-8?B?YlRiQTBZaXh2bCtDSUJVTnRES0c2bzVIZzIrNVVEWEMycEhsWUJua1F5NXJ6?=
 =?utf-8?B?d3AyRHovSXp0QmFtWFdtdWF0MDJjQW9sTjlCWWFnTERQbmlMRkl4WWNua3Jp?=
 =?utf-8?B?Qzd1VFkwQXQ3ZnVlK1BIUlVNV0czVjc1SEF0NXhzd1owT25BUW1KdVlRRFd6?=
 =?utf-8?B?b2xVcEVkYlNNa3J0cmE5MWdTdGdRVTlqM3l1TnZMR1duMEM1MkZMdFRHbnp3?=
 =?utf-8?B?OFpqSTJOeGtGVkI5OTJTWEVoUnJnMkxWS21GYUczTXBiMDc5akFXY1Erc1Mv?=
 =?utf-8?B?cXJTcVlqOWdSRm1UMmJZRVUzRDBGK0Vta2pua2RaN3A4b1BDUWE2Uk5tb3Zh?=
 =?utf-8?B?MmgvUXNKdUJQTmJISWZhRUtIL3BHTjR3Uk9wekZJSUlJK2oxa1Z4V29BODdY?=
 =?utf-8?B?Y2d5d3VmOUpUdlA3QlBJL05sejlqTkFKTktlbTI4TlR4c0djd1FlZU16RVlY?=
 =?utf-8?B?anZiNnluM25WWHJDeHhvVXlvL1kveFVWMG43M2JUMWRTOEFub0NOZlNJRm9v?=
 =?utf-8?B?cklORjlEVEJabG9zZWs0YjF4WWh2TTVaakpvN3ZucjRMVWpLdHBMSGZLaWRK?=
 =?utf-8?B?TVRDbUZQNjJEYW9WdU1WSXhEbmg2ZmRVQzBqMnhzYU9pZXlrT0xNd3FJdjdT?=
 =?utf-8?B?YVlPZzVHWWplK2J1R0JLQ3Rva0Z4QkhIQVJVK0k1bEJzYTFFNjIwbVpIbGVr?=
 =?utf-8?B?TCtZUWVDTjFEdmMzSHFmZEhTMkRmSnJISDMxSms1VVA5alcxUE4vYVlCMldV?=
 =?utf-8?B?TUFvWUhlQ3RMQUlmbHZ3YkZxaWk0K01FemhHb0ZTUGFlM2R2VTZRUEZmNldr?=
 =?utf-8?B?YnRPRmwwdWN2VGlldkpiTlB3N2hkcy9POWt1ZG81d2t5aEVmdzR3MFcvYVhq?=
 =?utf-8?B?cTM1UHR3M2VVeERNbnpaeVZPblYyZGJjRDdqbXhiNmEyV1BKYk1wYWFSL2Va?=
 =?utf-8?B?VnpZYzNmZWdZQ2dJQzg1NlNlb3E5NStmYXduZmxSOXBPZjlIeUVYZFNOY1Jq?=
 =?utf-8?B?LzZzUjRxYmtUVG5KQUZpYi9naWFrUUdWWlVtandubDYrTzVTK2J0aVNMeURQ?=
 =?utf-8?B?LzFKME1iMllSZG1nSWdlVHYralJBRGF0SGpkNWhsQno4MTVNK2h6R3pHUmN2?=
 =?utf-8?B?a0N4N295S25BS09WYzFyNFgreXdXQXpYdCtGem4yamdLV2U0NW9FaXRrd3E1?=
 =?utf-8?B?YUN1MStlTkxMU3R6cndWem1mMlp2NXplY1dDZmtxcmltZ3dJSkJyN3Vib3F3?=
 =?utf-8?B?VGRhS3I2WEpuOVlBZG5aakw3ZFo3TlVJM2NRV0VsckNkQkdCYTd6TWVVY3pZ?=
 =?utf-8?B?OTlxbHZQQ1RrZmZEMk1BamNPd252c0RiWW80ZHlPeTRPRjZrYTBTc3BQN29z?=
 =?utf-8?Q?5WZPooyBwuXteBIo4mIlaRRZB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca2334d-f009-4c3c-2c8e-08dda34bfc6f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 09:41:31.1211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rE7IzPoOXFPXV8HomG+mo53BAY19YX17y6dgm+gugTgAKO5EIGmSDPzFnV3T6Dhk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375
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

On 6/4/25 10:16, Philipp Stanner wrote:
> struct drm_sched_init_args provides the possibility of letting the
> scheduler use user-controlled workqueues, instead of the scheduler
> creating its own workqueues. It's currently not documented who would
> want to use that.
> 
> Not sharing the submit_wq between driver and scheduler has the advantage
> of no negative intereference between them being able to occur (e.g.,
> MMU notifier callbacks waiting for fences to get signaled). A separate
> timeout_wq should rarely be necessary, since using the system_wq could,
> in the worst case, delay a timeout.
> 
> Discourage the usage of own workqueues in the documentation.
> 
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  include/drm/gpu_scheduler.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 81dcbfc8c223..11740d745223 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -590,14 +590,17 @@ struct drm_gpu_scheduler {
>   *
>   * @ops: backend operations provided by the driver
>   * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
> - *	       allocated and used.
> + *	       allocated and used. It is recommended to pass NULL unless there
> + *	       is a good reason not to.

Yeah, that's probably a good idea. I'm not sure why xe and nouveau actually wanted that.

>   * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORITY_COUNT,
>   *	     as there's usually one run-queue per priority, but may be less.
>   * @credit_limit: the number of credits this scheduler can hold from all jobs
>   * @hang_limit: number of times to allow a job to hang before dropping it.
>   *		This mechanism is DEPRECATED. Set it to 0.
>   * @timeout: timeout value in jiffies for submitted jobs.
> - * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is used.
> + * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
> + *		used. It is recommended to pass NULL unless there is a good
> + *		reason not to.

Well, that's a rather bad idea.

Using a the same single threaded work queue for the timeout of multiple schedulers instances has the major advantage of being able to handle their occurrence sequentially.

In other words multiple schedulers post their timeout work items on the same queue, the first one to run resets the specific HW block in question and cancels all timeouts and work items from other schedulers which use the same HW block.

It was Sima, I and a few other people who came up with this approach because both amdgpu and IIRC panthor implemented that in their own specific way, and as usual got it wrong.

If I'm not completely mistaken this approach is now used by amdgpu, panthor, xe and imagination and has proven to be rather flexible and reliable. It just looks like we never documented that you should do it this way.

Regards,
Christian.

>   * @score: score atomic shared with other schedulers. May be NULL.
>   * @name: name (typically the driver's name). Used for debugging
>   * @dev: associated device. Used for debugging

