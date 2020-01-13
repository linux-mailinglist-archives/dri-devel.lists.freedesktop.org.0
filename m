Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 933A91396B6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 17:47:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832C26E10B;
	Mon, 13 Jan 2020 16:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6648F6E107;
 Mon, 13 Jan 2020 16:47:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBYSONEQPq+xEYbaN1xNh33oT4zO7Ld3FaNwrCsNzzRH/hqZ2eIlgfCGkpoSjZvBeBw5XSbj2XQpj+bBhyJY994cE5Ez1TU3gGiI5FE3h1iQBuO9su6VntyeACM/HlOt/K10gpOPy/umGQDmeh1Sj20G2zXcfPAe2vOXIKyfoRejxSIwPX/wz2yEsNTsH/fFt6hE30lYNYRg1cbzvG2Y00daqGPlH54px8HjRy8LHbUzYaLElaNG0Ebl83dw6rP5l4r0Y56ddPEarFhkwnO8zyaye475zqp+xiaGOxaat4DARHwIakjJZu1yLNMEZdhy73xjCAPBwygQxTBWQDYwfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yn+RaOEcyV4eCS5WBFHaqY3gHDfhxXPxk3mG7xIk1V8=;
 b=SxqNGBc2KAG+KSACAiliYxDBHrLUvDK2hsW16N77sG/xZEGU1UN14Tb+6wOwY68psUKpariBDazW/e2gwr2krZslDHJGA7LW6oVinB+DgPL2r2oLWOcuwe/EJMryILQg97sTC5jcOuedR3WipPrtD+gaviMTfHjN+Ecba0bb1yvvZPyXxhtrEO6aYLDjBwFoHibZAeWsjeUO5ZJEQZvybRlkJSfSwxHf8IIsPyOegzXiualevragW4tH1Ok6r0XHacYBFqwE8GYaiQF7eD772MPdJFjkDthM+uinraGNLPJbvlK7/pfbZ1t0KSZVBi2mZcuCy2whfUx57a3y49b18Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yn+RaOEcyV4eCS5WBFHaqY3gHDfhxXPxk3mG7xIk1V8=;
 b=NhogNPkPvL3zqmirSAobudYAESnaLKg2Za1VZRrjaHaRIosED6oZoF/fuqx0arJVSKM5NC8pb2/BoQ1QNNl4KaC+mtwtozKyvD1qquPdTMiCHBgzbJVnDsLiOvY71tXLKFWEnHqXSPA8NFQgZQTaayMeceIq7OIgm7/kRUcuiHU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0264.namprd12.prod.outlook.com (10.172.79.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Mon, 13 Jan 2020 16:47:14 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::4c09:215c:e5d2:3c8f]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::4c09:215c:e5d2:3c8f%9]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 16:47:14 +0000
Subject: Re: [PATCH] drm/amdgpu/display: Use u64 divide macro for round up
 division
To: mikita.lipski@amd.com, rdunlap@infradead.org, Alexander.Deucher@amd.com,
 amd-gfx@lists.freedesktop.org
References: <20200113132042.25717-1-mikita.lipski@amd.com>
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
Message-ID: <8c02b7c1-6116-f3b9-875c-95e4e43c6f52@amd.com>
Date: Mon, 13 Jan 2020 11:47:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
In-Reply-To: <20200113132042.25717-1-mikita.lipski@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::36) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [10.4.33.74] (165.204.55.251) by
 YTOPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.10 via Frontend
 Transport; Mon, 13 Jan 2020 16:47:13 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d49f5e35-f1fb-49bd-32c3-08d798483db7
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0264:|CY4PR1201MB0264:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0264AF6989A3BB0751AD0B1E8C350@CY4PR1201MB0264.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:260;
X-Forefront-PRVS: 028166BF91
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(199004)(189003)(16526019)(5660300002)(26005)(66476007)(478600001)(956004)(2616005)(8676002)(2906002)(52116002)(81156014)(81166006)(66946007)(66556008)(16576012)(316002)(186003)(53546011)(36756003)(4326008)(31686004)(6486002)(8936002)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0264;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7TBph67QZuSkI1Td/lqra1CvZGKaIyXS1x5E8VrswsGRbVQ96at4iduW2RKkN18f+ggalmA2ar+YeQzbBvDKugoZjNg/4AlZzZVU3rJxnPNw79IuKyqP47HUJvAxnZMWKOvsDJ3K1SNnEV+9Y6m2BNZFcIZfMG1m9TDvmbgfPrVHalDRLUx0xDhLqAr3pU6w2cpArVAuT1TU/9xzbi1DiDJwWixBW5nnXHxK5c7Cz0zYkPFgL+BCP2f8YT1oA/ilHJwvMRkyU/CJrVoHX5GL/3Tja8hvYteFQW7V9oEW2dEjM+nyBeNQgxEGiPdI5rBX1R4d7Oa5Qsh947KrzVsNX7LRvllqVA6Fwm9fCWSrqRlQhuHmUaa+i3JueomXpM6Nh3+BiwLZKiKG2POO0CCVOfLpc+o/aRZ5+BpQV+7nnlptvGeUuTYKlIPwEx57PJIm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d49f5e35-f1fb-49bd-32c3-08d798483db7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2020 16:47:14.0706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xmeohxx0V45i6flfVd8Iie5y45hN8X/fQntPP3HwHlSf1lSY1O8IyvPNFdgiKRkntkqf23ClTGlAInVk6noWFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0264
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-01-13 8:20 a.m., mikita.lipski@amd.com wrote:
> From: Mikita Lipski <mikita.lipski@amd.com>
> 
> [why]
> Fix compilation warnings on i386 architecture:
> undefined reference to `__udivdi3'
> [how]
> Switch DIV_ROUND_UP to DIV64_U64_ROUND_UP
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 52fb207393ef..96b391e4b3e7 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -534,7 +534,7 @@ static int kbps_to_peak_pbn(int kbps)
>  
>  	peak_kbps *= 1006;
>  	peak_kbps = div_u64(peak_kbps, 1000);
> -	return (int) DIV_ROUND_UP(peak_kbps * 64, (54 * 8 * 1000));
> +	return (int) DIV64_U64_ROUND_UP(peak_kbps * 64, (54 * 8 * 1000));
>  }
>  
>  static void set_dsc_configs_from_fairness_vars(struct dsc_mst_fairness_params *params,
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
