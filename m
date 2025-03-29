Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E874A756FC
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 16:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C35410E26D;
	Sat, 29 Mar 2025 15:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="Sn/Bm1ny";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EC010E26D
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 15:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1743262886; x=1743522086;
 bh=iX+NjG6//5Pav68yRmBKWk7QX1j36zmLPaTwaSHlNW0=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=Sn/Bm1nyUlcTZSu/uH6ZkBgjU7niM8MjD7Yh3thP4rAQYFncDTxEJaKpuae1Ya01s
 FVitevCguYiihSHrcwuWHp6mfrIFa8B0T0qOTg60P5S5amhRtqH+ZMhdrhOZ3p4Pnp
 518wTE/nwOb+olFts9pPrhpUJ3K78lM7VmQjzCM7riccDSCS3rb/xj/dZ5TPovDTbz
 djA6XUV4Z2HEEvfIHxMZ628asXLscpfKCATLBrYUYXv9Tgncl9IFpK0gdIQlRRVwkU
 cWHQRZTss4xWibkSe2V6ooz2HEdjfMqKBk78Z79ke0P2g7FmYKd4dF33AYiEGtxrZS
 f/P3Cl5NdpslQ==
Date: Sat, 29 Mar 2025 15:41:22 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 39/43] drm/colorop: allow non-bypass colorops
Message-ID: <X3qd7MSoVi1Bk64V4ScEVcuiy1xtthg7KdTstEs6DfJugsjsBSm7PXwacVpGsE0iMnAjcnXiy_O2PVX6yqOBOdty2AtrGye65uqYdTDN7dA=@emersion.fr>
In-Reply-To: <20250326234748.2982010-40-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-40-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 047550b4818e6b5308e6e8d65e445a22621107a9
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

I'm personally not a fan of such boolean function arguments, especially
when caller and callee are far apart. From the caller side, the meaning
of the boolean argument is not immediately clear.

I would prefer a "flags" argument, which can take a e.g.
DRM_COLOROP_FLAG_ALLOW_BYPASS value.

But I'm not feeling strongly about this.
