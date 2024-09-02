Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908F39689BA
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 16:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9620110E30F;
	Mon,  2 Sep 2024 14:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NyH5pP7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C923110E30F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 14:18:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZECGuxJdQeqjlzLPRQHQZ4sw5VRCZQ20OrKW1kfwQGegTADNsyhA4QLruiP+bmI+weKuFdwAHB4USLXA7tFpvaEnFhX7kJYXZ7+mXRMev65e2wTvs3cQ60AJCybWP4PVhU6ZA/UgHiyD1woQ4dM4hAmOptM1ME33XAPUgZYB8VIXmF4m11haqUEfB12AOC3/szIh7ASrdNGbbtAgxhV9RkvSOX69oG8bKn4YVEQiWb97Mt3nVk9KMjta/NPq3pbrjz7J08hVogBHC55Qz4eJ1+04xyJPDe5kzwQEsH/ILx0TlVPQ+goiOWnIUY8iaqZyjGNsOrxn0B3qrmLNwuBNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+zeijo/qt/9nP755Krs0oynkQ5zbD8UmNt393P/svI=;
 b=fj+LttUiB7ZOBXgrVBkQvVlxlMnjHTVBt/AKugFAQeXi4pvOUS1p2GPk6drRQhjSo4U20PMUaYvrb7kVJApOBnUIzsMGX9ETpKNAgqqbvcNI9kg2KF2mbU6ouAg6lOKh48uwuommJbkXWBk8uYwYW+Qw+nuMjueyZmDQmTaLnq60dIafp2ivHaX0sCyGIIvJyWYmMON1bMNhgEpWXQXOlZi2wx/y071qqckzjveSr5A/Xpb0gf405oAxPS9+7VX6DOpIQDrdOk1D4Ybs/qQKF7x1t3VG1wuwO3tdHEexh6MUnPnjI/xezP6Bl9+pUyuSM4Rmjxbz4UDWZ1BVdzwYRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+zeijo/qt/9nP755Krs0oynkQ5zbD8UmNt393P/svI=;
 b=NyH5pP7J9jtD4RIPtRHDd8a9XxmIflz8OR0UBxXHf1rzlUa5L2GHenI6wuAx/lI3DtV+dWNUprCMqNPi/kjHrGoYzhJhnZvOLiyMsJFFfRzmeaTAl0DA8IwloDj3pRXQyk2KWXVUgiJGS7VI5vM7gN+uLmfBUnh7bjqTxKrv4i0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5977.namprd12.prod.outlook.com (2603:10b6:208:37c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 2 Sep
 2024 14:18:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 14:18:39 +0000
Message-ID: <b6185b8e-148a-494e-a336-e4290c38b700@amd.com>
Date: Mon, 2 Sep 2024 16:18:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/sched: Fix a UAF on drm_sched_fence::sched
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 kernel@collabora.com, Luben Tuikov <ltuikov89@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>
References: <20240829171238.609481-1-boris.brezillon@collabora.com>
 <bdc018b8-3732-4123-a752-b4e0e7e150dc@amd.com>
 <ZtI9EMzHZW3DkHw/@DUT025-TGLU.fm.intel.com>
 <710b6946-ce8e-42ed-8df6-aa76bf0d5f3f@amd.com>
 <ZtW8aiIhBA5KBLR6@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZtW8aiIhBA5KBLR6@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0240.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b714524-a1ca-493b-1e86-08dccb5a23e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWJNTUlVUllPTW5sNXI5NUk3RHFFeU1hUy93SmtuRTNHamdNQXNYc0dRRHJC?=
 =?utf-8?B?YXBNdm1YV1orLzd5cmZUSjN4dXQ0cCtTaW5uYWdXVUFHZDRJR1BEZW5QMEZK?=
 =?utf-8?B?WGpRanhlTWQwS3l2ZGFGeWl6eFN4QmFTL0ljVDg0aE5XNDlpZi91c0JSU2Zz?=
 =?utf-8?B?ak10c2dyNml6dE1HUE9ralpvQmJlR2FiY1NFODZUaWYybUY4SDhuclhCSGI4?=
 =?utf-8?B?VUo2VXNqY0ZXVG0xTkRNYStGbVUySU02cy82d0tNQ3NxMjVaWjB3c2JOZWp0?=
 =?utf-8?B?SGJtSXRtbWI5K1lhdjRRbExSNCt0OURZYUlTWDFlbE9FSEx3RnhzUzlTa3dk?=
 =?utf-8?B?ZERBOFRQS2U3a2pBaVVjWS9YUE5WTUloaEY2THN5SW5sSTRPMFJuaEpjdnFR?=
 =?utf-8?B?OTJMUUh6bVAvVmRoVTBKcFNWSHZBc2pzVTRYaWdBM2N3T3labUtCekhYUXlP?=
 =?utf-8?B?eUllK3dSSjlOTmlUYUV1cUcycllTNWFFY2c2MDE2cDdtSi9qeUY1NFhRT3VD?=
 =?utf-8?B?MEhLVDNXS1kwWmk4Q0h3bzJPbjREbXJDamc1eFRWTE5QVzVuZkJoajJJRkdD?=
 =?utf-8?B?bGpFcFN5TDdEdWlTUFBYNEJBbjFkZ1NzNS9KK0tPajNOcnFYVlI0ZU1jM3pv?=
 =?utf-8?B?eVFCbmNSY3RnNXhiSXBsenBGOHMrRkFnbnhZWWcxRVIyNkhrcllRaHdmZlg0?=
 =?utf-8?B?QTNVU1R2RHRFUjdCaEpIcnRNU3k0RDAwSlRUWTJjRUxQZHphSU1yRE9DNmc5?=
 =?utf-8?B?MmFNa3V2a2JYN0pCdWtyam1KUGRjT1dyL05MVCs5cjdKbkNPckpZRjRvYS9V?=
 =?utf-8?B?ajNqUXZDb1hYZ2NLR2l6STdhZXlwQldEOHVNeDdHK0ovbU53V3VOeTA4K24r?=
 =?utf-8?B?YjNtdG4wR0pwNFRLdmpwZjBPS1FEWkJ5SXhHSElnZ1NPa2JSak8wZkNPQXNL?=
 =?utf-8?B?S1U3NjFYdWo5MFlzN09BcEszUy9DQWRoVXhySmFWVi8zOHorTVVVbjlNY1Nu?=
 =?utf-8?B?OVRYUUtudXpGZTVDUEg3ZlhUbjVydkZicnNEMS96YlRyOEhhK3k3blRBTUJ0?=
 =?utf-8?B?bnFyZElidldTNktTYjQ5WnVsWWxvSVpES0pYemZZK1lnYlVVWEpHdHhkTEhh?=
 =?utf-8?B?b1pzbkszcitINzJhdE9pbGJaVEp1YzhuSzlJeDBJbHNGYmJWTlJpSU92Skw4?=
 =?utf-8?B?a2VUQUFjOThvWnFtTTd6RVkwTkJxSUl6STdxTWpzSXdFazNuTzlHbTdYWWx2?=
 =?utf-8?B?Nm1BcDJLVTI4eTlFZGt6TjREYU13SmwreHp1bUkySVEvWVRFRGY1WCt4LzVp?=
 =?utf-8?B?Tmp3RmRrdElwcldUNDdiZ29OSmsrTDIxWGVYN2RzVXRPNW95NXVCWmFyOU5w?=
 =?utf-8?B?dXFGUWlzbzhsdjMvY2dYOThsbE14UGgwdHluVmJwb2xUaFJFdFM0SHV1MGdC?=
 =?utf-8?B?cXRmTjE3QndtVGZiVFNBQTRrc3hUL3YxM0oybVNQNmlUczg4UGZ0eVFCY3ZW?=
 =?utf-8?B?a3lKalJLZW5ySElnZTRaU3F0VUpLRWtJT0xuQjBOSFBjUFdFUTZTdGVKTE5U?=
 =?utf-8?B?OGxXaVZQSDNXd0FRd1d3dG5qOTZiQUpkZGNad0hkNWNVd2FIUFJ5R2hzamhj?=
 =?utf-8?B?UzBEVkQ4MXRxZlp1M21Zb2lNTXNiRUpFYmJ5R0hpRjRlZWc4Ym5HQTd3YkhO?=
 =?utf-8?B?MFdFajZPbUlsbWJEUTZDeHl5Tk9IUGZkZnMySnBUeUJkRGVPMTBVeVh0RmdY?=
 =?utf-8?B?Y2VEQjZVTjNnd1YvVkZIUWVxalZQaUxnNWxLOVQ5ZXdDdWFZejhHcFFmMW1P?=
 =?utf-8?B?K2JYSCtFTWQwZ1JzTkxTQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnRJcytnRDhPdmFZQVJ6TU9YZWFTbXdtVTg4MTlIOElxWGQ2OElhNFYrblhp?=
 =?utf-8?B?M2RhdGNIZkR5V0lTMjFyLzVyU1JmVzNMcTlLQUxOVklUSlFnbmp0eTd5S2hU?=
 =?utf-8?B?d3I1QmViMjh0cGtHU3NCUWxNR1VTenpxWTBFbU1FWEhpQVlFc2xpeElWWnYw?=
 =?utf-8?B?TFZUWEMzWFhYaXVOUzkvSEswbHNnYXVtUnNkcHpNWjlVT3J5NEVTN0NMeVlY?=
 =?utf-8?B?Q3RBZkZMbERHK0JpUzV2WFBtNFVKZDdYOU9EL3pIS1d6SGhmb09TQWdaeTZj?=
 =?utf-8?B?VW1GLzJvZXdGSXdYNjRXbnJncUhleUlSbWdpeVhyRUtFN1lPaUF0Y01zdWNu?=
 =?utf-8?B?L2wvOFhIOU5Vc3d5V2J5c1dPcXFLVi83bHVVVml0UDd2UGpLWlAyWmovYTNH?=
 =?utf-8?B?OTg5YUl0WWNsUXc5Vmx6SFhuRWltcDZqRkUrMVh1RzB0cFZnekRPeEN4elZa?=
 =?utf-8?B?MDBVR1Nic2NEQ29UY3E1blFzWHBNR2loL0ZURGRHd09IOTRPdzNLSDI5ZzN4?=
 =?utf-8?B?ZytWQkZnUmlOWkFrS3B4WklDamEvemgvRTFzU1o1RG52SEtqdk5OeWNHS0VG?=
 =?utf-8?B?R2RieWgzWWFNNWZrN0VpRmcyMU53SE1WTHdpZEhJaXdHRHRvSVgyZkxBOWpm?=
 =?utf-8?B?WkQ5a010bUo2ckJjNitsTlg5dmQ0Tnh3ZTdwMzEyd2xGZkNMZ00vSHUwdUdz?=
 =?utf-8?B?N215d2RHc2xXL25ybmdxOGZiSFJBZVRPRXlmMC9ZOTF1c0lIMVNvNjh6ODZQ?=
 =?utf-8?B?SkNWWHhneURGNmo5SS83QWtSWTdVZTJWOW9vem5UcURJWmw0MktDOTM5b1JD?=
 =?utf-8?B?SDg3M2N1OERuTk03VjZycnYwdVI1N2JxQk5mTG9sN3kxY3ZRS3krUHRUWTRk?=
 =?utf-8?B?QnpoNGNXaXpBNndnc0wra2hVclZMZTNsYTRHUElwT3llN1l0L1VpZFVNYXAw?=
 =?utf-8?B?Ky8yMGJONDVPOW5XMk1NNExmWS9kaEl1SXNSbWVHOFBmVUpURVNjRWZqZnFi?=
 =?utf-8?B?MHJmTitKNWY4MkxrSk95UDBhanM3MVpIRmpCMWlTVzZibFlWQmJNeGUvc3Ax?=
 =?utf-8?B?WEdKQi8wV2NnMUd1WVRjR3dnSW5rd1ZXVkxzUE1IanV4c1BjbnpBbEp2Nkt4?=
 =?utf-8?B?a05LM2pySGp0aUhmM3dRMGFjRVkyY0pRRVYxNGpGbW1lYlMxeDJyUElsYm9r?=
 =?utf-8?B?OVVCQzNiWnJONXdwejJ4cWk3Ym1yOGdUMGlWanA2OWpyOUxMSmM1bXFCTG1E?=
 =?utf-8?B?dlhIZlNnZWFqSkpONDZFZmdlUzh2QkJPYjRqUjh0N3JSVHk0dTBrMjdzVmZI?=
 =?utf-8?B?aU41QmJkdW1yeWdhVlZYZnBFaTNIZmhGTHprSmZlc0RhQTdYOWw2K21INS9D?=
 =?utf-8?B?TmlKZjVSOUdBcTJmOVlwRGlLRjBBeWlid1JBczkvSGF2c1N4WEFPOUJtSkY5?=
 =?utf-8?B?M3dHdEc5eCtHN09YVjdGYkYwckJxTWhqYkpVS1VZcVlDR0tLQnNQSzYzaEl2?=
 =?utf-8?B?QmFGaFJiK2JzbFA3MmYzWG1lWllJdFB2RStOQmtpRUNXd1oxUklyMEEwYk8x?=
 =?utf-8?B?QjNZQVROYmNvb2FkV25pVW5jaUdwTGNnVjRiaER1eDRWQ3lyVCtvZldQaVY3?=
 =?utf-8?B?SkZldGhjVUJ5bWNVZVhCamNCYjN4OTlEd2pLVFhKdkdpREV1T04zU0hWdGxa?=
 =?utf-8?B?S2xneVk4VitzZHdqNlFCVFZ6UUNBQ0pFa0RDVEYyYlkvQWRZajRrVlh6VnJU?=
 =?utf-8?B?SHFYVmRDc3NmNmo0VDBwY2E2V2JOc3U1a2FodngwbEljbU5BNVUycnI1Wlk0?=
 =?utf-8?B?MUQxVUlhR1AvNllhc0ptYmFwWEVSb1ZJamwzTXkzYUJ2VzlaM3dwSjBidDdY?=
 =?utf-8?B?UUpSUUFsaDErWFpFNFcvczdZQ1owNzZMdW11QVQ4MW1PMVZEMGdsNFVUOVBv?=
 =?utf-8?B?ajlXVlVEeE96dExENW5mN3NCcCt4ZkM3RmhhWjhabFZIQkJWK1JxenV0Z1Jt?=
 =?utf-8?B?dzUxK1RXUm5xYXRWdXZFQ1VmaWwrVk5EQzFyRXNka3NUU0E4UktPaElQdWJN?=
 =?utf-8?B?S1gxR2VqZVNRa29VdnZycXdiREw5TUJ6ZHI0RzNORjg3UzNSY1FrcnZSVkcv?=
 =?utf-8?Q?FT/A=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b714524-a1ca-493b-1e86-08dccb5a23e2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 14:18:39.0558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fa7j4yULMeKe5q2w54XlGnj6gkufcueB1Af1Agljr2aC6bqb6eoX/kaqb/oDsCu7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5977
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

Am 02.09.24 um 15:23 schrieb Daniel Vetter:
> On Mon, Sep 02, 2024 at 12:43:45PM +0200, Christian König wrote:
>> Am 30.08.24 um 23:43 schrieb Matthew Brost:
>>> On Fri, Aug 30, 2024 at 10:14:18AM +0200, Christian König wrote:
>>>> Am 29.08.24 um 19:12 schrieb Boris Brezillon:
>>>>> dma_fence objects created by an entity might outlive the
>>>>> drm_gpu_scheduler this entity was bound to if those fences are retained
>>>>> by other other objects, like a dma_buf resv. This means that
>>>>> drm_sched_fence::sched might be invalid when the resv is walked, which
>>>>> in turn leads to a UAF when dma_fence_ops::get_timeline_name() is called.
>>>>>
>>>>> This probably went unnoticed so far, because the drm_gpu_scheduler had
>>>>> the lifetime of the drm_device, so, unless you were removing the device,
>>>>> there were no reasons for the scheduler to be gone before its fences.
>>>> Nope, that is intentional design. get_timeline_name() is not safe to be
>>>> called after the fence signaled because that would causes circular
>>>> dependency problems.
> So I don't think knowlingly crashing in debugfs is ok. debugfs can break
> stuff like secure boot, and if you go about things very wrongly it can
> upset the kernel (like touching pci mappings from userspace can). But just
> going boom due to a race essentially means debugfs is unusable. Because
> there's no way to avoid the boom with dma_fence:
>
> - they're guaranteed to signal in finite time (unless driver bugs)
>
> - the moment they've signalled looking too closely at them is undefined
>    behaviour.
>
>>> I'm quite sure happens, ftrace for example can and will call
>>> get_timeline_name in trace_dma_fence_destroy which is certainly after
>>> the fence is signaled. There are likely other cases too - this just
>>> quickly came to mind.
>> Good point, completely forgotten about ftrace.
>>
>>>> E.g. when you have hardware fences it can happen that fences reference a
>>>> driver module (for the function printing the name) and the module in turn
>>>> keeps fences around.
>>>>
>>> I am almost positive without this patch this problematic in Xe or any
>>> driver in which schedulers are tied to IOCTLs rather than kernel module.
>>>
>>> In Xe 'fence->sched' maps to an xe_exec_queue which can be freed once
>>> the destroy exec queue IOCTL is called and all jobs are free'd (i.e.
>>> 'fence' signals). The fence could be live on after in dma-resv objects,
>>> drm syncobjs, etc...
>>>
>>> I know this issue has been raised before and basically NACK'd but I have
>>> a strong opinion this is valid and in fact required.
>> I've NACK'd automatically signaling pending fences on destruction of the
>> scheduler (that reminds me that I wanted to add a warning for that) and
>> copying the name into every scheduler fence.
>>
>> As long as we don't do any of that I'm perfectly fine fixing this issue. The
>> approach of creating a reference counted object for the name looks rather
>> valid to me.
>>
>> Especially since we then pretty much get the module references correct for
>> free as well.
> So I think the issue is much, much bigger, and there's more. And the
> issue is I think a fundamental design issue of dma_fence itself, not
> individual users.

IIRC both Alex and me pointed out this issue on the very first dma_fence 
code and nobody really cared.

>   I think at the core it's two constraints:
>
> - dma_fence can stick around practically forever in varios container
>    objects. We only garbage collect when someone looks, and not even then
>    consistently.
>
> - fences are meant to be cheap, so they do not have the big refcount going
>    on like other shared objects like dma_buf
>
> Specifically there's also no refcounting on the module itself with the
> ->owner and try_module_get stuff. So even if we fix all these issues on
> the data structure lifetime side of things, you might still oops calling
> into dma_fence->ops->release.
>
> Oops.

Yes, exactly that. I'm a bit surprised that you realize that only now :)

We have the issue for at least 10 years or so and it pops up every now 
and then on my desk because people complain that unloading amdgpu crashes.

> I think the complete solution is if we change this code all so that core
> dma-fence.c code guarantees to never ever again call into any driver code
> after dma_fence_signal has been called, and takes over the final kfree_rcu
> itself. But that's a giantic change. But I think it's the only way to
> really fix this mess:
>
> - drivers will clean up any of their own references in a timely fashion,
>    so no more accidentally lingering gpu context or vms and the bo they
>    have mapped lying around.
>
> - there's no lifetime or other use-after-free issues anywhere for fences
>    anymore
>
> Downside is that some of the debugging stuff becomes a bit less useful.
> But e.g. tracepoints could just dump the timeline once at creation or when
> signalling, and so you don't need to dump it anymore when freeing. And a
> signalled fence is generally not a problem anymore, so in a compositor
> that's also all fine (iirc you can get at some of this stuff through the
> sync_file interfaces too).
>
> The other downside is that it's a huge pile of work, but I don't think we
> can get to an actually solid design with less headaches and pain ...
>
> Thoughts?

The alternative is to use the scheduler fence(s) to decouple hardware 
fences from the containers. That would be rather cheap to implement.

The only downside would be that the scheduler module probably keeps 
loaded forever once used. But at least I can live with that.

Regards,
Christian.

>
> Cheers, Sima

