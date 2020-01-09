Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BED136054
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 19:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E3C6E03D;
	Thu,  9 Jan 2020 18:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750055.outbound.protection.outlook.com [40.107.75.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5986E03D;
 Thu,  9 Jan 2020 18:44:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPFRw4PupuBRVtemeNQhxdNUbekA65dUZtUCIpIE2/o6nSk9qJZrzJ+U3IGV7X0dJ4ckX8ottvzJAoUUlM6n9F4hAe9EMr4LSfpc6fdaVw3Q/pd/tEGCG9V3kyMGaibNxHz1ARyERp/yBJh95hnO9hiOO839FBzFIHOLi22rKfL9AtYlLPIVkvtaVeZZM7bCdRrcGfVsuW6n289ig8tgcqt2w2yAzga8lVKjH0EYEdlXRdpN3V30fOFy6qQTRJbs1DY8bu/SGFjAGNGBbBBQR1ddyNMerPCTmT/LZ/V+eVDVlIgRiLWPw3hm22CcZKim5m5FpPEwD/VP7dg4Hw5hAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFe/WyPrgcVi527hxqU8h+HHnF2VTxgVbdNms/K9jjE=;
 b=K83LPthlYLbTLLxcZIFSzWEnzsrnE+pSpb6Wda5t/Jsi/BATNw0QjRRiZEJLqrGxFPZFpZ+MB3z58vMpB6dQnwRMOz0q9ZYf0GaEEXbw5hk8qXTubA37u5NQGyObCDjWJKfQtVjabcX08+uUc4n7JSrq1a0EHiblgfSfMSzmXWLCF3PJc0MKvvjZrrm3FuuWV8tbyZsRrpMFIKpSLYI1DGxHTHLU6spxpifsM+xplyicNaOyp/y1E6Rj4A2hKXfeYsobJ8Ey+fFZ6Di+lf/FfqD7WJyjBYAn+wkl9whw7mFKN9Vg6n9C69hijrylcun1ZrndXnA4u01201B2o9x5gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFe/WyPrgcVi527hxqU8h+HHnF2VTxgVbdNms/K9jjE=;
 b=cmBx4VcA8rEsuZIv5Xg/j87ETkByKt8c2unLjvM8e0+uIrTxHMCx64hvTQr/fjf515p3K3onC69UjGZx+PvUeIKCjkl3HDVZIR6FqlsifOKlj42FNdsmy2c7aEY3Tm5RTLQQwGp0urAwDgpbrmX+gvVA3xAng1omLh0UdW4Q0sc=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0165.namprd12.prod.outlook.com (10.172.78.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.8; Thu, 9 Jan 2020 18:44:10 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::4c09:215c:e5d2:3c8f]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::4c09:215c:e5d2:3c8f%9]) with mapi id 15.20.2602.016; Thu, 9 Jan 2020
 18:44:10 +0000
Subject: Re: [PATCH 2/2] drm/amd/display: Allow current eDP link settings to
 override verified ones.
To: Mario Kleiner <mario.kleiner.de@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20200109152028.28260-1-mario.kleiner.de@gmail.com>
 <20200109152028.28260-3-mario.kleiner.de@gmail.com>
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
Message-ID: <9238371c-fc93-2a65-c3e5-df6b3d1270dd@amd.com>
Date: Thu, 9 Jan 2020 13:44:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
In-Reply-To: <20200109152028.28260-3-mario.kleiner.de@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::30) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [10.4.33.74] (165.204.55.251) by
 YTOPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Thu, 9 Jan 2020 18:44:09 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b68d9c99-6a6d-4f78-70ac-08d79533ea51
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0165:|CY4PR1201MB0165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0165647BA26A9BE0C6E1ACB38C390@CY4PR1201MB0165.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 02778BF158
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(189003)(199004)(36756003)(2906002)(15650500001)(5660300002)(4326008)(31686004)(26005)(81166006)(2616005)(956004)(53546011)(316002)(6486002)(478600001)(16526019)(31696002)(8676002)(186003)(16576012)(8936002)(66946007)(81156014)(66476007)(52116002)(66556008)(46800400005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0165;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VG+xcGO62C8mbGOxpGwBSvzKoExLGDE3bJdfmf7o4wE+G8N5xyjq5cIxir8Xxc1oeRPD9N8kMiyowW0f4dPmbcO3Bbu9laQAA6o3z6zkOATT2b66IyAutvAr3KPdM1wPVXjgNIRUtLoiQmOXwioo5VpU+Q3Wvi22js9C4nmYz3lgmVBEBGiI2CBRlqvqlP2mYPI/bDVHOTCNXWJha5ovy83BjcbfT5McYJZxaYwXmukdnYja5HkMUBnvSoSaketn7Ff/26T6t4uGd3k4zMndOUg/YZusDbvsKjZikt8ycT9VIlGFn/o1FFMyeYh01CzJHeg8G2J1wBsKTo7gTHUNOu6Km7mmYi+EQvPOB50BRL7twGHZxP6woIlaBya3rWYCkQeX1lR+C4rZOG4+cqIjBhpw92EnOKHlVQg55QP6lwFVhX4OB8h85Vf+NIpqiFTGl/ZuJPJTspxmIsk8Nb18cG7TYVMz+AL0E2hcoIRG3vGLQUDGS2CHYGeTDMt/0/5F
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b68d9c99-6a6d-4f78-70ac-08d79533ea51
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2020 18:44:10.6439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZG81590slSOeKfiNauc9s5Je+GV2V6t2WV+NPi5aRexS+kXxdcPZUgCGt8cgdD1CrTsCckhIKgTfIv3i+hSsPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0165
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
Cc: alexander.deucher@amd.com, mario.kleiner.de@gmail.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-01-09 10:20 a.m., Mario Kleiner wrote:
> If the current eDP link settings, as read from hw, provide a higher
> bandwidth than the verified_link_cap ones (= reported_link_cap), then
> override verified_link_cap with current settings.
> 
> These initial current eDP link settings have been set up by
> firmware during boot, so they should work on the eDP panel.
> Therefore use them if the firmware thinks they are good and
> they provide higher link bandwidth, e.g., to enable higher
> resolutions / color depths.
> 

This only works when taking over from UEFI, so on boot or resume from
hibernate. This wouldn't work on a normal suspend/resume.

Can you check if setting link->dc->config.optimize_edp_link_rate (see
first if statement in detect_edp_sink_caps) fixes this? I imagine we
need to read the reported settings from DP_SUPPORTED_LINK_RATES and fail
to do so.

Thanks,
Harry

> This fixes a problem found on the MacBookPro 2017 Retina panel:
> 
> The panel reports 10 bpc color depth in its EDID, and the
> firmware chooses link settings at boot which support enough
> bandwidth for 10 bpc (324000 kbit/sec aka LINK_RATE_RBR2),
> but the DP_MAX_LINK_RATE dpcd register only reports 2.7 Gbps
> as possible, so verified_link_cap is only good for 2.7 Gbps
> and 8 bpc, not providing the full color depth of the panel.
> 
> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index 5ea4a1675259..f3acdb8fead5 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -819,6 +819,27 @@ static bool dc_link_detect_helper(struct dc_link *link,
>  		case SIGNAL_TYPE_EDP: {
>  			detect_edp_sink_caps(link);
>  			read_current_link_settings_on_detect(link);
> +
> +			/* If cur_link_settings provides higher bandwidth than
> +			 * verified_link_cap, then use cur_link_settings as new
> +			 * verified_link_cap, as it obviously works according to
> +			 * firmware boot setup.
> +			 *
> +			 * This has been observed on the Apple MacBookPro 2017
> +			 * Retina panel, which boots with a link setting higher
> +			 * than what dpcd[DP_MAX_LINK_RATE] claims as possible.
> +			 * Overriding allows to run the panel at 10 bpc / 30 bit.
> +			 */
> +			if (dc_link_bandwidth_kbps(link, &link->cur_link_settings) >
> +			    dc_link_bandwidth_kbps(link, &link->verified_link_cap)) {
> +				DC_LOG_DETECTION_DP_CAPS(
> +				"eDP current link setting bw %d kbps > verified_link_cap %d kbps. Override.",
> +				dc_link_bandwidth_kbps(link, &link->cur_link_settings),
> +				dc_link_bandwidth_kbps(link, &link->verified_link_cap));
> +
> +				link->verified_link_cap = link->cur_link_settings;
> +			}
> +
>  			sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
>  			sink_caps.signal = SIGNAL_TYPE_EDP;
>  			break;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
