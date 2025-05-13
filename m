Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 213A9AB48AF
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 03:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0346A10E4BF;
	Tue, 13 May 2025 01:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="r4wTNkeG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BAA410E4BF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 01:11:48 +0000 (UTC)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20250513011146epoutp0423b550dbb9f1af30f0157d8ed9753880~_8QRag7Fw0375803758epoutp04M
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 01:11:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20250513011146epoutp0423b550dbb9f1af30f0157d8ed9753880~_8QRag7Fw0375803758epoutp04M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1747098706;
 bh=11sC5CL7ALkDxBRJnk00zA9FuQFKn2BigmhwdJiY6NQ=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=r4wTNkeGRIWgHXyaV8eJyYeARVG6964apqUZq0yZhcPLmNmyJgSrb0PP6LD7Bi3/j
 KzcmyCd9fMIKWSySB2zV783lBx0z4aqa/znLYsGqLL02kAtB6IsMh6OTKKTu2UG4Si
 xkS2HqO0cwQhbl7Plia9Hn3hxhXmcKzvR4mx7xnE=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20250513011145epcas5p4c7cd0f22a7a1f8abca2941c8d5906dc0~_8QQ8r-S90223702237epcas5p48;
 Tue, 13 May 2025 01:11:45 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4ZxJN16fWQz6B9mB; Tue, 13 May
 2025 01:11:45 +0000 (GMT)
Mime-Version: 1.0
Subject: [PATCH v2] drm/edid: fixed the bug that hdr metadata was not cleared
From: Feijuan Li <feijuan.li@samsung.com>
To: "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: Hongfei Tang <hongfei.tang@samsung.com>, Minggui Yan
 <minggui.yan@samsung.com>, Qilin Wang <qilin.wang@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20250513011145epcms5p84bf94d5c03933fd61f4abf1fadab5016@epcms5p8>
Date: Tue, 13 May 2025 09:11:45 +0800
X-CMS-MailID: 20250513011145epcms5p84bf94d5c03933fd61f4abf1fadab5016
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20250416093607epcms5p344bcffd7430fe5e30ef9b73db73f7388
References: <CGME20250416093607epcms5p344bcffd7430fe5e30ef9b73db73f7388@epcms5p8>
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
Reply-To: feijuan.li@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear maintainer:

I have changed the patch as your suggestion.
v1->v2:make a new function for hdr info reset.


From: =22feijuan.li=22 <feijuan.li=40samsung.com>
Date: Fri, 18 Apr 2025 14:56:49 +0000
Subject: =5BPATCH v2=5D drm/edid: fixed the bug that hdr metadata was not r=
eset

When DP connected to a device with HDR capability,
the hdr structure was filled.Then connected to another
sink device without hdr capability, but the hdr info
still exist.

Signed-off-by: feijuan.li <feijuan.li=40samsung.com>
---
=C2=A0drivers/gpu/drm/drm_edid.c=206=20++++++=0D=0A=C2=A01=20file=20changed=
,=206=20insertions(+)=0D=0A=0D=0Adiff=20--git=20a/drivers/gpu/drm/drm_edid.=
c=20b/drivers/gpu/drm/drm_edid.c=0D=0Aindex=2013bc4c290b17..cd0e4148f6b0=20=
100644=0D=0A---=20a/drivers/gpu/drm/drm_edid.c=0D=0A+++=20b/drivers/gpu/drm=
/drm_edid.c=0D=0A=40=40=20-6576,6=20+6576,11=20=40=40=20static=20void=20drm=
_update_mso(struct=20drm_connector=20*connector,=0D=0A=C2=A0=20=C2=A0=20=C2=
=A0=20=C2=A0=20=C2=A0displayid_iter_end(&iter);=0D=0A=C2=A0=7D=0D=0A=C2=A0=
=0D=0A+static=20void=20drm_reset_hdr_sink_metadata(struct=20drm_connector=
=20*connector)=0D=0A+=7B=0D=0A+=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20memset(&=
connector->hdr_sink_metadata,=200,=20sizeof(connector->hdr_sink_metadata));=
=0D=0A+=7D=0D=0A+=0D=0A=C2=A0/*=20A=20connector=20has=20no=20EDID=20informa=
tion,=20so=20we've=20got=20no=20EDID=20to=20compute=20quirks=20from.=20Rese=
t=0D=0A=C2=A0=20*=20all=20of=20the=20values=20which=20would=20have=20been=
=20set=20from=20EDID=0D=0A=C2=A0=20*/=0D=0A=40=40=20-6651,6=20+6656,7=20=40=
=40=20static=20void=20update_display_info(struct=20drm_connector=20*connect=
or,=0D=0A=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0struct=20drm_display_inf=
o=20*info=20=3D=20&connector->display_info;=0D=0A=C2=A0=20=C2=A0=20=C2=A0=
=20=C2=A0=20=C2=A0const=20struct=20edid=20*edid;=0D=0A=C2=A0=0D=0A+=C2=A0=
=20=C2=A0=20=C2=A0=20=C2=A0=20drm_reset_hdr_sink_metadata(connector);=0D=0A=
=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0drm_reset_display_info(connector)=
;=0D=0A=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0=20=C2=A0clear_eld(connector);=0D=
=0A=C2=A0=0D=0A--=C2=A0=0D=0A2.25.1=0D=0A=0D=0A
