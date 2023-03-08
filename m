Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6A66B0CB5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16DB10E605;
	Wed,  8 Mar 2023 15:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2058.outbound.protection.outlook.com [40.107.96.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF7010E605
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 15:31:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYBrw4zbtzBMOuje8kydezBfgUUNStYdmVaL/ShIXvXNTYm7V6IHkX3gAKeEIEilE8r4R121lWOsrDD2iZ5zAGtpHhy/vdrUTfCY8XpI5S3bCbrNxheqg4DdVk0dDGSI9f+UOY6dfCGtRHE7PNpoU2UoibE9eu5dxgGGOakuZekRl7qxf0kT7SO9oz/egDSwBH7IxKJ4w37DEXNyCkZZAogK8QHltQPvhFT/4cWCsc77v0iyZtYC2LvLgG1ZuztGxN5qC2rBQSgoaC2Grfkdoa35NRhM4CcxYixaZ2JHTOT98hADt4y2u3RZaSGcMyNdsvOuWY/4tX0MBrpOem7cfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfuZ66LaKqYQjvrnTukAgaLwN2aON/CmOarHxNTNg7Q=;
 b=XPRFa6NfcUYpRmZAU/bXnJN2KJrXpwqtQ6S6yhYNe0dgsMNw+wYbOFcElIbYI0DkwqWuztd/tjW44wY1E/Aqk9+6fTfJEU25KWHnc/Wrmsv1RtuIeE5a2Qz6kmdgQLdOHfIDj0qwT3ETQ/qGHniuYD3mLRE1t2sBgAME72RkBLjJICQJ/jIzV1/4ZjHO05l7VP59JAahGN/8xo150NdSmWfPPq+tgCdWnjqvzO1fKS/CSpZUbJ1JalvvUPB3kmENCl+n3VSFb3se4myZO/+0jiRjfFlksekjpdzBpAZzL2JL1Bc0UrAQIfO9KMunkpzZHe/sxqvs95+2oV9Auo8W8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfuZ66LaKqYQjvrnTukAgaLwN2aON/CmOarHxNTNg7Q=;
 b=Ah0XUlpWMCb1CwKZTIfJzk4pv1GOedO/A67+WEyqiUX4iyvy8JDLqRMm/I3ZUKGRHI/K9X9MRUgrF+EiworhzkiAdqMI7a607avLlPy4GE9u8f/ALgyGpgqdgprqE5qykBUwx2n5uzw4zipbl9Ap1nCAubozxTJNmC1EwEIPkUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB5982.namprd12.prod.outlook.com (2603:10b6:8:7d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Wed, 8 Mar
 2023 15:31:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 15:31:00 +0000
Message-ID: <a39c6b40-f190-002d-ae1c-8b58c6442df2@amd.com>
Date: Wed, 8 Mar 2023 16:30:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RFC 10/18] drm/scheduler: Add can_run_job callback
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-10-917ff5bc80a8@asahilina.net>
 <cd788ccf-0cf1-85d5-1bf8-efc259bd7e11@amd.com>
 <a075d886-0820-b6fb-fcd0-45bfdc75e37d@asahilina.net>
 <2b1060e9-86ba-7e16-14f1-5b5fa63de719@amd.com>
 <9f76bb68-b462-b138-d0ad-d27c972530d4@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <9f76bb68-b462-b138-d0ad-d27c972530d4@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ecdc8e0-858d-477f-da04-08db1fea1efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eMOumGSTG1BUxU75ALZqxv2UNlgxHNoFcGZu8k4tZ/ZiXF03rtoE4A1hvQAQlq8d7GYjOsG5jLdaEhoiLOofGsv21bzOanN6ff0xPrpUoq6fZqv8JOjZca/5AVG9QMH2SkQanfbEabXnPQT4U/luejWRZTDROPuzSJoicV5MlYcOJxUxImARk0OwbvyEPczEXZHwMxsquH0qW9RUqf1JqbPU3ZvFDAS1fwmgXNrP+nsMHj7BRhRFRpy2rMJxUbvt/bkdmCTmPqo7ancG7nVZxZkYu2dcdhS3XAyRqY02FIfXh1zAUHng2Tc46XZtT2x6XP0hFhMS8xZCbfY+5x8W/yovpDHqTYcqhMvu/bt0+AHddREDSreio6oiPK0+sBJycrtTVj08GtO+1GDFDA5pf1G11YwDjTrSOaEAnNUrA4JzQRnuzUhoXnHCWtEe9FQ7Hsl7cEt0qIGzvz+u0T9HkhOhz1rQTagieSLBFperYn67MqG8I46p9P6lygaM2an5Giv0vdHifPXS/tHQCI1f/7a5T3nSH+MbMkIuWY4iDcpipIh7Vh4y7CytOc8sJA6qAovi3GB8O53DE7nsbwbLRvsuK3MWHhVv83bp+wNwvY8Mdf5nh55V1PDEa7ZVdb5U03bdtCQdsifoI6X+FnkFz1ZVTA0bAnD5fp2QF7IHOlTreyQHeCjtq02SPGZFMft85fj6dTfyb5V9382AeI94+5ahG4SVyJz+dnqfJXfv2muke1dolK5k0APSNfKIz32T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(451199018)(6506007)(186003)(2906002)(38100700002)(921005)(66476007)(41300700001)(4326008)(8936002)(66556008)(66946007)(8676002)(6512007)(6666004)(5660300002)(2616005)(478600001)(966005)(54906003)(110136005)(36756003)(31696002)(86362001)(7416002)(83380400001)(316002)(6486002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2VzZzRjSVVTa0VhQ0tpQXRpc3ozVTk1a3FvSkhjVkM3bVAxSjJPdzVhMDl0?=
 =?utf-8?B?aEp5NVdEWlkwUXpsVVdGUkVLTkJPZU1BZWhjdFJUK1dxTEJzQ2hBcFo2akky?=
 =?utf-8?B?a0xnYVdnVm1ua3dmTkN3R09vWWhxYmUyWDhzNHNJdUNMc0pEZXg5WEpLZk5S?=
 =?utf-8?B?anVoNkR2dUxoUkwyY2RQVTVXMEkxdkFCRERmNTJPbGdxZ0ZYUFZ6cUZyZktS?=
 =?utf-8?B?YXQyQ3oxMGR2V2VLTjhXbXNjZ1ZXN25zZkpzcjdiVFFZUEViWnBsMjVORHRZ?=
 =?utf-8?B?c20vdkhXRjRLSGtUN1NFMFJuMWtUYlFhL2hpUFV3UmZmTlF4VXNqRFlrSTRv?=
 =?utf-8?B?WmZqUWtUVG1CeTI5dm5MN0k5UkJqcjJSYjFmUXJyWTRtaGJkTkFDQXE2LzdJ?=
 =?utf-8?B?cGhRcmplWU82MzArcENNUURYaTUxTHM2MkJvRFVQdTNNMWVCR0RXcGV5M3JU?=
 =?utf-8?B?QzZSWEpkNXVFdk5nOWdEVzVGMkROamNBUitqeUQ1dksrOXZ4T3A5SEVGU2NQ?=
 =?utf-8?B?cUx5dUJhc3k4UEh3WkZ4Znl1aXZuREY3aDRLZjQ4ZzNFNENFZmkvVWUranZy?=
 =?utf-8?B?cG0zRkdZS2tyNmJkK05adDZQNGE5VVFuRC9CSk1LS2NDUDN3Y3ZweGVBSmVj?=
 =?utf-8?B?YW5pWUdKWlA2WEh2YkJ5N3hrZFphQ2ltaW10b0pvbWVXM08ya3k1dTFVYmpW?=
 =?utf-8?B?bERxWE5lRGR6Z2hRK0Y1aHlXYjN3RVhmSnVtRk8yVU1oRHF3bHZaREFIOVI5?=
 =?utf-8?B?ZFdUb3c1VE1LMHluY083VXJ6R3lnNWRWbXNwcWt1L2dkNXhFcjlBVTNpV2RT?=
 =?utf-8?B?ckVDRVpVaEdUK3hsMVczTm1WYmdBVFpRNnJGZlhxcU9QendLcmw0RGRmZDZx?=
 =?utf-8?B?c0xqTWhXWVdUanhqZGk4ZXpiTm0yZ1laaXZJSE1ubldJK2xsR1VYbUZhSW41?=
 =?utf-8?B?dGRTUUx5VGV3RHBuckorb0wrOXJCODAyZk43QnRuZzhpVFU5cTFwbU9LbWxK?=
 =?utf-8?B?dm9vcU40K2RnNFFjYVlJZTVrOWNRNGdPY3F6RGUzS0I3ZWNLSUcxTzVSV1BI?=
 =?utf-8?B?NmRKNFhYc0RsTDE4eU44YlpHcWwrdXBheFdvcmJnTURERCtPcmdpL1BZWlhS?=
 =?utf-8?B?a3VoSDBuQkFYWTJDdi9IQVVubFc1RU5LakZ6Y1I3clY5UFRza1JlL2NzL1Rv?=
 =?utf-8?B?V0Y0Wkh1a1Ivb2dlMm52NktuS2srVEdXU3hKMWY2Y1N0SFdUeUtoMEpPcjI2?=
 =?utf-8?B?c3ZhbWh6WnZGc0Rtd3FRcjRnbmlMSDhLVDV2L2dWVFRKWUMvcmExMnpPWTRK?=
 =?utf-8?B?MCtYNlJyQzdPanFoUlBFc3NDUVVFOEhwUUF3KytoUEo3M1gxMDdGZ2IvdWJv?=
 =?utf-8?B?QXY3N0hTOXBzVFo0YnFnbU5IK29yTmhKZnhtM3JtamJVZUx6T2NmNnViQ1NC?=
 =?utf-8?B?Uk5BZzBVcVVySlNsd1FJejhqRHdKTFhUUDJEbTBYYW9iakNQMFptU2hYVlpl?=
 =?utf-8?B?Z3h3TFNTSVI5UFU0SjlWdmZpcjVORHliUHQvSUh2Q1krNjJQOTB6RmYzdGdy?=
 =?utf-8?B?eXRTYnVQMmNqNDBuVzBWTUo2cFV2NytFZkRUOW1mNUo1R2tKUnNpMXJaVk5y?=
 =?utf-8?B?Nmx2WXA4Q2ZVdG9IYVljRVVTZ2lJeUMzblEzV1VpRDQrMHNLWlZrMWNOc2Zx?=
 =?utf-8?B?NGVrSXdpc0J1ZEc2dkNyazBmcFVHZ2RWSWh2TVppejZhOXVPVDg4WnN0KzRn?=
 =?utf-8?B?cVIyZXpOcTNReG1zV3hkdy9RM3RrVzZBOUxQb002eXRlek1mM2lmWWlzb2dr?=
 =?utf-8?B?b0pqakRNMGVZTVV5OHFsMGtjVm5tRVY4MGRjYldxeENqQmx5d2h2K0lNSGVC?=
 =?utf-8?B?aGJ5Mm9QZVdKcTVWWjlYalQ0d041UjJKWFl6N3BqV1B6REdZeGRrb3haU3pE?=
 =?utf-8?B?Qnk5cXBpNk1uaFJYb1VaU2gzSWNXQnc3QzlOcnBQTGgweWdSRG81L1NlREU1?=
 =?utf-8?B?ZVZ2dEp2QXM1VXJCaDRPQTR2Q2krVTBjQzU2dER0cUxudFJaemx2aFVJckJ1?=
 =?utf-8?B?K0ExMmJabnFIR3FhVGtPUzgxaHp0eDRJZ284K2gyS25GMzdYcllJcGNEeDdz?=
 =?utf-8?B?TVF1OTZpNFZ5T2JtaWpFSStQK05PQko3MWtEUm5XZHZMTklnMS9JT1NqbUJm?=
 =?utf-8?Q?rp1Wnx8FFy4/4TfI6CavtnYY1VOEtlBywjXtFKXrdNJh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecdc8e0-858d-477f-da04-08db1fea1efd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 15:31:00.8161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sy4pARu52vC8op5GDy+M8KYGN/MZ2Ygjp9NZ4rtyOkohSac3beK5C7cmnZ/9zPw3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5982
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.03.23 um 15:53 schrieb Asahi Lina:
> [SNIP]
>> The background is that core memory management requires that signaling a
>> fence only depends on signaling other fences and hardware progress and
>> nothing else. Otherwise you immediately run into problems because of
>> circle dependencies or what we call infinite fences.
> And hardware progress is exactly the only dependency here...

Well then you should have a fence for that hardware progress.

>> Jason Ekstrand gave a create presentation on that problem a few years
>> ago on LPC. I strongly suggest you google that one up.
> Faith Ekstrand (it looks like you mistyped that name...)

My fault I was really just mistyping that :)

>   is the person
> who proposed that I should use drm_sched in this way (see below), we've
> had a few private meetings about this design ^^
>
>>> You can see the driver implementation of that callback in
>>> drivers/gpu/drm/asahi/queue/mod.rs (QueueJob::can_run()), which then
>>> calls into drivers/gpu/drm/asahi/workqueue.rs (Job::can_submit()) that
>>> does the actual available slot count checks.
>>>
>>> The can_run_job logic is written to mirror the hw_submission_limit logic
>>> (just a bit later in the sched main loop since we need to actually pick
>>> a job to do the check), and just like for that case, completion of any
>>> job in the same scheduler will cause another run of the main loop and
>>> another check (which is exactly what we want here).
>> Yeah and that hw_submission_limit is based on a fence signaling again.
> I don't think so...? It's just an atomic that gets checked in
> drm_sched_ready(). There are no extra fences involved (other than the
> job completion fences that trigger another scheduler run). The idea is
> that when the hardware queue makes forward progress you check against
> the limit again and submit more jobs as needed. I'm doing the same exact
> thing, I'm just using more complex logic for the notion of in-flight
> queue limits!

Then why can't you express that logic in a dependency fence?

>> When you have some firmware limitation that a job needs resources which
>> are currently in use by other submissions then those other submissions
>> have fences as well and you can return those in the prepare_job callback.
>>
>> If those other submissions don't have fences, then you have a major
>> design problem inside your driver and we need to get back to square one
>> and talk about that dependency handling.
> I think we have a disconnect in our views of what is going on here...
>
> This hardware has firmware-side scheduling with an arbitrary (as far as
> I know) number of queues. There is one scheduler instance and one entity
> per userspace queue (not global!). These queues process jobs in some
> logical sequence, though at the firmware level they get split into up to
> three queues each (and there is some parallelism allowed). The
> limitation here is in the number of in-flight jobs per firmware queue,
> not global.

So far I'm familiar with that design.

> There is no way for things to deadlock. If jobs have been submitted to
> the firmware queue, that means their dependencies were signaled already.
> Jobs have intra-job dependencies via driver barriers (which drm_sched
> knows nothing about), but the submission code in the driver guarantees
> that they are deadlock-free since you can only barrier on past commands,
> which by definition submit first.
>
> If a firmware queue is full, drm_sched blocks. Since it is full, that
> means it will run those commands (since they have no outside
> dependencies and they are already queued and ready to run by the
> firmware), eventually space will be freed, and each time a job completes
> drm_sched will do the can_run_job check again and decide whether to run
> a new job.
>
> Since the firmware queues contain commands which only have past-facing
> barriers on other already submitted commands, by definition they will
> become empty at some point as long as the firmware is making forward
> progress. And therefore, by definition, can_run_job will eventually
> return true at some point after a job completion fence is signaled (the
> one for the last job submitted prior). There is a check in the driver to
> ensure that we do not allow submissions which, by themselves, would
> exceed the queued command limit (we actually just limit to 64 commands
> overall right now, which is conservative but seems reasonable given the
> 128-per-firmware-queue limit).

Well then again why don't you give that fence out as dependency? Is it 
because the scheduler tries to optimize those away?

> I get the feeling that you are conflating pending jobs with submitted
> jobs. This isn't about how many jobs you can have pending in drm_sched
> before running them or anything like that. Of course, at that point,
> arbitrary dependencies come into play and you can end up with deadlocks
> on dependency fences. But that's not the case here. What can_run_job is
> waiting on is guaranteed to make forward progress.

I see that we have a disconnection here. As far as I can see you can use 
the can_run callback in only three ways:

1. To check for some userspace dependency (We don't need to discuss 
that, it's evil and we both know it).

2. You check for some hw resource availability. Similar to VMID on 
amdgpu hw.

     This is what I think you do here (but I might be wrong). But this 
would be extremely problematic because you can then live lock.
     E.g. queue A keeps submitting jobs which take only a few resources 
and by doing so delays submitting jobs from queue B indefinitely.

3. You have an intra queue dependency. E.g. you have jobs which take X 
amount of resources, you can submit only to a specific limit.
     But in this case you should be able to return fences from the same 
queue as dependency and won't need that callback.

     We would just need to adjust drm_sched_entity_add_dependency_cb() a 
bit because dependencies from the same queue are currently filtered out 
because it assumes a pipeline nature of submission (e.g. previous 
submissions are finished before new submissions start).

>>> This case (potentially scheduling more than the FW job limit) is rare
>>> but handling it is necessary, since otherwise the entire job
>>> completion/tracking logic gets screwed up on the firmware end and queues
>>> end up stuck (I've managed to trigger this before).
>> Actually that's a pretty normal use case. I've have rejected similar
>> requirements like this before as well.
>>
>> For an example how this can work see amdgpu_job_prepare_job():
>> https://elixir.bootlin.com/linux/v6.3-rc1/source/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c#L251
>>
>> The gang submit gives and example of a global fence lock and the VMIDs
>> are an example of a global shared firmware resource.
> But the resource can_run_job is checking on isn't globally shared! It's
> specific to this scheduler instance, just like hw_submission_limit is,
> so as long as the firmware behind the scheduler is making forward
> progress, the resource will be guaranteed to be freed until another job
> can run.

Well either it should be globally shared because it is a shared resource 
(similar to our VMID or gangs) or it is an intra queue limitation in 
which case you could just use the fences previously submitted on the 
queue as dependency.

> I actually know I have a different theoretical deadlock issue along
> these lines in the driver because right now we grab actually global
> resources (including a VMID) before job submission to drm_sched. This is
> a known issue, and to fix it without reducing performance I need to
> introduce some kind of "patching/fixup" system for firmware commands
> (because we need to inject those identifiers in dozens of places, but we
> don't want to construct those commands from scratch at job run time
> because that introduces latency at the wrong time and makes error
> handling/validation more complicated and error-prone), and that is
> exactly what should happen in prepare_job, as you say. And yes, at that
> point that should use fences to block when those resources are
> exhausted. But that's a different discussion we should have when
> reviewing the driver, it has nothing to do with the DRM abstractions nor
> the can_run_job callback I'm adding here nor the firmware queue length
> limit issue! (And also the global hardware devices are plentiful enough
> that I would be very surprised if anyone ever deadlocks it in practice
> even with the current code, so I honestly don't think that should be a
> blocker for driver submission either, I can and will fix it later...)

Well this is what I thought about those problems in amdgpu as well and 
it totally shipwrecked.

We still have memory allocations in the VMID code path which I'm still 
not sure how to remove.

Regards,
Christian.

>
> ~~ Lina

