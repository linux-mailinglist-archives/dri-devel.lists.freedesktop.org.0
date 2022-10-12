Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5405FC594
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 14:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A080410E492;
	Wed, 12 Oct 2022 12:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CCE10E076;
 Wed, 12 Oct 2022 12:45:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKV8lBG38jRCHS9edYQRbeJN+hSVfzRPnaX3NhK4Eac+08JncXi6Mh4NZpeY+YNDzYtK7aJWryAkym6tEG4Df+5O/gBvkLh4M+ojlldlLGtzafDIf1pTCi/q6XpzMjbU5iv+AwIgu/ag+Zrk1P1Qv+pyzD67DJz9je4Zgi6eyH7W9N7S3kxwaVvv3CgFKJX1C8ZJ5V6uiYuyldnMlDA6Zpkg/fY6P2RJbTqEF5LJaWlxpjsYx+JwyG8qBVt5zQ6Fy5w6jpHHxe1ShZaKumNuhpse/EYsrybUze8Y06+Ge97cn/GUiJvS0Fe2V9BDpXo6i9L0HVaiq8KXFXRmSITp3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fu63VXocjmcxaZsaVpwCTMt0zOz6MvhSL2HMkH9WYdg=;
 b=NDcEoDeYLessK1WYcGaspxfU2GZ6dUuPBOd+A2CN2bi/oY3NE6bWANblISrLRG5Apm6rLqRepJ73UXlosQ95uhKViGWZgPBVzkIck74XjuuIVY5HCrYe/iMA0uPIKP+3NJ49X7z+IGFye2Td45Ozult7eQ8OFUOdjNNwTXMzUY5L193u60QsbUUjCLgT2fR+fCenKxpTN+toZo5nQLi2KlroffZDXIlKitF4Vx526Pkp1ZubZWD0yuo58AOCP4rdneNuYaQoAIWG3kToEkETVOnFgu/EvT+K5C1XdJNSzy8yyVjZ91vjV9T9Ang1L9qAG/Q8/kmKyeYePGdpkMXKdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu63VXocjmcxaZsaVpwCTMt0zOz6MvhSL2HMkH9WYdg=;
 b=2Yqbxotkhsp4ARTVEiFAyI5pTshfj8T6nffL7QlpEMV3i4r2aPfz/c9LB3KRxhKT4ybuNkFd/xFmQ6NLLPfNqpK0hKWCyxCOQ4t3q540z5F9tjtQ7vzFlYrbLZGzpEYNsWUAcEo22JoD39TOax92+pNXj1DIH6zVUGP3fdiPsv8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW3PR12MB4473.namprd12.prod.outlook.com (2603:10b6:303:56::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.22; Wed, 12 Oct
 2022 12:45:17 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5723.022; Wed, 12 Oct 2022
 12:45:17 +0000
Message-ID: <d1093173-f940-0b68-9450-b5d0b16504ce@amd.com>
Date: Wed, 12 Oct 2022 14:45:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/syncobj: add IOCTL to register an eventfd
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
References: <20221012123241.337774-1-contact@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221012123241.337774-1-contact@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW3PR12MB4473:EE_
X-MS-Office365-Filtering-Correlation-Id: 80bd265e-2edd-44dd-d162-08daac4f9d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SWL5462UGopR8y/N/9zGNDxmqtYxD2wBiI0ltfhG5BlNW8s3V55kM5g/d2QVQ5LWwwUVQX3dx9N4Bm0mfmNBN5yp9iXs0MAm6RFprydt1Kthf3bjEE912VjjNY63FNCQCyAxW2WE6PBkUBsPDSyKiJlFAmZuuaKu9FLfqg2MJEQuHtD/m+OXLIcSq+5EFFXelb3Gfnna5orf6MDPTB6hhGtYZrei7FGFjobZ5NmIal8waGqiyIH/mvPtLZP2A/yyUas+AXglKLOpPBFXOniysos7StkOKyfZ59USr1Q3APF3xYxwcV3vYaMvPa+0gP4TrBSuFHmGBzmwptVPLRql1IfZL43wtaatT3YbnTD0HXZjeXp+iRDMpDoF+3ec8yo29ksYz0RWg7T4T6P+nxBaRhenmIf1/wtrEVCrXxVOkx6I1hxx5OR3bvhj8bneZI87Zq8wjmKavqxD656O8bmOtgIJ5ez5PwIuiNdWbzl6/PQdEVL6gNjuKn8CPBfiNO3UQP4FKmRaU0p+S+2m526UiIeaZzDUNMzs0t9Isd5C0o2TswmmXTWq/fUZiL3QhUciOOqFlaQDsJI/f4bdwHvJOaM3NC7sNv7VAult3f3Y6E5inSQRZUyyTCGc+3G1O839E+/cthUYajswr6QnI48r4FY8Um61qtZ0huXepIm6wTTEHR2DdCmPGI1DmYH7jGM0OzmquU9mIRiwe0Yznz831aJUdLM4Qb/4JlmLbOmUXG3KTXSUwD2BaZR0LoIE8mWrIIweMoybcKZ5kQASZnZwvlQpSTfZC6D0+a6A9U4HpaxBp0Ss+966+MjI+ensdOOvIyTkhN+1911cuhGymwZHWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199015)(54906003)(66574015)(83380400001)(31686004)(6512007)(6486002)(966005)(66556008)(478600001)(66946007)(8676002)(4326008)(5660300002)(66476007)(31696002)(45080400002)(6666004)(86362001)(8936002)(36756003)(38100700002)(41300700001)(316002)(2906002)(30864003)(186003)(6506007)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2RVMXc2dStjZDgvcVlXaytyUGVwRVR4K1I1emlQSEFoSzVwekxVTkJQWXdr?=
 =?utf-8?B?Mkh6VkNzUUUrMEZSWmlGRXRTVHV5dVcybGNnOXB5NHlPV0hoT0VIeStYSmZS?=
 =?utf-8?B?R28yQUpYeXdhNDhiMnlvSjBrMW00Vzh1ckNmL0E0cGxDUFJCWFBCN1VjK0wz?=
 =?utf-8?B?N2JiQWJ1WEVxNXJWbHMyamhlamhob0lVWDNmcjNwRG5ZUTVQRXlMNzd4RThQ?=
 =?utf-8?B?Lzl1ZjI0MytLNmRDUGwzZnJSeS9mQUJzY0FUeHBvdHBoVWxJWEY1T0p4ZmE5?=
 =?utf-8?B?aklSa0MrZloxS3NBQVhmTmdvRGZkRzRLa2oxL1Z4TjFuMFlIcTVxREs0TURj?=
 =?utf-8?B?SndLYUxoUmNQWnFHWU5wWUlNQmVkNjhTOFcxd05wckJ4MHRTR0dLOWRKVTQ2?=
 =?utf-8?B?Vk9YWk01Y0hiQWw4L0VndmNDdUZJb01GdnB4b1BjT1RrbHI4SVZ2MGZRTHor?=
 =?utf-8?B?ZndtMXozaFRPb3llYWptTGpYQ3p5YWt0cDZ6Mk53ZVc3c3Zad2V3MEpXUWE0?=
 =?utf-8?B?T292aDdtMkFlSEM3M1I3dmhUSGU1QkF5MWw5cnBpdE8yVnpLbHI2N2tpRldh?=
 =?utf-8?B?bGI0MWx6bFp0d2VxcjRId2M5U1dpOGdBeEt4R3NBVDFDYWNnQWJ5Q2lnRHhP?=
 =?utf-8?B?Y1RINElSdGp6VVdKTk9qT2pQMDlpeW1xaldwMFQrNm1JYjBaYUJ5Q1FlYjBK?=
 =?utf-8?B?WUpqbjNpUHJYczdjM1laZlVDZ1pXN25qNE5VQWNvMlh6MVQ4T1dCUnQvVWpZ?=
 =?utf-8?B?SFRhMGZwcUJteElSbkJYSkhVQVU0eXZ0KzAvUnpOUWhmb1dPSmFMUFF0Vjhv?=
 =?utf-8?B?d05ldDlVUXYrK2NPbnpSTERWd1NmcEFDNzZzZ2o0dUNiVGZReVFzNGF0QUwv?=
 =?utf-8?B?dzBxdW4wUTBiU2twVFNNbXI4VFZMZGoydG1Ea1J2ZWJzSG5pajUwN29Xekdw?=
 =?utf-8?B?OStxVjJRM20vUm9QcXZUV05BMGNFek9JVTJjaWlPRHRNT0JmQTRCSysxT0Fm?=
 =?utf-8?B?R25PRHMxWDhkSFNLK2FYSFFsc2s4WWhRTkROdE82dDJWVmllekxsZ2lLQnhv?=
 =?utf-8?B?K3VURjZVOExYTGVJZ285VG9IK1IreHgrakg0ajFsakkyYjFKUVBFYmFkOVlS?=
 =?utf-8?B?ekNJM2V3Zm1jamtiSlB2R3Rodk83YlZZckVqVys3cTVzdUxYaVJLQ3BFK0hH?=
 =?utf-8?B?a0RQY0l0aDMrQUNLQlVDNVIrK0RDWXU4L2JvbFFXODVoc1NxdGlNcU5NcktM?=
 =?utf-8?B?MER5dEpUcytMVDBuZjJKcGh2Zk1HWkZXNWFaRjE5NTFIcThEOVhaY3c2dzhl?=
 =?utf-8?B?WVo3ZkRHdFRReTA1WUZUZmJ0aDY0VFI2SUhjRzlTbnpLZGpTcmZmYkFqblRo?=
 =?utf-8?B?bUdYTjFZa1NjMjh6Z3gvQ3hGMFpiQUNJcVBiT0d0Qm8xVlNFWUNjZXR3dUdB?=
 =?utf-8?B?RWU4dVduTjVKTUttTkdwWUtPQzdXbXJCVmh1WDJkZkp3N3RoUEZYeE92N1Ex?=
 =?utf-8?B?Q1d4aWFON0ZuNTFMM1pXa0diR2NQb1RTWGtHOHJheDdCTngzdHhWSmRWR1ZI?=
 =?utf-8?B?MWtEWE0xaVUwK2VDYUpHdXpiZ1ZRRjZiNjhRdGZjU3NpTUtRZFpoNHJYQzJw?=
 =?utf-8?B?Q2lyM29qWXQ2NTRuRTJBQi9XUGd2RkdxOUE2MVVKeEVSS2RuaW9SM0tubTcr?=
 =?utf-8?B?Y3picnprM2hhUlkxSFNRRjdhclVqdXhJREI1YnhpbHcxMEdLQjM1NXhrTUIz?=
 =?utf-8?B?eWI1TVVCRWxVUWJGd3l3cjMwWXE3S1g2azh1TXhpYUhVUmltMW9SMWx1bGZI?=
 =?utf-8?B?Sjc4TE1rTmFZSmNpcUFYekx3ajdmSjdRcmdTcXdVMk9VK2s1SHFBK0lWY3Fm?=
 =?utf-8?B?TndraHVlRW5VbXlnK09NSWlqWTMzQmY3RGcvWFViS05sTEI0c2NNYm05NlE2?=
 =?utf-8?B?OHpHaExmQ1hSNWhNMTRUZzJqVHplT3FsZEtnQ2k2RUlBb1V6UEdZekJoVU9h?=
 =?utf-8?B?M29QcjlUWFprWHBOai9yYXJvWUQ5VUU2ZXZnTHpieEV2RVF6amNwckc0cThu?=
 =?utf-8?B?US91UHZuWUd4MitPVC9hblQ1eDFKTmxOT3ZwMVhPOG5PUmI5MTEvVjZhZ2Vi?=
 =?utf-8?B?Z284bTIyRXRLS2JzdDJ2ZDJrS1RGUUxQcWJUQjd3MmlMMXVKSHRPSXdqOG5I?=
 =?utf-8?Q?5Zr0h8WZIwmylcumR/c1RRc8iJtPW2FjgSclslTsbvbl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bd265e-2edd-44dd-d162-08daac4f9d41
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 12:45:17.0201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3witvw4nBM0chkdTLuYnf3q5kWarkMbDp2AHoIQVARP9dH6hGPsyINs8oEghXzw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4473
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, James Jones <jajones@nvidia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.10.22 um 14:32 schrieb Simon Ser:
> Introduce a new DRM_IOCTL_SYNCOBJ_EVENTFD IOCTL which signals an
> eventfd from a syncobj.
>
> This is useful for Wayland compositors to handle wait-before-submit.
> Wayland clients can send a timeline point to the compositor
> before the point has materialized yet, then compositors can wait
> for the point to materialize via this new IOCTL.
>
> The existing DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT IOCTL is not suitable
> because it blocks. Compositors want to integrate the wait with
> their poll(2)-based event loop.
>
> v2:
> - Wait for fence when flags is zero
> - Improve documentation (Pekka)
> - Rename IOCTL (Christian)
> - Fix typo in drm_syncobj_add_eventfd() (Christian)
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: James Jones <jajones@nvidia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>
> Toy user-space available at:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpaste.sr.ht%2F~emersion%2F674bd4fc614570f262b5bb2213be5c77d68944ac&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C5cc939311a00477ef8eb08daac4de7ea%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638011747896643399%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=COiWGlyLQiqvVJlMaz2BcGLXqVGktLuJTl7CC7jpfDU%3D&amp;reserved=0
>
>   drivers/gpu/drm/drm_internal.h |   2 +
>   drivers/gpu/drm/drm_ioctl.c    |   2 +
>   drivers/gpu/drm/drm_syncobj.c  | 143 +++++++++++++++++++++++++++++++--
>   include/drm/drm_syncobj.h      |   6 +-
>   include/uapi/drm/drm.h         |  22 +++++
>   5 files changed, 168 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 1fbbc19f1ac0..ca320e155b69 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -242,6 +242,8 @@ int drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>   			   struct drm_file *file_private);
>   int drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>   				    struct drm_file *file_private);
> +int drm_syncobj_eventfd_ioctl(struct drm_device *dev, void *data,
> +			      struct drm_file *file_private);
>   int drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
>   			    struct drm_file *file_private);
>   int drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index ca2a6e6101dc..95ec9a02f8a7 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -702,6 +702,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>   		      DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT, drm_syncobj_timeline_wait_ioctl,
>   		      DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_EVENTFD, drm_syncobj_eventfd_ioctl,
> +		      DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_RESET, drm_syncobj_reset_ioctl,
>   		      DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_SIGNAL, drm_syncobj_signal_ioctl,
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 0c2be8360525..659577ad8c07 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -185,6 +185,7 @@
>   
>   #include <linux/anon_inodes.h>
>   #include <linux/dma-fence-unwrap.h>
> +#include <linux/eventfd.h>
>   #include <linux/file.h>
>   #include <linux/fs.h>
>   #include <linux/sched/signal.h>
> @@ -212,6 +213,20 @@ struct syncobj_wait_entry {
>   static void syncobj_wait_syncobj_func(struct drm_syncobj *syncobj,
>   				      struct syncobj_wait_entry *wait);
>   
> +struct syncobj_eventfd_entry {
> +	struct list_head node;
> +	struct dma_fence *fence;
> +	struct dma_fence_cb fence_cb;
> +	struct drm_syncobj *syncobj;
> +	struct eventfd_ctx *ev_fd_ctx;
> +	u64 point;
> +	u32 flags;
> +};
> +
> +static void
> +syncobj_eventfd_entry_func(struct drm_syncobj *syncobj,
> +			   struct syncobj_eventfd_entry *entry);
> +
>   /**
>    * drm_syncobj_find - lookup and reference a sync object.
>    * @file_private: drm file private pointer
> @@ -274,6 +289,27 @@ static void drm_syncobj_remove_wait(struct drm_syncobj *syncobj,
>   	spin_unlock(&syncobj->lock);
>   }
>   
> +static void
> +syncobj_eventfd_entry_free(struct syncobj_eventfd_entry *entry)
> +{
> +	eventfd_ctx_put(entry->ev_fd_ctx);
> +	dma_fence_put(entry->fence);
> +	/* This happens either inside the syncobj lock, or after the node has
> +	 * already been removed from the list */
> +	list_del(&entry->node);
> +	kfree(entry);
> +}
> +
> +static void
> +drm_syncobj_add_eventfd(struct drm_syncobj *syncobj,
> +			struct syncobj_eventfd_entry *entry)
> +{
> +	spin_lock(&syncobj->lock);
> +	list_add_tail(&entry->node, &syncobj->ev_fd_list);
> +	syncobj_eventfd_entry_func(syncobj, entry);
> +	spin_unlock(&syncobj->lock);
> +}
> +
>   /**
>    * drm_syncobj_add_point - add new timeline point to the syncobj
>    * @syncobj: sync object to add timeline point do
> @@ -288,7 +324,8 @@ void drm_syncobj_add_point(struct drm_syncobj *syncobj,
>   			   struct dma_fence *fence,
>   			   uint64_t point)
>   {
> -	struct syncobj_wait_entry *cur, *tmp;
> +	struct syncobj_wait_entry *wait_cur, *wait_tmp;
> +	struct syncobj_eventfd_entry *ev_fd_cur, *ev_fd_tmp;
>   	struct dma_fence *prev;
>   
>   	dma_fence_get(fence);
> @@ -302,8 +339,10 @@ void drm_syncobj_add_point(struct drm_syncobj *syncobj,
>   	dma_fence_chain_init(chain, prev, fence, point);
>   	rcu_assign_pointer(syncobj->fence, &chain->base);
>   
> -	list_for_each_entry_safe(cur, tmp, &syncobj->cb_list, node)
> -		syncobj_wait_syncobj_func(syncobj, cur);
> +	list_for_each_entry_safe(wait_cur, wait_tmp, &syncobj->cb_list, node)
> +		syncobj_wait_syncobj_func(syncobj, wait_cur);
> +	list_for_each_entry_safe(ev_fd_cur, ev_fd_tmp, &syncobj->ev_fd_list, node)
> +		syncobj_eventfd_entry_func(syncobj, ev_fd_cur);
>   	spin_unlock(&syncobj->lock);
>   
>   	/* Walk the chain once to trigger garbage collection */
> @@ -323,7 +362,8 @@ void drm_syncobj_replace_fence(struct drm_syncobj *syncobj,
>   			       struct dma_fence *fence)
>   {
>   	struct dma_fence *old_fence;
> -	struct syncobj_wait_entry *cur, *tmp;
> +	struct syncobj_wait_entry *wait_cur, *wait_tmp;
> +	struct syncobj_eventfd_entry *ev_fd_cur, *ev_fd_tmp;
>   
>   	if (fence)
>   		dma_fence_get(fence);
> @@ -335,8 +375,10 @@ void drm_syncobj_replace_fence(struct drm_syncobj *syncobj,
>   	rcu_assign_pointer(syncobj->fence, fence);
>   
>   	if (fence != old_fence) {
> -		list_for_each_entry_safe(cur, tmp, &syncobj->cb_list, node)
> -			syncobj_wait_syncobj_func(syncobj, cur);
> +		list_for_each_entry_safe(wait_cur, wait_tmp, &syncobj->cb_list, node)
> +			syncobj_wait_syncobj_func(syncobj, wait_cur);
> +		list_for_each_entry_safe(ev_fd_cur, ev_fd_tmp, &syncobj->ev_fd_list, node)
> +			syncobj_eventfd_entry_func(syncobj, ev_fd_cur);
>   	}
>   
>   	spin_unlock(&syncobj->lock);
> @@ -472,7 +514,13 @@ void drm_syncobj_free(struct kref *kref)
>   	struct drm_syncobj *syncobj = container_of(kref,
>   						   struct drm_syncobj,
>   						   refcount);
> +	struct syncobj_eventfd_entry *ev_fd_cur, *ev_fd_tmp;
> +
>   	drm_syncobj_replace_fence(syncobj, NULL);
> +
> +	list_for_each_entry_safe(ev_fd_cur, ev_fd_tmp, &syncobj->ev_fd_list, node)
> +		syncobj_eventfd_entry_free(ev_fd_cur);
> +
>   	kfree(syncobj);
>   }
>   EXPORT_SYMBOL(drm_syncobj_free);
> @@ -501,6 +549,7 @@ int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
>   
>   	kref_init(&syncobj->refcount);
>   	INIT_LIST_HEAD(&syncobj->cb_list);
> +	INIT_LIST_HEAD(&syncobj->ev_fd_list);
>   	spin_lock_init(&syncobj->lock);
>   
>   	if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
> @@ -1304,6 +1353,88 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>   	return ret;
>   }
>   
> +static void syncobj_eventfd_entry_fence_func(struct dma_fence *fence,
> +					     struct dma_fence_cb *cb)
> +{
> +	struct syncobj_eventfd_entry *entry =
> +		container_of(cb, struct syncobj_eventfd_entry, fence_cb);
> +
> +	eventfd_signal(entry->ev_fd_ctx, 1);
> +	syncobj_eventfd_entry_free(entry);
> +}
> +
> +static void
> +syncobj_eventfd_entry_func(struct drm_syncobj *syncobj,
> +			   struct syncobj_eventfd_entry *entry)
> +{
> +	int ret;
> +	struct dma_fence *fence;
> +
> +	/* This happens inside the syncobj lock */
> +	fence = dma_fence_get(rcu_dereference_protected(syncobj->fence, 1));
> +	ret = dma_fence_chain_find_seqno(&fence, entry->point);
> +	if (ret != 0 || !fence) {
> +		dma_fence_put(fence);
> +		return;
> +	}
> +
> +	list_del_init(&entry->node);
> +	entry->fence = fence;
> +
> +	if (entry->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE) {
> +		eventfd_signal(entry->ev_fd_ctx, 1);
> +		syncobj_eventfd_entry_free(entry);
> +	} else {
> +		ret = dma_fence_add_callback(fence, &entry->fence_cb,
> +					     syncobj_eventfd_entry_fence_func);
> +		if (ret == -ENOENT) {
> +			eventfd_signal(entry->ev_fd_ctx, 1);
> +			syncobj_eventfd_entry_free(entry);
> +		}
> +	}
> +}
> +
> +int
> +drm_syncobj_eventfd_ioctl(struct drm_device *dev, void *data,
> +			  struct drm_file *file_private)
> +{
> +	struct drm_syncobj_eventfd *args = data;
> +	struct drm_syncobj *syncobj;
> +	struct eventfd_ctx *ev_fd_ctx;
> +	struct syncobj_eventfd_entry *entry;
> +
> +	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
> +		return -EOPNOTSUPP;
> +
> +	if (args->flags & ~DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)
> +		return -EINVAL;
> +
> +	if (args->pad)
> +		return -EINVAL;
> +
> +	syncobj = drm_syncobj_find(file_private, args->handle);
> +	if (!syncobj)
> +		return -ENOENT;
> +
> +	ev_fd_ctx = eventfd_ctx_fdget(args->fd);
> +	if (IS_ERR(ev_fd_ctx))
> +		return PTR_ERR(ev_fd_ctx);
> +
> +	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> +	if (!entry) {
> +		eventfd_ctx_put(ev_fd_ctx);
> +		return -ENOMEM;
> +	}
> +	entry->syncobj = syncobj;
> +	entry->ev_fd_ctx = ev_fd_ctx;
> +	entry->point = args->point;
> +	entry->flags = args->flags;
> +
> +	drm_syncobj_add_eventfd(syncobj, entry);
> +	drm_syncobj_put(syncobj);
> +
> +	return 0;
> +}
>   
>   int
>   drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
> diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
> index 6cf7243a1dc5..b40052132e52 100644
> --- a/include/drm/drm_syncobj.h
> +++ b/include/drm/drm_syncobj.h
> @@ -54,7 +54,11 @@ struct drm_syncobj {
>   	 */
>   	struct list_head cb_list;
>   	/**
> -	 * @lock: Protects &cb_list and write-locks &fence.
> +	 * @ev_fd_list: List of registered eventfd.
> +	 */
> +	struct list_head ev_fd_list;
> +	/**
> +	 * @lock: Protects &cb_list and &ev_fd_list, and write-locks &fence.
>   	 */
>   	spinlock_t lock;
>   	/**
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 642808520d92..5ac0a48b0169 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -909,6 +909,27 @@ struct drm_syncobj_timeline_wait {
>   	__u32 pad;
>   };
>   
> +/**
> + * struct drm_syncobj_eventfd
> + * @handle: syncobj handle.
> + * @flags: Zero to wait for the point to be signalled, or
> + *         &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE to wait for a fence to be
> + *         available for the point.
> + * @point: syncobj timeline point (set to zero for binary syncobjs).
> + * @fd: Existing eventfd to sent events to.
> + * @pad: Must be zero.
> + *
> + * Register an eventfd to be signalled by a syncobj. The eventfd counter will
> + * be incremented by one.
> + */
> +struct drm_syncobj_eventfd {
> +	__u32 handle;
> +	__u32 flags;
> +	__u64 point;
> +	__s32 fd;
> +	__u32 pad;
> +};
> +
>   
>   struct drm_syncobj_array {
>   	__u64 handles;
> @@ -1095,6 +1116,7 @@ extern "C" {
>   #define DRM_IOCTL_SYNCOBJ_QUERY		DRM_IOWR(0xCB, struct drm_syncobj_timeline_array)
>   #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_transfer)
>   #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)
> +#define DRM_IOCTL_SYNCOBJ_EVENTFD	DRM_IOWR(0xCE, struct drm_syncobj_eventfd)
>   
>   /**
>    * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.

