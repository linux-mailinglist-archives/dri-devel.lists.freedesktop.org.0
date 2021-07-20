Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1EC3CF6D6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 11:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E08A6E1B2;
	Tue, 20 Jul 2021 09:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2066.outbound.protection.outlook.com [40.107.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0D26E1B2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 09:32:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnSID1+KHLBMYKCMX7nNZBsSvQRw44ylmxj+gM1sqmdzPEUmAdK/L539q0pCcEvaKRS6WwfR1kp5QD5PYfWKufZSp3KyOIjfK19bRcn+QdT1wlqBGaNq0Lw1eqePFWncc4nAs/chWkH4Cud8+yDEeY8HpfCkRnpTQLyfUslWb3vhmhC7GtxckgrL/oOnXL945HEyslSTfeXvLoSE5PbK3JncWdl/tCS7eEevz2VBlYfTcQ7CG0vuVLLSiG73Hf300Mf+WmIvrpULhJCxwQugil34fb+5ryLvtL4jZjJiVNs0x+56TeEmygIhL/EuDLzcW7xuy7biH9Te2Elq79im6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoP1tStw7r80ZKYid5rPEI3odof0MEe0DeSs936apUE=;
 b=nlRZyCHuFgCSzdzWVKO+R9WfMrfxRJExDsDB5TNK7oL4aoXP/ELLixHQrQO8fM5qInss8miYH9nvKMNvsINdvnJeqFp4tXASGA6BItfdb3A5sgjPuP0KDVp7Crm7rqCZTfkGrs9wlWkY0rI+beqHb+JtUhiRz+HEB+F5SwyREYSZXGe88xPzWt29j6wd52DRjFV9entc2ePIzBzXirP2uC8/Jn6ogAZjSzsxOesMXZgiJTxwlSQ5N1qZRHDAw+yybcfepNrp4YU+p6CcJLw6fJRhW+ML+i8dyY3Y0WIc1YAuaMK1K30IEEOg/prJ81sZ+/jeZEUiYZYe3V0A/DwTNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoP1tStw7r80ZKYid5rPEI3odof0MEe0DeSs936apUE=;
 b=b2G4e7bzpXEUQJ2mnHvG7QOozsj9GCpqtqGTrOXoZ7yChpQJCfo67rlh5CLL0V4sl0dAnG5YfLYQQBKjKHRMWYZnqWVtvIDlWBIBLL69zHuTHMZuHX/+VeCP7Kr1MMUtwfOML5h57J4eusUqro8cIK8570p2XOA8ZxkycSTyqug=
Authentication-Results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3967.namprd12.prod.outlook.com (2603:10b6:208:16c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Tue, 20 Jul
 2021 09:31:55 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 09:31:55 +0000
Subject: Re: [PATCH] dma_buf: remove dmabuf sysfs teardown before
 release/detach
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
References: <20210719051944.40871-1-guangming.cao@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8d7dfc78-aa85-48b5-2828-21ec6b463ac3@amd.com>
Date: Tue, 20 Jul 2021 11:31:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210719051944.40871-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PR1PR01CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::44) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8651:5b5e:8648:2fd0]
 (2a02:908:1252:fb60:8651:5b5e:8648:2fd0) by
 PR1PR01CA0031.eurprd01.prod.exchangelabs.com (2603:10a6:102::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23 via Frontend
 Transport; Tue, 20 Jul 2021 09:31:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f436312b-c6a0-4631-9b56-08d94b61367f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3967:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3967D240B1C80182883A16B183E29@MN2PR12MB3967.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n+c/qpSRUF8F08FXwvV4yLH/axj7+nGOFPaBu/xp1GS7Up65mKqwhfD67dxj5wS31VLtV30sXtTrJhqxkxFVn6z+onavIDx6y3S5/Zt/vyQINYPgO58rzzYPZCyMaKO7KUTZcadyIE0oTAM3OxTA4Jzb7dAXSE0BAh1ssZ1YpZwnxuQQNK9e4sFI7uEE0tKt0k3DlzUCQonNXaADNA3GLw+muqLcAdOfHVBJjiOU+0Qj/HQaZWbGW88upnbv1mVZBgQyJ6/+s/Qv+/6vZ3HOge2dnrK4ms3S3JcBhoAW9xHkFlZb/woYD6a1wTpDWLK8xdCbPnoa4UXYrcS2jYb+awtYbx/xKgdFnStosNUSMIiGzd/rhGvSyApJBViBHTqGMlgXfuTIfEGrh1PGVSSu+T3vFfiv3Zl3rfOgspTgCy2glZJ4vUL+LgGbCKLDYVZZD6w1r7lEojiwlv56u0mstj3if2hTs1jEvNAvGnzIQovZdH2JLnGVidfMP+oJhiDEzEJ1cbEAzF/eOdYEccbeQgy/AilYsq575Y1vWH8vQ0njW1bBKkin3EBY4668tfAYbXN19WsBhnKxwgGJ1DpQ6pDtutltAGEyJ7O68Fp77mpb+w23N0KpF3X7jLyfOKoPV6gpJYbpE6tOBE4xNUMM0VZDdMUQ+7tLoTSOSXVsydFakldEdDv5E9cjBHhvkeqFbYhaFgOa7aPnYaREH9oFPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(478600001)(8676002)(5660300002)(36756003)(8936002)(86362001)(7416002)(2616005)(66946007)(31696002)(316002)(83380400001)(110136005)(4326008)(2906002)(66476007)(186003)(66556008)(6666004)(31686004)(38100700002)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym5PV0szVVRmYkxhcTN2U3hhM285dGxWOEU5U21QamlmZy9MYlo4RW5PYTEw?=
 =?utf-8?B?ZzVvNjJ2YUEva2o1bGZISGQvMURaMlBjalpJS2dFSmgvMXVJeU1naC94UUN0?=
 =?utf-8?B?aDdma2R6dlRRWklVVnpXLzBkbk1XRUJja3REckozUDZWVUhnbWtubWppUzBq?=
 =?utf-8?B?ZTJBdlpFMktPY2c4dXR2Y1VMVzNGbnpBUDNHeE5lbTVqZlAzNGw4WVp0L2Jv?=
 =?utf-8?B?bElDd3hRa0xNQXZXS0wvZ0k2MkZ0aGRDVTNTTGpOTVBDQWpzOEVvL3NyT1Jt?=
 =?utf-8?B?anU0b3JjNlROV28yaVZ3ZXFJaEszU2l4TExqZldLYWEvY0QvdE1FNm1OVnkv?=
 =?utf-8?B?azNGbjJiSGhhS3VDY2kxUytHV3QxaWJuZElid1pNTk5zYTZwNWR3R1IyZ1Zr?=
 =?utf-8?B?UWNlV2Rzb1lrMjhSVEIzWG11NGY0cHVuZ3ZwejZZdldpTnNPZUU4SVBGZ2Jn?=
 =?utf-8?B?RW5xV002MU5pMHhJNFhZS2MzNWlYVzloNGlwMTdqYVNXOE50V2JnTHQ5dXcy?=
 =?utf-8?B?YlQyTmpqNkIyVkNyWEwxMzNiQ3VudFZTUSs5aEMrYmkzdXpwazdIWTVJL2ZN?=
 =?utf-8?B?ZFhycTI3d2pXN21INTZqY2NQQzhTb2pJMjBwTG9GTXdOd3hYekFTVWlCbVZD?=
 =?utf-8?B?QmVDczU3ZThoRVNsd2IyL2RVc0RZODdWUTdCRG1pNWM4eE9DK094QVpFYmlt?=
 =?utf-8?B?UGhKWUhsLy9WbmhNVlJCYUNWdDdFaVBUQnhYem1hc0M5R05mSHF0dmJmekdX?=
 =?utf-8?B?MUMyYUI1QXMyTGppWmJycnlLc1VuV054QjFHejNTM29uN08zTGR3bUc4RUwy?=
 =?utf-8?B?TWlNUkV2OEVIMUF5MVVLbm1vOUx3VVhCZjZVMVRoZ0d0VUttZXpaekZIRWVq?=
 =?utf-8?B?a3RDa2pMazk5Zm1VYkRFZjJaZ0RIWkJ0NnM0OTRCam1vRXQ3SlA2N3JIL0xX?=
 =?utf-8?B?NkNtSkFSdTk0U1VURXJlWlNLaTlVQUxQRGNuWE5Nei85cjU1R0xnOHNaOW41?=
 =?utf-8?B?RnNFS3dmMU1OendGQXM1cXUrRjdKWDRuYytrUXErUjdRcVhSallsZnVDUkUw?=
 =?utf-8?B?ay9RQXIxbFNsbkRYNUxOU1RncU5ZTjByQUhRZnB0TDl5eGU5WjZ3b2tFY3ZZ?=
 =?utf-8?B?dFZwM21kblJMN203cnoyVUtpVE1uWENxWFhrbWhTN2hLWGdxWUNqWmluOEVh?=
 =?utf-8?B?M0JMTHdGMll0NTJ4MXlha1QrTnJuK3V5NURyMjlsbFRYWG4yVGl1Z1VOajdK?=
 =?utf-8?B?SEN3anJvSjYrS3VoekI2aFZzVVJtbVlyRXdISDZQMVBBNERBSFFtWFJ1R3FO?=
 =?utf-8?B?T1NJSHpGYmoyQy9Mckx6SHlSOCs1VHRwZm9ZMC9PL1RFUTRpZWFNRGdaUW9y?=
 =?utf-8?B?VDh4U1JRWWNGTGJyNjAxZVp4eHFDSFVVVC92Z3ZLOHBGazN5SDhhRG1KVGha?=
 =?utf-8?B?dldYeVFVQUJLU0FJT0U2bFY3UmlMNzlnaGY0Vk50QTdNSWJtUFBqbzN3T0Uv?=
 =?utf-8?B?cUNVcGthSHd0elZzRUQwd1NHREllaUpWUk5GZmJralJCSlQzbHBhWDcyMnNW?=
 =?utf-8?B?M1hiZGlaNlVRWUZYMUo1aHR0ajMySnpjdFV5NWNKQjJtQVZWUnhDZnpzQlRz?=
 =?utf-8?B?eU8vZ0x5R2FuNytpMXVMclUzM2tFUCtqOVdZY1RkSTJneHdiR0xsbVFrQlZh?=
 =?utf-8?B?NUNrV1V0bmxacEo1WElVTG9TS21Yek1HaEZ5VDhZU0RzNm9veitHdXp2czNQ?=
 =?utf-8?B?MnBvYXlIdWEvRGdhUmtMb2VGU3RPRlZ0QkZxc1NYaDQ5THBMYzNhYUxadHk0?=
 =?utf-8?B?ZmFselVJa21LVVF0WGRja01ySkRtbTVNQndqUktUc3BGNlBxS1pmZVFYVTAr?=
 =?utf-8?Q?RblXqZTrTKcVP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f436312b-c6a0-4631-9b56-08d94b61367f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 09:31:55.1337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wJGt2MZDIDedH6DGpPOMpWlhG3aZBBTPtornQd9pA3ewWYCWxoRHGTUH8UcoTw7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3967
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
Cc: wsd_upstream@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.07.21 um 07:19 schrieb guangming.cao@mediatek.com:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
>
> Dmabuf sysfs stat is used for dmabuf info track.
> but these file maybe still use after buffer release/detach,
> should clear it before buffer release/detach.

Please rebase on current drm-misc-next. The attachment sysfs files have 
been removed in the meantime.

Thanks,
Christian.

>
> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> ---
>   drivers/dma-buf/dma-buf.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 510b42771974..9fa4620bd4bb 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -76,12 +76,12 @@ static void dma_buf_release(struct dentry *dentry)
>   	 */
>   	BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
>   
> +	dma_buf_stats_teardown(dmabuf);
>   	dmabuf->ops->release(dmabuf);
>   
>   	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
>   		dma_resv_fini(dmabuf->resv);
>   
> -	dma_buf_stats_teardown(dmabuf);
>   	module_put(dmabuf->owner);
>   	kfree(dmabuf->name);
>   	kfree(dmabuf);
> @@ -875,10 +875,11 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>   	dma_resv_lock(dmabuf->resv, NULL);
>   	list_del(&attach->node);
>   	dma_resv_unlock(dmabuf->resv);
> +
> +	dma_buf_attach_stats_teardown(attach);
>   	if (dmabuf->ops->detach)
>   		dmabuf->ops->detach(dmabuf, attach);
>   
> -	dma_buf_attach_stats_teardown(attach);
>   	kfree(attach);
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_detach);

