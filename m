Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C7E367E88
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 12:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010536E233;
	Thu, 22 Apr 2021 10:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B336E233
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 10:24:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPWapR2tO2Dmwc2hf37FCr/7IIJgtcqDgCnsQ9fhXDcTFrbS4T23spwYcIufU06F/CieWMIAodKX9MU2vzX1U/VQYn97fTNmqtAuzpqnN49CHEJIsD/590+9aUhxBmDuIXKL+F++1GWNr9xoeapObUzspUWhpMnSUq9soUyQLDDV+Gwj3P5XFAbmsm33tJqyenrlOAnX/ZdVHTrH/PQfRuB/rVdHRkGOlUUCdleACZ0sNN1Pcp/4IlgXR0hjTy39U0xBj6HXTA8IjlDq4WBpHS71AR+De3kLELBAOhmjG5UydraS33ocnSPmmrjyQnt2Y5XQD+Zv8AERL+LEi5L10w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=echbAmV4i1FQE7YTaFCOfLJBM5iRI0Sqt1uId4eqAbk=;
 b=TP5ovP7T/F2taLBwD9qdl3touk3bScg2oGVjYS0oeRsEqNmPXpM3U1Es8kjDzTTlhIru1/i3Akuux9yHIM40EvRQwJzZbCkTdcF2zUFGWdadBaS9preZTzvq2eujgQ/8BHDuv0cc9deQl+IuVXqS2/ZVOu6sEa+PHG1CwFm/NWYzsigRrviZfidFKNwcfNpM793LGcllCJuzb1u6GqHSaIYnQbr0E96gXVOd0hn+AcfAFXcE6+t6ABhqw61XbqqYR6r3qhaCeR8VqOTFhSdd2sYP0/F7DxD0jrRnpxOD1dhzd0kg5+sVJR3VWWdDqDJj+XksaJO+7x2+CeytBtLWNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=echbAmV4i1FQE7YTaFCOfLJBM5iRI0Sqt1uId4eqAbk=;
 b=mqauTwqr04cHJHQmviPkkLCuFIlAwhAIUhCvAZ/hY9dnob1uUaZ0Pbrn8rtfjoKYWk3FMncWdSYvmQjWLN+AnfW2J5+cMb+wEpfdbiYW6bXsK/otjD4pZCnyK8zbDilA4prVtbHMpFCoNk6x3GbwJY7DXhfNHWfErDhVTTcD+e4=
Received: from DM6PR12MB3196.namprd12.prod.outlook.com (2603:10b6:5:187::27)
 by DM6PR12MB4468.namprd12.prod.outlook.com (2603:10b6:5:2ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Thu, 22 Apr
 2021 10:24:54 +0000
Received: from DM6PR12MB3196.namprd12.prod.outlook.com
 ([fe80::2477:9f69:235:8392]) by DM6PR12MB3196.namprd12.prod.outlook.com
 ([fe80::2477:9f69:235:8392%4]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 10:24:54 +0000
From: "Zhang, Morris" <Shiwu.Zhang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/ttm: fix error handling if no BO can be swapped out
Thread-Topic: [PATCH v2] drm/ttm: fix error handling if no BO can be swapped
 out
Thread-Index: AQHXN1LUuAkSSoujSE6iMKzE1zwP/arAQzsAgAARhTA=
Date: Thu, 22 Apr 2021 10:24:54 +0000
Message-ID: <DM6PR12MB319654D2C7ACD151867D47B0F9469@DM6PR12MB3196.namprd12.prod.outlook.com>
References: <20210422083749.11686-1-shiwu.zhang@amd.com>
 <a64c7549-383c-ff38-1a19-5533e1866300@amd.com>
In-Reply-To: <a64c7549-383c-ff38-1a19-5533e1866300@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-04-22T10:24:48Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=0125e3d4-173d-4933-8cac-283818121fc0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_justification: I confirm the recipients are approved for sharing this
 content
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0d53d0e-83b7-4d2d-7905-08d90578df44
x-ms-traffictypediagnostic: DM6PR12MB4468:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB44685F79BDC924A5C20E6B95F9469@DM6PR12MB4468.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tWcrOLHVIoVZhfBgES+/PFz1mt/berylPwrOz3ASWoumpCpHp5wNlSNDHWEe3D4SwUAF7FKCR92nkW5EtoxcUfnhjvjScay1H0L5iKow79QDLxUe9KS1mG/1g6VYpDkSkqM4X1ytC3ST10l0pyibmUpCTTTppqP21VEZkCocxuWEEwwZffCzTFWO435nuKHED+qUneEOKz9oCZBH8Ym+TMg90LU+v/ffuQjxlATbgdUqjn2d+M9BzUvYEpk6wSHI2zNf2m1rf/trAFpgUW3VFxxBhP9K7BKDZI24Wj8yPe/BU9pzxdJKY6bdOUH38N6+dDaoeBputMBCOVN0FB/Cp7Zohguhhzk3K5eDRML4Jr+vfajqLZ7SpiO0HS0XJZdA1ALGhV5xU7q+UXKpcH080uZGwpOO3lxQKmV9m88c8lXmCkZCOJnI3uh1clhjWLOOHfFeAa22h9AjwsXFisJG01jILhAKb4XTKfQu3eqfzXgfRnCECi+SaanVug7FgB0QoPROp5Wv2H4kDIOE9dbFJbiRDDg9g46oZ1R8e7P8ZgT4Z6nWm4UbSmRO1BVfyqPhIEVyz3I4PhL96XBm8x41+VLce6NUZUjeD3WEX3rDMdY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3196.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(76116006)(33656002)(71200400001)(86362001)(478600001)(122000001)(8936002)(316002)(6506007)(55016002)(64756008)(66446008)(66556008)(110136005)(66476007)(186003)(83380400001)(9686003)(2906002)(5660300002)(53546011)(8676002)(38100700002)(66946007)(26005)(7696005)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?d0tsSysxbUVoNjhOVk9GU2tXZXhLWGlRVS9HSHRpUFEzeHkwQnZ4Nk9WQXpM?=
 =?utf-8?B?ZWFjU3hHSUtiL2xidW5tOE1qVmdaWk1Qa3hiRGVFVFQyVHBNYzZydGlrQXpC?=
 =?utf-8?B?WVJVNXJ0VThUQUlKOEd4L2xSb3lxeWJuMDFRRHlqZGxIemErWVJaSEswVjA0?=
 =?utf-8?B?L1BORE9aL0R1UFgyQ3FDUmpZbXdlTStpZUNUdm5SMWEzTzBUdjNKR01IeHRN?=
 =?utf-8?B?Z1RXbGVWd0JERG10R0ZQazk1NDZRbkQzRkRZQjErVnVYaHBKSjRrUFZYM2Fq?=
 =?utf-8?B?cWdSMGNHVFI0RDFZbG85a3BVSEtxZXhjdDk3ZHJ1WE5ERThyWjlEbG5YY2JF?=
 =?utf-8?B?L0J4NnpDOUY1djN0OXdIQkhnTThmWTFSYksyZGtwTUxDTy9uRFhieHkxTEZx?=
 =?utf-8?B?b3doVy82eTF0VkZoemxKZUpxS01zZXRFU0dvRGZQNVlXa0pYakhzM2lDMkMv?=
 =?utf-8?B?UGh4M0pvK1BlM09McVg0dTBmeFI4em45NG5zbGhwZm9KU0FRYlNBaVVQTGNn?=
 =?utf-8?B?SElMZTBCZUhRNEgyMjQ3VTQ0amRBLzBuUURLTjg0eEFkZXYvYnhrdW0xeVVq?=
 =?utf-8?B?MXRyYkV4azEyTDd1cWdNM2dBa1U4M0w0cmNWUFpUaXpRRWt3Vy9ldTg1U09a?=
 =?utf-8?B?RUpTelFPZXpKOFIyQVBsdm40SGxBL1h6K2lOUk5ZTURIc01aMHBWSWUvZDVj?=
 =?utf-8?B?aUxPWXFaaE12S1FXTHhjZmxad0tpOWRxeHUyWTFSODdhaHBMNURBTlhLWjdE?=
 =?utf-8?B?bnBOUFMvRVJvRjJlSzI1clkxM3g0ck1vWjFBWHlFVGhMRXltNW9tQVg4S3d2?=
 =?utf-8?B?ZTVPR0RDRGR1Y01IWUtTZWo5TUdBL3BHNkpaTHVrS1A0YWYzdG54UStzVDl2?=
 =?utf-8?B?NituYWN0TXZrTkQrc09pV1NiZ0FFWFU5WktuRklMM3Vsc2laU2prcThya3Zp?=
 =?utf-8?B?ZUc4YnhRaGJJcjQ2d1RFdWE4MkFjOVlKS1kxVSthSE1CRTc3Z3lPbW14TStU?=
 =?utf-8?B?c3dDTjNvZHdYbEVIOEErRFpiZlhBN2JpNXR5QlhaVTdCNDdBNjViV25YQm1B?=
 =?utf-8?B?MjBiNlJWcEY5RHdXcjRXaGdXOEZPcHlHelFPSVBWMGNEUkJBc1JlUDNHemYr?=
 =?utf-8?B?bllrT1R2VGozQk1EZm1ycE5yTXMxa3hWTWkwMDVCcWxNM05yWXdWclFmWmg3?=
 =?utf-8?B?NDYzRWFRYjJxdG8ydFpDelVTbjgvN1o2alZhTm9aWXdVOUR5WldhTjhXWmJz?=
 =?utf-8?B?TURpRUp1c1F1UTZWTGRrbVFLbFJ5ckdCZ3ducDJMU1lRWjMzL0FUbHRkcXRq?=
 =?utf-8?B?K3lKd2xzanVYdnlvWDU2Y0w4ZTZuVENpUU03VGNqaGhmUlMvSG9XY1E5N210?=
 =?utf-8?B?UzRkaHNoVVlycjFWbTNkaFh2RlJlTmNIWXdIeUIyckoxU2VYRnlzeGV3ai9r?=
 =?utf-8?B?MkNIaTZLTncyVDQ4MzdxSzFOUWN4SVlDNStBTGhjWS9wOGI4UWppZGhaZ0g5?=
 =?utf-8?B?SkxpQStOU1RHdTc4aWRDa1MzK1N3OGJCQUJWejJPTGNPQmtpYlg5UWpGRyt6?=
 =?utf-8?B?T1hpYVRsRU9Fc01PMHFONVRtTlRnOXN5dllTRkV5NlR5V05uVzR5WCs4cVVr?=
 =?utf-8?B?MWNKZ1g0RmYrQXBxSzliSnQzWHdFMVN4aFNNeGVsQ2VadjBGYk93U3JMcVZj?=
 =?utf-8?B?bnBFbG8wSnNLOFB1RzNaZFVMLzNBZVNCeWZ2bFVnRm02eFJsdXg4NHpYQ09O?=
 =?utf-8?Q?2a6n7A/GF+dEJ8DJtLUY8i0SprY0YjaJasynUVT?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3196.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d53d0e-83b7-4d2d-7905-08d90578df44
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2021 10:24:54.8487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e4AEJWW3dJyTNcF0tGUaacP7AvhX5mgyzr9o5BgGYCUD7ZIeUNRfGflp3Hszl0TYDTY+R+1CCRqO0udlKLhDcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4468
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

Alright, Thanks again!

--Brs,
Morris Zhang
MLSE Linux  ML SRDC
Ext. 25147

-----Original Message-----
From: Koenig, Christian <Christian.Koenig@amd.com> 
Sent: Thursday, April 22, 2021 5:22 PM
To: Zhang, Morris <Shiwu.Zhang@amd.com>; dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/ttm: fix error handling if no BO can be swapped out



Am 22.04.21 um 10:37 schrieb Shiwu Zhang:
> Signed-off-by: Shiwu Zhang <shiwu.zhang@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 2 +-
>   drivers/gpu/drm/ttm/ttm_tt.c     | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
> b/drivers/gpu/drm/ttm/ttm_device.c
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
>   	list_for_each_entry(bdev, &glob->device_list, device_list) { diff 
> --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c 
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
