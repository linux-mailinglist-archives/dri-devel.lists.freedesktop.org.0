Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A8D830078
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 08:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1CC10E4E8;
	Wed, 17 Jan 2024 07:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BA710E023;
 Wed, 17 Jan 2024 07:22:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pe/wvo4kUYtvBkboSy8grGwCiqNVntRE9SVC200+kfMFyd97SVrC4SBZUQKMpmh+yf+vJppLBWvGiUAyDe6g6WuT20NcPK6/FpuRhHEDfEqAdz4cOq7Ck1VXrsIIHBcY6cQuI7Ba0P91iyW0b2DV2Jc3tEHIQD0oVTf4ejMjwOCBHHo3W1khxn/DvUsT2cajaKPLVJhlnNZvkpXq9bUyPVkXmXynzc8yRucqdjCJgeyuEls5BaH5MhFb+GJ33Gnw4yxPgdN1FVbDwQLS17YlsUlB60E4c+cVSgROD/qT/PF+yOIqpTWY77HkE3JDyn/eQuw8g1yJWNccYnJimeT9AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYB42w6+sKEuDxnM10nCrDSz+c32bDJfgNRsEcOsJJI=;
 b=HTSWDuNHELnVsPYS6GFOYJxfYzEwc/Y1FCl0yib0+69oRgCgaplvUdNzI2KstMC18vRlCz9DHcyE1acuFMFlgNuyRk0uUnobCA104UntJ9WNY6cP769mTulGVmzptvQ4MziQIHtqilkecyUXyt1FK8El1z2ZgOO+fJVIBDJ9an80dWfAdoO83kyvHpgQHODrKzAgpCrv7IweKrNrKXJHvsMh2ACPyz8xht3nwkMwJEdPeIID5Jw7VwHFQsqnptlILK7tGH7cGSNjJ6YmeYNp6y9WUjpBOpo8hXh7+I218d7X9+sdg2M2Et58wqufdUvzUa5z5MF4fjO1ydS7/yXeyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYB42w6+sKEuDxnM10nCrDSz+c32bDJfgNRsEcOsJJI=;
 b=XORaRJgHHrrDWdUBG7CXJ0F7ZMFb2sbfk6atZP4bXv8yj10ItX6A2rfS7sXbroaGIZl0oW0qdNrze7CVhPlXTIvspm5ZP3AwY0itpKdMjX86yb8wlfU+CAP/4CPz22LWS3sXbYfzx9XemNLbtv7fDFSY4XeB3WBM9tTX4iXLGbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB9243.namprd12.prod.outlook.com (2603:10b6:a03:578::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Wed, 17 Jan
 2024 07:22:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Wed, 17 Jan 2024
 07:22:11 +0000
Message-ID: <560cafbb-ebe3-4605-95db-4923a35183af@amd.com>
Date: Wed, 17 Jan 2024 08:22:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/6] drm/lima: fixes and improvements to error recovery
Content-Language: en-US
To: Erico Nunes <nunes.erico@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240117031212.1104034-1-nunes.erico@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0359.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB9243:EE_
X-MS-Office365-Filtering-Correlation-Id: 3694f414-58e4-4d5c-2557-08dc172d0573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M49jUJai8ErjzbK5fp+hwAYZt9nOx6/DFPxTZ/F0b3Y/mw6qs84Q8GY3WOD5jin/ME+XdcdGD/SDYUMt7NX7prTy33sCSSSWbeqJKa/eCcXjstVCZAhu2Y33FlNRm841hYbl1PT77TELb1ZZCQ0aKTKHcNxKea5CnSu2J9WgKl+mYcexQyLw8N5TtJImpyF292KV68cSMVZrtzgWCgmzs0HKpI4mSAVipaiJrq78wLz7qTVsxUEYbRfXJC8qvWAl2aI6lPPTUUKyvqdV3oN6mp4b/sLHZJjZgkAdSy7+LtJ73LDFTjFxFiQdY1SYbi+gPCRRVvvBQPlEPPtRkz3CNjMptuTuCtLD6hoHDE3YwX/QJz/VdZPbjcJDxmmBW1dNPty6dA3tGqzBkMQVmXRYp6wwKYcchwjU0Lz+aELQMJCnGxPgz/bYQOPR/NaC9qRdi2HrPI6jhtB7gkV5dn/MARbuBu3+sgk4c7HqCm3XBfW7HezCAxcoUPeV0sY3VZR5Nz7iianRsHLd/Ef/erBzkQ9RYCmtPn1vO0lXrxwGNTyZ2OWAUNVZ2tMuVbSBh3vD7TnY6DF7R+VLcI3ByZU+5W+gkSNJCM5yHlyyMQMAeoFWpsGHVJAHo1jZcNgiVTbaeVi0WVQ3Uh4FGoOxYlZYaGdCgmaoOHyueKOIozTVXZc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(396003)(136003)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(2906002)(7416002)(5660300002)(8676002)(41300700001)(478600001)(4326008)(38100700002)(6486002)(966005)(31696002)(86362001)(2616005)(36756003)(6506007)(26005)(6666004)(6512007)(83380400001)(66946007)(8936002)(54906003)(316002)(66476007)(110136005)(31686004)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFpRRm9oVGdudHh5WGt1STlNR1dlZlJxSUpYMWN2eDlUNXdQdEZIdis5QVJk?=
 =?utf-8?B?bnBTcXNESVVTdzVwWWVQZUozSXVjQ1hUYm44ZTlqTEdHVEIrU1hYQ2xVUDZh?=
 =?utf-8?B?VFRmS0VBVUtnNWljUWJOV0hLNmg2aWZWSFhBRXpOb1BwRjhDN0VyTm9meXcw?=
 =?utf-8?B?ZnVyaml6SnJjS1dWS2hYT3VrVHlXWTVidFZrZXllZ2lHSE1BMFkxTGphbmdH?=
 =?utf-8?B?UTRZOWJ1bHRLVFVxL1Z2NmR0YjVEYnBySEF0djBVeDVHSENEUzY3b0xjbHpE?=
 =?utf-8?B?R0VoZldLSkd0TDIvRlo1WkVFeGg5SElMOFRNeDlxeHpxT1k5WlF0WEg5Z0pp?=
 =?utf-8?B?MTFOL05MMDVhQXBRdXdXN1ZIRGY3V20wMjRvejlFeC9OWVVEaDZ3RFgwUkF0?=
 =?utf-8?B?RVBsZFE2ZGl0M2h0QUJySGNnUTJaakEwYzdFODMrYkFvWmprQmFnWnlwQlNY?=
 =?utf-8?B?N1M3MlNlSThtazVKMkRmYUJ2ZE5NaXNwSUoxK1U4K2JKRlNBaGY5TDdTWld3?=
 =?utf-8?B?K0g5RnBhbHFJSDdoUVVlc1FWNlRueFpxeW5WTkRFTjNiZ091blJxMUlITUF5?=
 =?utf-8?B?bWNhZ3NoTzM1SGM1QkdrM1VNYUVkd3pJb3ROWUVHMTdzcTMrRHdBQy9LdFJV?=
 =?utf-8?B?TUdHcEtINGRNSGdtYzJJU2RHS2tmcjdkQ1Q3dWFCY2gwMXQvWWxsN1p4NHVh?=
 =?utf-8?B?NG96VnF5dVdLb0c2ZWFBNGRhWXZtamxHMS9zdkNmTzJjNUJDakhueFp1Qnpa?=
 =?utf-8?B?MlZmL0R5Q1B4L212dGJUbmdLbnNRNC9KU0prTGFwNWcxTTJSR2Y5bmNROVJo?=
 =?utf-8?B?TU90SFBveTk2OFlRUzZNWGU3RHpWT2lCNjZ3YmlxMGc4dFUxMHcyMnNzcVJ1?=
 =?utf-8?B?TXRDRWNuS0xhTkxyY2JVbjBuTDVDUmsvUjFBSkdsZ0NPb25YVGh6eVFBaU94?=
 =?utf-8?B?SU8rbWtlQVd5WGV5L0JQQ0pyU1dxQ2hvYTZyZXNhZ0tJd0NudGJHWFhqaFBV?=
 =?utf-8?B?Z1RHS1BoVTBvQjliUndjd0praWVJTlV5Y0NSOG5Wdlk4SmZvL3JlU2RGeG5G?=
 =?utf-8?B?alpVQThjTmNtcnV5RkFhUmRMMmZLYW9DVUhNdWR1VldGbEZRbFdoSUVubXlz?=
 =?utf-8?B?bUprL05ucGFHbE15OHNLYTdKU2lYNEwvVUhWVm1BRU9vUWF4a3N3TElLZjBB?=
 =?utf-8?B?VnZ0NHE0clRLRCtXY0I0YWlQWi9iN2IzZkRvMGVrcWxIZ25icEEzUFhBVURV?=
 =?utf-8?B?NjlYaVVYbzFtemRldFovYkVoOFdzTUJ1N2NVcENtV3BTUVVidk5jdHRHNUdM?=
 =?utf-8?B?Tm4vK3F3dVl0SmYrZlo3M1dSU0lxK1dzZ2YyR0Fxekw4MW9MWGQxQWFYazdW?=
 =?utf-8?B?K2J3bDF5TXJGUm5YRWx6SmhwMWNHMTVJcDFGWXBsVTc2RTh4MHpHbWhlbG0v?=
 =?utf-8?B?ZExSRzYzMGxOTDNKRzJxcEp6dVNWOFFRVmVxZWhyZmRxcDFaNkF3UmJIRzNM?=
 =?utf-8?B?YTM1L1lVblV0eUc2dWl1UGY0UEFIR1loWGx4NzRWN0w3eHNHSUhhZEZjU0VX?=
 =?utf-8?B?MnpGRldFV0JXZDhaTzdMdFdPYW5rejJnZkE5YWZlSUpJc25Xdk9Ic0Nia3RX?=
 =?utf-8?B?QmFYanNYN3lMWkVDMFZ2ODZvTG5qV3lhNEJ0OGZuVlMzQmFSSjRwWEZKamlP?=
 =?utf-8?B?elpIdGlhTlRDeGFMc0R0Z050cEkzaUg4Ukt0NTBtU1AvcVRPT2p3cER1Y2hK?=
 =?utf-8?B?UlM5OHkzMFB1eGlwNFZVcGJiSWFUQnJhYU53STlTckt1YTZsT25TYVhvVis0?=
 =?utf-8?B?UDZEMlQ4K0ZEcEFzTGZBWENXd1FKbzBNeVRNVnB6TDlFeGJQN2ZqUnBKdVl6?=
 =?utf-8?B?WnJRdTZFZ2JWK09GSkI1NDNLbU9BVW4wMlVDSExQQkxnT3I0WkhtQlVPSFl6?=
 =?utf-8?B?TDFBOWxwV3FuMmZhK1JEd2xhMWo3WnlqZDBvVUFxRXNOM3ZvZ2pYVFBvdUhr?=
 =?utf-8?B?eGlTeEJ6aVVmeWRWQ2hncTNqVkREMHJsWk11cWJEbndlWjBCWmFIeENWRkl0?=
 =?utf-8?B?dm5jblMwUXp3ZGpLRTdwUHNqdXpHMXNZL1BRL1NWMlRmNEowcUhQZWJKNnhC?=
 =?utf-8?Q?Qbu4NTpvVpZaPA0mGwu+v/Vqq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3694f414-58e4-4d5c-2557-08dc172d0573
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 07:22:11.4558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6xTe7zTpHG7Q/xfZwZY7lZt25VuvMxvXBRP314Bxl8yuBVS7dlx4ctP4G3gx1aM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9243
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, anarsoul@gmail.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.01.24 um 04:12 schrieb Erico Nunes:
> There have been reports from users for a long time about applications
> hitting random "*ERROR* lima job timeout" and the application or GPU
> becoming unresponsive.
>
> This series addresses a number of related bugs, especially in the pp
> timeout recovery path.
>
> Patch 1 fixes a stack trace initially featured in a user report here:
> https://gitlab.freedesktop.org/mesa/mesa/-/issues/8415
>
> Patch 2 fixes a "pp reset time out" message which was fairly confusing
> at first. Debugging with an application which just submits one single
> job at a time made it clear that the timeout actually was reported in
> the application that runs next, even if that is a good application.
>
> Patch 3 is one of the most important fixes and stops random "mmu command
> 2 timeout" ppmmu timeouts that I hit while running my tests. Initially I
> thought it came from some race condition on running/resetting jobs, but
> it was actually due to hard resetting live tasks.
> After setting this there was never a mmu timeout anymore (even after
> dropping the guilty flag in the upcoming patch, which by itself was
> actually the easiest reproducer of the ppmmu timeouts).
>
> Patch 4 might be debatable, but hopefully we can agree to go with it
> since it was already discussed in Panfrost here:
> https://patchwork.freedesktop.org/series/120820/
> It is actually not that hard to reproduce both "spurious timeout" and
> "unexpectedly high interrupt latency" by creating an irq which takes a
> longer than usual to execute, and paired with the issues in timeout
> recovery this could cause an unrelated application to hang.
>
> Patch 5 removes the guilty drm_sched from context handling in lima.
> Often users report issues with a user-visible effect of "application
> flipping the last 2 rendered frames":
> https://gitlab.freedesktop.org/mesa/mesa/-/issues/8410
> This was ultimately caused because lima sets the guilty flag to a
> context which causes all further rendering jobs from that context to be
> dropped.
> Without the fixes from patches 1-4 it was not possible to just drop the
> guilty flag as that could trigger the mentioned issues and still hang
> the GPU by attempting a recovery.
> After the fixes above it seems to be reliable and survives some fairly
> torturing tests mentioned below.
> Other similar GPU drivers like panfrost, v3d don't make use of the
> guilty context flag. So I think we can drop it for lima too.

Oh, yes please! Thanks so much for that.

I'm working on removing the guilty handling in amdgpu as well and 
together this will most likely allow us to completely remove the guilty 
handling from the scheduler.

In general driver should use the dma_fence error handling instead. That 
one is well defined and way more reliable.

Feel free to add my acked-by to patch 5.

Thanks,
Christian.

>
> Patch 6 is just some debug message cleanup.
>
>
> Some of the tests which I ran with this patchset:
>
> - Application which renders normal frames, then frames which /barely/
> timeout, then frames which legitimely timeout, then frames which timeout
> enough to trigger the hardware watchdog irq, then goes back to render
> normal frames. This used to hang the application at first but now
> survives the entire process repeated indefinitely.
>
> - High irq latency from an unrelated source while rendering. I put a
> mdelay() in the touchscreen driver irq and could cause all "spurious
> timeout", "unexpectedly high interrupt latency" and actual timeouts.
> Those are now all reported to dmesg for information and I am no longer
> able to cause an unrelated application to hang.
>
> - Game running with lower configured drm_sched timeout (locally set to
> 200ms) with other applications triggering timeouts in the background.
> Different applications trigger resets independently but none of them
> cause the GPU to hang or the game to stop working.
>
>
> Erico Nunes (6):
>    drm/lima: fix devfreq refcount imbalance for job timeouts
>    drm/lima: reset async_reset on pp hard reset
>    drm/lima: set bus_stop bit before hard reset
>    drm/lima: handle spurious timeouts due to high irq latency
>    drm/lima: remove guilty drm_sched context handling
>    drm/lima: improve some pp debug messages
>
>   drivers/gpu/drm/lima/lima_ctx.c   |  2 +-
>   drivers/gpu/drm/lima/lima_ctx.h   |  1 -
>   drivers/gpu/drm/lima/lima_pp.c    | 26 +++++++++++++++++---
>   drivers/gpu/drm/lima/lima_sched.c | 40 ++++++++++++++++++++++++-------
>   drivers/gpu/drm/lima/lima_sched.h |  5 ++--
>   5 files changed, 58 insertions(+), 16 deletions(-)
>

