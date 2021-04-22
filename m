Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1580C367D9C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 11:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABE36E04B;
	Thu, 22 Apr 2021 09:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DF96E04B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 09:22:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1iDZ4rRfQLBdYYJbNtG+iVqogx1Fppeoi+sGeSiW1Q/gtLX+WL9Kh6Jwt2iAwie9ZBzvt2m9kRELA2C3hVV/U7GTG6jXMYrSE523ljrgJy/cE/B9uLNv3xgaIMiGYiVGOjZm6vOgdDxPRvc9E8fLQ1vYzxflS3SMsRe9gHbZziMng8JjXbpj5mR6pT7x+TXp53IgWlPvZe7LovjLZFb0Mtu5qoAl1Xq3CzMdlvWG9AlIlwFnGmeLgLUmXBzBfiJuO1o5J7fIzyUDTlXgs7AfwWPz43mR1eUHrrTSsUdurTupVoCot7l68QOsGVS/BXI4mEce6nquLHaDjwik7gZNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDQ6uI12Jct8FyNIvhUu+VK2Iq/la9TEIBhEyqeD2qM=;
 b=F9Js+4fpR+27m/lPnjUt0zc/oz+0UXqYYK8r/r95uhPfkzOSAEWwnut+dOmzgI+8nYOeIZxuBYlnySKUTFeX5NRAu2bqRuuYYEOP5gqyk+2s8v+6tDLm6sEP6LiuvAM3zdXMuiDCZg4c/zKBgpdCvBI9AcxYtpPI5LxmB06woT4icyPz8+/Hhc31zG0hZNDDOXWBBbQsQUBbnGYVOR1jy4RKWALMc/2SHAmnZUd+sdaubrdlPMm0sQa+3ZLBlP/Q5gFBNtrYbZ9XXz989C+FgqcBh0B+iL2oEO9AimvUTRGxxb9RPmwITA1SLo5yKPLk5RGcWxY6eZz+bScG2nJQIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDQ6uI12Jct8FyNIvhUu+VK2Iq/la9TEIBhEyqeD2qM=;
 b=V+X93qNOji86dvjKHKV8ix7pSi945Ulw/5DhMk9fmJqtReadwnzedwGogtZlvGmFiLDu3tepgwUKp+UvUUaUKnhhBCEL0YlKVXdbeAd8ZQGqzL1DIOq9v0FygIjTB+4gN19geaMOY4R2MEuG8BGxYXC53v3e7tPlNkimYqvp2/A=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2515.namprd12.prod.outlook.com (2603:10b6:207:40::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.20; Thu, 22 Apr
 2021 09:22:01 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4065.022; Thu, 22 Apr 2021
 09:22:01 +0000
Subject: Re: [PATCH v2] drm/ttm: fix error handling if no BO can be swapped out
To: Shiwu Zhang <shiwu.zhang@amd.com>, dri-devel@lists.freedesktop.org
References: <20210422083749.11686-1-shiwu.zhang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a64c7549-383c-ff38-1a19-5533e1866300@amd.com>
Date: Thu, 22 Apr 2021 11:21:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210422083749.11686-1-shiwu.zhang@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:2fbd:d2a4:da7e:4526]
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:2fbd:d2a4:da7e:4526]
 (2a02:908:1252:fb60:2fbd:d2a4:da7e:4526) by
 FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.16 via Frontend Transport; Thu, 22 Apr 2021 09:22:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c20a670-7206-45b6-c581-08d9057015c0
X-MS-TrafficTypeDiagnostic: BL0PR12MB2515:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2515B31AF24EB55611DAC7C583469@BL0PR12MB2515.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aUiPAM/U8/DjSyB5wY1qnumpTgvPkQj/53sx6BjzJzpaIfgcbN7o7peOLPoRu/1TRIQTYTZEInOnp4HC7Ly9tEbqH2oMRypBwOKjwzkCJwI9B/fzvvPSI61BgnNLbAQDvD7TVzKeMw6ZtB4zLSkuqR6DRTH0hbSDxkOemmcqEPuQ8FQW4E94Om8tIY5i9PJb70o7MPm3tNikJRNzuBWCzLSIhliuCcljZVe71nECO65Ba4bunrdV7vm2fKRpk99eR/V8cAPDXsJPVeLtgk+0CauGsMb/P6D42FBGD+VPyFVZ8ZxiHlvg/XlGl/aidE2xHZ1GHH+7EPmiIOE7IYebxK19V5ywKdUKghmiQ2aSatagr+L1Mpodg7sgt4PHfxc4ZuMxK1FFmrdChCNrVsa51q9VlpkxcRLNZdm4vBTNqSyCovv5v7CMbL+R/YoTxlN5ZFEZJW8JLnUq3wJacx+h5WRgMk2ah/NMA8OiMrOsIWxdOkoKErPjOSK3VVKhtorDOgiUdR4EzMGl3wuE93oGnnwpBAdITDiDAxfe3av6MbDvpzLxihUZHQx3+AGJ/2+sf7RuRWIiUuSWr4PaISsmRzLbbx5aUTA6QyaTWo5WvwjayXUM+g2DWGkf/8j/LH977/7MvIBlyCC2Gle+dFek8l6iTjTlB6mRoXVAypB29eg87ZC09UbIdm3OnS7RANzJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(52116002)(8676002)(8936002)(2616005)(6666004)(186003)(38100700002)(31696002)(66946007)(86362001)(16526019)(83380400001)(36756003)(31686004)(66476007)(66556008)(6486002)(316002)(2906002)(5660300002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V3Z0Q1FRZVNuUHE4alVDSGlzSFRDMFB5aHM3K3JHVDBSSWppQUFFNVBlWFNE?=
 =?utf-8?B?L3ZKNk5zMFdra1o1ZkNWcnc3SEFQZFNwWGx1amh6bDJJMzNtbW9zTXJiTENm?=
 =?utf-8?B?MFViNGszdXZ5TWF5RGFOaWYrUGVBcnJOM29yL0MyUEcrYnVlL0tUS1BLU09r?=
 =?utf-8?B?SW1jTjlzM2N2TzlDSHFSYkZQV05EV0RpVTN1akcyYjFTVkVBbXpFYjAxNFBP?=
 =?utf-8?B?TVBHdkxWTUd4R2htSm9PZkpmRURmc0lQNmcxNGtFRGdiYWszaDBlMmE3NDdt?=
 =?utf-8?B?UGVFV2JJNUZMdlRUNlBQY1pWUVo1aFp0aGZiTHlpUkNwdmkyZWZIaEM1aEYy?=
 =?utf-8?B?WmlrRkY3TlBueTFTNEdzYTZpdHNEclFqcE9QRExmR2MyVmJFRDUxNzhrdEI4?=
 =?utf-8?B?cmxuK01udDJBM282TnVOemxYbS9ManhLdi9zRE9JMGNmVFYxZUZQaFpCdU5L?=
 =?utf-8?B?cVVpZzJMQk80UHBybkx5cFRXUFI0WWhnbk9WL2ZUMnNQUjlqV0E2dUtuWElT?=
 =?utf-8?B?OWc5R1N4ZFQ2endtSHFBR01jaWpKMzROM1htOFZhQWFQcmtNS3U4VUcreVcx?=
 =?utf-8?B?R0ttZnpIYUtFeWRTWmpudGdwZ2VqNjI4Z3BXL2VTTG50eEptRGc5d2ROYTh4?=
 =?utf-8?B?ZlVmdFJheWt6MDRwN3UrZWdHRURGZm5JUml4eTdDUGRLRUtEUzEzZFFZbmpv?=
 =?utf-8?B?aUV5V2RYNEMzR2NubklJNVFiYWtZa0hCS0lRSy9nM1dHY3lha0hGS29NM0ti?=
 =?utf-8?B?bmd3UUI5VlJGaVFmc0xad3hYc3lWRTM3YkRtek1lN3h1dlErb3ZISkliR1Iy?=
 =?utf-8?B?MlRlYXJqLzBTNHJFTkJXQm1seXR1NlZPWlQwczZVR2RHR2NFSDdEb2h3WUI1?=
 =?utf-8?B?dE93c1ZqWktRa2o3a2ZnRFlYZFVvaDcrbFBhenM1MGh5em9ZTXdBNG9tVU5v?=
 =?utf-8?B?SUtPUkdtUXhIbm1iSVA0RGxIUngyNkZyRnhUaGdNYkY3UDFCSWtTQXpYK0NS?=
 =?utf-8?B?SUtSem5aaEhCTldRM3pEazZFVlBqQVlxd0JCT1JsdWpJSGtmQmVwWityMU5j?=
 =?utf-8?B?RkJMM1ZJNEExQlpXTXNoZDZ4MnVZWjV3TkxvVGRUdzdWU0phWU0zaHZJYldp?=
 =?utf-8?B?Q3l5WmZUaGM2MjNaZWtlQnUraXRVemM4VTIwWmpMNlZaendRbVNCZ1F6WDNS?=
 =?utf-8?B?Q2gxMkZsMUltbWpyeVN3MnlKcTFtSjFITmNacVdOMTF0bzJpZ2Z1aXI2WlNk?=
 =?utf-8?B?MEpsSnk3QW9kb0RMUS9teWhkRjVWdnFCbklzNzNXb2k3N1Z5L2pCNjZ1Vk5x?=
 =?utf-8?B?TnY5MEs1ZHNLMjRRaE1mZ0FiTjdxY2UzanJqc0NlYjRhbmJHY1k1eDZLRHFv?=
 =?utf-8?B?UVBBSUVGbUJQS0ZOcis0Rng5azRXZlNRa09oeWxwWFRoUUxRYzB5c0JXZkRI?=
 =?utf-8?B?VUNnZzVSckRJa3BocDNiZ3RNZk1ZRmlrMGxMeThLQ0tRY001MXVTbnNtVUF1?=
 =?utf-8?B?S3VEWER5Y2w1MWxsZnpnbjRwbVB6S3R0WEVveDhoVFRWQnZmNVB0MG90NHVD?=
 =?utf-8?B?V3FJUU5idFZoUWJ0b3dNS1hHc0R2Yy9FMGRVWE1XQXROcWdVbWc1eE5Ha2RU?=
 =?utf-8?B?cnpSUnArbDFrY0IrTUtCK2ZmcnZzdHN2RHNnWE4zdyt5N0RaMzdMQkx0MTFB?=
 =?utf-8?B?THp1YTRDQUw3cmZHaW1FdTMzaUpqejVINElHZmVNSW9LVkg2bTJvdzlRWk12?=
 =?utf-8?B?czR2bCttOWE2N0tXbUlFRHFsSWx4c0hlOE1HSzVKNldneFJMSndPSDk3RWpl?=
 =?utf-8?B?R1dPaEJZWEZxWEI3OXltUGRjUi83MlNtVmdsNnFiaS85UStBS09qZmViVUpn?=
 =?utf-8?Q?F7r+BOXjwFvFq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c20a670-7206-45b6-c581-08d9057015c0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 09:22:01.0865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FePduSJflYq6gR5Sd2OQTRP++mWfDKz1caSwDvqZTo5mPxPuFUHw7HV3nkIucgM4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2515
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



Am 22.04.21 um 10:37 schrieb Shiwu Zhang:
> Signed-off-by: Shiwu Zhang <shiwu.zhang@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 2 +-
>   drivers/gpu/drm/ttm/ttm_tt.c     | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 1f2024164d72..5dc92b056f0a 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -112,7 +112,7 @@ int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
>   {
>   	struct ttm_global *glob = &ttm_glob;
>   	struct ttm_device *bdev;
> -	int ret = -EBUSY;
> +	int ret = 0;

Please don't initialize the return value if we don't need that.

Apart from that looks good to me now.

Thanks,
Christian.

>   
>   	mutex_lock(&ttm_global_mutex);
>   	list_for_each_entry(bdev, &glob->device_list, device_list) {
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 48c407cff112..539e0232cb3b 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -329,6 +329,8 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	       ttm_dma32_pages_limit) {
>   
>   		ret = ttm_global_swapout(ctx, GFP_KERNEL);
> +		if (ret == 0)
> +			break;
>   		if (ret < 0)
>   			goto error;
>   	}

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
