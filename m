Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9278684095E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 16:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF1010F747;
	Mon, 29 Jan 2024 15:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D20D10F747
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 15:09:41 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-5ff7dc53ce0so22307587b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 07:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706540921; x=1707145721; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WHc0ySmd3+BUchE2A6eeEhPhJOTzoceSWy6/UF2YYmg=;
 b=FbMy+QsU42aATf6ZjTrCY1tvRZ1q1ilKdSabwYra12/L263uGoeGnhjfS65mHrVeKX
 n+N4gI0TXpix4Y1iMGkUTbKPFyEb6BODrXUKLBQrnzaKHOYrcq7H8m0Y1F2q0aDFWGzc
 PUjXeG1jEqJhMomxBRjOFRkBi+q5C8tr/TlOfKnD9ltOownh741f5szLVEjkIsGk3vnc
 U4k9dejdVRben8Jb0doqbhwGXP9KEzJqYRsElT2q3vs02u/plvgBAKQ1w6REMpiXA4Od
 KtpJf/eQt5lYUVi/ITV2i++UEdw7xrgXhQnZa+sxLhOZHCZ7Ob3XbzqE5+ybfMzxxpuL
 k/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706540921; x=1707145721;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WHc0ySmd3+BUchE2A6eeEhPhJOTzoceSWy6/UF2YYmg=;
 b=bUfRzJ2sFHuRgeBb4eVKOHpW4Ym1kPeW+TG41w8bIBzQshkVtOtUuwsHBuxufY/Tn1
 OCyMwX1pNEn+kPkFrWi4zMt30+aCC1wQHlky518Ib3RlMh31GdqUN/9AI3lkg71GqW3N
 VyctjST4dxmwe+wtWnnikPIUVMmldMiix44MdhdW7hHl/E7Z1926eClDqpjipspqv1Ay
 9htb3F7L6A6fp9KsR5dsjXxU+HDnuElyIJomTqC259YktoGAicqMiaoq574cdeNUGtio
 +jfUmKR4Bhyfmbgs+muGhBFZ+v3hkDvGQ62Y2bx7vQaz0jieXMpHwnvWzcIwlgSBqg1h
 4IyQ==
X-Gm-Message-State: AOJu0YwCHpim3+KOUyeDSFI5bx6+/sVVblrZ0os28HhYgO27jhOQ/CNN
 wKnOvJSumz2ZwSQzzhoQnypJG4F0A2hEOQ5h0wR+ze7J1R/MtW37I4mnkIN8WUv9jUFY88RUvjv
 QEP/01YuMjKYExShtVVLPoCqjJ4QrYkP5BN/49Q==
X-Google-Smtp-Source: AGHT+IEGAtVAdaZvHFjfmQf1IJOtCdXiDeGVR3eL7R75RzaD4DvPC28PHklGGBsD3t+yL5unf4AHNAwUb1afgQibw48=
X-Received: by 2002:a5b:18d:0:b0:dc2:23cf:6ada with SMTP id
 r13-20020a5b018d000000b00dc223cf6adamr2403587ybl.73.1706540920775; Mon, 29
 Jan 2024 07:08:40 -0800 (PST)
MIME-Version: 1.0
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
 <20240129-x1e80100-display-v1-4-0d9eb8254df0@linaro.org>
In-Reply-To: <20240129-x1e80100-display-v1-4-0d9eb8254df0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jan 2024 17:08:29 +0200
Message-ID: <CAA8EJpq1RSi4H6m6UQcyxEr=hip=ypKz9DhHziNKvDjUHsES8Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/msm/dp: Try looking for link-frequencies into the
 port@0's endpoint first
To: Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Jan 2024 at 15:19, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> On platforms where the endpoint used is on port@0, looking for port@1
> instead results in just ignoring the max link-frequencies altogether.
> Look at port@0 first, then, if not found, look for port@1.

NAK. Platforms do not "use port@0". It is for the connection between
DPU and DP, while the link-frequencies property is for the link
between DP controller and the actual display.

>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_parser.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 7032dcc8842b..eec5b8b83f4b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -97,7 +97,11 @@ static u32 dp_parser_link_frequencies(struct device_node *of_node)
>         u64 frequency = 0;
>         int cnt;
>
> -       endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
> +       endpoint = of_graph_get_endpoint_by_regs(of_node, 0, 0); /* port@0 */
> +
> +       if (!endpoint)
> +               endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
> +
>         if (!endpoint)
>                 return 0;
>
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
