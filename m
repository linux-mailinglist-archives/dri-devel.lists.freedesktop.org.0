Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF2E7AF3F1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 21:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C4A10E31A;
	Tue, 26 Sep 2023 19:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1142.google.com (mail-yw1-x1142.google.com
 [IPv6:2607:f8b0:4864:20::1142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDB010E3B7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 14:01:14 +0000 (UTC)
Received: by mail-yw1-x1142.google.com with SMTP id
 00721157ae682-59c215f2f4aso112324287b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 07:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695736873; x=1696341673;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7xHsjPqk6JJBUwczwrhg2APBTdxlZcsovPFUPf8oBcY=;
 b=jjoIm3iQpweT8qUpBHBriyiBb9TGPY+vRH5y6JOE02UAPoVsj0byM4z6TkhZXZt4ax
 17ph7UcBDxWbwQrhf2R8ixIeZmEhxMMBPDDmRMCD5zC1Fc46EYhpNmWddrwTrGYguV+G
 nNkTfeQnW/m3iieFKgWK+RHDkiumMq/LN5+k8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695736873; x=1696341673;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7xHsjPqk6JJBUwczwrhg2APBTdxlZcsovPFUPf8oBcY=;
 b=ZnOLT6ScziomT9I5GAHJysMVNYiVx68pSm4nymp7iOPRJR0YyQPgU5hj7r1g3zRHJP
 te2CoaLjrO4KIHYAQHF9r887FbdUqsd1N53pFoY0T/sxXrv/i4kySHmEuHsJ1bQq73zW
 jviTi6URjgyGDfZ53K8BNlSqktrhtrYD+rms0lvO3see0f5+k78ak2keV+oRepdn8/LX
 LNkU/USBWjJleXb/uZ9Lm14RB+GAjKYHi34XavM/t0scEDsyvRF2qJXHhrffe5W1CsGf
 tKKiSbeC+cyuJW9BALnlECFPmd9KBJXpxfNFbjgk9UChiscAEsnSGjTKN1yPTFHGgnYO
 QpbA==
X-Gm-Message-State: AOJu0Yy3j0YevfKammzL3NEPXb+mC8Kyvf0rw8ArpRkygvEFv3ur3L/X
 9lDlH61yVwMlJP9P8kvzuLcBxlZXOzhABBvK3ER3lEyphJUUzTSXsfFuk9Oy
X-Google-Smtp-Source: AGHT+IHRQWjCnf+1z4BiGKGiibQRq7Ph9T+j4h2Pjol7PnCXtpHRP2XwhQG5pMLdECETFZ8LCCzuvpzFQ+pve6GD7Do=
X-Received: by 2002:a81:4f4d:0:b0:586:a170:7dbe with SMTP id
 d74-20020a814f4d000000b00586a1707dbemr9693811ywb.13.1695736873520; Tue, 26
 Sep 2023 07:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230921131201.157767-1-lma@semihalf.com>
 <20230922063410.23626-1-lma@semihalf.com>
In-Reply-To: <20230922063410.23626-1-lma@semihalf.com>
From: =?UTF-8?Q?Rados=C5=82aw_Biernacki?= <rad@chromium.org>
Date: Tue, 26 Sep 2023 16:01:02 +0200
Message-ID: <CADmiTCTHn+XaNqkAZjLmaYUy+6bsb5chue97g3n0bKP7Lcf9_w@mail.gmail.com>
Subject: Re: [PATCH v3] drm/dp_mst: Fix NULL deref in
 get_mst_branch_device_by_guid_helper()
To: Lukasz Majczak <lma@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 26 Sep 2023 19:13:53 +0000
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
Cc: upstream@semihalf.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 22, 2023 at 8:34=E2=80=AFAM Lukasz Majczak <lma@semihalf.com> w=
rote:
>
> As drm_dp_get_mst_branch_device_by_guid() is called from
> drm_dp_get_mst_branch_device_by_guid(), mstb parameter has to be checked,
> otherwise NULL dereference may occur in the call to
> the memcpy() and cause following:
>
> [12579.365869] BUG: kernel NULL pointer dereference, address: 00000000000=
00049
> [12579.365878] #PF: supervisor read access in kernel mode
> [12579.365880] #PF: error_code(0x0000) - not-present page
> [12579.365882] PGD 0 P4D 0
> [12579.365887] Oops: 0000 [#1] PREEMPT SMP NOPTI
> ...
> [12579.365895] Workqueue: events_long drm_dp_mst_up_req_work
> [12579.365899] RIP: 0010:memcmp+0xb/0x29
> [12579.365921] Call Trace:
> [12579.365927] get_mst_branch_device_by_guid_helper+0x22/0x64
> [12579.365930] drm_dp_mst_up_req_work+0x137/0x416
> [12579.365933] process_one_work+0x1d0/0x419
> [12579.365935] worker_thread+0x11a/0x289
> [12579.365938] kthread+0x13e/0x14f
> [12579.365941] ? process_one_work+0x419/0x419
> [12579.365943] ? kthread_blkcg+0x31/0x31
> [12579.365946] ret_from_fork+0x1f/0x30
>
> As get_mst_branch_device_by_guid_helper() is recursive, moving condition
> to the first line allow to remove a similar one for step over of NULL ele=
ments
> inside a loop.
>
> Fixes: 5e93b8208d3c ("drm/dp/mst: move GUID storage from mgr, port to onl=
y mst branch")
> Cc: <stable@vger.kernel.org> # 4.14+
> Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> ---
>
> v2->v3:
> * Fixed patch description.
>
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index ed96cfcfa304..8c929ef72c72 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -2574,14 +2574,14 @@ static struct drm_dp_mst_branch *get_mst_branch_d=
evice_by_guid_helper(
>         struct drm_dp_mst_branch *found_mstb;
>         struct drm_dp_mst_port *port;
>
> +       if (!mstb)
> +               return NULL;
> +
>         if (memcmp(mstb->guid, guid, 16) =3D=3D 0)
>                 return mstb;
>
>
>         list_for_each_entry(port, &mstb->ports, next) {
> -               if (!port->mstb)
> -                       continue;
> -
>                 found_mstb =3D get_mst_branch_device_by_guid_helper(port-=
>mstb, guid);
>
>                 if (found_mstb)
> --
> 2.42.0.515.g380fc7ccd1-goog
>

Reviewed-by: Radoslaw Biernacki <rad@chromium.org>
