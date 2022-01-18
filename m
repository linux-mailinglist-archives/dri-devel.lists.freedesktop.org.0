Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C000A4927F5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 15:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130E410E444;
	Tue, 18 Jan 2022 14:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF73410E545;
 Tue, 18 Jan 2022 14:03:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQVP9iULjWTngBpPvBo7EWiKjD6PjgVNMhymCKoQVi2DXgFv7UEKrWS/p6thPRQ2hkrFTn5HytrZJTlddc9rNKOjQt3KzuC+1hqjufMI3BemxfeU75ueZhrRqJP8qqLw7A33CI5pWTrHx/I0DnYF7/SyhKqvr8EGrvrY7RTdgtxC43xSM9Bo1OLyS9QburYoUVh5u4xwlHe7sCfuKHXoggasP6c6r8mVlTdFi8vXB1N02kWwxjZ+RcCVue7rKCCEPzIRukx3Fao01lmVzdoPXFae2jaW1SdCG8+QUdkAyZg5fSrFRNWziufOZGtVwIZs/C4yvxUGQaRwEywmJhLpww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xz9AgvcaM5SBrDQLko0ruqK1XtruMt6pzV3iysBNO8A=;
 b=H2JWVRKEHPztIC2pxwe8FI+gmw9VrZzzyhhb6MpdZD/eM0/kOQ6KIRYHMrQhaSlJM15u6oTsgQD9eX3bltpsDp+/P9WHZMAFZXrp96QiUztxPi6QtLnGHR0YUmydbYxgRSQfRudF1DYIuagntIVzicdYcvMaWgLlw6FnXrT6Yc+oPuraiZqEOpQmjlrna0BnwNSgPXyOCDnrxZmcf5XE/mkHr0nRG32e4/ROW0wZy0hTY7e79U3vH8KH9YzNU8qxoeG7DhIY1OEzK5qAg/q1F4J790NHzWB3owAcLmuHrITVpKQZRSOm7Bp6IvPvxZ5083j83teh3Ul5oI3JTcYGqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xz9AgvcaM5SBrDQLko0ruqK1XtruMt6pzV3iysBNO8A=;
 b=RM/jFnrb9nhT9L3R2xpk2pcuN2BQzEPk/OzHLmO7XTEwK8cajrCRAGIW6PFo4tnwQz3hT2h7RW8krJdmO0eBK/0sL8mh+hQgs2wfhvUl83FnTO3loSQYgvP5Rl0GmQQr7qIODVR3yZF/g9DDEWwa1Pikfce3FKGZrB2PRIb9Poc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by CY4PR1201MB2516.namprd12.prod.outlook.com (2603:10b6:903:db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 14:03:35 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::9c25:ce1d:a478:adda]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::9c25:ce1d:a478:adda%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 14:03:35 +0000
Message-ID: <0ba294a9-1428-98cf-93b6-f9a195924a8f@amd.com>
Date: Tue, 18 Jan 2022 19:33:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/amdgpu: Add missing pm_runtime_put_autosuspend
Content-Language: en-US
To: Yongzhi Liu <lyz_cs@pku.edu.cn>, airlied@linux.ie, daniel@ffwll.ch,
 nirmoy.das@amd.com, Jingwen.Chen2@amd.com, evan.quan@amd.com,
 Jack.Zhang1@amd.com, kevin1.wang@amd.com, tom.stdenis@amd.com
References: <1642507272-17545-1-git-send-email-lyz_cs@pku.edu.cn>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <1642507272-17545-1-git-send-email-lyz_cs@pku.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::14) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b3a08c6-822e-4dd2-2266-08d9da8b5123
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2516:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB2516B3CB6006A1DF6839559A97589@CY4PR1201MB2516.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fCcYxocFUS8ZCIB2Fh0o/+zaFaxxnFnH2YHVbOU2b0u1+WQOyhY9OcUGF8znW1iPKsBe34C/Lmg4YYq7UELhPSFdlH7qatecH+uT+Y36I/Jy6k2fro8oLYUBojGcNDcqllEPrGUj7ydlanLM4aPTMP6fr1w1r4Ukt4CD9vfWW/kcIAo8bs2vK7Q6CPZvKnKK6/d6Aw9Xq8mHKNr/PtF7oVqahkEnU6iWNDaodGhhjdvTG3KJ2fKzGoIjXHgLj4NfE/eahSTCqh7ZhrEmVMpArev4gPRB96Ty0ybm7CQfCbOCz14JVB+A8c7+heoXKxr3L6X7XdqAc2mJ4rb7Hy83qu+daKcEDjJ3AjTyAd3pGekJAsQ+qapJt9axGUT4QhpBzzpwcQs799V6tTKWNY3aeTYsmpj2qUEFkdsL5W8CYccQRxxCesqOyxTrpzom8e7zI2F+aeWooMb+eNYhapJKeZaHuK7unQ2KAX1NTa2i3ZeriAvR2K54pY1gzk/XqcU/pG/CQZsZA1juOFKxcJDeXkact2noYkf6aRo+Q/I6j/OOefxXaimXehPQevtkUzmjJpHcp7s25F73iXO8urtXMFXA4mCGL8KH0GQ8pbwCHJDEuNH/e2tJZ8NK6rZzsj1V0EALPzjDGIohAOCAUR5mIdT8aZ/QHgld64EBiL16o8Ul3wFkYxZA1y5PthufkUz/uTv3JOX4CJq3zWSCFPNPlp3jH4UYcNFJ7jIzmtH3DeRECgH6FzmivXncNGqYu3IZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(2906002)(31696002)(4326008)(2616005)(6512007)(6486002)(6666004)(186003)(8676002)(508600001)(8936002)(6636002)(5660300002)(38100700002)(31686004)(6506007)(86362001)(83380400001)(53546011)(66556008)(66946007)(66476007)(36756003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajdOcEdmeFUxaTBwemlyaFpuUTQwZnZjTjE2bk82REtPOEk1cFNMWHd2SXZM?=
 =?utf-8?B?MUgyb0pieFpudldtQ2x3RFYrUUc0LzdNdUZ3elZ6Znk0S1FsRFFDUjhQZjJx?=
 =?utf-8?B?Y0tQUWVHQktySkp6azA1eHpTVXlwaUJ3QXgyUkRoWVUxQVNLSnh1VmYvVEtq?=
 =?utf-8?B?a3ZGVGNlV0JhU0V3aWJTSkVGeGN6UmJDMVBYUTFoSmtxSzRkUGlNUWFPZXoz?=
 =?utf-8?B?Z2hJTjdta1Zsd2ZCUlh0K25FeHppSE5Rc0RldEE3TThWMFFDelFqQnVnRm1Q?=
 =?utf-8?B?eVFrWDhxSlJxVk1pMFhOU0JMSWM3eWtUd3Uwa3JBem1sOGpXWmhNMHljMkdm?=
 =?utf-8?B?MXNhVjROS1BVaWIreEFBbVpPU3NXZW5XNHQrZTdZZlBvVjlDZVJyZnBpazZo?=
 =?utf-8?B?RWZXalhUUmRQRjZaeG5jQWN0Ri8xeVVEaEl4ajkySFJocHMwdE5lWElZRDBx?=
 =?utf-8?B?a3JSOUxzcUU3Q3lBMzR0R3J2T29FN1EyUkJ5OENYaW8yOHdUL0xieWJITU01?=
 =?utf-8?B?NWlrdXpqSWlpaHFMRTh0VHRQcCtSTzJUZ29NTW5mWGRBdXFIdHVpVW5BVnla?=
 =?utf-8?B?RGc1eTg2dFdNbncxSnV4SjhKOThObldMaW5KYm5wNThnSWwrWEpsRTE3OTNz?=
 =?utf-8?B?L3RRL2NRZi9QZGVySFErOGxwTnhZdVk5bTVocHJqREJnL21NR201V3IyWHlD?=
 =?utf-8?B?aDNCbDhOREl6bEJLYStpbUxMZWpGa1NDQjh1UmZIbzFPTzhZUktGblU1Wkh0?=
 =?utf-8?B?MVducXJoa3FJZzh6TGo4VWJPSy92eXl2WHpPdzBaMU8vNytHT1B4OWNPL1hB?=
 =?utf-8?B?NUlMQXVtNWFrSXRNU2Z5cW8rMHlIS2l4eGNZMG1MWXIvd0dJMnUxK0VhV2VP?=
 =?utf-8?B?RWhMK2Z4M0FaYUVzZHdMUXBmQ01TTUd5TFUzY2p1M09MQ1cvODA0SHMwSE1v?=
 =?utf-8?B?a3pHeUhxRFEzOXc4VTI2Q2RmeXI0dTREdTFaOU9IODZWbzI1ZHhSRTc1K2tF?=
 =?utf-8?B?REhSZFJicXI3OXFtenk1RFREM1RSQ1A5KytlUmRZY2FzQ0g3M3EzL3hORkZJ?=
 =?utf-8?B?ekRMbHNwakM5THRsYTRIYTdpaTh1ZXNuYlV0UHVtUjFhUm9KT0RxdEl6Tm8x?=
 =?utf-8?B?djF3UGxPMElacWNyWG83V1JUeFlPM1VYdVFjNXdPbDh0MVFxdVRZMXVGSmtl?=
 =?utf-8?B?WTUyNVRtbi9ZRzFMeE9aY3BWZTZnbzZqbCtlbUt6QWdIaUdvS2JtaTBJVDdP?=
 =?utf-8?B?dXBpUTc3clNycU5BbVo0c1VDWVJVb2Y4N0ZIcUxXdHpmSk4ybTB2eGJ1a0pH?=
 =?utf-8?B?TTgycTlrK2lnNW5vejRhY29BZXVoNXVtUElNUkFLVi9zYUdRS3luZlVHZ0hN?=
 =?utf-8?B?VDVQWElyTEpUVUI3TWRyT21QeUFpa2tXNmw0K2czUUpWeGQrZGtLQmRqSkZQ?=
 =?utf-8?B?TlZERHNHWnRIMjRpOGtoV3hCMkhRVnpldmZNY0YzckZjaHJJdFRMK3hQL3VR?=
 =?utf-8?B?SktQNTg0ZTE1QkE3ZjdpdHR1UFJWMkUvdlpwcU9mQWxNU2JOb215cnl4MnpU?=
 =?utf-8?B?RkR2NkM2Qi9XN0h2QkNYNlI5cDlqOFgyOGdSOGJYT3Y0WkNGT1V1aUhEWkNT?=
 =?utf-8?B?YTlUL0NuUDc3THJjVXhJWVdYaUltMnBNOU80Q3ZJbk5sSFVDckdPbXdkNm9l?=
 =?utf-8?B?RTVvRVdubk1DRTU1cHZpWHhoUUMvc0E0TlFUb0FMbkVUYm42VjZqWnh2Ly9y?=
 =?utf-8?B?bHNESTEwZnlvVmRtNngwYmM0RDN6OUxad3h0dDB0Q1ZXNkUyaTlXL1RFSFZT?=
 =?utf-8?B?eFFuT1dFODdIWGRidVdOQzNrR2JCRWZlL016T2JXZno0MTl0WmZyeGYzYmEy?=
 =?utf-8?B?dHZjRmx5Vjl5aDVHSHlmaW9pNEU5b2ZmdWl4UVQyQVV1aUk2djJGT0hsMVlI?=
 =?utf-8?B?SlNML01IZ0tLUUxvRUVIN3ZWUGJwdnFyZ2NKbjZDaDdsd3N6SlRnSDcvcDRj?=
 =?utf-8?B?YjYvWnBVT3ZLdmxaM0N5aXVyQmp1dTFHMnMxYWtER3QwekROc0dWWGJFM1Jr?=
 =?utf-8?B?d2VkWTZHQnlUdFZYSmRkV1R6MkYzaUNodUFaajJZQVpHMURBWGs3ME9tTVZJ?=
 =?utf-8?Q?te+8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3a08c6-822e-4dd2-2266-08d9da8b5123
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 14:03:35.0264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycEYnIBuNNnjpgWAajmkbs6mn50VPVYB81+SFTZToKG+gWwc8UQJXyt7KVJwFgoB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2516
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/18/2022 5:31 PM, Yongzhi Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code, thus a matching decrement is needed
> on the error handling path to keep the counter balanced.
> 
> Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>

Thanks!

Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index 9aea1cc..4b950de 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -1120,8 +1120,10 @@ static ssize_t amdgpu_debugfs_gfxoff_read(struct file *f, char __user *buf,
>   		return -EINVAL;
>   
>   	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
> -	if (r < 0)
> +	if (r < 0) {
> +		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>   		return r;
> +	}
>   
>   	while (size) {
>   		uint32_t value;
> 
