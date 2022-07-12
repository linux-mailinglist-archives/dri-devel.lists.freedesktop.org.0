Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFDB57135C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 09:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151D08F353;
	Tue, 12 Jul 2022 07:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59258F3AB
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 07:46:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4mr0XGbE2ZxlfqjhdI672GEvVZm4lvaaGgP9UHooCVTEUBZui7NM9i8LWNff50USjWRvyUm4vwu/ztu23lI5cBBZHP5B4BnIWyS21iGMLwftR386awwyi60g3UlQ7EojpEvSezAbGdT5EfRwWYErKoaLFfeZXciY7W0BSMWpUo8FA39Q7cWUghFE6U8LS4s081C47dvgciluXfY2cTdLVwIY312ONOio9GLq2Wv8io3mMzxjeR3egxytFXgA4w2gEybyG0SIt0tlRXIAmNYN4zM1t6kJHBmRedIqLopJw4t4f+j764MwOQaFtpkS/4EQnp3lxc8MkryBRCTM/1wnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+Qu+PSOQ6ZCcZmD3jtAVvHQ6nKGevXabSeu82zDX1k=;
 b=PUutB7WmDI4wrADfscoDgvdKTgXxxgqXMb/o8jBb+gQdgaPu74MsWfcFQIDnadXIPHXHZw7lGSSOvMIbc3Wa3SdtsiBKDjxMyb4aqpq1ixmMfyzQaac2kgS1XmwiBF/haS25Tl8ebX+QEChu3GldF4x241kthwLhXO8/5NGblFV/+Zaib3PhKMeDuvtD7gi/GzIeAUQXJdwlu0C7ZFWRerWoXVxshEYozhzTrm+Lsv7QvZtp5ufMPYk5y44Y2deIucwVDqdh3COBWJAp+4ffBtrjxrLCqIOH5UNvEm00zKuxl3F3MjFAa4VC3X58roptV1xB6ABcPS22Z2pYLf0LgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+Qu+PSOQ6ZCcZmD3jtAVvHQ6nKGevXabSeu82zDX1k=;
 b=dGrOXzbOUsR4vYzY88szrcJT2sVJNbxtuSedRP9xtp+SrDaTHSB9QeggibwWn+gsHlHASYTBNSHwENcDne4WJdb+UM61IlZCyT3ccTWgcniiPi6N7Ig9ODJFRgbQFfvW4tbDF5uZANwwGecUYuVJdwTLd5kSet/TBgcgRxjR+D4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Tue, 12 Jul
 2022 07:46:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 07:46:01 +0000
Message-ID: <6e490429-e34c-fa51-c6d9-3315c4639d9d@amd.com>
Date: Tue, 12 Jul 2022 09:45:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC][PATCH 2/3] drm: vgem: Enable SYNCOBJ and SYNCOBJ_TIMELINE
 on vgem driver
Content-Language: en-US
To: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>
References: <20220712042258.293010-1-jstultz@google.com>
 <20220712042258.293010-2-jstultz@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220712042258.293010-2-jstultz@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9177020f-c08a-46c9-953c-08da63da90df
X-MS-TrafficTypeDiagnostic: DM6PR12MB4435:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: upc+cZRuw7BW4b23t3c2fE+tfJYMipIZuBoS7/V2H2igJJOgf6j8pDKUCVxBeBYTE/Ik6rD7zGLMt2A6FOQwVsaQD0FR1jzBqj/FZMNqa1iDqghlvJ0Lllrscb1AN86kmzhnSA/89mgDkvEwalDQ3EOQka70+cMkrVVQumLpGwqxHNboz5b+4aO1T8glnjF4YNRPk/zTlxlDlkcLNBQAMxCRsOW2gD1DgGI23npQRhiZ4XA/5W6e0l5fMOLYvHEXyVViVOjGgA+T32Z7n/oMR/v97sAh4vRxLbemdDOKikX03BlnN2rIMWrTeWoqlHMhN84WoyCAyAWbsyZ5vrIlill5Rss5KZtX9ETx6vXzj5f1N0pebiJtnVK+NN9vfTnpavbXeDbTl8Rj7cCKDLfH7q1il0pKoTa1syIvlbLxCzHAdPQqu64NgSh78FTI3pcNs92bMe/pfjeDPeY3YzF0JFzfVupJs49NuCuIN6z+qAyrkX6cFTwhRQukVMAmwT4InKBrzad1S2pTQzIZSWen9F8IImM/AFFK2U9QpEn55lnDDcX7vqc55SrJ9xPG7crlxFtFa9QY3R3M5vUSwmvu4OORehGK5JI0n5KmWBbc7Sj43q+YcZuNWS5qhzy4TfyTF2TcDfaTSCSylj6a1E7OcXc63Y+ar9/4vywecAUqm1Sm/MP4quxXBkHEutgQkVMTJhibbYawgIGw/P49CJeseWfail/zeyOgeP40tn9dteSu3T6Ro/ETKabG6lzj/UuMXv2xPx9mxfqegPPDFFGrdl5veo1I7usYSNrlSvwd18+ME6DWCbcLgz11X0lXaziVELKA5PsL2JZPB6d9rK+clkbSJd9PfipjHUJ1FWzxEaQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(41300700001)(6512007)(316002)(6666004)(31686004)(36756003)(54906003)(2906002)(110136005)(86362001)(6506007)(478600001)(26005)(66574015)(2616005)(31696002)(38100700002)(8676002)(4326008)(66556008)(7416002)(66476007)(5660300002)(8936002)(66946007)(83380400001)(6486002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGpVRjE3ZlhEWG0xdkJXVHg5Um1DbW80bFdNSEQwRFVXR2gvbVBvdU5KM0Jq?=
 =?utf-8?B?N1VMS0pxb2RPdkJRKzFyT0t6UlJjVHZ5YmI2dEpzZ2J3N0o5bFN3TUI5eEdG?=
 =?utf-8?B?UHN3eVpFQ3psZlg5N2pSNTRoc2dSYjVLQStZYjZUMDBrNE5sUlFWRUxLVWI4?=
 =?utf-8?B?dStUSzFFTll3SFpnSzVpNDBVYXFpdVBZY2xlV3o4blRCb0tVckRMRTF2bzNN?=
 =?utf-8?B?ZlplSkY2cUZZVHR0WHVkVTU4L2pXK0Zwc2lWR3hjKzZKa3BpYkNHem0vK3RT?=
 =?utf-8?B?WWgydnZqcWdUaGZtK281aUZxSTUxUld6NzE1OEg2MDRPZWo5UWg1VjhTL0Yy?=
 =?utf-8?B?SkdzbHBqNTF4Y1Z2OStXVTR1bDN3WEFEa0dtOVhHMEJvRk5wZ1JxcTNleGdB?=
 =?utf-8?B?ZXdCdW4zMkMvNitaNHVoMzBqVENhK3BLT01GM1ZvdWhHMEtBVDFqdEozNmJr?=
 =?utf-8?B?UHRjWXNzVU4vOHFhdk1CREdxSFJObEFoTW1iMkcxQ2x1UmVTa2E1WisvOVVR?=
 =?utf-8?B?bWszbGRjV1doREgvRlA4V1p0K2x0bnhPbWJkVGl0ZTd6WmN5NkF2VTdDNDF6?=
 =?utf-8?B?T2h5U282akM4K2tFWDRPbWYzenpkMXRLSndxejNOZGhlb0srZEd3dUkwTG1P?=
 =?utf-8?B?cDFLVkJ5R2NoU0djNWZWMFJNWFk2V3lzRTVBVXRpVGR3RkN5T2dvK2VVa1Fy?=
 =?utf-8?B?TlJxcFpaQklUTkV6dnhkTHhPR3Rzb3JxRTJUOUxNOEFpa0ZidWdmQThjbmht?=
 =?utf-8?B?ZklIWTdhNnFMYVpwTU50Ty9wVmNMRUQ1N2p5aXRtNWJsNWU1ZUZGTzdtTk1n?=
 =?utf-8?B?UTI0L3NpaVFZWDFRZ21KVXpYdEoyaXU2VjNFRTM3VUxHT3FpbzdGZVFjWHpt?=
 =?utf-8?B?a0o5RkladEg5R0M4Y2ViUURWNVNhdUs5cWN3NHJ4MVNqZ3dvQmllQ2hPd1Y2?=
 =?utf-8?B?SUEzeHpmM3lta2JDUDF3enVSRVh2QjQ3T0orOGRHZE9rWXBvczdleVd5Ry8x?=
 =?utf-8?B?c0pZV2FGaDdWN0lBWGFVeERySG1BVHF1RU5hdHY1UWIyNTY5TExBVnFnTlln?=
 =?utf-8?B?OXNIUGMxZnMvVGRkZVoxcmJXWVlieVEwWEd0aVN5ZWxuZkhoaWpNdlhYK1Fa?=
 =?utf-8?B?QVlHN3NMSHR4dUxVdnRnUmU0MDl4ZzhJV1I0cDdPUmdsUGJ0bkxna3hvSWdW?=
 =?utf-8?B?cFJMTHNPUUpuOExQS0tHSU1rWW9kemh1R3FTTTRVUGNtOE5HdXRNL1V1REpk?=
 =?utf-8?B?eTRFQ0lmbVp1M0hzR3hkeFJzMTJlQjBOaUNaRCtjVWRiMmhUSXZJRnFrK3Q0?=
 =?utf-8?B?bnc4WktlWmcxSUcwTCtIWnVKVEF4UGR3c1pXV2ttdVdpVC9aUUowYTV5eE85?=
 =?utf-8?B?Mm1mdGw2S1YwTG9rSkpJOTdkS05MY0tvTGdoYnB4WllXbk8vQXJXdjdjSTJr?=
 =?utf-8?B?R1pLZkhSZnVqYXpDRG9TWkY0ZnFBb1NwSUNUS3AzbXJKK2JRZndkeUIrZmtS?=
 =?utf-8?B?QmxJcHlHbVp3cjlINUpMb21YNHdCR3djbkd5SG5BdTVnQkFKdS9HekFlYmZk?=
 =?utf-8?B?dmJxS1VQZmRXamRNUmVFVE5jMS9lWXVWQlg5RlVrQlIxOUloU2VQRlNKTm1j?=
 =?utf-8?B?OGhaeFpJalV1cXIycXMyYkhmQzZkU3lpSTVVWjFrVml3NTd1c3FvOVIwOFF6?=
 =?utf-8?B?ZkFTdXRETTlid2FNeUJrMnptNHVpRVlQNWhWb1JyQ3N4cG5MUVRGU1pjTTFO?=
 =?utf-8?B?ZXVQcmhVTTA5MXJjY05uQkNJMzZFWTRyM2h3cy9GRGJXc0Z1NldJRHNIbzl2?=
 =?utf-8?B?RWhTczQwczlGT0wwTjllS2I2dy9Ib21VWGppOFo3c3gyc09GLzFsWHYxSWFa?=
 =?utf-8?B?eFpSUHNBOEJvSVdUL3NRMDZhdmFFeTRpbWFMUThHaWtpdHpyRmNHOWFMN0RF?=
 =?utf-8?B?OFRrWUtPYUpySlF0QUhTZGt4NllGUFdtemJCaE9JSXhIcXliNkd6azExVDBk?=
 =?utf-8?B?Rnd2MnJlcGRsYjZuaUZQa0ZNeHY3aEdPSm16ODhyaXFObDAxZ0g2djhoMHJW?=
 =?utf-8?B?SVlzR0pmbHpQSUJFWTN5ZENpbi95SmZSNE1EZFpSSEtCMG90M1J0MzZYRUl1?=
 =?utf-8?Q?drRmOwMzONg25bFivHFmMqsiK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9177020f-c08a-46c9-953c-08da63da90df
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 07:46:01.3438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P1aYTjNSjqCBY7W5pXm1A/2IBlPalN5r0ddh/a4v5U4gAAzgqcCZH1GC7OFI34n8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435
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
Cc: Chunming Zhou <david1.zhou@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.07.22 um 06:22 schrieb John Stultz:
> Allows for basic SYNCOBJ api testing, in environments
> like VMs where there may not be a supported drm driver.
>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Chunming Zhou <david1.zhou@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: John Stultz <jstultz@google.com>
> ---
>   drivers/gpu/drm/vgem/vgem_drv.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index c5e3e5457737..e5427d7399da 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -109,7 +109,8 @@ static struct drm_gem_object *vgem_gem_create_object(struct drm_device *dev, siz
>   }
>   
>   static const struct drm_driver vgem_driver = {
> -	.driver_features		= DRIVER_GEM | DRIVER_RENDER,
> +	.driver_features		= DRIVER_GEM | DRIVER_RENDER |
> +					  DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE,

Well that's rather surprising. I'm not an export on VGEM, but AFAIK you 
need to adjust the CS interface to support that stuff as well.

Christian.

>   	.open				= vgem_open,
>   	.postclose			= vgem_postclose,
>   	.ioctls				= vgem_ioctls,

