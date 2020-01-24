Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E04148A7B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 15:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CD46E39B;
	Fri, 24 Jan 2020 14:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB866E39B;
 Fri, 24 Jan 2020 14:48:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmQUcAYCKJS2GtnXdR1Yc8ZF/4LYk8zQ9fJjUjBJR82oWLyttq1vDhEzybCozixJ5xzzFdXvftniP4rFo2kOw88Fx1XJpktBk/HVphhygtRohVmwUfeNeclMB4Cx7FBd8WUy0h9/okTJvvO4cRLrW12fq52EZ9TGJRGZXAZyigbVEDP77klMZQDupVO+H7P7T8XqCImKayjyY9mYNhG92PG4p2ztGe20r5MwhdCpmI8EiLSHuVGGA0KbW+7sCGEgr9/2hI+H/vHz7WIFN/+vSXF3GQ/tUgwjCCoV/wR3brTyS7cR0YvwRSiInj//8ot38GUI3i3wcgJsBfaSwZd3EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyBWAv7BFwojbeUXoCHr1EtwtV7M5apP+LDN3yZOOjo=;
 b=LSb0AVsxLnkeQfL3br1y2ah/KOmWkt1FEujlYNuKBWtOPYfpXoY3pSxvvMnJS69jm4Eq922xmKTSTzAoqIfphJa99pZW0I2Y6K8g/YlD8sD4u9bf5zIvPWJO3G57f0ERsq7B0QE0Y7Rj73U97q1d0XJV2/zLdJXoutWi7JI13g6vnlj5OOm/qDPektDoEmIdVEzHlclpgJpl/0GjR+msxjPaWspfkmvBs6O6vlXTKejKiblKPc980kkouOaYlf9DPzodMfmt2K3kS4z1CjvKoeY146NG7dEt6OFyks5duQLbDj2vsNg+GFjvfZPkPaQ9mJ0wIE4rSYyco4xc5Cy29Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyBWAv7BFwojbeUXoCHr1EtwtV7M5apP+LDN3yZOOjo=;
 b=XV49cioQUsLehlvsVqzWrfAd4AeW/2sYHZ1RfUFh1RC8TcHoVT5SMhsdRAJDm71xW3bKvxghPLs5yIWQ7OLlvymatO3bMwaUPavY5mNByFBl30F2ZOhCp6fkk8P/IQ+JbF+tddBCAUQSH1uqlo6M6aeTSMoANLbmfaO9LmjLof8=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0246.namprd12.prod.outlook.com (10.174.53.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.22; Fri, 24 Jan 2020 14:48:47 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::4c09:215c:e5d2:3c8f]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::4c09:215c:e5d2:3c8f%9]) with mapi id 15.20.2644.028; Fri, 24 Jan 2020
 14:48:47 +0000
Subject: Re: [PATCH] drm/amdgpu: Stop using the DRIVER debugging flag for
 vblank debugging messages
To: Lyude Paul <lyude@redhat.com>, amd-gfx@lists.freedesktop.org
References: <20200124010744.102849-1-lyude@redhat.com>
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
Message-ID: <f9ab0fdf-b235-2709-8431-5a094b539531@amd.com>
Date: Fri, 24 Jan 2020 09:48:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <20200124010744.102849-1-lyude@redhat.com>
Content-Language: en-US
X-ClientProxiedBy: BN4PR10CA0015.namprd10.prod.outlook.com (2603:10b6:403::25)
 To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [172.31.7.234] (165.204.84.11) by
 BN4PR10CA0015.namprd10.prod.outlook.com (2603:10b6:403::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.21 via Frontend Transport; Fri, 24 Jan 2020 14:48:42 +0000
X-Originating-IP: [165.204.84.11]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cf4310ab-8d97-4bb5-ca0b-08d7a0dc8436
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0246:|CY4PR1201MB0246:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB02464AB8BA28C4ADB62C11FA8C0E0@CY4PR1201MB0246.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 02929ECF07
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(199004)(189003)(36756003)(956004)(2616005)(66476007)(31696002)(66946007)(4326008)(53546011)(52116002)(66556008)(8936002)(81166006)(6486002)(8676002)(81156014)(2906002)(31686004)(316002)(478600001)(16576012)(5660300002)(16526019)(6666004)(186003)(54906003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0246;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J6wKA6Lb22w3HPiuWnHfVQfJFlywVouYph8XB0cKj+UrKyotmaZPgzchaAs2lC0zzDJcnAA8OLwk60GUxr2J5NzPV0/CcpgE1Qh2YntXbcHmgUa2DLpIiRqmhsnqqF1YV6fSRJ/a/SCQIdnDLVsdonSA6K06n4gvSBaMeF0ODKvgHC5UQQ4D52Xjl7xQTdKvtXHJ+GnWD+72VUhW7kRj4JbN0bSVNWrZMiBxVC8ozuhrBYURC2a9K0d9jRUJQ28EVk5GdaBc+rNJA66fChoUEfif9FBp5c2cST+KPzeLbmk7dno9g8bTiGsgEbkq/ssAWCdNgHsVe1Tm7HMACucwJnB24GAbJzseOWpPe1CXQlNSLp8xU5c9GwMYW2T215IiTXQkAKsOKzwnFKNPYyGI/2fl9roSUDcbm8AIfOw5wQqjIKpd0rhauZqKjYWXZ28F
X-MS-Exchange-AntiSpam-MessageData: 22t3YdYa8gnsigrpeJcPNX4dbQzhrqW1TLLYX9zvfJBZPMj6hjEXoK0ZSi0LbQ/YoNMIMpCJuIWk9JjptyhpjgFTUojCy/ecnBTesJmD7SaeNKymhbVQbXz1MzDY39U6iRI4JZnvigFFVJYYfbOXkg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4310ab-8d97-4bb5-ca0b-08d7a0dc8436
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2020 14:48:47.3444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZHOREk/ZpMRODxhgOJIzzXHTqQTCBLcR15nqHTVkiMPCww790DfclO4Q0hWPrcDQCe6riqoOnpwLkBLy18SKoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0246
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 David Francis <David.Francis@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-01-23 8:07 p.m., Lyude Paul wrote:
> These are some very loud debug statements that get printed on every
> vblank when driver level debug printing is enabled in DRM, and doesn't
> really tell us anything that isn't related to vblanks. So let's move
> this over to the proper debug flag to be a little less spammy with our
> debug output.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Thanks. Great change.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 9402374d2466..3675e1c32707 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -407,8 +407,9 @@ static void dm_vupdate_high_irq(void *interrupt_params)
>  	if (acrtc) {
>  		acrtc_state = to_dm_crtc_state(acrtc->base.state);
>  
> -		DRM_DEBUG_DRIVER("crtc:%d, vupdate-vrr:%d\n", acrtc->crtc_id,
> -				 amdgpu_dm_vrr_active(acrtc_state));
> +		DRM_DEBUG_VBL("crtc:%d, vupdate-vrr:%d\n",
> +			      acrtc->crtc_id,
> +			      amdgpu_dm_vrr_active(acrtc_state));
>  
>  		/* Core vblank handling is done here after end of front-porch in
>  		 * vrr mode, as vblank timestamping will give valid results
> @@ -458,8 +459,9 @@ static void dm_crtc_high_irq(void *interrupt_params)
>  	if (acrtc) {
>  		acrtc_state = to_dm_crtc_state(acrtc->base.state);
>  
> -		DRM_DEBUG_DRIVER("crtc:%d, vupdate-vrr:%d\n", acrtc->crtc_id,
> -				 amdgpu_dm_vrr_active(acrtc_state));
> +		DRM_DEBUG_VBL("crtc:%d, vupdate-vrr:%d\n",
> +			      acrtc->crtc_id,
> +			      amdgpu_dm_vrr_active(acrtc_state));
>  
>  		/* Core vblank handling at start of front-porch is only possible
>  		 * in non-vrr mode, as only there vblank timestamping will give
> @@ -522,8 +524,8 @@ static void dm_dcn_crtc_high_irq(void *interrupt_params)
>  
>  	acrtc_state = to_dm_crtc_state(acrtc->base.state);
>  
> -	DRM_DEBUG_DRIVER("crtc:%d, vupdate-vrr:%d\n", acrtc->crtc_id,
> -				amdgpu_dm_vrr_active(acrtc_state));
> +	DRM_DEBUG_VBL("crtc:%d, vupdate-vrr:%d\n", acrtc->crtc_id,
> +		      amdgpu_dm_vrr_active(acrtc_state));
>  
>  	amdgpu_dm_crtc_handle_crc_irq(&acrtc->base);
>  	drm_crtc_handle_vblank(&acrtc->base);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
