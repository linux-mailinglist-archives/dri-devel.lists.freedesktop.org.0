Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A52C5B50281
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 18:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F0110E7BA;
	Tue,  9 Sep 2025 16:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A4KyBlEy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBF410E7AF;
 Tue,  9 Sep 2025 16:25:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3DO8BwNWHZBHttnSU7Hku0GWMuQgXxuMURBwJCcuabPBb3i9tOauDEIa+tXWz/ZgDkojtXGIAeLad/LMColemCEwAdH4uPZZ6F4cYzK+21APy5BWbtmNa+zm6QYDYNid4F+wYu3Xrisl0234TEhj+tp2zqzaBs6V53ZhBIBWjCmsH+k4NZMKhrDnMXZmh2pyZR39iyFh2tL3UYyKYv0PQaFb3Jv5aIpwhe0iobCKIfrws6sedeZi2lZM76/0ZI0qQa2ZlRyRRDpQSkxyeCTGIX3uGYLfss866YFv26L106khDoLV6eAUctFqeF5FHjbmsexifontuXkDvZo5LXPqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxpwI8wYntfJY3GrsLqE/9DjY77DvJseZ+wu4Do5R5k=;
 b=nfuFDeHcJ0L8fysPk+qxdE0dZt6vNgzBYDd8LjKnOnD3CxKJeJKckjodiWJc+RWJ7YtTcrSm53zyzBw7XcApneQCCPYCArDAbuSzAHCDnkS5rWWkudU+FyrXV2sRRzQJrnlgby9GRrguhnbhQeoqrHE5sjiT5+BwGCyJHC1oN6lTkZ03TkiHVH04bBwvPlqrVElJBZloj+7u9hBkJDaUWdzDORe8Yg92pAdivImL2ucHKxDHIBi3jc1W5pe3ys60T1jkdnDwuckPq+GqqKHLD3b/e3wyZ7JvqBcyA+bxhEjfpJ/xozsg0E+OqhZlChrq+u4BIrf0U7mT7K3UIIFfgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxpwI8wYntfJY3GrsLqE/9DjY77DvJseZ+wu4Do5R5k=;
 b=A4KyBlEycdic6onlpaMuPGtE/n8YU38sXi8QO+0o13iZ9A+RtXvZoSxvfw/RQI7MbVavtZRXhPhqHUILLKnrTPDf4tQxfHtiRMFjkDZdv6ZKULekiyQ04FO3x6ms1vT/dF2+WvKuol95wmd/QFiL52euuhrWhuPj+8YuwSwRSXk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6715.namprd12.prod.outlook.com (2603:10b6:806:271::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 16:25:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 16:25:53 +0000
Message-ID: <106c1a36-c104-4eb8-b928-d11b8ca9b599@amd.com>
Date: Tue, 9 Sep 2025 18:25:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/buddy: Optimize free block management with RB
 tree
To: Peter Zijlstra <peterz@infradead.org>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 matthew.auld@intel.com, jani.nikula@linux.intel.com,
 samuel.pitoiset@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, alexander.deucher@amd.com,
 stable@vger.kernel.org
References: <20250909095621.489833-1-Arunpravin.PaneerSelvam@amd.com>
 <6f6841a7-57bd-49de-9b55-b5b0514a2749@amd.com>
 <20250909140519.GK4067720@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250909140519.GK4067720@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0352.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: fe6bb420-f0f0-475b-d803-08ddefbd8c2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFBqekJ2QVdFTUx5UDRGbDlxSGJHWFU5eElmMUtOV01RK2ovZExuS0VTNGtm?=
 =?utf-8?B?Rk5DaGZTdW9KeU1IazY4R2Qvb0JnNnVSczRiQU9wbnFiWTFXeFFBSFNhSVow?=
 =?utf-8?B?ZW5uWWpYK1VIajhHK05xYjhncE94Vml1eTFUSTZ2S2VBT3Bjemg5bWxrUFpP?=
 =?utf-8?B?empjZ3FJWkhRcG8vZzEzUFFhaUZoekhUNU9ZSitjVGxMdFltdnlOc3J5ZHRJ?=
 =?utf-8?B?SXYrNXByWnBxMi9sbm9KV1k0S3lMTnFORVFtcEJtWWZyUCs5NUJsTE44Yjha?=
 =?utf-8?B?NTNHdFVxSjJkN1U5SXNSbUhrNmcyY2FPZ0ZzemRYNDhmZDdXZ0hYLzZQSUpy?=
 =?utf-8?B?UEsxOTFxcWRBand3UGwrclh5REJWTE85b2k5TDdKcGlIdkNEcmVORVVzWCtH?=
 =?utf-8?B?bWpWTkVMUkM2c2VKZHhlWmdDVysxRURLZEZOL0VYT090NmNOWFVRVGdNd3dh?=
 =?utf-8?B?aGFlNEhSWkV1Zkx4d1o1a2hFR0krZmMyVlRhWlMxR0hZaEZqM0lYSWZoZ2Uz?=
 =?utf-8?B?Y0FQVS9HdzNkTlZpVHh1Wm5SZ0tQejk4VjY0NlZRVlBMZ295aUd0ZnlRcS9h?=
 =?utf-8?B?N040Zldsdk1ZWW1YRTM4bHZ3Z1A4L3JOd2xYU2l4TitPVEhKMTFXVDFRZGVL?=
 =?utf-8?B?TTFrSUJ0eFJ4bnlzYTN4dnpqbjZHMUxuME8yaExpcW1NTHEyVVdVeVZiNWRP?=
 =?utf-8?B?YUxIRkpEM0xSU08rMFBOaU5ZbGhBc2c3Z2dWU0k0Z3V5cy9ISGJvZjZFL2JF?=
 =?utf-8?B?Z3hYWkRBWWFIQ0dkVVBCRUZaVk9WT3djeGo0RkdsZlo0TWd0U1NkaGZMeW5D?=
 =?utf-8?B?R2lDMGRkdFd1UlV4Smx3UG9ETXphcnZhQ3k4NmFUbWl4QXZiVFNHc1ZvdXlq?=
 =?utf-8?B?UmxqcklLWUdEaW5SNWkxeWttWjE2cnB5aGZVZlo5NFFUU0FvV1BkZUliZHZX?=
 =?utf-8?B?cWswN0E4REZvaDN1dWpQWmE0c0VrTFhDcThoR1Avazd5SUFJTGdaSVZ5eHRE?=
 =?utf-8?B?UFRPODdsZWZIR013YlY4Ym0zaStPRFlUc09oNnNsMkNEZklEMUFTWGJxcGgw?=
 =?utf-8?B?eXlxRTh1WGc1Nk5qQWJvL2ZIcmtySkF5YzRsblRJSlNhdVBiSDQxT1prK0pJ?=
 =?utf-8?B?RjI2NkEyMXFGb25BYWRSTEdTWEtibzNQSnVneUFseEFiMG0rR05SRStIV29G?=
 =?utf-8?B?elc2Q3k1YlJQUnNFdXBSZXdmMTdOeHk4Z2o2akxPVWZxRTVNUEZ5SVM5Vis3?=
 =?utf-8?B?bWlRTkhjam9uQnMxZ2RwUVFZMFRzRTRiN0hNQmxZRCtEQ2FSMTkwZ1ZEczVL?=
 =?utf-8?B?MzhoNEZRckRxcU43Tk9rVzNRSlNQQmw4MUJzVkdyS3pacUVwUUcwd3dBQ1Y0?=
 =?utf-8?B?cGhGQVJDb3hHVk1aUFpEM0pBMGVKZGZhMXRUaldlV1NtUWhZMHRuVjBqOFhL?=
 =?utf-8?B?LzNNT3VyOWJvenVudXBUOHQ4dWdoUXkzbU5UcHgyN3hCeFJmbHJOZ1d2em4z?=
 =?utf-8?B?bDZMbUVkTUtvS2pwOE9GOGxrUitVbHJHaVJMTEE2Q0tVbkhzbHdYMGxzVnhB?=
 =?utf-8?B?a3NLL25PMFBHbUtXOEFWQ2hXc0luTjJuTjFudjhPc2l4MVI0Ym1hSmRkdW53?=
 =?utf-8?B?bTdES1pPQkhMRjl5TG9zdEhSdWFGQkZ0Q1E5M3piNkU0cmdoZVRLQW1CZUJy?=
 =?utf-8?B?SEF6bzU1YUE5dGU2VUt2bU84b0JHRUh3bWx0VUVKZlc2ODgzWEcwS0RRT3A3?=
 =?utf-8?B?YllLMXJqeXdqb2JFVmNzTEVSWkF4TUxLeTNueGdQVy9VbC9CQ2FLNXdtQXFs?=
 =?utf-8?B?MFNsWDh0MGoyU0E3VkI1VlFFNkpJbEJid0ZLSVc3anJ5K3hQcjNKWVowbjhv?=
 =?utf-8?B?c2JJd2dod1A1Tjgyd2JraHk1QzdGN2VJSU1YcVdaTE8rVk5HeldGQWpLS3dC?=
 =?utf-8?Q?SuicIDJuFik=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ellIMlUxb01YOWg5aDM1WHZhaVZINlpxQkxMVWEvTEVPSW4rejlCZXA3K21j?=
 =?utf-8?B?R1RSdEk5VkhRWG9BaGRudnRRbWF4Tmp3NVNRbE1FTVRrNFB4dFMvYXZhMGpQ?=
 =?utf-8?B?YU1vM3lnOGpoWUJKMW1MMUJtRFUzU3hjaU9vV3JoVFBmdmJkRU5JYURRYzAx?=
 =?utf-8?B?Y2V5RkZTSnNGdVNSY1pkWFBYUzBuaHBKRnFubzlRbFhnK2Z2dGFmYWZ3aUVq?=
 =?utf-8?B?aytkcUxBb1ltUDdmdy80OFFqN3lhREs4Nk1CUkpGM3dHMzBDTzZBbkRoS1Iz?=
 =?utf-8?B?bFZGR3Bia0tPTW1CR3pBM0Vha0tOekd4Wk83QjNBd3NSY0JyM3B5WkhqakxF?=
 =?utf-8?B?SEUrUlI5T1BLMnZ6UWo0UGxzdHBIMUZ1dmI4Y3J3a2pJaDB2N1lkbDFSMXh0?=
 =?utf-8?B?NWhRTkQzZTZKbno3K0NXT2lubEpLdm9EMUlGNHJiYTJveGtUWGFwc0tMditG?=
 =?utf-8?B?RmJxVFl6ZGt5ZjhKSWV5RWQreWFrSndxcnlhVkpLMm5KeGJpN1FEL0EzWjVn?=
 =?utf-8?B?NDB5YW5USFdBL3hSYjJGYVg2bS9YZGN3cENUb1VkYW9uL0FDK1Z4ZWs1Mklq?=
 =?utf-8?B?RmN2cS9xZEhYL3djSWxuSUNPVGdPaldsTGU4Y21ZT2FVeXpLVm1OK3hsUFh5?=
 =?utf-8?B?M2FBZExtWFZiVWN2OHo1amFub0dWZHQ1ZHJvdmR0WUplR3QxUURDNEdJMWI2?=
 =?utf-8?B?QUxXT0s2enZLLzVqZG5pQms5VGFVWktlcUFHWnhjQ1l3QWt3cVdKREtNaEc5?=
 =?utf-8?B?b1ZZcGN4MnRyejBaVzlGU3BNVzg5ZXpza3Nxa2I4eWZJR0QvVGRCTzhWNksv?=
 =?utf-8?B?U2NSbmw0d3BwK1VsdTRxTjl2cHA0NE0vOVZ2c2tDQ0JEUDArTnhlYkFBejZP?=
 =?utf-8?B?VWZCempndE9pc3pjQTVpVU53eGlRbVZJMVJLZnVLNDc1M1lqWEdqaUQxZUcv?=
 =?utf-8?B?OXFESm8zSFowWVQ0b3A3cnc2VExJKzhUajA1dGRLcjlIaGJONnFYTHJiMDc5?=
 =?utf-8?B?c2h2NFRWV25LSUg4RXp3RzVpQ2tiUkhuTzNVRmJIOXlVRkNJcFkzSUVrdkFw?=
 =?utf-8?B?ME5Lck9BbmtDRmVuWHgxdzR2VU1Ga3BTdFoyeW9iQm80RE5rdENzVnJpYmd2?=
 =?utf-8?B?TlBtemFuR052bmpRMUFmaGk2dklySVRhdlRTZDN2aUFvUm85NWt5OW5kQzhW?=
 =?utf-8?B?YlFXZGpXaVJTWUZyaTJRTUl0NmJRSk4raExZL1RRbm5mYXNNTjlpUk5EOEgw?=
 =?utf-8?B?Z29EVHZJRXRkQmRBMU93S1NwWnFIVHBFcGZzYzNsNDJoaUgvNCtjSDVNejVP?=
 =?utf-8?B?ajlaemNmTm9naG56SVRjMG5KVHJBbEZqaE1HeTRyTGhlSWlra2JUbjBNeGdL?=
 =?utf-8?B?ZXFkMExLTmxxdFV4bHV5d0ZjeDBQckJOTWc1YjdyOFRMSElKN25TUEJ2N21k?=
 =?utf-8?B?L1Z2cWtRUWhqandZYnhhRm1lcDAzc0M1czZ5TkFmYkJxaDl2ZkoyUTl0TnYz?=
 =?utf-8?B?dmoxYTNtcWpiYnVoQTBENjR3ajdkakd6dU90aXZvVWt2MzZKTEM0SVZMZmt2?=
 =?utf-8?B?blFzanBHWC9sWVFpSVNxM3EzRjRYSnkxRTh0QWFPZ0wvVXhXOWpISk9Ockpz?=
 =?utf-8?B?ZEYvS05KN3ZNSHhORnFDb2FxWmU3Qmk2UklWTjUrZUM5dGVLSEZ2TEd6Qkpk?=
 =?utf-8?B?WTc3UVFSUHcwRDhNRlRyTWV4QXBPMFdzY3VjSWIxRnJxaFBKM0doeGJDcjlL?=
 =?utf-8?B?aWJCVHhab1hPWjZaQVUzSmhKV003VW1xcEVTblhRLzlubmZBMGVPS1BRUno4?=
 =?utf-8?B?VUI0VEhaRHhkSHNnbjk1d3dlUmlvWHhCSDNKUnFNOE92cjh3NkRnaWdocEhT?=
 =?utf-8?B?VHNFQkgvRFllZTcvakNmUzZZdGN0T2tyS1JmcG9ZNXBmSVdvNldsdFpBUUww?=
 =?utf-8?B?ZDRlZnUrN2pNYlVIYk0xSGJPdWdBcksxOFEwUFJOSGZraXFRd2o3YWJoNWt2?=
 =?utf-8?B?VSswSm5WZWxKSDMrTG9SSmNLb3ZibGpJcG55c2h3b21GVVd2V3BTNmgwaUZs?=
 =?utf-8?B?Yk9ZZEp5MGxUa2luWXlxOGkzUS9DRjIwNHNTMzNKZC9jdDZnSmdBZlg5Z2FV?=
 =?utf-8?Q?gq1ZPwJi+qdqejjuLWAwiC/TS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6bb420-f0f0-475b-d803-08ddefbd8c2e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 16:25:53.7912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lw723v3Q/ZGwPDSUUnJG1TevqOxLKKvxPgfqb5rY9r+nrx33Cs1vbGy2vI6+uQqQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6715
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

On 09.09.25 16:05, Peter Zijlstra wrote:
> On Tue, Sep 09, 2025 at 02:04:30PM +0200, Christian König wrote:
>> Hi Arun,
>>
>> On 09.09.25 11:56, Arunpravin Paneer Selvam wrote:
>> [SNIP]
>>
>>> +/**
>>> + * rbtree_for_each_entry_safe - iterate in-order over rb_root safe against removal
>>> + *
>>> + * @pos:	the 'type *' to use as a loop cursor
>>> + * @n:		another 'type *' to use as temporary storage
>>> + * @root:	'rb_root *' of the rbtree
>>> + * @member:	the name of the rb_node field within 'type'
>>> + */
>>> +#define rbtree_for_each_entry_safe(pos, n, root, member) \
>>> +	for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), member), \
>>> +	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL; \
>>> +	     (pos); \
>>> +	     (pos) = (n), \
>>> +	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL)
>>
>> As far as I know exactly that operation does not work on an R/B tree.
>>
>> See the _safe() variants of the for_each_ macros are usually used to iterate over a container while being able to remove entries.
>>
>> But because of the potential re-balance storing just the next entry is not sufficient for an R/B tree to do that as far as I know.
>>
>> Please explain how exactly you want to use this macro.
> 
> So I don't much like these iterators; I've said so before. Either we
> should introduce a properly threaded rb-tree (where the NULL child
> pointers encode a linked list), or simply keep a list_head next to the
> rb_node and use that.

I agree, something is clearly fishy here.

> The rb_{next,prev}() things are O(ln n), in the worst case they do a
> full traversal up the tree and a full traversal down the other branch.

Yeah from the logic that is exactly what is supposed to happen in the __force_merge() function.

The question is rather why does that function exists in the first place? The operation doesn't look logical to me.

For drm_buddy_reset_clear() and drm_buddy_fini() we should use rbtree_postorder_for_each_entry_safe() instead.

And during normal allocation __force_merge() should never be used.

> That said; given 'next' will remain an existing node, only the 'pos'
> node gets removed, rb_next() will still work correctly, even in the face
> of rebalance.

Good to know!

Regards,
Christian.
