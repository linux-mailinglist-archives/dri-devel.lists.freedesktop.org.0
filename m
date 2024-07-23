Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9250293A7CA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 21:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9D710E308;
	Tue, 23 Jul 2024 19:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BC6R/7/G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8E210E1E3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 19:49:04 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6b6199ef089so34858736d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 12:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721764141; x=1722368941;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rk9EMEI4L6lDxsIEgVeMjCp1kcxiTQupiuAAcvpqnrQ=;
 b=BC6R/7/G9hEdaWBR9NwSykFEikWewicnZPvhjUwxkEENp/b7HnKCi/RZ1Jlja9w1c3
 tFXpciV1CNipQMS+dlXiFed5UjSwblhqMUpk3XcJ+J9qYd3aei3rjdelv65mkf/UiuHu
 glm42WsTQzYlDDcFZNtBQ6mKJ3+ws6a8ldNFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721764141; x=1722368941;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rk9EMEI4L6lDxsIEgVeMjCp1kcxiTQupiuAAcvpqnrQ=;
 b=Dvjvfx8pax4vg5T7rMYjgRXFyM13nU5CBSdnGJtVQZPIjNjZazkFsJ10TUCiD5R0G5
 jPuGqRJZFRJgo1Tu37gTlexnic8TrRV689/zPFtjIPdiLvvn8wX4eN+PwBHniUi8B+f/
 /CjsZmYxfK/Zjc2eSvYJbGp/g4Q6YLKEQUlKsxrKPUiKkvRJR4hWUkqPcnniNDaYcPjl
 +UkTBW3JfoYi8wMFxJGT/jwkcmgpnxHFtuRelGfUtviMuT5lUMqwjc4q4j76qHziSawN
 l0AfPy5BI77IP5GRu4Bl1aGiIZ9wykQ4ZPxtPdpCS5gDqRYTRMY9cXUo3yqRCXWfKXsv
 9GtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo4Rd7E66QZ3gvE5T5G/qHpASef0sFjNb9ohMHHqdV4ne06JQKvgri6RBMPpdSx8dwa2toEDLlp74AZ1pooHFZPLaEFoiLcZepBIBYYKoR
X-Gm-Message-State: AOJu0Yzp1tSy2OC2w0evT4JkH6aUwJnFFeNJJtxxNYGcU/5xoB/h4N0P
 qEONCm/TIHswxr8zcj8X0aYZxpFY6lG7ILchodevHliwg04qOjp9ftxuN4xxgq6Mw5XkpTdczlA
 =
X-Google-Smtp-Source: AGHT+IFpIPMHeJ7Rqktsndq9US5b08RgP8k2EV9G6Tsu+ta1DU3LXAKOBU9fKMMTc+L1OWdCtOIO3g==
X-Received: by 2002:a05:6214:624:b0:6b4:fd6b:d492 with SMTP id
 6a1803df08f44-6b981a5ede3mr47996246d6.54.1721764141116; 
 Tue, 23 Jul 2024 12:49:01 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b95cf17789sm39642506d6.7.2024.07.23.12.48.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 12:48:59 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-447df43324fso10801cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 12:48:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW5+ZETIxeVoQlPNxWQmT1fgHb1YIr06LGbji3pdWqXC2ECeGhJQqZDdUqQMAjLNDqDT5Wxe77y/NFI1Dtqmfo9zeDMAwXmWgOeAXio3dyZ
X-Received: by 2002:ac8:7f49:0:b0:447:e423:a463 with SMTP id
 d75a77b69052e-44fd4a74d29mr921661cf.3.1721764139089; Tue, 23 Jul 2024
 12:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240723062615.14796-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240723062615.14796-3-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240723062615.14796-3-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 Jul 2024 12:48:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VD+7hLSLv+F0Egh9=ab1nRCpiB4g+54fqeWg__z7T1-g@mail.gmail.com>
Message-ID: <CAD=FV=VD+7hLSLv+F0Egh9=ab1nRCpiB4g+54fqeWg__z7T1-g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/panel: boe-th101mb31ig002 : using
 drm_connector_helper_get_modes_fixed()
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 hsinyi@google.com, awarnecke002@hotmail.com, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Mon, Jul 22, 2024 at 11:26=E2=80=AFPM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> Use public functions( drm_connector_helper_get_modes_fixed()) to
> get porch parameters.
>
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
> Changes between V4 and V3:
> -  1.Modify the return value, return drm_connector_helper_get_modes_fixed=
(connector, desc_mode).
> v3: https://lore.kernel.org/all/20240722092428.24499-3-lvzhaoxiong@huaqin=
.corp-partner.google.com/
>
> Changes between V3 and V2:
> -  1. Keep bpc settings and drm_connector_set_panel_orientation() functio=
n..
> v2: https://lore.kernel.org/all/20240716121112.14435-3-lvzhaoxiong@huaqin=
.corp-partner.google.com/
> ---
>  .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 19 ++-----------------
>  1 file changed, 2 insertions(+), 17 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'd assume that Neil or Jessica will apply these two patches assuming
they agree it looks OK. If this is stagnant for a while then I'll
apply it.

-Doug
