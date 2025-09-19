Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D57EB88053
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 08:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8781E10E935;
	Fri, 19 Sep 2025 06:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Je2UttWU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012069.outbound.protection.outlook.com [52.101.43.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9425510E935;
 Fri, 19 Sep 2025 06:46:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOEdeldhegs6bjkajOX2lz1uElDf++76G8t5LFsvaWKEgapS+tksOebgBjTVFaWfy/srH5D0RJWfjiiXaW9iI33YnfZs2AwqHBhYgqFf+XTceiNRrvCk3YE7UvM9Wb+I3oS66wW0XEbk12W/0EO8F774fOANwQZIEJbOREc3oeLVU7yqSZSU7a40fZaTmHnNgtWSCUj/IFK5GBOh87An+J7cKINmAAblnynmRBoZM//9sFjFAUXM2v+pM0x/O+m9DolBI6TVXj9q6yzOxXadkcTZUmJbpZfVwWAHnHL/+JUonHG0cVbLhNuvFW5aV8gjOPFQF7YJSptaWgJzvcUhog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDpXM1WC+7eq2yP7XZLCGPqyCvwlz07cmLXeGA0xA9w=;
 b=GItZCcu0UAYVZtoZ5U7P/ow4xRlRpZw+Ka/qLB6WyStyDFda0yNMnOZ8G/ZuYUvaAn8lzHHGUo6zl84vi1fY0bqbLQn7GHRLs1hzdbapJXmdo7IHl+K3cj2QhSlCdjfRQEmg993azOE766OooSzJIGAqoRBDMnuIvN6uK7+/5sUe0sE9nWZZR368lVXog1H5/PacBR0FeSyTtV0akiyEDnVaVxf1I97Jks5NQPGL/0f0CH6b4xijJS+/aX1EvE2e2z8O/PkOLz2GGLVLyWZMyJLk6j8fMCXgVlg/Nv2OzYv/QzGffICcFN/sWxHW3u1Yv+bD8KdzM7GqmFVIwe2Y9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDpXM1WC+7eq2yP7XZLCGPqyCvwlz07cmLXeGA0xA9w=;
 b=Je2UttWUx2EuPMKzhYX4XMcEh+4ZQeK7BPggyLHftE3wzbDqARizo8WrvR580wnxqHRFpMTSQTln9W3GILN+PpHW1Z+PRvHMdY6U6r82cvlYqqix/SXFuVRgpIYxrO+HZUYORyi/8ejLxKJU1SWf1FxxuINDfphEEwXfYP/AC58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5858.namprd12.prod.outlook.com (2603:10b6:208:379::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 06:46:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 06:46:42 +0000
Message-ID: <6f92ff06-04c3-440b-becb-50a7693ecc39@amd.com>
Date: Fri, 19 Sep 2025 08:46:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/3] drm/ttm: allow direct reclaim to be skipped
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250918-ttm_pool_no_direct_reclaim-v2-0-135294e1f8a2@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250918-ttm_pool_no_direct_reclaim-v2-0-135294e1f8a2@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0247.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: ac6a0ab3-c21a-4dbf-a591-08ddf7484aa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHN1MnYxS05CQm1wNi9iNnUvZStjeS9McUFkdzBLcnJadFZkN0VXVEppWFpy?=
 =?utf-8?B?djE3MGx0OUxqNnoxbHcxdmMyMHFkeVFlbUI4UVJRTWxRd0JXUit2andZZFBH?=
 =?utf-8?B?cXlaODl0dmNqdVowVm1qcG96NFNpSHBtL0I1NWtKUFoyUlVCcVhmY3Fhd0xy?=
 =?utf-8?B?UjE2bVVJdUtQVE9qUkg0Y2N4VzJlN0hmR2pIc080RC8rTFRvd2xtQ3lIM3Fr?=
 =?utf-8?B?VXhCdG5haStQL2Fkb0xHcVVpRFFTSHhSbEhzS3RydlkySlluOXZvNUJKNjFw?=
 =?utf-8?B?d0NIeEp1N2NTV2kwMGlmbFQ3RFBZclgvekxObDBVMEw3ZjBXSE5sTnlTSTFv?=
 =?utf-8?B?MVlLb1ZqRVEybzZIQnlrQlhRUlpIUmQ1cTJtNmt6WWtRVFNid3lGRXhiSEh0?=
 =?utf-8?B?TVNvMlNDcFd5dDRzTmtydSs5aDkwU0tJZTBtUU53bDdTUFhCdWprWXJiekZS?=
 =?utf-8?B?VFRRdVdNcUhuMTg0ZUxGMFhDSGhFaHJSdFEzemEvSFFwTUpqTzNFVTJBdllY?=
 =?utf-8?B?MkNReVpBaVd1bkFJT0Y5TlVNbFBoeHhLT1NqZWJZK2ZlKzJQRW03d2UrSGYw?=
 =?utf-8?B?dnpDZy9Ib3IxMnBzb1IrVldVU0J6cEZtMWd5YzJYNGNIMkNZZkV2Y1g2SkFv?=
 =?utf-8?B?OUFIVXBGVFJaNCtDWnBRRTZBay83ZU95NDgyWVBzTFdhWkFTcGgya3lIZUtv?=
 =?utf-8?B?VDBYTWFZRWJuV1NvQkVyWEVOalQ0OUcrZFQ5ekZpcjdBWDVVNDk3WkJIS293?=
 =?utf-8?B?TlJ0Tjk5eWZ5T3RtNitiVWp1NktiZStBVVpIYnY3KzRSZ1hEckdUL1dudVBl?=
 =?utf-8?B?Q25ORUhTTHpzbnZFbWttM3pVdE9OdjJpNStvUDFUN2NMQlVYL1p6OXJJMkdo?=
 =?utf-8?B?UXB4NFliNWFRVG8rUnB1LzVTWlpHN0RxS2xyOUZuODUvbEFMVmJHdUJiNEMx?=
 =?utf-8?B?SnNnVDl1ejVTODZoRnZQL0s2dzRWUVM4Zk42c3lXR3pPaHVtZk9UQ20zMERY?=
 =?utf-8?B?TlpuUm40VUIyR00wb3lpdzdUdW9Yc3BpVGdHS1RZK3JtN1QxeWlSUlJMTkxq?=
 =?utf-8?B?eTFCMUJDcW1yVERseWc5V3VueEtPcHV6aU5QWjAxNEp0clVQbTdZR2hLL1Ry?=
 =?utf-8?B?TFluSENZZzhLQ2Y4UjZCdFNVZDdZVFpibTF6QktUb1FVaUNwQU90RVpPTytT?=
 =?utf-8?B?Ulc5S2toUXkwNlVvNHk3WmEwK1ZubW9MRHVnM0p1UnZDWXRLRStOTFR4Qnoz?=
 =?utf-8?B?RGtyaHVxWGhLWEwrcFludEpvMGtCMU5vZHBRWjZlbHpqWlpkdkZwWXVrQkFV?=
 =?utf-8?B?YVd1RHVHM2JNMUJmSGFSN0N1QnlHZU9SeGlQMWRtSzVrdzFjVWgrWk9aaEE1?=
 =?utf-8?B?TkdsRzBYczJEUmJpQ0JUTGJPZmtGbnk4M1VDL0FNdEpybEpSOUhVRHFNQnBE?=
 =?utf-8?B?TFo3Sk5udWJiakI5SXM2UDg5MG9DV3NORGlnWGVWTWJUZXdqNjROWkxVYitB?=
 =?utf-8?B?TUJ5YUJWVm5RL2pnM1ZqOWJERlVQajFhU3o0K1FVbE5mNy9QM1B5YWg4OGEy?=
 =?utf-8?B?aVJvaFliTTE0ckVKZkVxVjZUV2cyWWF6V29HQnNUSWlCY01nSU9HNUpId1l6?=
 =?utf-8?B?UVhMa0hOaVowWktIWFF3cmliK3RzeERaV1pwWnFEVGtUYTVkK1ZlWEVtRytC?=
 =?utf-8?B?aFBSSW5aSHpBeGJadHZ3MEh1ZjdvVno3VllCdm9yREh3dnVvUlNUdXBXSVl3?=
 =?utf-8?B?UlI5c1ZnUzVtM0dGczBUM1BUaXp4aVlNUGN4TTlLOGljSE4rU05wQ2p5RUk2?=
 =?utf-8?B?aWVxVWJLV3lEd2xsc1lCMHhYc2ltNzRhd1Zha2JQQlhaWnE2dWdYMXNZdGNM?=
 =?utf-8?B?NUNmQUhydkdwM2ZOTFRWUDR4bXFxOFlEWnA0STFNRmlSTVhnSzZEWFh5NFVt?=
 =?utf-8?B?YVdjek1zLzhTaDEyS3lQc0dlVm5saTR0VUJuNmNvL2ErNmZLMXZjR2pKVmFG?=
 =?utf-8?B?dVhiL1lHOURBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDE2K3ZCS0FDWTY4czM3S2U5bTZkajlsazFYSC9rKzhGNFhIb2pzaStHWjlt?=
 =?utf-8?B?K01jeHpGa2x2L2ZTNTRoS0dJSjlvZGpSZGZHdW04Q2c1Q1I2YVFKQnQ5Mlhr?=
 =?utf-8?B?TWV5Q0RHaThBdHl4dWkrOHlDb3RlWWJkZDRuVEJsOHpSYjFTK2JvRTRrcGF4?=
 =?utf-8?B?ZmpwOFRheXFTSzRIRUhkdVhTWlhrOERDaG1aUUNIS1FDMFIyWWxYbHdMWXdM?=
 =?utf-8?B?OVFscGpJN1YwaDZpSUlSYTcyek1pTmNQSkkzT1dtL2E4VzgrbTg5UjA3dVFO?=
 =?utf-8?B?VkkreVRMbTF0MnZwNEFLVU04Rk8yTVNxeFBIdTV3Wk1NVjJad2l6TCthcSt4?=
 =?utf-8?B?ZCs5MU9nY3FxdXlZZEpHY1NVNExZZzVmSU1pNGZrNDFmSHZhY21DeWZWSGsz?=
 =?utf-8?B?ckRvMnpqd2ZrU0JWYlNqVjlGSmJWUnFpMFF2OWMyVGI2QjhLcmhXelZGTHpK?=
 =?utf-8?B?T3JNcENpUDBnMEQwd0dUaEp6K2RSeTM5MUtDdWtJTDUxSVJVMGE0WnJuTnlL?=
 =?utf-8?B?YStlRkxFdXJUL2xZM29aZGxpMWZRZ3ZUUERtNTROREFnbzRHdlBTRmlzaThl?=
 =?utf-8?B?TWRyM2lGdlZoQmRLV21LTDNHYXd2WlIzQjR3c0RlMUp0clF6RVhKc040dFh6?=
 =?utf-8?B?bzlVaXlhMldaWCtuSE01YW9TNnBEb0I5VlN6OVE1MHlhZGVPSk9WUnVWdVcv?=
 =?utf-8?B?R1EwS1phZnRncy8xTXNJNVR5OVhOWHZwUnNJQWE3M1l1S0h2UDZZWEtUU0pn?=
 =?utf-8?B?QktmWUVEOEMzS2xxcGZvd3NLYTA3VmhsMCt5eEFHcm9OT2R2ekEvSGdtTldk?=
 =?utf-8?B?TGplcWFDMkhNQUVDL2ZLWWlrTVppa3N3c2FRdnhWQ3FOTS9VTVdRL1h2NGx4?=
 =?utf-8?B?blVOcVJSaWViUFJNQ1ZjNmwxY2YzSFlaSDAvWjBvaHRwR1htelpiMDF3clBw?=
 =?utf-8?B?NmhCMnlJZFhieVR0c3hmbDIvNDlweWE2c1lwdUNxUzNHb0s0QWNHbDIwSHc5?=
 =?utf-8?B?Q3I5WUo1OUM3T3ZsdXBPTjZ3NjNib1ROcFR2eTB1U3J1M29rUitmLzJscFFt?=
 =?utf-8?B?OUxZeHNMaWFlS1Bla3JlUFB3MXQ3YVRuYUN2ZW85VUp4Zm05YnlIOHBDTnJ2?=
 =?utf-8?B?bnNpd0FGYjIvQzI5VXFTNytMRElVNG82OURhOG92b2ZVMVRFbFNzdDF6THVW?=
 =?utf-8?B?RDJ4M1FBVHZsS0lvWWZ5NFZOQXBWUnBSMzBVN1YxUXVkMXlkckJ4bFhyRzd0?=
 =?utf-8?B?UzMrMExuZXNDVXhEQVFHTTZPWTZlZHJIUldwZVJnNzNMUnFnbUloaW1PVitp?=
 =?utf-8?B?VW15Zm54bUR1cUR6eXV2dFR3ZmllSStUelp0WDdudkdsQWVKVDhnUkt4bVNs?=
 =?utf-8?B?T09LL1lUYkV6ZXV6emlmcTQ5ZXMzOGsyOFFObDRBQytHSUhFZmhuZm9tWXVL?=
 =?utf-8?B?Y1JqanN0RXJTcThSSk5heUdHVTlNeGlYVG54aXM4MjdVM1Z0Qm9JNDhISFN4?=
 =?utf-8?B?MzV3MTNTZ0ZJVTBpNXhGNlRtd3I5amc5bys3eTR6ZWhuam1vd1NCbUFWS2Zt?=
 =?utf-8?B?aTliNVZZM0JjZnBUbHBLODNUa0RGYUQ2QUVHTExpekRkMXBJK1RjYVNoUlV1?=
 =?utf-8?B?TU9OVEk4TFNKeTA2NFh6ZFVENjk0SWJCUkkvNnFSRDBHWGZDMHlEdUM1RlNQ?=
 =?utf-8?B?eEh1MWlPak9ldFNpMXpjd2Rkc09BVXRLMkFGQUpXVGozcFNxdGd3SWJFNzJY?=
 =?utf-8?B?Q1JSd3IvcVEyTHZ1dFAzb3NicmQzdWNsMWhtaWlRTWN3alRvcjJUSmVkV1No?=
 =?utf-8?B?WnR6Y2pIc1VrbmdHZXY2LzAwY0tIanZ1Q2RMc0RHN3Fjek45WURxVHpyZ2RD?=
 =?utf-8?B?U1dtaTV4NW03c1RRaDZCVFFmbkxNNk1CRGpveWNKKzBCa3VuZktqVE5xRUMx?=
 =?utf-8?B?R3UycW5WU052aHR3M3E0aWhRZW51bjM4c2ZvOG5hOTdDcnZUbFU0WkZRaXdB?=
 =?utf-8?B?eGNTZWUyT3pNUWcrRU9yU3BSL2tnWTR0T2sxT2xuNjZkWXQ1NmUxd2FsY1p1?=
 =?utf-8?B?cnJsbGJYdWxyMVhTa25lZWtEUy91N3lBTFJaSUJMWlFWaGpsNU10eXpWOFJT?=
 =?utf-8?Q?sO6beQUKdBvQKAT8bxXCobq7x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6a0ab3-c21a-4dbf-a591-08ddf7484aa4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 06:46:42.0811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+tvFAnJ8oZ4xATr8ZYdGxR7ARqPSWd80GhXLlSUaMRF9eJoZFvwJqZrk3dXiKYc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5858
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

On 18.09.25 22:09, Thadeu Lima de Souza Cascardo wrote:
> On certain workloads, like on ChromeOS when opening multiple tabs and
> windows, and switching desktops, memory pressure can build up and latency
> is observed as high order allocations result in memory reclaim. This was
> observed when running on an amdgpu.
> 
> This is caused by TTM pool allocations and turning off direct reclaim when
> doing those higher order allocations leads to lower memory pressure.
> 
> Since turning direct reclaim off might also lead to lower throughput,
> make it tunable, both as a module parameter that can be changed in sysfs
> and as a flag when allocating a GEM object.
> 
> A latency option will avoid direct reclaim for higher order allocations.
> 
> The throughput option could be later used to more agressively compact pages
> or reclaim, by not using __GFP_NORETRY.

Well I can only repeat it, at least for amdgpu that is a clear NAK from my side to this.

The behavior to allocate huge pages is a must have for the driver.

The alternative I can offer is to disable the fallback which in your case would trigger the OOM killer.

Regards,
Christian.

> 
> Other drivers can later opt to use this mechanism too.
> 
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> ---
> Changes in v2:
> - Make disabling direct reclaim an option.
> - Link to v1: https://lore.kernel.org/r/20250910-ttm_pool_no_direct_reclaim-v1-1-53b0fa7f80fa@igalia.com
> 
> ---
> Thadeu Lima de Souza Cascardo (3):
>       ttm: pool: allow requests to prefer latency over throughput
>       ttm: pool: add a module parameter to set latency preference
>       drm/amdgpu: allow allocation preferences when creating GEM object
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  3 ++-
>  drivers/gpu/drm/ttm/ttm_pool.c             | 23 +++++++++++++++++------
>  drivers/gpu/drm/ttm/ttm_tt.c               |  2 +-
>  include/drm/ttm/ttm_bo.h                   |  5 +++++
>  include/drm/ttm/ttm_pool.h                 |  2 +-
>  include/drm/ttm/ttm_tt.h                   |  2 +-
>  include/uapi/drm/amdgpu_drm.h              |  9 +++++++++
>  8 files changed, 38 insertions(+), 11 deletions(-)
> ---
> base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
> change-id: 20250909-ttm_pool_no_direct_reclaim-ee0807a2d3fe
> 
> Best regards,

