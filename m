Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E5D16B195
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 22:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5996E981;
	Mon, 24 Feb 2020 21:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8136E97D;
 Mon, 24 Feb 2020 21:09:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXT6r/y8mNy8xyTuksJfSmzQnkazRrTej4GCrGsILqX0xHyO1RS5C13loH0gKpDbjUx2Cq0MRSH/9i1x0evmzouUzXwUXt04wS4d7RASWL0LI122jo/JLLCO72QyynZZVlEI3a1yd1wZBx+Rl9Kl+PQQ3+aDi9qOIlj7mJ43cKIIILoSLBeSIvUzdPheGDPYYJTvkfv5iF5Jt4ecfYxik09WcRf6xptphR++CA0jDjStv9R2A+ji0s8Ts688QTQhKpvyHKKdCbWGY7SA3vuu99Snfe3xBNY85QhHSdaVV1vCqHoiN2qSo3R51QC7TCeE4EytkfaMPIBCY2c8yWiCow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+EH0vva8YWYOPFN2kXczHDG295M2wVm4u9JJBfP9XY=;
 b=Jf9OUxnK9xHPKMpGgokZ6vC83nPZnq6aGM2qbBKBk/RlIkmBKbzOsuRtrh9jD92b3oT293CCIq5YivPHo7V/5CeW+cuVchyj/TmMsb5mKRPdquBCOdODdczOgSvVBlCwm7WeKMr88NOfu3n2oAJr5cPs/PFyZXjr58WtxrOk5xb2YkLgjDpdYt+evOFG+5MyfYq7x84iJtXAmVHrEWq4AtrXXDRFLmeLka6aRkfcf/QgimtUP6bvGszhcDiXNoUOC3pdMdWXJ5FvvoE2G5Bp5zM5RnQ30NhbuFYJnY3Zu7IAkP7GDNpWG37azDtPrBJNPjIjHQi0zcHSDih1A6RgGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+EH0vva8YWYOPFN2kXczHDG295M2wVm4u9JJBfP9XY=;
 b=MnVl/SFFaWhIimSWx7r3LWhHmFcBwTcc9BKTTpMZDnmmuvDs7hfpgxgj3LpT7YhUN7egedJ1GQcdMcKqRMKkrxECShQoSIBsjGl83GZAGtLgQ0Po07Jne2VazpN3yrTTc7Nchtl5DsW9pGBC464O01EmMnnLQbUW0EoamD+4D20=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW3PR12MB4361.namprd12.prod.outlook.com (2603:10b6:303:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Mon, 24 Feb
 2020 21:09:50 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::2ca3:d95b:6303:76a5]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::2ca3:d95b:6303:76a5%7]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 21:09:49 +0000
Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector registration
 (v3)
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20200207211713.3870-1-alexander.deucher@amd.com>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <22cf2c92-52a0-5e1a-e569-4fe421e38022@amd.com>
Date: Mon, 24 Feb 2020 16:09:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <20200207211713.3870-1-alexander.deucher@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::17) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.4.41.132] (165.204.55.251) by
 YTOPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17 via Frontend
 Transport; Mon, 24 Feb 2020 21:09:48 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0bda095e-d47c-4607-ad3d-08d7b96de242
X-MS-TrafficTypeDiagnostic: MW3PR12MB4361:|MW3PR12MB4361:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB4361A069766289C2BFE60B6E8CEC0@MW3PR12MB4361.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-Forefront-PRVS: 032334F434
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(366004)(136003)(346002)(39860400002)(199004)(189003)(31696002)(2906002)(53546011)(186003)(36756003)(81166006)(16526019)(31686004)(26005)(8936002)(66946007)(4326008)(8676002)(81156014)(478600001)(16576012)(66476007)(54906003)(316002)(6486002)(2616005)(956004)(5660300002)(52116002)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW3PR12MB4361;
 H:MW3PR12MB4379.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ZK4lnG/L213EhRUWzK8+h3ARYMcJOtuqP3WeEcV6h8LX+6h9ZzosNGQX9fSNabCIAaE7k3rIsiq+srHJGM4VkR/kn9AO1AgEL/xC0rpbTqrQ/RDTQnZ3k2mH3ZXBy3hQ1zXys+F4XT3HbRrz34nkjCjpJEbS0ipJrHWpbIRccsooeBsxM2RRZFoGw49df1a3nDc/czI5Qm3PruKFvh3s1jt2mIUqLiPnBFMJOXyWLlH9w5OHXAZ7DghUp5sNjWIyPr6NQlJY+KUOTfBzSuHW/kzs3imH573Grxn4PnC7ZVqr++rTAd2ndIQmC318X5dJgxEsFvnWV+rsZagqazxNn2TI8Zixoc2UcHMcOW371WBH5N9/UW3t9quMmt4hem4RHUUN733e+f23HeT8FpRsyi0lJ/b1h5pL266JdvQvuexd+FlQAKCX7DBa++0aJMp
X-MS-Exchange-AntiSpam-MessageData: yO4TZauAFAl+7wgEoQIf5Dj7eVDoK32A6kKicH0oSI37qDqeob7JkY0LcvplkSiogydaN1CG0V+j4cLqxaOJcOCxuGovkilcj3I88LvVaRUlyLQPEcAGIrV6pnsu1nU4VT42YxW6jxxZUjPdud6EFw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bda095e-d47c-4607-ad3d-08d7b96de242
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2020 21:09:49.6899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KSIbYz/JjiJOscJIxhe4AT1wOSHbGOIBX9OyI9BUKpEejAEGWxM5Npp2z8xxytWarnx573DSn+cv33o2CpzyOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4361
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
Cc: Alex Deucher <alexander.deucher@amd.com>, "Broadworth,
 Mark" <Mark.Broadworth@amd.com>, "Liu, Zhan" <Zhan.Liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-02-07 4:17 p.m., Alex Deucher wrote:
> Split into init and register functions to avoid a segfault
> in some configs when the load/unload callbacks are removed.
> 

Looks like MST is completely broken with this change with a NULL pointer
dereference in drm_dp_aux_register.

> v2:
> - add back accidently dropped has_aux setting
> - set dev in late_register
> 
> v3:
> - fix dp cec ordering
> 
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c   | 16 ++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/atombios_dp.c         | 10 ++--------
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  |  7 ++++++-
>  3 files changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> index ec1501e3a63a..f355d9a752d2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -1461,6 +1461,20 @@ static enum drm_mode_status amdgpu_connector_dp_mode_valid(struct drm_connector
>  	return MODE_OK;
>  }
>  
> +static int
> +amdgpu_connector_late_register(struct drm_connector *connector)
> +{
> +	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
> +	int r = 0;
> +
> +	if (amdgpu_connector->ddc_bus->has_aux) {
> +		amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector->base.kdev;
> +		r = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> +	}
> +
> +	return r;
> +}
> +
>  static const struct drm_connector_helper_funcs amdgpu_connector_dp_helper_funcs = {
>  	.get_modes = amdgpu_connector_dp_get_modes,
>  	.mode_valid = amdgpu_connector_dp_mode_valid,
> @@ -1475,6 +1489,7 @@ static const struct drm_connector_funcs amdgpu_connector_dp_funcs = {
>  	.early_unregister = amdgpu_connector_unregister,
>  	.destroy = amdgpu_connector_destroy,
>  	.force = amdgpu_connector_dvi_force,
> +	.late_register = amdgpu_connector_late_register,
>  };
>  
>  static const struct drm_connector_funcs amdgpu_connector_edp_funcs = {
> @@ -1485,6 +1500,7 @@ static const struct drm_connector_funcs amdgpu_connector_edp_funcs = {
>  	.early_unregister = amdgpu_connector_unregister,
>  	.destroy = amdgpu_connector_destroy,
>  	.force = amdgpu_connector_dvi_force,
> +	.late_register = amdgpu_connector_late_register,
>  };
>  
>  void
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> index ea702a64f807..9b74cfdba7b8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> @@ -186,16 +186,10 @@ amdgpu_atombios_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *m
>  
>  void amdgpu_atombios_dp_aux_init(struct amdgpu_connector *amdgpu_connector)
>  {
> -	int ret;
> -
>  	amdgpu_connector->ddc_bus->rec.hpd = amdgpu_connector->hpd.hpd;
> -	amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector->base.kdev;
>  	amdgpu_connector->ddc_bus->aux.transfer = amdgpu_atombios_dp_aux_transfer;
> -	ret = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> -	if (!ret)
> -		amdgpu_connector->ddc_bus->has_aux = true;
> -
> -	WARN(ret, "drm_dp_aux_register_i2c_bus() failed with error %d\n", ret);
> +	drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
> +	amdgpu_connector->ddc_bus->has_aux = true;
>  }
>  
>  /***** general DP utility functions *****/
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 3959c942c88b..d5b9e72f2649 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -155,6 +155,11 @@ amdgpu_dm_mst_connector_late_register(struct drm_connector *connector)
>  	struct amdgpu_dm_connector *amdgpu_dm_connector =
>  		to_amdgpu_dm_connector(connector);
>  	struct drm_dp_mst_port *port = amdgpu_dm_connector->port;
> +	int r;
> +
> +	r = drm_dp_aux_register(&amdgpu_dm_connector->dm_dp_aux.aux);

This calls drm_dp_aux_register_devnode which is also called later in
drm_dp_mst_connector_late_register. Wonder if that's a problem.

Harry

> +	if (r)
> +		return r;
>  
>  #if defined(CONFIG_DEBUG_FS)
>  	connector_debugfs_init(amdgpu_dm_connector);
> @@ -484,7 +489,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>  	aconnector->dm_dp_aux.aux.transfer = dm_dp_aux_transfer;
>  	aconnector->dm_dp_aux.ddc_service = aconnector->dc_link->ddc;
>  
> -	drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
> +	drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
>  	drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
>  				      &aconnector->base);
>  
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
