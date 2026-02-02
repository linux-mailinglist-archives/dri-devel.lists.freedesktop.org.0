Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2P3qDI/PgGlBBwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 17:23:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785BBCEE6D
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 17:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B87610E2CE;
	Mon,  2 Feb 2026 16:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nfaXqux1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7355410E2CE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 16:23:39 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-658078d6655so9010828a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 08:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1770049413; x=1770654213;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vaV3IL9ro8NZdhSR9VH7JUHGaFRzoo32AE2sGgVePaE=;
 b=nfaXqux1GJAfYBISVhhq3toECYlOTaU+/BckVLqHbaNfBH4wcQzEiucVvqgtFL9yaM
 F9PDSZDawzjcRHnY5J6dBmnCrxaoPkhEqa/RpuBkmz3dmymVpDsAr08rOtWlges/j0to
 9sykdEMYy0aIp/TL7WWDq+KcB2vpsOO4BRHPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770049413; x=1770654213;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vaV3IL9ro8NZdhSR9VH7JUHGaFRzoo32AE2sGgVePaE=;
 b=iN75nhrfSaKdfzZK6NpkDhZ0v+hLyZbfKCq0OXPdHiRp3lOlhygU7ds6jmU/xfxbs8
 AM1XRR4eqIQFHUzj9n7F/IwSKfQshpWOrf7naxbeorFnxxsrz3ZPiOr5/gE3HQyWNmde
 gUvZqXhTmSmpHMKyc7jv1cRjEcmJmz9UzP7zcay6C3T8a6x8sXLQj0amH4RBfLk8WWvA
 FYWrjOtNlEK61PaZO+2KFsouo5SY+s6ndgIQVjbJ+ZvrBTqFyWMQ+i1aHYnBrGu+hGZ4
 xlFqJ5cL8jpwqSgsr7bAwYsha+yUnlhWk0GgmXLFyGKod1fyCtyqj0Clau0D98s1ftNS
 6EuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu8xkVUGaGu0mH3BIYb+9bFl8jf7xle2lnmxom3cgmJVJROcHNznr1rf4lTDV8aVMQXTnloyW/0jw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzshvN1bafJgkFsAKl6cEKQjNQ+wGS2mBJUMSj5MUEMO98uQBYv
 YGepimQJa9iuAugPwWAZgiT6b6Mn5Wo3tqWt7+grqXPhqNjqiHTkmNFsN0niH1+SupsgfY1Cmdm
 Zb/8Z2Q==
X-Gm-Gg: AZuq6aLJQMaaChefukrkxr+OHjxVDH9wunsGupHnOfWjBciNcbvRXdM6kWwwFoC8dzK
 besrRiPTP7qEexvQfQG99ukuKvytcaQjUTg5Ll8K68ztp2AXBPhJhp8wuI1Gag00A7j1Tw+4heg
 v5FIAfdMy+PDh6zJ2dTF7OORw1JY0lk13ILsq9IL/vBuxz4OY/UGgz0rsIkwmGAFY6Mp1yQSRAZ
 I7OD0wWWJDHoyiFmO7CrWYhRmDJ1zy8AsbIzfTq1S1/YusI53caKEE3pbRt2ttveFTcF4RcJ5Ve
 ItFkYtPrHJxJn6PxwebV3nKStmphARMoaGJFzann1kTnOVi+5Ov4nV25zETECfBD3LLEDkBTUdv
 Z0m272Ow8/kiEkeS7EeHc5hBdo0vZQ+OG0FtpF28QwLpjENm0xIg1BMF/jRvgbQUxYZ4LAw3N1Z
 Qq49t5kO094X1SomlkTSJIGG1u4W+IeJIuAY8+oUSOIT1BIscGTA==
X-Received: by 2002:a17:906:6a1f:b0:b7a:39a2:7f50 with SMTP id
 a640c23a62f3a-b8dff66cbd2mr754998366b.39.1770049412664; 
 Mon, 02 Feb 2026 08:23:32 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8de3046abasm732988766b.2.2026.02.02.08.23.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 08:23:30 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso38819165e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 08:23:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW2mK8x3MN7iOq7FZv9oh9c6ODMXqT0dZik2kGPi6FxyHCmTD9TD5Ln5ZP6rCo/1CsIvUGrKBV4Lxw=@lists.freedesktop.org
X-Received: by 2002:a05:6000:2304:b0:435:9cd5:bb2a with SMTP id
 ffacd0b85a97d-435f3a7449amr17889894f8f.24.1770049409825; Mon, 02 Feb 2026
 08:23:29 -0800 (PST)
MIME-Version: 1.0
References: <20260124124959.196051-3-caio.ishikawa@proton.me>
In-Reply-To: <20260124124959.196051-3-caio.ishikawa@proton.me>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 Feb 2026 08:23:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vd3PbB9h4=n=8ArkMJ8g1VKxpxSk8pLDJ4gDYn1_=4aw@mail.gmail.com>
X-Gm-Features: AZwV_Qh9MOMFDj_D9NVUaM65CMldX-k36ArrFEYXuZ-hMHRf3G7YEdTaS_DTrds
Message-ID: <CAD=FV=Vd3PbB9h4=n=8ArkMJ8g1VKxpxSk8pLDJ4gDYn1_=4aw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: boe-th101mb31ig002: Remove use of deprecated
 mipi_dsi_dcs_nop()
To: Caio Ishikawa <caio.ishikawa@proton.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:caio.ishikawa@proton.me,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,proton.me:email]
X-Rspamd-Queue-Id: 785BBCEE6D
X-Rspamd-Action: no action

Hi,

On Sat, Jan 24, 2026 at 4:51=E2=80=AFAM Caio Ishikawa <caio.ishikawa@proton=
.me> wrote:
>
> Replace calls to deprecated mipi_dsi_dcs_nop() with
> mipi_dsi_dcs_nop_multi(). No intended functional changes.
>
> Signed-off-by: Caio Ishikawa <caio.ishikawa@proton.me>
> ---
>  drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Pushed to drm-misc-next:

[1/1] drm/panel: boe-th101mb31ig002: Remove use of deprecated mipi_dsi_dcs_=
nop()
      commit: 3c55330aac69150a1a4ff20684b41e7f66ad5fe9
