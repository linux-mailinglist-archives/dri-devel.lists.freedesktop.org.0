Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FB179A78F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 13:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257BB10E2C3;
	Mon, 11 Sep 2023 11:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F8C10E2C3;
 Mon, 11 Sep 2023 11:15:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEj+HBIyaCu5BOD5DhBTJeI5N6T8Y/2imAwhjL8PhW6ekPT6W6n57kk+lrJZdRf3sE9ITdLi1Itw0Qv/VAuDR10QK6QqzjpX+xlgeEJAzi+Jkbbmix1e3GMwUKAWBgJn0Bealc4S35rw3f8W9Je6aZ5WrKym6aZtrWavXdpw/5wd4epfqjCh4NPqAv8khotBGTfoxPodt2ajAn0nCM2PMs4vkuXOWid5G7EuTZENTtZApoQU3HNUkYcqjEg7JJWOTHiXoF5f1tSO6lVqdn9VvaqjUpUV7LITEcxHMd1vZFl1an0FCFIfMm+9jwHKaPcd85tvdOPYFBAkf8hqHsE8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVnizcLg0D7g5f/1seSV4pi3vAGLljAIH0DUv0D6/9A=;
 b=DIY7bjL2U4ozGvSqzQXpdqTz3+yTZBAUpjG0whYyl0b6ABXnePZk2KxRFcebLTtbskqsPhwCoakzRd7ofXJIGh97oya4DlF5PyWzrpTPo/t/ZLALAPKBexfA+GUtKa2jexVYu44fXzU1NI9mlGHANGRKut2to3ie+pl5qmkm68VypV/8wEimvBPavMUqvDZ2GLn8SPx6eRkm9znQShRzQevC4DehHyYUfxrwwltTpbPoWJL95FJ/nICPk2dNZYGGM4YNv3w/i2QrTILc/FoLwF0i+qlHrX8PCVem8CEnhA3NrTHRuiNOkBIEQk5LUsyvtsBZUUTGe32TBuGDdUv4aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVnizcLg0D7g5f/1seSV4pi3vAGLljAIH0DUv0D6/9A=;
 b=fTqEJIbtJsO/nAgNH7qYqvWpES+eV2lA0lARerDa/utkt1WdsKD0zUkM6dUSO6WfREaQlaD8wXCaudmhTun5umxT5IMGvBCTsSO7XfAaGZZVj5XnwYfYdmhpM5/9Sea4fD4LN35/58s+Bo397iYikCyfk76EgeJx1rJIP3Uwz1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW5PR12MB5649.namprd12.prod.outlook.com (2603:10b6:303:19d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.32; Mon, 11 Sep
 2023 11:15:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 11:15:00 +0000
Message-ID: <4a6622b8-231e-74fc-f558-0f124b851308@amd.com>
Date: Mon, 11 Sep 2023 13:14:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v6 1/5] drm/amdgpu: Allocate coredump memory in a
 nonblocking way
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shashank Sharma <shashank.sharma@amd.com>
References: <20230911030018.73540-1-andrealmeid@igalia.com>
 <20230911030018.73540-2-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230911030018.73540-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW5PR12MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: 31512f95-9d4e-47d0-0f84-08dbb2b856df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lGcApRctmZmu46341+2Vv31Ijy4HRLi9iOpQJPGPK5INXCa8qpTlAU722Dvt3j7EzRwg6bAr3BMfMCGBjme7a19sjKFlP54qgBtc1SPF6+uQVJRTEDMnbT8miC72qjFLzYLfAD+XIYwCDjBUx8UtaT05CDcomWX0fZsF205bmm8r1WmZeTP90cajkr+lewJ32s8GZAU0ek60J7PfZ9dwp/Gu5f8L9J12klnvh2s0QWtjgsZpRed9ZI/P0Ld3BPZ4ms9WEJGVGVn1kEmLbOhi9ZtnSEpHgh4K3j+HG3P1c0MI+rDtFjqH/sQLaKkXFRpKYDTXnDwZ9vWbzJdm4CQaSf4ygwogGtn6pdmrl2FBrETN6CGNkrJ0yoArJv9ylLn2WiAlbiy63Oq5VMhpHrXTTUsNmX4OAfg6yKuICu9gB+pPaNiFVyF8a9Bv3mAllxnNQ5zWibZdK1S+5U/tRlOb0uTIBXiTj2m7D3LIXtzmTa/7S1g5kTiI6e4uGBxNBLWeTqcmC4tezB0twknv1mcLCZ6CXmVUXSGWDcGojzSSAjZklgo6mi26tIo7tu4Ie/Dif0uOibgbJXGzHqvpsAKmcZJqDHHRhQ4P7GT+eN+3chrqA/7G7aVEFtf0FHtarLmStM6wN86Brp2dieDGsTtJZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(39860400002)(366004)(376002)(186009)(1800799009)(451199024)(6666004)(6506007)(6486002)(6512007)(83380400001)(478600001)(66574015)(2616005)(26005)(66476007)(66556008)(66946007)(4326008)(316002)(6636002)(2906002)(41300700001)(5660300002)(8936002)(8676002)(31696002)(86362001)(36756003)(38100700002)(31686004)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGtsR3NLY1lBUW9PRFJ1K1Z2c2dhcUZCZXYvYU5wSkRFMjNQZmtTZExoYlN5?=
 =?utf-8?B?N0UySEtTcXR2Y0VLRGU4aEQrSFlYVllmNldCZVptTHpxK0ZJMW9SeU9icEhY?=
 =?utf-8?B?dnhBOXJWS29GdGRlVHNsdkJvR3VnejZkdU14bXlYL25RUnRINGJ6NTBWTENr?=
 =?utf-8?B?aENVN2F6enNncFludkw0SEJKWjZTNlFQZHpNU20wQVpQZkk2OVliTUdQZWpS?=
 =?utf-8?B?a0l5S3cxWU84aDVraHZ3TGEya1cwcDB6RFdTNkR5VzVzMDRiUDh5ZW5WS3Ro?=
 =?utf-8?B?akJTanhQRFBEMmNGSGhtaC9lRkpoV1J1ajZFeE1objdickh0SVJ2SnB6b2dm?=
 =?utf-8?B?enJ6SW5QSVZaYkVNVy9vdDhMN3h0NzZrTWdhRGdVbEJtMXNaeGZmTitzak1G?=
 =?utf-8?B?M1JPeFd4TVFqdVJOaENObFZCS1llSmZ2R1RsTllrbm90T21oOHliS0U2eThY?=
 =?utf-8?B?WHhpWjY0c3VvRWxaNjlJcUxlY3RTY0ppTUJhQi9lcEZPSUpVbVd3ZHBEUGtW?=
 =?utf-8?B?Y1lWT1A0UmUrejdWU2Vmb2dOMGVzY2VWMWk4VlNEU0IxTm1GY083ZlRjVkg3?=
 =?utf-8?B?ekpmbDd6QmxPenpHWm9EWEtkWEgwZmZCQjhGOHFrdFlsQ25FVVdTNWxkbkxP?=
 =?utf-8?B?cWdQalVjNVh2NHJYa1J1dXQzTHM2bE42UGVENWRiY2l0UDNPMDRDTGlOdkdt?=
 =?utf-8?B?WjlsMFptOEhmR1cwMXpPb3NmYjBIUDJXOXYrWjEvQ3laUzNtMC9nQXFGT05K?=
 =?utf-8?B?WHhZR1dQT3RubWFkb0g5b00rSGJGbll5VGxKQmNxNitlOS94eTA3bVJJM1Fy?=
 =?utf-8?B?ZkVvNUw1WEpRMFJ2aVByay9ram9hQmJ6MUM5aWtUWDBjcGlIQVBSVCtQZUxZ?=
 =?utf-8?B?aWRSMkhZRGwrSUN0b0dMTmprc2hwYzkrUkZDT3NsbzdqSGpnU1dOUTkrUGIr?=
 =?utf-8?B?UkZhYk1obTF2MTMxZWhwL2ZVZGtrTWpUTGZrK2dTaTBOZnFVMHNKWHNIMmhF?=
 =?utf-8?B?UEJQV1VXMkdwWUxuUXVuR3NpdVZhaS9hRzJSQURlN3NkQXRXS2JYMkp1VlpM?=
 =?utf-8?B?eFF1Ny9CNklxczF3THNJdWpqTmZsd3V6bzI4WWRVb0U2OXUxWmlhT3pIVkVF?=
 =?utf-8?B?MmljQ3AyNDNOOEJxb2NRUmFBYUtQMEUrQStLaU03RXZKWWV5SUxOcHdrb2tF?=
 =?utf-8?B?TDJwRFlyTkRwN1BseHBVRU9PNWVhTTdYdU4zczQ5alV4Y0IzUDVvbXRiVVA1?=
 =?utf-8?B?MlloTTV6Z29XNXVnTlBMTlNjYTNSVnNhOG1uOEdnOHg3d29QdHV2RHVuMVpo?=
 =?utf-8?B?b3JoRUFIZzFmejhaUmRsdFdnSUlkNGNNWGlvbUQyTE5TdzU0dHdoWVBRVGtp?=
 =?utf-8?B?NjBabVI2bmV0UjBUeHdZY1JsSFhEOUF2dkRrRnFsRXd0Yk9ua3o1RVlPVWlG?=
 =?utf-8?B?OUJXNFRJRE00MEo5bTFibWNNT1RSWjZoS25GMUtsK2k2eTJvSlNDcklDSDl1?=
 =?utf-8?B?VW1iSndZZmJvQWZRcU52clJsWmovODR5MU1tYkNNWFp1WmQwek5ONC9vOGU2?=
 =?utf-8?B?ZGtlcXZEbDhLaGZLZFlEZFJxdjJFd1FVL3Rhenh5ZFB6UXRhTUlObkp1UHBR?=
 =?utf-8?B?bU02L2ZzdnMvd0I2dDMrdDEzRFNMQndLVWxiMCtVWjNYMHNJWFZUYmxtWXRP?=
 =?utf-8?B?WmwzUVJidHo5dFNKNldCUE9vNS95MExoN0dFZmFvanM1ek5YM2pVUThqRXh2?=
 =?utf-8?B?OHZJTHFuMDkyT2laczRVR240Skh1amJJdjYrc0RHNVN5MDRJMmdvK1lQR2ps?=
 =?utf-8?B?UDlNVHdGcVpFVHhLd3BLbWhzL3VKR1VSZ0EvRlF3N1ROUURENDhUSVUxRnpR?=
 =?utf-8?B?bUhoVGJiQVNUR2UrbE95anpSSjkxYkUzWmk5SzducGg0bUJQa21NWTJFVC9V?=
 =?utf-8?B?ZnRqU3hLbXdqRHR6bDd5U2Y5cFYwUHhkRUVpS09yN3pQR2ZGclZqK0RIenZy?=
 =?utf-8?B?clZBVGcvb3RmaHJIUWRnS2oyTmlwYUR2NUtJbkVDQ1F4NDVzT1NtVHU2RUNS?=
 =?utf-8?B?bkpwMWFsMU80UTJLVkpoV0lncGY1TVZwVCtidjVwa0JGeXY4RHUweWpoU3pV?=
 =?utf-8?Q?Rz6e8KiC3oRKZtv8m+KBX7su5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31512f95-9d4e-47d0-0f84-08dbb2b856df
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 11:15:00.7296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d88cp2hOa0uZbG15uI2bDmU31bctEAlYYzeI1+Oz/vAjkrEBxBR711S8yZGlNV8P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5649
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
Cc: alexander.deucher@amd.com, pierre-eric.pelloux-prayer@amd.com,
 kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.09.23 um 05:00 schrieb André Almeida:
> During a GPU reset, a normal memory reclaim could block to reclaim
> memory. Giving that coredump is a best effort mechanism, it shouldn't
> disturb the reset path. Change its memory allocation flag to a
> nonblocking one.

Since it is a bug fix I've already pushed this one into our internal 
branch quite a while ago.

Shashank can you take care of picking up the remaining patches and 
pushing them to amd-staging-drm-next?

Thanks,
Christian.

>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
> v5: no change
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index aa171db68639..bf4781551f88 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4847,7 +4847,7 @@ static void amdgpu_reset_capture_coredumpm(struct amdgpu_device *adev)
>   	struct drm_device *dev = adev_to_drm(adev);
>   
>   	ktime_get_ts64(&adev->reset_time);
> -	dev_coredumpm(dev->dev, THIS_MODULE, adev, 0, GFP_KERNEL,
> +	dev_coredumpm(dev->dev, THIS_MODULE, adev, 0, GFP_NOWAIT,
>   		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
>   }
>   #endif

