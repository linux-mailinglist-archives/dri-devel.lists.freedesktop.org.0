Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 888187C9212
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 03:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E390210E07F;
	Sat, 14 Oct 2023 01:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9090A10E07F;
 Sat, 14 Oct 2023 01:24:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZ0ldjqOhtscxZMO8XMHqw/esp5J6R4+18W+08vl1TSOXmUODkAkLTx35rcBce8DIsOM/cmrQQTggoeEpR7Uq4epMPpsQlvbBvcbCRhG8UnouWZmTc2QZHcYsF31hR79zWKgpTS533eFUcUK0JMUxDsODfKkU55YGf3MLcoQarnhb5KghFVZUNjaBfmxoCDON51YjDXh7z2KQ1D1ddRqw0AkeucNPZANxvAg8p/2y87usQarTuaywod/cXqr37j9SyyPbyjNXw7K1lWXuH576Gpxkp11wcPLQmtxPebZnwLgybnmt5H+SooJ/CsNnoIduJV315fnCUAX0sXhrV82FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZATZX16zu7oaw1jgttWPBBpOYS/B7FflGkX4ungKL0=;
 b=EAaaxSk6riVjw/BuzvHSIOLXQC1rbhEUjXDO35muoLIbgW83Cx39WPSFuO6Iph7HgTzANlJOUq+DfHANUveXhkyr6Tsu1C20G4ZYBsz2uRWJQxhxs7H6Pj2obBvMIDcH9etk4T4ql8vBCQBG70HH4/WneId3vkf+nQTAtVRZ+a6RxYRfOJfH7aLQusPq68OS22LgfIB2JMI/5QcVdDmC61WVeXOz3CdbcsIXi1hHUEHfTmSsM9UASjZGf5KJ4jg6py0z663tEnTrJyk1YmsUQsw2WykBisWMEygZUwkFW24UkgpAC7vgkEN1sAV9Yz5/NvyHWlc9nSaQUK+eLLEPOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZATZX16zu7oaw1jgttWPBBpOYS/B7FflGkX4ungKL0=;
 b=pOlXQ8KCqWmPd1ECVR5I4hT3P/AT99fv+/tqLSJnPnREDMSgdkhfWuBU8egUH2sRIhdMjF6AKdCkGLz0KYZOfFB/JrJJMc5W4TI5tI0l6/8h/YaUAUmM7sGUZP5nyQP5YMw+FT+8VuLWzL3AS1NIwg6brDLEGfx9qf/cvKt5YCw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH0PR12MB7932.namprd12.prod.outlook.com (2603:10b6:510:280::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Sat, 14 Oct 2023 01:24:13 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6863.047; Sat, 14 Oct 2023
 01:24:13 +0000
Message-ID: <f001254d-92cb-430d-b543-b616a8bb874b@amd.com>
Date: Fri, 13 Oct 2023 21:24:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v5 1/7] drm/sched: Add drm_sched_wqueue_* helpers
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-2-matthew.brost@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <20231011235826.585624-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: QB1P288CA0028.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::41) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH0PR12MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc6fc0d-c4ad-4916-ebf2-08dbcc544633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SxnifPXl2vy5AP7f7ZyTiZTEPCxn+R64MwdfGkUUscClovJNepFO2n9lj/o8bKX7z9M2rJEDEjepNi7vWpDPP0OexCdvhoR6aqwDMlwOdlJIvqULx/0NNzK++TRIVHWW9PbBkKPcxyrOPKP8LceMiA/MZyMPLqAIhWHpnPbqNfUTVjApQBZPR4Cc13Ih1qjSlJtOqGNUX19oekWVSoqKGIp8CcWfLnS/jyTQHxU2BG7YvmKftodFZnWKPE7YEG0FnmCNmIuuF2Wg76uzBpHWIRiY7dT6s9A7+akV2o8Y+Rjro9qj4OHx+OZNxaP7z+YPxeSdT/WQIj8THycJqd8/M2llwI1mzEvqz+FJvCJdUSr9FHdy+cvoNzKt0SqDNg4BEnf3cSz3M4fT6a0EhQ0O7WBSTWoJl/ci46066s3EOeq86AUxHd1arKHuhc6ee+oaD5v2EEXjXdbADAub+3sjB+mAEBtrxYVn8pFtOgu32NfW9Li0FKDt5C97KvEeYuRDgraSD+LK8y+XhIn5/miHEMKTPOjzvH//dSE825EK5m+qY6de/B9ryzO+GBiG4ub9UzAhYMJv/Bl/yZFBSccYiG7QoCXl//8O0PMFnR0WD95MdV941fydroGBrHspPxSX2cfH5KGIJ0/xJ35Qbadu0GC84C6RIkZvLkvWxwx2oYmGlP8UXT8gUvWbpyfntXcF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(346002)(366004)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(36756003)(31686004)(26005)(6666004)(53546011)(2616005)(83380400001)(8936002)(4326008)(478600001)(6512007)(8676002)(6486002)(6506007)(41300700001)(31696002)(316002)(4001150100001)(86362001)(2906002)(5660300002)(44832011)(66946007)(66476007)(66556008)(38100700002)(7416002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWRsNjg0Z0xnVElKcmhZWGlHRHRmRkVqWEVjNW03dXowVVIrekxoZkRRckY5?=
 =?utf-8?B?aVF4TjRTdEY5TWZsSzRKTjFKd0JxWHkwSXlPa2VDc1VMTUwrTkUrQXpRRkVJ?=
 =?utf-8?B?UUhCK2tpUjBBdThMSW1sUCtrUlkxNE9PRlFKMGRzZkI2MVFjbmhGdFRpWXpP?=
 =?utf-8?B?Y3kvalAyUDhYYm1wUkhlZDhtdkdrZUdEVVNjcDBlR1lXOFJoaWJDRUl1L0Qr?=
 =?utf-8?B?T2FiS2gvNlJ1T3Z1V20vd20yeHFlU29MbSthZFptZXM0aVZsWUsvdEt5OWdY?=
 =?utf-8?B?MDBmMXN2MEZYS0IxaGNHdEM0dERuS0lPaEJHSmhUeWhJYi84MWRJN3cwMWxx?=
 =?utf-8?B?S2pJQmJ4N3B4YTVNcWpvdWNaWCtRQXowRVQ5dEsyR0hVRlRicXhzTzRVclQx?=
 =?utf-8?B?OHlkYlJIUlN4NE1jT0xDaGRpSzZHVnV4c0liSEljZk5nNVhmT3V6T0d5dGFz?=
 =?utf-8?B?QTBZa0gyNlp6MStGZVlacEZSQy84OExrM2x6SmZ0VEN3UGhqNzJzV3VZL0xt?=
 =?utf-8?B?cnFQWXBqU2V1WUtHaGFhQkEyMHFWdnBTQ1ZxQi9hSGdDYVg4dmNNNkNvWHpr?=
 =?utf-8?B?NkdnU1Eya0tkeFZ6Tm9kQmp6TytEN2NRMUNvaUNrMnN0N2grZXh3bFRqZUdG?=
 =?utf-8?B?d1lHNTRIeVNMS2d1WjdaTkh1b2hyMXM0V01jVisrV0NIejdzZW8vdWlRQmJm?=
 =?utf-8?B?OUM2QlNyV0hGa0VjTGxwUnBXeWVBbUtBUGRZTEc5RkFDQ0l6anBOcnRSYmlo?=
 =?utf-8?B?YmNBNGVlQjlKVm5HdGZOZ1JhSWhnblZ0cE1JK3ZGWlp4d3hhbjdkVXpoZG13?=
 =?utf-8?B?TEZObUNPTmtybjJMSnp5RFhXU3ZqMENiN1BSeGdYZ1dvaFBsWENZYVVFSWhW?=
 =?utf-8?B?aDg3MTh5bjE5alVyMk56eGJ4b1ErMmN4Z1dVZi9OYUd1Rmk4TEJNeExDbjQy?=
 =?utf-8?B?ZHRidUVNWVlobTBPWEl1dStuL2w4dmtQM1pUZnJyOGVzMUt6cllYTHdxU3M3?=
 =?utf-8?B?Mkg4S01hSFJROFdGT2lZM1JlNXh6Q2FvQkdwcnJLbFM5OVF1S0tjcVQxM2VK?=
 =?utf-8?B?YjNUTElpSnlia3A2c01meHg1cElwck1CSnhQeWN5TWZYc2M1dE1DUElUc1RR?=
 =?utf-8?B?MzY2S2NSVG9Od211ZWl2VXJ5MHRzWnJZcTg2a0xLRERyRUlzZTZOL09YUCtL?=
 =?utf-8?B?MXBZQk53ODFzQnBoSkxGdEVFVVc5bnpDSzJwNDJWSlR5bHJERlA3dC9reUt4?=
 =?utf-8?B?bTcvNlN1UEUvVmVYTkZZejZHbXlaMzl0ZnA2STRqTS8rWWFkOE00dWtkRWdO?=
 =?utf-8?B?OGNBRjArV0o0TmtEdnRyaVB0ajFDRjFrU1Q2UThEMjhYOTlvQnZDeHRQY1Na?=
 =?utf-8?B?RkY0VzVyTi9PZ3AwVkEvTWNINmFBNjNoVkJIQ1VHN1ppNDRmUlpwaThsaVg2?=
 =?utf-8?B?RTlORzFCNmFIRnZTMDVqaExqMWlWUERtTTExMC9maWM3SXV2eXozbTlsSk1E?=
 =?utf-8?B?ZWZpOFRDKzlLL3FBQkJ2VGFLM1Y4WkVQR2JkTTRibFdxSFJTcjJac1ZCOVU4?=
 =?utf-8?B?RnlPY1BpbGlPaDRDQmhBOXJBNmMySXlRNGlyRkNDK3dOZ0p5aU53SCtHekZ3?=
 =?utf-8?B?dVM4bERTUkt4QnlBaW1zSDFpQVhkelpadllwbDhzUS9ROTN3U2ZxSTdyekJa?=
 =?utf-8?B?OE9kNjZjenhobE9jbTlhdS9lME83ekZ4VXRIRXNOZmF0bDNrckYyM28zM1Jr?=
 =?utf-8?B?d3dzZjQ2WHYwcVlmNlU2SFRrMGtRMEV6SnlqeGkrNERsM2ZlYWMzQU4rcFVN?=
 =?utf-8?B?ck90bFB6M09MejJtMHoxMXpiYVF5TFhIYlJBNm1DdTBsaEJVU0tEcXNHR2My?=
 =?utf-8?B?RktRcjBwQ0ZuekM2L3RFakx2VXBtU1NjbzB3Y2ZuNVBBcnBIL29nNXp1SDlq?=
 =?utf-8?B?cDNGeE1zMzdZdEdoczRSODJ0cWYySVFwQmtXUFVjSm5malJMSkFUbnF5Mk9n?=
 =?utf-8?B?cnBkY0g1aC9aM3kxcWpJQmhHaVhDSFlXYmFNell4enlmeXQvN0hnS3ZRN0pD?=
 =?utf-8?B?VXdRNzB1Q0NGRytjSkFoNkw2T0FJSk5rOUhjK2NPR2NLYTlmVHppK2FYVnVa?=
 =?utf-8?Q?JQAFxyCck61BMWXvQ2PCpFy+E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc6fc0d-c4ad-4916-ebf2-08dbcc544633
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 01:24:13.1243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHOltjxXjf2mnBOK3OsWZutZLxDQLysa/IqtIiJVW6Zp3pQnnDDPYmgoAPb9xXwc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7932
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, lina@asahilina.net, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-11 19:58, Matthew Brost wrote:
> Add scheduler wqueue ready, stop, and start helpers to hide the
> implementation details of the scheduler from the drivers.
> 
> v2:
>   - s/sched_wqueue/sched_wqueue (Luben)
>   - Remove the extra white line after the return-statement (Luben)
>   - update drm_sched_wqueue_ready comment (Luben)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>

Cc comes before S-O-B, but I can fix this when applying it, so don't worry about
this patch anymore. I'll also add Link: and so on, but this is all automated for
me so don't worry about it.

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
-- 
Regards,
Luben

> ---
>  .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 15 +++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 12 +++---
>  drivers/gpu/drm/msm/adreno/adreno_device.c    |  6 ++-
>  drivers/gpu/drm/scheduler/sched_main.c        | 39 ++++++++++++++++++-
>  include/drm/gpu_scheduler.h                   |  3 ++
>  6 files changed, 59 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> index 625db444df1c..10d56979fe3b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> @@ -290,7 +290,7 @@ static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool sus
>  	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
>  		struct amdgpu_ring *ring = &adev->gfx.compute_ring[i];
>  
> -		if (!(ring && ring->sched.thread))
> +		if (!(ring && drm_sched_wqueue_ready(&ring->sched)))
>  			continue;
>  
>  		/* stop secheduler and drain ring. */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index a4faea4fa0b5..a4c0bb358db7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -1659,9 +1659,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
>  	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>  		struct amdgpu_ring *ring = adev->rings[i];
>  
> -		if (!ring || !ring->sched.thread)
> +		if (!ring || !drm_sched_wqueue_ready(&ring->sched))
>  			continue;
> -		kthread_park(ring->sched.thread);
> +		drm_sched_wqueue_stop(&ring->sched);
>  	}
>  
>  	seq_puts(m, "run ib test:\n");
> @@ -1675,9 +1675,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
>  	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>  		struct amdgpu_ring *ring = adev->rings[i];
>  
> -		if (!ring || !ring->sched.thread)
> +		if (!ring || !drm_sched_wqueue_ready(&ring->sched))
>  			continue;
> -		kthread_unpark(ring->sched.thread);
> +		drm_sched_wqueue_start(&ring->sched);
>  	}
>  
>  	up_write(&adev->reset_domain->sem);
> @@ -1897,7 +1897,8 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
>  
>  	ring = adev->rings[val];
>  
> -	if (!ring || !ring->funcs->preempt_ib || !ring->sched.thread)
> +	if (!ring || !ring->funcs->preempt_ib ||
> +	    !drm_sched_wqueue_ready(&ring->sched))
>  		return -EINVAL;
>  
>  	/* the last preemption failed */
> @@ -1915,7 +1916,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
>  		goto pro_end;
>  
>  	/* stop the scheduler */
> -	kthread_park(ring->sched.thread);
> +	drm_sched_wqueue_stop(&ring->sched);
>  
>  	/* preempt the IB */
>  	r = amdgpu_ring_preempt_ib(ring);
> @@ -1949,7 +1950,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
>  
>  failure:
>  	/* restart the scheduler */
> -	kthread_unpark(ring->sched.thread);
> +	drm_sched_wqueue_start(&ring->sched);
>  
>  	up_read(&adev->reset_domain->sem);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 2b8356699f23..b1aafe815f28 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4588,7 +4588,7 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev)
>  	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>  		struct amdgpu_ring *ring = adev->rings[i];
>  
> -		if (!ring || !ring->sched.thread)
> +		if (!ring || !drm_sched_wqueue_ready(&ring->sched))
>  			continue;
>  
>  		spin_lock(&ring->sched.job_list_lock);
> @@ -4727,7 +4727,7 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
>  	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>  		struct amdgpu_ring *ring = adev->rings[i];
>  
> -		if (!ring || !ring->sched.thread)
> +		if (!ring || !drm_sched_wqueue_ready(&ring->sched))
>  			continue;
>  
>  		/* Clear job fence from fence drv to avoid force_completion
> @@ -5266,7 +5266,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>  		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>  			struct amdgpu_ring *ring = tmp_adev->rings[i];
>  
> -			if (!ring || !ring->sched.thread)
> +			if (!ring || !drm_sched_wqueue_ready(&ring->sched))
>  				continue;
>  
>  			drm_sched_stop(&ring->sched, job ? &job->base : NULL);
> @@ -5341,7 +5341,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>  		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>  			struct amdgpu_ring *ring = tmp_adev->rings[i];
>  
> -			if (!ring || !ring->sched.thread)
> +			if (!ring || !drm_sched_wqueue_ready(&ring->sched))
>  				continue;
>  
>  			drm_sched_start(&ring->sched, true);
> @@ -5667,7 +5667,7 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
>  		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>  			struct amdgpu_ring *ring = adev->rings[i];
>  
> -			if (!ring || !ring->sched.thread)
> +			if (!ring || !drm_sched_wqueue_ready(&ring->sched))
>  				continue;
>  
>  			drm_sched_stop(&ring->sched, NULL);
> @@ -5795,7 +5795,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
>  	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>  		struct amdgpu_ring *ring = adev->rings[i];
>  
> -		if (!ring || !ring->sched.thread)
> +		if (!ring || !drm_sched_wqueue_ready(&ring->sched))
>  			continue;
>  
>  		drm_sched_start(&ring->sched, true);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index fa527935ffd4..8fa9ce3746b6 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -809,7 +809,8 @@ static void suspend_scheduler(struct msm_gpu *gpu)
>  	 */
>  	for (i = 0; i < gpu->nr_rings; i++) {
>  		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
> -		kthread_park(sched->thread);
> +
> +		drm_sched_wqueue_stop(sched);
>  	}
>  }
>  
> @@ -819,7 +820,8 @@ static void resume_scheduler(struct msm_gpu *gpu)
>  
>  	for (i = 0; i < gpu->nr_rings; i++) {
>  		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
> -		kthread_unpark(sched->thread);
> +
> +		drm_sched_wqueue_start(sched);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 5a3a622fc672..6f2f7dd4ba0a 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -439,7 +439,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>  {
>  	struct drm_sched_job *s_job, *tmp;
>  
> -	kthread_park(sched->thread);
> +	drm_sched_wqueue_stop(sched);
>  
>  	/*
>  	 * Reinsert back the bad job here - now it's safe as
> @@ -552,7 +552,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>  		spin_unlock(&sched->job_list_lock);
>  	}
>  
> -	kthread_unpark(sched->thread);
> +	drm_sched_wqueue_start(sched);
>  }
>  EXPORT_SYMBOL(drm_sched_start);
>  
> @@ -1206,3 +1206,38 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
>  	}
>  }
>  EXPORT_SYMBOL(drm_sched_increase_karma);
> +
> +/**
> + * drm_sched_wqueue_ready - Is the scheduler ready for submission
> + *
> + * @sched: scheduler instance
> + *
> + * Returns true if submission is ready
> + */
> +bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched)
> +{
> +	return !!sched->thread;
> +}
> +EXPORT_SYMBOL(drm_sched_wqueue_ready);
> +
> +/**
> + * drm_sched_wqueue_stop - stop scheduler submission
> + *
> + * @sched: scheduler instance
> + */
> +void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
> +{
> +	kthread_park(sched->thread);
> +}
> +EXPORT_SYMBOL(drm_sched_wqueue_stop);
> +
> +/**
> + * drm_sched_wqueue_start - start scheduler submission
> + *
> + * @sched: scheduler instance
> + */
> +void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
> +{
> +	kthread_unpark(sched->thread);
> +}
> +EXPORT_SYMBOL(drm_sched_wqueue_start);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index f9544d9b670d..38578fe74573 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -550,6 +550,9 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>  
>  void drm_sched_job_cleanup(struct drm_sched_job *job);
>  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
> +bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
> +void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
> +void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
>  void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
>  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);

