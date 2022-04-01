Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A4D4EF012
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7023010EC81;
	Fri,  1 Apr 2022 14:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFD010E3C6;
 Fri,  1 Apr 2022 14:31:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avjyIeLmsiMdKGMDKQtfvp6hqexunwltasSHTSH2E2HwNyMeEwARNyQ8zx4TcMufIs9csxthnmjBuDQIPmSKLDuQWMGcRBaR4+mRnN/ORA9NBQcA46y6tro39pFXJ5VbIhM4ZIrvlzVTobBLSxbGf80Q+zM2bKHDq8bQXDInJYXiJprYvtYoCviqozuSJccgBBhgHBypTRbdMdXaXrbCmYUEvK/VVBQ43cStlU/kRxwcnj3czsipNlEcApEeKu5L/wiMjwHfa/zTvE6k2fWvmtR+FlGjok7ftrppr2VIEhmh/L7fTQ8+A2h4+LUlA9cpEVBV1U2sCffCgJ4Hgd2XiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JcDQ7HpMCPjlRG+lZFr6UHt1JWZAwIqrQvQwFFiBkis=;
 b=jrrCXj5oNnNucC+9LdA+8tQQof53Izrl/hh5bblAgi9rXt4tUJ4Dr1V6PsvpWxKKiqAuy4kckhOzNdy3ula7n1lof3YAgiTRG7nqbNT8Xg5IMNSdcWrSv4gzy1WJFuz3/Pyhy+Im0595ZjPLwsmkOgSeApYIPSDAuyp3A1gqYQt5LMBI4kSlE7X/Fot1S2NgtSbv12Is0zJjfqT2wQxbmxTft0biXSBUQZ10CJatRNAOcBwdAC60O0SpJmqCaNX03dX3X+tIO1XYR52fOWp2pCdo1Y4ckhUzneAzXam1ILQ3U/svS5gRbFUIXs5SezzwT0JLcH9UE7lH748di3peRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcDQ7HpMCPjlRG+lZFr6UHt1JWZAwIqrQvQwFFiBkis=;
 b=RZONNJz7ni/A3JijhFT0KQNtqCtP8degvV9z0Ko+i4j2mBp5LSDXDE5pYrCWG3WUkGBqh8UQRu6tjf6I0/eu/yFf8m/n9a9/ffit+bxdu4pAPtI3JuynW7u8sDtpA8WhOS3cizGf832Bl20R9LDldnXBcZpbG7nb1nf9CWiDlBM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MWHPR1201MB0175.namprd12.prod.outlook.com (2603:10b6:301:50::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Fri, 1 Apr
 2022 14:31:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5123.028; Fri, 1 Apr 2022
 14:31:27 +0000
Message-ID: <7517726e-c828-ace8-9968-e542e23d97f1@amd.com>
Date: Fri, 1 Apr 2022 16:31:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v7 7/9] drm/ttm: Add a parameter to add extra pages into
 ttm_tt
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, rodrigo.vivi@intel.com,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20220401123751.27771-1-ramalingam.c@intel.com>
 <20220401123751.27771-8-ramalingam.c@intel.com>
 <20220401142853.GF12046@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220401142853.GF12046@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0072.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::49) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39fd49a2-f7eb-4b6a-d277-08da13ec4dff
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0175:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0175CAFCB5257214609842E483E09@MWHPR1201MB0175.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7352LFPI3aprXQeeJL5g6QrwFU3x7+zrhs18w/IhokgN3ZUsFsNd+kZbd+iCBM3mMQIpVtTFchs9ycWHSCw2FCF/irULFz/QgN5V0IevhZqMNceQ+y60funikv2JadI8En1cILXlZQEYMPwMjf16jhQguTkoAdxv3lIj6w5VxU6fkE/wh74Oiic/V44kZJldruQHZ/e9Sc0JouQzqpMpdPwTlTio4xq9HtbuL0NtOlh0qAzlVj4fxlE5oQx7p7oSQlv4CwBHs3HOTEjx3aRccxCiu5FnyTrXJprt/DqKiv4J9SfBB3qN+zZMx5QMd3EeA2D77dt+MWVje7hTR9NsovOHWD1lsf1MJv2DUIjEzNXf2bn9/xcntix5QLs3+424y6rL4zVZRHXe9xTqlOl+58c1OPE19v6MX4fEH6ybJC1jhLcoaGBewaJhKKwVBWwG9AMu2jNjd/jcH/OvPezDZpQplS4R3Pl95ivjkpT54PVewxwNLXqtNOKWDpAqavq2L86wBFhZLowc8N992s9lUh6JmgPQHbnDExzctxWNCWhR7Y0nULzRyrnr+Pcqx9h6MWd4bdZXrnKVqWwXHN1pGr3uqYQ4bOYQIV7U1706d0ytGQpo0HybCSn73LKypsAU8LJvQmr2fH3AhL3AKMMru0NeegbSshS+GC8c+VOWiwXaSYLY5G9bQJR9I3b5/ZUU0r3tk3p2rr+8HuimaNWG33NmM6JJTWXqzDcu+KcNQfQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(2906002)(31686004)(6512007)(6506007)(31696002)(53546011)(316002)(66946007)(6486002)(36756003)(8676002)(110136005)(186003)(8936002)(66476007)(66556008)(5660300002)(38100700002)(508600001)(6666004)(83380400001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW45RGcvZTA3aS9iQkJkaTE3YmtpeE5CeHE5MmVta0Qxa3RGclpoNUVSYjJn?=
 =?utf-8?B?UEJhaU5tZHY5dEpOMmRUanVKdlJBTXlzeGtSNEluQlZicDhtM1lwVHpxQzdQ?=
 =?utf-8?B?MlNSOThVYTAxcE5JL2hTVWdzaUF4amtRL0R1TERVTko1NlZQR1g2ZEh6WTZu?=
 =?utf-8?B?bS9FQWVWMHFRaHlTWjNEbk9CU1pZSW1GNzFORmN6NGdHbTJjbEFPRTVhR1Ew?=
 =?utf-8?B?VzFoOUZUSTRkUytjNmtLQ094NjhGdmhuaFlpUlB0OHp1SzVxa3ZIVGQyVXIr?=
 =?utf-8?B?dFptRjFxd3FjVUx5RU9xdFp1Smc2cXlBeDlpSkZwemNHNU80S0tvWFI3a2pK?=
 =?utf-8?B?bU1MZFo1dWJTK0lBYmNrN0g3QUtTM1c3a0RDZVJHbDRNZTNnZjdTR1dnWGVB?=
 =?utf-8?B?UEh1NWw1TDJDVGNId1Q2MUFHekVwa3hRZEJ3MER3S0tlNUxhc2t2bHFLUjgw?=
 =?utf-8?B?OFRaaDk1WmFLMlk1bDlUWkFESi9GOExpZDNCQUdhK0szaFdzUTh1bDEzZW9l?=
 =?utf-8?B?Z3M2MjJ5ZStIQWtsMTYyZ1dnVk9OUVlzL05zaVZVSTVQeHpTV2NUMTdHbjZ6?=
 =?utf-8?B?aVA2K0p6WnJ6Q0ZZSFJLSXI1bUJGZFJWTXA2MVRJSkt3VEZLYnFDVHI4M3V0?=
 =?utf-8?B?cENyTS82RE9XMUVSdWVDbUlicVlvTlczeWk3NE9zYVp1L3FabkpQc2NzV09Y?=
 =?utf-8?B?bjh3azAycnV2K0VNREg0SzdQVVh6WWV2TlFkaGl0eEdOdGNkWFJPN2dKcTZ4?=
 =?utf-8?B?UXFiRU8zdTk4Ykd1TUxNWlBRQ1dIOVoxVERIMU5JRWtGaCtOc2tEUURKbmQw?=
 =?utf-8?B?S3hHMTRmdG1RZnA3aVpKSXF6Y3l4K0xEdXBVRkMraHNLb0RkMGdWWHBEQXdw?=
 =?utf-8?B?VmVhR2Q2am9hemNFUHhoKzYvVWxubm91RWxmS0dteFF5czZzY25qa3F0RkVl?=
 =?utf-8?B?bVV4cHpJY2dXL1Q5S1dzSDlPREhkcjFkVXRHRzh4ZXpXK2FYY3JpSG5EZnJB?=
 =?utf-8?B?MjhUL2t1aDBkcjFEc3drMitOd2pTQXBwRTNXNVhaTmNhOTB0bGtWeUI1OWtD?=
 =?utf-8?B?QytxVjJRSldpREM1Mi9nVFUrWkZsTXFhRmpuR2hwNGVqcnJ5ZmJoK01PN1kz?=
 =?utf-8?B?K2gxM1pTa1NsVWFKRWhDYjh3amQ4U2oxdGE3T3BvUWVueGZVbFBqL2hXTk1n?=
 =?utf-8?B?Zko0azJOcElsSEtkK29pL29mT05NOFBKSFpSZVZXV0RDRkx1alJZTE1HRE03?=
 =?utf-8?B?VVRuYWFERm45aUltUzVsdmpROVlNSGdqZ3NwU1ozQTdvai8ybE5HdjhCVVBH?=
 =?utf-8?B?b3kzcEYxblYzVE96QndFaXZjTkhhOTdxTmtRQmhnNHV3RDc0dWMrOTRrRjVJ?=
 =?utf-8?B?d0RrYitOaGdEd01iUTBPNEZFTGM2b1J6RFBNSWlHRjNQRkJLVEZFQWVmY1lj?=
 =?utf-8?B?SkVpTTQ2OThwM1Z6eTJGQUlHS1hGbFV4RytXbzE2bmtKclg0TC9wd1lpeHFG?=
 =?utf-8?B?Mk1rRjhsUk81bExvdHlKZUF1S2dUa1owNEJlVmtvUUVNRFVoOTRXa2dCNkVJ?=
 =?utf-8?B?TnpqdjgxT1pMVG1UZ0V3NHFxS04yN2Y3Q1BkSGxFMDJSTTBQM05mZGF0VXVw?=
 =?utf-8?B?N0h1bC8zbDZxUXJ1d01lTmNudWZVY29Lb20wU0pzRTRFMEpkbW5ZSGFZNzRB?=
 =?utf-8?B?SFB6UU5tUTB4dU5vRkdvTW1hV2VETHlVVjNvdVVEa2xDbzFMdmF4UkpNUFEr?=
 =?utf-8?B?T1VaV0V2Rmc5V3NTQURCdWtmRFdUa1ROSDJ6VHEzR1JwdDdOck5FOTVSZkdY?=
 =?utf-8?B?Zm9KZ1RUTGU4ZXZJYmZJaHNycEl4NGdLOVc3cnlpTXNYMkxoNitYSUVPSDhJ?=
 =?utf-8?B?SFk1MmMxTmRKc3FlOVRnYWJ3TWRCTW9MTkQrV29sOTdjRDNBNGtubzFIQzIx?=
 =?utf-8?B?Vlp6NHJnZzRWRlk2YVlNUkpuMlB2UjR1QlBSdEdMbGN3LzFpR3lmVXVKSGlq?=
 =?utf-8?B?UkQrVjBwaDNtT3MvaEk1N2J2ZXcwR1RwdjBCcWE4N0hlaU5Tb0p5bVdkb0xE?=
 =?utf-8?B?TXMrRGJzRUkrQTNiaXBEVnBDQnJrMk00QmhPbVlFT0VSUHhCcTJ3RlpERWdk?=
 =?utf-8?B?d2VmWFozVlFMNGkwVFN1V1dLQlNxYTZJVkhvZzRUM25nL0djYmVhSTFxcmNR?=
 =?utf-8?B?ZmNER3FONVpGdU82dTRGdHNHRWJWa0Y4ZitaV2FwWjhsTndPZXNHU1VYWFd6?=
 =?utf-8?B?UmZpODFFSzlaZ2xoTmdaV3kxcXVxWnE1UnF4dk5uUjI0RVpZNFhrRnIydkQv?=
 =?utf-8?B?N2Z5WFBHdFRxclBWNmswVHV0Qjh0WnVGY3lEWTFJTEtaVFIxd0Vnbmw2VXYx?=
 =?utf-8?Q?NE2zdBNoahiw33qU1Xs8Zz13lOiyNWzDD/bG4oFTxvhOv?=
X-MS-Exchange-AntiSpam-MessageData-1: zclh3d2YsJ/pnQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fd49a2-f7eb-4b6a-d277-08da13ec4dff
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 14:31:26.9260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9c6N9TqddjmkTXsmJM8hKJG4QaS8srMgFhgDzRd+uCR7L+M1nqup5F83pDFMb8C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0175
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

I would be nicer to push this through drm-misc-next, but the intel 
branch works for me as well.

Regards,
Christian.

Am 01.04.22 um 16:28 schrieb Ramalingam C:
> Christian, Joonas and vivi
>
> Once the premerge results are greeen, if this patch can be merged into
> drm-intel-gt-next along with other patches could you please ack the
> request to merge into drm-intel-gt-next?
>
> Thanks
> Ram
>
> On 2022-04-01 at 18:07:49 +0530, Ramalingam C wrote:
>> Add a parameter called "extra_pages" for ttm_tt_init, to indicate that
>> driver needs extra pages in ttm_tt.
>>
>> v2:
>>    Used imperative wording [Thomas and Christian]
>>
>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>> cc: Christian Koenig <christian.koenig@amd.com>
>> cc: Hellstrom Thomas <thomas.hellstrom@intel.com>
>> Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
>> Reviewed-by: Christian Konig <christian.koenig@amd.com>
>> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/drm_gem_vram_helper.c      |  2 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  2 +-
>>   drivers/gpu/drm/qxl/qxl_ttm.c              |  2 +-
>>   drivers/gpu/drm/ttm/ttm_agp_backend.c      |  2 +-
>>   drivers/gpu/drm/ttm/ttm_tt.c               | 12 +++++++-----
>>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  2 +-
>>   include/drm/ttm/ttm_tt.h                   |  4 +++-
>>   7 files changed, 15 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
>> index dc7f938bfff2..123045b58fec 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -867,7 +867,7 @@ static struct ttm_tt *bo_driver_ttm_tt_create(struct ttm_buffer_object *bo,
>>   	if (!tt)
>>   		return NULL;
>>   
>> -	ret = ttm_tt_init(tt, bo, page_flags, ttm_cached);
>> +	ret = ttm_tt_init(tt, bo, page_flags, ttm_cached, 0);
>>   	if (ret < 0)
>>   		goto err_ttm_tt_init;
>>   
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index c40aca99442f..a878910a563c 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -293,7 +293,7 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>>   		i915_tt->is_shmem = true;
>>   	}
>>   
>> -	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching);
>> +	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching, 0);
>>   	if (ret)
>>   		goto err_free;
>>   
>> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
>> index 95df5750f47f..9ba871bd19b1 100644
>> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
>> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
>> @@ -113,7 +113,7 @@ static struct ttm_tt *qxl_ttm_tt_create(struct ttm_buffer_object *bo,
>>   	ttm = kzalloc(sizeof(struct ttm_tt), GFP_KERNEL);
>>   	if (ttm == NULL)
>>   		return NULL;
>> -	if (ttm_tt_init(ttm, bo, page_flags, ttm_cached)) {
>> +	if (ttm_tt_init(ttm, bo, page_flags, ttm_cached, 0)) {
>>   		kfree(ttm);
>>   		return NULL;
>>   	}
>> diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm/ttm_agp_backend.c
>> index 6ddc16f0fe2b..d27691f2e451 100644
>> --- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
>> +++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
>> @@ -134,7 +134,7 @@ struct ttm_tt *ttm_agp_tt_create(struct ttm_buffer_object *bo,
>>   	agp_be->mem = NULL;
>>   	agp_be->bridge = bridge;
>>   
>> -	if (ttm_tt_init(&agp_be->ttm, bo, page_flags, ttm_write_combined)) {
>> +	if (ttm_tt_init(&agp_be->ttm, bo, page_flags, ttm_write_combined, 0)) {
>>   		kfree(agp_be);
>>   		return NULL;
>>   	}
>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>> index d234aab800a0..1a66d9fc589a 100644
>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>> @@ -134,9 +134,10 @@ void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>>   static void ttm_tt_init_fields(struct ttm_tt *ttm,
>>   			       struct ttm_buffer_object *bo,
>>   			       uint32_t page_flags,
>> -			       enum ttm_caching caching)
>> +			       enum ttm_caching caching,
>> +			       unsigned long extra_pages)
>>   {
>> -	ttm->num_pages = PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT;
>> +	ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) + extra_pages;
>>   	ttm->caching = ttm_cached;
>>   	ttm->page_flags = page_flags;
>>   	ttm->dma_address = NULL;
>> @@ -146,9 +147,10 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>>   }
>>   
>>   int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
>> -		uint32_t page_flags, enum ttm_caching caching)
>> +		uint32_t page_flags, enum ttm_caching caching,
>> +		unsigned long extra_pages)
>>   {
>> -	ttm_tt_init_fields(ttm, bo, page_flags, caching);
>> +	ttm_tt_init_fields(ttm, bo, page_flags, caching, extra_pages);
>>   
>>   	if (ttm_tt_alloc_page_directory(ttm)) {
>>   		pr_err("Failed allocating page table\n");
>> @@ -180,7 +182,7 @@ int ttm_sg_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
>>   {
>>   	int ret;
>>   
>> -	ttm_tt_init_fields(ttm, bo, page_flags, caching);
>> +	ttm_tt_init_fields(ttm, bo, page_flags, caching, 0);
>>   
>>   	if (page_flags & TTM_TT_FLAG_EXTERNAL)
>>   		ret = ttm_sg_tt_alloc_page_directory(ttm);
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>> index b84ecc6d6611..4e3938e62c08 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>> @@ -517,7 +517,7 @@ static struct ttm_tt *vmw_ttm_tt_create(struct ttm_buffer_object *bo,
>>   				     ttm_cached);
>>   	else
>>   		ret = ttm_tt_init(&vmw_be->dma_ttm, bo, page_flags,
>> -				  ttm_cached);
>> +				  ttm_cached, 0);
>>   	if (unlikely(ret != 0))
>>   		goto out_no_init;
>>   
>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>> index f20832139815..17a0310e8aaa 100644
>> --- a/include/drm/ttm/ttm_tt.h
>> +++ b/include/drm/ttm/ttm_tt.h
>> @@ -140,6 +140,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc);
>>    * @bo: The buffer object we create the ttm for.
>>    * @page_flags: Page flags as identified by TTM_TT_FLAG_XX flags.
>>    * @caching: the desired caching state of the pages
>> + * @extra_pages: Extra pages needed for the driver.
>>    *
>>    * Create a struct ttm_tt to back data with system memory pages.
>>    * No pages are actually allocated.
>> @@ -147,7 +148,8 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc);
>>    * NULL: Out of memory.
>>    */
>>   int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
>> -		uint32_t page_flags, enum ttm_caching caching);
>> +		uint32_t page_flags, enum ttm_caching caching,
>> +		unsigned long extra_pages);
>>   int ttm_sg_tt_init(struct ttm_tt *ttm_dma, struct ttm_buffer_object *bo,
>>   		   uint32_t page_flags, enum ttm_caching caching);
>>   
>> -- 
>> 2.20.1
>>

