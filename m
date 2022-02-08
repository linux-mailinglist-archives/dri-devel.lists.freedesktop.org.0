Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE5F4ADD3C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 16:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71B310E646;
	Tue,  8 Feb 2022 15:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB42A10E646
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 15:44:32 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 218AXaZg001203;
 Tue, 8 Feb 2022 16:44:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ddNKQeBNsufwtCR82T3hW0VvpqNHVS9IOC40mmH+H4Y=;
 b=r7xz+kjguAgrfwFsWKvHgj8PszyLfubCiP0Sm9Ix80tW1MFjXbvTFgXLqOTb7v6CwgdB
 oCSg34AYk0aNVKnfP3wIlIM/vbiYxBTIcgevTazRr8y0P7jh7PskiqSjKQF6l8KlR0Ql
 kxt9VIzRQQ7jN3sKzPe7AUgjqcslVHx5lRerGl5Pxj8YS61QlE242zVsdyTSOss2myJT
 dtgjyEKvMhFwkjXAU1wgO9oVMLqUNPJ+trprw16r+NFf9dMrnoRu46SDsNsYIwQrXTMh
 c3gAdRYfYxom5aFLtg00gc4BeWUM9ZXD9CU3X82sAI1lDAI4UVzjr9PJTwK40GKW0vQo +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e37nk5n3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 16:44:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E317F10002A;
 Tue,  8 Feb 2022 16:44:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D584E221778;
 Tue,  8 Feb 2022 16:44:17 +0100 (CET)
Received: from [10.129.7.146] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 8 Feb
 2022 16:44:17 +0100
Message-ID: <aea58d59-9b1c-608b-7212-1d64ce2f07db@foss.st.com>
Date: Tue, 8 Feb 2022 16:44:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/stm: Avoid using val uninitialized in
 ltdc_set_ycbcr_config()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>
References: <20220207165304.1046867-1-nathan@kernel.org>
From: yannick Fertre <yannick.fertre@foss.st.com>
In-Reply-To: <20220207165304.1046867-1-nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_05,2022-02-07_02,2021-12-02_01
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
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nathan,
Thenks for the patch.

Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>

Best regards

On 2/7/22 17:53, Nathan Chancellor wrote:
> Clang warns:
> 
>    drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>            default:
>            ^~~~~~~
>    drivers/gpu/drm/stm/ltdc.c:635:2: note: uninitialized use occurs here
>            val |= LxPCR_YCEN;
>            ^~~
>    drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'val' to silence this warning
>            u32 val;
>                   ^
>                    = 0
>    1 warning generated.
> 
> Use a return instead of break in the default case to fix the warning.
> Add an error message so that this return is not silent, which could hide
> issues in the future.
> 
> Fixes: 484e72d3146b ("drm/stm: ltdc: add support of ycbcr pixel formats")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1575
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 5eeb32c9c9ce..447ddde1786c 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -624,7 +624,8 @@ static inline void ltdc_set_ycbcr_config(struct drm_plane *plane, u32 drm_pix_fm
>   		break;
>   	default:
>   		/* RGB or not a YCbCr supported format */
> -		break;
> +		drm_err(plane->dev, "Unsupported pixel format: %u\n", drm_pix_fmt);
> +		return;
>   	}
>   
>   	/* Enable limited range */
> 
> base-commit: 542898c5aa5c6a3179dffb1d1606884a63f75fed
