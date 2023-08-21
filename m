Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E767782BB1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 16:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D3710E275;
	Mon, 21 Aug 2023 14:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB2B10E272;
 Mon, 21 Aug 2023 14:24:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ao9sw0L3eOCK9UMa7rZ2qToNEkpNIpY82C/w3xLGp0X8h2ZwbgJtyiaZ9LbFoTuLas2DU4DbXSXx+7Wtt9inbvZpPXbWCcYBw/CcglR0D0lMZI/bqXTUBP5edF4R8HiZvLaAtrzxGD4DxPt9lce/VEO6jdY0dIG0bjGk0X7qohiRxxOcrGdeAqwMVY/1Kn/cooaRky8hF4gENFmcnt4b67gOsH3XKW3/jmbMCId5SM+JxRtYBZ0rjgvZfltDwpU05DPvy1xTjslTB66U4HuuPSjFcB0dSsaO9ID3UU/HXfNz9IxhJkZimhAwq7g2u0vz7yGuZV8va+GQT8ur+zPbIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtYl5IDdajQKhFjmDXewKUAyS0MK/paX6MDhCf+m8qw=;
 b=ebwqmmsOMPA1UQGLo+xJYRSY1oCo+EReaAb587+uTq+/dFOi9KG7/CHzOw3N57IKILCUmGcwSpM3pUWpo5DtWYZWeOcg1QdnDtGGgn2Fc9pYoIvYna2cXLNT7dFFXRKqzAi6Xv72twCJaLDCSyWj8KvnlfNjAvxNU+sVeDn+AzlUETqlWJ2HTqGj1TIBGLLQTBWEzwnLnQt+bjthBNS5aa+tz9owpjSenMBo2jYibquoFzHh5SE7Aj8vzUe+9m00ljvyf5iMQpohl/tfmRjc75ohPhtibCCPFkgygzNeuTpnJWWRbdr1ikYzjUCxj4jMN36XK08t/djzybsEkDmwfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtYl5IDdajQKhFjmDXewKUAyS0MK/paX6MDhCf+m8qw=;
 b=d63VZG2l9kdNUyxiDwyktj1bYO5U08sQawDeu6p+clGYqZPGIaRIWtVAvhH9cKz+wvHfDjI70rFU+rnFzhSeHAoh8//0Rhgst5+AbELde8B9i/qRVkVm+HnVBuYtsIzmXnz4zyR3XUQmthsy4uoYdesR9OMlPAFIQpGdu3cmmZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 21 Aug
 2023 14:24:50 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 14:24:50 +0000
Message-ID: <a0267db8-101b-e691-02f4-7bd1d13fb40e@amd.com>
Date: Mon, 21 Aug 2023 16:24:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 5/5] drm/amdgpu: Create version number for coredumps
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230817182050.205925-1-andrealmeid@igalia.com>
 <20230817182050.205925-6-andrealmeid@igalia.com>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <20230817182050.205925-6-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::11) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e622c74-2513-4b2d-0750-08dba2526105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0o1QgcZNXjv5sgcNLwbEQgIkuBRQNHfUG2fArFTIfmJY6CkIcVU/HAn1lhRChj3KBIHCu7VImrsKhRui+MxYRITYbqPg1TgmXNn1++0+dS1Ym5sLZ6YzJLzr2AQaIKiM59oKE3GM+cHRSxA3AyL8Cxv/zzuyeLsjk6RrgNErczpB7OZ3AkKfiz3G+nrsWEO36YJwSnz212fmdGc537Tsh4IrRttY0dXpeev4zJKj7GvZoDorZctOmIeiFGhCbt2q8PFSRwsp7XzGZtxbWaWZcruWfLA+AfuZg8ChjwLmvzUdfRrPAbZQFkMOEfw6kR6KQY1hRRiFH0NnXqCTCYc5qlifBKbhBDhUV4RG6UZilc3huMFzNM87Bm2+HT1UmbGDKJ+ot6HGZv6PROuVRiyVB/gk7EFX1aAgFxSIpYv9oBhCxzt2Vy9zvPnq81NhB+Nnt6WN+T990n8JWvFBDgsJokzm+2CdxOVq8UPzM+ziX2x3+AiTaBGkGdkpD3I/a30f6pLoWYsClsvG0euu5cHr1UUox9JnAhMgpUv63H/L5FCkPW0P3M9LFjT1nzf2ieESfQXDAh/nJIjesdnaN0KtkcEiGifq4Xng9gFGzENFojiA+KEDmWE6WrOoacBRSMu6LYneI2QPiXCX7nmdSC/gHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(39860400002)(396003)(346002)(186009)(451199024)(1800799009)(31696002)(2906002)(26005)(86362001)(478600001)(6486002)(2616005)(6506007)(6666004)(36756003)(6512007)(53546011)(44832011)(5660300002)(41300700001)(66556008)(66476007)(316002)(54906003)(66946007)(31686004)(4326008)(8936002)(8676002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVJ1QmVZdkZPVjF1T3hYWnFYZWwvMGYzUW1lSlZQbVNWMFBsbHk5cERjVkdw?=
 =?utf-8?B?RE5iNGZQaDBPazBVYVZMakJzeDNmd0gvZ2tiakMyWTlFMTh4UlBMNTRHWlBY?=
 =?utf-8?B?SzhzT2tobmtGd3JTNnM4b3RoSEhnQnBleERDelVQaEFJNm9BQUoyV05MV0Jr?=
 =?utf-8?B?bXpEbzdFY2Z4VkNvRUJtSmIwRDNzb3V3OGVIRVVRR2k1RWc0Q0R1Y3NXNmlI?=
 =?utf-8?B?cUk1N2IyQmZhQW45dEswa0NNd21KZ3RWeTdtaVY5MDZCSk16Q3BSUjVZOGVp?=
 =?utf-8?B?NXYzTzlOUUY0WURUaGJpWGNNQ2VDL054V0lIZjlGOHdGWTAzMmlnd3hHUlA5?=
 =?utf-8?B?Q1hjWEJqOUFYendYY0JOT0dPWHpQdThRd3hSWmdlc2cvR1R3UzQ4dE9EZWxP?=
 =?utf-8?B?T1R3K2hUeldDd2dldDM4SHdLQzBVMGlsUjBST0ZhQTI5dFM2WWtKb256MWIr?=
 =?utf-8?B?bTBGZ3BSUHhWRWc0VWtoMVVkWXlRMG8yR3lVQnBmelpDaXJNN1hFdWM4NDFW?=
 =?utf-8?B?U2w1cHlNMnk1WkFxaHMrbmQ2K0o3WmdETUxWV2NrQmI0aGpHY3BLRTdCRExL?=
 =?utf-8?B?SWhJSjVhZHE5MEtHelJpRklkV1dKTUxCV3k5aXAyTTV4THp4LzU1Y2NTNXlk?=
 =?utf-8?B?QmVYYlg3RlB3dDlnM3lKbndKSEZiY0Y4Ym9jNUtsQjMrek54RE83QjNuOXNr?=
 =?utf-8?B?OU9xMUNLMXVzcnJhcG9sTkkvaG9jYjlqb1lCUkJHVk1GS2NIZkwzcDRCTGgr?=
 =?utf-8?B?N1RSQmZ3bktST3M3YW5MZ05QM0IzTXN5ZWdKKzN4TGRIZytPenVzSTQ3MUh1?=
 =?utf-8?B?ZENMQjFudmcwMm9pT3ZKeFhFYmhzaFhkclVOZWFVWk5WN3JOZHl5Tms3ZXU0?=
 =?utf-8?B?NWdYSDF6M3Z3ZTJ0YXdvMGF6dG5KQkNMT3R5dStMdG5oZ3MvTFRLYlhDS25S?=
 =?utf-8?B?WTVhZjVrYm1pVTcrS1ExM3Z2QWJQTFV5NTRGN1BXNHNvZ0VwdXh0TmFDU2xW?=
 =?utf-8?B?bm41RUxWeTEvZVJ2NlpoaUxRYzhBblp4c0pzZ3J1OURKSmlSeTc2WUhuLytn?=
 =?utf-8?B?aTFDNU95QVJndzlVWk42R2hiMnhCRWtOam9uMU4zQlQ2dHQ2aUdhYUJIcWFp?=
 =?utf-8?B?a2FNT1E2ekFIRU5jeGUxL3NpM2hHRnVUNkE4RUduKzh1VnBvZGJCZFpmNFlI?=
 =?utf-8?B?cXRXMXQ1dnYvZzJrS2tzeTZIZjNBL3NaVVdtMTNZRDVRVGJTQVN0N3N5NzI1?=
 =?utf-8?B?ZjhsbStWOFdxSUlXcHJHaURpVGx1N0ZwRDNPdGMyVlZROFBvU0JEKzcrR3Bt?=
 =?utf-8?B?eWVYczEvTCtiTnBwUlRIc2FVN0xmQnpMVnpocGluamkzMmhVK0xpTE9tRWZo?=
 =?utf-8?B?WGNUU1JYdGVZY3lDa2ttUkVDUXo5MEdpNEtqSXcrR3g4RDVSWkpXeVZTMWc4?=
 =?utf-8?B?RzJsb3p2ZGZscEFoVzZIMEtuckRGNGRBKzQ5QzU0dXAvenZBK2Z6aklUNHRq?=
 =?utf-8?B?bGNOaElwL0VML0JIWVZTVUZ5SjlLZ1ZxZURBY1lMNEV5RnQvcEpiY29HNk82?=
 =?utf-8?B?ZVVaNFUxZFdKcFVBRE82NE1KWk02ODJuL1o3Y3c2aWhqKzdqa00wZkRoMWRT?=
 =?utf-8?B?cEp3ZVhpUDBJdXpMSHlhSjQwV2FMMUNmblRJUmNub2swb1dsYTVBSjNCWHJw?=
 =?utf-8?B?UHVHZ0tUTU51Y0I1WDdocWdSaVkrYTY4TGo1ckZwSFB6RS9RQUtKUFBCeDFT?=
 =?utf-8?B?MjZhUS9rSUo1VzBMRzhwU1pRd0phSW5wVW95L0ZHeEdjOXJRSUMyREFGWGFo?=
 =?utf-8?B?b0s1azNoMFJla3Y2cXFkZ2xBZFlqL29nYzB4cHpuOXErM3VVWHBiMzViQ1F6?=
 =?utf-8?B?Vk5HSUR1OURhTTVQTFhWdW9zeTVKUW1hQlBIOEczQU5QMlBMaGNyU01yNXk1?=
 =?utf-8?B?NmJSNWF0ZFV2KysybUt3S3BWK1Y0UldFME9xWXQ1S092Wjk1L2N2YVBSeTE0?=
 =?utf-8?B?WFB5TE5vSjdiNi9RQ0NGa3RycDNYcEVwVExrRlhBemVQK09VSytOV1JPVVZL?=
 =?utf-8?B?cnhEcnRPK0dOUFBRbHpIcy9DRDIvRWdqZ1pYMkM2Yi8xU2J1YUxybytxcjJ1?=
 =?utf-8?Q?EJmcZDJgyFNInUkqDvedr4Py3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e622c74-2513-4b2d-0750-08dba2526105
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 14:24:50.4821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPNgoKZmImitH24GDBUsIfM0/6sl05H2ZMMYWPbgBU9LX8RUEt94bULerMkUCjYDiGgPBoiNJqv1+JtjU2Gr8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/08/2023 20:20, André Almeida wrote:
> Even if there's nothing currently parsing amdgpu's coredump files, if
> we eventually have such tools they will be glad to find a version field
> to properly read the file.
>
> Create a version number to be displayed on top of coredump file, to be
> incremented when the file format or content get changed.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v5: new patch
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h | 3 +++
>   2 files changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> index 579b70a3cdab..e92c81ff27be 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -192,6 +192,7 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>   	p = drm_coredump_printer(&iter);
>   
>   	drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
> +	drm_printf(&p, "version: " AMDGPU_COREDUMP_VERSION "\n");
>   	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
>   	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
>   	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec, coredump->reset_time.tv_nsec);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> index 01e8183ade4b..ec3a409ec509 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> @@ -88,6 +88,9 @@ struct amdgpu_reset_domain {
>   };
>   
>   #ifdef CONFIG_DEV_COREDUMP
> +
> +#define AMDGPU_COREDUMP_VERSION "1"
> +

Reviewed-by: Shashank Sharma <shashank.sharma@amd.com>

- Shashank

>   struct amdgpu_coredump_info {
>   	struct amdgpu_device		*adev;
>   	struct amdgpu_task_info         reset_task_info;
