Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC079D3948D
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jan 2026 12:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2428A10E2A9;
	Sun, 18 Jan 2026 11:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xv2IQuuG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6B710E2A9
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 11:42:18 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id
 4fb4d7f45d1cf-655b5094119so425059a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 03:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768736537; x=1769341337; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=te6FnboAFJ6x9uRbg9PS2os1I8lYLucGhR7IWQ0O5mc=;
 b=Xv2IQuuGmjJbkh4+e/6AG92ZAwngLTOtTzP8JimKvSxm7lLcPfmZo7z/tU/ficeLnk
 E5WDGr2qzS6aPlfKi5l9rPFXSpRUC+mGEGt7/EyCUiznGY58jOeFa7elr0Aakbe1UyXR
 boKfAiMPt4MA5R+5jNBlF2G+JkuVRoqFqrDeyRTvVY43JQrGtW4IBbY/8keofODcmEiy
 +qzaHAOg1m6fomvRZbHm9zTRTunkNSP/eBp44M/FUXahMYQ+1RKq85pZ81XKprqDvl0Q
 CODH1Rozr8NDbbNH5Ys9uKMYNacxRtVywgPYj9XCxcJLDZ5/TFyyieqZlNvNQQ53r/mQ
 g/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768736537; x=1769341337;
 h=mime-version:user-agent:content-transfer-encoding
 :disposition-notification-to:references:in-reply-to:date:cc:to:from
 :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=te6FnboAFJ6x9uRbg9PS2os1I8lYLucGhR7IWQ0O5mc=;
 b=b8SjsTNvMaI+BSuC4qpkzZ39sdamoaK11N1tkzAlIDHr+9DoAYaKVsbPWf46ju1xIr
 OPePgEGlckW7SAcIAv+lRQ+Cb9ULAPJeugoku+1lu3WbthAbVLfTD5V/G6Cz8a1iRiaV
 Y5FYrF1Di8DRa1p6CAukI8fxd+fZ+mr8HxfgC02VUa4Gd/yxnvXbLrZCAuqFhKl6C3oN
 ok8QFedk4wAjCf9V9BSw0qKipe7kG9vNk7Kg3/GiCkbJYkizFh8V7m0tm8lY0KhQaCrm
 ZMWPL8VC8vxEKumt4xDb9Q+2+UyXgz20UPNI4ewrNUGu5KHj7gxqgg06lOD9MorTD4Ei
 USSA==
X-Gm-Message-State: AOJu0Ywr0DRmTIdoLtRpTM9Ns7G1QP5hm/HR2ZTuZ7YnUWCcYmCyM58e
 v7dUlvU5HWqXGDnu9ksrZa98rVOFYf1CXWQQEg2tzN+A/RozRbjgORn2
X-Gm-Gg: AY/fxX5Hg2phaliRxHR6p3qw5+Icw+SrwFJG2QB7Py9n7Lj/WSboMk6xUS/SKe75wOo
 e+3AJHokiiRo63fTq+N1MsQYNJT3y1UwcsIA2UHxK+wW3iThR0WDBXB5hW4k3/9HRQ68LXwFwY9
 8COV4rnk5kMdmr9P6wEMbFBMQkc9LbL9cDBJoyD9q7tFv2E4bc0uP2ErmjRWkP/R1nHJo3LJCDH
 459axkqxxq1EsRUqbHKTwbuK6uADMO5Ul0i5uotph/wMXVxRCIgdaMEnNnD5DKje7Ag/mrDPd+z
 B/nXeNCEypf3F4PSgOSX9seS/aaogemLRgJlDTHZZPlQZv+UcpjtY8/BcAGuM5qd5YiGh9oUYgD
 yk7zpi8DMHbqC1ttzx1c/VugthYJ7UqJ5wlElL21va9BG2neqGurLP6shuUC+fcuMxQhp2XkZf5
 W/2s6kCFFMW1nlfxnNTsLW2PLV1Jv4Ifpy8oTZ2oLZl1ewqYsga1hj5+Xac53jWwS9kAwWT2M=
X-Received: by 2002:a17:907:3e82:b0:b87:2780:1b33 with SMTP id
 a640c23a62f3a-b879300dde7mr389871166b.3.1768736536773; 
 Sun, 18 Jan 2026 03:42:16 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl.
 [87.205.5.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513ea20sm835517266b.12.2026.01.18.03.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 03:42:16 -0800 (PST)
Message-ID: <a728742803f7bef5ab5ec046b85e1cb9ff23171c.camel@gmail.com>
Subject: Re: [PATCH 0/4] amdgpu: Enable Adaptive Sync over PCON with HDMI VRR
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 	harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 bernhard.berger@gmail.com
Date: Sun, 18 Jan 2026 12:42:15 +0100
In-Reply-To: <20251220114649.169147-1-tomasz.pakula.oficjalny@gmail.com>
References: <20251220114649.169147-1-tomasz.pakula.oficjalny@gmail.com>
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

On Sat, 2025-12-20 at 12:46 +0100, Tomasz Paku=C5=82a wrote:
> Adaptive Sync over PCON is only available as FreeSync over HDMI. TVs whic=
h do
> not support FreeSync, do not have working VRR with DP -> HDMI 2.1 adapter=
s even
> though adapters will take care of HDMI VRR info packets.
>=20
> First two patches add generic drm edid parsing for HDMI VRR and ALLM.
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
> Tomasz Paku=C5=82a (4):
>   drm/edid: parse HDMI ALLM info
>   drm/edid: parse HDMI VRR information
>   drm/amd/display: rename PCON adaptive sync types
>   drm/amd/display: enable HDMI VRR over PCON
>=20
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 24 +++++++++++++++----
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
>  .../amd/display/modules/inc/mod_info_packet.h |  4 ++--
>  .../display/modules/info_packet/info_packet.c |  4 ++--
>  drivers/gpu/drm/drm_edid.c                    | 20 ++++++++++++++++
>  include/drm/drm_connector.h                   | 23 ++++++++++++++++++
>  6 files changed, 67 insertions(+), 10 deletions(-)

I'd like to inform you that this patch series will be superseded by
another, bigger patch series which compiles my recent work as all the
separate series/patches di conflict with each other.

Thank you.
Tomasz
