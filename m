Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57F312E7F5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 16:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17256E109;
	Thu,  2 Jan 2020 15:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63706E02B;
 Thu,  2 Jan 2020 15:14:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGlr2sBSBH3nFcM7qtjKfrRUUBnlyoCZEMPKXE6v6WUXBHIcPLU4lKanbGKISELbpuOFv0VbvVwngGjG1M6sLB/lgiTbp7T5stJapijjpaqY3c6WfatGIeWBuRMZ1im9//GKgGWIc3nwnEgN8bBt52LT5DO0eBjq+7ckXbhQwvhYy7BdrC0gg4CD7tlmLLnzIMZ/bkr8CSDQdc+3aVtTyTcR4ZVIaXr3JNr/dq89jCDoGQJ2aVrENaExGeCOPzLIA8Fh/td9gez/Z7zYw/yqAPGL7SHfJbvMFYrWMryudOrX/mCBO3g97lT4Igg4gPe0HMhbRevG/USETmSqpEpdRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbVgr80cgoBL97UkIZTkJ29y+sxsijviOyWyH/uQAsM=;
 b=aFPbBO+seANR/rf9H6VpwWSwwsldVUpi4LNXdzJr73mpffoWcF5PfG1DGFhV0F5GCsgRXKm9/LLhQLe1EEfKa2NaoIY3Z/9ic/xiMIgNv4z3CnDgloOlzZGjxjpConJ39wkyQfl3KHu9czrV9wyxQBc+4E0o8FsVEm8sY+FG2UbtS66rYPkoCIjvIAkH1mTw98bRD0YrJxj4+m4A5kgUrMU21qfx3LYEEDbwvAaHSCoRKfUrarSXyH+3jZvXzVEhUvJ6SOZGKAXaTGcZKHyYP1e4oMuv/snJvQ10qRjCPTkGwfHY9dRiZtQysxGg4WyS+bv3z3+ahpM/QC5xesUPgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbVgr80cgoBL97UkIZTkJ29y+sxsijviOyWyH/uQAsM=;
 b=qEsOkjAq2+0sb9r1QSDj5LRG11nQCD5yHJDQaBwD7SXeOzFMO/GPgJq9dljf7anCs4oPOToIi0KJCcPQRXhQvelDS0j3QTsEIpYQAeCx9rrKzflyDNHn5TyPcKb15NDQqcpP6n/Jpbvac1jpzpmJmLA+XjBbnkA0tF1+4/oL2fI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0119.namprd12.prod.outlook.com (10.172.79.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.12; Thu, 2 Jan 2020 15:14:51 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d%11]) with mapi id 15.20.2581.014; Thu, 2 Jan 2020
 15:14:51 +0000
Subject: Re: [PATCH v2] drm/amd/display: Reduce HDMI pixel encoding if max
 clock is exceeded
To: Thomas Anderson <thomasanderson@google.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20191202214713.41001-1-thomasanderson@google.com>
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
Message-ID: <722bf0b1-5ff3-5a44-80f1-e67a3fe4d97f@amd.com>
Date: Thu, 2 Jan 2020 10:14:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
In-Reply-To: <20191202214713.41001-1-thomasanderson@google.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::18) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [172.29.18.152] (165.204.55.250) by
 YTXPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.10 via Frontend
 Transport; Thu, 2 Jan 2020 15:14:50 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6251e620-3af9-4e6c-2d2e-08d78f96836f
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0119:|CY4PR1201MB0119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB011919503812D844EB4348228C200@CY4PR1201MB0119.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0270ED2845
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(199004)(189003)(81166006)(81156014)(52116002)(16576012)(316002)(66476007)(66946007)(66556008)(8936002)(8676002)(478600001)(6486002)(54906003)(110136005)(16526019)(186003)(53546011)(5660300002)(26005)(31686004)(4326008)(6636002)(31696002)(36756003)(2906002)(2616005)(956004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0119;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l8Y9Y8HKOZq1PH4+plzY8M3pVSFaTqgUpGbFFryzsUe5Ect5TuDTv7oOsQYoaWd8IQ5VQasZgURVfwLjIj3jdr7wPgUr5h2apLJMhDsxYOn/lUjmYaX6BvKFBJMrgW+W8dE3CNhnYfEBv6PtoHZy35gDjVW8sFRC8pWo3BXTQlz8ZzF0BOkUdBt9IFHB46khZShfYz3tSAjoyKklesqbJvs+zigUvrRf40Pl/UyCfszQ/lsYE5hoJtYwcj3PxMcy+c9BN/wXE2HmExSyGT+6xksweNJtGAtV5i5g8co1CopDUUp10GWCM/0ultSLdceAspdvfIiAIWHTcyvSyfMRt9KfjsLVTM3LnN5BT2DxV7tBBMRrU6ZpEgcbLPzT12AVTcHNKCkT9CIZz2rA5i8dlz4rp4N3PUxNKE93MJJMxujMatPZqi5mWhGQ2Cb+DghZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6251e620-3af9-4e6c-2d2e-08d78f96836f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2020 15:14:51.2480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6w5AqQaDKNuWhtj+LkQ9cfVUzILa5F2uhWOvg4dJCUFbRgGPtCeuswXFemZQYhKM+7NBxchndNEMQby2klsLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0119
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2019-12-02 4:47 p.m., Thomas Anderson wrote:
> For high-res (8K) or HFR (4K120) displays, using uncompressed pixel
> formats like YCbCr444 would exceed the bandwidth of HDMI 2.0, so the
> "interesting" modes would be disabled, leaving only low-res or low
> framerate modes.
> 
> This change lowers the pixel encoding to 4:2:2 or 4:2:0 if the max TMDS
> clock is exceeded. Verified that 8K30 and 4K120 are now available and
> working with a Samsung Q900R over an HDMI 2.0b link from a Radeon 5700.
> 
> Signed-off-by: Thomas Anderson <thomasanderson@google.com>

Apologies for the late response.

Thanks for getting high-res modes working on HDMI.

This change is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 45 ++++++++++---------
>  1 file changed, 23 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 7aac9568d3be..803e59d97411 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3356,27 +3356,21 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing)
>  	return color_space;
>  }
>  
> -static void reduce_mode_colour_depth(struct dc_crtc_timing *timing_out)
> -{
> -	if (timing_out->display_color_depth <= COLOR_DEPTH_888)
> -		return;
> -
> -	timing_out->display_color_depth--;
> -}
> -
> -static void adjust_colour_depth_from_display_info(struct dc_crtc_timing *timing_out,
> -						const struct drm_display_info *info)
> +static bool adjust_colour_depth_from_display_info(
> +	struct dc_crtc_timing *timing_out,
> +	const struct drm_display_info *info)
>  {
> +	enum dc_color_depth depth = timing_out->display_color_depth;
>  	int normalized_clk;
> -	if (timing_out->display_color_depth <= COLOR_DEPTH_888)
> -		return;
>  	do {
>  		normalized_clk = timing_out->pix_clk_100hz / 10;
>  		/* YCbCr 4:2:0 requires additional adjustment of 1/2 */
>  		if (timing_out->pixel_encoding == PIXEL_ENCODING_YCBCR420)
>  			normalized_clk /= 2;
>  		/* Adjusting pix clock following on HDMI spec based on colour depth */
> -		switch (timing_out->display_color_depth) {
> +		switch (depth) {
> +		case COLOR_DEPTH_888:
> +			break;
>  		case COLOR_DEPTH_101010:
>  			normalized_clk = (normalized_clk * 30) / 24;
>  			break;
> @@ -3387,14 +3381,15 @@ static void adjust_colour_depth_from_display_info(struct dc_crtc_timing *timing_
>  			normalized_clk = (normalized_clk * 48) / 24;
>  			break;
>  		default:
> -			return;
> +			/* The above depths are the only ones valid for HDMI. */
> +			return false;
>  		}
> -		if (normalized_clk <= info->max_tmds_clock)
> -			return;
> -		reduce_mode_colour_depth(timing_out);
> -
> -	} while (timing_out->display_color_depth > COLOR_DEPTH_888);
> -
> +		if (normalized_clk <= info->max_tmds_clock) {
> +			timing_out->display_color_depth = depth;
> +			return true;
> +		}
> +	} while (--depth > COLOR_DEPTH_666);
> +	return false;
>  }
>  
>  static void fill_stream_properties_from_drm_display_mode(
> @@ -3474,8 +3469,14 @@ static void fill_stream_properties_from_drm_display_mode(
>  
>  	stream->out_transfer_func->type = TF_TYPE_PREDEFINED;
>  	stream->out_transfer_func->tf = TRANSFER_FUNCTION_SRGB;
> -	if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
> -		adjust_colour_depth_from_display_info(timing_out, info);
> +	if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A) {
> +		if (!adjust_colour_depth_from_display_info(timing_out, info) &&
> +		    drm_mode_is_420_also(info, mode_in) &&
> +		    timing_out->pixel_encoding != PIXEL_ENCODING_YCBCR420) {
> +			timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
> +			adjust_colour_depth_from_display_info(timing_out, info);
> +		}
> +	}
>  }
>  
>  static void fill_audio_info(struct audio_info *audio_info,
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
