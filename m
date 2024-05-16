Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453978C77B2
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A7C10ED19;
	Thu, 16 May 2024 13:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="WBGmsuCq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5B810ED19
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 13:32:16 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-43e13b87c4bso28331461cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 06:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715866332; x=1716471132;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mq2Sul2x7kmO3kQH+vqqcNhY8EMA9s5vcYxIfsi3Cqg=;
 b=WBGmsuCqbcMSxzGIGeESD4NAhL8/S0BwTpkk3N6RJWst28ZDxqhGHFJD4ARqYdrSJN
 XroUl39j/a677D8u5Hl6vTyraYwYYzwCN5BEdnVNr58MQdWqRGrTepMN2WM4ivE/EW+R
 oWQFlhqvb1bz0DI0AWBPjIVpQzSu5L2OPTxng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715866332; x=1716471132;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mq2Sul2x7kmO3kQH+vqqcNhY8EMA9s5vcYxIfsi3Cqg=;
 b=cExQeO5AmhaK0Cw6vQMYkucQHLqHZhcAgBOuI2AlLnB3quaoyULStKUFoZO33d/CKd
 6bDbQ+W9IClLF8raB1zieEridQwgHlXi9hQ5XNrls5zHo2tMR61jT05kB96t411r6zEY
 IKnvzbJnP0Xe//vY+atV6gm/Ws/gAFbM92yQkNNkCFcSrZis3jk7ro8hkssUnk8je7h2
 ofEZzrG3oegXuXhJG+YKB5UdRBboR9I2boNpacUiqQumIZdXNEFkDLLf8JbPkXQZAJe6
 1COcF5W5MPqcHcJog06G6eYEBkNqzvdb2HX3uqAqzpp3vwp0buAOpcVj8gZKKWQ0m61E
 qduA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDKj+CnjI0Y7OSeHv0h+S5IkN08gTLciUDNqLlVK6hBDrGASPf7VnJXnAKAi/dwfZRdACxEdKKqSJPPAlSvsjsQ74o6E7hvQFiBNK6nb5N
X-Gm-Message-State: AOJu0YztX039kJORUdmPge8MKSinaJqsm+Xwro66V3xy6DGul5hgtcdG
 UZYekujOUdynTcNNJH+SxQVKbjpmrAH6UL54jGyhzOJ16MKPK/yU3ki1i/HhVvXLxIGuUp4MLZ4
 =
X-Google-Smtp-Source: AGHT+IGPFvMq+/ImkMXMYug3hMFrYYtym+eQMmLxPnUar/KNw/4XI+M1eOpJEDuEp4YHzekX+bduxQ==
X-Received: by 2002:a05:622a:1305:b0:43a:ea68:e0c2 with SMTP id
 d75a77b69052e-43dfdb0a0e8mr196838601cf.5.1715866332223; 
 Thu, 16 May 2024 06:32:12 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df54d922esm97189681cf.22.2024.05.16.06.32.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 06:32:11 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-43dfe020675so2769971cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 06:32:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVeKMXIu7CXquZ67XbpxjuwATUasCIbp8UxWbd9OWklblEuqMiOomimacS0hgDS42Gtw0u5/QMeZ0VIixK/vGymKPBp20zkfYNonQTGsvtQ
X-Received: by 2002:a05:622a:6089:b0:43e:33f7:600c with SMTP id
 d75a77b69052e-43e33f7623fmr5149201cf.19.1715866329914; Thu, 16 May 2024
 06:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240516072039.1287065-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240516072039.1287065-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 16 May 2024 06:31:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WNgF7X2=Q-yujVfbTpir3-5nN85Gc+hV+xXY6ZOWSwSA@mail.gmail.com>
Message-ID: <CAD=FV=WNgF7X2=Q-yujVfbTpir3-5nN85Gc+hV+xXY6ZOWSwSA@mail.gmail.com>
Subject: Re: [PATCH v8 0/6] Break out as separate driver and add BOE
 nv110wum-l60 IVO t109nw41 MIPI-DSI panel
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 neil.armstrong@linaro.org, dmitry.baryshkov@linaro.org
Cc: sam@ravnborg.org, daniel@ffwll.ch, linus.walleij@linaro.org, 
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org, 
 airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 xuxinxiong@huaqin.corp-partner.google.com
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

On Thu, May 16, 2024 at 12:21=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Discussion with Doug and Linus in V1, we need a
> separate driver to enable the hx83102 controller.
>
> So this series this series mainly Break out as separate driver
> for Starry-himax83102-j02 panels from boe tv101wum driver.
>
> Then add BOE nv110wum-l60 and IVO t109nw41 in himax-hx83102 driver.
>
> Add compatible for BOE nv110wum-l60 and IVO t109nw41
> in dt-bindings
>
> Note:this series depend Dous'series [1]
> [1]: https://lore.kernel.org/all/20240501154251.3302887-1-dianders@chromi=
um.org/
>
> Changes in v8:
> - Neil think need sent separately to ARM SoC maintainer with "arm64: defc=
onfig: Enable HIMAX_HX83102 panel patch ", so remove it.
> - PATCH 1/6: No change.
> - PATCH 2/6: Fix Doug comment "return ret" change to "goto poweroff".
> - PATCH 3/6: No change.
> - PATCH 4/6: No change.
> - PATCH 5/6: No change.
> - PATCH 6/6: No change.
> - Link to v7:https://lore.kernel.org/all/20240515014643.2715010-1-yangcon=
g5@huaqin.corp-partner.google.com/

This all looks good to me now.

Neil: do you want to apply this series plus Dmitry's [1] atop it, or
would you like me to? Dmitry's series has a fix in it but I don't
think it's critical enough to warrant the merge conflict that would
come with putting it through drm-misc-fixes.

[1] https://lore.kernel.org/r/20240512-dsi-panels-upd-api-v2-0-e31ca14d102e=
@linaro.org/
