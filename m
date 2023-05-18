Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 645B9707A45
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 08:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF8910E4DA;
	Thu, 18 May 2023 06:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr
 [80.12.242.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0092D10E4DA
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 06:28:54 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id zX84p3FGUcjUozX84pkvOF; Thu, 18 May 2023 08:28:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1684391331;
 bh=GuYEVTBxE+8PbYpT/Gdg20EMlld5z1py8d9Sy66GhE8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=fqHLxmVSiyRUfvzOrJMMPEJGxWKg5I3QNzUb+SFMHW7CsNCmFK0jbtQKNZYg7ozq0
 chr6qxVdZpmTDN6SYnfqUQ606uLADAVxyfmKSbxainBwQVq4aKRGcx794p18hWSYST
 oth/kqNpC1HbdBJyl76RnM6ah++tkl77AI7e3JPXviHXt9pYzp213L1gBLkdJ/s5FC
 gAEvFmn8JKvSsaGU6hg7QZqWwaH6L2qpOt1guAkwgycgVaJVhNnRNCV75ohvHhQH2T
 emUG2COZimMSGsQCZZxTWozaHA/9OG2gewyUjUvCHDiHTvcqiNpANYYmmmfEqtweHt
 5Froh97aulA4g==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 18 May 2023 08:28:51 +0200
X-ME-IP: 86.243.2.178
Message-ID: <6f9fb8e9-0d6b-c6bb-619a-50cabc610421@wanadoo.fr>
Date: Thu, 18 May 2023 08:28:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] drm/amd/display: drop redundant memset() in
 get_available_dsc_slices()
Content-Language: fr
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230517183350.314082-1-hamza.mahfooz@amd.com>
From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230517183350.314082-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Wenjing Liu <wenjing.liu@amd.com>, dri-devel@lists.freedesktop.org,
 Jun Lei <Jun.Lei@amd.com>, Nasir Osman <nasir.osman@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Stylon Wang <stylon.wang@amd.com>,
 Leo Li <sunpeng.li@amd.com>, pengfuyuan <pengfuyuan@kylinos.cn>,
 Hersen Wu <hersenxs.wu@amd.com>, Cruise Hung <Cruise.Hung@amd.com>,
 Mike Hsieh <Mike.Hsieh@amd.com>, Hans de Goede <hdegoede@redhat.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Leon Huang <Leon.Huang1@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Le 17/05/2023 à 20:33, Hamza Mahfooz a écrit :
> get_available_dsc_slices() returns the number of indices set, and all of
> the users of get_available_dsc_slices() don't cross the returned bound
> when iterating over available_slices[]. So, the memset() in
> get_available_dsc_slices() is redundant and can be dropped.
>
> Fixes: 97bda0322b8a ("drm/amd/display: Add DSC support for Navi (v2)")
> Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>   drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> index b9a05bb025db..58dd62cce4bb 100644
> --- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> @@ -645,8 +645,6 @@ static int get_available_dsc_slices(union dsc_enc_slice_caps slice_caps, int *av
>   {
>   	int idx = 0;
>   
> -	memset(available_slices, -1, MIN_AVAILABLE_SLICES_SIZE);
> -
>   	if (slice_caps.bits.NUM_SLICES_1)
>   		available_slices[idx++] = 1;
>   

Thanks for it, it went off my radar.


FWIW:

Reviewed-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>





