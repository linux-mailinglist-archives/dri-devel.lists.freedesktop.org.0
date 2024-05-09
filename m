Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E438C0B4B
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 08:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A8010E25A;
	Thu,  9 May 2024 06:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mWafinwc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B13710E25A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 06:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QVCNSdPH+l0Gfn/MBLqaDM5TTH0X63HBu2kGlikKlzQ=; b=mWafinwcxUGccSm/essvmuKsXh
 lx8BQVyEDZEnb80nYl9zhKDF9vyA8ymfOAib1zNYgLQwGqn/i79P30WMCBh6W0vUOEZvQsvbkIIqi
 Z9zll7GJbfLL/ieVZuL8j70eg3DYwVLiWdHqeDH4EiiwtMjoXp06tFskqKltl6NfqDzRUUbZfTqAj
 RpuTS68XBhnZfuHyySKqF3PAJndGG9+24Vh4OdS5UELSdKDTAYpszly2XzEoETQJWPJVUrmlpENk9
 x1GaojIzpDDHL0sFiwUrL0BrxkF3d1tKOBxQDQEOSZxGYUubC8wJfj5CoGMVLCHNVByQoir9+05Lv
 CZ3OPiLw==;
Received: from [192.168.12.229] by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s4wzz-003Zmm-Qc; Thu, 09 May 2024 08:11:23 +0200
Message-ID: <a553a0934365a2498a0d2c555e88aaae10954ebf.camel@igalia.com>
Subject: Re: [PATCH 5/6] drm/v3d: Use V3D_MAX_COUNTERS instead of
 V3D_PERFCNT_NUM
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 "Juan A ." =?ISO-8859-1?Q?Su=E1rez?= <jasuarez@igalia.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Thu, 09 May 2024 08:11:23 +0200
In-Reply-To: <20240508143306.2435304-7-mcanal@igalia.com>
References: <20240508143306.2435304-2-mcanal@igalia.com>
 <20240508143306.2435304-7-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
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

El mi=C3=A9, 08-05-2024 a las 11:30 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> V3D_PERFCNT_NUM represents the maximum number of performance counters
> for V3D 4.2, but not for V3D 7.1. This means that, if we use
> V3D_PERFCNT_NUM, we might go out-of-bounds on V3D 7.1.
>=20
> Therefore, use the number of performance counters on V3D 7.1 as the
> maximum number of counters. This will allow us to create arrays on
> the
> stack with reasonable size. Note that userspace must use the value
> provided by DRM_V3D_PARAM_V3D_MAX_PERF_COUNTERS.

This should be DRM_V3D_PARAM_MAX_PERF_COUNTERS.


Iago
