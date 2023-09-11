Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9039F79A729
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 12:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6C710E276;
	Mon, 11 Sep 2023 10:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466EB10E27E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 10:16:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zv9u40g74I7QnqgAsPVWHcgwdaa7ryfHkDBrS6QW7H2FnElU6lCsSCKvcgh0IRkSKMAbtEBy8bfhk4PR6UCmAiHsoS/AfbiezLdynJIJWVBnrlYqAemr2Cbfharc/8FRL3zaTcU2sCL8iLdux7+JCA7C+Wwv4UlYW3Yvp1qclvAJBtnCF7D7b/cdiuhTlbc7Y7rtXTDiO1/2ole1DZaZiJiY3whl0D1pBBWxHTIAHf1DXHvZwymqRxhkHVEQ3fCUbcDdAcMEAP4A3BsvmY4HpvrBPFI5PMeVp72zQS5q804dsoWSe1aI//PNu0J0ig22LMdJh39mQzls5DYEqhKU/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooo8ioFCP+b9WvVddnNqQaH/D2/zFEi/HdvcudfM4Y4=;
 b=cjv4y0yyKmtFse9x5kyN+lxQ/zlwvYiFu7a8SqHAJAhk8Wf6LhFxrBrOUhAO9aYKHQ3O5QxldtjsiDmBzJhypIWyhphcxNw5r+fXDe4pdAPY6MHNeznSY5lY8GLZ0vQ1wCY702z8S7xKDaRfnBYt7tuJJwyN8GTIZLeu11jHhQF50zR2+eebBI3/8D2eAr2ljykqVrPx8US89x127z/suh79/hNbBeBxBKO42/8ftLqBS3IRC4CGT66OX9eCQZgysk5wRi5vI8K5pbg/eXHR/h0D7+zL1xaLE7I+Dw1DottR65GTOeazapq3qsUDVGWgVIWQT0iT8h7hy5L+GXxkHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooo8ioFCP+b9WvVddnNqQaH/D2/zFEi/HdvcudfM4Y4=;
 b=FYCS5jhv91ybmBdp2knCsdcIWg4eEr4yyBXaQNXsH+Zrq9OGfpRqy8fCGCNRS0TYMFF+Vf8gR+EhOHmzBJ4/DGceLIbz0210aQX9x4+4e/Z++n2xCgz61H52QgpLKgc2hyID5kXQ9fr1y25i6gSETuv0riRI4+az0avOXx79zDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4562.namprd12.prod.outlook.com (2603:10b6:5:2aa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 10:16:04 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 10:16:04 +0000
Message-ID: <da7ffae5-3b57-71d1-b09e-fdb297936632@amd.com>
Date: Mon, 11 Sep 2023 12:15:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 5/9] dma-buf: heaps: mtk_sec_heap: Initialise tee session
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-6-yong.wu@mediatek.com>
 <d0373c02-9b22-661f-9930-ca720053c2a0@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <d0373c02-9b22-661f-9930-ca720053c2a0@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4562:EE_
X-MS-Office365-Filtering-Correlation-Id: f0d55335-5750-449d-e202-08dbb2b01aea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G4ZWPlIizHfuLKDF0s4UUMeSwwSS3wV8Ffrk4MEXP8L6REB4sa0WAZR6Zxu89nQONcr0R1U4TqLI9hKIiFalC9Zk5M7Wkz7lX36Y5aJVwFYWBuBA7YjGNilC6tdV7mbSDhbh5c3J8SLY4pjMP1BI5JVEKCYHwTbXFIxStfDBRSOWhoxkCVtGNOr2qVr3BzrhaYbeISefTfwpmPebbe6yS27q30LUNfnovboWg9ceXvCG6RUwCuGGbPQwTLL558OEGrh5t7AwIZZcxWNAuyIdsWrSjPfzBDdv8GgRNfYB5o7Ef2gqqnBkLVA7lfALCW46p11GzQQNBXMtLBwepA4DsHvL3WuPYKFacytgEuTflikIw9KQiTeT+QHe3RAOqNZFSd1pHr9xjJ5E3vTXU/EtERNCYHM+GXQpVS/PrvVG02KeZEq3qBBE/J1Cq4H3cZKoBNxXwmFEb7vRvkGZH1Tp/GA/edFtPgWnVi/so/zuLc5HI/h8xk+14mP2tNtZ6DQ39ueN+RVJ+03papD+aSYTcakTNm1DyDvX0bZdRwlmKz9PNUNc4BKojuv/+yCxXfxpyE7Hq0CjzcIJTGYIjX+b4eTfVyV03bbZPl8q6pYsb9Dr/L4VMLNJ49FyZvsfhV4aYfaBuzlQTO4ECQZYGepWbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(39860400002)(366004)(346002)(1800799009)(186009)(451199024)(110136005)(6506007)(6486002)(6666004)(6512007)(478600001)(83380400001)(2616005)(26005)(7416002)(54906003)(66476007)(66556008)(66946007)(4326008)(316002)(2906002)(41300700001)(5660300002)(8676002)(8936002)(86362001)(36756003)(31696002)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2cwZlhheXdlMjhxYkY4bXplNmk5Z3hUdVlxSkdjTHVwVStGT2JFeHF3Nm9n?=
 =?utf-8?B?cUZ4S1R3YVF3cjBMOHZZOUdkRFZheTdza1dNVEhUdENOQmlhR0pXOWljaEdC?=
 =?utf-8?B?Y3A3ckdzdnM5OGl3OWE4UC90ejVRS0tVWWtjazZVQ3c5Q3NBa29XWEN4ZzJS?=
 =?utf-8?B?NVV5NlBSd3Fna015N0dzVldEMVp4clhOZExPTUMzQkx2L3V1cXJKWVVpSU1C?=
 =?utf-8?B?b2FrSHRkVXhwSGZPcllkaW1ZYlBwczVkc1UvUUlqMk5FT0FoZ2dZWTdZSEU0?=
 =?utf-8?B?V3A5K0lKWEZoYURvaWtPMmJkWlVqUXFnc2pHUkpRSE80dzA2dFU0b1RqT1hV?=
 =?utf-8?B?eFBRNEM3c2JYSTdPaDI3UEtYSFhpV2pXUmFTSzRSMy9LM1dmRzVvMVZDYmVW?=
 =?utf-8?B?Q2lFalZXUkJKVlpwOXZyVSt6aWxyRVFERTRBdGd4Vm1MR3A5TFl3Yi9vdldC?=
 =?utf-8?B?VE9ZNFJSKzI4QWE5Uy9jeVdZTVpYamkzc0VodGRmRzFBRUY5MFBtczJqUGdG?=
 =?utf-8?B?QmdMZnhnNGcrSWh2ZmsxYk4yWXZjTkVvTFdFTnJJRzRTdmlpL0Z1Q0ZIcEtt?=
 =?utf-8?B?UmlEQTZyY1I0NzNUdFNBUkRyeWlZUGV2WGtSNDB0RVIyM2dlZXVseGNDaHNN?=
 =?utf-8?B?VXFCQW1sUTBSbDVPYUJva05ja2JKUFF6Y1FqRzZFT1AzcW5KbU5rS21hRWdm?=
 =?utf-8?B?b3lMeE9QTjZpVSs5cGN1T0E1eHdGUWZQT2dwTUlVMllBR0xEQ2dVSjk4MElk?=
 =?utf-8?B?MGVnbUZaRXNPSTgxdXpYMlpCSmljTFpqakl3YkY5UG1HV3IyWVZrdjBacDla?=
 =?utf-8?B?NFZ2WDBieUx5YnBmRXkwalB6UmVQZk1KaTY4NG81bUlGb1pmU2FDdzVHTi9P?=
 =?utf-8?B?bGhmVEhScmF3cDBQSHV6OFZNYXpWazhZeVV1RStIdStJWUo5Z1c0WE9ESnRN?=
 =?utf-8?B?N1BtaVNjTS83YWJjWUFWV24vRkJWTDlBQ0VtWHBCbC83OU1vR1BqK2lQUjVu?=
 =?utf-8?B?UDduRUdTTFJXSFI5a0RpMndOSHFRajlDeFE5YklKdW5EVUJ2QUYwcWYwNnVX?=
 =?utf-8?B?S3VTeW5JYkJsSnU3RDlsZ2V0WWpDYmxHakRkVGtwLzNqTlRlYTBlOUFCZUNK?=
 =?utf-8?B?alltZjhjSzZOcldEZmNjRDJQcW5CQ3hIOGlMdkhQQytadStkcFRVNURCMXpm?=
 =?utf-8?B?UFQ5SlBMU0N5QWtrcU5vc2dyMUhFbHBjaUlUSGdSWlB4OHNIaFk5d0NzS3E4?=
 =?utf-8?B?T21YVjZkWXhOSFhtSnJmaEJLc1EwVG1pU3U2SUgzakNvT21mQWdSK1BqYjBh?=
 =?utf-8?B?UmxPL0kvVWNtdEJtYkEybmxHcHc0K0FrYi9wN3dGejRZUXlGNzZuYmNWQXJt?=
 =?utf-8?B?czlPUTFZeTdKcVVwZWRzRDRNSzFCMlhpM0V6WHFiVFFPMEZmZTkrenorR3Nu?=
 =?utf-8?B?T3ZvL1RqQy9DWGVSMWhHVVBpUjJEakZuU3JWWGVnM3JKb25CcEhDekFRSnEz?=
 =?utf-8?B?eUhrcGNONU5MNWdLT0o1L21qeDA1aVE0WFhsNjBhdUczL2xHVExyYXkvTUxB?=
 =?utf-8?B?Zm1qeUlSY3dPMUR2TEJ6Y04wdm5DM0xhOXVDOGVJaXdzYkt5Y041MmZtVW4w?=
 =?utf-8?B?a1hNb3ZJTUlYaHhQZmtJcGhqQ2lISkNLWng5S0d1bVIrelJ1ZktXYXM5NzVE?=
 =?utf-8?B?K0dGZXFEYWx0ZWtUVmpZV2NvV1BsMFBTRlBLZE1IWFV4WVdLRXFWbGMyN1Zt?=
 =?utf-8?B?L2FyQy9ESzN2VVJJSlJnM2tWTTdJazZvdVM1ZTFhekt4S0cxWUlnaTh5bXZa?=
 =?utf-8?B?Zk42dEJhTlZieUJhQXQwTWpFZmIzb3piSGNWb2M1VWdtT2pBRnc1ZEpYVkdK?=
 =?utf-8?B?RkRzV0NBbDFUc1JwVmlUNGZnNmsrWWlRWXhWd2NGRm40SDUwUVhWQjhTQmRm?=
 =?utf-8?B?VU95bWZYMEdSVThINW5vblBEeERHSW1Fd1l5RDRyei9oTGpVTGt2VUtLSnRL?=
 =?utf-8?B?S0pnenpxNzRlR1dUajBQcVB3YzFpckxXZHZGSjZjdnU2QjkrMlhzbDdEYWZT?=
 =?utf-8?B?SVBHbjUvclhDcnp1RzBjOUN1SjdyS1VUVEltNGJBcTJXK25xVnhhMzNKWEdV?=
 =?utf-8?Q?COZxmHEr7BYD83xNNA4D2npjN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d55335-5750-449d-e202-08dbb2b01aea
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 10:16:04.0652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAchpY3xiWxG0VhhBwxWThMvnEKeHR4Nf1NlkOGtjlF2Clnc6BHmJNXDzjlHuZaD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4562
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tjmercier@google.com, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, jianjiao.zeng@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.09.23 um 11:29 schrieb AngeloGioacchino Del Regno:
> Il 11/09/23 04:30, Yong Wu ha scritto:
>> The TEE probe later than dma-buf heap, and PROBE_DEDER doesn't work
>> here since this is not a platform driver, therefore initialise the TEE
>> context/session while we allocate the first secure buffer.
>>
>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>> ---
>>   drivers/dma-buf/heaps/mtk_secure_heap.c | 61 +++++++++++++++++++++++++
>>   1 file changed, 61 insertions(+)
>>
>> diff --git a/drivers/dma-buf/heaps/mtk_secure_heap.c 
>> b/drivers/dma-buf/heaps/mtk_secure_heap.c
>> index bbf1c8dce23e..e3da33a3d083 100644
>> --- a/drivers/dma-buf/heaps/mtk_secure_heap.c
>> +++ b/drivers/dma-buf/heaps/mtk_secure_heap.c
>> @@ -10,6 +10,12 @@
>>   #include <linux/err.h>
>>   #include <linux/module.h>
>>   #include <linux/slab.h>
>> +#include <linux/tee_drv.h>
>> +#include <linux/uuid.h>
>> +
>> +#define TZ_TA_MEM_UUID "4477588a-8476-11e2-ad15-e41f1390d676"
>> +
>
> Is this UUID the same for all SoCs and all TZ versions?

And how is this exposed? If it's part of the UAPI then it should 
probably better be defined somewhere in include/uapi.

Regards,
Christian.

>
> Thanks,
> Angelo
>
>
>> +#define MTK_TEE_PARAM_NUM        4
>>     /*
>>    * MediaTek secure (chunk) memory type
>> @@ -28,17 +34,72 @@ struct mtk_secure_heap_buffer {
>>   struct mtk_secure_heap {
>>       const char        *name;
>>       const enum kree_mem_type mem_type;
>> +    u32             mem_session;
>> +    struct tee_context    *tee_ctx;
>>   };
>>   +static int mtk_optee_ctx_match(struct tee_ioctl_version_data *ver, 
>> const void *data)
>> +{
>> +    return ver->impl_id == TEE_IMPL_ID_OPTEE;
>> +}
>> +
>> +static int mtk_kree_secure_session_init(struct mtk_secure_heap 
>> *sec_heap)
>> +{
>> +    struct tee_param t_param[MTK_TEE_PARAM_NUM] = {0};
>> +    struct tee_ioctl_open_session_arg arg = {0};
>> +    uuid_t ta_mem_uuid;
>> +    int ret;
>> +
>> +    sec_heap->tee_ctx = tee_client_open_context(NULL, 
>> mtk_optee_ctx_match,
>> +                            NULL, NULL);
>> +    if (IS_ERR(sec_heap->tee_ctx)) {
>> +        pr_err("%s: open context failed, ret=%ld\n", sec_heap->name,
>> +               PTR_ERR(sec_heap->tee_ctx));
>> +        return -ENODEV;
>> +    }
>> +
>> +    arg.num_params = MTK_TEE_PARAM_NUM;
>> +    arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
>> +    ret = uuid_parse(TZ_TA_MEM_UUID, &ta_mem_uuid);
>> +    if (ret)
>> +        goto close_context;
>> +    memcpy(&arg.uuid, &ta_mem_uuid.b, sizeof(ta_mem_uuid));
>> +
>> +    ret = tee_client_open_session(sec_heap->tee_ctx, &arg, t_param);
>> +    if (ret < 0 || arg.ret) {
>> +        pr_err("%s: open session failed, ret=%d:%d\n",
>> +               sec_heap->name, ret, arg.ret);
>> +        ret = -EINVAL;
>> +        goto close_context;
>> +    }
>> +    sec_heap->mem_session = arg.session;
>> +    return 0;
>> +
>> +close_context:
>> +    tee_client_close_context(sec_heap->tee_ctx);
>> +    return ret;
>> +}
>> +
>>   static struct dma_buf *
>>   mtk_sec_heap_allocate(struct dma_heap *heap, size_t size,
>>                 unsigned long fd_flags, unsigned long heap_flags)
>>   {
>> +    struct mtk_secure_heap *sec_heap = dma_heap_get_drvdata(heap);
>>       struct mtk_secure_heap_buffer *sec_buf;
>>       DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>>       struct dma_buf *dmabuf;
>>       int ret;
>>   +    /*
>> +     * TEE probe may be late. Initialise the secure session in the 
>> first
>> +     * allocating secure buffer.
>> +     */
>> +    if (!sec_heap->mem_session) {
>> +        ret = mtk_kree_secure_session_init(sec_heap);
>> +        if (ret)
>> +            return ERR_PTR(ret);
>> +    }
>> +
>>       sec_buf = kzalloc(sizeof(*sec_buf), GFP_KERNEL);
>>       if (!sec_buf)
>>           return ERR_PTR(-ENOMEM);
>

