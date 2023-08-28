Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC1078AA48
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 12:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA2C10E074;
	Mon, 28 Aug 2023 10:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0879510E074;
 Mon, 28 Aug 2023 10:21:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0A14wj41fLfZH9yI0CrmYO3IGk3iA77WxqoPLtvBB+dBYXO09GqkiQJOFmbGgNhdRoyyIXmDE2e9wPRHfGrFOzUayHUhuAZ9uuEUHcF5yYjQ+v5pcT1nm2XYt57J4m7ddP1Ex+5otyeoo/TxFq+fZOhD8+u/3GIlOm2ZNaDlhvWJv+P4sU9i22evXng56XuLAZNI61fAqj6zBo0DSh5ye+8/pvD2nvcTdTGK5HeA8CD/ZiDqKX3VAscstqT3xk5usZZKmjw1Vpkf9pIoFNW4cRWn3Bfhm1rhQklZgw1dXGSxqrbq/PNPTYlm0GiVFC3SbwUbnjGD70kZLF+91PrIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVGdi4Uf91g+pLirn0cEIGiDETD61OgVgS5+hO4lkhs=;
 b=Ci4xarekzn4o1fV3JLlMnMD1/9pWWRFf4wWPNyGXOlhMeY97KIUaBWwEpi41xmtIhVRbNM0/PBs/FHfKs7PkICO3qn1VYSNeS1oU8+IMkAPTUPqNajGH/CP4DSC0xBkdY1sDdSE4u4G65ueU6z2N34kQ9+frDRDebPJ6wkyXID5V/HhuCXZYnzGr/qGT89Pm//aqhOc+92ExN0v9ovBM0Co1gXoEF+kf20MfwilYnz/DkWsxFpXIrlLhoMATQghLma7D2bgjFeiRGbNHwgU4pYXO0hIZEiWKEhPcH/KSkksOc9/O/WO3i7tpKbSW5LFi4jXMJMb89NEFIjeLDCG1Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVGdi4Uf91g+pLirn0cEIGiDETD61OgVgS5+hO4lkhs=;
 b=ajQokBdhqr1TyQHcDpT5hdZ6iOOkFNcPE8eNdY8/tKG9EXAkF+OaY6AkxkifaO2pgTTkuaxfpGM4I63mJXYmCnxd9rGy1bd8P80kCi9FKVE9QcLjlA2kLjt7HcqCjUPiFiiSQfCNLXhoitKaHFpp9hvWdKsPko934yrhloEdY+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6552.namprd12.prod.outlook.com (2603:10b6:930:40::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 10:21:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.035; Mon, 28 Aug 2023
 10:21:31 +0000
Message-ID: <92449ad6-25b0-b28e-97b3-b947d5ff963c@amd.com>
Date: Mon, 28 Aug 2023 12:21:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v15 11/23] dma-resv: Add kref_put_dma_resv()
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
 <20230827175449.1766701-12-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230827175449.1766701-12-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY5PR12MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c22e8dc-8df3-4c10-f775-08dba7b08c1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gaA60E6Vh/6elLhYn9mw/ZW+Sjf4uYrRykIAzTc5pKndqKHCk8z4Yuf9zhcAfbH3A0Xw6mKEBidm+Lj4X+DQgI47z2+41X2qzDao3rSXJZsWnmLAYM7hRwuC7Kk3EXuuvdcH91/tb4AFHKx0m2dXHMoXImlgHwmXOLkqAfX0P65N5PcCbMGeiiJ0kHjIXZLAZ5vsPM3y6h1ZcRLp/cDtX7/8DcVmP9xYNU63q764S7ziFVLLSKq7RUvcyTRkxhkrNPSL5D+jXDgscWIiWJtNa285QDMgW7Afai3oF2PJ6I1LY1CIcQaumzS6QNn8L89nLJcsBp2mFL6rNotgCD8JM605SOU271taISpRWN1ZtlGAuid3dwqOKjax4DXRPOGXDFapoMbPO3T5nuAd6CbqvhW0E5Cwl0846ZTGK4DLSal3y7Tp/fOWuS3IrUW3ROpe1S5sDw0ZQdU6RpxC4z+Ako4wkzFeRijU7rtqR5yvTt9NFxUalxXBiFTXAWUmbZ8Cn5TUbf6NQ73ik14bdc0jxk9X+jBHspix2L9C+VnUQbWtSSEIqFyMFP+EzICt7wqtpQ7PdwPyfO3Fm/4bSZy/pyyPKFVciTghedaJdFkWz5+YHmEw3zt2pHrx4O8nwYXHO3QOKfAnu7nsMq5SpLplezdwrQSrr9brm/qXhNfLXQs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199024)(186009)(1800799009)(6512007)(6666004)(6506007)(6486002)(83380400001)(478600001)(2616005)(2906002)(7416002)(316002)(66476007)(41300700001)(66946007)(110136005)(66556008)(5660300002)(8676002)(4326008)(8936002)(36756003)(38100700002)(86362001)(31696002)(921005)(26005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlFpdStPZHZHMDl3M0tmaWpWL2lZSXFjUEVSYldLMkIzSU1CbUVyODNyazJu?=
 =?utf-8?B?bXk4SVpRa3JENjJBUlpDYngvSnhXZEZEaTRYampVRFZUYWpCTU1rNXhoSktp?=
 =?utf-8?B?SUQxR0VXWVhjeS95bkNMK2xOUXhxaXRqaWI3UkRuNGF3Y0hqODAxeXVPbGRZ?=
 =?utf-8?B?WEpFMUEreVZtcHpNM1hHL2JNdFdhbTI4YVVZbndjYjVWN2VETC94SDhwaDVw?=
 =?utf-8?B?RFBDL1ZCNlBzS3B1NWZyTC8wZUpzY0pjSnN1ekJnNE9tQWNCMFI4RFhkSnpQ?=
 =?utf-8?B?SHhOMXUzOGRyeEtjUWFlYVNMckdzT2xBdjZEOFJiMHhuR2xJcWNxemVPU1lD?=
 =?utf-8?B?djVyUkhQOXl5QVhHR01WdUY2ck1mL1dJOUhTVTdZdWgyM01QN2FuUjRaaStX?=
 =?utf-8?B?YlJxVTRWQmJueFNmV2VhRW9Ca3FaQ3I4cGdOakhQQmcvdXcwemY2VnJjQ2l6?=
 =?utf-8?B?YThCd0xBR2FTRUsvekZJTVVmWGhjTWprY1o4VE9sOGgrTWZLK1ZsZndvazY3?=
 =?utf-8?B?R3llWVY5R2RBYzJvSjVYZXpVTXNITU94ZWJLbnhkVStZVGo1OThxMk1HejBv?=
 =?utf-8?B?US8rdkxQbkh6RVdMQTZXUkdyTzN0RDBhaFdrcEhkZWU3NTdGcmlMTHg0Rzlx?=
 =?utf-8?B?c1Q4bVpadXB0Unl4VzNsK1BJbHo5S3B5TTg0enRLM2JZZjZSMlFIcW0ySFds?=
 =?utf-8?B?TUY0WEZLN0JKTjJzMXVlNFkzRU1qaGE0b0lVM1NWZkhDaVQyRVJZTUJGYWZq?=
 =?utf-8?B?R2VidzdvdTVVak5zVzBuWjNuS1l5THByZnBVUGtMOFliOTNWM2JURWEzNy9y?=
 =?utf-8?B?SDFoV2VGNGFCd0JUV1drd2JoMTZlTEEyR1BHbDhJV3lvK3F2Zy9wcmdOOThS?=
 =?utf-8?B?TDBsYVhjOVFMWGlHenltQWIyZVdlOVVDMVh2dGlhQXZGdGVJTTU5L2MvVHhB?=
 =?utf-8?B?bkQ0VlJWMnZ4cy91VVhPSkgrcWZwcjFXWUwxSEQvdUZjV0lEdDcwNStPWjFw?=
 =?utf-8?B?cGd3cUFKRnFYS0QrNUYxSmdnQ0JYNWZSMkU2c3loWWh1bnlpdXRkYks2T1lX?=
 =?utf-8?B?WjZaU1FmNm5CbzJoaFExL24vQUNUZkNNU210MzRVWjdaUmJKSG5vMnVRRXRo?=
 =?utf-8?B?QkZWWGpNMW02RmpJc2JmZDNlWFJOb1VoNm1wbFIzS3RpSDZRa1lXdGRvTW1i?=
 =?utf-8?B?MHF1MjlOYmNwTFN5a09VNUpaT1B2bElnbm9xYWJJeXZpQzJvb2JZVm1vaUNU?=
 =?utf-8?B?SnRnV2UvSm03TEJsb3dGbTlsVmd2ZVJWK0ZxdXAzdCtHbWE0aDVlRXlVbXZN?=
 =?utf-8?B?N0FicXMzdEE1cGw5LzR1RHdsd0pZaFNwYkdkU1ZiTlVSZVVEREFhcmNhZmtN?=
 =?utf-8?B?QmRQbzViL1YvcFhKcWIxb0EzTUxnanI0VFhCNU04aGlOYm82MHBPQ3F0RXRt?=
 =?utf-8?B?dnZpQWdKNG54VEtuSjE0dXBWcGxDdVJBT2VSRVNoVS84TmFuWXRidnkzM3k1?=
 =?utf-8?B?cnFCTVFBS2s2NHh3eXNJeVRQMUdwcmJTQnA4Q2tlNExpbHVjZWtYVWQ1dHRH?=
 =?utf-8?B?MWFnUFRIVXU2bFY2TXFVODYxQ1NuQlJnRXUxaFpjNDY1SVJwNHpTMWFQTFpX?=
 =?utf-8?B?YXdRR1Q3NWJMMUpIcjBiOXJYNi9rSlVkNDlRbUQ1RjNwZWt4TEZYaC9aYjZK?=
 =?utf-8?B?TTJFSEdxSHZobHhiSGZJL0FWcFpEUXllamNjcy9POGs3azFydk5qbWFsK0lI?=
 =?utf-8?B?K1FSdVVhU2F2eHpNNm5lVXJpSkN6R2dZeER0emMzV25jb3YzcFIrWWIxRjBU?=
 =?utf-8?B?TWV0NENrOG5qMlo5UlcxVDdTWk9lODZOdC9rdG1FQ0p4MjBaWVpoQmdnOFB0?=
 =?utf-8?B?eEFBUjZScTJnOEtvK1Jta3kvSjhiQ3lsRmZDNE90Vk9WYUxYd0lSbStERjZt?=
 =?utf-8?B?MkIrWGVObXY0aHROVFhrNXEzTFV1dk5uMTVLQ2dIZ0orZVA0dUJzb01KWnZT?=
 =?utf-8?B?bm5EVFduYlpaY2ZEc2FZTThwUXA5bmMvdVFVWXRHZDJYNlB4L3hreHZZWVZT?=
 =?utf-8?B?dEFxTmZpOWRsc3NOekdzc1BZS2hKbS9HZkVkNGRwWXBoZUV3RGROV25pQ0Jt?=
 =?utf-8?Q?Pt6znbPa7xCG4+dnaKb3SoCXz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c22e8dc-8df3-4c10-f775-08dba7b08c1e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 10:21:31.2551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8yN8Dhb578y9pPtgCvgAofCkn8W8hfxo0Bz/PaKOqoKLpF7khzB0j/12JLOcnABg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6552
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.08.23 um 19:54 schrieb Dmitry Osipenko:
> Add simple kref_put_dma_resv() helper that wraps around kref_put_ww_mutex()
> for drivers that needs to lock dma-resv on kref_put().
>
> It's not possible to easily add this helper to kref.h because of the
> headers inclusion dependency, hence add it to dma-resv.h.

I was never really a big fan of kref_put_mutex() in the first place.

The main advantage comes from the included memory barrier, but this 
actually doesn't work like most people think it works and is usually 
pretty dangerous.

And IIRC this was done because of the some special behavior mutexes have 
with memory barriers and that isn't necessary with ww-mutex.

Christian.

>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>   include/linux/dma-resv.h | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 8d0e34dad446..c5cf302e4194 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -41,6 +41,7 @@
>   
>   #include <linux/ww_mutex.h>
>   #include <linux/dma-fence.h>
> +#include <linux/kref.h>
>   #include <linux/slab.h>
>   #include <linux/seqlock.h>
>   #include <linux/rcupdate.h>
> @@ -464,6 +465,14 @@ static inline void dma_resv_unlock(struct dma_resv *obj)
>   	ww_mutex_unlock(&obj->lock);
>   }
>   
> +static inline int kref_put_dma_resv(struct kref *kref,
> +				    void (*release)(struct kref *kref),
> +				    struct dma_resv *resv,
> +				    struct ww_acquire_ctx *ctx)
> +{
> +	return kref_put_ww_mutex(kref, release, &resv->lock, ctx);
> +}
> +
>   void dma_resv_init(struct dma_resv *obj);
>   void dma_resv_fini(struct dma_resv *obj);
>   int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences);

