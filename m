Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76769CDD6D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 12:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDE910E28F;
	Fri, 15 Nov 2024 11:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yQz5A7ME";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35B910E282
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 11:26:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=un5kNZralplPibpPpf1ZJ7AuQSN94lJK1zEaMACEF2QYn0AAc0R+Rtu9O06/Cf5gGBnNixIu8zuJhIzaLgv6KEmKwy8RB5muRG6nxq6SEuLqCMrTMklYmqRSDBwI0aq+iYuYY5AjFqPvV7Pn0ekvIOPzEd0YjHIQ0gn+Ep9mECy3oycDlx5X6mmwYoawd/2M1x1fInLdwZgwy2xPkj/SXrXvvhoDEF2EhLVtn3NXbtfHafKFarquCAn2gcGV9pn2YgvlgKhn0oMz+ObE5zc/T5hd5e2Sh7hVvNXBo801ClHQdkmLgfiXB+PK6KD/n3ypmoVQuQ+CP5XDgTOl0ayN5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=im/ysrNkjJ4eFwuWniGJrVZK2Z63ZSiG6Rf+BauWOoc=;
 b=k1KtYhChS6MeXNnbWXK4qar/M0vnPSRydF52YSK5SIjnbAzgDOe/AAg3wvPfqRXohHi8x1bCH6PQtsvIW1JevawsmJt0Y3R3TaqTIODfgDgg1Ryt7BsWUgAPTPKqcOtntSiYQsB4z52RyrQj4i9BLRGjvt+eQSrbe6k+9gOUVodpsZ7DzWRrlmjfXo4KExraqMljAPAOiwMKmA+b8lp87MjKmbW/Il9NblcPPjpTXyfB4Fn9Zxht4XNfbPz2aRmzxojVw7bd6IcyHU59fhZktmn/qeLIDvNB+VVTGYqJfKEez/Qgwet3+PJcSn4hCAyNe4xBxFRS1ZigHXNT3BdHKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=im/ysrNkjJ4eFwuWniGJrVZK2Z63ZSiG6Rf+BauWOoc=;
 b=yQz5A7MEb3e7Wb62g7s2uYf9sfe06F9WnhVxAbq5JkyU5QoVYMnuowAcgUx6JcWpSJfEhq/hpKUAnAAoZZPUpNk8xT1CFY998R/IXxMjgFEQaE9A/2dp5Sx1d5v3KLf6S/IBRWn31h+GZreqFKlyCMiBRP0M1nctiN5FBuzA4h4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB5628.namprd12.prod.outlook.com (2603:10b6:303:185::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Fri, 15 Nov
 2024 11:26:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.027; Fri, 15 Nov 2024
 11:26:49 +0000
Message-ID: <32fdb74a-00c5-489c-b561-c530d23c4098@amd.com>
Date: Fri, 15 Nov 2024 12:26:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
To: Philipp Stanner <pstanner@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 ltuikov89@gmail.com, Matthew Brost <matthew.brost@intel.com>
References: <20240918133956.26557-1-christian.koenig@amd.com>
 <8a0e7e0b0d2ef05954240434759ca79f25328b73.camel@redhat.com>
 <e2231195-8fed-4b25-8852-589794665e70@gmail.com>
 <2f0b15d47576f25b65927de6c039a6d9839dbb81.camel@redhat.com>
 <cef7c754-df50-409b-a7ee-4c184afafa5c@gmail.com>
 <ZvKgAbiydG8Y9Z3F@phenom.ffwll.local>
 <a2ef4cdfeb31ad95de9311274de73a51cdc54a97.camel@redhat.com>
 <64c478a7-0afb-4b9b-8a7a-6e204a79cc20@gmail.com> <Zw0xHB_UNOvRq0L7@pollux>
 <6b656a2e199d1fa1d33684572a93e327cba0ae83.camel@redhat.com>
 <a936d96485fbd8401439a0939abb15f140ed5018.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a936d96485fbd8401439a0939abb15f140ed5018.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0405.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB5628:EE_
X-MS-Office365-Filtering-Correlation-Id: 3af81c78-e9c3-4527-1ab9-08dd056865b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmxOckpoN1NzZ0lad0JJd0lDdStrdnYrci92T2RJWC9hUmVPTittbWNsZWlz?=
 =?utf-8?B?R1FOd1lCUnVxT0pyZkQxenNiSHRoWUZ2UFhCRUlDdzd6SWxVbmdOTldZQnh1?=
 =?utf-8?B?ajlSNGRqeTkxQzMxa3pGbnYvUGMrMlZuZlFhNDF0ZzNYYU1HTHFuTVhPZHMv?=
 =?utf-8?B?citweTMwbmZYVDNkbStFdXYvREsydmxIaWVvSWttR3lkOWZwSXJwUTRKem5n?=
 =?utf-8?B?QUI3b1BSYVRSZnI5OVNKbm9qejlpUXVqcVBpRGJJUmpWMGh1aHkvbWhvYTFa?=
 =?utf-8?B?NThzNllvZWhzanlkeFA4aW42MGVXeU1aaklYR2lVenJXNy91eDA4K0RjMzV2?=
 =?utf-8?B?ejJ6K0NUenNuVXZpNWJtYUFneTR6MGZJNmFuM1ZSelM0RS9hcGJ0NlEvdzFD?=
 =?utf-8?B?SSs2bTJLakVCQ3EyMCt6eERsdEdvcTZieElNV2s4WS9oVHNnS1M1MGRaNHps?=
 =?utf-8?B?V2dhNnQra2hHeW45SDFMMmpJRFFacy9paWhjeWduaGdUa1J1SHI1dk04UUU0?=
 =?utf-8?B?ZE8xY0luaUMvVHExLzBTVEw3N2NhMlFtNHYyZmh0SFBrV0c0VkVZKzgwWXBI?=
 =?utf-8?B?WDBMN2lOR1V4NEQyOXZUQXI3WGxQQkM2OW5GRks0MmlCY1c3c1RVbUVjUGNo?=
 =?utf-8?B?Y010UVF2TVIvTmJWR3hvaVpLTEo5UEMwQ2FSSEtLUG5WV2I4TEJWREFkbnVL?=
 =?utf-8?B?TVI4RHV3RFplM05MOWYwUjVHNXFHbSttK1hjNHBtNkR4STZOUGo1aEtKdmNO?=
 =?utf-8?B?YzBNQ2hKTkRNdlhIQWdySlhTR1gzREF1WXlOcmozRVJaalBWd2tzdVJpemZ3?=
 =?utf-8?B?RGJ4K1dIQUxQakV5VUNidXduTld6dFdSTjRKWE5lOERZT3g3b1JvUkJWZGlI?=
 =?utf-8?B?Q0t1b3Brc0tQR3c0MzA0K2pDK3BpamM1RmRxbFZPQlpLK085SnREa0VEbVRB?=
 =?utf-8?B?ZWNEYjBSVURSM1J6SVFmR25qWXFmSzJiSitsN2xrbFdMaFp1aUg1UnMrQVo3?=
 =?utf-8?B?QnJ6RjZSNkwwTUdXK2ZoR0dqTWRwRnF1bmxzRTZ3UC9wMS9HZmt4QUFVcXNv?=
 =?utf-8?B?MmRlRVlqVyt5WnBGQnZIOEdlNjJ2QmJlL0ljY3RVbHFYZ3VzT2F1M2c4bk8x?=
 =?utf-8?B?YnFSS0wyOEc5K3FubG9JR0ZvNFBubTB4M2hQZndWbmFtOVBPYXlUbHBTT29N?=
 =?utf-8?B?cW5YUmlUdWovTTFJMHVXK3pyeEJwei9yN1I3UFBZenQxR0x1YTk3NW44cUFH?=
 =?utf-8?B?bXBsMkNZMFdaZ3BkQmJZZXZYd2hia2J5UkRnN0RtL3NzR01HMVVySHhkNTQ3?=
 =?utf-8?B?M1lYK1J4ZTZzTlV4V1h4VlMzdEh4STA1VXM3OWdwaldKdCtQVExaVDR6djBh?=
 =?utf-8?B?U1ora1ZmWC85M1lOOVBZb3prdGVEUE1VdDJPMmxlekkwbTQ2cWs1dEVDSUhq?=
 =?utf-8?B?d3M0VXp4eExNZ3RQM0FDOHF0aUVDc25Fc2M0VXBQQWpkQXRwZUN4MGFCdFdj?=
 =?utf-8?B?RyszbXZTVE9pTEg0cFNnd1BHQmRMMWV1dS9EQW9maFRPQUxJQXV0WTlOeUNE?=
 =?utf-8?B?ajVpQUJFMVlKWEF6SlhZOTJ4d0lRNzNlK3ZRd3FHbmVrc1BHUXVDT2xCUm1p?=
 =?utf-8?B?enpTemlyeWZDMmxyWllzZWVTUDdnb3picWdlRFFPUGhnVDl2UEl5UGFpb3Jt?=
 =?utf-8?B?UEdEbWZ4aW8wdytNbElvbzNxZ0FCV014cmdtcVVUSHRERk9MTFlaVm5SbGh2?=
 =?utf-8?Q?Va9qavLzNYn4vLus8SCVjDQfnWlcsAbIdkfyjJt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWRMU3ZZMytvbzlzbHpkNU9tUmJudmltMDJGSk91UjhUMGxPWWJjVjVJR3Z1?=
 =?utf-8?B?aFJVYjlNaURYK1ZQNUoyZnhoQ2JaejlQdXNkTWJZTFpVRkJ2VkFyWkFHNFU4?=
 =?utf-8?B?eERDeEQ4VUJVY1diQ1gweDFmMHJ1citsYStuODhXN1dRcm01Z3o0SXNBblU4?=
 =?utf-8?B?T25XZloyOU8wSFpIQ1EvMGNwdFRpVHNwZ3hGZHpjeFZtU2QrZ2I3RVdIUkla?=
 =?utf-8?B?eTlwWTE4a09zaXJiMHd6TU1xWmtMZnplbXo3MDMwb0hkUlIzRGxYS3lqVWo2?=
 =?utf-8?B?WnA3ZjZ5a2toZXRRMUsweTNtbDU3Skx0UzRVUHJIWENpbmFsWC9qUlF0T3Zh?=
 =?utf-8?B?eURJOG9xVTdzTkhVUGNOWG1NV0FEL1QyUTlSaDhmNlVtSXdlUVdISVhqRDNa?=
 =?utf-8?B?Tm5LYWRoekVXV2dZV1hpa01hZjd0cE5nZmZZMFpqYkJBMlFGQVZJOWovK09P?=
 =?utf-8?B?QWR3citxY1pQUnVWR1F2RVBZU3ZNVnhCNEVSMHg4dnN1dDBVSU42R3lWeUty?=
 =?utf-8?B?aWgrUmgwQ3Jadk9na0hzMHNEeis3WTdMZjdmYWdSZExzdEozaFhqU1UvMDc0?=
 =?utf-8?B?Tk9wUzFkRzg2YTkrRlBrOXV3QlJVOHhQL2RmWEdSTHEvemE1cXQ1QjRMeFBH?=
 =?utf-8?B?aTNrdlh5QTBjYWlYOWdCMzdTcGRjQ0YzZGlRY3lhOENjRlZ5aS8yR2pQYXFq?=
 =?utf-8?B?UE1GYXcxc2JaYjQ3cWVhSW1Hejg1dGt2L2o4aE1vc0Y5TGRtVVM4TG1zejZj?=
 =?utf-8?B?YUFxZnlES01WTDlKR0hZaHpOVjhQVmJqSi9WT3liNVR2WXJ0bVFsTlpqaDIx?=
 =?utf-8?B?d2l6MFI3TmxwTHU4VUUyZURSTEFiTVhRZE5VdDJudUhGUC9md2p2R1hiWlI4?=
 =?utf-8?B?eDR2aFU5bXlHRjlQdm4vRElZVWdMeHYyeE5qRVFFczNTd1ZFWGMvZWV6SGo2?=
 =?utf-8?B?Y0V5Q0dHRENhb3RVVzMvTG11MkVFd2c1aSsxcHFpUE53TTl3SUlBM3JYd0Vz?=
 =?utf-8?B?MlpXVlgxRzFzRjhQdnJvNUU0dFlYMUhLOWhUZ2wyYno5dk8wSkNKOGVsNWVu?=
 =?utf-8?B?Q0IrbmxUdXI1Y0lKdlRoRlQ0WHh1TVBmSWRaK2xmbXlMYkpLYVB0SGUvTmlm?=
 =?utf-8?B?MU1sSU41N1JqOVp3dDFrcmN6amYyaHE2L05XZnVTcDEwT3pHVGFwamJtazlj?=
 =?utf-8?B?ZXdTdWJCMk4yWC9hN1JyTm14bmY5QWt0VEl5R3Y5NGJQblJlSVZGOHp4cHgx?=
 =?utf-8?B?cVo4cGdjMlBFeGZ4U3JwdExnOWc0djdJdnBQejVmY05sdFdSVkhaSWYzVkN4?=
 =?utf-8?B?bmlpZ0NMb0hyZ1NEWU8vSXVuY3RnNnpxRm5walA2eU83T3BrTkJ2cUFWa1Uz?=
 =?utf-8?B?eWNtamtaMldlZU5ieHRybE5zZ3dhcFlEM3dkSWFxcmtpTFVpTW80K1l0Z2I3?=
 =?utf-8?B?SFA2UkNCSGxhdGFCZStqVzIyY05iMzY2K2RlUWF5TWk5WTdqdjdYNjRtaGRY?=
 =?utf-8?B?VXhIbUxxZ080WmVWaDFEMXZ3a1YzWjhuZVYzTGVWZWYydHlqd1RrdDdJM0d3?=
 =?utf-8?B?ZHhBUmtCVUxTbFZ6UjhDMjRPbWhxVklOQUJudmhhd1hTcklpSkJKbk8rWTJ0?=
 =?utf-8?B?enR3NVkxblVpb3REQytCNGFvOS9zUG9HeldOWEtMeE5WQXpkN0x2NFhNV2FI?=
 =?utf-8?B?eksxTE9EcmptZDZiVzBQaVNJV1dkOTE1cjBMWG1seENDY0wwcy94QkNhNy9Z?=
 =?utf-8?B?TGpXWVRKckt2Z24vbjErN2ZqNDJqejVKajQyK3NZTkYrKzZTVTlzeVdCejVD?=
 =?utf-8?B?dUdYRmpjUTJya242Q1JFU0hXaGpnb0ljVlEzMEZwUldaUGdkekZNbmNZMU1y?=
 =?utf-8?B?UjJ5V2V1VlVsR0c1WDBObkFxYTFOT3RSVHpISVU3d0ZpMHpFbUEzZVBUWFVq?=
 =?utf-8?B?cEtzNlRtOE9seVB3SkVpYnY3NnVBdUk5WklRV21YRGhZaVhNaXhwdEZPTzJP?=
 =?utf-8?B?V3VoMVlMZHNEOWFDMHY4VlljTmc1T1IrdythcytlMmlHSlE3RkNsUElMN3Ns?=
 =?utf-8?B?Ry9pU0xlenJ4VThPTFFlS1JDVnFIM01URGFlS3EwSTd2ZGl5RENCN2ttaVJh?=
 =?utf-8?Q?6UJw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af81c78-e9c3-4527-1ab9-08dd056865b4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 11:26:49.9563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BsizDer6y1b6xuQtWPxAkBniu9Mz9h24Ev6wjYsWg1ioaQ/aFxRag6OTeXiNTsg+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5628
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

Interesting, those mails just showed up in my inbox as unread. More than 
14 days after you send it.

So sorry for the late reply.

Am 29.10.24 um 08:22 schrieb Philipp Stanner:
> Christian, Sima?
>
> Matthew? (+CC)
>
> Opinions on the below?
>
> tl;dr:
> I still think it's a good thing to detectably block in
> drm_sched_fini(), or at the very least drm_sched_flush(), because then
> you'll find out that the driver is broken and can repair it.

As discussed in private mail as well, the third option not mentioned so 
far is to completely drop the free_job callback.

A good bunch of the problems we have here are caused by abusing the job 
as state for executing the submission on the hardware.

The original design idea of the scheduler instead was to only have the 
job as intermediate state between submission and picking what to execute 
next. E.g. the scheduler in that view is just a pipeline were you push 
jobs in on one end and jobs come out on the other end.

In that approach the object which represents the hardware execution is 
the dma_fence instead of the job. And the dma_fence has a well defined 
lifetime, error handling, etc...

So when we go back to this original approach it would mean that we don't 
need to wait for any cleanup because the scheduler wouldn't be involved 
in the execution of the jobs on the hardware any more.

The worst thing that could happen is that the driver messes things up 
and still has not executed job in an entity, but in that case we could 
just warn, block for the hardware fence and then kill all pending 
submissions with an error.- And this blocking on the hardware fence 
can't deadlock because we know that it is a hardware fence with certain 
properties and not some random free_job callback where we don't have any 
idea what locks the driver need.

Regards,
Christian.

>
> P.
>
>
> On Fri, 2024-10-18 at 14:07 +0200, Philipp Stanner wrote:
>> On Mon, 2024-10-14 at 16:56 +0200, Danilo Krummrich wrote:
>>> On Fri, Sep 27, 2024 at 11:04:48AM +0200, Christian König wrote:
>>>> Am 25.09.24 um 16:53 schrieb Philipp Stanner:
>>>>> On Tue, 2024-09-24 at 13:18 +0200, Simona Vetter wrote:
>>>>>> On Mon, Sep 23, 2024 at 05:24:10PM +0200, Christian König
>>>>>> wrote:
>>>>>>> Am 20.09.24 um 15:26 schrieb Philipp Stanner:
>>>>>>>> On Fri, 2024-09-20 at 12:33 +0200, Christian König wrote:
>>>>>>>>> Am 20.09.24 um 10:57 schrieb Philipp Stanner:
>>>>>>>>>> On Wed, 2024-09-18 at 15:39 +0200, Christian König
>>>>>>>>>> wrote:
>>>>>>>>>>> Tearing down the scheduler with jobs still on the
>>>>>>>>>>> pending
>>>>>>>>>>> list
>>>>>>>>>>> can
>>>>>>>>>>> lead to use after free issues. Add a warning if
>>>>>>>>>>> drivers try
>>>>>>>>>>> to
>>>>>>>>>>> destroy a scheduler which still has work pushed to
>>>>>>>>>>> the HW.
>>>>>>>>>> Did you have time yet to look into my proposed
>>>>>>>>>> waitque-
>>>>>>>>>> solution?
>>>>>>>>> I don't remember seeing anything. What have I missed?
>>>>>>>> https://lore.kernel.org/all/20240903094446.29797-2-pstanner@redhat.com/
>>>>>>> Mhm, I didn't got that in my inbox for some reason.
>>>>>>>
>>>>>>> Interesting approach, I'm just not sure if we can or should
>>>>>>> wait in
>>>>>>> drm_sched_fini().
>>>>> We do agree that jobs still pending when drm_sched_fini()
>>>>> starts
>>>>> is
>>>>> always a bug, right?
>>>> Correct, the question is how to avoid that.
>>>>
>>>>> If so, what are the disadvantages of waiting in
>>>>> drm_sched_fini()?
>>>>> We
>>>>> could block buggy drivers as I see it. Which wouldn't be good,
>>>>> but
>>>>> could then be fixed on drivers' site.
>>>> Sima explained that pretty well: Don't block in fops->close, do
>>>> that in
>>>> fops->flush instead.
>>> I agree that we shouldn't block in close(), but this effectively
>>> means that we
>>> need to reference count the scheduler, right?
>>>
>>> Otherwise, if we allow to just skip / interrupt the teardown, we
>>> can
>>> still leak
>>> memory.
>> Having thought about it, I agree with Danilo. Having something that
>> shall wait on green light, but can be interrupted, is no guarantee
>> and
>> therefore not a feasible solution.
>>
>> To break down the solution space, these seem to be our options:
>>     1. We have something (either drm_sched_fini() or a helper, e.g.,
>>        drm_sched_flush()) that definitely blocks until the pending
>> list
>>        has become empty.
>>     2. We have jobs reference-count the scheduler, so the latter can
>>        outlive the driver and will be freed some time later.
>>
>> Can anyone think of a third solution?
>>
>>
>> Solution #1 has the problem of obviously blocking unconditionally if
>> the driver didn't make sure that all fences will be signaled within
>> reasonable time. In my opinion, this would actually be an advantage,
>> because it will be *very* noticable and force users to repair their
>> driver. The driver *has* to guarantee that all fences will be
>> signaled.
>> If the driver has to do fishy things, having the blocking outsourced
>> to
>> the helper drm_sched_flush() would allow them to circumvent that.
>>
>> Solution #2 has the problem of backend_ops.free_job() potentially
>> using
>> driver-data after the driver is gone, causing UAF. So with this
>> solutions all drivers would have to be aware of the issue and handle
>> it
>> through one of DRMs primitives dedicated to such problems.
>>
>>
>> Currently, all drivers either work around the problem internally or
>> simply ignore it, it seems.
>>
>> So I'd argue that both solutions are an improvement over the existing
>> situation. My preference would be #1.
>>
>>
>> Opinions?
>>
>> P.
>>
>>>> One issue this solves is that when you send a SIGTERM the tear
>>>> down
>>>> handling
>>>> first flushes all the FDs and then closes them.
>>>>
>>>> So if flushing the FDs blocks because the process initiated
>>>> sending
>>>> a
>>>> terabyte of data over a 300bps line (for example) you can still
>>>> throw a
>>>> SIGKILL and abort that as well.
>>>>
>>>> If you would block in fops-close() that SIGKILL won't have any
>>>> effect any
>>>> more because by the time close() is called the process is gone
>>>> and
>>>> signals
>>>> are already blocked.
>>>>
>>>> And yes when I learned about that issue I was also buffed that
>>>> handling like
>>>> this in the UNIX design is nearly 50 years old and still applies
>>>> to
>>>> today.
>>>>>>> Probably better to make that a separate function, something
>>>>>>> like
>>>>>>> drm_sched_flush() or similar.
>>>>> We could do that. Such a function could then be called by
>>>>> drivers
>>>>> which
>>>>> are not sure whether all jobs are done before they start
>>>>> tearing
>>>>> down.
>>>> Yes exactly that's the idea. And give that flush function a
>>>> return
>>>> code so
>>>> that it can return -EINTR.
>>>>
>>>>>> Yeah I don't think we should smash this into drm_sched_fini
>>>>>> unconditionally. I think conceptually there's about three
>>>>>> cases:
>>>>>>
>>>>>> - Ringbuffer schedules. Probably want everything as-is,
>>>>>> because
>>>>>>     drm_sched_fini is called long after all the entities are
>>>>>> gone in
>>>>>>     drm_device cleanup.
>>>>>>
>>>>>> - fw scheduler hardware with preemption support. There we
>>>>>> probably
>>>>>> want to
>>>>>>     nuke the context by setting the tdr timeout to zero (or
>>>>>> maybe just
>>>>>> as
>>>>>>     long as context preemption takes to be efficient), and
>>>>>> relying on
>>>>>> the
>>>>>>     normal gpu reset flow to handle things.
>>>>>> drm_sched_entity_flush
>>>>>> kinda
>>>>>>     does this, except not really and it's a lot more focused
>>>>>> on
>>>>>> the
>>>>>>     ringbuffer context. So maybe we want a new
>>>>>> drm_sched_entity_kill.
>>>>>>
>>>>>>     For this case calling drm_sched_fini() after the 1:1
>>>>>> entity
>>>>>> is gone
>>>>>>     should not find any linger jobs, it would actually be a
>>>>>> bug
>>>>>> somewhere if
>>>>>>     there's a job lingering. Maybe a sanity check that there's
>>>>>> not just
>>>>>> no
>>>>>>     jobs lingering, but also no entity left would be good
>>>>>> here?
>>>>> The check for lingering ones is in Christian's patch here IISC.
>>>>> At which position would you imagine the check for the entity
>>>>> being
>>>>> performed?
>>>>>
>>>>>> - fw scheduler without preemption support. There we kinda
>>>>>> need
>>>>>> the
>>>>>>     drm_sched_flush, except blocking in fops->close is not
>>>>>> great. So
>>>>>> instead
>>>>>>     I think the following is better:
>>>>>>     1. drm_sched_entity_stopped, which only stops new
>>>>>> submissions (for
>>>>>>     paranoia) but doesn't tear down the entity
>>>>> Who would call that function?
>>>>> Drivers using it voluntarily could just as well stop accepting
>>>>> new jobs
>>>>> from userspace to their entities, couldn't they?
>>>>>
>>>>>>     2. drm_dev_get
>>>>>>     3. launch a worker which does a) drm_sched_flush (or
>>>>>>     drm_sched_entity_flush or whatever we call it) b)
>>>>>> drm_sched_entity_fini
>>>>>>     + drm_sched_fini c) drm_dev_put
>>>>>>
>>>>>>     Note that semantically this implements the refcount in the
>>>>>> other
>>>>>> path
>>>>>>     from Phillip:
>>>>>>
>>>>>> https://lore.kernel.org/all/20240903094531.29893-2-pstanner@redhat.com/
>>>>>>     Except it doesn't impose refcount on everyone else who
>>>>>> doesn't need
>>>>>> it,
>>>>>>     and it doesn't even impose refcounting on drivers that do
>>>>>> need it
>>>>>>     because we use drm_sched_flush and a worker to achieve the
>>>>>> same.
>>>>> I indeed wasn't happy with the refcount approach for that
>>>>> reason,
>>>>> agreed.
>>>>>
>>>>>> Essentially helper functions for the common use-cases instead
>>>>>> of
>>>>>> trying to
>>>>>> solve them all by putting drm_sched_flush as a potentially
>>>>>> very
>>>>>> blocking
>>>>>> function into drm_sched_fini.
>>>>> I'm still not able to see why it blocking would be undesired –
>>>>> as
>>>>> far
>>>>> as I can see, it is only invoked on driver teardown, so not
>>>>> during
>>>>> active operation. Teardown doesn't happen that often, and it
>>>>> can
>>>>> (if
>>>>> implemented correctly) only block until the driver's code has
>>>>> signaled
>>>>> the last fences. If that doesn't happen, the block would reveal
>>>>> a
>>>>> bug.
>>>>>
>>>>> But don't get me wrong: I don't want to *push* this solution. I
>>>>> just
>>>>> want to understand when it could become a problem.
>>>>>
>>>>>
>>>>> Wouldn't an explicitly blocking, separate function like
>>>>> drm_sched_flush() or drm_sched_fini_flush() be a small, doable
>>>>> step
>>>>> towards the right direction?
>>>> I think that this is the right thing to do, yes.
>>>>
>>>>>>>>>>> When there are still entities with jobs the
>>>>>>>>>>> situation
>>>>>>>>>>> is
>>>>>>>>>>> even
>>>>>>>>>>> worse
>>>>>>>>>>> since the dma_fences for those jobs can never
>>>>>>>>>>> signal
>>>>>>>>>>> we can
>>>>>>>>>>> just
>>>>>>>>>>> choose between potentially locking up core memory
>>>>>>>>>>> management and
>>>>>>>>>>> random memory corruption. When drivers really mess
>>>>>>>>>>> it
>>>>>>>>>>> up
>>>>>>>>>>> that
>>>>>>>>>>> well
>>>>>>>>>>> let them run into a BUG_ON().
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Christian
>>>>>>>>>>> König<christian.koenig@amd.com>
>>>>>>>>>>> ---
>>>>>>>>>>>      drivers/gpu/drm/scheduler/sched_main.c | 19
>>>>>>>>>>> ++++++++++++++++++-
>>>>>>>>>>>      1 file changed, 18 insertions(+), 1 deletion(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>> index f093616fe53c..8a46fab5cdc8 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>> @@ -1333,17 +1333,34 @@ void drm_sched_fini(struct
>>>>>>>>>>> drm_gpu_scheduler
>>>>>>>>>>> *sched)
>>>>>>>>>> I agree with Sima that it should first be documented
>>>>>>>>>> in
>>>>>>>>>> the
>>>>>>>>>> function's
>>>>>>>>>> docstring what the user is expected to have done
>>>>>>>>>> before
>>>>>>>>>> calling the
>>>>>>>>>> function.
>>>>>>>>> Good point, going to update the documentation as well.
>>>>>>>> Cool thing, thx.
>>>>>>>> Would be great if everything (not totally trivial)
>>>>>>>> necessary to
>>>>>>>> be done
>>>>>>>> before _fini() is mentioned.
>>>>>>>>
>>>>>>>> One could also think about providing a hint at how the
>>>>>>>> driver can
>>>>>>>> do
>>>>>>>> that. AFAICS the only way for the driver to ensure that
>>>>>>>> is
>>>>>>>> to
>>>>>>>> maintain
>>>>>>>> its own, separate list of submitted jobs.
>>>>>>> Even with a duplicated pending list it's actually currently
>>>>>>> impossible to do
>>>>>>> this fully cleanly.
>>>>>>>
>>>>>>> The problem is that the dma_fence object gives no guarantee
>>>>>>> when
>>>>>>> callbacks
>>>>>>> are processed, e.g. they can be both processed from
>>>>>>> interrupt
>>>>>>> context as
>>>>>>> well as from a CPU which called dma_fence_is_signaled().
>>>>>>>
>>>>>>> So when a driver (or drm_sched_fini) waits for the last
>>>>>>> submitted
>>>>>>> fence it
>>>>>>> actually can be that the drm_sched object still needs to do
>>>>>>> some
>>>>>>> processing.
>>>>>>> See the hack in amdgpu_vm_tlb_seq() for more background on
>>>>>>> the
>>>>>>> problem.
>>>>> Oh dear ^^'
>>>>> We better work towards fixing that centrally
>>>>>
>>>>> Thanks,
>>>>> P.
>>>>>
>>>>>
>>>>>> So I thought this should be fairly easy because of the sched
>>>>>> hw/public
>>>>>> fence split: If we wait for both all jobs to finish and for
>>>>>> all
>>>>>> the
>>>>>> sched
>>>>>> work/tdr work to finish, and we make sure there's no entity
>>>>>> existing
>>>>>> that's not yet stopped we should catch them all?
>>>> Unfortunately not.
>>>>
>>>> Even when you do a dma_fence_wait() on the last submission it can
>>>> still be
>>>> that another CPU is executing the callbacks to wake up the
>>>> scheduler work
>>>> item and cleanup the job.
>>>>
>>>> That's one of the reasons why I think the design of keeping the
>>>> job
>>>> alive is
>>>> so extremely awkward. The dma_fence as representation of the hw
>>>> submission
>>>> has a much better defined state machine and lifetime.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>>    Or at least I think
>>>>>> it's
>>>>>> a bug if any other code even tries to touch the hw fence.
>>>>>>
>>>>>> If you have any other driver code which relies on the rcu
>>>>>> freeing
>>>>>> then I
>>>>>> think that's just a separate concern and we can ignore that
>>>>>> here
>>>>>> since the
>>>>>> fences themselves will till get rcu-delay freed even if
>>>>>> drm_sched_fini has
>>>>>> finished.
>>>>>> -Sima
>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> P.
>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>>> P.
>>>>>>>>>>
>>>>>>>>>>>       drm_sched_wqueue_stop(sched);
>>>>>>>>>>> + /*
>>>>>>>>>>> + * Tearing down the scheduler wile there are still
>>>>>>>>>>> unprocessed jobs can
>>>>>>>>>>> + * lead to use after free issues in the scheduler
>>>>>>>>>>> fence.
>>>>>>>>>>> + */
>>>>>>>>>>> + WARN_ON(!list_empty(&sched->pending_list));
>>>>>>>>>>> +
>>>>>>>>>>>       for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched-
>>>>>>>>>>>> num_rqs;
>>>>>>>>>>> i++)
>>>>>>>>>>> {
>>>>>>>>>>>       struct drm_sched_rq *rq = sched-
>>>>>>>>>>>> sched_rq[i];
>>>>>>>>>>>       spin_lock(&rq->lock);
>>>>>>>>>>> - list_for_each_entry(s_entity, &rq-
>>>>>>>>>>>> entities,
>>>>>>>>>>> list)
>>>>>>>>>>> + list_for_each_entry(s_entity, &rq-
>>>>>>>>>>>> entities,
>>>>>>>>>>> list) {
>>>>>>>>>>> + /*
>>>>>>>>>>> + * The justification for this
>>>>>>>>>>> BUG_ON()
>>>>>>>>>>> is
>>>>>>>>>>> that tearing
>>>>>>>>>>> + * down the scheduler while jobs
>>>>>>>>>>> are
>>>>>>>>>>> pending
>>>>>>>>>>> leaves
>>>>>>>>>>> + * dma_fences unsignaled. Since we
>>>>>>>>>>> have
>>>>>>>>>>> dependencies
>>>>>>>>>>> + * from the core memory management
>>>>>>>>>>> to
>>>>>>>>>>> eventually signal
>>>>>>>>>>> + * dma_fences this can trivially
>>>>>>>>>>> lead to
>>>>>>>>>>> a
>>>>>>>>>>> system wide
>>>>>>>>>>> + * stop because of a locked up
>>>>>>>>>>> memory
>>>>>>>>>>> management.
>>>>>>>>>>> + */
>>>>>>>>>>> + BUG_ON(spsc_queue_count(&s_entity-
>>>>>>>>>>>> job_queue));
>>>>>>>>>>> +
>>>>>>>>>>>       /*
>>>>>>>>>>>       * Prevents reinsertion and marks
>>>>>>>>>>> job_queue
>>>>>>>>>>> as idle,
>>>>>>>>>>>       * it will removed from rq in
>>>>>>>>>>> drm_sched_entity_fini
>>>>>>>>>>>       * eventually
>>>>>>>>>>>       */
>>>>>>>>>>>       s_entity->stopped = true;
>>>>>>>>>>> + }
>>>>>>>>>>>       spin_unlock(&rq->lock);
>>>>>>>>>>>       kfree(sched->sched_rq[i]);
>>>>>>>>>>>       }

