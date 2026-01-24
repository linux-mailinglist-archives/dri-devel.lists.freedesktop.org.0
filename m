Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id b3pmGotZdWlsEQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 00:45:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 842F67F490
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 00:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B6010E344;
	Sat, 24 Jan 2026 23:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="X5h25JVO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FD610E344
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 23:45:10 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b87f3c684a1so520307266b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 15:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1769298306; x=1769903106;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=64BSz+gQVfwtAPitg/eQCvUUqb1RJSD+V4STovdNapU=;
 b=X5h25JVOFD9R0cDR6Cg07u/ToXgIdrL8EgmlJEA7GKZAWVgj9MytQtXoI1uTt200ed
 9Ut0DW1no8glGiPG9KPfLL64RWDFmvScK0yYRHEnq+jmjzbS/jN6mRwojswuCajxeTan
 27vK6A1O8yEf1uRuxsulyv3o/2cWQ7ViauKXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769298306; x=1769903106;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=64BSz+gQVfwtAPitg/eQCvUUqb1RJSD+V4STovdNapU=;
 b=SiwRhf0yovNAtZONxHUw4vv4rB1fORIxnc9jjahET2D1/hSJgQBLKSUpj2rz2nCd2r
 0IJD2ySxXzP5L+I2mqZv0e2x4fkrwAuwFPQ42+cAa5fufz2QhlZ+a8XbKAvd1WCCI3tU
 gpLeRMOzplZloJXoZjbFELRGZgFMYSf3W+PMaI+PbdnpY0Hk5zmikdD7tYuHMp4P2kgF
 ZR9Neuf361c14+UhG9us4kQ7LOIq2vcL+z2YJfx5IAWa/kl5nX77QnwV+XkMWOWAaLDx
 Wp4acl+XqwmAgO2k/7KGObg9myQ/jMvkwgdGgCAe9TPkyJs2EpztLlCM0cNAHfpJWzOB
 Ebmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF7NkSDQSGmZWVHHVZ/cYCQwiFCqWg3YuIgXR5NO7S+6iJMpZjwH0AG13iCmToXdQw2jvUYWfwil4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1FmMziwOSbpciP5VACZMheV+4tXx6zLTFsSGWLYsiTNCmYGHo
 4O8KuIgA1Gk+nmW8jwtEzHEBLg0Hm+RmaUkeTDRvNK/oUEruEnW5I0r99IdntJzUnNG2Zs2YG+U
 AUtuWKA==
X-Gm-Gg: AZuq6aJFen0g9cPL3Zs8xoipYLuiXFzRxV11VnAohi9Lj5yUYEuHifQGu6bZCW3xyE0
 1LlaKvYfqZNV+wqKUjADWGpwpDte2bRfe1JDW0FSfV5Ijwe48PmRMxlLsEnrWB9MN5M/g6+xNwv
 C5iXUXIkH7tXebMcwiC8Bsqm0V+GxB4Fwsu5U8YwUqn3J5aY7Rnc11PhOQGh6g/Kv0rpowPhG2U
 FMINowlcdz9QABHC2u/KhcLcevk6WUU2hwf3pX4kXh0hIcv58Ce8+bmwyB3yCnyDHO7QlKZUnCZ
 yOwPKSO/FwOQx/3WQm46wK1DEvamDyMwH+cTSuWlLJ19XMd9S7gdq5jV1UjPf4eyohZf7tpvnGq
 iRofqzwt1yBTV61do0LF32tGy3HyLjzeLLTiMqV9XpQOndqBLcSwKcFcCFZLyeOb2oYZ7h88p1o
 a1pt3q0c7+os4jTYIkB/nVmvgtFlvJO00mKto9ex8CZB1cXnLzuQ==
X-Received: by 2002:a17:907:7210:b0:b88:31f9:1d9a with SMTP id
 a640c23a62f3a-b8d2e88b1camr11455466b.62.1769298306363; 
 Sat, 24 Jan 2026 15:45:06 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b416ca5sm358548966b.25.2026.01.24.15.45.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jan 2026 15:45:05 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-430f2ee2f00so2036565f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 15:45:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVPNZC/8s6alv9b4uDjyjMdrW46YhDgvjN1VP9rzfcAZbMw05R5X1kb2diBujCBV2Gw8Bvj1LZAmg4=@lists.freedesktop.org
X-Received: by 2002:a05:6000:2dc8:b0:431:a38:c2f9 with SMTP id
 ffacd0b85a97d-435ca3a91d8mr137432f8f.63.1769298304606; Sat, 24 Jan 2026
 15:45:04 -0800 (PST)
MIME-Version: 1.0
References: <20260124124959.196051-3-caio.ishikawa@proton.me>
In-Reply-To: <20260124124959.196051-3-caio.ishikawa@proton.me>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 24 Jan 2026 15:44:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VhqTmEhVade6JPUz2_SBcw-J8NS2J7FNqR2j6qLFAJJw@mail.gmail.com>
X-Gm-Features: AZwV_QgZEtGkBK3Zr4-I6IssAxaMY028xep_xUfhkaAzwQ8IyDTdtt6xdRyG52A
Message-ID: <CAD=FV=VhqTmEhVade6JPUz2_SBcw-J8NS2J7FNqR2j6qLFAJJw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 842F67F490
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

Hmmmm, I guess we missed this one call when we moved the rest of the
driver over to the _multi() functions.

While moving this one last call over to _multi() doesn't actually help
at all with code flow / readability (arguably, it makes it slightly
worse in this case), we did agree that it would be better to move
everyone over to the "multi" variants and deprecate the non-multi
ones. I guess, if nothing else, we'll now get an error printout if the
NOP fails to send, which is an improvement.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll try to apply in about a week if there are no other comments and
nobody beats me to it.

-Doug
