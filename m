Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9927A78859
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 08:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A196C10E6C6;
	Wed,  2 Apr 2025 06:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WGSfdZ6U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377F210E6C5;
 Wed,  2 Apr 2025 06:49:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJEvsHbxzNTlqgXm9nej2cyQAb/L6wbUFFdzaXqetiNJd+jsqc+MAyCvr191KrZ7yFzuUnOZePDQmMbsi2okELbYOMhF3pC4Q+9Ewk/RdfMR7nUADwO8snNRhaBRxRJsuFlqY2cklz0KcQNFGTlcpN473lltEbl5gOOUEfiaTrvj3eG1+aUkXUWYGjMFfGaA3MoyaLXFZuLrp/45NMj3PGlsyOrYlxGkfyd7NQ3uHqi5UtX7V1bHDyUUWnR14g2a4YOq/nkRBnr0r23dBM0P2K3WaSJij1B7upNETyRcwosQbybGb+gx8kiVmGk1I5HtDRuPDBAWMmkvCuUlYYEwdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//RS2/LxIJL//A2/82DiQSDLLgmnZy35DLWWTc7wMxc=;
 b=FNiS02HJ/9RWgtyf9hsATwgNCV0byR3nzTLqafcDCUi79OA8jRxbV4+eDupH0FWkW47hgu+zocayMXE9oMga4n937adT6yFboHwZ288O9MxU517xSo/Qt/J0ZVcQZkh4ZZrQY6ZsmvPItltUVCbUFEuZgkugnnJDqpNheEosMXLbduPaUAKehst9DC99ULf5mz0epMeE13hOmH9bBEpHUShZx6QkmEou/JQhjq1kEeQFIB8DqSiFQQSUG7UcE6NrO76hDu+7U//NF84BWr65ntJe55rDcv3UxwdHaDfAKQLSZuZSq9w2Yp7LffSR1xSD5D5IIaANWJ9cLdw3Ax+rsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//RS2/LxIJL//A2/82DiQSDLLgmnZy35DLWWTc7wMxc=;
 b=WGSfdZ6UcBRHz4TRc8yvCbLLmK/PZ03wAn7DyPUobEoSXLRalpRboJsiyvTh4HljelFJftzd6DelTxbAqo3FaXauGzpmYCd9eo1lec5XHAYya+V2e29Eq9TLmuqLZXqhnV1NgqPjpTWAgFarTo2fgwBmqyO9Gq1jpC4lrXNAvRk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS5PPF6BCF148B6.namprd12.prod.outlook.com (2603:10b6:f:fc00::652)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Wed, 2 Apr
 2025 06:49:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 06:49:11 +0000
Message-ID: <5d2a726c-bdf0-45e1-abfa-3ed8d1ffbed4@amd.com>
Date: Wed, 2 Apr 2025 08:49:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 00/14] Deadline DRM scheduler
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 "Liu, Leo" <Leo.Liu@amd.com>
References: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS5PPF6BCF148B6:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5d02d2-4126-4e69-fee8-08dd71b27960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTNndkFZY1FJUzQ4RzNaZ3dVc0IxL3pLQWtpK0tyMTVBNXcwUDY2Y09ERWNz?=
 =?utf-8?B?aHVTMEZmWVZOYlFWN1lLWnRJdUhoZTExcTREY3djdXFOZnpLR0o5cFY4ZS9G?=
 =?utf-8?B?bzZIVHAySHMzWlN6Ti9aTXVnOVRmWnpvQ25LUWtxOGtMcFJCSzltb0VQcGhV?=
 =?utf-8?B?QzZOVko3cnZwRUtoc2dCKzRWakpaZ1Nya3ZiV0JvNk5kQlBmbWNuTkh5VzhM?=
 =?utf-8?B?eWlZdjRhM2FTUkJYMWpMaVZGVDFSRFZKMVBON3ZQSkE2UDBpUDZMWCtydk4r?=
 =?utf-8?B?dUJENTJXVnZpZ21RWlp4QWI5UFZxVVIyeG01OFRnd2FsMVBuZmtYUW12M2Zu?=
 =?utf-8?B?VXJWYTNpVU5jQVNWWVRIYUxGK2E5eGZrTGZIVi83eUtBL05ra2ZIQUo0dlp0?=
 =?utf-8?B?bC9TOFN5cm5pQnRvbHdBRGF0K256VUh3YXBRWEc5Wk1aL3YzK2hrWVVRWHlj?=
 =?utf-8?B?VlhuMThuQm0rUzE3RFlMeE8xMmQ1bTdqTVd5WHY2dmhSbHVuZXQzNEsvNm1z?=
 =?utf-8?B?MTQ1NVdSNnlXQmd5MHd0S2NzUjNZbDU3RVhlME50L0JWTzBBSzZqdzAxajB2?=
 =?utf-8?B?cHl3R2ZDdUVEQVBuNjlFWWJ3SzU0Z0lOR0xuWng5dUM2Qmcwb1JTbWpqUnZR?=
 =?utf-8?B?bnZoVE5jazZ5WDZNNGZ1UjJoazF5cWc5WXJ4Qm5mZFlWS0lLOUhlVnd4Rjdn?=
 =?utf-8?B?Z04vZy8xVmt6b01YTzJGYW94WkJhK2FqQXJtOThVRVppZU1yU3NMamQ5K0E4?=
 =?utf-8?B?azE1UXFndlYra1RDTkZDNFNGbEFHMWoyL29aZzBaNmlPTlpXcUxkKzRXT1Ix?=
 =?utf-8?B?aFhqVit3eFFUeXV3YzVJSjIyK0RZNUhUU25qeW1tRjI0azlxZER0cndxMDh6?=
 =?utf-8?B?VWZ1ckhRamxTNzhydjV1cXRpaTNuV3NCc09JTlRQdXJtRVBBTlNrUjkwdWdx?=
 =?utf-8?B?UHYyTG9zempKNEtOV2xhYThlNEk4M2dBb2pqSTJGdTdiRER5SE9aNWFjbW93?=
 =?utf-8?B?eWFJeXZvMXR0aGQzSy9WeFU4ZVAxdmo0bkRFbkZuTFJaWVNxSy9hTGY3RzNy?=
 =?utf-8?B?MFNuUHFGbk1xS211cXZqNkxOUUc0NDZqVHpiU2dCdzBYUEZ0UUJVMm5xMGlj?=
 =?utf-8?B?bUVqN2V3SnE1UGxRMXhFZjJybVh0dGlZc3JmYlBSbXVWcUpiUGFxckY5UTJ0?=
 =?utf-8?B?dEJDUnQ0L1hUL01HRFBaZTJadnV6WWF3SmhkQWVobzJJWFJESDlVK2ZyRVQz?=
 =?utf-8?B?dE02ZS9PQjZWL2VQNXhHamt0N3NCQ3VZeXBrazd5aUoxYnBEUFBQaHVZY1RT?=
 =?utf-8?B?Qzl1WE10QjZTSFVtQVQ2ZERTTEt0TThKdks2czV5R2cwcDdGT0c1bnFHaDNt?=
 =?utf-8?B?dGx1bzFWekdPZVB6VDcxQWl3VkxjbjJBQ295Mlo5ZzBZWldubGc2K0k3cUp3?=
 =?utf-8?B?OXo5bWQ1NS9uajVlbmlDbHBJaXIzbWhveTl0UzdCYjZFZFRGV0VaNmREcWZa?=
 =?utf-8?B?bGI3c2k1alFSaDgydU5IS1IweWpOcTRxd1hyMWQyZ0o5c2hqMXFqNTYyYkpi?=
 =?utf-8?B?MkdqTTlkQitMTllERmFTWlNnMzB1ZGdKWUd4a1k2dVBkZW5ZV0RQUGlzMDRj?=
 =?utf-8?B?QjBoYlBDUEkrMmFzTHRhc0Y4aTJ2WHJiNUNScVJraEQ5aWNCQld0d2FObGdX?=
 =?utf-8?B?MWFUOEdnaDFpT1F6b0hsNTRVcnFIbTlTSjhvMkI1Q0JsaXk4akJKTkxJWnRZ?=
 =?utf-8?B?MVJqQTFQSlE0bWhSRFA5UmZ6Ly9FeTdUR29JZ2RXQ1VnU3ZVc2dETncwNE1h?=
 =?utf-8?B?MVgvL2hKVnYvRUVoMHFOQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTB0Wk9RcHplM25mZDNGWEhNM0RXSlhBRkZwdWY3eENhbHZwU1dtdzdyVVdk?=
 =?utf-8?B?VzVSMWJ2N1RncHZEZXZqaDhhdVkyYitza2Q3UzZxOW5KdGdPWWdPRS83dUdt?=
 =?utf-8?B?eWpRVDU1K01BUXBuYmhvVmlJZVRTK2plbjVjN0tBanVxMW5sR2RGYy9Namd0?=
 =?utf-8?B?R0txaVRGVGpFU2lKTFp2TEVudkdPVW5ST1VOVTN4bHB1UW1Ma0hOb2tyeEpk?=
 =?utf-8?B?cS9NTWQ3Zzdsa2E4aXlXL1IvQVJubVh6ZDVTU3Vacm9mYXZieXlRcExBcFJp?=
 =?utf-8?B?RXJMRy9xMm9JeHNSbW4xU1ZzMjM0N3Q5MUg3NVNtTVZZYUwxaVJodTh3YUli?=
 =?utf-8?B?MCtzT3NzOHczbXUrb2ZhQTVwRVl1YWJGS1dkbm15Zk5hOTlSbERuMFQ4Q3Bx?=
 =?utf-8?B?RjVNanI1MW56bmpmUFloUVJjV1Z6RTVjeC90SEcwektqY2Y3U2gyUFdHaXo1?=
 =?utf-8?B?U2wySkNEbFhsanBDWVMrMnJTbGJPbW5GVmlaZjVhYlpMV0llbHlENzU2Yk5p?=
 =?utf-8?B?QWpnckc2Wmdxa1o4YjdJQ3NQRlhZTldZU1RicUNFVnBQZnJvV3VQMFpnRWJN?=
 =?utf-8?B?d1VMWFVqT3BQZlpxczhCdkhpZXUySVFhN3IxM09QWVFXUWExVkZUNVo5QktS?=
 =?utf-8?B?cGVBa25QZlQvbmRSUWRtSnZQcm1TbTR2bTJxeTJidnUzMjFOcUlTeFVuU2pu?=
 =?utf-8?B?VDVSMTlueHBIQURhT0xhZjNDTTBsR2dZTXJPRHo0alEwTEp2OHlDY3A4QVJD?=
 =?utf-8?B?aGdtZGw2cmVVQTNHNlZaM29adlMzR252ZXhsbkh2OWZuQjhPellJSjRhZkdE?=
 =?utf-8?B?V2lEREY1ZFdSOC9kNGo0SnN3UU5DQlRZc1hoQ1M2dnR2bEtxMW5uODkzamw2?=
 =?utf-8?B?a2R4WllIK2JLTnNySk80TVpveVUxVTAwcG9EVlM3T2tqRzlWcnlrOHU4c2dH?=
 =?utf-8?B?RjVZRGpibXBWQzNGeEV2SWRDOUpFa2x6WUJsdThXMzVlRk9lNUd2RWJyZDVF?=
 =?utf-8?B?RU5TNjRKSlF0ZlRRbUlyYm4zc25oNXpseGtwQndwQWJNR1dwVWRtQm5sMzh5?=
 =?utf-8?B?UEdhQUFuYW9Ha1JjUjJUalVEMXhyYjZ2ZVhpT3pQU0FOTWhHVjZLNXBmekxw?=
 =?utf-8?B?VkQ1ZU5BUk85MVA4TEhGSFFJSUJUTWd0aGVYMlljSitoeHI4Sk5Ydmp5SGd2?=
 =?utf-8?B?SkVFcGhubUxnaC9WclRuaDhjNnhIQmpXU0V4ZmlWUEpxVWhSOGZiZlBDR1RH?=
 =?utf-8?B?RTlKT1NmbXMyaGl6NDFDaWkyQUJ3Umk4Y0NDV2tKZWQzUjVHK3NjcGJnbkFz?=
 =?utf-8?B?QkpjcmtJTHhndEUwRTZxRHQ3d0JZNUtKQTk3akp4eUwxMUExRnhmRldwMEty?=
 =?utf-8?B?c1J0TXlRYkhZeGE5NHNRbEdXSVp0WWdvL2ZCbmhPRlcvUXUyYlFCcU1FQlZK?=
 =?utf-8?B?a05tOC9YVmJrdjZSY2RlTFU0b1IzVGpqaVRhSFhVNmthM1U1R1VBZjlTcmJt?=
 =?utf-8?B?YjFQQkxoTStUdkZocXlKOW9sei9KQk13MC93NFVrYVhRcFoxYmZrQ2M4bU9P?=
 =?utf-8?B?OFhoMm5zeVUxdCszcGRIaC9MdzRyMjFCMVRSdEpveGxVQmUwQzJiU0JlRHF4?=
 =?utf-8?B?VWM5STVkZVFoU0poYzJaL0Q5WUtwWER1RjN1b1pwSVdlSFF1clV0VXNDVjRz?=
 =?utf-8?B?MHhLQXhJMk8wdVc1aDViVFNoVkE5enlUUGs1MTFwVlR2THkwcjZ6ZGJWRmZZ?=
 =?utf-8?B?bys1RmVybVR0OFNDczRmOEs0ZnpnRExoYTBPVlFNOURWbUYxaURjVDgrckpm?=
 =?utf-8?B?MG5pdU82VDU5MVpEb2tOd0h0VTNJNTFqYmY3Z2kzSUNZL3hJNzNOc0c4ZEtE?=
 =?utf-8?B?eHBqL3dFaUVjVGZVcnlhMnZsZURMOU1ZTkIyak85MEwvU0JodVdUYjg1ZXJr?=
 =?utf-8?B?bjRKRE0raWZ6V2V1N01WYllOWWxycVdzcmpNNjlyT1ZrWXlaTVN5TFl3WFVQ?=
 =?utf-8?B?QjEySmJ3dFQwUFhlRURXblpkRlhBVWZCVVhaU1UzcnI0VnJGMS9Uem1uMHdJ?=
 =?utf-8?B?R1FXQkpXdDhNRXZhSGtFb3FWZk1JNVhrMyswcW82TGd5RVFoTFdzYklraXFk?=
 =?utf-8?Q?3UPk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5d02d2-4126-4e69-fee8-08dd71b27960
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 06:49:11.4325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jwYeS1itCJtFJ3BuGomPoBOEKx1mDI8Da45Xy0T6UEFCmtGPuptQviPN4eYMIB9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF6BCF148B6
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

Adding Leo since that is especially interesting for our multimedia engines.

@Leo could you spare someone to test and maybe review this?

Am 31.03.25 um 22:16 schrieb Tvrtko Ursulin:
> This is similar to v2 but I dropped some patches (for now) and added some new
> ones. Most notably deadline scaling based on queue depth appears to be able to
> add a little bit of fairness with spammy clients (deep submission queue).
>
> As such, on the high level main advantages of the series:
>
>  1. Code simplification - no more multiple run queues.
>  2. Scheduling quality - schedules better than FIFO.
>  3. No more RR is even more code simplification but this one needs to be tested
>     and approved by someone who actually uses RR.
>
> In the future futher simplifactions and improvements should be possible on top
> of this work. But for now I keep it simple.
>
> First patch adds some unit tests which allow for easy evaluation of scheduling
> behaviour against different client submission patterns. From there onwards it is
> a hopefully natural progression of patches (or close) to the end result which is
> a slightly more fair scheduler than FIFO.
>
> Regarding the submission patterns tested, it is always two parallel clients
> and they broadly cover these categories:
>
>  * Deep queue clients
>  * Hogs versus interactive
>  * Priority handling

First of all, impressive piece of work.

>
> Lets look at the results:
>
> 1. Two normal priority deep queue clients.
>
> These ones submit one second worth of 8ms jobs. As fast as they can, no
> dependencies etc. There is no difference in runtime between FIFO and qddl but
> the latter allows both clients to progress with work more evenly:
>
> https://people.igalia.com/tursulin/drm-sched-qddl/normal-normal.png
>
> (X axis is time, Y is submitted queue-depth, hence lowering of qd corresponds
>   with work progress for both clients, tested with both schedulers separately.)

This was basically the killer argument why we implemented FIFO in the first place. RR completely sucked on fairness when you have many clients submitting many small jobs.

Looks like that the deadline scheduler is even better than FIFO in that regard, but I would also add a test with (for example) 100 clients doing submissions at the same time.

>
> 2. Same two clients but one is now low priority.
>
> https://people.igalia.com/tursulin/drm-sched-qddl/normal-low.png
>
> Normal priority client is a solid line, low priority dotted. We can see how FIFO
> completely starves the low priority client until the normal priority is fully
> done. Only then the low priority client gets any GPU time.
>
> In constrast, qddl allows some GPU time to the low priority client.
>
> 3. Same clients but now high versus normal priority.
>
> Similar behaviour as in the previous one with normal a bit less de-prioritised
> relative to high, than low was against normal.
>
> https://people.igalia.com/tursulin/drm-sched-qddl/high-normal.png
>
> 4. Heavy load vs interactive client.
>
> Heavy client emits a 75% GPU load in the format of 3x 2.5ms jobs followed by a
> 2.5ms wait.
>
> Interactive client emites a 10% GPU load in the format of 1x 1ms job followed
> by a 9ms wait.
>
> This simulates an interactive graphical client used on top of a relatively heavy
> background load but no GPU oversubscription.
>
> Graphs show the interactive client only and from now on, instead of looking at
> the client's queue depth, we look at its "fps".
>
> https://people.igalia.com/tursulin/drm-sched-qddl/heavy-interactive.png
>
> We can see that qddl allows a slighty higher fps for the interactive client
> which is good.

The most interesting question for this is what is the maximum frame time?

E.g. how long needs the user to wait for a response from the interactive client at maximum?

Thanks,
Christian.

> 5. Low priority GPU hog versus heavy-interactive.
>
> Low priority client: 3x 2.5ms jobs client followed by a 0.5ms wait.
> Interactive client: 1x 0.5ms job followed by a 10ms wait.
>
> https://people.igalia.com/tursulin/drm-sched-qddl/lowhog-interactive.png
>
> No difference between the schedulers.
>
> 6. Last set of test scenarios will have three subgroups.
>
> In all cases we have two interactive (synchronous, single job at a time) clients
> with a 50% "duty cycle" GPU time usage.
>
> Client 1: 1.5ms job + 1.5ms wait (aka short bursty)
> Client 2: 2.5ms job + 2.5ms wait (aka long bursty)
>
> a) Both normal priority.
>
> https://people.igalia.com/tursulin/drm-sched-qddl/5050-short.png
> https://people.igalia.com/tursulin/drm-sched-qddl/5050-long.png
>
> Both schedulers favour the higher frequency duty cycle with qddl giving it a
> little bit more which should be good for interactivity.
>
> b) Normal vs low priority.
>
> https://people.igalia.com/tursulin/drm-sched-qddl/5050-normal-low-normal.png
> https://people.igalia.com/tursulin/drm-sched-qddl/5050-normal-low-low.png
>
> Qddl gives a bit more to the normal than low.
>
> c) High vs normal priority.
>
> https://people.igalia.com/tursulin/drm-sched-qddl/5050-high-normal-high.png
> https://people.igalia.com/tursulin/drm-sched-qddl/5050-high-normal-normal.png
>
> Again, qddl gives a bit more share to the higher priority client.
>
> On the overall qddl looks like a potential improvement in terms of fairness,
> especially avoiding priority starvation. There do not appear to be any
> regressions with the tested workloads.
>
> As before, I am looking for feedback, ideas for what kind of submission
> scenarios to test. Testers on different GPUs would be very welcome too.
>
> And I should probably test round-robin at some point, to see if we are maybe
> okay to drop unconditionally, it or further work improving qddl would be needed.
>
> v2:
>  * Fixed many rebase errors.
>  * Added some new patches.
>  * Dropped single shot dependecy handling.
>
> v3:
>  * Added scheduling quality unit tests.
>  * Refined a tiny bit by adding some fairness.
>  * Dropped a few patches for now.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Cc: Michel Dänzer <michel.daenzer@mailbox.org>
>
> Tvrtko Ursulin (14):
>   drm/sched: Add some scheduling quality unit tests
>   drm/sched: Avoid double re-lock on the job free path
>   drm/sched: Consolidate drm_sched_job_timedout
>   drm/sched: Clarify locked section in drm_sched_rq_select_entity_fifo
>   drm/sched: Consolidate drm_sched_rq_select_entity_rr
>   drm/sched: Implement RR via FIFO
>   drm/sched: Consolidate entity run queue management
>   drm/sched: Move run queue related code into a separate file
>   drm/sched: Add deadline policy
>   drm/sched: Remove FIFO and RR and simplify to a single run queue
>   drm/sched: Queue all free credits in one worker invocation
>   drm/sched: Embed run queue singleton into the scheduler
>   drm/sched: De-clutter drm_sched_init
>   drm/sched: Scale deadlines depending on queue depth
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |  27 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |   5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       |   8 +-
>  drivers/gpu/drm/scheduler/Makefile            |   2 +-
>  drivers/gpu/drm/scheduler/sched_entity.c      | 121 ++--
>  drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
>  drivers/gpu/drm/scheduler/sched_internal.h    |  17 +-
>  drivers/gpu/drm/scheduler/sched_main.c        | 581 ++++--------------
>  drivers/gpu/drm/scheduler/sched_rq.c          | 188 ++++++
>  drivers/gpu/drm/scheduler/tests/Makefile      |   3 +-
>  .../gpu/drm/scheduler/tests/tests_scheduler.c | 548 +++++++++++++++++
>  include/drm/gpu_scheduler.h                   |  17 +-
>  15 files changed, 962 insertions(+), 579 deletions(-)
>  create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
>  create mode 100644 drivers/gpu/drm/scheduler/tests/tests_scheduler.c
>

