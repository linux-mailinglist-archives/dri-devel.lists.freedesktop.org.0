Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C63D956D7E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 16:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAE310E2AB;
	Mon, 19 Aug 2024 14:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="hzKt3x+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE4A10E2AB
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 14:38:48 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-81f96eaa02aso241071939f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 07:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1724078328; x=1724683128;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6y2a1BeK2SBowS0pA0QUjE6K3qk5ezeQ8gQPXpibM0I=;
 b=hzKt3x+GbRHvzrdwhi+Ee2hAhoBssK7bwmrJwb/vpU2ZUh1iuBkltG+d7Zq48eO0Do
 1Nv2C38yGndbEmwSWpHczUdpzc7CSkr3JeO2c0E25AZoi1h27cy4q4UhbUY7vGZrdD1w
 4TCuUmOKuiyFYVSzetcXWhKTOcIXPHsE0bxnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724078328; x=1724683128;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6y2a1BeK2SBowS0pA0QUjE6K3qk5ezeQ8gQPXpibM0I=;
 b=av8O1cVOGFwJeahKF2ARjZ087HRqlGIsuDal5Hfz5OVcm7u9mNoTu2cpoP9X0O0f3g
 V8F77uSGwaPrZ7IucyxMBDqLl7GNkrb70/hkemdpFJnJLB+5C5nOGTe0lt2Pib337ARr
 d5ruM1Jt7lPq0dXVZyaOUiNxEv/dc8Q4FwmpjamdeZWF+YKsZJgIeEVZSoxbGyAROTIm
 mKhAwXU+2ztFczLe4A8p+gd+jE8NTY5ArwaS49l7gu6bMUI7rcU3N0E43UQQh3pxycRJ
 V8Gl8uP4jnjD8zHQN4rHZbjdSPfff5k/oK/AW8i8M2/EJy1mWScEXinQbDgmOSHjMJj5
 PRjw==
X-Gm-Message-State: AOJu0YxjqTVtMKrshjp4Kda/ifIbALdVsiHph2VDDHKoh2aSPwOMk4Ac
 uZHbzkgTOI1bj/3cAI/1DPRzAkQSWp1cQBLpYvirF/4l1mlvCfF8wv+PW5cMiXxPqimQI6fZEOi
 zOA/oIAovgbNxadjbX5HiRB1EHq9790HzpZ4I
X-Google-Smtp-Source: AGHT+IGj2lhVlKqpZ4nHE/VXdyQEyrUbrEAiN37GsiWnjjEEVdxcXeQO26roABbmC9bn9ZP5ITk/4lXFpgW2yeVfbX8=
X-Received: by 2002:a05:6602:6212:b0:805:8c5a:2503 with SMTP id
 ca18e2360f4ac-824f2656ec9mr1199319539f.8.1724078328149; Mon, 19 Aug 2024
 07:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240809183756.27283-1-ian.forbes@broadcom.com>
In-Reply-To: <20240809183756.27283-1-ian.forbes@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Mon, 19 Aug 2024 17:38:37 +0300
Message-ID: <CAKLwHdXJ3YxgVGOBdG_2aEUox=pMjTtpb6LcxZ-QXJwjRWskTw@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Handle possible ENOMEM in
 vmw_stdu_connector_atomic_check
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 zack.rusin@broadcom.com, maaz.mombasawala@broadcom.com, 
 Dan Carpenter <dan.carpenter@linaro.org>
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

LGTM.

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin

On Fri, Aug 9, 2024 at 9:38=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com>=
 wrote:
>
> Handle unlikely ENOMEN condition and other errors in
> vmw_stdu_connector_atomic_check.
>
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Fixes: 75c3e8a26a35 ("drm/vmwgfx: Trigger a modeset when the screen moves=
")
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_stdu.c
> index 571e157fe22e9..3223fd278a598 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -886,6 +886,10 @@ static int vmw_stdu_connector_atomic_check(struct dr=
m_connector *conn,
>         struct drm_crtc_state *new_crtc_state;
>
>         conn_state =3D drm_atomic_get_connector_state(state, conn);
> +
> +       if (IS_ERR(conn_state))
> +               return PTR_ERR(conn_state);
> +
>         du =3D vmw_connector_to_stdu(conn);
>
>         if (!conn_state->crtc)
> --
> 2.34.1
>
