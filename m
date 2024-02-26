Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEF2866C04
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 09:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECDE10EF4D;
	Mon, 26 Feb 2024 08:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="j+e0ebC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902FA10EF4D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 08:22:09 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-4cfa1b3c3a2so1195531e0c.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 00:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708935728; x=1709540528;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ROMdbNXWMhqi1ayUbIsWpqVi7lBvC0ES/SbDCLZCZz8=;
 b=j+e0ebC3E/vy1u3SSxGAgcuHVp0XfCCyByoaI348kva0qMAB1blI1a4IH7Y+JjqpMJ
 hQKvdQQzAxipFTf7IlulHUcaKR9miwshV3kZnLYdOtf285J7j+75wfedI+Jww3RFtZ3n
 TyRcLFYbXS6MG9V3OQzUB6jg2PDcLGmnSka4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708935728; x=1709540528;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ROMdbNXWMhqi1ayUbIsWpqVi7lBvC0ES/SbDCLZCZz8=;
 b=BOjKZJkHOIUbr/0HoWdkPRbt/8SJ29u5IsAREdpnqWcb82I8f6Xqv4eSYYEj9UK24T
 63zCnrhNNq1KvFjWjmbpAw0JIpA/R9y7GUJmCFiNgetsibtf8f8t2ayyEMTjjoaL0Dty
 nE9eAtJUGhF8esplZWfLAStr/1AAFy1pUA+KB1VvkGqlirLh3S+HYYbu6Nl7q2NtrhEV
 b3Wdh86NUlQ45XwBZuWkNSjwt5TmmGSXZtDm4ehM8/DS2ZyDsYn/b/Whl1vhn0gQbpZB
 tKXCJw3ypsTgCs1nQXwmx9PRky10GFEC7vl3s+4g5olGVKl82T+NBpt2f0lgHu0KVZS5
 qmCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoAndTqbdK8M/iZP3hBzRIrrliBb6iu47eBR41hzhi9aBrqp0LpgLmzfe4jA7gzBOEiXrD32mallF1ro+ZOqcRKqkNIW+i5c/1+LDKK0+a
X-Gm-Message-State: AOJu0YztnrQg1z/ifxX9aUMSQXYapgnahuXVcB8cTQfzuGmPUmQ7IWmW
 sLar2HheGGeyqIQjHBcVn2kpvcI+8QOicmCgxZK/NIyWG8fMPiXmcCfKBTYqVrfhHDHrw9n7lal
 qUw==
X-Google-Smtp-Source: AGHT+IH4sFxKC/nTiCNGf2oW7lHmcSi1ThL+kbebtsxUHIZsNjO505jwoY5mOPjzfi6ZMKF8nGkZ3g==
X-Received: by 2002:a05:6122:4c10:b0:4c9:4816:8d90 with SMTP id
 ff16-20020a0561224c1000b004c948168d90mr4101604vkb.4.1708935728263; 
 Mon, 26 Feb 2024 00:22:08 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com.
 [209.85.221.179]) by smtp.gmail.com with ESMTPSA id
 g10-20020ac5c1ca000000b004c84a0c795bsm566938vkk.27.2024.02.26.00.22.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 00:22:07 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-4cbc49dacc2so1570260e0c.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 00:22:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWMdLfxdACMzYkhq34b/amyqk0kWbJhzKC+gW9FxL0CZZDbTkJ/vrGy+NNQWGf0C71UaUkMWglQCLnMHTzKc5WrVC6qKY1OgYwi2eEfzlRd
X-Received: by 2002:a05:6122:4c10:b0:4c9:4816:8d90 with SMTP id
 ff16-20020a0561224c1000b004c948168d90mr4101592vkb.4.1708935727242; Mon, 26
 Feb 2024 00:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20240221165643.1679073-1-greenjustin@chromium.org>
 <c7d6259b-90e7-41a3-998f-a12edf7c1554@collabora.com>
In-Reply-To: <c7d6259b-90e7-41a3-998f-a12edf7c1554@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 26 Feb 2024 16:21:30 +0800
X-Gmail-Original-Message-ID: <CAC=S1njw4JM++D4kYyi4Z2rcDTsvqD1b0VtpQ5A071dgvtVGdg@mail.gmail.com>
Message-ID: <CAC=S1njw4JM++D4kYyi4Z2rcDTsvqD1b0VtpQ5A071dgvtVGdg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Add MT8188 Overlay Driver Data
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Justin Green <greenjustin@chromium.org>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, chunkuang.hu@kernel.org
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

On Thu, Feb 22, 2024 at 4:43=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 21/02/24 17:56, Justin Green ha scritto:
> > Add MT8188 overlay driver configuration data. This change consequently
> > enables 10-bit overlay support on MT8188 devices.
> >
> > Tested by running ChromeOS UI on MT8188 and using modetest -P. AR30 and
> > BA30 overlays are confirmed to work from modetest.
> >
> > Signed-off-by: Justin Green <greenjustin@chromium.org>
> > Tested-by: Justin Green <greenjustin@chromium.org>
>
> Hello Justin,
>
> I'm 99.9% sure that you don't need this, you can just use compatibles
>
> compatible =3D "mediatek,mt8188-disp-ovl", "mediatek,mt8195-disp-ovl";
>
> as they *are* indeed compatible, and MT8188 does support AFBC as well.

Hi,

I confirmed that I can lit up the MT8188 display with that plus a
follow-up patch [1].
Otherwise a compatible sequence of mt8188, mt8195 and mt8192 would be
needed, but that would be somewhat redundant.

[1]: https://lore.kernel.org/all/20240226080721.3331649-1-fshao@chromium.or=
g/

Regards,
Fei

>
> Cheers,
> Angelo
>
