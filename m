Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9278B5FE930
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 09:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB42310EA90;
	Fri, 14 Oct 2022 07:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C45510EA8F;
 Fri, 14 Oct 2022 07:03:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+i6jm7+H5+FHQam4eqFqtc5E3EgtyvJvQiZpgBtr90z4wTZ0EEfCSl4YB6UHsspZY2wXlah3l8YQHyXUfFWovVTpE03o3GT2cVUlF9lwITRzhmLmgvJFqC5+MQmUKlU94NrXPA03GCcKOFnHr3uvmhO0AQFIF+xbtdc8iVjSLnVywWRTYL5S3hPWcdwftq5NwMa8PEFhFVfFXIrum2RB3OYlrUWeAr5gRWosziKsgAzzr7XP4XD/jxknaB8AQKxFY2I9yLy7qTLH7zcrlz6JTVEoF1w294/jxq40DpvHDn5nHJmgnHYvmhQ3LZt4QYXas9/eVmaa4r1Tx7sn//T6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xw4/FMVSDBV0eAhVw7GA1Kj/0wrxO3sTs6tlBbQ0nM0=;
 b=QCaUVBfIuj4Pp//Bry0poMU1B7pMGmko4K1v3g+MzS4TLqkh/TtmVIyeSWse3OASxRBcRcduo9xo6Ge+PzB3PqScEwUkt1IdVcWtynUkWHI/N6RojomrmVu51frQ+dRkmZJ+7knVLKsPMFNx5vahIZvTqVMwtvgED/o8sf7Ksg6DqAz0agbGB+BWHSakaokdUcJh90xZPLqcVKgKQY3ywgqip1DllUxoyBRR+1FQ9/o07oOZWo3C4/7UyjjwmxE5UrsDPRYTyOw5BESt78OU70+Z6BvFgqB9UY0KgjgEKRzco2LpfxuCrLmQ+HR+JqMEY1Zcqndn0ekg4KxIPpllPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xw4/FMVSDBV0eAhVw7GA1Kj/0wrxO3sTs6tlBbQ0nM0=;
 b=JoHifG1J1oK13WcnWhYUtPrhD+0D3yPl3wkb0Ih96Lo/xm4///S1gkbVtnM1e5/9pDWadpC0soBbOmV1YTNbhi90kl3ex600zSPF/2cXEu/qm+w6WcVe9n5775EQnjElzSsfN0XhIEfabbny6xaAscN5rdsR1/Ho+sXYOYp4Vko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6297.namprd12.prod.outlook.com (2603:10b6:930:22::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 07:03:27 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5723.022; Fri, 14 Oct 2022
 07:03:28 +0000
Message-ID: <fb0b7389-7121-04f8-176d-1ababe0ad8f2@amd.com>
Date: Fri, 14 Oct 2022 09:03:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/radeon: Replace kmap() with kmap_local_page()
Content-Language: en-US
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Christian Brauner <brauner@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Kees Cook <keescook@chromium.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-hwmon@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20221013210714.16320-1-fmdefrancesco@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221013210714.16320-1-fmdefrancesco@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY5PR12MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a4f244d-552c-476a-55a3-08daadb231d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bIMjYxzIGeZ31EXyLxaBvnbIdeHliJbZKp7V26Z5TiWURHlbS80q0AEI9djTmPAph1oPVGmb39+w3krgPwoLqDCq6VfnMUXwLinYWV0Z408tZGAjCMM3KAhnlf63Td1M3mLmpxe5rfztBpwhUsi994PJY7SsyTSvDKrBnS0kmCLbF0N/sbRFyF3AMAJ/KuQjcLQ9lLYM9WRgvlEkiZja5v/I99BEOFeS82mWR/qC7N59NK7XiQcZ8BkyQvGP/UrVyIFywSmZXstPboX0te2PNE/xcAgHUwB8gtAdeJCo3YS/IpdYogvjRfB/LKOXvu7lLHxcOZa+DZc22nncATT9I2tHg6Twqq1zhtOlI6hRe3l/feLnfbUAQET0GAHpmLvK4e0gjsueW8MRiSxTkCS+bJ4OBZ6UJpg7mSmkthu73FOaXV3XbLhFHNdrCOMjhSPKiaB4UpLJh2iPTPcNOqNqViXGg688mU8b1G45lzAGi3/h1qBqsoLNe4uxQAiL0cpZDThyzIQBqfrxD/5Iepu6UDQXF+tRpmyx8YgQCZh03m8/JpAAROXv3QHQjooLpmFp7VZaMUlHr0mui3FJAtaizDjJz4PiBg39MEJUMVMHrRBF9hxEdDx6ZeXljU6ZVkkOAQJjVYtlyUNGudD8IlVo2q3O9tJUUpeLtLLZNWB+X6wk3ndvoUQx7CUsFqhXvcfcj740bOTj+vfA9jE3KJsfNVFPG5Uj9b55SooSPFLrqiVNgdFsk4UNhcEjPCrpeW23R6FWaPRQOaIb4TJESkHtOeJGSrF8q7x67XtPc2xUahNWWJ0I/xvtjlmN5czATi/k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199015)(31686004)(83380400001)(2616005)(66574015)(186003)(2906002)(86362001)(31696002)(8676002)(4326008)(36756003)(41300700001)(6506007)(921005)(5660300002)(316002)(38100700002)(66556008)(66476007)(8936002)(54906003)(6512007)(7416002)(66946007)(6666004)(478600001)(6486002)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUM1UUQxZElBM1lEZk9PeGIrY2Y0akQ4N0xoOEJjODdXYkU0aUV6Y0hJUFZE?=
 =?utf-8?B?aEdiN1UyZkovZU5jVEh6ZW9QbGRpaXVoL3ovOWh6QUlWcGxQUzBGYnNYUWdI?=
 =?utf-8?B?aDFJZGJWUkYyU1RlcXI3UjJRUVZiNEliSWZKTXNOQUhYeXc4VGYwNjQzWkFG?=
 =?utf-8?B?NlBmYmNsY0NYYlRPMlhxbW5JWXAxT0V0cVNGOVUzSndwUTN6bldjOWN2OC91?=
 =?utf-8?B?amlXeVhFR0c4STAwUHluVEJtckV1a2VyZm1WNXBUMnZ4YXkzZUMxOEV4SDMv?=
 =?utf-8?B?UVZoMTNvQXNyT0R0RUJQRHFMeHY5YkZqenk1U2FudWE5Y0xpbFArQ1QxemFK?=
 =?utf-8?B?TXI1Zk1HSXJDK2l4RWVLU1BvNzhrc2NSdXF2VzQxQU1XRCt3WS85d01zbTBN?=
 =?utf-8?B?ZUpIcnZ1cDJtYy9HcUZtaTRIbmNvbU4xSkFaOTFkMW5LeGVKdjhkd3BkUXkx?=
 =?utf-8?B?TWVKWm9pc0M0RXZmbjE1TEpSZWVpanF4OGZReUlPWk9kS1VpWmcrVytlQ2N4?=
 =?utf-8?B?ZTZwTTdMK09LcFZlV1MvczhZM1BMYmJNZGJYYTZlcUR6WERPZXorT3I5TlhO?=
 =?utf-8?B?dU1WN3pjcUpVSU10OTRnZFpzNmtOYjZSRVBkUTVUallmdXFmbmx6TGVvbW1L?=
 =?utf-8?B?TzdqbTJqN2VWRGJrdVdGYVNsWGtEWXZpOGQvOHJNaFBtdU5ObCtaYmozQWZT?=
 =?utf-8?B?TytLZ1VFOFcvYVg5RDc1S1MzSndDeWdZUlI4YUZyTTl2dlVDZHIzMks2T0FK?=
 =?utf-8?B?K2RDcmdCSmJDQ1Zqdzl5UGlmbmVFaERvM2llWHozM0VWdzcyZGd6bHpuM1pz?=
 =?utf-8?B?UTNma1hIM0NDTFEybDR5YnJQQ1dXVFZLcXlwOUV3QkZiYXZVUUNsYVh1Ukhi?=
 =?utf-8?B?TmdYZXd3UVh0TjdSRkZ4alFadzF2RGhDYUtqS1FGREpyR2Q4dTBSNklGN3Ja?=
 =?utf-8?B?dVZJTlYxazJCWGVoMHUzNFBtYTBpQk5IQi9LSElZMHp4YWdaWGx5cXFMbmV2?=
 =?utf-8?B?VzFOWTNkZENEZmZhRFM1aU9xbENEMU5kc1hHZHpDY3ZHMkd4T3p6M2hhK0Ju?=
 =?utf-8?B?anFIR2dMUjMzdlduL1M2MTI2MnFrM0FwTG5kbDhaV0VYejVHRnFhMXd3NHdK?=
 =?utf-8?B?L3dzYVErYkhKQ0ZVSC9NWjAvcnZSMngxN0t0ZGVaUExYbTFoNHhiWVZMVmVU?=
 =?utf-8?B?R29Tcm85L1M2T2U2YW1zS2VQU3ZFbHVSU1FoYzJsdVF6ekFlWEpJUXZXeStV?=
 =?utf-8?B?MDgzeEdRcytEd2tkMzRra0xDM2ZKdzMzZFBFWVJZQWpZUDdVZGlFYjE3R29L?=
 =?utf-8?B?QTN1cXJVOTBuR0RTNytNSlRMcUlJaE9DUWNuTXJITkFDdnNEcGxEbW1oOS9n?=
 =?utf-8?B?NmhyZ3o2aFU1YmFWd2E0dnpxZjBSQWl3bjk3Q3RQV3hnRWRwRVRxTlU5QVRL?=
 =?utf-8?B?SGl2U0REOGpEZDFUZk5kcFkvVUdWVHN3eG1PYi9KQmxjSDVTeUw1NFJTbHh0?=
 =?utf-8?B?T1JHbEgyRjlEZU5MVTl4WTVodVE2TnBsQzlXTmNwL0RkclptRUxDek9TNGwr?=
 =?utf-8?B?cm51UU5JaDZwQW5xM2NqcVlWNEdKY3pCQy9WRHZETEl6NkdvdDJFSmNpODdZ?=
 =?utf-8?B?RW52bnFzakRKYXNySk9BSnZ6NXJkR2JMTlNhQ3VhQXVpYWQrSnVJVG1VZ2pt?=
 =?utf-8?B?U1VOTFc1bzBzTmFENUxJRVF4TmU3K0xDNWRndncvTWgwdkFoN1FXVGd1SGxu?=
 =?utf-8?B?aGRpM2hka1BtalNGYkxoYVNVaGwwdmR4Z2xnUjh5Zk9zRm5NNU12SC9GQXc3?=
 =?utf-8?B?ejUzYkljdVlZZXo5ZTlydGwzZ2pjUi9vajlEVVlyd3I3SXZBMGtWTDEzRmZL?=
 =?utf-8?B?NXpScVlGK2JVVStuTSsza3I0aE1Ua1Ewd21kU3YvZzduUXRZdXJ0R2lodWxC?=
 =?utf-8?B?ais5MTVXQTMwOW1wd3hwZHpGK3I5V1ppV0hldHVobTBQZWRML3dJc3oxTXRQ?=
 =?utf-8?B?RHU0dUc2NFR1SHNoQTU2eDhmZVlicDFhQXU1UUpUTkFvdDMxcmNKanlRbVE4?=
 =?utf-8?B?ZmVyV29EZHE4M2VBNDNqOUIvbnJIZXMwSkUxYkxPNEpXL3NGdDBROEZMbXNz?=
 =?utf-8?B?OW5hUldxVlhyLy9LbW9zVVhOamVzU0J3OGE1TExYL2x5eW1EUWlDbVlCMDlq?=
 =?utf-8?Q?Dql86tNOAKt7ekIgXNUsFTN2k+Nfsh5QTorx46rk4RKx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4f244d-552c-476a-55a3-08daadb231d2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 07:03:28.0342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxPqStKG7Mzf4ZZ4anyw/9htG68UlKaFqYOuZTslpi22IroQ6GrFay3yTy21OnOr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6297
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
Cc: "Venkataramanan, Anirudh" <anirudh.venkataramanan@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.10.22 um 23:07 schrieb Fabio M. De Francesco:
> The use of kmap() is being deprecated in favor of kmap_local_page().
>
> There are two main problems with kmap(): (1) It comes with an overhead as
> the mapping space is restricted and protected by a global lock for
> synchronization and (2) it also requires global TLB invalidation when the
> kmap’s pool wraps and it might block when the mapping space is fully
> utilized until a slot becomes available.
>
> With kmap_local_page() the mappings are per thread, CPU local, can take
> page faults, and can be called from any context (including interrupts).
> It is faster than kmap() in kernels with HIGHMEM enabled. Furthermore,
> the tasks can be preempted and, when they are scheduled to run again, the
> kernel virtual addresses are restored and still valid.
>
> Therefore, replace kmap() with kmap_local_page() in radeon_ttm_gtt_read().
>
> Cc: "Venkataramanan, Anirudh" <anirudh.venkataramanan@intel.com>
> Suggested-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index d33fec488713..bdb4c0e0736b 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -869,11 +869,11 @@ static ssize_t radeon_ttm_gtt_read(struct file *f, char __user *buf,
>   
>   		page = rdev->gart.pages[p];
>   		if (page) {
> -			ptr = kmap(page);
> +			ptr = kmap_local_page(page);
>   			ptr += off;
>   
>   			r = copy_to_user(buf, ptr, cur_size);
> -			kunmap(rdev->gart.pages[p]);
> +			kunmap_local(ptr);
>   		} else
>   			r = clear_user(buf, cur_size);
>   

