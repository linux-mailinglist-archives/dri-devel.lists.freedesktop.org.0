Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEDC3552CF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 13:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A4D89DAB;
	Tue,  6 Apr 2021 11:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2123.outbound.protection.outlook.com [40.107.21.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC43F89B70
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 06:42:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOgLpEndMj49Pren5/2ciG/wkUELA/HUZszHdMI9kIfuoUTEnltCBDGT108rrP6/NSI+UpWz0x4u1105Z/3/j7Y1gCyZzqlwAvbuVaPUm0Vc6Q5IInuQus+3V46vM3FkylZr/cApQBm92ApeHPrGvXr2rY8xAHLd1GFmVqtoTD007pcvXu2McpYvFXs1lo2hS8TGjjpUVOj+x+kWjckXC8hT6RCIKz3t13g+MXjoqVaYTYkGYty0iDB6QUU0kPVLWMfLohfL9Efsm4aDr8z1RlZXdiSBMJ7it/ljpYIv1zzzzeuceziNoA1JC0D1o6ymswMDIDyFP3MXk8JHa4tb4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71+YZbeRr+tR1jMVlWqnwUe4jxuqN4fvP3JzUuFl81E=;
 b=Dt+uuNIiRvMD8sfsWEQ/T1CCkU5cNi28rm9coxa0tuwfqwCDZZ9iKnz4t0PArTnpWxY7PDMavzdOH2hvsTbz45xS7fT0/UKyB0tcHpT8TnlGc/YtWt64IrpRZ1tY7FEWlNhxc11WryZJBV3pCE/yavil2/jWNA1BJkP6iSi+qslIjijzaBGhFiJVa+6d7rvzNepYXFG1R4T5INcWSVy6ydLzWyP4xLPf3ZEN///u90qFZbnuntk5JZ2c+S/bV+SDz9UiS77PlStgt3iX+U+fUElkv/1MyzCnw0sb0W1soI3/DGKkPYxzCVM+LvkWI4nJDb1M6dC0NbdR5P7GI0HKpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silicom.dk; dmarc=pass action=none header.from=silicom.dk;
 dkim=pass header.d=silicom.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=SILICOMLTD.onmicrosoft.com; s=selector2-SILICOMLTD-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71+YZbeRr+tR1jMVlWqnwUe4jxuqN4fvP3JzUuFl81E=;
 b=oqTP/hfRQXLmxN3PCMng6hpIay4L4PvetHZ9OswSWXKsc0XkalWW4X4YiUtAJE0rhzLZ6mB8kx+fX6MZGLN2vZ/D2Rl+zsrk/Hu9iVEnzG1oS0g+kku81T6HUvX9XOWKl1TemaDxkhXqdi6n8Ri7W4g5W2/C6EviRSPI4UXie6w=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=silicom.dk;
Received: from AM0PR0402MB3426.eurprd04.prod.outlook.com
 (2603:10a6:208:22::15) by AM9PR04MB7620.eurprd04.prod.outlook.com
 (2603:10a6:20b:2d9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Tue, 6 Apr
 2021 06:42:55 +0000
Received: from AM0PR0402MB3426.eurprd04.prod.outlook.com
 ([fe80::dd44:e585:43ca:77c1]) by AM0PR0402MB3426.eurprd04.prod.outlook.com
 ([fe80::dd44:e585:43ca:77c1%5]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 06:42:54 +0000
Subject: Re: [PATCH RFC 2/3] fpga: support loading from a pre-allocated buffer
To: Nava kishore Manne <nava.manne@xilinx.com>, mdf@kernel.org,
 trix@redhat.com, robh+dt@kernel.org, michal.simek@xilinx.com,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 linux-fpga@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, git@xilinx.com
References: <20210402090933.32276-1-nava.manne@xilinx.com>
 <20210402090933.32276-3-nava.manne@xilinx.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mhu@silicom.dk>
Message-ID: <531e5970-acc5-fc89-497c-cbff4259a416@silicom.dk>
Date: Tue, 6 Apr 2021 08:42:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210402090933.32276-3-nava.manne@xilinx.com>
Content-Language: en-US-large
X-Originating-IP: [85.184.138.169]
X-ClientProxiedBy: HE1PR06CA0155.eurprd06.prod.outlook.com
 (2603:10a6:7:16::42) To AM0PR0402MB3426.eurprd04.prod.outlook.com
 (2603:10a6:208:22::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.8.20] (85.184.138.169) by
 HE1PR06CA0155.eurprd06.prod.outlook.com (2603:10a6:7:16::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 06:42:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0ba247e-739f-4d26-23a1-08d8f8c73450
X-MS-TrafficTypeDiagnostic: AM9PR04MB7620:
X-Microsoft-Antispam-PRVS: <AM9PR04MB7620A3A07CFAB77092382967D5769@AM9PR04MB7620.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X4TPI0EuOZBoGe73LqZpqgsYLOacaFQCB93cJSy2+huOr5rybl4xGnDXARHWTvl3HI1WGubI7xIVbuV5ZQJu+vuyeV8B/OTNS9q03y2h5eXjgYlIaiD92mPnBp7vSJ4gRTYqBJWxZUnud0g/YVqkD5yQEC48QC+bAyjeVIbU0uV5VTd2skzs4U7DgpvPFiWNDZWDPoTvKU8zI3IgKmGbenIa1LA5Q+XcuN49B5A6fNQAOTBM7HLSGGSXrxfY+hfIyIunHEBj5ZFkH3FpFzgXCCMnT2miJkjlar2+muH+UuPmDJW9EDHNdKIPSCwLEmjrlwWW1KQA6G9WaMD5h0TG/t3EzpprgTgZanfP540HWw9qcqI+4QIRICeABOTRTD/e2Tzj8JpOCcl/NqWRVVL0g4P+TLbh774dGCk3gf+A2EKbB6p9iJSd0IsWpfQt1pJJkP8xnxE9IsC1zf4mP3+jj0+VxdisJaxdPkMYPLdJhUSJv2UZgysC5cayMrLFZS4KkX6dkjZlcDfMla7zfRyDXbTr5WN/uDzOSyIdHYleFKjpv6ZGU/syFldNyHR0E+SsRMFymq7uAUaWpIBwNikc94dRs2MdtbWVFnILA+zxmnj5HM2rgRZxHseqrdu8jNrp74HF4dCBH6topIqQhnUQoikvrzwil29Qv7E2K1N63YZmTL60S/DR2sFCej322q5xjGAzGjyVZeFfaKijVkF00hM3IS3haDAcXwS0UXdqTX4ckd+KDCRIIZVgnB3cSNzxiCtzzVl6f7PsdOkI/997uQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR0402MB3426.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(346002)(366004)(396003)(376002)(8936002)(66556008)(186003)(52116002)(2616005)(66946007)(66476007)(921005)(8976002)(38350700001)(5660300002)(31686004)(8676002)(2906002)(86362001)(36756003)(316002)(7416002)(83380400001)(6486002)(16576012)(478600001)(38100700001)(16526019)(31696002)(26005)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cWpSZHBIdnBZOVJGYkRhcHhuTE9MY2phTlVLR2ZNWWxkbHZGVzRFVThqVHFP?=
 =?utf-8?B?WDdRQUp3SUMvdEtXRndlYSt5VVRCLy9tWGNxTjRmZExDd2ltVGVQTnhVc3Iy?=
 =?utf-8?B?eUhZVmhxVUN2SHNIREdwa051RG9BbC9xWityOGFHaXZCMGV5UC9lZHQ2ZmZQ?=
 =?utf-8?B?bXZsRGlXeTZaOFZhSVVmaGtOQ2FsOGNsOXNEY3gyYS9QRGNua2hjcUdOTmw4?=
 =?utf-8?B?VjJxZndqQVdqaUdxQ3lNNHE0UGdRSmZMOHZFZzdycUVxS2FRTE8vcFduWFpq?=
 =?utf-8?B?Y2ZrSjRRRzNKMmNFQ1BBaGpzYVgzV3o5anE2dzRnS1BXZmJxamtOcHRKeDlm?=
 =?utf-8?B?VGgwUnY2YndhZ2kwQ1N0UnhHUDU3Sk52K3pLNmw4RnppRjBTWXM2UUhwZVBN?=
 =?utf-8?B?TG0rUHhUU0N5Ti8vRXQzVGpvWERPbmVaRVF3VktCUWJoMWJhbnI0NUtOdVkr?=
 =?utf-8?B?WnJMZ1NhUXNpdWwwN1p0R2h4WER0Undoc1dBN29FTk8vR2R6QWhwWW5jMlkz?=
 =?utf-8?B?YWJQU0FNbjhJMjBtUldza09oN1BsOWdLdjBVNUt0K1cxT3VuNmNvc3F5OXAz?=
 =?utf-8?B?VmxGY0JHMlMwSTB6dDYyL2p3eDZpUXNQa1NPeGxNWE5pcjBTZVEvNzNWUk1B?=
 =?utf-8?B?RFF4M0xBRTIrUXQxM0ZGSlRoRVNsSTJJcUdSZ0RiZmpOZ210YVdja2c1SjZw?=
 =?utf-8?B?WWNsem01aVY4QnQ4QjlCMU9kZ09PNWh2RXlkeEpRNTRDWDhnZGRZdUV0Skd0?=
 =?utf-8?B?ZzRsUkh0SG5QdHBWWlFFbFM5QmM1K2tFdU4vbVFZenl0cDNJUlQ1R1M0d2F2?=
 =?utf-8?B?dVk3aE1hdG54K0d4VGxycnpnWUhpMjRCNWpvMzNwYlNUNDE0enlSQm15OVUx?=
 =?utf-8?B?MUl5a1FZeVBpYVdQUDA0a3F1RHF0WFJ1SzhjaXZBclBVQUFkWWVKTVpjTkpH?=
 =?utf-8?B?VUJmekxTMWx4aitvUk51dHBycFVCWHlBZXNJNzBhLytsWkR3RGdkRXcyVm1P?=
 =?utf-8?B?ck1KMW1NcWVFUnNUaWtVTFRTR3gvTGk2bDRxMXZyNW93dHJ5cWh4L2RremxO?=
 =?utf-8?B?SzlXOE1jSEZjRlkxN2FhZlJ1TUVYSTlaY21MWUovSk1DSDFlQ3QxSXJ1WjBs?=
 =?utf-8?B?MWhMMFRFblRsbkF3RkZMZER0N01LRWhRekM4c2RxM013dnJzUkpXWFZ5N0hv?=
 =?utf-8?B?SDBYTkdxM2NTd3o2ZnFaUlZEUmVBakVhWDRZaGRUeS8rTUZ5d2xGMy9Gbkpw?=
 =?utf-8?B?R3FFOGVCNUk3TDN1MzZkSUZjVUlKRkJpNFVpTGJBRTg0TjFQWXhVL3BhK2N1?=
 =?utf-8?B?YkI1ZHIyVExndTNPMVV1WmYzb3FudVA5a3JId3lqcENZWnR5Mmc1MzZCM1o3?=
 =?utf-8?B?ZEgyMGg0RXl5OGUwbE9XQjhXUE1BYS9xREs3NkEwaURVc2t5UGFDeWljSFpC?=
 =?utf-8?B?eGV6SXJQMFhWQmFQVE5ZQlFoc2NFTGdoUDhoWU9FYkpzWlB5ZnI1Z28yY1hh?=
 =?utf-8?B?bW1FUWZzRnR6UmY3NVVoWmpzWDUvNUFDMmpaeTZYMzA0Q3RPOFRoamxuSkJK?=
 =?utf-8?B?WHVkMm9EQjBEZVh2TDhOeWQvWm4wNnRCRXU3UUQxcW4zQ2wwRmdSdFo5aUY1?=
 =?utf-8?B?RDk5bUk5Z1JqNk1VWFkzN1ZONXV0TjBlNUJBOTZSVDJpT1VIRE1oazZRdTRX?=
 =?utf-8?B?amFnaW43MTdpMlVueWo4bmFrYndlSnV0WTlxaGRjTUFFWVovNUVEc1lRRkN0?=
 =?utf-8?Q?ZT5CZC0v9TyE8nkXQCyP4p47a1MtF8KE+F+0W/f?=
X-OriginatorOrg: silicom.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ba247e-739f-4d26-23a1-08d8f8c73450
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3426.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 06:42:54.8423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c9e326d8-ce47-4930-8612-cc99d3c87ad1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9olqz/PeRgPEeIDnzaobtyMrM51VixwXIIr40jezlzYTl6R8TJXFNlScBvDG184
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7620
X-Mailman-Approved-At: Tue, 06 Apr 2021 11:53:50 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nava,

On minor comment below.

On 02/04/2021 11.09, Nava kishore Manne wrote:
> Some systems are memory constrained but they need to load very
> large Configuration files. The FPGA subsystem allows drivers to
> request this Configuration image be loaded from the filesystem,
> but this requires that the entire configuration data be loaded
> into kernel memory first before it's provided to the driver.
> This can lead to a situation where we map the configuration
> data twice, once to load the configuration data into kernel
> memory and once to copy the configuration data into the final
> resting place which is nothing but a dma-able continuous buffer.
> 
> This creates needless memory pressure and delays due to multiple
> copies. Let's add a dmabuf handling support to the fpga manager
> framework that allows drivers to load the Configuration data
> directly from a pre-allocated buffer. This skips the intermediate
> step of allocating a buffer in kernel memory to hold the
> Configuration data.
> 
> Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
> ---
>   drivers/fpga/fpga-mgr.c       | 126 +++++++++++++++++++++++++++++++++-
>   drivers/fpga/of-fpga-region.c |   3 +
>   include/linux/fpga/fpga-mgr.h |   6 +-
>   3 files changed, 132 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/fpga/fpga-mgr.c b/drivers/fpga/fpga-mgr.c
> index b85bc47c91a9..13faed61af62 100644
> --- a/drivers/fpga/fpga-mgr.c
> +++ b/drivers/fpga/fpga-mgr.c
> @@ -8,6 +8,8 @@
>    * With code from the mailing list:
>    * Copyright (C) 2013 Xilinx, Inc.
>    */
> +#include <linux/dma-buf.h>
> +#include <linux/dma-map-ops.h>
>   #include <linux/firmware.h>
>   #include <linux/fpga/fpga-mgr.h>
>   #include <linux/idr.h>
> @@ -306,6 +308,51 @@ static int fpga_mgr_buf_load(struct fpga_manager *mgr,
>   	return rc;
>   }
>   
> +/**
> + * fpga_mgr_buf_load - load fpga from image in dma buffer

s/fpga_mgr_buf_load/fpga_dmabuf_load

// Martin

> + * @mgr:        fpga manager
> + * @info:       fpga image info
> + *
> + * Step the low level fpga manager through the device-specific steps of getting
> + * an FPGA ready to be configured, writing the image to it, then doing whatever
> + * post-configuration steps necessary.  This code assumes the caller got the
> + * mgr pointer from of_fpga_mgr_get() and checked that it is not an error code.
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +static int fpga_dmabuf_load(struct fpga_manager *mgr,
> +			    struct fpga_image_info *info)
> +{
> +	struct dma_buf_attachment *attach;
> +	struct sg_table *sgt;
> +	int ret;
> +
> +	/* create attachment for dmabuf with the user device */
> +	attach = dma_buf_attach(mgr->dmabuf, &mgr->dev);
> +	if (IS_ERR(attach)) {
> +		pr_err("failed to attach dmabuf\n");
> +		ret = PTR_ERR(attach);
> +		goto fail_put;
> +	}
> +
> +	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
> +	if (IS_ERR(sgt)) {
> +		ret = PTR_ERR(sgt);
> +		goto fail_detach;
> +	}
> +
> +	info->sgt = sgt;
> +	ret = fpga_mgr_buf_load_sg(mgr, info, info->sgt);
> +	dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
> +
> +fail_detach:
> +	dma_buf_detach(mgr->dmabuf, attach);
> +fail_put:
> +	dma_buf_put(mgr->dmabuf);
> +
> +	return ret;
> +}
> +
>   /**
>    * fpga_mgr_firmware_load - request firmware and load to fpga
>    * @mgr:	fpga manager
> @@ -358,6 +405,8 @@ static int fpga_mgr_firmware_load(struct fpga_manager *mgr,
>    */
>   int fpga_mgr_load(struct fpga_manager *mgr, struct fpga_image_info *info)
>   {
> +	if (info->flags & FPGA_MGR_CONFIG_DMA_BUF)
> +		return fpga_dmabuf_load(mgr, info);
>   	if (info->sgt)
>   		return fpga_mgr_buf_load_sg(mgr, info, info->sgt);
>   	if (info->buf && info->count)
> @@ -549,6 +598,62 @@ void fpga_mgr_unlock(struct fpga_manager *mgr)
>   }
>   EXPORT_SYMBOL_GPL(fpga_mgr_unlock);
>   
> +static int fpga_dmabuf_fd_get(struct file *file, char __user *argp)
> +{
> +	struct fpga_manager *mgr =  (struct fpga_manager *)(file->private_data);
> +	int buffd;
> +
> +	if (copy_from_user(&buffd, argp, sizeof(buffd)))
> +		return -EFAULT;
> +
> +	mgr->dmabuf = dma_buf_get(buffd);
> +	if (IS_ERR_OR_NULL(mgr->dmabuf))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int fpga_device_open(struct inode *inode, struct file *file)
> +{
> +	struct miscdevice *miscdev = file->private_data;
> +	struct fpga_manager *mgr = container_of(miscdev,
> +						struct fpga_manager, miscdev);
> +
> +	file->private_data = mgr;
> +
> +	return 0;
> +}
> +
> +static int fpga_device_release(struct inode *inode, struct file *file)
> +{
> +	return 0;
> +}
> +
> +static long fpga_device_ioctl(struct file *file, unsigned int cmd,
> +			      unsigned long arg)
> +{
> +	char __user *argp = (char __user *)arg;
> +	int err;
> +
> +	switch (cmd) {
> +	case FPGA_IOCTL_LOAD_DMA_BUFF:
> +		err = fpga_dmabuf_fd_get(file, argp);
> +		break;
> +	default:
> +		err = -ENOTTY;
> +	}
> +
> +	return err;
> +}
> +
> +static const struct file_operations fpga_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= fpga_device_open,
> +	.release	= fpga_device_release,
> +	.unlocked_ioctl	= fpga_device_ioctl,
> +	.compat_ioctl	= fpga_device_ioctl,
> +};
> +
>   /**
>    * fpga_mgr_create - create and initialize a FPGA manager struct
>    * @dev:	fpga manager device from pdev
> @@ -569,8 +674,7 @@ struct fpga_manager *fpga_mgr_create(struct device *dev, const char *name,
>   	int id, ret;
>   
>   	if (!mops || !mops->write_complete || !mops->state ||
> -	    !mops->write_init || (!mops->write && !mops->write_sg) ||
> -	    (mops->write && mops->write_sg)) {
> +	    !mops->write_init || (!mops->write && !mops->write_sg)) {
>   		dev_err(dev, "Attempt to register without fpga_manager_ops\n");
>   		return NULL;
>   	}
> @@ -601,10 +705,28 @@ struct fpga_manager *fpga_mgr_create(struct device *dev, const char *name,
>   	mgr->dev.of_node = dev->of_node;
>   	mgr->dev.id = id;
>   
> +	/* Make device dma capable by inheriting from parent's */
> +	set_dma_ops(&mgr->dev, get_dma_ops(dev));
> +	ret = dma_coerce_mask_and_coherent(&mgr->dev, dma_get_mask(dev));
> +	if (ret) {
> +		dev_warn(dev,
> +			 "Failed to set DMA mask %llx.Trying to continue.%x\n",
> +			 dma_get_mask(dev), ret);
> +	}
> +
>   	ret = dev_set_name(&mgr->dev, "fpga%d", id);
>   	if (ret)
>   		goto error_device;
>   
> +	mgr->miscdev.minor = MISC_DYNAMIC_MINOR;
> +	mgr->miscdev.name = kobject_name(&mgr->dev.kobj);
> +	mgr->miscdev.fops = &fpga_fops;
> +	ret = misc_register(&mgr->miscdev);
> +	if (ret) {
> +		pr_err("fpga: failed to register misc device.\n");
> +		goto error_device;
> +	}
> +
>   	return mgr;
>   
>   error_device:
> diff --git a/drivers/fpga/of-fpga-region.c b/drivers/fpga/of-fpga-region.c
> index 35fc2f3d4bd8..698e3e42ccba 100644
> --- a/drivers/fpga/of-fpga-region.c
> +++ b/drivers/fpga/of-fpga-region.c
> @@ -229,6 +229,9 @@ static struct fpga_image_info *of_fpga_region_parse_ov(
>   	if (of_property_read_bool(overlay, "encrypted-fpga-config"))
>   		info->flags |= FPGA_MGR_ENCRYPTED_BITSTREAM;
>   
> +	if (of_property_read_bool(overlay, "fpga-config-from-dmabuf"))
> +		info->flags |= FPGA_MGR_CONFIG_DMA_BUF;
> +
>   	if (!of_property_read_string(overlay, "firmware-name",
>   				     &firmware_name)) {
>   		info->firmware_name = devm_kstrdup(dev, firmware_name,
> diff --git a/include/linux/fpga/fpga-mgr.h b/include/linux/fpga/fpga-mgr.h
> index 2bc3030a69e5..6208c22f7bed 100644
> --- a/include/linux/fpga/fpga-mgr.h
> +++ b/include/linux/fpga/fpga-mgr.h
> @@ -9,6 +9,7 @@
>   #define _LINUX_FPGA_MGR_H
>   
>   #include <linux/mutex.h>
> +#include <linux/miscdevice.h>
>   #include <linux/platform_device.h>
>   
>   struct fpga_manager;
> @@ -73,7 +74,7 @@ enum fpga_mgr_states {
>   #define FPGA_MGR_ENCRYPTED_BITSTREAM	BIT(2)
>   #define FPGA_MGR_BITSTREAM_LSB_FIRST	BIT(3)
>   #define FPGA_MGR_COMPRESSED_BITSTREAM	BIT(4)
> -
> +#define FPGA_MGR_CONFIG_DMA_BUF		BIT(5)
>   /**
>    * struct fpga_image_info - information specific to a FPGA image
>    * @flags: boolean flags as defined above
> @@ -167,6 +168,8 @@ struct fpga_compat_id {
>   struct fpga_manager {
>   	const char *name;
>   	struct device dev;
> +	struct miscdevice miscdev;
> +	struct dma_buf *dmabuf;
>   	struct mutex ref_mutex;
>   	enum fpga_mgr_states state;
>   	struct fpga_compat_id *compat_id;
> @@ -204,4 +207,5 @@ struct fpga_manager *devm_fpga_mgr_create(struct device *dev, const char *name,
>   					  const struct fpga_manager_ops *mops,
>   					  void *priv);
>   
> +#define FPGA_IOCTL_LOAD_DMA_BUFF	_IOWR('R', 1, __u32)
>   #endif /*_LINUX_FPGA_MGR_H */
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
