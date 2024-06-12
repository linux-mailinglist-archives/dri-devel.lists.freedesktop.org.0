Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CB3905319
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 15:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BCE10E84F;
	Wed, 12 Jun 2024 13:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="JPrjh55L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D2410E0D0;
 Wed, 12 Jun 2024 13:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1718197276; x=1718802076; i=markus.elfring@web.de;
 bh=BwY4nSRSiX50ju27Za2AyFCW3MElQCLsQ6xaBJsijxc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=JPrjh55LO+dxTZjj21wMYg3xiu9w7RBOaSXLfnU8bIPCA0VqTfIQ185bYvtM1iol
 mZFUzLMC3cDGVHI5dqYYgMkcYSnW3kD/kq31g6gXL07VsgZwuMEoGmmKs63YDPVZN
 uo677SeOwfawn5f2neNjn7pfG0DeBxlkZ0CfaO+I5irzZDMyXFk3gCcn6rckDoQCA
 2taw6N8uPZEJZuseOrLOS+qI774N5Stk3RNiRiwygX1mvoU8S9WMhoxIuKHAYCkql
 7j2QucVAs/0yb/qXI+1YcNhvbPw7SROVkxIb8ilT93Pkp90WTJdCk9TAc5wcMxbjZ
 8yqcHFOB+VOkQg+H0Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MrOdp-1snQpn1h8Z-00hTcV; Wed, 12
 Jun 2024 15:01:16 +0200
Message-ID: <deaa2a50-9e16-4f23-8c13-34947ba4e4e0@web.de>
Date: Wed, 12 Jun 2024 15:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20240522-fd-hdmi-hpd-v2-13-c30bdb7c5c7e@linaro.org>
Subject: Re: [PATCH v2 13/14] drm/msm/hdmi: ensure that HDMI is one if HPD is
 requested
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-13-c30bdb7c5c7e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JRdxdNTKqwkPpdYHwCiY6ep2u1eBuqO1NgxxppYIp17AjPPBzuw
 cvqSW4biK6afYfDJpAkcryzdJtThijQ/JmvKbJRmezyhqvnUcIjpJSh8Awvl64YzN/R/3da
 waq4hkAI1Xf2TglE8x/iW6MjZZWDv66lVCbSXpS2wDBXJbbEJG494ssoeZElM/tVoWisAoN
 6tosNrlDwndP8zHuhDfLA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AJCm5eap5Ig=;9lGpNi+gbaFG6EiXvJ3wkCk7JXB
 T2+R0qkNEqqg81INQJBDAzc9TSAO47fxhO0vnWNfYf19zyHQqgdtTRlEaUQGtYhq1CSzAkxU6
 WZzQEjLw8gkTnWmIGF8/Ypg8NPoG3TdQACVMeTlCCbtcNc2ip+QmfZ7rku4gFtkaZOyiny54+
 UxdxASOVNoXDesCEb14JpxDU2Idfyo3NSjIeB6uA9AKV8n90ffJM3CH3yuRsfRQ5NT29zg4EQ
 EyLWgTQ425+W7OkoXa3TSgtUBcYFylHCkyKH4ApXmZmaXz3ArSqOUFMHbbMI6SlXq1YcZjzXG
 ThzCIf1wUAyhqjHJA5jEqE3MkOVhvK2mmyVh8J2n21NCZFL1ArJd0txyow8OUibdDe8Ww9aF/
 UZut3GM9bUzmMnGThnHy/A2LkGdttUdrCL6uwJPoz23Mr+RqZqsfzI9cvBG3yccr371vPMziF
 /GBbX0xRP7zlkIx41ARhf3+3VhRg2+sLIq3offXuFE/GZitTT00q0FCRjNUsmRPj2mxICQ9sh
 8vngs5FfbP7V9PMthLyu0d7bZFFlalsYq9Wijda/1nA5UTKF9j5onWyhnLF9/Gt7fpbj1zHCm
 Th7j5l+u22XxNJ0f/VovXpt6P0YndPYKUEiOshlwSRzJrTZ14TEanxpGcm//h2K3djxGDSrA+
 TkTyu4xswONWjFNlCyJTpQUt+qcjrmK8tlPJSQCOSjjPQtcX0CWZARFEtH98pR+icUTNsMZvg
 lgXIvCvMe7oZzl+9584Rr8pdQvHNawvukYTyXPNmGO8czg3pv7Z6L/vDp+ea9xV7f8zLJFX85
 PdP124xy8JCE/ujW1BYwiXaevsFJknGRTVsEG6GEyk3As=
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

=E2=80=A6
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -117,11 +117,13 @@ static void msm_hdmi_bridge_atomic_pre_enable(stru=
ct drm_bridge *bridge,
>
>  	DBG("power up");
>
> +	mutex_lock(&hdmi->state_mutex);
>  	if (!hdmi->power_on) {
=E2=80=A6
>  	}
> +	mutex_unlock(&hdmi->state_mutex);
>
>  	if (hdmi->hdmi_mode) {
>  		msm_hdmi_config_avi_infoframe(hdmi);
=E2=80=A6

Would you become interested to apply a statement like =E2=80=9Cguard(mutex=
)(&hdmi->state_mutex);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/mutex.h#L1=
96

Regards,
Markus
