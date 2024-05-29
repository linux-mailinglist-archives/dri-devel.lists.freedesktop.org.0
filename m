Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E558D3929
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFED112D1E;
	Wed, 29 May 2024 14:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U0K4nCHr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91DB112D1E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:27:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 79963CE1818
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21E2C4AF0A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716992860;
 bh=TOXMaYgFSnalOyTIuHAlPv3SCMAfk1IALrsvuxgztxc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=U0K4nCHra1tOtYa5bxk7uboHqK5t/KQSI28LgEWSbMR3+rRzvNoudhLm9JbI1YmW8
 fY/+LFtfnyRvc5vufh0zgJYNRopC31I+TqRWd0MAX6QpdsliyyuNgap6ugQh3cfIhD
 TC0kYEKWOAExAThaL7ZkMbRPkAvA4Tnb6/yT1FKuchsA+YOQGYJ713C72nHbpWjoHT
 5jS9hFSyCOCAoeU0v6OX2ogGiWzUCatyriBcad9QAwyT+T8LJlxKx2xCvpn80JAljV
 e4+cAkWv8CT80+gtjp+aeRzLP9ubJ+iIpKkiz98hI21VB7+DCu0nf84oM8MGArCuLY
 LMrRcP2O42gFQ==
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-627ea4e0becso21038547b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 07:27:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW15Fi23wUUEKBpeS9cRhIRB17cMPNB0R1lVgwTmx8nbmyjgxoQFcvCrc2H22Ejus1x1PrLaX+P7Q/8nxuS20Pgi10UcMcT/UU7c7V/00Xl
X-Gm-Message-State: AOJu0YzNcsp6xLMzgk3NgfvlPm54VqZqSbrOosuN5WbdZd26j0U2Yk1T
 ndtq2AtJ4dkS6AtkS0Q4vJYebtbnnqSGep9YWukZf7fJrTQLcWn5GCvneJTHUxaj+E5CAfh6JFX
 AnMjjCn8NIJQX4dAq7RZGteuGU/h7SPrFg0mdAQ==
X-Google-Smtp-Source: AGHT+IGiEwVWmg0b5+Rnms3113uyzDZEKDYKS/y8gEuJf4bfibbDVFImtob0m2MxBuljDG1zuRcX5bIiIHBzGSbGLaA=
X-Received: by 2002:a81:a14a:0:b0:618:e5c:f7a with SMTP id
 00721157ae682-62a08ea6630mr158602187b3.33.1716992860023; 
 Wed, 29 May 2024 07:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240318203925.2837689-1-l.stach@pengutronix.de>
 <20240318203925.2837689-3-l.stach@pengutronix.de>
In-Reply-To: <20240318203925.2837689-3-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Wed, 29 May 2024 16:27:29 +0200
X-Gmail-Original-Message-ID: <CAN6tsi53-NQBfEX5aNBSQYiGw_WvCNnb3ND5Db5a9jcYmWGjMw@mail.gmail.com>
Message-ID: <CAN6tsi53-NQBfEX5aNBSQYiGw_WvCNnb3ND5Db5a9jcYmWGjMw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: analogix_dp: don't adjust further when
 clock recovery succeeded
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
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

On Mon, Mar 18, 2024 at 9:39=E2=80=AFPM Lucas Stach <l.stach@pengutronix.de=
> wrote:
>
> Take a early return from the clock recovery training when the sink report=
s
> CR_DONE for all lanes. There is no point in trying to adjust the link
> parameters further.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 58 +++++++++----------
>  1 file changed, 29 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 300385db7502..98454f0af90e 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -410,11 +410,6 @@ static int analogix_dp_process_clock_recovery(struct=
 analogix_dp_device *dp)
>         if (retval < 0)
>                 return retval;
>
> -       retval =3D drm_dp_dpcd_read(&dp->aux, DP_ADJUST_REQUEST_LANE0_1,
> -                                 adjust_request, 2);
> -       if (retval < 0)
> -               return retval;
> -
>         if (analogix_dp_clock_recovery_ok(link_status, lane_count) =3D=3D=
 0) {
>                 /* set training pattern 2 for EQ */
>                 analogix_dp_set_training_pattern(dp, TRAINING_PTN2);
> @@ -427,30 +422,35 @@ static int analogix_dp_process_clock_recovery(struc=
t analogix_dp_device *dp)
>
>                 dev_dbg(dp->dev, "Link Training Clock Recovery success\n"=
);
>                 dp->link_train.lt_state =3D EQUALIZER_TRAINING;
> -       } else {
> -               for (lane =3D 0; lane < lane_count; lane++) {
> -                       training_lane =3D analogix_dp_get_lane_link_train=
ing(
> -                                                       dp, lane);
> -                       voltage_swing =3D analogix_dp_get_adjust_request_=
voltage(
> -                                                       adjust_request, l=
ane);
> -                       pre_emphasis =3D analogix_dp_get_adjust_request_p=
re_emphasis(
> -                                                       adjust_request, l=
ane);
> -
> -                       if (DPCD_VOLTAGE_SWING_GET(training_lane) =3D=3D
> -                                       voltage_swing &&
> -                           DPCD_PRE_EMPHASIS_GET(training_lane) =3D=3D
> -                                       pre_emphasis)
> -                               dp->link_train.cr_loop[lane]++;
> -
> -                       if (dp->link_train.cr_loop[lane] =3D=3D MAX_CR_LO=
OP ||
> -                           voltage_swing =3D=3D VOLTAGE_LEVEL_3 ||
> -                           pre_emphasis =3D=3D PRE_EMPHASIS_LEVEL_3) {
> -                               dev_err(dp->dev, "CR Max reached (%d,%d,%=
d)\n",
> -                                       dp->link_train.cr_loop[lane],
> -                                       voltage_swing, pre_emphasis);
> -                               analogix_dp_reduce_link_rate(dp);
> -                               return -EIO;
> -                       }
> +
> +               return 0;
> +       }
> +
> +       retval =3D drm_dp_dpcd_read(&dp->aux, DP_ADJUST_REQUEST_LANE0_1,
> +                                 adjust_request, 2);
> +       if (retval < 0)
> +               return retval;
> +
> +       for (lane =3D 0; lane < lane_count; lane++) {
> +               training_lane =3D analogix_dp_get_lane_link_training(
> +                                               dp, lane);
> +               voltage_swing =3D analogix_dp_get_adjust_request_voltage(
> +                                               adjust_request, lane);
> +               pre_emphasis =3D analogix_dp_get_adjust_request_pre_empha=
sis(
> +                                               adjust_request, lane);
> +

checkpatch --strict is throwing some warnings. Could these be fixed?

-:67: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#67: FILE: drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:435:
+        training_lane =3D analogix_dp_get_lane_link_training(

-:69: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#69: FILE: drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:437:
+        voltage_swing =3D analogix_dp_get_adjust_request_voltage(

-:71: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#71: FILE: drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:439:
+        pre_emphasis =3D analogix_dp_get_adjust_request_pre_emphasis(


> +               if (DPCD_VOLTAGE_SWING_GET(training_lane) =3D=3D voltage_=
swing &&
> +                   DPCD_PRE_EMPHASIS_GET(training_lane) =3D=3D pre_empha=
sis)
> +                       dp->link_train.cr_loop[lane]++;
> +
> +               if (dp->link_train.cr_loop[lane] =3D=3D MAX_CR_LOOP ||
> +                   voltage_swing =3D=3D VOLTAGE_LEVEL_3 ||
> +                   pre_emphasis =3D=3D PRE_EMPHASIS_LEVEL_3) {
> +                       dev_err(dp->dev, "CR Max reached (%d,%d,%d)\n",
> +                               dp->link_train.cr_loop[lane],
> +                               voltage_swing, pre_emphasis);
> +                       analogix_dp_reduce_link_rate(dp);
> +                       return -EIO;
>                 }
>         }
>
> --
> 2.39.2
>

With the above corrected or checked, feel free to add my r-b.

Reviewed-by: Robert Foss <rfoss@kernel.org>
