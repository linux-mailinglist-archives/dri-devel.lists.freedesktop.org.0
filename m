Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 544D5136050
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 19:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293A86E944;
	Thu,  9 Jan 2020 18:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861E36E029;
 Thu,  9 Jan 2020 18:41:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0nvkqirQjZI9DOJXabQ4GOxgL0HRks3f2KUC/IwOgUHuMACPc3Heehr9EqcSz6PBKkEjUdeW1ObesrMUuXNQo/rq5x7+pPdC4ztONE5ZvbAnBLDHd3DRrolK1vUlkMk6iyngI80+d1+OdAizwUsf+KFkXzl4asUNPkKxpaLQjiiHk1bjHgJxFVSDH7svmt7q8LscoIMxffGj8QpJrWu8V4e9wamKaM0VZw5a6STFYXQGG6MflyuhRq4aKewwrEuJtRAJ6UX4ulHrmrpdfGLiXjCaR/0Cx687dQHj+vqY2ksVIJM7qG/EojAZEHT9VO6KGz+3H6GQvZqWRA1nP47dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3woN/BfHlafskOEjI42OlNMxlsB8i8rD5NAnglPSk04=;
 b=FQ0GXD61JpJ1lXT59ricAI8UzYR4u7XdGMSfUx8Z1WDDlBgJusAGUA86dWFK31jQKVRrH52z97LSTqUGFKmlaVxjO9Te+ZhuZs+uN50D3HrbkqjkGD+AkiQ7DxhSPLZWF/LKMNsCvyTO0XKdwHUL9wDIu036I27F0UsNSx6BMqtuRXLAmudT5/R0E25c+FlYA1J5Hthth3kmsCMEwzVGPcwliJTLN/XmbPOuTuELR5Sk3g6i6Y1NJ2iiKPLUbk8xjcAKL9hmS99cSp5f8+ix9Jc7AcMP8dCCMLuU5nalpvXsupBS+V2Nzxqtf86FtQACD/c3jjbuFBLN9KEn3Ow7eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3woN/BfHlafskOEjI42OlNMxlsB8i8rD5NAnglPSk04=;
 b=to3sLoBL3J/0EV3TN51uBvx+r4C5NRhqh/ASOae2XGHTJOzOt8U+4iRFZJSxjas/676B15HLJc3e6hLD0OXQpGpdxw/VYa0MVs9fa8vavgU5T4s5AIsVDNMGwkbN09XaaVdbvY7qLfWjm+2b2pzNMoeEsj1aC2mQic9cH3pPCJc=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0263.namprd12.prod.outlook.com (10.172.76.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Thu, 9 Jan 2020 18:40:59 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::4c09:215c:e5d2:3c8f]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::4c09:215c:e5d2:3c8f%9]) with mapi id 15.20.2602.016; Thu, 9 Jan 2020
 18:40:59 +0000
Subject: Re: [PATCH 1/2] drm/amd/display: Reorder detect_edp_sink_caps before
 link settings read.
To: Mario Kleiner <mario.kleiner.de@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20200109152028.28260-1-mario.kleiner.de@gmail.com>
 <20200109152028.28260-2-mario.kleiner.de@gmail.com>
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
Message-ID: <d54ab31d-1821-fe40-2dd7-c6b35b42547f@amd.com>
Date: Thu, 9 Jan 2020 13:40:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
In-Reply-To: <20200109152028.28260-2-mario.kleiner.de@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::21) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [10.4.33.74] (165.204.55.251) by
 YTXPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.10 via Frontend
 Transport; Thu, 9 Jan 2020 18:40:59 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f0602d89-9f7e-4530-90ba-08d795337898
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0263:|CY4PR1201MB0263:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB02638177F0E86909CDCCACE48C390@CY4PR1201MB0263.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 02778BF158
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(199004)(189003)(6486002)(2906002)(66946007)(8676002)(31686004)(8936002)(316002)(16576012)(2616005)(956004)(81156014)(66556008)(66476007)(81166006)(478600001)(5660300002)(26005)(16526019)(186003)(4326008)(31696002)(53546011)(36756003)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0263;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uY1meOxksGuIS5uxJ9em1eYbvsQXu2Oav+eFsNHeN1r/FilI6aLFLYXAfxeH0SOrgzwAlmi5XPJdpmlwMxMxvRvVDCmXPMsJSDcBgpVwFlfveHGqd6yujstB6fvuBUici9V/l1hbCN4Rk6cBuzv2Ui9TMcsaCO8U1FDMEFCtJAEBftWkf6h17rlZQ5ADdoThIv+yVaZDanLtqaW8cx1LNG5SwRXxzR3iIYcdHse/1KpEWb6E+dJARKrW6PBSthCzimwrCF7i0NvLqkd/tM8PJ1CY/XWlvLllkoqIIYTuIhrj0hzc6WaVrvMV47K0loUUTMo7d71AUfkIlhex9/rYzHD6Sg5VRRlyDBMQs4T/1Zq+cPvqtZ04ug4gelzfHKyyd4lXnTV/ykr0ICG68z1zlM/PHzpwATO/GAhtLeW2McK546EFCX5i8PT3U5WRQNq1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0602d89-9f7e-4530-90ba-08d795337898
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2020 18:40:59.7798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5WTGJ6nzGpwDKNlje6cNTGalln9jpW7SivqHHpmOMF6nqd9BSnTUSgHFw3Z8ywU8/mHU85n+2Y3PqQGixw5pJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0263
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
Cc: alexander.deucher@amd.com, mario.kleiner.de@gmail.de,
 Martin Leung <martin.leung@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-01-09 10:20 a.m., Mario Kleiner wrote:
> read_current_link_settings_on_detect() on eDP 1.4+ may use the
> edp_supported_link_rates table which is set up by
> detect_edp_sink_caps(), so that function needs to be called first.
> 
> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> Cc: Martin Leung <martin.leung@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

This also fixes our assumption that retrieve_link_cap is the first DPCD
reads we perform during detection.

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index cef8c1ba9797..5ea4a1675259 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -817,8 +817,8 @@ static bool dc_link_detect_helper(struct dc_link *link,
>  		}
>  
>  		case SIGNAL_TYPE_EDP: {
> -			read_current_link_settings_on_detect(link);
>  			detect_edp_sink_caps(link);
> +			read_current_link_settings_on_detect(link);
>  			sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
>  			sink_caps.signal = SIGNAL_TYPE_EDP;
>  			break;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
