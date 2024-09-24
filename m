Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6F4984786
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 16:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC51910E6F9;
	Tue, 24 Sep 2024 14:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XSC5iq9x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5130210E6EF;
 Tue, 24 Sep 2024 14:20:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHcl5cKtwuYaZ1T1KGtKfTX/fNqRMUpBbx9XtkIk2SUm9Aqec9TtmixzluSwJwa3845rl7XADhgkF0DgkHtFyhTgxAswB3eCzTMWN1KQN2sZ/sVs6DnomJeCDB5bE0KvaPjL6gsN0DKshtLNzvvKo4SRoMa6cge72CUTXarjUFoifQoH60g38YHZK0gHHYcA16MKzBsXygCrvOdyo2XZ2UKYpcz/I7MtjeXEZZ6VgVQyCANcCyj+5bF8/Xfsg75g++MIp9dcfYnR11GTKofxtg7jCwSrY6VI9ToPf4F5nqdEk8qpEzJlmMbWxtRYs4KCS7Xwfg0ElvwHbaVn9Qwwrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9lG8Sk1PJwY1ph/st5eLMFT2biorMZHgVrDr33w3kk=;
 b=i0Ka9nTws1a/kkixTy1vl7RR1UtNX4D6sJjUZ7DfHphFWFAkXJ74fdBsYiqiNw/jFKTergt6xMzDCiGcpoZyMcDTa+fBodOMH6x4VJeDl02EShjHXIi/ZQXTmida3tPKcrENnG9JEQ7P+alEeqj0ucyFvNXFramuCZy/cW2tiqICOZbP51WcbcObO5Qcs3hCWmeakVNNjhQWCi5fw5FS/HeUtnzR+zCTu29Lwta7sbF0VhuUaAtV2BHEFAbP0nLHwwSFNb7qAPMMpTcB/cNInlQw4xwT+ZKNmZxQU40cFIwdxwt9Hfr3PHZZrvF7z8ZYCVfR7nBNfj2GoNpJQ9Q39A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9lG8Sk1PJwY1ph/st5eLMFT2biorMZHgVrDr33w3kk=;
 b=XSC5iq9x1XL06TZrvO7y6ykuskTgxk1YynT30BQETm7t36lg22RZ+ig4j2o7NQxAk63eNimQ6iIcBLpwpgT/mpGekufgbZGAOQFmIa/C0wUQgkCvtDVaXKzr9//g+85rd47x58obaAyDVSBGCF3lvtsmfwreYaGq8rE7j6dpPnk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB8168.namprd12.prod.outlook.com (2603:10b6:a03:4e7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 14:20:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7982.012; Tue, 24 Sep 2024
 14:20:51 +0000
Message-ID: <2df3ce7d-9f3e-4530-88ad-d7376f1336d2@amd.com>
Date: Tue, 24 Sep 2024 16:20:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/sched: Always wake up correct scheduler in
 drm_sched_entity_push_job
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Philipp Stanner <pstanner@redhat.com>, stable@vger.kernel.org
References: <20240924101914.2713-1-tursulin@igalia.com>
 <20240924101914.2713-3-tursulin@igalia.com>
 <4dcce6db-cdb1-4378-8fea-8540ec7539ef@amd.com>
 <1b56854b-5357-4efa-b31b-950eb85ee277@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <1b56854b-5357-4efa-b31b-950eb85ee277@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:208:32a::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: 30fdc4ab-f4c9-4a3e-da40-08dcdca417d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEx2YW9pS0lBL2lPbUhJUDBPMWMvT3Y2eGJKd1E5NitnR1l2Tm1ZVVJFOG9w?=
 =?utf-8?B?VjJGRlVtU1VmOE1yNXJpSTdjcTRvNzNORFpveTA0d2JqdkFlZkppSDdJb204?=
 =?utf-8?B?LzV2Q1pLcnZ3TkM1K05UYWU1SEFRaHdZUHk0ZDliSnFYZlhFU1IzTWo2NGxm?=
 =?utf-8?B?MmJGMFRZSlMyc3lTR0FVTndBRytlVkRGU3Era3FDYU9kWWZVeWxXeTh5cVAv?=
 =?utf-8?B?ZHJHSkJLTlR5QURNcEc4MWRVT2ZSZHhMcDErUkhCRnV0OTJtM2swM3NqMnhL?=
 =?utf-8?B?Nms1VXVlcC9Rejc5ZzZJY0NDWXg5M3NPaFUyOW03aHVpTlY3UEFxRnJsSHg3?=
 =?utf-8?B?clpQaHo4bzd4OS9vZ3JDVU82eVh3elk4MDFTYzcxYWI2Tm5RT0llOVNid0RP?=
 =?utf-8?B?SVQ2UDBqT2hpVFVRVEhSU3B2UklXVzg4WWp6ZDBaZ2NYcTdHVFF1R2RhWXkz?=
 =?utf-8?B?bm1jT2lsZVNPbzd4SVdXV0lvMTI5L0JLbmxKcUFwNTYrakZ6RTlHMVhXQ0R6?=
 =?utf-8?B?MUpZSmxDbC9YTjJvVlJsODZrNHd1QnRFYjlrbmdkTzZRNmhKdW5NWFlVY0Nr?=
 =?utf-8?B?dVFoVWNWUGYyR3Q3V0dZa2F0VXo0bzhPQVc4TnkxMjlZT2YrWjZOLzhZS1Vi?=
 =?utf-8?B?WUptZnk1UGZ5ZWtKbjdoc1l6M3JsMEU5YmliakthN2o1MGNJRUNQWmF1eWhO?=
 =?utf-8?B?UmVzaEFNYkNzVFJ3SWs2MjVSQnRvS3QvY3hlOXBTbEVvdGlVbWwxTlE0UmtC?=
 =?utf-8?B?WjVMMkUwdlF6SU8wUWRCeTFGdEpTeXhKQ081RzRoOXpLelptTGVrQisvTEpX?=
 =?utf-8?B?cnlMaDBweTBHaHdjQUkwN0FnYTArZUJBYW9tT1lqRE9EWjFLOU1hODRVS0Rw?=
 =?utf-8?B?V3NSaEU0dTNZN3liQ1JKeUF6MG5yT2pPbEZhK3ltYUthdHByOElvWTRwM1Y3?=
 =?utf-8?B?VEhaNmVOSS83Z3FkOGNlYnFreTRaSytkdUVvRlErMWVoVzZNRjVKSVJTWmR2?=
 =?utf-8?B?Z2VUaENtYXg0djdVZDl6TFNETFUzRmZjRG1qaThoZlgxRUxOQUpnMjFEYUJX?=
 =?utf-8?B?VktmWTBUcVZCTEpTZUloTjlKQ1lDWGM1L1J3SWFPUjAydlRHclRQMndOMGNY?=
 =?utf-8?B?ckdpcGZ4MHFYSzgrSGwyUWZsbVNDOGlraE1lWXRlLzZVV2V5UUJ2RkNjQ1Ba?=
 =?utf-8?B?QXVndGdFY0V5NXh1cTE3SkxJOHZ0d2hkT2VJL1BrSEx6SDUyVzRXZllONjlj?=
 =?utf-8?B?NmdEaXhscmwvdms1ekJMUkRnQkN0aU9jOFgxcGhtaEdKaGRQYTZEY20vTUtM?=
 =?utf-8?B?SXF2dTNUcXN2QnkySFhEWERIWkR0WHNsOENxb2dHMHNleGlEV3duZnIyVFBt?=
 =?utf-8?B?MXZqdTNZYnZtclJyb2M4RTlUbERQWURWaStlaEFsQnhlV0ZHeXZEY2hPWTk0?=
 =?utf-8?B?U3JNTEF4K2FmVDBma1FaZGhvODUvRG8xbkNlUkQ3b251NURuWFdoMzhZdFU3?=
 =?utf-8?B?TldKNDBEM2RueE42R1N3aWtjMlNjQ1MzQXJzOGRkRzFESFo0M280SnRuUzB5?=
 =?utf-8?B?YTlpcnR6ODZSNmxjbnpsNlh5SFhYaVlqcnNKUVhrRnNjTXRvd29yTm50UThC?=
 =?utf-8?B?d1VSa3dESjgrLzhFZndoYzd2a3FnU1lVcDlyaW5PcHZSeFR5NkFyZ3NseDJN?=
 =?utf-8?B?SlUzSE5ZZlJjVW9IejAxckN3bWp6Sk4xb0psb1NTbzZyeE04NXRIc2twZ1V2?=
 =?utf-8?B?NzY5ME5PSXhFcHBvQ2Z3ZENTb2I4MjlJWDR2SjNkNHQ1cTQ0REdYYVFEQ3RH?=
 =?utf-8?B?Y2YydW9CYzdHU2dPRFpuZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm1VK3plMDZIQ0RudTBUeFpWUmcxdUtRb2VPdGk3VUdNTUMvb3Q1QmU3REFn?=
 =?utf-8?B?bVplaTltVm1Gb0dsNjNpZEVMUm1GRkN6cFpYMndlTFozNVQxYmx3eHBBM3Nm?=
 =?utf-8?B?NFZvOU1XeHVIMktDTW80Zi81VnhtNW9HeWUveSs2V0xkTlBwSXRJQTBnK3Vl?=
 =?utf-8?B?M0Rwb05UQ2xnOGZHZ05HMVg5K1ZmUzhWeE1xOUF1Q3pYK1dveEpaMEtVL1dO?=
 =?utf-8?B?ay9rQmdTMWxaclpjbkJ3dTNsMjhhU1pDcU9CWGNkVXdLOWVYamFVN3BIbjdq?=
 =?utf-8?B?dVY0SjRzV08zTG1kOFMrWHlqS2NtckpaZk50TDVkWHR3L2NKeU90SUh1amhr?=
 =?utf-8?B?ZUhzUHc1NDBKUUxPQnhsUFBGV1N5Z05Eb01oeklrWVRvY25lMGsrRitVd0JK?=
 =?utf-8?B?Z0RCQU5yQlhyWWJLYTBGQ2laRUxJTkZvVjZPbExsTmJEWTdHekVZaTJsOGFn?=
 =?utf-8?B?dE1HZkZ6WWo1dWdFTy9ianRwaGdpZDFHa21BcUVOWERJZDBKVTRkVzRiQlRr?=
 =?utf-8?B?NzdxQ21ZYzRiS3ZZOUR2QmFTb1VzbTNSeW4xQlUzTUk0SVFLbHUvWUlhNmor?=
 =?utf-8?B?WTFrbWlzSE9jeXZ5U2xaZFBqZnpSWnlrTlViZVYwaGNEWk5xdFZXZFlmUjN3?=
 =?utf-8?B?K1N6bXF4d3ZiaTBQRC9NMHJHdzBEeFR4cFBmcnI2RTJTd3cwSTdSbHI0R2xZ?=
 =?utf-8?B?UnpjeU1FT3BrcDY3aExSTUdMVHFHZHhKcm8zS0J3NVdTekZDU0ZLc0pLeVVO?=
 =?utf-8?B?RSt2YUk4Z291QzF2MlYxUm1sVEZ2bXRhbS95YW9hbm52TFY3dkJCR1NROWho?=
 =?utf-8?B?MXl2ZWxYWWxwc0M1d0NZSHJKN09ud2VjV1EzNFNNUG5nZzNTcmRLdEhvQTRq?=
 =?utf-8?B?UlA0MjZqOGIzd0dNeTMrcVhmSlQ0cXVyRTBMVFJYOEZlRXIwVUp2WjJxNDRO?=
 =?utf-8?B?UUlUZVg1dnR4aWsyelN3MmJBR3I1WVRQQTFjWXRKdk9FRzlzVEdxcDBueE1k?=
 =?utf-8?B?aDU5dmtKK3hVaUFid1IvSFA3UXJWTUVnVDRhV1RjcmZuL094bWpXdXQzZWFW?=
 =?utf-8?B?WXp3MFJqanZ0VHFLSHpFdEwzbmxncXIyYUN3c213dGFabThrQTlJMG1xb0pu?=
 =?utf-8?B?UGxHRWNwdHVzSi83WDhuK2NMT0xyV01mMXBaTzM1OFFjbUcvbnB5NWZRT2No?=
 =?utf-8?B?WG9GT25sUG13UkZISXp0VktHcHkyN2hxVWtHMFZ5RmtscTJPb2luTG5IZUd0?=
 =?utf-8?B?WVMzQSs4VmtZcEZBTGlKbVhVZE4xOFFDNktrVmhhTkZqbDBqS2hiNXg5ZW5M?=
 =?utf-8?B?VEVoS2dEN0paZTVQWFlheUowZUZzU2s1R28vUzNOUE05a0dEd1h3R0FOR2s1?=
 =?utf-8?B?aStEM2tmdXl4dy8vTHVyNlN2b2VHWTJuWFFVcENZUFlmcUZGRm1mdzlwb3lV?=
 =?utf-8?B?K1Zxam8rdHUwN29DMExPSEFFLzF4cG5XSFM1M1J1RkwrNHc4VDBQOWl1WDJN?=
 =?utf-8?B?bnhRUHVtZWFDUmVJcTkvM2d5czAvNDFGc3R4OFBLM1J2V0ZvT3JtZHcrT3h5?=
 =?utf-8?B?bGErZ09vcDFoYkV5M1FmZi9TNWFtRUw0V1ZvWVU4L1JBczlpZHFYMmZ1ZHl1?=
 =?utf-8?B?ak5FVEdUVmxScU90bWl0SG9IZlFkeEY2TjhMczNubk51MWt4dy9hRWJNYnls?=
 =?utf-8?B?OUo1bjMzSFNwbWZTc2pPcE42anVPWHljclFlckIvdlhMaGJueWxMcFI1aXgv?=
 =?utf-8?B?aWk1MGEybEU5NnNKeDVON242azV6M1QwYW9DS09sRFZPcUNRWDFVZ2RJQTY4?=
 =?utf-8?B?OVBqZU1PbnRhWHljbFZZcm1yVE42ZDhqRzJ5dFhTbmU1ajkyU1dhTnUwa3RI?=
 =?utf-8?B?MXZYa2JQYi9nU0JIYkQ4cFA1WFFiWEJFaUlMUEY3T2xtR285MXlSQVNPT3pP?=
 =?utf-8?B?Uis1UmFFUHpoWW5wUDVjVDRGekJoeEZHL0pjNlkvdDZ0ZTFPKzdxWWcvTjlL?=
 =?utf-8?B?QnJDNHRUS1JxN2NNbllLVUgxbUFRQjIxZU5ESzZTdVVEU2hEZE5pK1F6RDFt?=
 =?utf-8?B?NVFDZWVBV2o1Yll0U1UvRXNEU2NsNk9tcjdGNUpVRzBFd2RGTTFqdUMrZ0FF?=
 =?utf-8?Q?G0NI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fdc4ab-f4c9-4a3e-da40-08dcdca417d5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 14:20:51.4032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WU6hZysJyD78OZXpYPoudhzr0JHLbNXeb0hbWSmjzXntooHWVOSp3J1G6WI+xm2G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8168
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

Am 24.09.24 um 16:12 schrieb Tvrtko Ursulin:
>
> On 24/09/2024 14:55, Christian König wrote:
>> I've pushed the first to drm-misc-next, but that one here fails to 
>> apply cleanly.
>
> This appears due 440d52b370b0 ("drm/sched: Fix dynamic job-flow 
> control race") in drm-misc-fixes.
>
> In theory 1-3 from my series are fixes. Should they also go to 
> drm-misc-fixes? I am not too familiar with the drm-misc flow.

Ah shit, in that case you should have spitted the patches up into fixes 
and next. Going to push the first 3 to fixes.

> Or the series now needs to wait for some backmerge?

Are the remaining 3 patches independent? If not then we need to wait for 
a backmerge.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>> Am 24.09.24 um 12:19 schrieb Tvrtko Ursulin:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>
>>> Since drm_sched_entity_modify_sched() can modify the entities run 
>>> queue,
>>> lets make sure to only dereference the pointer once so both adding and
>>> waking up are guaranteed to be consistent.
>>>
>>> Alternative of moving the spin_unlock to after the wake up would for 
>>> now
>>> be more problematic since the same lock is taken inside
>>> drm_sched_rq_update_fifo().
>>>
>>> v2:
>>>   * Improve commit message. (Philipp)
>>>   * Cache the scheduler pointer directly. (Christian)
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Fixes: b37aced31eb0 ("drm/scheduler: implement a function to modify 
>>> sched list")
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Philipp Stanner <pstanner@redhat.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: <stable@vger.kernel.org> # v5.7+
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_entity.c | 10 ++++++++--
>>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index 0e002c17fcb6..a75eede8bf8d 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -599,6 +599,9 @@ void drm_sched_entity_push_job(struct 
>>> drm_sched_job *sched_job)
>>>       /* first job wakes up scheduler */
>>>       if (first) {
>>> +        struct drm_gpu_scheduler *sched;
>>> +        struct drm_sched_rq *rq;
>>> +
>>>           /* Add the entity to the run queue */
>>>           spin_lock(&entity->rq_lock);
>>>           if (entity->stopped) {
>>> @@ -608,13 +611,16 @@ void drm_sched_entity_push_job(struct 
>>> drm_sched_job *sched_job)
>>>               return;
>>>           }
>>> -        drm_sched_rq_add_entity(entity->rq, entity);
>>> +        rq = entity->rq;
>>> +        sched = rq->sched;
>>> +
>>> +        drm_sched_rq_add_entity(rq, entity);
>>>           spin_unlock(&entity->rq_lock);
>>>           if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>               drm_sched_rq_update_fifo(entity, submit_ts);
>>> -        drm_sched_wakeup(entity->rq->sched);
>>> +        drm_sched_wakeup(sched);
>>>       }
>>>   }
>>>   EXPORT_SYMBOL(drm_sched_entity_push_job);
>>

