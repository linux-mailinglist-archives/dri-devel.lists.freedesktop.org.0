Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B97B7363B9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 08:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587BB10E26C;
	Tue, 20 Jun 2023 06:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5823110E264;
 Tue, 20 Jun 2023 06:45:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVuG6IkSjOCXqdEWXeI92ag5xTvrmKMxrpCSv+GMb2F8l+Naqo5b4Snt/I/JL8RKdSUfAAZHgN47ImgOrmC+cstFMtMhVtphHNkDWZnmbVtAAQD8ypUMxPpFXpUAOEIPqMbyvlidtR9c6CPgHQaA2iCi1FEo9M9dvN5YpoUYHlP+0GgW7CH/wB8XZJswklkQozkbU0vpsQhN/FgcIMTHWdZS1YW1gX9C5ZigrK27pArP2JiOe8OIat6DzVFVJwCdy9DkywZfXjGinoiGE4tFIxJsVb0l3IwbO7d2iWRnzxaAMt8R5WBZHCyM9mRVVwUTx/lroBeZv78kdwMmBR5pOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FP0khkDo7XVVLXOsc0YO5tFywdc9jJYG0y71MKW79k=;
 b=fnmBxZ1Ws3VnSA/dsfNlAZ4h8B3eGC3MfJ4rAI9hF1ecuwMitkCqswajLw9zT+2uhf6CcYCf0NIiMm27+H0rhO2+impBSuYx3+zZ2PiylKVqN/vkHUafsLVhDjXMs/Yhvkl4qL3GeUft1SZt8P6vM2OZ6s2TH+Aqgj2lY/pfv7W47HTyE97nBaS5TaeL1AjgdYPZH2+GdeOU98DCfR9FGLfZ+AU2o8o3J/gmRX6StqYFJ6hkeTTVpDl6uz/QfXC9oVqPy/QTHSlII+X/ECnzX/Fj57FOck1523i9W4VnUS30UNW4pUXwgcIrnjO3HEb8pyC357NgsuJNZ4jSZKMZOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FP0khkDo7XVVLXOsc0YO5tFywdc9jJYG0y71MKW79k=;
 b=D/uMWka1QW8Yog3XikL/DBZ8pu0O8t8W5IXHrfLTp94dfoGDhbtzowaudMfBIETr4jLUbHM/QWijnqccTduIoEGrb7x2UlRE+nIxd0mP0bD0jryx5rvAhTwXK4UeSnrxXqLcBfYljIGYL5hAk+Tu+WNvYULLogGDma0U1FIk09I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB6692.namprd12.prod.outlook.com (2603:10b6:806:270::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 06:45:45 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 06:45:45 +0000
Message-ID: <cf6846ea-5bd0-0b41-b7e6-901c70701751@amd.com>
Date: Tue, 20 Jun 2023 08:45:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH drm-next v5 03/14] drm: manager to keep track of GPUs VA
 mappings
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
References: <20230620004217.4700-1-dakr@redhat.com>
 <20230620004217.4700-4-dakr@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230620004217.4700-4-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0240.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB6692:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c58ac4e-1b54-4ef0-7e05-08db7159f96d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NXM5juGnqO0M0gw7+gJLCwHIbhH8JMHcurLMLY8cWJkXLWbHItCAMyLGk2fnVDHFHxr2QxMzZfPtQTFI48i51C3eGvKryjF6VDEpwN6BMnb5ySultXrCYJ1GRjcrcpO7ZQ7Dad0Fy+Wa3DAhorZD/lCz3+kRsvW2BA/9IPKZ/iZxt4D7AmwKuDf+R0cjXVQP2zLKDeajsge4fp9n/hENwgSR+mqU+agTkWWlH4gdIgtOdWwSMzNxMxbspjSQL41gdWXaSmbBoJuFtXqKTy2x/1Wn4uoKcUsryTnT93jKPopopqjp8Mk80fI9V/n3GS0I73c1ogXq0wAql6uV4iRfky1LT25DwAOrw9FxpqVmUXSW/qQeJIUyn/HvV17otX1DAtVYl6cllZn54W5pe57y48moZNCzR0yCVOs9VQbxjLuxYT2N/rX8YjykPAgoFbg07oVF9/bW7OR7NpOfJzy768Ra9QjhYlwzwHogU2XiUi9VVEyoxbXTt9lQlRZq3oz0Bk0IUo8qyA1FaYwCHxDnANEAjYNGEmbVWs2u8ag3GPwk2SRIb/LYMgcVgPgAMq//7xsOfC0DCZiwBVFdo9nHCLRMZvOk1bf3XsrPeiD3X+lTvGYgyiNeBrg/8ymwvlnZ3OTd966PZU1cZ6T/3z10y1w62IElw+l+yg5KhmbUn1M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199021)(41300700001)(5660300002)(8676002)(8936002)(2906002)(7416002)(36756003)(86362001)(31696002)(6506007)(6512007)(26005)(478600001)(54906003)(186003)(6486002)(6666004)(66476007)(4326008)(66946007)(66556008)(316002)(38100700002)(31686004)(2616005)(83380400001)(921005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUxqdDl4U21EZmdQQ01GUW9LSHVaK0dCeUR0NkQrTnRuTHUvZXNZTVNtUTk1?=
 =?utf-8?B?Y0hFM0pjSms3WDhPYU5TdDR1TWx0NWJYaDRjdHN6SEZxNlh3Vlk2T1F3QXZT?=
 =?utf-8?B?Z0F5ZFJ4d0ZSNFlMcUMxS2V2S1VlYTNHSUlGN04zclFTQ28zZjFySG1DZ3dG?=
 =?utf-8?B?Rlp2dVZQVDJKWkJBVCtOdE1PVzBQTGNkSXB0d1I4b3I1c3k1Rys4UHJQM0Vq?=
 =?utf-8?B?ZzVZa3BrMWZlRVZQUDVuTmdDWDF5N2lta0JmMVh5bVFnYnhvaG1CMGlvVCtB?=
 =?utf-8?B?QmljQ3AxbVA2U3JaS1VlcDVGSk5ONzBySWttMGF3RVFQTlVLajl4Tkx5elRu?=
 =?utf-8?B?NDJZRi9mL1FmcGhzcDJLcmkyNkNoaElwR0I3R25oOFhCdEdZUWtCSnVJcEVt?=
 =?utf-8?B?YkNBNVlGQUR6SlVxaXNITnlIaFFUNGpmZlhDOXpBd2kyQUhod29hSzZ5Sitn?=
 =?utf-8?B?bnkzbWY5RE9wTTRPOE1tczRDZCtXQ0t3QnJlWHlqZFNZalBSZ1FsYkFmSGFF?=
 =?utf-8?B?ai9aeHNUZ1Y1b3Y0aTZoT01SY1FaVDBxMGE1ZjFQMTd4Z3VmaWVnYmxmb0VQ?=
 =?utf-8?B?ejYxdFdrYlFzZGIzYlBWYzM0NXJlUXJFVExzcURGb0orVjg5NGttZ3pqNDgy?=
 =?utf-8?B?RmtZRzlhMW9ZMEdIUU9HSTBSL0NaVDFRc3l5TTBoMGZkdUVzM3FRZGxKM3Mz?=
 =?utf-8?B?U0NHMHVyUjlOL29adDdVNFpUY2dvTndSOUNZUmVYQVVnajRDZUlMaXRuSDNj?=
 =?utf-8?B?eGJBWVhhcTFndm5nYXhETnhYTHAwbWRIUUJCNkVWTnlnZnZDN1JmdEZTd2Ir?=
 =?utf-8?B?aXE5L0VPSEYxQkpNTjlGU01IR3NCSk95c3V2ODBUTVcxcHRSQVhqN1FmNE41?=
 =?utf-8?B?V1pURWY3dnBRV2FvWjlXWS9xVC9UbWs3dmxjT05Wc1B2ODJZRXF2RHRkWGxt?=
 =?utf-8?B?Unlybnhhb2tUWHNWZ1pyMTZUdy9MMWlxTHUvdHJKeC9GR2l4UUNIRSt0c3lR?=
 =?utf-8?B?Z2JZTHFld3FGN05GbXFXUzhkRUR0eUk5Z2RVYnR6aFlERG9QWlVaSXF6TzlB?=
 =?utf-8?B?S2k0MTNiWlJ1YzAzcTJ5bm1xNCtQU3YwMkJNSk9Gb2R2VVVTWWM4RURKaisy?=
 =?utf-8?B?bnRVNGx0ZkxTdTRLak9tbitSdlpYNVpnTzJjKytOaTgyNE5scCtpeDJuaC9t?=
 =?utf-8?B?cTBNQ3ZVcFc1cUx6WFRNMzNtbllnRFNCYnJZbUlwdHlvRjNKNGgzc0Nla3Vz?=
 =?utf-8?B?TkxyYmVwU1d6Sk5ZU1YwaXRlWG5QUnJBQjVNcllMV0hwRlVsODJSMkpyQUg2?=
 =?utf-8?B?SDhxUEdmT0VjTDF0UWJ1akxFM2h3R2tPTVdOWllWVXRvY1ZYZTBqNzVwVHhw?=
 =?utf-8?B?V3pKRzAxcSttRDhQbDBja2ZtZ0xWb1o2NU8vL2NDU1ZPQTdUOFFvbHZrQUpW?=
 =?utf-8?B?WTlrZHZMekZ4QXRKTDRwU0tkaEpWejJJQWZHTm1rM1g0SFQ0Z0k0ZE5tcWFX?=
 =?utf-8?B?Tjd1Q3h1ZFRWMzVQU0MwUVhGRHVsanZzZ0hIUXRiVlR3NjljcVVXMi9wckIy?=
 =?utf-8?B?L2RvZ0lRNE43eXpRWkE4Vnk0eC81ZzBpaFh2U01PZ3NvY1NyRUZhSVVYOGpX?=
 =?utf-8?B?L01Rb1oxc1VGSWtHV3dTNWV3cVBmSTVVbkl6SDFscU5ld01EYzdXL1VTbExH?=
 =?utf-8?B?TmJFL1ZMeGl2bTA0bXJXSVNOYmNYVDhMdjlWY2RTYi9ITkVROUJUa053bkpP?=
 =?utf-8?B?c3JuZnYwTkRZT0cwUmdPaDVvVURYOVNOUk0walo5Vk9yd0JGcTArdHpxelR1?=
 =?utf-8?B?Z0c1NmlySlp2TkZqUHR1MnVNZzVQYWpWamw0MEhSYnRTd205TEgwMjdmZm14?=
 =?utf-8?B?STU1T29Jck5PVVR3Rlovb0ZkYlpmZnU3MVdRNDcxTUdRS3hreHplZnVUWjRN?=
 =?utf-8?B?N1A1eFBUMkVkeUltMVBQOHhhR0hnR25Geks3ZGkwUE5MK05PVWdYY1VwUjRa?=
 =?utf-8?B?THJLZjk4d1pnWnVrMFIzSFFsRXF3cGczY1NBcWYzWmw2OVA5SS9zbHIvd0VX?=
 =?utf-8?B?amtyak5HZW9JMUZQUVlJbHVZZlIwaExvSS9SdkhsRW4wU3FHNFAxNXVQSWti?=
 =?utf-8?Q?DzH2icqrkSULk4QA62OKneTIz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c58ac4e-1b54-4ef0-7e05-08db7159f96d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 06:45:45.7074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOvcmq9iNz0c4Y0irlKS7+fnH4/R06Wj/qaJ6dNUPmcz5QhEUkJ53mqzRy6Gxdp4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6692
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Donald Robson <donald.robson@imgtec.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

sorry for the delayed reply. I've trying to dig myself out of a hole at 
the moment.

Am 20.06.23 um 02:42 schrieb Danilo Krummrich:
> [SNIP]
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index bbc721870c13..5ec8148a30ee 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -36,6 +36,8 @@
>   
>   #include <linux/kref.h>
>   #include <linux/dma-resv.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
>   
>   #include <drm/drm_vma_manager.h>
>   
> @@ -379,6 +381,18 @@ struct drm_gem_object {
>   	 */
>   	struct dma_resv _resv;
>   
> +	/**
> +	 * @gpuva:
> +	 *
> +	 * Provides the list of GPU VAs attached to this GEM object.
> +	 *
> +	 * Drivers should lock list accesses with the GEMs &dma_resv lock
> +	 * (&drm_gem_object.resv).
> +	 */
> +	struct {
> +		struct list_head list;
> +	} gpuva;
> +
>   	/**
>   	 * @funcs:
>   	 *

I'm pretty sure that it's not a good idea to attach this directly to the 
GEM object.

As you wrote in the commit message it's highly driver specific what to 
map and where to map it.

Instead I suggest to have a separate structure for mappings in a VA 
space which driver can then add to their GEM objects or whatever they 
want to map into their VMs.

Regards,
Christian.


