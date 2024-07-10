Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6179192D7AB
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 19:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9EF10E85E;
	Wed, 10 Jul 2024 17:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="efwkUHC6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EF610E85D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 17:43:55 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-25cba5eea69so22431fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 10:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720633434; x=1721238234;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zOdeMjN8zn02u2RJwNFjQMEU7jlojgabQSgPR5kH/Pk=;
 b=efwkUHC6KVWowk9M67IKCzeVj6vnRCNVp9R2FDgPXcHs7K8yHIIlFMhUrctWkcRjof
 UmZPvtlNt6TK4FRNhvgV0kFh9JJnpVHb94xAp6m5jiPNTIVheyq40JYYA4OPnBvKDnHU
 ydYxUSrsGwx7RA217oxFOeb+4hrUz3/QJFbso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720633434; x=1721238234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zOdeMjN8zn02u2RJwNFjQMEU7jlojgabQSgPR5kH/Pk=;
 b=YUC+cRLtPvJi7R/oU+heG11LM6V9wqGVbz/tpoWLER0Y+HNSrOK9U7zdC89bMjyxQz
 n8xrC0xZuvS3yuI11Ubdwm2s7GWpOw9oBdBgS7jFSQccf97oCVuwPjlhVJbCnbigjw3q
 5khhuo0QwjfYcI6OR/9bZR4g1x0qPFOWEKMHJ/Qxgci9+N6cS80oMhSff7lM559+RHiH
 B1J7MDqrZbcU7MYfyIltQTiSGm55T/bgMGDotE/hUZPFrS2B2y4dQgHVEgNHJzuleelo
 LA5barY7fpE8Symw+BwxjuTULy1OvAcyPzEVVpQUQ+YMMasXLoBbEybjsdsUUD/+0GbM
 jznA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBhmQudsBYQUHob/1pfU+pc49ja06dg44ZvZ7I3FYNPW2x50d+kaHn+oZurb7Liph4odpW2y7dIiMG6UQNzL+giitHd+ammto+EoOgkcol
X-Gm-Message-State: AOJu0YxrmTJDDGidhG95UGCC9mDLAH4A5sqsdeJT7si5DOqHzBkvKngd
 X92+fp1urE/FLY1+cvrfb6PSz4QrxnSYoV+6aJoU0oqL399tW+myn18FFp2ad2ULPduWs73foqh
 wLg==
X-Google-Smtp-Source: AGHT+IFJ4OCDibx5xH+DKMudJ7FaGOoIOELP8Vmd/FkWEXFtILdZuqPLRuiKxi0X0hpEJAiMZ13vyQ==
X-Received: by 2002:a05:6871:289d:b0:254:8666:cded with SMTP id
 586e51a60fabf-25eae7575f4mr5078844fac.11.1720633434223; 
 Wed, 10 Jul 2024 10:43:54 -0700 (PDT)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com.
 [209.85.214.178]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-77d5edcdeb6sm3126064a12.17.2024.07.10.10.43.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 10:43:53 -0700 (PDT)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1fb67f59805so13215ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 10:43:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVRbXYls8GqovLsWs2DQJ/R3fU86BibRpnR0gaqyimfki3vDCV73IQd9PXjd3m21mYzwJeqWUmPZgYC2h4W3dkLJd2vsKX/LLMY6oIes0gy
X-Received: by 2002:ac8:7773:0:b0:447:d97f:9765 with SMTP id
 d75a77b69052e-44d0b00f42cmr42181cf.16.1720632956811; Wed, 10 Jul 2024
 10:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
 <20240710-x1e80100-crd-backlight-v1-3-eb242311a23e@linaro.org>
In-Reply-To: <20240710-x1e80100-crd-backlight-v1-3-eb242311a23e@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Jul 2024 10:35:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X=rL9Jr91BXFX+a=X+SCjYX7vGhztbh9tEUVn9iLViJQ@mail.gmail.com>
Message-ID: <CAD=FV=X=rL9Jr91BXFX+a=X+SCjYX7vGhztbh9tEUVn9iLViJQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] Revert "drm/panel-edp: Add SDC ATNA45AF01"
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

On Wed, Jul 10, 2024 at 10:05=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> This reverts commit 8ebb1fc2e69ab8b89a425e402c7bd85e053b7b01.
>
> The panel should be handled through the samsung-atna33xc20 driver for
> correct power up timings. Otherwise the backlight does not work correctly=
.
>
> We have existing users of this panel through the generic "edp-panel"
> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works only
> partially in that configuration: It works after boot but once the screen
> gets disabled it does not turn on again until after reboot. It behaves th=
e
> same way with the default "conservative" timings, so we might as well dro=
p
> the configuration from the panel-edp driver. That way, users with old DTB=
s
> will get a warning and can move to the new driver.
>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
