Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A0D6D1715
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 07:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B6010F0EC;
	Fri, 31 Mar 2023 05:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BEA10E323
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 05:59:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mI7uChfOjCm9ma4d8yxyzTYQ+Tvg/lkOhr1EXS9iXFK6wo1I/HWua/ebgekSJgCsSm3W14YfdADJ+RbuMkk6WxK4WzRs/q9klOh7XZNj9ViFRO3mEO82bnK9Cm3FL7B6N95xygTdvrbhnh1akfz4Zp7merTmzDArvo6MADBjwHRWUzSD0WK5kwEKKLBBdlmYQyxo7fDYTaLnnkIcgJ+JuwjD+oglJtCnUdIHSN9n5x6bNEYzAyLI3E8YPkfttx6avgPnBzADpWqSvbDbY4s0DY6kyYb4nXP+KcOmGuMAx0yOn5qRoIwTjo1Wstomvdfk46wicC//Pb5pESqHpd5DDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UQ3OqWU4W9Zv5JgV5qFsy5xkNtsCmAEEsbwUAelPa0=;
 b=cAr5nW0DsUwGnlFRE9cxEYG91M2boyUccMsdeKQarcoWVd5RP1uS1enffU3O1In4Ak5N++w/l0zj6rKt+2Rh4GVQa9emFSLsWrzbAzSFhjxdKLteuonRIfoYSAbDZLszXVvS2qBfuVQLfN9dfqe799mS29S8TnC0CVqfDxpY1zGfoOlPBAYSCjJeEBz60TixY9LwJG+oo0syf1914FW6YQAOTuW/vBrMiYkTOM0f9T8JmgKzFaZrV9TTi3572FsvGf4BTWjwAhHphj76xBVmAVVNieKuVy4eMHzDwoWjlGOml3InQ2FMdo9eYpqmUEz2ZeZMAYyCj4emqPWaEJZkEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UQ3OqWU4W9Zv5JgV5qFsy5xkNtsCmAEEsbwUAelPa0=;
 b=zdzoodkM5Rs2CvMG3oPFiWXU1FvwXTTPbwNiUNhDpNt+rEbPQZW6orz1Hfol9Y5+hbzQBZRDGkmhM75TDlIpVCKxKpbiTt8F0BKqKId7f0e1ijjE7vnmQmyhgorFgRi3INBPkEnDlOaDV8Dznwu1rSmBrc5yDAU37vu9QJCYw8s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB8287.namprd12.prod.outlook.com (2603:10b6:208:3f5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Fri, 31 Mar
 2023 05:59:35 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 05:59:35 +0000
Message-ID: <6ad72a7f-302f-4be1-0d53-00ff9dc37ef7@amd.com>
Date: Fri, 31 Mar 2023 07:59:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/scheduler: set entity to NULL in
 drm_sched_entity_pop_job()
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, luben.tuikov@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, l.stach@pengutronix.de,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
References: <20230331000622.4156-1-dakr@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230331000622.4156-1-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: f4fd912d-3a1d-4f57-773b-08db31ad1ac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WWcyqGCvcC7WxGxo8kXdwO9hllyZbTH8MjTaMDYwNLPaN/c1b+LlZoTHS0KEBVwRcirU3C0e/jYuCP0DpZCxTKubd4gm3Dy8P1dw3usJJ3EX631n4DhlDySUcs60CUSe5YQC4L89bxdVyEJzOPWnawaAHKy8oF7v3ie87VhBzfaGQNxjeRcQet3L6cYl7hMQlN1cyG2lkBnJ66qFQcMvSUWwykYjyekCVlMjJg+iB2UcvXiLGF++oRXT+2VZMNaKSfpRpNk7Ajb4A9qh/M+eoI62iMFTKr9Qsh+Ylubmrm0dqRwTEWbIfQzK8V8fojUGXSZYNxtnbQFBjruJBP3jyoHY8As+aNkx8Lh8jYoLMp7417qNJ8NVW8v10q+kF7xwa87mW8tJAknVojEmoLD23QMFn61td4ycZyLh4/gFzzDiDxHUmqk44UU42gBatMF7CntjnNgelQA1hq8M7Ioieh+AT4A3ueXhYd/55mGu1hEljMgpAdlrhfddDbKbK72tHf9lE1dyTrMty0GJKXgyqo4CeIAGE8+eHxz3FRom/1asKhvHqN558v/bmaIjk3LAd0WsstHDU5Xm5F9fRfhz80gqcNXrNvoO84CBhdBFHsxBRfhGhMipnZXSGcTYBwT9+/AKRX2uo8KfyDSfVFZ7hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(451199021)(36756003)(186003)(6486002)(2906002)(6506007)(5660300002)(66556008)(26005)(66476007)(8676002)(4326008)(66946007)(110136005)(6512007)(41300700001)(31696002)(316002)(86362001)(8936002)(38100700002)(6666004)(478600001)(2616005)(6636002)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0xqVDBtckt5dUZIZ0VOcU5zaUVkRGF1Y2NGcHZFaUJFd0RpS1RFYVcxclBI?=
 =?utf-8?B?UGlGOE5ReWNENHY0SmR6SUZHc2lLMnU5anZxZkhqNlpoVGFuWk9mc29lQlZC?=
 =?utf-8?B?WVNXUGt4U3hSWG9Lb2dSVmF2T1ZteUxlMEhnd3l6TE5SbDlpN1J1NlZUeVhT?=
 =?utf-8?B?UXVIdm5TMXNDNlJFZHlSTy9tTHg0UExoNlBmSnhnbWdraGVtUE8vUE1udU9B?=
 =?utf-8?B?bE53YUNXYm4xekRrSUFrZnN4S2srOXJDbHRsNlB6a0lGZjY2WHhkMWErMVJD?=
 =?utf-8?B?aEEvK2hPUEhDZytVbjBLOWFFSkJBb2xMK09qY21PTlBIVW1DeG12NFQ5ODhF?=
 =?utf-8?B?Z1BEL3dacXhxQVpORDdQL1EyemhoK1MvTWhPbEJNbkJOdjJLT2pUMHBzNGp0?=
 =?utf-8?B?UFJVY2RqcEwxMXc4b1hKVnNGWmM0WWVxaEJrL3hZV0hSbEN6Zk12dnRGTTc5?=
 =?utf-8?B?K2VUaFcxcmtJcHIwdXNWYXp5d1N6aXFTZ3VsL3VyN3UvSDdmVjRENjZaVUdI?=
 =?utf-8?B?bXloYU9Wa05SczAzN1pHVFp1SWRFQTQwOXprcmxXejlYbWJYNTZ1N3Bud20v?=
 =?utf-8?B?c3lFbVdObGl1YWh5OFU4N3hyNnNoSGlIV3k5aUU3czU4YXNhWnJXTUVrQk1n?=
 =?utf-8?B?RUpVVzlOQW42Umt3UnZ1OXY4QVRhMnlWZzBQZ2VQS1RkbjlTS1ppaHJzVmlQ?=
 =?utf-8?B?YUY1UnVKWXNiTzY2b2hiWXlQenR5Q0ZydW5DUE5SR0M4K3M0UFdQbWh3V3VD?=
 =?utf-8?B?VFN4OHZNVnpoeGthRmRmUXhodFpLSkxNQ0ZieTV0dmJtZ2plbVN5TkVpcDIw?=
 =?utf-8?B?TGlVc3NQc3V2NUZMc0VxeTVHNWxEMFQvRXlUcnhPMjY3NkY3WVNxYXY3aGZq?=
 =?utf-8?B?cktCZmk0d3JEcTA2MGp4R3BvTjZabVI5QThBN2tuVmJzb1NYeEgwYi84YnBw?=
 =?utf-8?B?N0NiSDZkKzMzdHZ4YjNpdDNGYjkwQjhxK1VEQktnTFdKcllZVkNacXZLSGlE?=
 =?utf-8?B?ZlNYWEhGS0ZFM1FXcHRNS0M2YTY3d2NxN3pJZGR2aStROVBQR3ZqeGVXQko0?=
 =?utf-8?B?TTRFbVNTU0xyVVlocHloenNIQzRRRisrT0lFMGxzK0JFSVg5RmsxRW5pUG1z?=
 =?utf-8?B?ZzJuS1BCa0M2WDdMTTRLdElHaWFVQnQvVUJHYktESWFIc25ETFFtKzBxWHpR?=
 =?utf-8?B?ckM2M3ZpMVpJRkxRRmcwKzB1TTBzUFN2WWFYUXlFN0gwVUhERVI3bHVLcm9Z?=
 =?utf-8?B?cDBqUXVwL3Y0NTF2c3E5NWhCaHlIT0owYTdMNWQ4MzFXZ1c5M2pVUC9jd29u?=
 =?utf-8?B?SG04NGE2UmxBUy8rVmVyQmxQN0JiRjF3L2ZnaVdvQ2dPR1IvS2thR3pCbVdX?=
 =?utf-8?B?c3JBeE01ck5YbElqWDhBRUZvQk9rR00wNUNzdFpBaGhIZnRFdi9FaUtYa3Rx?=
 =?utf-8?B?ZTcwTU4vMXdoQjZ6MWdZaHQzOVlpOENQUkJpM3YrU0I2MXRGT3FEdzVkbDRX?=
 =?utf-8?B?Ri9YZWZqMFoxMFNOUVNEV3Y2dzBYSDg2NDR1RDRaRHBvUHpSekpreVhweEU2?=
 =?utf-8?B?eExHMHpUZVBqeFY1WXlsU29uSjJDd0xmWWhuQ0V4VktmQkdtakkyMFh6MC9S?=
 =?utf-8?B?SlM4cGJTSVl4YnEySDZmVk9jUjd2YVdmUG5mTDFPUEt2aUVWbW5URnJuNkxT?=
 =?utf-8?B?aWMrREhxWk44anR0R0paaStORVNTVlBjY2duNFFnZ3pJaWcxZEV2TGU0eFFS?=
 =?utf-8?B?eFdlWjJDMXJDbVJ0bUhSUEhPaUVrRWFIdTZBL2hSc1FhV0E1aXBrTEUrVnN2?=
 =?utf-8?B?UE5uT1kwODFSd1ZTclJ5Ty9kQ0pJQkFWVC8ySWJBTDVMTnpJVXI0aGdvSnN2?=
 =?utf-8?B?cy8zQklMUk91M3RiOFBjcDdNa2pUZFc1YWt5ejFBNUVud0V4c0toZmdlcDda?=
 =?utf-8?B?NEJ6bk15dHdlYnM5bEY0SmovNlgrY003d2RZZ0NOS2dYMEpJUGpoQ2U0SDJl?=
 =?utf-8?B?VVZ6aVNsUXJDdEdMZEZOU2VvVmhpN3V3VHU1RkhrS0wxWEtMZXV3UEJTN1ls?=
 =?utf-8?B?ODhBenh1UUtBVlE3RGJsZnA0TmgwUlRSUE9CNUxNcjN4WmtpTFpaaDFjdzEw?=
 =?utf-8?Q?DFVk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fd912d-3a1d-4f57-773b-08db31ad1ac9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 05:59:35.4208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJEp9lB84dx7rLQx59UKIFdcU/TMBhXWsH442U3auNbdlncySdpvVUxxLFp2pfXG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8287
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.03.23 um 02:06 schrieb Danilo Krummrich:
> It already happend a few times that patches slipped through which
> implemented access to an entity through a job that was already removed
> from the entities queue. Since jobs and entities might have different
> lifecycles, this can potentially cause UAF bugs.
>
> In order to make it obvious that a jobs entity pointer shouldn't be
> accessed after drm_sched_entity_pop_job() was called successfully, set
> the jobs entity pointer to NULL once the job is removed from the entity
> queue.
>
> Moreover, debugging a potential NULL pointer dereference is way easier
> than potentially corrupted memory through a UAF.
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

In general "YES PLEASE!", but I fear that this will break amdgpus reset 
sequence.

On the other hand when amdgpu still relies on that pointer it's clearly 
a bug (which I pointed out tons of times before).

Luben any opinion on that? Could you drive cleaning that up as well?

Thanks,
Christian.

> ---
> I'm aware that drivers could already use job->entity in arbitrary places, since
> they in control of when the entity is actually freed. A quick grep didn't give
> me any results where this would actually be the case, however maybe I also just
> didn't catch it.
>
> If, therefore, we don't want to set job->entity to NULL I think we should at
> least add a comment somewhere.
> ---
>
>   drivers/gpu/drm/scheduler/sched_entity.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 15d04a0ec623..a9c6118e534b 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -448,6 +448,12 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   			drm_sched_rq_update_fifo(entity, next->submit_ts);
>   	}
>   
> +	/* Jobs and entities might have different lifecycles. Since we're
> +	 * removing the job from the entities queue, set the jobs entity pointer
> +	 * to NULL to prevent any future access of the entity through this job.
> +	 */
> +	sched_job->entity = NULL;
> +
>   	return sched_job;
>   }
>   

