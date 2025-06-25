Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29885AE8CF6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B72110E7BA;
	Wed, 25 Jun 2025 18:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="EMlpcbeT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CFC10E7BA
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:49:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1750877396; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JiSk+zhM7F5ibFdpsLxBXZOw5FFL0tY//URjMrwoUWAq7glbxS7xfKaWw/P7FzPngt1ttrP/xODIuZHGhynCWNh6/uo/Nqnr7+Y+XqhF8eqaEPXQHuKgSqaF1z+oII5asBw/PEfqmIQy+MFikTkl8XrgM+o9BXtq3E0uWJN0jXE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1750877396;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=oTp0vKqj7VpMXAfHxRYqXVkfyzmgLQ4uxRgPuEKZ2ik=; 
 b=lagqQquSjRWq+Baquzdtczl4KH08gSFGXjYKK281lnFU2//2NPEHgFY5Yqq+NfJaA2lEBw+jk+hu+7kptZ7lG9oimLsGWNX59hLg8yL9sR+xCwkdRzTvsxUu80g0R8qSt5DftD7OuqxKs/gTz2YFm0kABSMTUWstbCwFSBXgApY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750877396; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=oTp0vKqj7VpMXAfHxRYqXVkfyzmgLQ4uxRgPuEKZ2ik=;
 b=EMlpcbeT0igJJzPZrOc217CB++Rox3jgRaBjALv6UKPus8MBz09Z8RmKf+ceOwzC
 yokK2o2kkhT2yu2M5ziR5UIB01/5dqHDj5+IrKwFW3s8INUVJMYQj7218knl1s2uqLh
 3GGryVtWH9dd2Y4mmfsFLuwnEbFw2OfcLYpeuYAo=
Received: by mx.zohomail.com with SMTPS id 17508773949391017.7029644182626;
 Wed, 25 Jun 2025 11:49:54 -0700 (PDT)
Message-ID: <f3135961b2fe2c2b5cb3c29d76eb3d818d7a766a.camel@collabora.com>
Subject: Re: [PATCH v4 1/1] drm/mediatek: Adjust bandwidth limit for DP
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com,  angelogioacchino.delregno@collabora.com,
 mac.shen@mediatek.com,  peng.liu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 25 Jun 2025 14:49:53 -0400
In-Reply-To: <20250625095446.31726-1-liankun.yang@mediatek.com>
References: <20250625095446.31726-1-liankun.yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-ZohoMailClient: External
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

On Wed, 2025-06-25 at 17:54 +0800, Liankun Yang wrote:
> By adjusting the order of link training and relocating it to HPD,
> link training can identify the usability of each lane in the current
> link.
>=20
> It also supports handling signal instability and weakness due to
> environmental issues, enabling the acquisition of a stable bandwidth
> for the current link. Subsequently, DP work can proceed based on
> the actual maximum bandwidth.
>=20
> It should training in the hpd event thread.
> Check the mode with lane count and link rate of training.
>=20
> If we're eDP and capabilities were already parsed we can skip
> reading again because eDP panels aren't hotpluggable hence the
> caps and training information won't ever change in a boot life
>=20
> Therefore, bridge typec judgment is required for edp training in
> atomic_enable function.
>=20
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
> ---
> Change in V4:
> - Tested the internal eDP display on MT8195 Tomato and it is fine.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250318140236.=
13650-2-liankun.yang@mediatek.com/

Hi,

I tested this patch on MT8195 Tomato, on top of next-20250625. Indeed
the internal eDP display is unaffected by this commit: it still works
fine.

The external displays though not so much. I tested 3 different
displays, using 2 different USBC-to-HDMI adapters, and in all cases the
behavior was the same:
- Before the patch, the image on the display is completely corrupted
and unusable. The only discernible element on the display is the mouse
cursor, which shows perfectly fine. Occasionally no image will be shown
at all, but most of the times, the behavior is as described.
- After the patch, nothing ever shows at all on the display. It is
always black.

So while the external display support on Tomato is basically broken as
of the latest next, this patch seems to regress the support even
further.

--=20
Thanks,

N=C3=ADcolas
