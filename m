Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E97C4367CB0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 10:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CF06EA3C;
	Thu, 22 Apr 2021 08:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B936EA41
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 08:39:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtytwcLSlMhcf5JYzUccbINQVjctunejJu/mRNCgrSamc55r5KAA3gffiVCyf6ANtarJ/hJWeUF5KN2+YpZ3eL7IsSLpmXNtqwL6bkI+ydc7Nd/mFPlHxBvXpeKmzoiLCtDFLSNbsKprSBdBNZu8RLlgUfuonwxsmx1S0VqeEg5vKtaBkXKD7ffk3n/pSUn+jCHMNxL3zm4lWMZp6oToCc/QgEmAx+9Unzyyskn6MlbeUgFF2zZiU8mc0Qh1tkowoNpMART0pV79L92T2Uk55ou17UrycSnRf3JdeCZhK9ScgEflJLci5QU3kL5a/9qUjQEoykHpDvq7KJkQtpvfxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLLia48zXusExFIWyAPzgAtlevB+B8DvJ22tc3SaczU=;
 b=DxZZ/J6j6N+s9PIQThuCsVreL1Hzs/TEC9Rnx6MEUCmLx8Aqoj2F+IrzYRo4s8XXI32CYKpKGjI+wCBZceBPPQ38IuDGAMTNY6A7iASt69LYsueDhk2eaJW6BRz/1R8ZYh5XAoZau7lh8qSbla9yLAy8VnLh7vB4YL9NJmJyXotyeOn2QbLmMWzV4ZD+TyuDrhVsozILomzeWi/kzzpxrbJFeHerKjx7bsQQAVLE3YzLE75IyZJHqp5s9RpC6bHyFD+56gXd2DRhReWQj3570P5nTrX+ed9vN96rvTmHQFIJXmoSZUbXZLzs7Q67vzKeImhXUA5MpdYI8LLoLbrpqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLLia48zXusExFIWyAPzgAtlevB+B8DvJ22tc3SaczU=;
 b=i3IdYRIZ4v5/ZThjB0saxD+9RiWNJZpeOvyu52526gDeRdufkkwj5gNk+X2yEGB6NwpRZoW5qG6GHKYVkD+zniN+rMQLZWgpL/YnnxoX21v/5LR5Ol2IcxEd5RfFFmc691Y7q+TgPrq/3OCeaqa9LvkLF+hQzcmm7EyY7DgLps0=
Received: from DM6PR12MB3196.namprd12.prod.outlook.com (2603:10b6:5:187::27)
 by DM5PR1201MB0011.namprd12.prod.outlook.com (2603:10b6:3:e4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 22 Apr
 2021 08:39:34 +0000
Received: from DM6PR12MB3196.namprd12.prod.outlook.com
 ([fe80::2477:9f69:235:8392]) by DM6PR12MB3196.namprd12.prod.outlook.com
 ([fe80::2477:9f69:235:8392%4]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 08:39:34 +0000
From: "Zhang, Morris" <Shiwu.Zhang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/ttm: fix error handling if no BO can be swapped out
Thread-Topic: [PATCH] drm/ttm: fix error handling if no BO can be swapped out
Thread-Index: AQHXNfIbH34MhAbBMUO5iM5Kp9RA26q++haAgAE/uaA=
Date: Thu, 22 Apr 2021 08:39:34 +0000
Message-ID: <DM6PR12MB3196E2F96415AB6D5F54D3CBF9469@DM6PR12MB3196.namprd12.prod.outlook.com>
References: <20210420143257.13865-1-shiwu.zhang@amd.com>
 <91c93764-119a-3ffa-a38d-2b2202fdaa51@amd.com>
In-Reply-To: <91c93764-119a-3ffa-a38d-2b2202fdaa51@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-04-22T08:39:04Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=f459aa43-35b9-4ee8-ad47-003724152183;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_justification: I confirm the recipients are approved for sharing this
 content
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 687573ad-abcd-4f78-bc91-08d9056a27e1
x-ms-traffictypediagnostic: DM5PR1201MB0011:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1201MB0011A3A60F498CBE9E50D9B3F9469@DM5PR1201MB0011.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VK3YaBesNOZD+mY15bhvWyKAHW2tG6fArau0FThYYW3CfBTSYI/7xO84l+mkaGZBXKkjDsIwaaxDnWX6aJzMbbJkcO8GeJrmCIYk42h/bT1ez7+2ngPxlDcsOqwOMJM3XA0saG45nPfVCyuJvbi4lpgKYXG3CM4V1wuMkS2j+cyjkH7pDDHjZogkI5hZpofg7ll2IOb9SYkpvOQCi11vhHOhFkp0h3j2U6vf1T+EljWWRJuwt19Gdyr1YQMxJMgNhHuAUyKZbXhxzdZrbNSJqFKZdbfZ6PD5+mraj2MYMcR2HgVNtzC4jbdv+2UyKhMOkikisco3Tg/8AkWuvDJ1+S4FbSU+HjYEZFac5vIsnO3Q7ahuguF2ql556JW/e2HLpj0VH5ldBQ6PThwKuyaQm2xWEdTsm97VTHvFeM8CGoOaeRdIiHTfYJKQEhJWgyNtFdJfW4OQEZK9sxTVelvpYO8jAtVASlBtzDpCfp6JC3DRc9/8kjs6pzONJDRkraOf1vxdBasmgOIlPE/quw2QooVoW65iMdOD3v0qBIrbnRsgiAbQPSgHHMBADDLcLBDc8C7235Ufa6PfsS48V2y0WYvGy1yLw563fWnKlMXEBgw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3196.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(6506007)(66476007)(64756008)(5660300002)(53546011)(186003)(2906002)(478600001)(52536014)(9686003)(8936002)(33656002)(7696005)(83380400001)(66946007)(8676002)(316002)(86362001)(38100700002)(66446008)(55016002)(66556008)(122000001)(76116006)(110136005)(26005)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WmYxc01PbFJFdFdROVBOT0ZBOFVMWDBhS3dxcW80QVlWQVo1TS9SRis1MkJN?=
 =?utf-8?B?Y0h6dmVza24xNEMySityZVpsSzlFcVNESktUOXRFSVpsL29ySk82enVKSmli?=
 =?utf-8?B?TWxWKzdTVnRmWDFlQXBMMm4rOHkrSTJEanBGd0dJUlpLRlpxMmZUWHJNdE9a?=
 =?utf-8?B?Skw5QUpWcGZFMk9MT3hwbTNHQkxUb2U2Q3VJTUs2a2pMTDhzcWx2MGNIZzZK?=
 =?utf-8?B?YkFiTi8vN1daclBNQmhwSjRTNnF5QjlUeTJVLzA3NFovUExtZmxUYmdEWDRH?=
 =?utf-8?B?ekh3OE9lQitWZlB6a2hJS3QzMEI1ZHlXSmVoYlU3S3JUNWFKVEpSZFdBRVpy?=
 =?utf-8?B?SEdHZ3dLOEdlb2xtVXhIaVJjaDV2dUpRQjVOdUhZOTkwcXY3WmI0eCtzRjZP?=
 =?utf-8?B?TmRXOSsvdXVJVnJwTVZWRWtBMy95RGpyZG15aWt5SzlpWmVwcGtSN0x4NmNP?=
 =?utf-8?B?QURwQ1g2cFlHR1hEb1BqSFVyVUsvUjJLOG9uQXlEVGtBTTdPZy9aNTgvdGFs?=
 =?utf-8?B?YjhGYVNRM3R5Z0lmd2h5Q0tNdUdzQ0lwOTNxOE5RRDI4OTF6MDBrQzBBWnJr?=
 =?utf-8?B?SjcwVFh6UG5nSEJDYmo2eVhJU2VDU3h5NWVlZ3FxOFNDMC94eCtNTTgzWlcx?=
 =?utf-8?B?OXcrTHFvRVQrSGhkNDQyT21kUStOdTJqa3RZenRQYkQ1U0pnYklZL1BxQnBr?=
 =?utf-8?B?QkNmb3Vsb0Ric1l3bGJtclNEUFppckQ2WTY5Z05YMXpXNGkyWFdqTjkvU2xR?=
 =?utf-8?B?cmJUS1hqSWNDajhVWkhrT2p6QSsybU1tTDFpQzBrNXRXdjFkSUx4TkcwRWtV?=
 =?utf-8?B?ZzVBaUF4OWgwcDZOdXJaSE42YmpScE9iSnYzR1puRnpnaEJTV0d6MHB3WWNz?=
 =?utf-8?B?RG1wSFo3QTlCY3JaZ3MxK2ROUytuaS9jL0tDSzVNT243eGNUTVdRUUFKNnFm?=
 =?utf-8?B?MVUxN1ZVbzltc1JTc1FpL2tjTmJ6U0ZFV1hmVGxZU2Ewa1A3aXRGQUtPelY3?=
 =?utf-8?B?aCtWaXBlVjR6WUtpS0tSbWp5OFl6d24wRm8rNnAzWTVLRExXa1dpRlExNFVi?=
 =?utf-8?B?MHVIYUNrN3RHSW1NRUNFSHl0dlRYdU9hYkhnV1FlZVI2YnZmWm10QnFESCtP?=
 =?utf-8?B?UlpqU1ZKVmFzQ0tMeUk4SjBjSVVERmlUbUc4b28ralFOS3g4cDR1TWlXSFhu?=
 =?utf-8?B?VW5rdDdPR2Z1SFZQOUV3WmZsR2RZOGxWNXdjSjVZRFlkdDlBRUYxMjh3aVdZ?=
 =?utf-8?B?MTFMYkN1d1NZMkQ2cHJtbjUvTC9nNUZqT25uUnJiWHA2djB4Q3hTVGk4OXd5?=
 =?utf-8?B?aHZsWlBMSE9NeEdwQ3gxbmdaTUtRRVZsL0xNL1dlWTNzU1E3WCt4NEplcVFm?=
 =?utf-8?B?Vis1dzFwdy90UThSaXNpa0liM1FFRTJGVlFRQ2V1NFJvdThVRDlQdHFpV1I5?=
 =?utf-8?B?MWNEYWpqcnUxRFNkaEJ3OWVOejB5K3VEVUhKbzRZYmV4bEd4dDdpb2V3ZjRB?=
 =?utf-8?B?S1FVbHNhbmxvZTVzWGFrNnRVSGhobi94NlBiVWgzeHIwQkVaT3hsVE1IR2pY?=
 =?utf-8?B?K3R1RVB4RmM4c2MwbmsxUkxxRHhxMVhVT1hKcnpDRFJtN0xYL0xCMFRFdWRC?=
 =?utf-8?B?S2FmcTAxYmp6VGJZR2V1M1NROTZNSGdKcnU5c3dNUzlwTmRaNjJLNzZ5WlpK?=
 =?utf-8?B?QTZPMzdhUHI1VmxYcVJ0MjZxR25GdjVaL29aTXYwTHBHdU5rY0NtT2dxT0pH?=
 =?utf-8?Q?5KnuEgVvC+xfkuCwpguvh9noeH7+W3wJZyjoBKA?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3196.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 687573ad-abcd-4f78-bc91-08d9056a27e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2021 08:39:34.1784 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JQZNh130tViQLYcGyjvyayu6M6DLFwfZgDdZ0SeQM9HKUPkimDQow1dDv1K4DFC8T/kfCxP96EIXorYgAjguHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0011
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Hi Chris,

Yes. I'll rework the patch. Thanks for your comments.

--Brs,
Morris Zhang
MLSE Linux  ML SRDC
Ext. 25147

-----Original Message-----
From: Koenig, Christian <Christian.Koenig@amd.com> 
Sent: Wednesday, April 21, 2021 9:34 PM
To: Zhang, Morris <Shiwu.Zhang@amd.com>; dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ttm: fix error handling if no BO can be swapped out



Am 20.04.21 um 16:32 schrieb Shiwu Zhang:
> In case that all pre-allocated BOs are busy, just continue to populate 
> BOs since likely half of system memory in total is still free.
>
> Signed-off-by: Shiwu Zhang <shiwu.zhang@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 4 ++--
>   drivers/gpu/drm/ttm/ttm_tt.c     | 2 ++
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
> b/drivers/gpu/drm/ttm/ttm_device.c
> index 1f2024164d72..0200709db9be 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -133,7 +133,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   	struct ttm_resource_manager *man;
>   	struct ttm_buffer_object *bo;
>   	unsigned i, j;
> -	int ret;
> +	int ret=-EBUSY;
>   
>   	spin_lock(&bdev->lru_lock);
>   	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) { @@ -161,7 
> +161,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   		}
>   	}
>   	spin_unlock(&bdev->lru_lock);
> -	return 0;
> +	return ret;

The function should return the number of pages swapped out. Returning 0 here is already perfectly ok.

>   }
>   EXPORT_SYMBOL(ttm_device_swapout);
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c 
> b/drivers/gpu/drm/ttm/ttm_tt.c index 48c407cff112..4e1e06a04428 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -329,6 +329,8 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	       ttm_dma32_pages_limit) {
>   
>   		ret = ttm_global_swapout(ctx, GFP_KERNEL);
> +		if (ret == -EBUSY)
> +			break;
>   		if (ret < 0)
>   			goto error;

Here we should just have a check for ret == 0 instead of testing for -EBUSY.

Regards,
Christian.

>   	}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
