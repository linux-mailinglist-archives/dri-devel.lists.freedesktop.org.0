Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD647264CC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08C310E02C;
	Wed,  7 Jun 2023 15:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531F010E02C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 15:38:02 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-77487fc1f16so319120139f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 08:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686152279; x=1688744279;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SXbni84obcY16QzSHbrmnrA3al4OUUVujL7MZjdZlAQ=;
 b=QlRRUuotjnILQ4+DNDI9DI+GDIasRWsNs7Hbmqv09ZnktCAQ+aiFddLDqQSeQNg3Me
 Onemkt1uTxI+1GJVHRzez3Qpnkiq/VE5dJnaSg5YMHhh31WW86jlgc9UmRR6iNq4vecX
 YAJoxYu83yiqXJWLlFWeryPxYzQ7ORyONHtN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686152279; x=1688744279;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SXbni84obcY16QzSHbrmnrA3al4OUUVujL7MZjdZlAQ=;
 b=Qot3T8tg1dLKY96+1MOOVSUt8E9kvREAG8qeY/4LEwMcXa3Od/hKsAr1N7lnJ6JF6D
 jYDjZb9AAlodT/j8q1R2l+gg1m7bl2uzfXA8NU06VlbJcWpYMX8hD3jO58QaAnFNHZ8x
 baT0V3DvoAw3oxqqzngkjJ1QkZsKaTSC4aCpFmi1S4QRa7Q1RDJOFZ3oW7q9Y/S4D6Q9
 dA7EfcO/wuerqq2YphzUXRU3hSe843x8N9pyk+q8SuYhsUdpiBfCpJtcHNF/kMrusEAG
 n4iFX4tVAe3sf/ZOt3b3M+jAafE/bb6RYUlxWfYLPMyzShWM4Nb7Ec1XZngWOXlHV/OV
 0Rng==
X-Gm-Message-State: AC+VfDyuJQlUEKqp13hZlcrDSUj2HnGg20+lSz+TIvx5hxsvKaRO1DXk
 b2BUCWhdoFcgaeT78bUgnGuf6bAs4ajDCHNWBPE=
X-Google-Smtp-Source: ACHHUZ6IC+SnjG1JOBahtHyJNTivCbwOTAXgdlo14JPwHVpPjSLUUHG3M/eaRiZ3wxqNYTIczlheqA==
X-Received: by 2002:a5e:de08:0:b0:76c:c701:2f77 with SMTP id
 e8-20020a5ede08000000b0076cc7012f77mr9436114iok.3.1686152279773; 
 Wed, 07 Jun 2023 08:37:59 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181]) by smtp.gmail.com with ESMTPSA id
 l9-20020a056638220900b004168295d33esm3620769jas.47.2023.06.07.08.37.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 08:37:58 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-33d928a268eso149165ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 08:37:58 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a8b:b0:33b:5343:c1d6 with SMTP id
 k11-20020a056e021a8b00b0033b5343c1d6mr173474ilv.21.1686152278253; Wed, 07 Jun
 2023 08:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230607150615.241542-1-laura.nao@collabora.com>
In-Reply-To: <20230607150615.241542-1-laura.nao@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Jun 2023 08:37:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UH9WK6+gVGHyxMamCu1XqF8CKto1f6pegOFT+gGrg3yw@mail.gmail.com>
Message-ID: <CAD=FV=UH9WK6+gVGHyxMamCu1XqF8CKto1f6pegOFT+gGrg3yw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel-edp: Add AUO B116XAB01.4 edp panel entry
To: Laura Nao <laura.nao@collabora.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jun 7, 2023 at 8:06=E2=80=AFAM Laura Nao <laura.nao@collabora.com> =
wrote:
>
> Add a panel entry for the AUO B116XAB01.4 edp panel, found in the Acer
> Chromebook Spin 311 (CP311-3H) laptop.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>
> Changes in v2:
> - Sorted by product ID
>
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

For simple updates to this table, there's not much reason to leave
them idling on the list, so pushed to drm-misc-next:

1ebc9f0365ef drm/panel-edp: Add AUO B116XAB01.4 edp panel entry
