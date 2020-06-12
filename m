Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 188031F7C75
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 19:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA81B6EA13;
	Fri, 12 Jun 2020 17:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456846EA13;
 Fri, 12 Jun 2020 17:24:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YnTdV2fBSalkVwBZp9PZP1MEtDqM47n+L2bYzkGJ/c9H5ZbvlUCwCqR/kzjJbA4zMbN5sa+fYzMErJPx5NOxkKVSPJRXTSNjyesPDO1iSeGVJ8TN0ERUQT+gs51pQo5uGRpKft2rl7afhY1Jdo9SJswZOeDfBIf3x0oGFBeKwR1Vqgam6X4HEqFsTkkyvYEdD+l0kmKpR++0h1kG365hyptvjH/3Yu+k5qrkQTqSjwfTryo/1yvHJCnr3lQ6He5u4yznYNsh4n3bCSUD+lKVx7j2mVPyUWMhcvVtO66ouZx6xxkyu8pmKugLmCKiSE0OLPGCPsuB96gYVNjYsAjIkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+2AtFfLWBoA+bin9yc36zuAQBrG/qYLnP3TtJGQea0=;
 b=Fhzxbqy7QmWDQiXFuu8p59L+WO8fpzZ1e/62GqziMhIFaIPXXDZWM41o0jvSafmaaDtr0bVEBDMrlsSbyortXB+05KQo9oo0T96os3veZ+VPdJRcl3LobXyx5NK9uK7pm6/TVDzGeriRU3Gicy2lOAf2PlxO5oN0naQTh0EPDSvXY9501A+ijIu66nM0/K191V2+EWi0ODV69QMDCeMz2HynqtouPIl2pGpRBOTmgRp08avbV7wPcfH051+LTfdugXosBwJ+fnNUMT1hMjCAz+kM8tdbKG1wlFIJh9hqIVzoZxonzGOXuziIt30Ld80keR/Vx3+YY3JuRp4AND8/Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+2AtFfLWBoA+bin9yc36zuAQBrG/qYLnP3TtJGQea0=;
 b=MXsf0UrNwMWVxbMxiX1PjBQttIJiac5iLj6T0R5xKWgfdmaom09VMN+C0OBiEkQdRff1G8yaaVvBaA1WG40Dw8B3GLHAlLYjkurnRspB85OW9GsTK/L4HI7CYvq4/rpE2t9ljf6OMrmo7vrELgYc6Gk6IcjIldu5vBcGoyKOvZM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR1201MB2524.namprd12.prod.outlook.com (2603:10b6:300:eb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Fri, 12 Jun
 2020 17:24:23 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::31b7:9b4e:3f37:5e97]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::31b7:9b4e:3f37:5e97%6]) with mapi id 15.20.3088.023; Fri, 12 Jun 2020
 17:24:23 +0000
Subject: Re: [PATCH 2/8] drm/amdgpu: Use __drm_atomic_helper_crtc_reset
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
 <20200612160056.2082681-2-daniel.vetter@ffwll.ch>
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
Message-ID: <ad375dbb-760b-b2e9-cfab-94fba61f4eb7@amd.com>
Date: Fri, 12 Jun 2020 13:24:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
In-Reply-To: <20200612160056.2082681-2-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::7) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.29.235.51] (165.204.55.250) by
 YT1PR01CA0068.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Fri, 12 Jun 2020 17:24:22 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dcb60074-bdef-406c-5552-08d80ef5731a
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2524:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2524D24270C2F1C424EA8B178C810@MWHPR1201MB2524.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 68TtngvoYrQ6PPvaTO95DRx4nadcVEXTT9XlacblWHso8ShrShLZz5dsJUNN1o25ZC9yXn1vN3YnKGclZn+HReXROKjTNXQ2MFwRpqNu9BFkiVgUCHOiE68LF5oNOqgsd7Bf7QAC/M0h2/8f4tBHngCb01HmCh0yNt/CpkeAjSrdJcU77BC1sDoTq5hYKLAqGHov485DTipBMde2y8++dvCwR4nDZdNf5mlbb3rFXZ8DkqGwxVhlVVC6Nt2mIo9usb32beNJbUeTv/DPnlPV0giENYxxNmzhjOqyRj1y1GQ+LDqW1aTOD0d/zRmrzWrgcDhakEBxjKlFi39SzAIkVS6DrEI6nUi2KBWuGJ/3C6+zxjoZyG2PhSzSH8dDUXFG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(36756003)(110136005)(66946007)(31696002)(54906003)(4326008)(16576012)(316002)(66476007)(8676002)(52116002)(31686004)(26005)(66556008)(83380400001)(478600001)(16526019)(8936002)(6486002)(2906002)(186003)(2616005)(53546011)(956004)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 2ey33subBwHRRfqRFuPIwunORcgEPoOUsXlUZnwDNxNBjYR2VoH6jKlx3+oxZxznm0622TnNBBVFyYf2u36tf+TohadgCWqIdcR8Jx+jGqKdrgOcNAzAydfuqhkv2jeYonJhrG1mY1NVpwCFBjXa038RRNO8TT2AOclaCQeN36NBWzrjNYJKqabsuGUwTyfKn2wmNybr67UZxCltN7g2HqjObtGgRKefl/qRx8vW+66HbtlaDmoxx2/RDOiFMSZOovphJOSYEY9FaykgnOoBK4oRw9OSw6ihf1gD1336vayEQYKAHUURbvPes49qKKC10LvRZPy56flHZKwdIVhVmOVKF8hy5zxJrFAk4++xHVXzwY6uhfreUSkM5tzRC9hq4VLUHs95muge03cyfMcnuf7obtijZTOXnIIUN/1MmHSA3Il5cAbRQekRdm/V/RuFzl8tWwfKGxq5xUPfnvNnhI+uztGHicy4RoAtIziBNTyrLmmdngIiHzAo+p9lIcZ+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb60074-bdef-406c-5552-08d80ef5731a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 17:24:23.5818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1xc73IbEGPY5tB3KXwnr8hiBe4261GgfzIf0KJJIf0NveIdcCLuiQ3x4SeaM7tUq93PUP6i7uB2s+06VDJCCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2524
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
Cc: Stylon Wang <stylon.wang@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-06-12 12:00 p.m., Daniel Vetter wrote:
> Now also comes with the added benefit of doing a drm_crtc_vblank_off(),
> which means vblank state isn't ill-defined and fail-y at driver load
> before the first modeset on each crtc.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Cc: Roman Li <roman.li@amd.com>
> Cc: Mikita Lipski <mikita.lipski@amd.com>
> Cc: Stylon Wang <stylon.wang@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 68a73065b516..36d605a6eb16 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4594,9 +4594,7 @@ static void dm_crtc_reset_state(struct drm_crtc *crtc)
>  	if (WARN_ON(!state))
>  		return;
>  
> -	crtc->state = &state->base;
> -	crtc->state->crtc = crtc;
> -
> +	__drm_atomic_helper_crtc_reset(crtc, &state->base);
>  }
>  
>  static struct drm_crtc_state *
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
