Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B9792AD08
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 02:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ABD10E0C8;
	Tue,  9 Jul 2024 00:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="GCORD+4F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D9C10E0C8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 00:21:01 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-447f0a765bdso8137451cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 17:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720484457; x=1721089257;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RKGxru8jlEhy9VDpu0M8oQtUNp25i0UIEibzxizl6pU=;
 b=GCORD+4FyDo5UXC8/UmQ+9nwb5t/ogV+x2bkWijzJszKMok2RpXQvNi31HSy4bC+q7
 xnEaGO2iZmjDeh6dClR2Bf8LXq4/VVb5S4BweUeuy5qjfOzipLxGuHt/hEJFb63bG48u
 qyOfqj86dkDawjLpHt7mxnyUNIOHZO0sb3C5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720484457; x=1721089257;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RKGxru8jlEhy9VDpu0M8oQtUNp25i0UIEibzxizl6pU=;
 b=Xh8Yd7Vz3338OOlEV5rZGSFzka3pYtADat2bYNQlgLfZXJOcIMEXBsnZy4ydoEh/V9
 7AFl1AlohusvhBFv0Z58aosTs/BwlyYK42ahhEicxKfl4XWdojvo/q62EB+/SgRg/zzl
 Icley3b9Rv3o0SP51AN8HzMwsn5oVUxMn+/pMvMx54kiYjyckR3M8QyRrGin/lWlXpCe
 TsSbHqUOeoz/Yhau+gl7CjchgkjcU2u8M3hAJjE4IqboLWnpDJI/i3QuTeC3Hx8QHLcz
 gYlnsoe5To9cZgbGQIvKk5V9pwFEHnIwTM+TmlXAZRz+YWV9eM7Lqi67PqSdS9qTxENj
 49Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsbFd2zS4LkeNczbUROUyxwjWUeO4/wmxar32/OwEnaoxmdhC8rrS9Dxt+WHDVU2wblUfzZ6zoFMvxDAXY+BqNl2Kk/bMjnvtVEhZhLEgr
X-Gm-Message-State: AOJu0YyRVGpRnRTCFvUhlwKw/lnKSRcxNZKHiQCN84BnFR/Y5YplKFnA
 z4hUHot+wseVE9g4rPjIyw87+bk1k9v120FC0dJDX+EPZNKW+/SPSPC9R185h8HJJsO+j6gbSQk
 vrBKw
X-Google-Smtp-Source: AGHT+IFa4jf2TDLU/Xu80gzMzsEE87YJKbiZ6ds3/RPYPRI8bZyFe1aoKibLde5t6lPqd2ndzJF6mw==
X-Received: by 2002:a05:622a:1809:b0:447:db4f:9f00 with SMTP id
 d75a77b69052e-447fa8b0790mr16642181cf.32.1720484457485; 
 Mon, 08 Jul 2024 17:20:57 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-447f9b4e536sm4621241cf.39.2024.07.08.17.20.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 17:20:56 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-44664ad946eso61241cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 17:20:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWndLb6erED3PMmCBL/7RZixfX0NqGcGt1SNZioo6nIrOUAW9aZCpqBY0bczZXVIAxeYxHKavsFbot09Wg74wv1lktUT3eSqOwf1aq9XHtu
X-Received: by 2002:ac8:6b85:0:b0:447:e393:fed1 with SMTP id
 d75a77b69052e-447fd03dedemr883021cf.7.1720484455811; Mon, 08 Jul 2024
 17:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240628182428.171031-1-tejasvipin76@gmail.com>
 <20240628182428.171031-2-tejasvipin76@gmail.com>
In-Reply-To: <20240628182428.171031-2-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Jul 2024 17:20:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VKiEjDfeK8pCqAk8+YWBD2U4ESLik8kiDbvgrZz7o1NA@mail.gmail.com>
Message-ID: <CAD=FV=VKiEjDfeK8pCqAk8+YWBD2U4ESLik8kiDbvgrZz7o1NA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mipi-dsi: add more multi functions for better
 error handling
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, LinusW <linus.walleij@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Fri, Jun 28, 2024 at 11:25=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.co=
m> wrote:
>
> +/**
> + * mipi_dsi_dcs_set_page_address_multi() - define the column extent of t=
he
> + *     frame memory accessed by the host processor
> + * @ctx: Context for multiple DSI transactions
> + * @start: first column of frame memory
> + * @end: last column of frame memory

nit: "start" and "end" comments should say "first page" and "last
page", not "first column" and "last column". The previous function was
the one about columns.

> + *
> + * Like mipi_dsi_dcs_set_page_address() but deals with errors in a way t=
hat
> + * makes it convenient to make several calls in a row.
> + */
> +void mipi_dsi_dcs_set_page_address_multi(struct mipi_dsi_multi_context *=
ctx,
> +                                          u16 start, u16 end)

nit: indentation of the above line isn't _quite_ right.


Other than the two nits, this looks fine to me, but I'd prefer if
someone else provides an "Ack" in addition to me that they're OK
adding these extra "multi" functions. Both Dmitry and Linus W were
involved in the original "multi" functions, so maybe they'd be willing
to offer their opinions?
