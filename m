Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E09817EAD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 01:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9272010E3AD;
	Tue, 19 Dec 2023 00:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD22310E3AD
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 00:19:18 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2cc7087c6c4so21146091fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 16:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702945157; x=1703549957;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=HeNDDsbD/q7ceEEjIte9s05PpXvza3fs70vppdU/svU=;
 b=CFpE/WCbo/QNqzkmJDldxKlMuYvqJ1cgKE6j7RDUVazaBQFqPa7okUDzOKgHefy/H3
 ZISsK4NVj3xQp4zPYSJl7kKkzGh1VDI2Jy9YeTp1Qx/8TzVDtWB6/UeByqiNXFXkTRew
 5mdS+x2IeCQtj7IcuxgPCOttZVKNwZpB9tI3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702945157; x=1703549957;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HeNDDsbD/q7ceEEjIte9s05PpXvza3fs70vppdU/svU=;
 b=Kzep1agOQeATJlN7to1PVO+bXdOaVRcYojCh1OQ9rIabafmdGzoXGj2dKu3OfMzHf0
 FMxKopIX4U//UrQQvbj11mjxRWFrgZhlXtN1epfdgombnq4BtFxSELAO/s7MiBv3WMrc
 NggzdbW5V6heL5sa+dg13jdoecLgVfgMtHjs1vPGwf5Oqbn1GLhpcybaISgMsaKFauSx
 XJzIpapiyTGebxzishRlfPdlTXT+PPJ0CKCtHtLVHNLA9Hz/D/VlCQNggUvtktXWGs6x
 Vg+H+yc+KXNYUDL9gHmIPlgCUQTB4FyCXn9Iu8B7ZUcGftApwEzeCaTzRfdRqoSJqQwt
 izxA==
X-Gm-Message-State: AOJu0Yz3rWBCd3/84YoVJgx5Wex8+SeOMCZVHB0Na7NWy2CU0tSFoXVP
 pmz7Ihey1vQl1aWZxF//+UTvH2WyK7J37MMZH50C9A==
X-Google-Smtp-Source: AGHT+IFZXiTnaut+pYNCIhuF7uLHM9Suzdi9wtNFcOj+Q77V4jTh9t2mK8I18XuFgpCeLN7qbT2/xQFDDL9J7CuLQlg=
X-Received: by 2002:a2e:9ec4:0:b0:2c9:f108:9ae6 with SMTP id
 h4-20020a2e9ec4000000b002c9f1089ae6mr7701234ljk.1.1702945156916; Mon, 18 Dec
 2023 16:19:16 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 Dec 2023 00:19:16 +0000
MIME-Version: 1.0
In-Reply-To: <20231218090454.1.I5c6eb80b2f746439c4b58efab788e00701d08759@changeid>
References: <20231218090454.1.I5c6eb80b2f746439c4b58efab788e00701d08759@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 19 Dec 2023 00:19:16 +0000
Message-ID: <CAE-0n51hzBrZLwze4-2z+P56KYM6JucpQxmUx1s+D9+VK-f+sA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Fix size mismatch warning w/ len
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2023-12-18 09:04:54)
> After commit 26195af57798 ("drm/bridge: ps8640: Drop the ability of
> ps8640 to fetch the EDID"), I got an error compiling:
>
>   error: comparison of distinct pointer types
>   ('typeof (len) *' (aka 'unsigned int *') and
>    'typeof (msg->size) *' (aka 'unsigned long *'))
>   [-Werror,-Wcompare-distinct-pointer-types]
>
> Fix it by declaring the `len` as size_t.
>
> Fixes: 26195af57798 ("drm/bridge: ps8640: Drop the ability of ps8640 to fetch the EDID")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
