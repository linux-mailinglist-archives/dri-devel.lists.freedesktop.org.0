Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD9F474276
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 13:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3FC10E11B;
	Tue, 14 Dec 2021 12:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB6710E11B;
 Tue, 14 Dec 2021 12:26:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhJhkyZVVpI8/iafri8nL8sQNC6AgvN+vCmmYOvYN5OxPTDgrSKtGudKDnqFUcTB9MyPMN/hXtEg6vSbkdk6C1sgcXE/F0w79mk/G77WEOVIsKvLblwZ0uqGi/FO0qpxL1fMaU83UeBZPQPvTm+dG0MNYYdx7+ZiBHgY37EbOK50RSsMVb0uYG1A/yslPB4hPa8+tLEHWRItFFZXXjTMb76SHmeV6zu/WIzAn5xaFfW/b/9701+JL0W/uBfzYZ2m2S3YwPfafB2i2OjggzILolsnlvVlaYiJb66VWS7GEwtSapsu1QkVONR2T8IadS+boqnC4la9YpE8L5B//bd3fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a53Dg8rwp5BYhnrjwo+0T8xzSZRVjseqV0N9cJ4Zo9U=;
 b=gCtuS1ROdHH/pNEFm9ejHeRncmtnyOznOoEct0nFyApss92wHYGQLs1Hr3mRl+tFZLdQ8mhGUoSQ657x47wVFmwaWS+pwNSjeC+M6pUhUr98If6in94mvB4MWFSK2l5ApSep90J3OcRna1u/v74HNPMK2/ko/Jqc5hFeVKE0fw3fqX2q0l+Hu+e5pZNK4z8YWlS3UJsmip8nIz6uyn0x40+91uytAXz/0Z6CwS5OWwBYGsoP+bt1JweUveu3EBdTOU9bknl3S+ftEmzyJIrB6jgLxJJt4+8+VsW0W2+8SAibnLcR9mJxlI4+D8ZVoWyj8X4H39nTIylU/FAiFzrBhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a53Dg8rwp5BYhnrjwo+0T8xzSZRVjseqV0N9cJ4Zo9U=;
 b=bqwQT6/mCBf/cUGU89gOsbe4vyuLt5qnEXbtNrN8krKmZFITrIyMLV6xL/R1kYJGgOpiPrhAYgTtUlXnsGDApUHPF42wk3b8ZRrisq1N9xfjxrUmjsakk8L8V+zas9xxi0i4JjGKgB7ukApQTpnQjuy3ZfpQHIlBp/7tYvXvg2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1613.namprd12.prod.outlook.com
 (2603:10b6:301:11::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 12:26:32 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4778.018; Tue, 14 Dec
 2021 12:26:32 +0000
Subject: Re: [PATCH v2] drm/amdgpu: introduce new amdgpu_fence object to
 indicate the job embedded fence
To: Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20211214111554.2672812-1-ray.huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <30441c31-8ebe-e7b0-97ba-357bba24255a@amd.com>
Date: Tue, 14 Dec 2021 13:26:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211214111554.2672812-1-ray.huang@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0366.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::6) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f564df4b-d20f-4475-b43d-08d9befcf5ef
X-MS-TrafficTypeDiagnostic: MWHPR12MB1613:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1613FC1B9D9A13CC574C128483759@MWHPR12MB1613.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3eX5Py2yhoTyGIeUIZ8SMtlbluwDWadWdoloCTTZ9wUT5//XHo6VvoszwHnlXX7WD3dBMxH/Iv6NFOkyZlLAeP9V1IEIR35fvdgrmb9VB1PUFBeqFSFTSgAkIZx9OVKHp2vXlLhz3Ld9/oliUV8QISvigiNM57vS3A3r/GONc5bQkJfGs7h4tkMwtvw3JupqXkbV2OOkOizzccNPcYWTlttiP8g78bh+PgrfJJ1WyGXAKekrkRl71sbZ7e005Sm6P3IkpTqPHuCq4N2O22p0hUa8v49ePC08ql0neYeJJXKWSO1v8+RP9cXY3HBprW2l6c83V4FHdXxaBC7oILu2H5b2ZZcda88hZi4nAPAdAGe03hRY5y0fOCjXl5ChDePxtS2tdHUMUMxYkYM8QY7yVjX/sBkzJRJaee2lmlNP95zm0hR7iHZLtg8PAyKf07AHwG2vM5xiIE6xOMhl2pKeoSFtSjpSKiXOXF7grNmxRxoeA6eRIX99lnOPPySV5uWhy5hbASMvpBb/HwjcZqJ0ReEoasDily6Xy5oHKU3bQ0tSO7HOl5/RNF8rnzEzSbYMnpebaN0Hjn8IJ/tZyxfM/eHovFFxeAePd/3bAfS7iyFvlxonK+HKEEhY+cAz1yLEY4szWsObYaCqvOTDy3snsb2H3Pr/024lIKF/eJQ7NGEPp+bJ5PM+d9lrY6BxSvFDmUweyrPRhAjaPKcF0vqr8fpsWPy/LxfY8+7fStIVf/RVDIGnGa/2/VFl9vw8vflQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(6666004)(2906002)(30864003)(186003)(31686004)(5660300002)(86362001)(8936002)(6506007)(8676002)(2616005)(36756003)(66946007)(6486002)(4326008)(66476007)(508600001)(31696002)(54906003)(6512007)(66556008)(110136005)(38100700002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVBCWG82SHJKLzB1YU5HSVdHK3hBQVRieXhTdUtxWVVNWEhhY3l0OHhGcnFD?=
 =?utf-8?B?dTlhWHNMakxvZkVFZnRZV1pZa0ROQXRCaFNqb29hdTVGS3N4NHdSY3Z0VGpQ?=
 =?utf-8?B?ZjIwM0RTdzdGenNaWjlYY0ZGZjdPeFoweWNXOFFPL0xEUURNRXJrUnQrd2RY?=
 =?utf-8?B?ejNCSnQrV1F2K3BndG43azlyYStEMVNPN3JPUnVKM2YxUDJxT1kwL1Fnc3hv?=
 =?utf-8?B?Wm9lMlYrVCtvM1oxNlZYTXk1Z01nMit6UjNkQzFCSURUL2l0amx0d2tadGUz?=
 =?utf-8?B?am9hZVR1elc2SlEwd25LUHN1OWxFL0pNTmcvZXo1STBWLzF0N0ROWlF3OGpK?=
 =?utf-8?B?ZkRxNFJFQjN1aGhHNGN1UWN1bU9BM045RXhVWjNWMG5QTXdNQ09lbE5yRDNC?=
 =?utf-8?B?bmI1cXRsbEFmMG1oOW5QZHNTZURzVitjUThRNXREQjRCSHArWGtVRCtHdFYv?=
 =?utf-8?B?SXpXNGJqZklOdXlGKzErdVB1UkRHd2lkUVB0dG0zWXVrSEFPQzVraTZWUlBk?=
 =?utf-8?B?RlNsSWdURlpwSE1mMjV0V3RiSkl6Q3RqTjI1aDJpa2pBZWNhVGtack1nNkYr?=
 =?utf-8?B?YS9FRzVRTlczYjhFSHRrN21kMC81elRka0JmZ3ExS3NWSzNrUWZMaXNOdDdV?=
 =?utf-8?B?M0NROFVEc2J0QS94U0IxWWYzbkNWMTZKWElWV1psYlV1TVJWTlFvMUViMEVl?=
 =?utf-8?B?VkNoeHNnRE4wNndoU2oxRXpsM1NhSzd6aVdVam9IS2FxQUFPRUFaeDYrRk9X?=
 =?utf-8?B?UW1SRkc4REJDak9pQ3grYXFYd25KdXJ5T1dzNkVKUXRZN2FhTG54Ky9DQUNa?=
 =?utf-8?B?Ri8waFExN245MjJyUm1nWTRtMk5CamxsQ1BxT2VBRlpyK3ZZQnpUR0lFbk42?=
 =?utf-8?B?MFBnbk5CN0RIa01sdUU0NzhQUmFSajgxbTg2c25Ed003a3QwSGdlOVErN1NI?=
 =?utf-8?B?QVo0M2lJcFJCVFpRb0ZLRkdGSVJWdVhhVllPeGpzWWVodWFlYWJvWHdXNUFO?=
 =?utf-8?B?M3A1dXJQOCtuTG85NTVvWEVuNmM1WjVVNERzRUlnaEpHR0Q0NUJMWjdVTlFp?=
 =?utf-8?B?akE3aVlydDNZbkViSm5GQ1g5V3I3bEloL2dkYXNKaUlkRVkrd0M5TnRjQTEv?=
 =?utf-8?B?MGVwSEdyQzl5NnJBMCtZZmRuSjJEb29lbElXWmlwQ0RMQktsRFBUbndHTmZG?=
 =?utf-8?B?a0FWczhQZTRtWVBQY1EwNmlTdkdnNW1vdi8xK3hHQ3BoZDlFbE9QT1dnUDI2?=
 =?utf-8?B?WDBSNzdiTWU5OEhJSHA5anBLQW5ZSDd3N0FhREVQNE1rUVdnei82L214UkYr?=
 =?utf-8?B?T0RJWHFVZTBWNW5nb2F4eS9pUXhrK3djcTVnM202SU9QNVNTVUhua3htZ1Vi?=
 =?utf-8?B?T0lsanBKZkErVllZMCt5UGZYc1Z2L2dRaEZLeEJwcm85RWJLMTB4eUtlSlpy?=
 =?utf-8?B?bEFkeVNFODB5aUNudlN5bWdLWjVrMWV0ZnRTVEJuaVdGSE5RUEYyTkRxelRs?=
 =?utf-8?B?Sk9rSGN0Kzl1cFBZeFkzeFFkVmVoTmRnV0x4T2dhenVFOWFMSDNBVGpGOHVO?=
 =?utf-8?B?L3ZqZjQ3a3p0NVl6eWxjMWNOSk45ZnpRYlBlbzlXeTM1THVtWDA2Q2hQRXB4?=
 =?utf-8?B?S2FrVUJxVkh3K0lQZlpFTXM0Rk14bnR5RnpOVmRIajU3cWJFUlc1aTNmMXZN?=
 =?utf-8?B?LzhFNVJaMXhJRXVYcnp5Q0xsb3p1djFwN2VFanNVMmdmeEd2ZEh2M00rd1dt?=
 =?utf-8?B?TWV2a0lTYlRXbW1pUEprbGwwcWpRbU04S2VYTnArM1JkZVJRT2QvU0N2eE9Q?=
 =?utf-8?B?S2luYTU0T2ZzUXlBVVVwTXhQMW9velRoZmdiZkcvd1FNZ1E1T002Y2NhekVF?=
 =?utf-8?B?WU1tM3c1c0FrbmZKQVp6ODVsbGRveENWajg2bGlxRmdpU2NkVnB1aW5venEv?=
 =?utf-8?B?QlJlTVl1T2NHZmc4ZTBiQ0lGdkNySDVJYjZFQkVSOWVVL0hvK2daRTF6ZUp1?=
 =?utf-8?B?OHBtZ3VBY3J4dWxPcEtRcDZ6K1V4K0g1NFJVSXVJdklPZCtmYkVmaDVNa0pw?=
 =?utf-8?B?SkNQV0hVRTAreS9NbWtETnpJQ2ZKck1oK3RaQ2lFcjdobDdtOGZwRTFvWlYx?=
 =?utf-8?B?R2QvbE1LeVg3azNOcGZsNVZVZ1VGN2Z1cElhTVl4R0N1R3pCUGN1a0lxOElq?=
 =?utf-8?Q?3bq/LZz2d/mxhVgrfmafRUQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f564df4b-d20f-4475-b43d-08d9befcf5ef
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 12:26:31.9757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wq2PGZc96/0YG2GL8hHMkcZY4YRKkxvttQYRwWYGpR1aRExUNspP6XU/DZCYi/en
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1613
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



Am 14.12.21 um 12:15 schrieb Huang Rui:
> The job embedded fence donesn't initialize the flags at
> dma_fence_init(). Then we will go a wrong way in
> amdgpu_fence_get_timeline_name callback and trigger a null pointer panic
> once we enabled the trace event here. So introduce new amdgpu_fence
> object to indicate the job embedded fence.
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
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 117 ++++++++++++++-------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   3 -
>   4 files changed, 80 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 9f017663ac50..fcaf6e9703f9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -444,6 +444,7 @@ struct amdgpu_sa_bo {
>   
>   int amdgpu_fence_slab_init(void);
>   void amdgpu_fence_slab_fini(void);
> +bool is_job_embedded_fence(struct dma_fence *f);

We need a better name for this, especially with amdgpu in it. Something 
like is_amdgpu_job_fence().

But maybe we can avoid that function alltogether, see below.

>   
>   /*
>    * IRQS.
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 5625f7736e37..444a19eb2248 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4483,9 +4483,8 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
>   
>   			ptr = &ring->fence_drv.fences[j];
>   			old = rcu_dereference_protected(*ptr, 1);
> -			if (old && test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &old->flags)) {
> +			if (old && is_job_embedded_fence(old))
>   				RCU_INIT_POINTER(*ptr, NULL);
> -			}

This here is messing with the fence internals and so should probably be 
a function in amdgpu_fence.c.

This way we would have embedded the amdgpu fence in there as well. Apart 
from that looks rather good to me.

Christian.

>   		}
>   		/* after all hw jobs are reset, hw fence is meaningless, so force_completion */
>   		amdgpu_fence_driver_force_completion(ring);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 3b7e86ea7167..3a81249b5660 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -77,16 +77,28 @@ void amdgpu_fence_slab_fini(void)
>    * Cast helper
>    */
>   static const struct dma_fence_ops amdgpu_fence_ops;
> +static const struct dma_fence_ops amdgpu_job_fence_ops;
>   static inline struct amdgpu_fence *to_amdgpu_fence(struct dma_fence *f)
>   {
>   	struct amdgpu_fence *__f = container_of(f, struct amdgpu_fence, base);
>   
> -	if (__f->base.ops == &amdgpu_fence_ops)
> +	if (__f->base.ops == &amdgpu_fence_ops ||
> +	    __f->base.ops == &amdgpu_job_fence_ops)
>   		return __f;
>   
>   	return NULL;
>   }
>   
> +bool is_job_embedded_fence(struct dma_fence *f)
> +{
> +	struct amdgpu_fence *__f = container_of(f, struct amdgpu_fence, base);
> +
> +	if (__f->base.ops == &amdgpu_job_fence_ops)
> +		return true;
> +
> +	return false;
> +}
> +
>   /**
>    * amdgpu_fence_write - write a fence value
>    *
> @@ -158,19 +170,18 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f, struct amd
>   	}
>   
>   	seq = ++ring->fence_drv.sync_seq;
> -	if (job != NULL && job->job_run_counter) {
> +	if (job && job->job_run_counter) {
>   		/* reinit seq for resubmitted jobs */
>   		fence->seqno = seq;
>   	} else {
> -		dma_fence_init(fence, &amdgpu_fence_ops,
> -				&ring->fence_drv.lock,
> -				adev->fence_context + ring->idx,
> -				seq);
> -	}
> -
> -	if (job != NULL) {
> -		/* mark this fence has a parent job */
> -		set_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &fence->flags);
> +		if (job)
> +			dma_fence_init(fence, &amdgpu_job_fence_ops,
> +				       &ring->fence_drv.lock,
> +				       adev->fence_context + ring->idx, seq);
> +		else
> +			dma_fence_init(fence, &amdgpu_fence_ops,
> +				       &ring->fence_drv.lock,
> +				       adev->fence_context + ring->idx, seq);
>   	}
>   
>   	amdgpu_ring_emit_fence(ring, ring->fence_drv.gpu_addr,
> @@ -643,16 +654,14 @@ static const char *amdgpu_fence_get_driver_name(struct dma_fence *fence)
>   
>   static const char *amdgpu_fence_get_timeline_name(struct dma_fence *f)
>   {
> -	struct amdgpu_ring *ring;
> +	return (const char *)to_amdgpu_fence(f)->ring->name;
> +}
>   
> -	if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
> -		struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
> +static const char *amdgpu_job_fence_get_timeline_name(struct dma_fence *f)
> +{
> +	struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
>   
> -		ring = to_amdgpu_ring(job->base.sched);
> -	} else {
> -		ring = to_amdgpu_fence(f)->ring;
> -	}
> -	return (const char *)ring->name;
> +	return (const char *)to_amdgpu_ring(job->base.sched)->name;
>   }
>   
>   /**
> @@ -665,18 +674,25 @@ static const char *amdgpu_fence_get_timeline_name(struct dma_fence *f)
>    */
>   static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
>   {
> -	struct amdgpu_ring *ring;
> +	if (!timer_pending(&to_amdgpu_fence(f)->ring->fence_drv.fallback_timer))
> +		amdgpu_fence_schedule_fallback(to_amdgpu_fence(f)->ring);
>   
> -	if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
> -		struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
> +	return true;
> +}
>   
> -		ring = to_amdgpu_ring(job->base.sched);
> -	} else {
> -		ring = to_amdgpu_fence(f)->ring;
> -	}
> +/**
> + * amdgpu_job_fence_enable_signaling - enable signalling on job fence
> + * @f: fence
> + *
> + * This is the simliar function with amdgpu_fence_enable_signaling above, it
> + * only handles the job embedded fence.
> + */
> +static bool amdgpu_job_fence_enable_signaling(struct dma_fence *f)
> +{
> +	struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
>   
> -	if (!timer_pending(&ring->fence_drv.fallback_timer))
> -		amdgpu_fence_schedule_fallback(ring);
> +	if (!timer_pending(&to_amdgpu_ring(job->base.sched)->fence_drv.fallback_timer))
> +		amdgpu_fence_schedule_fallback(to_amdgpu_ring(job->base.sched));
>   
>   	return true;
>   }
> @@ -692,19 +708,23 @@ static void amdgpu_fence_free(struct rcu_head *rcu)
>   {
>   	struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
>   
> -	if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
> -	/* free job if fence has a parent job */
> -		struct amdgpu_job *job;
> -
> -		job = container_of(f, struct amdgpu_job, hw_fence);
> -		kfree(job);
> -	} else {
>   	/* free fence_slab if it's separated fence*/
> -		struct amdgpu_fence *fence;
> +	kmem_cache_free(amdgpu_fence_slab, to_amdgpu_fence(f));
> +}
>   
> -		fence = to_amdgpu_fence(f);
> -		kmem_cache_free(amdgpu_fence_slab, fence);
> -	}
> +/**
> + * amdgpu_job_fence_free - free up the job with embedded fence
> + *
> + * @rcu: RCU callback head
> + *
> + * Free up the job with embedded fence after the RCU grace period.
> + */
> +static void amdgpu_job_fence_free(struct rcu_head *rcu)
> +{
> +	struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
> +
> +	/* free job if fence has a parent job */
> +	kfree(container_of(f, struct amdgpu_job, hw_fence));
>   }
>   
>   /**
> @@ -720,6 +740,19 @@ static void amdgpu_fence_release(struct dma_fence *f)
>   	call_rcu(&f->rcu, amdgpu_fence_free);
>   }
>   
> +/**
> + * amdgpu_job_fence_release - callback that job embedded fence can be freed
> + *
> + * @f: fence
> + *
> + * This is the simliar function with amdgpu_fence_release above, it
> + * only handles the job embedded fence.
> + */
> +static void amdgpu_job_fence_release(struct dma_fence *f)
> +{
> +	call_rcu(&f->rcu, amdgpu_job_fence_free);
> +}
> +
>   static const struct dma_fence_ops amdgpu_fence_ops = {
>   	.get_driver_name = amdgpu_fence_get_driver_name,
>   	.get_timeline_name = amdgpu_fence_get_timeline_name,
> @@ -727,6 +760,12 @@ static const struct dma_fence_ops amdgpu_fence_ops = {
>   	.release = amdgpu_fence_release,
>   };
>   
> +static const struct dma_fence_ops amdgpu_job_fence_ops = {
> +	.get_driver_name = amdgpu_fence_get_driver_name,
> +	.get_timeline_name = amdgpu_job_fence_get_timeline_name,
> +	.enable_signaling = amdgpu_job_fence_enable_signaling,
> +	.release = amdgpu_job_fence_release,
> +};
>   
>   /*
>    * Fence debugfs
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> index 4d380e79752c..c29554cf6e63 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> @@ -53,9 +53,6 @@ enum amdgpu_ring_priority_level {
>   #define AMDGPU_FENCE_FLAG_INT           (1 << 1)
>   #define AMDGPU_FENCE_FLAG_TC_WB_ONLY    (1 << 2)
>   
> -/* fence flag bit to indicate the face is embedded in job*/
> -#define AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT		(DMA_FENCE_FLAG_USER_BITS + 1)
> -
>   #define to_amdgpu_ring(s) container_of((s), struct amdgpu_ring, sched)
>   
>   #define AMDGPU_IB_POOL_SIZE	(1024 * 1024)

