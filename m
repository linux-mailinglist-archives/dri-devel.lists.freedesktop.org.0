Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7013A3C847C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 14:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46EC96E247;
	Wed, 14 Jul 2021 12:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B3E6E247
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 12:32:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXWt0MgmPm4AhdqhilKH+QYIu1zAQsgBTPdAtNYbBRX8GhCma/7KcIZ1wK1aB2j/az873mILvJdOTzRKGpb+gTIYN9eTAIdYqLiQIGw14FVpkj0aNjLK97Uc/rwSoSnVqO6qu2Tthtg6bh1eF/DKVs2x675csJkmWFkpJR52O5CY5jXDur40CGunbHLDSHIQkHpGEnNJR+iE5lofWCVUL+w5e1vb/GZaB+C9iOjM8eTUznoel9u8vNyzCflEnnIUI9K3xB7Ca1sLeTwsGAhGfayuDRqaWM31cbYmpmdO08rxN4TpfuibC/7WnzbGGv0+bQWcKiakhdWM9fs42/5XRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuWhhM2N7H/uikFHmy244QjVvvtNK3TA3bKOldIpRMw=;
 b=Yco/4RXU+FNoe7FtAFler3VDLMQL0Z89XA1XPQ/qZab4iAxLuyecwmuYZATjCKfgBRXn4XsI4g5HiUwu9pdYu5oyprGQhEec+Ww7HokrvDqLd7dahtJgeGIGJH03Uet8HiShCky16LVNOaobgf3mVFKchXMfqnBt2XKZh9wB66+9RcjRQ7Z/a1+UbkR6DkWV91uhQRRXhJTC1UHDiq8dBqmz1rTWpT3v7e3Rbl2vX7JyvGBhz59eyo2rtrzLylqPnAFvI7ifDosLA4OeOcNcMAqce4rjqBAh3IwgbdNtKan/okDGGEMQs9fmBL9WCNurGVqt4yYGwL8oDq2WtXJKeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuWhhM2N7H/uikFHmy244QjVvvtNK3TA3bKOldIpRMw=;
 b=nMCqwsJFe/TOYmPtUJ4WVuDrNApu+wmaJrYDP7dvUI6uaLbGvhWsHHAd2Hn0MP2liQUgm1dEDj6Q6qMFKD8920kluD7ifbqOuZthiA3lbMZZB3cf4Gj6yfmCbqgXI5qg3Ubgsz2NsmgBcafpvOodpP5Pf/YfOaqorYVgbAeZJD4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4301.namprd12.prod.outlook.com (2603:10b6:208:1d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 12:32:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 12:32:19 +0000
Subject: Re: [PATCH] dma-buf: support users to change dma_buf.name
To: guangming.cao@mediatek.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20210714122954.71931-1-guangming.cao@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <90edae11-e3d8-f605-43b0-ca4e5a70e0fa@amd.com>
Date: Wed, 14 Jul 2021 14:32:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210714122954.71931-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0P190CA0007.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc]
 (2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc) by
 AM0P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 12:32:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 036eeb74-b6d6-4e68-bffe-08d946c36bc3
X-MS-TrafficTypeDiagnostic: MN2PR12MB4301:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4301D83F2C7A8D19F9AB684E83139@MN2PR12MB4301.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZOTogUiBZfrOZSkDqLXJL+FESI4/CFcevcTLQQLYhXL/Wvgtllq5L53zcFjHdTioOWxMLDh8Py4XzwwMwRa1pYWUrgtHZ1dNdHGQpGBN+nVSm3nAra0bCA7/4OSmN1SSYv9mm1i9iUqgmNFhO6gT5tbesF3TLv6XOG2kA8FV04yqXIQQrAXwGsB1NKEkdB2uhYa5adgbIRN0wxJoWT3+1zXiaJjrYluEmBihnO4a1zeBfT5tY6jHxEDIR1Mo6tlcGbvoLcyYxzPjQNR4E9mJ1JDyjUD9OvZHIgz5RwJ+A19KDB2px3kiPq9+TAG4WNJKAbXB0bUgu8VGSm7sgO8fk/Ijnxg2qptDSo542G6WMcGGHnLZdD2PglWa8g2Vn9eiM3gbNEKdPbVpAAo3LESoX7Vy7ppa0YCEsaWDyAmcRKuk6+u5RshcKT6GG2aHygqc1O1+U+x3YVs2DXmnprOHZY4PIYVNmU4MI5onL64N4GAU+UdTKzG6wusz6dLgdYEp6p2hLVCVbIqvbXFy+AppSP/Q3SFVZH/l3Xc31K+rLEFAbZe6N4Dk7LYhG++kfjhZZSVPN3C89TH5nZ9mGsXFeuPJOTihB5RqTeIwdKDY4BW9Zc87wPqmQ1NgnKeT1z5/F1I9OvbSOsQYp83w7/HeZITzzIOAWp/e2PF+JJR83mZZoDkDDQQeymiWHzd1yEkCB+poECyuF5is4l4YNr9keEqYTmeL3Im1v3ybAsxRW1SG6fjs1w8ejupTrHHYUCQZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(478600001)(5660300002)(36756003)(186003)(6486002)(86362001)(8676002)(31686004)(8936002)(7416002)(2616005)(66476007)(4326008)(31696002)(66946007)(6666004)(2906002)(38100700002)(66556008)(83380400001)(316002)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2doNDZyUldGdTlBcnFPVlU2MkhNaHBhT2t0RXBObEZ0ckY5RVhEOHhqQ1J2?=
 =?utf-8?B?MXk1b0NnTTJ6b2FkM3NQK2tnVUt6RTVqQy8yei83WHg5TVJjdXlOM1RJMXVx?=
 =?utf-8?B?TnRDYkJwM2VLMm54UHVtQnkyT3lOdVI0WWJyLzRTc1hONVJiM202eHRlbFVu?=
 =?utf-8?B?eHZsSGtUNzVoNityemprVzVQcXRILzc2S3E4K0xBdmw3a1grVWU1YzhFVnpm?=
 =?utf-8?B?STdUMzdWNE9IcGlkSTdZSXRIanlZb1NUUkRpYmtpcHVWZUF1eEFYdmpiZmdV?=
 =?utf-8?B?MTIvNTNCMm9Rd2lqaEhrUjV1ZkxSaTNDV0J1VXpiNTZsWENTYk9Edmg0R2dR?=
 =?utf-8?B?Mi9GQXpoRUVyajFYRUl2M3Jub2NIUjlpckp2Rk1KcVdIQlJzSW42SjMyRmZQ?=
 =?utf-8?B?QmtmRzJrRVhpaTVYZUo4M2p2dit4dUxaSUkrWGVaRVpYWm5pRzk2UjJQZGxj?=
 =?utf-8?B?OE5vcGRCdDhaMGpiUys1dEErcDk3S29BSnNSa2lIdXduUHM3MFVGTk5YeENj?=
 =?utf-8?B?dEtNdTN1djFqRElSMUFuT1VaODN3NENyZk96L0t6U2pTRGpMN1JaYWdoaytP?=
 =?utf-8?B?RkQ4aGxzM1V2ZldXMElPdzNrMkFJNHgrbzBTTFEwRHU5ME95eEVxYVFMbmhV?=
 =?utf-8?B?TllQcWtzLzYwclM1TmtpcW5LOXExUGVPQm9xMHRrTkUzQ2VRNEk1NnV0NEF6?=
 =?utf-8?B?TExjUkV0TnFOMExVRzRLN2FnakN1MkNjNW1iVFRSZVhudWdGOEdvdnltNFpK?=
 =?utf-8?B?ekJUOHlRRDFNdmgyMzU3aStJYWNtVmw3MW8ycU5FSFRBa2gwbXM1MlFPSTlh?=
 =?utf-8?B?NU9RZXNTRkdiU3l1QTRoMmNFa1hab2FWaU4wQUQzbEhENXBjYXluc1NURjFi?=
 =?utf-8?B?V2g5S21TSThSYnhvK2ptbmtUaTB1OXU0Vndrc0p3T280aEtMMmxCNHdxT3RE?=
 =?utf-8?B?d3VEVEVpM25OdlRIN1A0QzhhMEE1eGlNdVFyU2xnY3BOck91MFV1UENDTFVI?=
 =?utf-8?B?TThCS0Q2eXhrd09uczVyMnNmaTNyU0lpcFFPQTNKS0ZOVlJ5Vzk0U25KQjhK?=
 =?utf-8?B?VzZzbDBDcE82dklhTEZIdktscnBoZGVQU2hBM0ZYOS9oRml2bW5VdEhiZXJr?=
 =?utf-8?B?aTdFakNER3pRTDJYY1Z5bEtRM1U3eXZsaEE3UEZnZ1J1dktXVHRQYmR3WnM2?=
 =?utf-8?B?N0grOXIzRmtLSTRWbXdCOHJuRVdLaHNuSHVKOWx1SmErYURmWmlZWkowdmpF?=
 =?utf-8?B?NWp6R2UyWktCaVVpN3k0cWsyblVSMXgwbzRwN2lKcC9pZ1RFcjY4QTJtaE0x?=
 =?utf-8?B?S3Q3ZWI5OUFXWmFFaXJqK0V5UFFZS2V0aFlZd2h2cnRWUkZqSCs0VkpKaThR?=
 =?utf-8?B?OGVhTXlPWU1BTUdVNUgrd2pwYytrQ3RicC94dkhob3I0eEpVUWZ5RG9Ranhp?=
 =?utf-8?B?aENLc1Rub0Y1YkoyNXZsWG54T2o0RWgvVDV2UGpnSWM5RDZiT1Erd2l1UEZR?=
 =?utf-8?B?WFNNdjBvSmFvVmhVemZqVDhzaVlJMlE0dDVKdVZ5OWdKcVZQUWsrY3lzYXVo?=
 =?utf-8?B?Um4xalVEWTdUMUxmTTZVRDJLTXZ4eFkxK2VXZ3NKZGJjS0Q2Ui9Iam9YZGU3?=
 =?utf-8?B?NnRGU0RERktpa0JDZkxuaVo2cUJPditpa0FnL05mZzRnWjBvUUwrYjFvZUZQ?=
 =?utf-8?B?WFFiK0FHaWlhTzIrOWs3TEtreVFkdEdOZWZYZFNpbTlGZktCa3hLWjFBOXpx?=
 =?utf-8?B?UEpZL0lsNkIrazk2d0Zub1J0UmlYczMwRkNmNFdnMThoMDJ4RHNYVGZOM0pB?=
 =?utf-8?B?UjNxQzZ5T2FRS20vbU5la3lDNXRVZ0pIWS9aN05sR3EyVnVTZjc5K2tyTHcz?=
 =?utf-8?Q?wsG+/3LEMrnRn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 036eeb74-b6d6-4e68-bffe-08d946c36bc3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 12:32:19.2132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9MI8N9clWWWWE8yTJY6ghSoDW3TlOvky0o6f6DhVexdiGywJwyhsLMokN/3BRMv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4301
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
Cc: caoguangming34@gmail.com, wsd_upstream@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.07.21 um 14:29 schrieb guangming.cao@mediatek.com:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
>
> User space user can call DMA_BUF_SET_NAME to set dma_buf.name,
> also add a kernel api for users to do same thing at kernel side.

Well if you want to add a kernel API to set the name you also need to 
provide an user for this.

Christian.

>
> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> ---
>   drivers/dma-buf/dma-buf.c | 28 ++++++++++++++++++++++------
>   include/linux/dma-buf.h   |  1 +
>   2 files changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 511fe0d217a0..949af232c644 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -331,20 +331,20 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>    * purpose between different devices.
>    *
>    * @dmabuf: [in]     dmabuf buffer that will be renamed.
> - * @buf:    [in]     A piece of userspace memory that contains the name of
> + * @buf:    [in]     A piece of memory that contains the name of
>    *                   the dma-buf.
>    *
>    * Returns 0 on success. If the dma-buf buffer is already attached to
>    * devices, return -EBUSY.
>    *
>    */
> -static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
> +long dma_buf_set_name(struct dma_buf *dmabuf, const char *buf)
>   {
> -	char *name = strndup_user(buf, DMA_BUF_NAME_LEN);
> +	char *name = kstrndup(buf, DMA_BUF_NAME_LEN, GFP_KERNEL);
>   	long ret = 0;
>   
> -	if (IS_ERR(name))
> -		return PTR_ERR(name);
> +	if (!name)
> +		return -ENOMEM;
>   
>   	dma_resv_lock(dmabuf->resv, NULL);
>   	if (!list_empty(&dmabuf->attachments)) {
> @@ -361,6 +361,22 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>   	dma_resv_unlock(dmabuf->resv);
>   	return ret;
>   }
> +EXPORT_SYMBOL_GPL(dma_buf_set_name);
> +
> +static long
> +dma_buf_set_name_user(struct dma_buf *dmabuf, const char __user *buf)
> +{
> +	char *name = strndup_user(buf, DMA_BUF_NAME_LEN);
> +	long ret = 0;
> +
> +	if (IS_ERR(name))
> +		return PTR_ERR(name);
> +
> +	ret = dma_buf_set_name(dmabuf, name);
> +	kfree(name);
> +
> +	return ret;
> +}
>   
>   static long dma_buf_ioctl(struct file *file,
>   			  unsigned int cmd, unsigned long arg)
> @@ -403,7 +419,7 @@ static long dma_buf_ioctl(struct file *file,
>   
>   	case DMA_BUF_SET_NAME_A:
>   	case DMA_BUF_SET_NAME_B:
> -		return dma_buf_set_name(dmabuf, (const char __user *)arg);
> +		return dma_buf_set_name_user(dmabuf, (const char __user *)arg);
>   
>   	default:
>   		return -ENOTTY;
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index efdc56b9d95f..e6612ab59a59 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -507,4 +507,5 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
>   		 unsigned long);
>   int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
>   void dma_buf_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map);
> +long dma_buf_set_name(struct dma_buf *dmabuf, const char *name);
>   #endif /* __DMA_BUF_H__ */

