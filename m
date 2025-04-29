Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B46AA3B99
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 00:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90F510E164;
	Tue, 29 Apr 2025 22:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ovs0rO3B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7BA10E147;
 Tue, 29 Apr 2025 22:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J+J3skU2IvMAiOOU893l9+DnbBdfScGVX4fOk3owrO0=; b=ovs0rO3BucKTwHg2e6Y4Rs7RVg
 zmQJkM3tLS5ADq5j3050AnJSmCJyyF7g/kOMKOs3Ao7U8TZ734T/Wy5dqKqjayKRukgDTK7IxFiHB
 nSwHSFqXyusTOclGmQSDdiNWygTRh5knEfRjt8aZIO9Hjyy6ToTbw7i4AHFJMCTh2c0iivATYehEN
 FyjIuH1AGnD1O5zOyk8o4En0A03B8csCspYIa3J4EpZPI6Wyp3ENroar595desOKBkJeOherfEsiN
 78lrcb/XniSA7ZwnkSNB7/JuAdiBLK297l3XhUmaj+tw5a9PvpedZoaIfS5xVlexOqLDSnfjPYjlh
 5vXuvfyg==;
Received: from [189.6.35.67] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u9tbg-000YBA-L9; Wed, 30 Apr 2025 00:39:48 +0200
Message-ID: <83af5681-7061-427b-a429-785b70a14652@igalia.com>
Date: Tue, 29 Apr 2025 19:39:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: no 3D and blnd LUT as DPP color caps for
 DCN401
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Simon Ser <contact@emersion.fr>, Xaver Hugl <xaver.hugl@gmail.com>,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250425205236.318520-1-mwen@igalia.com>
Content-Language: en-US
In-Reply-To: <20250425205236.318520-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 25/04/2025 17:52, Melissa Wen wrote:
> Match what is declared as DPP color caps with hw caps. DCN401 has MPC
> shaper+3D+blnd LUTs that are movable before and after blending (get from
> plane or stream), but no DPP shaper+3D+blend LUTs.
Correction: shaper+3D LUTs movable, and no DPP blend LUT.
>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> index 5b7148bb1701..3b142e662c7b 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> @@ -1937,8 +1937,8 @@ static bool dcn401_resource_construct(
>   	dc->caps.color.dpp.gamma_corr = 1;
>   	dc->caps.color.dpp.dgam_rom_for_yuv = 0;
>   
> -	dc->caps.color.dpp.hw_3d_lut = 1;
> -	dc->caps.color.dpp.ogam_ram = 1;
> +	dc->caps.color.dpp.hw_3d_lut = 0;
> +	dc->caps.color.dpp.ogam_ram = 0;
>   	// no OGAM ROM on DCN2 and later ASICs
>   	dc->caps.color.dpp.ogam_rom_caps.srgb = 0;
>   	dc->caps.color.dpp.ogam_rom_caps.bt2020 = 0;

