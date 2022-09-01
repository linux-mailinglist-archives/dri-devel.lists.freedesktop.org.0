Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C9C5A9151
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 09:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A458210E639;
	Thu,  1 Sep 2022 07:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C9710E639
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 07:55:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzGi1YkmJo6K2bY2Y0Vm9jMOK5gOrOIwrMHvMctWmMGXbFSZ2zPE62A9nNm/oV+c0M272wE/6B/+UwXFG2NyKQdDeSECYSAPOG69WclQrKlc5QetCcReGxlfhCJUV8JiZk+QfszJqQVivY7Kh9nC0od90EpHxcxJFrHVsb+JB8tGYrNuUw+F3DPgMKgc2B1QsPuke5tc8eHXomRUBJgL60m3hOMekcPJlHB4SaCC5lmxDU0C6fXOtc5gwVatrABb1+dNmI8kDMalBpWcv3QoFjbvHr9pLRc3edZopPjHSrfTkq+PeXEeOKsvPIbBBCLxxyA6iAVZ7GUS1RZPBUln+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtdrEsDsacIsMCW+kPLeHjwTwU29aC6k77pV8dJme78=;
 b=GfCQkqfUbv6NObv0iMt9NCAQ0riL0a5zrOEPkpLBZ+jmGIMG6n2bLpinyWMXxDX/qvpmAlZV/ue4wNSvcNiMsb/TIhtg0iDllUd4MVfI24/kA4kH4YYEvaCTNUVSpOKszpl9Xj3cxFmUX8boFABPIkD/fCPkHZHA3v44Fbee5lzaiqO2VpqUpPbT9jNo7w0pFRIf/36iMXKg6rrWJsDLTwtV2J2l0uZJyViZzFHueR3YvdaoZlyqVz5znBWrtej0iTYMpnn2BMGgVw72F0mUYKGSCnSxvdUnYgV097kYyqm8Qihh32khG0r0VN4HCSh2Kw2q8Zp4K82fzUmq1qy3vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtdrEsDsacIsMCW+kPLeHjwTwU29aC6k77pV8dJme78=;
 b=14AveDDtorHnh3UY6IhHWLBbq3D9zBQnbbm9lw8i6pR2qJudBVdGqJlsrRaQTyjT+MixspMMy9N6ie/MGlU92q9VCARGnw73AbckrmzghCJwa33WXwZOPPxcHvOlQ1FXrqp8hPseXZ+6fxBUFhuGT+1qIUCNW7MClT8n9Ha8PxA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4268.namprd12.prod.outlook.com (2603:10b6:5:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 1 Sep
 2022 07:55:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.012; Thu, 1 Sep 2022
 07:55:14 +0000
Message-ID: <18b3dd75-7995-a2a8-372b-1fd5838dfe1d@amd.com>
Date: Thu, 1 Sep 2022 09:55:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/4] dma-buf: Add dma_buf_try_get()
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, dri-devel@lists.freedesktop.org,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>
References: <1-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <1-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51b1847f-e04c-4d55-98a5-08da8bef4d6c
X-MS-TrafficTypeDiagnostic: DM6PR12MB4268:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B32TyWLE8BH7Qv2uSblS2IxuO5xUKZz5dFoFa2hs5OGlSuM8JrFQHh/bYbdZt4AhIUI7F0xrWPuF9nfUHdi2rsBXxEyuTZoHsiLsbUdNclsQ9+a3mWS+2FQsyIVtcM+smjnCuKIUsxFyV0iVXd7N/YWYq3zhvl/W66YO24K2ESbP+M4UrnWgrNK6EgHhOzDSjBiKiHf5pSC6jFeDCHrASnsRGUQIqMLaUVWfoRHPLB31O2OUIq50yjJ7vb64+OSuXVUI+7HEIywOwEpDEHkz/43R07IUZdYgJs8KkmhOj4eESCDQwVLDkQLwax9lp7uNwzYSgi0JdK+hjy+ddMuMb1iv5NbzDGzKV396Rr7wnxymny1IoONIlY/QfxyInMWdxUmZGc1zkCaSSSeGcecs9tkTX8pFBhRshN0MfY3/OpJvBhNC2yWncacktirNcYwirtxIFHKTn5r9ppSPVYmvQ1ffqJLObttGpUsBL6wjXmgL2dvDUevrxMKM2adBaTJNfhsU71NlTpRD1X/FkfRZjsZvCbBoooO3YTsokrkd7y/IIhGuQaTrGrz0ZYZIDVsLhlWweFlmrAnjDKGtKxt+XVOMujAft8RAJVR/UkausBw5QPIB+o86MRQiFVaDQxown7zbYoX4Lcc/xlEjMyqB/zs4Ebv2NQ3899BpbpHjLOkX+pldmTakynWS2kQY/VNF6DPxSTFT6gvDqNgSCAeJh60++/IGfG5Qe7PS/ms7ASpaF/FtqPmgnFQpBfj6LfECjbKjTxdHAK8pvwvH5qF5qL4xKLGh6FcZjNm2WJ9W/uM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(31696002)(83380400001)(66946007)(38100700002)(2616005)(66476007)(8676002)(4326008)(66556008)(110136005)(54906003)(316002)(2906002)(8936002)(7416002)(5660300002)(6506007)(26005)(186003)(6512007)(41300700001)(6666004)(478600001)(6486002)(86362001)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmhHV1NKQ3F2eXIydUkrUFA3SFF2eVkraEhKWTVDTG1vNFJBWEU5OUpNUXNn?=
 =?utf-8?B?YzRHYXQzNkFXelNNaUZMcE02SEVKU2RvMnUxamdkTkZqeEI5RHhRTk5jQlZ5?=
 =?utf-8?B?TGZLSFJXWHExUG9Edy95d211ZXZHM05uVGNBdXd6emJhazIyemtkZmNpRFNW?=
 =?utf-8?B?MGhWZFJXeWRBZFhYNzNzSENnYWtQakZ3VVIvK0JCQ0wvSzJzYlJJS0xCOVRz?=
 =?utf-8?B?ZHZFL29QazJUa2pNR1ZweW5VNzhHRTA1M2VZZFRUVFdlSUgxS3Z5Ly80ZUwx?=
 =?utf-8?B?MStoMXlnUlFsYzhuMUg1SW5DdmFGOFJ5RFJlSFJSc0EvKzBwaitsVmFsb2Jy?=
 =?utf-8?B?dm5vb0Y5YTFqdW5aM3NyM20vQlltU3pzdlY5am81ejd1dHBFR3dPelVJTVJl?=
 =?utf-8?B?MUFEOHFxSHljNXVyMGZPaGZ5N09INFZnYnlMalBaQTVRQXI3UkRrb3hzb3ZB?=
 =?utf-8?B?S09MVjV5SUx5SEoyNHRrTThraG5jMVdheUorc3ZDc243dUlITEJRcVdPcERZ?=
 =?utf-8?B?bXlHNXlmVkNrZG10U0hWN2J3QnRwWVJ3L2F4bnpEQ3pmbUlNMFlqTXo5Qkpl?=
 =?utf-8?B?aUtIalNNV1F3NERUZ0g0cjFacUhSYXJzeFBFelZnc3hFMFFINzdUdHV2bWdh?=
 =?utf-8?B?bVV4QURzYmREZmNsL0hvMmZFdmVweXk0bk0wQWJvOUUxMmZQeDlLbFNTM2Qr?=
 =?utf-8?B?WVdKRmxZdGhjTzlVd1pBYjdiYmErL2ZkRllEV3VROGlDYnlPL2JUK1gyK3E1?=
 =?utf-8?B?RFVKdVFIQytqRUxzc2FzbWI1djRUMzl4QWRPa0FMbDg1QWcraW13Zm41dDdV?=
 =?utf-8?B?V2dTeTBybGw0dU5OdS9vb1VTMDFDR3FaVXVhaEIvVzNDSU5CWWxxTGJNUWZp?=
 =?utf-8?B?Y1JQMHpILzJ6ZmpCWUwvVnFYN0dnVktlaUVTT3VxdVc0ZUFRWXZEVmhWM1ky?=
 =?utf-8?B?SEhTZlRuRWdTRWJ2MUM1anpqRFVwd2drdkl0YVdGZ2dYanVtRC9ncUgvVVNM?=
 =?utf-8?B?dmlQME1CUHRhN2lNbjBEa3dmWEplVmlxS2cwVFlpbHh6aUROZUJWVWFHblZi?=
 =?utf-8?B?ZWdaR3JmbG1CSDBaSjRFcXFtMUJqRmttU25rcVVoMzRjejVNN1JTUGdkWnl3?=
 =?utf-8?B?aVdJOFQ2VitRWmhBdlhIV0ZHQThiVFJobVNpOWV1N09DU2NZQjIwK08xdlI5?=
 =?utf-8?B?aEUwQVRTMUJRSWZhcDRhNXBnKzFBR0xna05DY2I2S3ViU3BmZC9EL1N2YkxE?=
 =?utf-8?B?MjF5TU9LWm5namRQNEpDQkJvWXBFUHlVaEZ2TVMvWTF1ZUVQSDZwZGUyQnNz?=
 =?utf-8?B?dkk1d25mTnJudW9tdUZEMTUzT2o1cGhrdnBqY0pkUkVrUi8xeUV4TnJ6L2pV?=
 =?utf-8?B?UEdON0dvckhVTC9PcU1vakQzYXdlaUFIYkZjbjhSVTUvRjgvMkFReFRsMGtN?=
 =?utf-8?B?Z3FEa1hQTXlsWW1PWEpGc1RqV09nZlVON2xGbkhDS3VRcWxoRkFaSHlySTha?=
 =?utf-8?B?MlZldlUxeVFxQ0NGZEF2OHN1eWJsTk9zWGlCQ0R4TGR1bVZQVTlhSGphSmRB?=
 =?utf-8?B?SnJDMzFOWmdiaTl0VEhuL2M3UW80LzRCT1JJNE9vRXpOSlhMSDgxQzdmV1FQ?=
 =?utf-8?B?ek5iSDA0bjNwMU00ZWx5Sk5jQVU0bE5TaW40SUVwRUZOa3V0aFl6TnZPUFlH?=
 =?utf-8?B?V2g0Yjl3TEt5QXlOSXZBM3RHcktOVVZJS1JlWFlDeVFNRlZoWGpXUDZFSU03?=
 =?utf-8?B?VmdIU0hVWVB2Mi9NVzhGNmZ3djg3QkxyZWRyb1V1VHBOTWI2VjNNTHhFK2g2?=
 =?utf-8?B?OUFRMHFuSk5sTU1nYlNzN0NPR1NDeWk4ZVlaWkkza0xMSVM0M0hKbkplMEo5?=
 =?utf-8?B?YXZGN1ZXU1RCWTArck5JMVJHYnBnQkoyNXVkRU9lelZ4bGoydC9rWVZUb0tv?=
 =?utf-8?B?aGlFTEFHeWlDMDJLOVdqcE1ZUjlMVDYwNjhCUTVZTEwybEk0cmtFUzhPeldS?=
 =?utf-8?B?Z1poYi8rdGFNeXY3Wmhad2lMRnF5a09lMDZXVTNHYUxCc3k5YmRmOTh5VWhh?=
 =?utf-8?B?WmNwajRtRGsxWWtValk4SWVremFtRHRDR294V2E4ZkNMRnpjZGh1aG1PbzVo?=
 =?utf-8?Q?99LOt9lSr8D4PWskZs5O/Y/Qh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b1847f-e04c-4d55-98a5-08da8bef4d6c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 07:55:14.6253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oR4Y1MhJuB9SUFS9JlZKhXG9lKO8OWUCLE8YsgxSgUnbrdsufdIOLgusvV1vwTTs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4268
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Maor Gottlieb <maorg@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.09.22 um 01:12 schrieb Jason Gunthorpe:
> Used to increment the refcount of the dma buf's struct file, only if the
> refcount is not zero. Useful to allow the struct file's lifetime to
> control the lifetime of the dmabuf while still letting the driver to keep
> track of created dmabufs.
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   include/linux/dma-buf.h | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 71731796c8c3a8..a35f1554f2fb36 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -618,6 +618,19 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags);
>   struct dma_buf *dma_buf_get(int fd);
>   void dma_buf_put(struct dma_buf *dmabuf);
>   
> +/**
> + * dma_buf_try_get - try to get a reference on a dmabuf
> + * @dmabuf - the dmabuf to get
> + *
> + * Returns true if a reference was successfully obtained. The caller must
> + * interlock with the dmabuf's release function in some way, such as RCU, to
> + * ensure that this is not called on freed memory.

I still have a bad feeling about this, but I also see that we can only 
choose between evils here.

Could you just call get_file_rcu() from the exporter with a comment 
explaining why this works instead?

That would at least not give importers the opportunity to abuse this.

Thanks,
Christian.

> + */
> +static inline bool dma_buf_try_get(struct dma_buf *dmabuf)
> +{
> +	return get_file_rcu(dmabuf->file);
> +}
> +
>   struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *,
>   					enum dma_data_direction);
>   void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct sg_table *,

