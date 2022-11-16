Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 417F762BCD8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 13:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F0C10E087;
	Wed, 16 Nov 2022 12:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7763610E087
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 12:01:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jELsg3xCHIe56oaczmpHAdQATKAAOYIuHm9XmtA2pFcNoyDtE73W0ctnPaJAsO4m04luvb6KDTPRmWNvRTPszSxq3vNilJHrsDiM3ZVRZ8eBfvyzVmAb3kgEh7125NvSWanklvjA/wJBFS0H4LkcyLVFa3V6+f5DbOCJge/LQpVCmpz0IHtXTXki1c1tt0TSD3Llos93HV/DsUkQTUd6ZtSCmgqiWU0RsvqsF9S/1BIcAbrm+SGvO3IzKrdKwoLW9m5IZ3ZLXq3H41R5bNJPEZF/8wjlfq4iyzrZQ3zqy+xypmSlPa88SY2B5V4pnOZ4H9clnr36UIPp2H5x7RdWxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/d8Axlvm01O4d4Ich1VoQtSy0lvvX6DW68Wm8IH8vk=;
 b=eLKycjiJ1Y3tdVh8QRYGHY4Ye6yiq2Yojq0dhwFrFt1htqQLpUsPgWImDoUf1aVZky86AfSFOeAw4wg5KJJtYJzQU0UpGsjLQDk9D5nk5XajC81l2olsEi6RnH9XS2d6eFxUGNxiBIQGIn+pPLt5HMCtdRyi2DvvSwpXx+xXnip1kD3/K9r5Y5mfgwUF7fv0FOA4UR6K0uMh9pN3g6GjL6O5JSIBERKn+sAfVQ41p2Peft/zY6cYdMDiwrXYy98hYdi806OKsvmZOTB+1Bm7k4s8vmIL6pN4mdIKU0hn2NFyHt0OoFKU5xn+E3R7y4N4KOQy7h4qYaVD22a16tjnPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/d8Axlvm01O4d4Ich1VoQtSy0lvvX6DW68Wm8IH8vk=;
 b=xPwzJuH2RdbUsu2idXgW0OCVkNqJUOWMdBonUOwTl+k3Bhwsw4WB7G5o4/EH4StBamc1nwr5PuXJ01aMaiW4WxItCeJf0s7Y3V1yhVhei2XJYOverHHbht9bzTjDf/PNA1OPGItuE7reP93a4usFvXXWw/o33mN1iCgvW3qY53A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6253.namprd12.prod.outlook.com (2603:10b6:8:a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Wed, 16 Nov
 2022 12:01:51 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 12:01:51 +0000
Message-ID: <b715cb83-32f1-a33b-a0c2-b779011151c0@amd.com>
Date: Wed, 16 Nov 2022 13:01:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3] udmabuf: add vmap and vunmap methods to udmabuf_ops
To: Lukasz Wiecaszek <lukasz.wiecaszek@googlemail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20221115200426.4801-1-lukasz.wiecaszek@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221115200426.4801-1-lukasz.wiecaszek@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: adcf3cf4-81f6-4d84-04a7-08dac7ca586c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LXMS2AJFJF99ryrhkhjrCJzOGhkZqfebRkuI2ybHze7AIH8Whu1LmW+iTRYLrbyJimSp81Y3ch1uHEb+jyc5fxzvl4v6bgRorTV6Avt+WdjAgytqCsrCmmzHUYBky6KSlzgIwzTytfjRGtOJmCJ0p6alEnrDmmsKpgDzpMudKmgZGDsIHFN5O+DyzILfyevUngK+VE2m0n2zO1KMI8MRWX/xunaObAxwZs8xPDeT3TtpQLxejlC0Hf+iOwp3YgZkJnB88Z7C/NWlha1ouANp8/SiO63eqBpqto61Wmp45ETb/uvDhVM83h7hhUopvg2s5h6di1FwSQSIsbmOJUWwTVD9Obj3L8HTA9OOI/x/SWyfa9CRoc+LE08AULkD0eWpuh4qgVPv+4AkUD6ST4mssW+4t6zqWZAbZgrHjRthFan71QfdVePBClDMLpEWNvJtZYHPlLR4ZOWWTbM3BjCjUTYCc595NmWEEAL5/nIIu/emEAbFJteRAsNIARXSfQYtlZEYbgG5jfunLvTBGndfa0SUTU6cOj88qaCR9W2NfZWI471wExUnGo60aHHUrmtgY9E3o7IyzwhBsbxDeEXuS3nsDdFV0fAiObXfaolNJQR8M5QN4oOr+yhHeoIUq04K2izhEiJ1DCsPrmXhoRi9scg7eoVPue5n/W2cqYq4O7GUxnID5QDMWUeK7XH1r7ApPjX14bH2jj+Hg5F8MUI7kdK+pKs4ZZ0Lo+qA2qMB8h9gGwaF5NN6IfvA3ugnRFnQdvMtcsIaHF/795QHOxxdnsoAOv6q8EXVdoqCldxyEB4Ql4lQSuCeIrJy8HlBhLDmS9CvHhyAADQoR6hjr6aBkwqDpS63yiY1RgDG8rKcS/KQ7+IXQR7LfvZ9r02+PxzA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199015)(38100700002)(5660300002)(41300700001)(31696002)(86362001)(316002)(966005)(478600001)(6486002)(8936002)(66556008)(54906003)(6666004)(66476007)(8676002)(4326008)(7416002)(66946007)(110136005)(6512007)(83380400001)(186003)(2906002)(6506007)(66574015)(2616005)(36756003)(31686004)(66899015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnYrRkZFMHBONUc5Mk1SM3BUVVVJYUZjNHNoVk1RTFlUU1ViZGN3TXJadjA0?=
 =?utf-8?B?VUZ4bFJoRHFSNWFOOEJjWG10YTdhSE5ZcllYemJsOElOMjY2WkNRb3R5Ynl0?=
 =?utf-8?B?Tkh6cmN1UWVubHFnQUpyT1Z2dUlIZGVONERxMkQ4QmZsKzE5YkJlSnJXam82?=
 =?utf-8?B?QjZEVTlRL3FwSU9YMDU5bTNvNS95QUtCZVlsK001eGJ3Q1pjaHBEYThHTXRF?=
 =?utf-8?B?L2VhZWNTeEM3Wm5PRlhnaTJLeDI4K2NaeDJtS2MyL1ArRENzcGRqcDBxeEU4?=
 =?utf-8?B?b2pMU1kvWVNZVmpmeWxJYzB4R3hDd3YvUHRieThnbU5pRWF6UlpTS2tNSC9B?=
 =?utf-8?B?a1JQU0ptQUhGR0VqTTZ2ZEd6MXh6SGxVdDFVOWREZDdJTzdPZDlBYVpucktx?=
 =?utf-8?B?VE05Uk41dzU1bU0xelZZZVV2YVpNVnpnblV0VzdsMjhiT1pwbGROK3RlTWNV?=
 =?utf-8?B?S3FFUFRXUHg0M1N0L1ZmZTVHdExkWnV1UTgweVI2eEF3TFpXQ0ZNRjlDK2la?=
 =?utf-8?B?WXkyR1VCdzNmSSszc25yMUtMME1QRmtmekg3aUhBTE1SUHU4Qkx1VExtcUVv?=
 =?utf-8?B?Rm1YZzQ4WDBjMmt5bWNod2xHRzV4QXEzdTlnN1F1QTFlU1VxWnhtU0w0bWVz?=
 =?utf-8?B?eXdwemErR0xLNVpTcDcycnQzUDR4a3g3dGRrbzUyNjQweDRNd25ITTMwVHpw?=
 =?utf-8?B?SDMvMnJmNDloOHJscVlZZHp5eGZHbExURStIN2grclJDRFN3ZVJxTkFIQnhF?=
 =?utf-8?B?cTlZcFNKQ0gxNTVrUXlZeTdXTWd1TWtHdktOa2pVMlQvSm9OTWhNeS9pakxT?=
 =?utf-8?B?VWQ3dTk5elM3bEVzQUNXN215WXBSM09vWnFjOVFXd1ExQ2lPbVZOMWlwYjRS?=
 =?utf-8?B?S2pUTU9vbGdLdi9UWitTYllleXlFR25KU2dqUWxHV1ZySmVaOTN4c1JqdW94?=
 =?utf-8?B?bUhUU2I1T2VuUnlQT1RqZEtBb0dyU0ZPMkFMYUxZRGZjU0tlQnNHNmM1SGc4?=
 =?utf-8?B?V0VMYmx0eVpjTUpOS1NPRmN0eEExcDVhWHg1N2xqNnJTZUdaMVMxdCszcjdE?=
 =?utf-8?B?N1VaUkthQlNpcHJPS0lFZ2U0bENHVDdVQkZQdW5yZjlDWkhRb1F6bEhUTEdp?=
 =?utf-8?B?SWVxU2svQm0yT3YzNXNxVERTVGsrcXkwN3YwVFI4b3RzUHF4V0IxNzJqa2F3?=
 =?utf-8?B?bXR0aXJmTSsyZkx3L05tS3NFdDB4REE1R2xlYzZnZmRWZG9hNXZjNVcxVytO?=
 =?utf-8?B?Y2VBRjh4TjJpUFVHSXpGYzFpYVA5ZHFBcVIvSHYydmNueGJFUEFBV1dpSkh0?=
 =?utf-8?B?S3ZYYXVZenBYQzRZdk12TzY3TUlCR0ZzZmJCdmw0VE50Q1lpbnhITlRYejRI?=
 =?utf-8?B?amVBL0JJVDM1REU5bUtjdG5UR1pJQ3FET2RIeGRGSitzTDNQQThzOVpLQlh6?=
 =?utf-8?B?Ukl5M244V1lhTUJ6c0lGZFl3c0xwSTFFdzVTMWNjVGRMTDI4Y3pQMkdibkcx?=
 =?utf-8?B?NlplWWsvdFNHTDZ5Q0MwdElQTGVJcnRnekVmd2w2dGh5UEZFSXo3NnhYcGNO?=
 =?utf-8?B?SnBoSHdxTXY4VXljanpSTmR4Wld0UDBlYXpQNHl0dHJUY0ZvdnMvaERIN0hC?=
 =?utf-8?B?a1NWRmFMd0tzWENZZWdIakV5bjF6SWc2emF1UTRHTytkT2luVVBNRnRFb3J2?=
 =?utf-8?B?emgrSHMyY0hGK3BHOUU1SFBtUTN6VXdqeVVEY0Y2akpQenM4ZWFzaSsxdjFm?=
 =?utf-8?B?ZXlNRUNCUjVLMkJ2ZHNjOU1IdGFYVHZ1T3NFM0RROEJ5aVlodUtWYUdUcEY2?=
 =?utf-8?B?ZDdCMHNsS2p6RVlLdVBLdVpPUldqQWpXRGZvUDROYTFPdUVxNW9zck9mZVlN?=
 =?utf-8?B?UUY0YkdUWVA1ditMYnh3eTdnRGpWZVUyUENMTDcwRmh0V0QzVyt5M1ZzNE5p?=
 =?utf-8?B?SWhJWUh0Q3V0bkdWWTZTZlNUTndwK0tpRkhJQkxJSTQ0Sm5UWDNPc2dTR0Yz?=
 =?utf-8?B?akQwQ2dITitBMi94eitnVjVKWW1UMm15eXNnd25YSC9kZEJnZWdMUTNSUjNU?=
 =?utf-8?B?QytxaCtkUnBxTzR6R1V1djZxT21yTjcxdzhQZEFPSzE3V2h5T0U4ZC9YTUFY?=
 =?utf-8?B?SFZlRFlJOVp0ekh1MGxMUlhLYmlJZFhnTGVIQmZpMnVoQWR3WW9UQ2ZuV0p2?=
 =?utf-8?Q?56RoPh8CKpp5AgweytLtEKMhJxicZVHDYpki8yLPOaMn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adcf3cf4-81f6-4d84-04a7-08dac7ca586c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 12:01:50.9954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXJE7KgMJHQkprm7BCH2y/FOMtxo7dalV+sx9Dsg99oPO5BKXnWEMeEL7V31zYK4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6253
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.11.22 um 21:04 schrieb Lukasz Wiecaszek:
> The reason behind that patch is associated with videobuf2 subsystem
> (or more genrally with v4l2 framework) and user created
> dma buffers (udmabuf). In some circumstances
> when dealing with V4L2_MEMORY_DMABUF buffers videobuf2 subsystem
> wants to use dma_buf_vmap() method on the attached dma buffer.
> As udmabuf does not have .vmap operation implemented,
> such dma_buf_vmap() natually fails.
>
> videobuf2_common: __vb2_queue_alloc: allocated 3 buffers, 1 plane(s) each
> videobuf2_common: __prepare_dmabuf: buffer for plane 0 changed
> videobuf2_common: __prepare_dmabuf: failed to map dmabuf for plane 0
> videobuf2_common: __buf_prepare: buffer preparation failed: -14
>
> The patch itself seems to be strighforward.
> It adds implementation of .vmap and .vunmap methods
> to 'struct dma_buf_ops udmabuf_ops'.
> .vmap method itself uses vm_map_ram() to map pages linearly
> into the kernel virtual address space.
> .vunmap removes mapping created earlier by .vmap.
> All locking and 'vmapping counting' is done in dma_buf.c
> so it seems to be redundant/unnecessary in .vmap/.vunmap.
>
> Signed-off-by: Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>

> Reported-by: kernel test robot <lkp@intel.com>

Please drop this line, the kernel test robot should only be mentioned if 
the original report came from it.

And keep in mind that it might be necessary to implement begin/end cpu 
access callbacks as well.

Apart from that the patch is Acked-by: Christian König 
<christian.koenig@amd.com>.

Regards,
Christian.

> ---
> v1: https://lore.kernel.org/linux-media/202211120352.G7WPASoP-lkp@intel.com/T/#t
> v2: https://lore.kernel.org/linux-media/20221114052944.GA7264@thinkpad-p72/T/#t
>
> v2 -> v3: Added .vunmap to 'struct dma_buf_ops udmabuf_ops'
> v1 -> v2: Patch prepared and tested against 6.1.0-rc2+
>
>   drivers/dma-buf/udmabuf.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 283816fbd72f..740d6e426ee9 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -13,6 +13,8 @@
>   #include <linux/slab.h>
>   #include <linux/udmabuf.h>
>   #include <linux/hugetlb.h>
> +#include <linux/vmalloc.h>
> +#include <linux/iosys-map.h>
>   
>   static int list_limit = 1024;
>   module_param(list_limit, int, 0644);
> @@ -60,6 +62,30 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
>   	return 0;
>   }
>   
> +static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
> +{
> +	struct udmabuf *ubuf = buf->priv;
> +	void *vaddr;
> +
> +	dma_resv_assert_held(buf->resv);
> +
> +	vaddr = vm_map_ram(ubuf->pages, ubuf->pagecount, -1);
> +	if (!vaddr)
> +		return -EINVAL;
> +
> +	iosys_map_set_vaddr(map, vaddr);
> +	return 0;
> +}
> +
> +static void vunmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
> +{
> +	struct udmabuf *ubuf = buf->priv;
> +
> +	dma_resv_assert_held(buf->resv);
> +
> +	vm_unmap_ram(map->vaddr, ubuf->pagecount);
> +}
> +
>   static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
>   				     enum dma_data_direction direction)
>   {
> @@ -162,6 +188,8 @@ static const struct dma_buf_ops udmabuf_ops = {
>   	.unmap_dma_buf	   = unmap_udmabuf,
>   	.release	   = release_udmabuf,
>   	.mmap		   = mmap_udmabuf,
> +	.vmap		   = vmap_udmabuf,
> +	.vunmap		   = vunmap_udmabuf,
>   	.begin_cpu_access  = begin_cpu_udmabuf,
>   	.end_cpu_access    = end_cpu_udmabuf,
>   };

