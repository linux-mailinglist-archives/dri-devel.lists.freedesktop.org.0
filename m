Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF129C4023
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 15:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878CC10E4C7;
	Mon, 11 Nov 2024 14:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="bopGIKQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr
 [80.12.242.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B35F10E4C7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 14:02:33 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id AUzstDnhyjazzAUzstZGnD; Mon, 11 Nov 2024 15:02:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1731333751;
 bh=GRAYVX32ssuALUcZpWdYH9UG/vZO1PcBSIlWazaToUY=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=bopGIKQVe1KHbsRaWsBHWjDEU6kPo0mBTG+Zgy3NEIHvPSR5CtzPIzytGI0UO7knW
 TRMrbDv8njmlu+NRT9gXJ3iBKs0PWftEO7qGTO5TnHkJUNuM36r+6/MdU65evPVXMO
 lbWUHUGhNb9dmo56METU3izLIi1anS/UZ3hKP1OdLGHXuwjjMIK0NSn0sYuA1/rIn6
 /sh+ezpB0b8koMSONuijFSCBDG1kVK2kV6xIF/kulMom4Q4EifM4DDHHC8okRyp6Pa
 u1/BSYtflJT3BM/CVFRhwzpjVg18UbikxBY8hqvT3gNv8n6oPI/xsc6G577eV6Ev2G
 S1/Au/cD3364g==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 11 Nov 2024 15:02:31 +0100
X-ME-IP: 90.11.132.44
Message-ID: <2cc01a92-ce55-4b05-aa3a-09a610a8dab5@wanadoo.fr>
Date: Mon, 11 Nov 2024 15:02:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Apply upper limit for clock variable
To: Murad Masimov <m.masimov@maxima.ru>, Dave Airlie <airlied@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20241111134644.1507-1-m.masimov@maxima.ru>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241111134644.1507-1-m.masimov@maxima.ru>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 11/11/2024 à 14:46, Murad Masimov a écrit :
> If the value of the clock variable is higher than 800000, the value of the
> variable m, which is used as a divisor, will remain zero, because
> (clock * testp) will be higher than vcomax in every loop iteration, which
> leads to skipping every iteration and leaving variable m unmodified.
> 
> Clamp value of the clock variable to the upper limit, the same way it's done
> with the lower limit.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 877507bb954e ("drm/mgag200: Provide per-device callbacks for PIXPLLC")
> Signed-off-by: Murad Masimov <m.masimov@maxima.ru>
> ---
>   drivers/gpu/drm/mgag200/mgag200_g200se.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> index 7a32d3b1d226..69402a591f59 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> @@ -218,6 +218,8 @@ static int mgag200_g200se_04_pixpllc_atomic_check(struct drm_crtc *crtc,
> 
>   	if (clock < 25000)
>   		clock = 25000;
> +	else if (clock > 800000)
> +		clock = 800000;

Maybe:
	clock = clamp(clock, 25000, 800000);

to be less verbose?

CJ

>   	clock = clock * 2;
> 
>   	/* Permited delta is 0.5% as VESA Specification */
> --
> 2.39.2
> 
> 
> 

