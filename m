Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C5DD33B2C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 18:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B375110E905;
	Fri, 16 Jan 2026 17:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jHgC1Ias";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3AB10E8FE;
 Fri, 16 Jan 2026 17:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vXXjbimbjw21FFu0uvxax8/N41DjCPD+nxQ7L8DVxyY=; b=jHgC1IasfBAlMOp/lcsRtfKlL5
 rt2Y2B7Tys2WZuPJFgM/+PvGMvm/K0zwlQO6KqHNOGvcsM6vBkgdxo7GhijrLXME8L6u+DrvEyxUb
 ivkFMwjq99nqv8EeJBrLID0ILWRxcy8SwfrB8XOM3AkXjNilacbXx9FZY1foY88OWKCcKaFOrJJkc
 2TpjEHPD4qb2ImFeHJz3oc+f82CuLwVYAlBZeASSNIr+ZYNBLr4GiIMQtI6PplFEIocDpObUXOlul
 fuYWO65AlrboI7i9xr3h5ZO/GHrGm7OTzq458zizv8+XbXLUws1VBNl2zuB89sNDJ+M56Zb9HtnRJ
 PGHse52A==;
Received: from [189.89.57.42] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vgnJQ-006Fc5-BG; Fri, 16 Jan 2026 18:08:40 +0100
Message-ID: <4693c155-3903-49c7-8892-0bc9b751ee4c@igalia.com>
Date: Fri, 16 Jan 2026 14:08:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] Fixes on CM3 helper for plane shaper LUT
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20251208234741.293037-1-mwen@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20251208234741.293037-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 08/12/2025 20:44, Melissa Wen wrote:
> There are some unexpected banding and shimmer effects when using
> steamOS/gamescope color pipeline for HDR on DCN32 or newer families.
> Those problems are not present in Steam Deck (DCN301). It happens on
> DCN32 because plane shaper LUT uses DCN30 CM3 helper to translate curves
> instead of DCN10 CM helper. This series identifies the necessary changes
> on CM3 helper to reduce differences on color transformation made by
> those two helpers.
>
> Patch 1 aims to solve the shimmer/colorful points that looks like a
> wrong map of black values on red/green/blue colors. Patch 2 extends the
> delta clamping fix made in commit 27fc10d1095f ("drm/amd/display: Fix
> the delta clamping for shaper LUT") to solve some banding effects.

Hey,

Any news about these two color issues and respective fixes?

Melissa

>
> Banding is not fully solved by any helper and needs further
> investigation.
>
> One easy way to check the current and expected behavior is moving the
> cursor (doing composition) to get the expected result from GFX. When the
> cursor disappears, those color transformations are back to be done by
> the display hw.
>
> Lemme know your thoughts!
>
> Melissa
>
> Melissa Wen (2):
>    drm/amd/display: fix wrong color value mapping on DCN32 shaper LUT
>    drm/amd/display: extend delta clamping logic to CM3 LUT helper
>
>   .../amd/display/dc/dcn30/dcn30_cm_common.c    | 32 +++++++++++++++----
>   .../display/dc/dwb/dcn30/dcn30_cm_common.h    |  2 +-
>   .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c   |  9 +++---
>   .../amd/display/dc/hwss/dcn32/dcn32_hwseq.c   | 17 ++++++----
>   .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 16 ++++++----
>   5 files changed, 50 insertions(+), 26 deletions(-)
>

