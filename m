Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C18950B2C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 19:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9A910E3AF;
	Tue, 13 Aug 2024 17:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="C7WCHevx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3CF10E3AF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:07:27 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-e0bf677e0feso5885259276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723568847; x=1724173647;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZlNgNfBbzcsYqhZSsHAy5Qq6WOBxXSIA3KrLSAIEpPg=;
 b=C7WCHevxhQezNNRfaVIXObYp3Mg3wePjcX5lYCYK0E+9KTwDeAK3gqvXctnQBBmr+q
 JaCeTAR/Znbol3thaCOpnvCVoJJHJrlGJ/yMf63zoaYnnyC4Pdwzp5sygG0fi+wSWHD5
 1QxU2FktlGs8xKza0hArkPCmcjjau3Trhi+EU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723568847; x=1724173647;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZlNgNfBbzcsYqhZSsHAy5Qq6WOBxXSIA3KrLSAIEpPg=;
 b=bo7fC/mgdor2VbUfoLByCGL+qrRPQmpgGlcG6cBHzRw7Wcblz7nEcdvfP3FfWS+V7s
 rxsCEnemB7NLiYK2sA8WvA9UUPln/2z1R9x8XyFkgQX1Qpn9Zi8ktxj64QOBCioe3OYI
 bc2k2KlWiNzuES/lC5eDXSlN+9lQbjUrcah4kA8j+h9ETpoY/iw2SsLIPHDqPmWTWNfN
 vI4XwTG1gsKHrlAnbCXWo87bdZc5DIw5np2jCMy/DNxcDysMusgmC2xfGTJDRUKgD/U4
 Iyjae7R3fi3Aw3KdEdrIh6G3LXAbu1T3yhodIGVEXhAr2Hfd8UO89/RkUxfqxz9gk4XA
 nf3g==
X-Gm-Message-State: AOJu0Yx5tgoKibJYVkzPkMQxfpf1rGtgj+mXdql/tMdiIhrLqUKhgvc9
 gaESg0BjwgSQfFOzNsQ3nARvPzNrJmYmdYT20OxsFrDYmh516mLDa3lt4bZ9PfjARh+JX+LQWo2
 348gd8szCCe/4+7z8HQ5K9jajKnsaX1EKdaRJ
X-Google-Smtp-Source: AGHT+IHzwzwi7LJ/EMEKof0VvLkB9rHd/hGiqnUZXD3scOQX7HwzbHvNbhVMnzcaNb03q7iKUxKixn6vSLoHXMdLBBk=
X-Received: by 2002:a05:6902:1b11:b0:e03:5f4e:3265 with SMTP id
 3f1490d57ef6-e1155bf9658mr165203276.51.1723568846752; Tue, 13 Aug 2024
 10:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240809183756.27283-1-ian.forbes@broadcom.com>
In-Reply-To: <20240809183756.27283-1-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 13 Aug 2024 13:07:16 -0400
Message-ID: <CABQX2QOB+9vqPCOxbzeMom2oLVFgYCYfK0e1givgGVhjCuS-mQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Handle possible ENOMEM in
 vmw_stdu_connector_atomic_check
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com, 
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

On Fri, Aug 9, 2024 at 2:38=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com>=
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

Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z
