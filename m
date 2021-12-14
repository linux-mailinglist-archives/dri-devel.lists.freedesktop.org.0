Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC83473DE8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 09:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6AB10E9CA;
	Tue, 14 Dec 2021 08:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2045.outbound.protection.outlook.com [40.107.96.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C765610E85D;
 Tue, 14 Dec 2021 08:01:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Frshq0D2zxtuHIn+XjXapto9oN3iJ0y9a6cE0oED6vfTqvc910vT8YLvK1GTAC5CxIii8n1N1QnP7wKB5ACjOocFuUsI1HOr99JHMW8K5YD2gKgyCu8Ccaan/DgCgSFcMFdV4HKjPlqVoG7uLCRkiaAxBtbmqmSAr3aNaclXghhVQ+Pm8q/Zc+BL+IMMazL46dAuxBi+przuQs4kMZ7wvPxA21p8urUXeTHckx8N/OsViKuzahr1wJY2O7XZs53GXi31F3Ne7ljmQeNSDIFUR+M0pAv++RGyAICfjPb5Wjji7spTo/0d9RzOhMfhlQGCicrVcKuw+ZXUPkFq2cc7GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vgFQ2BLJEIaso//+WdiAClKAA37svBcsVTCNHmO3v4=;
 b=NXWc1tNqXrutzg1tmlV4UWYZnGXjLOvsdCFNCkqqxjGVLpe3KtVE4sAHH6Z/ewsftr8MLHXYKDwoWSvM+Tdanjzs8Y7tYAKuv+0Kbq1IcbvAgSSoJhQ/Sa/sktU99l9SeQI5Ytsg41D0sAZWhbwt5A7JU7+H2pgAkIgid+ut4Je1kSpOTyWD13fZfrfIRLK+D4qBsGS8JUP29w80Stl3V5kgj1m1Q2cVZ+nHlozVKt3T83jrPiQGFfRZ7+UUst2UFxsYQhA+gefUG556VSkdFYwIddYLSXvBoCzcb+xcP7dFukpHw9ZYpWmuYQB+zESCm3e0Yp008UQS4/9fxWtAyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vgFQ2BLJEIaso//+WdiAClKAA37svBcsVTCNHmO3v4=;
 b=LtUmGTcMotIJquYuuiXQT245U0unkJF0VF0m0C/7wmB+7sTq6V3irdBPrd/OhyKZ43jv7/t3a1dofOwQ0eGrc8MIQtpg+9KJ6j9CgkKm4FZ8xNNqwMI9KDEJ6aYW5kzyHYF8OxqFqq18ctdunmRR8MBpQAxDC7MnzlaBpmnfVl8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1535.namprd12.prod.outlook.com
 (2603:10b6:301:5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 08:01:34 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4778.018; Tue, 14 Dec
 2021 08:01:34 +0000
Subject: Re: [PATCH 2/3] drm/amdgpu: fix the fence timeline null pointer
To: Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20211213063422.2232155-1-ray.huang@amd.com>
 <20211213063422.2232155-2-ray.huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1d10af93-37f9-ad82-7498-f32e7963513b@amd.com>
Date: Tue, 14 Dec 2021 09:01:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211213063422.2232155-2-ray.huang@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0037.eurprd04.prod.outlook.com
 (2603:10a6:208:1::14) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4128804-88c6-41f3-33dd-08d9bed7f222
X-MS-TrafficTypeDiagnostic: MWHPR12MB1535:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1535444ACD25E793E19B845C83759@MWHPR12MB1535.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sauCgURUSm3jJhXK7mO69kC+3N38vX90rLa3g6reV+oX89ErSjX1xlkjk8kpM+4VHvPPWla1cf9v+OW2Xnec7n5pLCFPZuj7a1EOmbdQzGsPTIK9OwkcvnPxN2obTGu/tFJ/5tUu4Bwxl2Nwq0ZoXuDPgZm3vijybUR5HZbtjfGrrCIIVBW6BuD50NN5LSHP/7HRBmi94qUOgq+R1QEswtiwO98BXTzMClIwaJQ+fxDFYPqc9ltlv75+xI8F7jy4Dlui3BI7A7563PwUGcg2SFuHrAlIyPcv28D/xvMBTO1RYU7kve5Wnbhpzg77X6q/jxWgXEW7Do8VrxKwhRP0DAIuGwECxowbCmyx4eGSOcNYbtnU7YxoD8H/q864vLLf9QZvgy56Y96YH7iYhwF2ocsJWv/KIxV+86Mi/Ygx1Ku1/hM7xNEXxVDkWN0SlZDj9I1WgzCkPeofmgtY4IofauzGLA5k44ADniUZgp64wJUMynRA+Ldhy8DKON48ex4foX5AcD9S7SFIDjt5LS32G3239bM2fJsF48klDxtFQaJyCTFGPNuq0DDh8kEdbE1u82IWcFkncYFf5OEIsE4GC3TLcDso+7ZazSxeJ49B2ffKJyGlG6Bxz9d5Na+MHgFy9wLYvE6S9USBhP1ZGRLRecfT2Hhgf20Ve/R9vT4SztV8aFjYfRJkkxtP582ixiZ2TjBOVbPBAA4XviNv5EXkw3GYliw1+q9BMKJP60o0Q1k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(31696002)(4326008)(2616005)(26005)(6506007)(6666004)(8936002)(186003)(86362001)(83380400001)(6486002)(8676002)(6512007)(2906002)(110136005)(5660300002)(316002)(31686004)(54906003)(508600001)(38100700002)(66476007)(66946007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajB1SUNnZmpZVExUd0t6VXUwZ1Z2OXd5S2VGT1RBYitDMzBVQW0zUG1BOXcr?=
 =?utf-8?B?eXhNZ1phMElOVzZjdHFYSnVSNGNyV0lJUkVUNDVtcTVvVXY4aEwzc2VEN004?=
 =?utf-8?B?dzAvcTZRRXZvYkJEV3pvVGNVZERIMzR1Y0JFaDNrWjFhWG10RFJ2QUpSVWlu?=
 =?utf-8?B?aWVSVFpONkg4YmhjZHFIblloWVNPczBXTVZabURpZ1Q3eDcraEY0aThoNmRn?=
 =?utf-8?B?WG1WaUw1MFlMcnBCUzRaOWdEQmlLMERDdHI0UTJXa2c5LzA1VlB6SnZMZ3Y3?=
 =?utf-8?B?T2VPdzZVdXFzbDZ0akllUHAyQmdFMUIzZnlnejRKOG9ldGZFb295TmlLMnFx?=
 =?utf-8?B?bUZjcHlKK0oxbHYvWXZPZSs1dXJUOVZXZTRoc2FXQmZUZEJQdDB4UG1Vc012?=
 =?utf-8?B?QUdqMkRxWnluYXVJUzdkaW1BbjduZmhZZHNNV0laYXV0M2IxWEhFVkIyS0VG?=
 =?utf-8?B?Y3B3UEpWSTJTd3hCTHA4eGwrRzJFYU5nOHYzRXpJWHQ1b0pKam8xU29la2Fo?=
 =?utf-8?B?U0cyT3lua0tRZGJWOVNkb3N6ckg5U1dVSUlwdFFnU085YmtrczlsUGpic2VB?=
 =?utf-8?B?S2d5WFFHSkEyRTN6UVA3dlZtMmx1aFU4SkNLRnhJeHVKaE1yZkhuWTlhTDVW?=
 =?utf-8?B?WFZDVGZEWnNnZWc0Z053MWRSK3RRU0NlYkp5eXBnbWY5WmdtaUJQZHJwYVl1?=
 =?utf-8?B?RDdzRDV0SkJDSVBhV2hydDFuTU16UXFnRXM0Szk1K1FuUzByTmlvbFdJc0Zw?=
 =?utf-8?B?a3pwMDhncythYzZZeWhnMFVKcjZqZzFrVWpGM05BYmpmZmZBQUE4WkNoS25Z?=
 =?utf-8?B?QWtHRjhPWnFwWC9LVTBPQVhTeU9GNzhNNGpObS9lQ1Rhb01pTGp1amVhTFhU?=
 =?utf-8?B?SDQyUFdWeUF3cWxkMGR5OXdZV0JXS3RXQStOYjR5M0FObGE2UHg4a2ZLQlRS?=
 =?utf-8?B?UlZOVzN3TmJZTnlQNlNwaDRtUk53NDc1Syt1V0IwbWVwN0tNOTIvWTRNYlBL?=
 =?utf-8?B?K1JsUWFBbmw0cTFpWEFYVDYwQys1Vk9TTVZiSnI0SjkwVHdIcTdsYjJpSUFv?=
 =?utf-8?B?RGlTZFU1S1p2NUNnbmFQSU5HbDhSMTZESXhMQ0UwaXlqRkFNNVlCcTVNTUlE?=
 =?utf-8?B?Q1U0SkVXazJiU29wTk8yZ2E4aEdnY3BLbEV0eWhvaloyTkpSSFBXMlZxVG11?=
 =?utf-8?B?T0tlRDQ0ejhZYUo4YmFJMzIzcStCVzhlLzBIV2dCOHlQZjQyZnRRczR5eUdW?=
 =?utf-8?B?UTdKWGREbFhMVmh1ZVVoY2RSWFRKNXIzUmxZaUVsdjBINExWZFd6SXQ0RFRX?=
 =?utf-8?B?VjQ4RWZvcnlsYzNLaTgrRk5leUpzNW5VQkFFVWNjaDlNZ2pZa0JvZmxZWlAx?=
 =?utf-8?B?OXZ3YU1rTzQxS0VHWGJsTUpjaWV6am1vUUtHRzdHcUhBTDcyNXlIZ3ZxbEM0?=
 =?utf-8?B?enZkVXRrRDNBck9UOTQwcDJHN3NuQWdrQTd6cUNjSkJ2NjZlYzZvM096MC9l?=
 =?utf-8?B?OWVWNUo5MERyc0NYOTdiUW1mUnc3eks3RVFtUXN5dWlNSnR3YkdmbUFROThH?=
 =?utf-8?B?cmh0OU9tRmVxd2RNekRGbWRzZ0pYVUlBTUlTaVVETHdGL2wwMW1VdUllRHFR?=
 =?utf-8?B?QTd2dzlTTitRcGVidFo3NDRJT1RFNWpZd3hNMW5iaGZLbTlPY3NvSEtqbVJ1?=
 =?utf-8?B?dHFiS3ZoNFRyYmYxc0xZNUxEQ0NIWTlKY3cvRkpGR1NTZzBlUVhSSEE0cWtt?=
 =?utf-8?B?dG1YYXNhMGtGRS9qTVZwODZuV0hDK1pINWhHTUpueTVlWnVremYzeTcreDNY?=
 =?utf-8?B?eGZBYnYycnAyOFp2dDNyUmdmUC9Gb08xQWlVemxLNytpNXJqZlgzd1BaWHlY?=
 =?utf-8?B?YlN5em1LekNWTk9YTEdFSW1TMmhpdTh0MDFUUG4zbkc5UWcrVWYybkdyNlFW?=
 =?utf-8?B?UzRHQzcxcnNNV0dTMi9xNTNiQlEyT3VSaCsxeEt1MkJ1YURNZHBtVXpTT2hR?=
 =?utf-8?B?K1pQUjltbGVyQVEzQUF2c21NQTBtODMvaEJDSjJFWXUxRXhidTBwZUwwcTlu?=
 =?utf-8?B?aXZIV3VodG5QcFNleE5lOXNOSzVoaHh3TUF2N1ZHb2ZvRXd4U3RMVW56czZ6?=
 =?utf-8?Q?3t5c=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4128804-88c6-41f3-33dd-08d9bed7f222
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 08:01:34.0848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmnYwk/s3XIDEodWbbdCTQxT5GPTG6TIugxhsdqJEMBAk9d3dfJBFmAB5sbrcZno
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1535
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Monk Liu <Monk.Liu@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.12.21 um 07:34 schrieb Huang Rui:
> Initialize the flags for embedded fence in the job at dma_fence_init().
> Otherwise, we will go a wrong way in amdgpu_fence_get_timeline_name
> callback and trigger a null pointer panic once we enabled the trace event
> here.
>
> [  156.131790] BUG: kernel NULL pointer dereference, address: 00000000000002a0
> [  156.131804] #PF: supervisor read access in kernel mode
> [  156.131811] #PF: error_code(0x0000) - not-present page
> [  156.131817] PGD 0 P4D 0
> [  156.131824] Oops: 0000 [#1] PREEMPT SMP PTI
> [  156.131832] CPU: 6 PID: 1404 Comm: sdma0 Tainted: G           OE     5.16.0-rc1-custom #1
> [  156.131842] Hardware name: Gigabyte Technology Co., Ltd. Z170XP-SLI/Z170XP-SLI-CF, BIOS F20 11/04/2016
> [  156.131848] RIP: 0010:strlen+0x0/0x20
> [  156.131859] Code: 89 c0 c3 0f 1f 80 00 00 00 00 48 01 fe eb 0f 0f b6 07 38 d0 74 10 48 83 c7 01 84 c0 74 05 48 39 f7 75 ec 31 c0 c3 48 89 f8 c3 <80> 3f 00 74 10 48 89 f8 48 83 c0 01 80 38 00 75 f7 48 29 f8 c3 31
> [  156.131872] RSP: 0018:ffff9bd0018dbcf8 EFLAGS: 00010206
> [  156.131880] RAX: 00000000000002a0 RBX: ffff8d0305ef01b0 RCX: 000000000000000b
> [  156.131888] RDX: ffff8d03772ab924 RSI: ffff8d0305ef01b0 RDI: 00000000000002a0
> [  156.131895] RBP: ffff9bd0018dbd60 R08: ffff8d03002094d0 R09: 0000000000000000
> [  156.131901] R10: 000000000000005e R11: 0000000000000065 R12: ffff8d03002094d0
> [  156.131907] R13: 000000000000001f R14: 0000000000070018 R15: 0000000000000007
> [  156.131914] FS:  0000000000000000(0000) GS:ffff8d062ed80000(0000) knlGS:0000000000000000
> [  156.131923] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  156.131929] CR2: 00000000000002a0 CR3: 000000001120a005 CR4: 00000000003706e0
> [  156.131937] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  156.131942] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [  156.131949] Call Trace:
> [  156.131953]  <TASK>
> [  156.131957]  ? trace_event_raw_event_dma_fence+0xcc/0x200
> [  156.131973]  ? ring_buffer_unlock_commit+0x23/0x130
> [  156.131982]  dma_fence_init+0x92/0xb0
> [  156.131993]  amdgpu_fence_emit+0x10d/0x2b0 [amdgpu]
> [  156.132302]  amdgpu_ib_schedule+0x2f9/0x580 [amdgpu]
> [  156.132586]  amdgpu_job_run+0xed/0x220 [amdgpu]
>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 3b7e86ea7167..e2aa71904278 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -76,7 +76,7 @@ void amdgpu_fence_slab_fini(void)
>   /*
>    * Cast helper
>    */
> -static const struct dma_fence_ops amdgpu_fence_ops;
> +static struct dma_fence_ops amdgpu_fence_ops;
>   static inline struct amdgpu_fence *to_amdgpu_fence(struct dma_fence *f)
>   {
>   	struct amdgpu_fence *__f = container_of(f, struct amdgpu_fence, base);
> @@ -158,21 +158,22 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f, struct amd
>   	}
>   
>   	seq = ++ring->fence_drv.sync_seq;
> -	if (job != NULL && job->job_run_counter) {
> +	if (job && job->job_run_counter) {
>   		/* reinit seq for resubmitted jobs */
>   		fence->seqno = seq;
> +		set_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &fence->flags);
>   	} else {
> +		amdgpu_fence_ops.init_flags = 0;
> +		if (job)
> +			set_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT,
> +				&amdgpu_fence_ops.init_flags);

That is utterly nonsense. The amdgpu_fence_ops are global and can't be 
modified like that.

Christian.

> +
>   		dma_fence_init(fence, &amdgpu_fence_ops,
>   				&ring->fence_drv.lock,
>   				adev->fence_context + ring->idx,
>   				seq);
>   	}
>   
> -	if (job != NULL) {
> -		/* mark this fence has a parent job */
> -		set_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &fence->flags);
> -	}
> -
>   	amdgpu_ring_emit_fence(ring, ring->fence_drv.gpu_addr,
>   			       seq, flags | AMDGPU_FENCE_FLAG_INT);
>   	pm_runtime_get_noresume(adev_to_drm(adev)->dev);
> @@ -720,7 +721,7 @@ static void amdgpu_fence_release(struct dma_fence *f)
>   	call_rcu(&f->rcu, amdgpu_fence_free);
>   }
>   
> -static const struct dma_fence_ops amdgpu_fence_ops = {
> +static struct dma_fence_ops amdgpu_fence_ops = {
>   	.get_driver_name = amdgpu_fence_get_driver_name,
>   	.get_timeline_name = amdgpu_fence_get_timeline_name,
>   	.enable_signaling = amdgpu_fence_enable_signaling,

