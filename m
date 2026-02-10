Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLM3FYIAi2nJPAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:55:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7E4119344
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C8510E52D;
	Tue, 10 Feb 2026 09:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ii10Q/25";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031B710E53B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 09:55:09 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-386b4c28ad6so33947131fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 01:55:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770717308; cv=none;
 d=google.com; s=arc-20240605;
 b=YrAp9mhlkkP8cY3+GAyU0cHOM/WzmrE9thKytwHz746vKl9RLYG1d07iKeBUN7I41r
 RU2JSgfTsBn161Pye6NcK51oApMt717LtC755lwKM/k6/iqNkCnH79hf/WoEiKBg/fFB
 OEPKrSCb1Z7ReTtJVdQXHFxHzcZcnAerfsLPNtP47zI0V4uQgbbfiDbWhNDcMLQp3pfq
 DltfEYRNcbqyBEKB9cdIq0/iyM67yhmoFLM4THMJ3XNVwdWQcSH0bIGuX5CgTBIWCZmM
 ZhPHy8LqLOZDlziyts4L2zyh/BAJGhhWlquxskVb6E3nsSb2y1YJxqU+GyMWqZ+LvQv2
 JklQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=t12lxM+brFyq0KY7Nz/qV0/1FHoQ9NnONI3XMskNk5E=;
 fh=d2PcLyg20MwiAsvT3n0LQ1J1hWAEJ6REcPj5OfIqkkQ=;
 b=RGcEKf9dshXV6idIk/6HKCXfQ4h7eRvjek5GzBAxLSJRyPzxN4LNktM75CmYCyTOac
 bfFxa3IWzfmgHsmv7oRYTLYHio1dDd6R9M90gJMxpCoCD7/3zGETqCOtn7mQtoM4qUI0
 2TNzgD7o53NPrEtd4soAL5WuzG+K/6hl4Gxjs+1f6BaHVhz2PMY3Qbfn3vk+ooKu4snO
 AYGN4Ca6IvOukZLwHizdEZQ8VK1ozaTGn1OiNCRETLzFvRmhspvIM3CUZitvTXNw6hIj
 x8zJZ5Q2mJmrBo5IRPOPxI+xOLrVPDEw1luFchG1wbcMJc3msxd6qkJak2lQZ0IaKUOy
 XFFw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1770717308; x=1771322108;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t12lxM+brFyq0KY7Nz/qV0/1FHoQ9NnONI3XMskNk5E=;
 b=Ii10Q/25d03MrvakUAEcMVtpkVCQElbjLt3CHuce0mfcVT4pZqP9vpLV3Hyt5jtNLr
 UKxf4+f/JfIOmxJ+pMgFPjQBfhE920nROoSsm9Pfsjp1rKwvmyrbMdmMcb/YTrqWEmLr
 XdiA8krabnJQoHT3im5K6kNZ2cfOEwf/11+NQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770717308; x=1771322108;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t12lxM+brFyq0KY7Nz/qV0/1FHoQ9NnONI3XMskNk5E=;
 b=kK1Vrghq7aboxQtSXL9DAsonoQ2U8jvsKYA/0uLj4oMPCkyRZi7skGsfBbrh89bSDu
 8HrZvrv7XFChyYtqwZllM7nL0ikayOy2atJn7W+8dO8eIz7z4L7KiyxbLTUSzQ1DgPcE
 1t609/HMl7jfPl2fjPUeV23hPaUInlAz7lLjZCQWnnoqESRWm9Q3WyOK0uIkz7Z3N7LF
 EA6zgOKJj3k4CT4wkUKq10lwfTJbMP1V80GsJkpCxEj6WD0NuDXwbBhh9v/OT39coGER
 MDf1NiIP9Nueo/27CBBTWt2r8J0CaOOWD/H1Ecd23D35N5bq6jzpkWsTbgo+FCPUef49
 c5eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfO86OJ6MCqUtw/pnCiWmVgv2oL21GSXQl9XCkL3GcDqMFj9yc0j32fChLHc5O9FqG/zvp4vc8HG0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJUaWhP0ybPGP/JU+XAOTaow35IucnZ2ymhUna5cVuzTziYkFX
 OtB4uw2mipSHIN6J2m2WWXsyKk+WZjEsjzr+dDX4I/Czk5iB+20IAygEMJfHuLpRKmgUaQlgkgB
 87zVHIqiqsGK35hcl5ENInhy3ATBiZsPCaGtn8Tw/
X-Gm-Gg: AZuq6aIAkl9QIYdVcvTuMTLHQ+bmmdj49zMWI+aHPYZtlh87W6IvQahBUVCAwtckwlI
 EUj1sgYGkbndiNvRdH17f0lcfk7n37vTh/HAuaL6vhJEr2+TNZmwpzqYBb+UB+P9jfGyaV2Q6n4
 83q0eunjxGYwN2lGiHzYFUUUORF7CrttmGG7Cd5AwnWW242F4bCjUd+OrdT1EIzcIFOmf9na/5g
 TI/1DijZAOgUkRUGC2mdpVB/+Czsj7ygDxHFLuaRu3JVD17fLXdyXOaNBtZwGBMxCAZCM/8IMF0
 W44zGxkCTGoaUWQMgKNhM8XulRj6UIGOPXdqkA==
X-Received: by 2002:a05:6512:32c8:b0:59e:24e5:a3a5 with SMTP id
 2adb3069b0e04-59e55bd0c28mr479672e87.29.1770717308202; Tue, 10 Feb 2026
 01:55:08 -0800 (PST)
MIME-Version: 1.0
References: <20260210093333.5112-1-l.scorcia@gmail.com>
In-Reply-To: <20260210093333.5112-1-l.scorcia@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 10 Feb 2026 17:54:57 +0800
X-Gm-Features: AZwV_QhvCuo8DxUPuUh7S4r_8wwpmJqqu_YbBa1qxu1eyMYPq5mPl5vB5s7VIBQ
Message-ID: <CAGXv+5Ep+YGsqZqWB3HXES07sFw8YtoTEPDxkq1yHQPJpFDTUw@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/mediatek: Remove all conflicting aperture devices
 during probe
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:l.scorcia@gmail.com,m:linux-mediatek@lists.infradead.org,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:lscorcia@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wenst@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,pengutronix.de,gmail.com,ffwll.ch,collabora.com,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mediatek.com:email,chromium.org:dkim]
X-Rspamd-Queue-Id: AD7E4119344
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 5:34=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> If a device has a framebuffer available it might be already used as
> display by simple-framebuffer or simpledrm when mediatek-drm is probed.
> This is actually helpful when porting to a new device as
> framebuffers are simple to setup in device trees and fbcon can be
> used to monitor the kernel boot process.
>
> When drm-mediatek loads a new fb device is initialized, however
> fbcon remains attached to the initial framebuffer which is no longer
> connected to the actual display - the early fb is never removed.
>
> We can gracefully transition from framebuffer handling to drm-managed
> display by calling aperture_remove_all_conflicting_devices as we probe
> mediatek-drm. This takes care of unloading other fb devices/drivers
> and disconnects fbcon which then automatically reconnects to
> mediatekdrmfb as soon as it's available.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
> This patch has been tested on Xiaomi Mi Smart Clock, however
> I'd like to get some feedback from more knowledgeable people,
> especially about those points:
> 1. Is aperture support on mtk-drm desired at all?
> 2. mtk-drm does not know about the fb address therefore as far
>    as I can see we can't use the more specific function
>    aperture_remove_conflicting_devices. This means that all generic
>    aperture drivers will be unloaded. It might not be a real world issue
>    as I can't see why one might want to load mtk-drm while keeping
>    other aperture  device drivers active, but my experience is very limit=
ed.

This is pretty much what all other platform drivers do. So that's fine.

> Thanks!
>
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index a94c51a83261..17e45b93fe49 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -4,6 +4,7 @@
>   * Author: YT SHEN <yt.shen@mediatek.com>
>   */
>
> +#include <linux/aperture.h>
>  #include <linux/component.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -1116,6 +1117,11 @@ static int mtk_drm_probe(struct platform_device *p=
dev)
>         if (!private->all_drm_private)
>                 return -ENOMEM;
>
> +       /* Remove framebuffer owners, this will release fbcon if active *=
/
> +       ret =3D aperture_remove_all_conflicting_devices(DRIVER_NAME);
> +       if (ret < 0)
> +               dev_err(dev, "Failed to remove conflicting aperture devic=
es (%d)", ret);
> +

I believe this could be in mtk_drm_bind() just before drm_dev_register().
The idea is you want to kick out the existing framebuffer as late as
possible to reduce the time the screen is unresponsive.


ChenYu

>         /* Bringup ovl_adaptor */
>         if (mtk_drm_find_mmsys_comp(private, DDP_COMPONENT_DRM_OVL_ADAPTO=
R)) {
>                 ovl_adaptor =3D platform_device_register_data(dev, "media=
tek-disp-ovl-adaptor",
> --
> 2.43.0
>
>
