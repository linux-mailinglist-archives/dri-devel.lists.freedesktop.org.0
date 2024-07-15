Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6C19315F6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 15:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F24D10E057;
	Mon, 15 Jul 2024 13:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PQEjCPgE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E8110E057
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 13:42:38 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-44d5f487556so23243201cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 06:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721050956; x=1721655756;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yiHzmxhXegf8gKt2fPo1cHqasKjx8M8WTgWEINZ3dns=;
 b=PQEjCPgE6ibHoN0IxK5lYSEZULI+qou5yiKu+xAGkEY4xHDPtG4Euj9rHBbDQGePOt
 6ox6R6MmnxH2nHPvqlqfZCzJK2li+oBd7E+BXD56idoE+iwj0bpP6tiCL82tJQ8NLVwh
 LSdh0XgIX5Z8tSXwzUOAgo6XTWKlnkcQQ725k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721050956; x=1721655756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yiHzmxhXegf8gKt2fPo1cHqasKjx8M8WTgWEINZ3dns=;
 b=ZqIakdWILiPaaV1v9/sYhC9NdEPueQcsc4QnH9fXIil8T8Vw8huzSC1AjTZl/pa54T
 JoWJoLGsza9fAX1hL6cJndVhNJwf8vQdZsefnOj1a+xlNc+WyX0K/AOmH9NGm9ShYwI1
 L1tjV7iwmyFX6K6dWmo841yM3DdjSi3yQ2+sCpYUKcKXPKtP/B77O6tecN4jMj4FpBbS
 Qqk7QcYFSrVvNHSVx0NTIGg4VFvcYNfmNyyU/q7k45kxdLw3E08wvT5oYHylfzCPyTO8
 og8f9hhRPNyx6i4ujBqucilV/oDWbv4J5K5L179sXFJwZfWMh2oU3s70DqRkfAsjLVm2
 NOWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg5refGlUuxWCq7OmcYgc/K6ItnJKMIV5DmsgaE38ehYtgykSV1k1RgZkvsaqc2bVmIigE6pAsx0NtNxy1ioxTRHS9x8dMhCRejDLYrbje
X-Gm-Message-State: AOJu0YxKMcLm255uDOcbfBYxGxS6xU2rzUI9d9/9l3sk2kfQqFKjHfma
 gmuCyNPmzyqkGl4+2c5Pw1/eApqLP/vhG3a4QtheKIT3xFu7EC4A3Yf0ijTyceMLQ/YIHDQWyI0
 =
X-Google-Smtp-Source: AGHT+IEKS2G8kUXQleJziEXEzre+F+3jqAOaYhlHY+nbyI1RQf5dtzo/DhB02TEmf+YtCjWXCZ7NTQ==
X-Received: by 2002:ac8:5843:0:b0:447:d5f2:2e12 with SMTP id
 d75a77b69052e-447fa8ae007mr274727021cf.7.1721050956232; 
 Mon, 15 Jul 2024 06:42:36 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com.
 [209.85.160.170]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44f5b7bb9fesm24814821cf.6.2024.07.15.06.42.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 06:42:35 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-447f8aa87bfso580221cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 06:42:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWtJq15auQm3oBuRdw6g+QADcJTAlP6PEG2kDLJ4epW02f9Bfg2CKVoELQ6eY6dlw9g45Oc3X7zHfo8gshq+ErzZmpzU7uhabBcb9JNe5Jv
X-Received: by 2002:a05:622a:5a11:b0:447:daca:4b25 with SMTP id
 d75a77b69052e-44f5a2f9b4emr5548211cf.28.1721050954554; Mon, 15 Jul 2024
 06:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>
In-Reply-To: <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 15 Jul 2024 06:42:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VG3zNVKp75r2zsKzmjC0WfZqY1xrffSQ+jcuAJm7FaQw@mail.gmail.com>
Message-ID: <CAD=FV=VG3zNVKp75r2zsKzmjC0WfZqY1xrffSQ+jcuAJm7FaQw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

Reviewed-by: Douglas Anderson <dianders@chromium.org>


On Mon, Jul 15, 2024 at 5:16=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has backlight
> control over the DP AUX channel. While it works almost correctly with the
> generic "edp-panel" compatible, the backlight needs special handling to
> work correctly. It is similar to the existing ATNA33XC20 panel, just with
> a larger resolution and size.
>
> Add a new "samsung,atna45af01" compatible to describe this panel in the D=
T.
> Use the existing "samsung,atna33xc20" as fallback compatible since existi=
ng
> drivers should work as-is, given that resolution and size are discoverabl=
e
> through the eDP link.
>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml     | 8 ++=
+++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna=
33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna3=
3xc20.yaml
> index 765ca155c83a..5192c93fbd67 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.=
yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.=
yaml
> @@ -14,7 +14,13 @@ allOf:
>
>  properties:
>    compatible:
> -    const: samsung,atna33xc20
> +    oneOf:
> +      # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
> +      - const: samsung,atna33xc20
> +      # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
> +      - items:
> +          - const: samsung,atna45af01
> +          - const: samsung,atna33xc20
>
>    enable-gpios: true
>    port: true
>
> --
> 2.44.1
>
