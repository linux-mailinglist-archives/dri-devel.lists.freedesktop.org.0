Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4900CB18A53
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 03:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFD810E900;
	Sat,  2 Aug 2025 01:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="mSlTahLB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD61D10E32E
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 01:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1754099763; x=1754358963;
 bh=hLnvhtoUQzWlJ6JUEK5C0dul/2jRS8IkWfqBZ/yrJdQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=mSlTahLB/eXfDMo94AUNKmyrUyJuj99jUh1oKBDiseHgV5luCgiav4aI9K8G0HBI6
 2VTYCnCxhbwVXrO9AKoC67OGBCjbT+/zvXMhRjDehfyOfa49iIYDic7/x3EcNxCCy7
 ENxqpRNTBm3/FjbB29SFzfSH9/YJOkoByYyxtdikVIQYP1KPkI3xDk0cCAoWFWdG5b
 44Wq0u1OAlprF99R/ymgJmWDnScNfNgvkP6CIKKvgDpY7NnJV6hrTavHNKC2oKSF42
 GTzIhLxYssOCq69jJwq0xpj2OW75Vq1JaIIVI1Vr/u9f73a2V314LydRN9LyF0tbji
 7Pk0MdMEqt1Fg==
Date: Sat, 02 Aug 2025 01:55:55 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: xaver.hugl@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, arthurgrillo@riseup.net,
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH V10 40/46] drm/colorop: Define LUT_1D interpolation
Message-ID: <u6jeWkMGEK4azl2nj_tqzX19ev7_J5wxY80sKlAalWOXesDjDhDwuPwQz5ttsqlAiSlhVwnQpyWt80cdNtUfINqaxjtSkGA4h10Qj16nl3g=@emersion.fr>
In-Reply-To: <3f3f50e5-3a60-4d7e-855b-773c868ca14b@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-41-alex.hung@amd.com>
 <xn27XZjdRP83I8eaTGnDdLyvppJUppZ_GVsnDJQ1wK3UINAwh4FEutAlh02CtvZoPbB4D7zhof9rGj1DsxHpccpGK7ID-S-DjGi5VRhAD8I=@emersion.fr>
 <3f3f50e5-3a60-4d7e-855b-773c868ca14b@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 3be9014e5057382c813c32a1e75ab30d7c56eefd
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

On Saturday, August 2nd, 2025 at 03:49, Alex Hung <alex.hung@amd.com> wrote=
:

> It may be better to change it now if we know it needs changing in the
> future.

It would become mutable only for hardware that supports switching the
interpolation. It would remain immutable otherwise.

Immutable is an indication that user-space can't change it.
