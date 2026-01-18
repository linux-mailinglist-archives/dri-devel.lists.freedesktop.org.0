Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89435D3948A
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jan 2026 12:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8553710E27E;
	Sun, 18 Jan 2026 11:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XL4JAsgm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830D610E119
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 11:41:18 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id
 4fb4d7f45d1cf-64b7d213fd6so633730a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 03:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768736477; x=1769341277; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=mLh48X5tXDlaNj7wOvjo2Wepz3Px1aU/XLKAVLX3p/k=;
 b=XL4JAsgmigUv1g+pPDe7C0YIdcq3pN8/T6CEBSjtSbiKqq+Rx95RE6E66soTedNNLb
 e4C+2tShvOA8tnbFIycSAwmhNNQLhGhrvNa1ZYCxRlR2N3jMYOplWfhlnmDEpFHK4MaP
 p1zPJ3DmNHkRQAmnsZwn1cPfg4khzSEzyHfybsumyllpuBCkbePnB0NBemXBbKbxM+9v
 a8M+b3kcbuoxzBgtK95X27VG6EZwCPTuXoBs/rfQiZDtwFGb7TuUOYE0mT14i2vS8Y2O
 h1bZEBK6pKjoEwJjVE2Cmyo74r0vBC1Jx9qMDifXG1RWSSpkt2qGhB7YGTnKdiK6VmKj
 JiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768736477; x=1769341277;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mLh48X5tXDlaNj7wOvjo2Wepz3Px1aU/XLKAVLX3p/k=;
 b=LeDrdL2HJkDJvMckkDtnLZYde9LfNcVkESG63MfziDmWm26PXmjkNyS4VQzhsYeLf9
 C12yBO7CndJA7mqA7jR1fePVEKi81Asfx/s/miIno662u9IRF5Xb/Fg/4OEjbmAz1BpX
 h5KQLgPY85/1YW3/Ks6hf71qhNDV1njgAZmkDdV2VgLz8XJVvbBnEsWQT9eb5AlwIkZP
 XMIDncsCKP9LV6hCye+wf2i2RoOSPCA5VaBlcl32ua/ytcECfZmRBjIhfND1yYO1rF99
 7igEonxKhbRHhJOunzPiIoL0/RsR2vAvJWBaoKo/wodzOkbDXXmQ0Ri4Kn3FE/a3MkJM
 3CtA==
X-Gm-Message-State: AOJu0YxbuuhpzRSrTtz5yzGsXv02a2kqN5srvGL+YQje7rrckjBymjU8
 BnDLBMMwyUfIJ2FoarUdHyCxi56k1Jp3vajPbdXvnhHDT92U2BzWj/ql
X-Gm-Gg: AY/fxX5q/m5ps2s4dQA5qIzMI6PLbpWnATmKnLQM+enL+Z5Bc1BKAYGvMkEDWpvc5IK
 bDGxg4kjbFIv1HsqeImsV/H2VgQzeNK6bAMCOC/nCmzkcPIT3w3CDMYdyFAJWavOyMWD3cjUao/
 KApwXG/9r2Tof64ecvdrFRwu7re6LblVYgEhAReW8xFptS9kOeBk367ny2dTESf9iPAdoXS70AJ
 88DnCwlmIGdq2yPUWfAtPNODjrbg0t/9wUU2VQq4cPu0oFZMbwuwfvUtTDiX5uT6WH7cSpuw6uV
 nc8G2fPn4aYqqq7C/QlaYVa5EBqZ01uu5ZD5F6Rssqv1IP7sm5vMc4zTJJR2AjMzkPjF9fBFOJ6
 U5x6YoowVxQXuF3m8SWRHuv5AC1qOgFOzzHk/Rl3sKkL44xr67VCEpx0IPCIfUK24B+m+htH/nO
 5UqGEhBN2E9Iv+C+CqEvOqydTvBVw/q1fNAM389jFvGH/tyIFs+LKXWk6CyuYRw5m9vWs7aAc=
X-Received: by 2002:a05:6402:4404:b0:647:853a:f161 with SMTP id
 4fb4d7f45d1cf-654523ccc08mr3578553a12.2.1768736476668; 
 Sun, 18 Jan 2026 03:41:16 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl.
 [87.205.5.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654533cc70fsm7658121a12.17.2026.01.18.03.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 03:41:16 -0800 (PST)
Message-ID: <f7eb4d8540e1453fa7612e76ad7b78e5f4c165a4.camel@gmail.com>
Subject: Re: [PATCH v2 0/3] amdgpu: Enable Adaptive Sync over PCON with HDMI
 VRR
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 	harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Sun, 18 Jan 2026 12:41:14 +0100
In-Reply-To: <20260113214104.146856-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260113214104.146856-1-tomasz.pakula.oficjalny@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
MIME-Version: 1.0
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

On Tue, 2026-01-13 at 22:41 +0100, Tomasz Paku=C5=82a wrote:
> Adaptive Sync over PCON is only available as FreeSync over HDMI. TVs whic=
h do
> not support FreeSync, do not have working VRR with DP -> HDMI 2.1 adapter=
s even
> though adapters will take care of HDMI VRR info packets.
>=20
> Since HDMI VRR relies on FRL modes, this will only be enabled for PCONs i=
n the
> VRR whitelist. HDMI VRR for native HDMI connector will still not be
> possible/attempted.
>=20
> I myself validated these changes with my Samsung S95B + Bernhard validate=
d on
> LG C4 + FreeSync-less Sony Bravia 8. I used Alienware AW3423DWF that only
> has HDMI 2.0 to check that FreeSync still triggers properly for "older" h=
ardware
>=20
> For missing VRRmax or VRRmax =3D=3D 0, the upper boundary is the currentl=
y selected
> video mode refresh rate. I wasn't sure how best to implement it but 10000
> works since the driver already limits VRR range to the currently selected
> video mode and 10000 Hz should be good enough for years to come.
>=20
> Changes in v2:
> - More info parsed from HDMI Forum vsdb
> - EDID parsing squashed into one commit
> - Support for VRRmax =3D=3D 0
>=20
> Tomasz Paku=C5=82a (3):
>   drm/edid: parse more info from HDMI Forum vsdb
>   drm/amd/display: rename PCON adaptive sync types
>   drm/amd/display: enable HDMI VRR over PCON
>=20
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 27 +++++++++--
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
>  .../amd/display/modules/inc/mod_info_packet.h |  4 +-
>  .../display/modules/info_packet/info_packet.c |  4 +-
>  drivers/gpu/drm/drm_edid.c                    | 41 +++++++++++++++-
>  include/drm/drm_connector.h                   | 47 +++++++++++++++++++
>  6 files changed, 114 insertions(+), 11 deletions(-)

I'd like to inform you that this patch series will be superseded by
another, bigger patch series which compiles my recent work as all the
separate series/patches di conflict with each other.

Thank you.
Tomasz
