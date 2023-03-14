Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1850C6B9283
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 13:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF9A10E78E;
	Tue, 14 Mar 2023 12:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E24F10E799
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 12:02:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPOXgkFZclidu6iFRiiDzLNn/a7K/xrMqumORiVp7SwA81enOEBrenQLEJLVD400kd4h5aol+yL3gbaKAZxx0SEuVRibQ48mYIVd4EWdmjR0U3NlS5F/I3ZzkDm4Lf2eB0MQ8cPuownFkEc8yD/lJydSx9kesKU+vsxO1Ix/Yhws98Q80MY0H4gvj5ptNO371TZl+NdRp0eUUH49tT9FJiJlcu/zcfGn0bPXMY5CQGbBN2FoRdVjaIhxqMs+WEJHgDYEglVlyMa32zmVo0CJDlw2SwHIQBf4quLAWSEko3JMo06eFWmBla9+kpGVvLsdocSu1PxqgnwMzGX0PuLdmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQkltu0ZU1x2ubggmDDJvQlnpxNElI3Y+nQMp87uLAg=;
 b=l4vLZbBaPP2ZsiSbKvfzL9aPg5eEQVGB4HDaCdyITAs4jC4RbqA+Jfvh6Qf7YadB+uD74d0nV7vZ7cnkshKDH3WruxI66Vn2pxa9Ri1xbkqs643TarRYwB5UipwjjGdJk5PsYYBiOjlzxaXG9MV1A5o8HKc767+AddNx3YrcXVVjL53tuPmnnBK4VXFTwgekxH4rjL01yb71BeiU8WHT6g0aALsmR/oWplqGflyo9Pji3CDkzwt5HrA5I5XzLbopxlPqAzZKTcKOYc04e0qwI/zlatlc7+C9H6sdjH8ptgOtWJsyqNcRwgm4naL4vul8QsrLLReLMZljn6BJt+irwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQkltu0ZU1x2ubggmDDJvQlnpxNElI3Y+nQMp87uLAg=;
 b=ks2gIPzTEB33zCb8q8clk10bKoRKLNWOH4EalluGO2/+IQcoj4xEtkCUaPLdISoCK9JwY0sI+lkpZIsSMplUIaLJsfGw1Iozq5k9RAuCGhGIcfbabHSbesZ37xfS/3/DmRgDoFF75Lfzs824sGEKXiZA09gAkgRkGBgcYXnCa3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB7426.namprd12.prod.outlook.com (2603:10b6:510:201::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 12:01:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 12:01:56 +0000
Message-ID: <777b760e-a9c2-cf46-c7be-26a4bcf633ab@amd.com>
Date: Tue, 14 Mar 2023 13:01:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/2] usb: gadget: functionfs: DMABUF import interface
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20230314105257.17345-1-paul@crapouillou.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230314105257.17345-1-paul@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: bf2a308f-d773-4fef-4ec6-08db2483e867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1d+tjxqT9EjURiCNQ2+WybwU86WcOCb8VrugG/Pkl4cJMKmg8FHBmnadajnpyKvJzYWGpJCvJlzeieq4+mPPT55WG6IPXWh50NMwxqnGUmhk7SVBDpPyvS4Ia9EwtUWDy3q5hmBuK6kqJTFl/hJiTkpE+N1tt6uTgNW6YRWme61/yyrrq0Hk+soZXUrjieB0Kx12cOipdOxTmG97rwc+Ye0t6uesWKjuifrJWfwAD6XEIedQ+3xOMXfGyPPuoql8gdraiotCbEqPawyc5hnb5MziK997ZGC832Er8EcpBj8/yNd3Bkmh73PnVjvtM4kNgsIUZfrdODMpTRuEjljUk5Xy7kkHA7gYYC+91CaeFd35gi91wSru2rXdBdrO+Csdn4z/acLrY6wwewvo5sxXphhN99SGNQc36HnUasyMpMRXOfLdvGjHWdeYGraYvH/Tx/KN5KLMXbVeqyd6yBnLOswqBrPQrzoX3cnJZIOuilM1Unln+zEQLEdcCKMkYlZan5I1hLijF21r2e1M4JBhF8Dy2XNrpl1ZsOe9XgfFKToTC0j8q6MAxr/QWMJ7f5yyOJpmxR7n85wJbmHs++38MO8AC3904u6FeZJqE82FxGVJrx4P3V3xIygds7F3b50wvEp9SKS8G3OiMhGWrt7qK2LbFnTKpATTQXCwCmgCPqzHFlqBHZuEiH0qPAVBApQjwvaF9kHomf4YWwMo6FdgapZJym1WY7GcNihOc8tVvNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199018)(66899018)(2906002)(31686004)(83380400001)(36756003)(5660300002)(7416002)(8676002)(66556008)(8936002)(41300700001)(4326008)(38100700002)(316002)(86362001)(31696002)(110136005)(478600001)(186003)(66946007)(66476007)(6486002)(2616005)(6512007)(6506007)(6666004)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2pKaGFHZlE2cVlWSXJnZi9HcjN2ckVsYmxVdHVsWHZ4TFBEVWprNStzdjhr?=
 =?utf-8?B?MFl3UFhiMWEzVWJJeXdXMlVmbXY0ZmNXS3Nhc0lQY3N3emt6Y2dXbTF2S3hG?=
 =?utf-8?B?SU8xRmpQT3pKeFRjTlE2SDJGdi8wdTVsUmhVTmlOOGZRZVd5cE8xSGk1ZUh1?=
 =?utf-8?B?ZngvNWNiZlF1NThBVFQ2QW5va2tIcnl2WThPKzBBTXd3RjQwWlBTbWpjaE5H?=
 =?utf-8?B?dGxWeE81RVpWRmQ1cjlmZXNoZjVNMi8vOGwxNklCcjNVcnhESFFZeS9kaE1J?=
 =?utf-8?B?OWp6TlArd1M0ZEY3a3JOTEtjSUlPMlpUU25RaVFlKzJHcWZvVUtoUWxEMGhw?=
 =?utf-8?B?b1UycjI1WVZrQlg0QmVQbzk3MHFKNVJhVmhZUjEyaUFSOGFVY0JxQUJUemll?=
 =?utf-8?B?QkxFcVBuQis3blNOWjl3K1YySmRYVU41c2lEVEVQd2o0ekNCT3lNMm4xcU8r?=
 =?utf-8?B?VEU0N01lZmtncndGUENFQzNQQVBuYzdINEhIb1RBSFJhNHRoa2NzSjZjY1hO?=
 =?utf-8?B?TXg0SVRORElrbDdlL3V4Rk1UTmFVWk11MytnOEFCQVNGQmdCQVYxUWZmcGVT?=
 =?utf-8?B?bFl3SFkybzR3WFdabCtzUkw1dDNpQ1ZwWlh0VXh4dkZsV2NqTnM5a3FoTUQv?=
 =?utf-8?B?WTRoK2c3TnR3MmlLV2FmYXVrZ25oakVsRCtKQ2E4eVE1aDBqNTZQU1FMaHZO?=
 =?utf-8?B?cDFIWjN6eVhEZk5NRnAwdEFGdElMV29zSUJvRDFmWEJERzAwU1ltQ3dUTzVR?=
 =?utf-8?B?ZG5HdGhtMExXQmRTc2tIRzhaY2tiNlNabmZGNW9pSzJVeWJKS0pKK1hvQnls?=
 =?utf-8?B?T1NHQzMreEhPOWxKa3RldW9pNkh3QVcvRXlpbk5md2FJaWQyNGFsYWVPUWhK?=
 =?utf-8?B?YlduMzlrRkZFandMWUYxbE9ZVDRhNENiNlIxTXdjeHhCS3BYTm5MbFNVdHdU?=
 =?utf-8?B?T1d6ZUROcGxaVU9pL3g2WWMvczE4eXhuWE01ZkVjb24wWkhCUzNMdDIyWDJZ?=
 =?utf-8?B?QThtRkcxRE40bXNpL2dCamFYZk9ReFBjbjlvY3A4TGJ1bVhYT3BLNmxYWE9L?=
 =?utf-8?B?TGh2L0Y2ajlhQ0pFL2pTczFjSlZWa0VUcVc4cENxN2l0ZGxJcGNPejA3dk1h?=
 =?utf-8?B?R1VYRTJnTEI2WHhTUk5tOVg1cVJTSmY3MDNkbk9pQmlFaXA4S2prZ3F5WWpI?=
 =?utf-8?B?UjI4YlowNW10Ui9iUXUzQ0pKV0hrQVRwaTh0NWpOY0tKM3dZLzRPVWx2ZCtq?=
 =?utf-8?B?TFYvRUd0Y0pCZkxBZnd2ODh2a1N4UWp3dnVyTy9pVlBXYU5LV2dTZGtITUIy?=
 =?utf-8?B?UGlPZFJncEE0UzlUa296dFpkME1xZFVmbzlHdmd3V3Q4Z2l1U1Q2RnZkS3Ew?=
 =?utf-8?B?TEhSd3RPMVl0eG9hZXg5enJhcHJYYThmREdFUmdOdWp1Z0xzNzlwMS9RQmpj?=
 =?utf-8?B?VGFxdmlNVklkajM1eU8vY1BMZzd2ODg4WG9wMy9MenZ1Y1k3UmNUdURDbGND?=
 =?utf-8?B?USt2WXlJaHVySjdGQVNGSGxNUVhrL1BnS1ZsbDdBYXBsQmRIa3lJQnNKZnNl?=
 =?utf-8?B?V1VRZVVWZnpWZ05nNjMxeFdXS0ZleTFoVk1nSk40Q3A0WXJEUDlVdVlUMkhH?=
 =?utf-8?B?K1poM1QvRDFoWThSbXNSQ2pCd3NIQy92dFBFMmFxOXdicFpxY3FZSFh4OEFk?=
 =?utf-8?B?U0t6eWdtdkpDK0pwb3kxSDBwU2w4c2VaRUhkL2VMMm54S2dCV0V5MUtnTEtn?=
 =?utf-8?B?NlB6RFlkcy8vTkt5OHYvQkJmMVNhUEhaNExXaGZaUXlTQlJPcTZJMytNRkNw?=
 =?utf-8?B?dDBYSGp3a1ZKUk92d2VJSjdjL09HSGF4YUtvY2tSQllQTDBXN0h4QW1ZajJP?=
 =?utf-8?B?OTkvT2FNUE9TaFNsOGRNeml2QlZYYzRUbEFWUTlUWXJhTStMSTZoeVBlenlT?=
 =?utf-8?B?aWdyZXlNTFUzYWNzS3BYMDFqVVFwTURza3Zvdy8vNERNZCtranNVZEFwSEpo?=
 =?utf-8?B?Vmx3MDJMOUEza2JodGNMVTE5ZGpGNmFzTk1NZnFjaGhWdDFEVnhMOU9DTmly?=
 =?utf-8?B?c3RyWTdRbldtZzhUb3BBZkhrckNLbnJwbXJvZW5GazRuWi9oS0I5Q1JNUnlt?=
 =?utf-8?Q?lFwL0z/HDeqW7WIUa9GS3piJj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2a308f-d773-4fef-4ec6-08db2483e867
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 12:01:56.3800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYcqferlO7+O42C1b90rkjArQCb+Bk80f6xgf0odgGueNc684UbY9m6RBHPAPJ6N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7426
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
Cc: michael.hennerich@analog.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nuno.sa@analog.com, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.03.23 um 11:52 schrieb Paul Cercueil:
> Hi,
>
> This small patchset adds three new IOCTLs that can be used to attach,
> detach, or transfer from/to a DMABUF object.
>
> This was surprisingly easy to add, as the functionfs code only uses
> scatterlists for transfers and allows specifying the number of bytes to
> transfer. The bulk of the code is then for general DMABUF accounting.
>
> The patchset isn't tagged RFC but comments are very welcome, there are
> some things I am not 100% sure about: ffs_dma_resv_lock (with no
> ww_acquire_ctx),

That is perfectly fine as long as you only want to lock one dma_resv object.

I've made a few notes what should be fixed and could potentially be 
improved, but from the DMA-buf side that looks like it should mostly work.

Regards,
Christian.

>   and I'm using pr_debug which feels wrong. Also, I
> should probably add documentation? The current IOCTLs for functionfs
> were not documented, as far as I can tell.
>
> We use it with DMABUFs created with udmabuf, that we attach to the
> functionfs interface and to IIO devices (with a DMABUF interface for
> IIO, on its way to upstream too), to transfer samples from high-speed
> transceivers to USB in a zero-copy fashion.
>
> Cheers,
> -Paul
>
>
> Paul Cercueil (2):
>    usb: gadget: Support already-mapped DMA SGs
>    usb: gadget: functionfs: Add DMABUF import interface
>
>   drivers/usb/gadget/function/f_fs.c  | 398 ++++++++++++++++++++++++++++
>   drivers/usb/gadget/udc/core.c       |   7 +-
>   include/linux/usb/gadget.h          |   2 +
>   include/uapi/linux/usb/functionfs.h |  14 +-
>   4 files changed, 419 insertions(+), 2 deletions(-)
>

