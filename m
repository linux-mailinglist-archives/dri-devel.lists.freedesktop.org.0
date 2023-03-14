Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D32566B9173
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 12:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC7710E75C;
	Tue, 14 Mar 2023 11:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFDD10E77B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 11:19:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B9C7F6172C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 11:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BE1C43324
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 11:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678792759;
 bh=L+ObPflwCpsjIlYvEFNRmXrxfJVM8OShBibqT6iMuMk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ai2IZNgTd2odBKUo/ClyuF8lE6C+shMaZqx5sj9pKsBMjvHZNTqyq6kGnyZ19sPuC
 BEmh7PQrbZfn4gra1LVnVISlrg59MZ11s+vFCjaGwXIYcQQV0exQpwq6mLtDikzKPq
 ru2OvYWrrim1zu3fqc27wvhRGpmIWq5LwO9n5a5ZI+51R275MjFvEbVjWVXUyvgxti
 LaU+IR52e1T64u3KmtIttOOvw6IjkP2+tEP1rLewJMX2pEpROQlbFAg+4tCtRziGEH
 dnIEiXZV65hgyrW3vzhMqseEe8yvRejpQ/4XIfChbSfxAU8qxjhMTX5INk5/2dYNLf
 yPeYCttQoxtDQ==
Received: by mail-pj1-f49.google.com with SMTP id
 p13-20020a17090a284d00b0023d2e945aebso976423pjf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 04:19:19 -0700 (PDT)
X-Gm-Message-State: AO0yUKW0FKVMiaZCEpVZk/9SsgRr9pU6Bfs8JthaGZPDJNr+YBlti2X1
 FS6sGKEaaF4J02iLDWws8JG3Qbck2/Z9W8r+JoL1EQ==
X-Google-Smtp-Source: AK7set/H2AVJzooGw8hvHI3ZJk6UV/BOEaxFeZT4EnrNm3JVY67/vn/oQV+poWINfaKjkwWVNk1UoXGb2RJ/jetFBdk=
X-Received: by 2002:a17:90a:6804:b0:237:9cbe:22ad with SMTP id
 p4-20020a17090a680400b002379cbe22admr13500631pjj.5.1678792759012; Tue, 14 Mar
 2023 04:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230314110043.2139111-1-treapking@chromium.org>
In-Reply-To: <20230314110043.2139111-1-treapking@chromium.org>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 14 Mar 2023 12:19:08 +0100
X-Gmail-Original-Message-ID: <CAN6tsi7d9XPfQmp+uSjbsgS3YeLJF_Ozp4ZjoaVOF2oWJQgLtw@mail.gmail.com>
Message-ID: <CAN6tsi7d9XPfQmp+uSjbsgS3YeLJF_Ozp4ZjoaVOF2oWJQgLtw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: ps8640: Skip redundant bridge enable
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 14, 2023 at 12:01=E2=80=AFPM Pin-yen Lin <treapking@chromium.or=
g> wrote:
>
> Skip the drm_bridge_chain_pre_enable call when the bridge is already
> pre_enabled. This make pre_enable and post_disable (thus
> pm_runtime_get/put) symmetric.
>
> Fixes: 46f206304db0 ("drm/bridge: ps8640: Rework power state handling")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bri=
dge/parade-ps8640.c
> index 4b361d7d5e44..08de501c436e 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -557,7 +557,8 @@ static struct edid *ps8640_bridge_get_edid(struct drm=
_bridge *bridge,
>          * EDID, for this chip, we need to do a full poweron, otherwise i=
t will
>          * fail.
>          */
> -       drm_atomic_bridge_chain_pre_enable(bridge, connector->state->stat=
e);
> +       if (poweroff)
> +               drm_atomic_bridge_chain_pre_enable(bridge, connector->sta=
te->state);
>
>         edid =3D drm_get_edid(connector,
>                             ps_bridge->page[PAGE0_DP_CNTL]->adapter);
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
