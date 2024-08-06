Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB2E948F82
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 14:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B76110E351;
	Tue,  6 Aug 2024 12:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="p/23/WLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAA410E0C6
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 12:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KCWEXzw25QWBddzZdVgFf+L5OUrDak0ib+hkLIwF4cA=; b=p/23/WLhgZC1hBhzikbiHO5FWK
 /a28ACiavYmT4k0MQehzVtcMTyB7VxitQ/v91EwiuUAGrJhqjulOxKP43Ppks4kr6e6ptv+3BE4TL
 XZa+fnT0zzwEQjDtH+h3ryQB8Pux97P7pyOx95oaMUVtWSaAfZ4rOycdzEBd9SOI+DslNZ3Ol4UuV
 HNMwRm20Y118QYj0Gm3C/aZ/bIQLlxrtSG+TKSwDjwxMGMRsxR7YosKDrn0Qy9Vmjzj1jlrBfV7dH
 K+v9ACcBJFodBorlM8Qd7nNyZvnvIcr4QACVkEkdKLMJ6m5MyrVJK54MXulXfHJZ6qqWbKFYyGZgC
 VVVXHoXw==;
Received: from [179.118.186.198] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sbJfg-008ags-FL; Tue, 06 Aug 2024 14:52:12 +0200
Message-ID: <e1b78bfc-ffc8-47c4-8db7-228e277659de@igalia.com>
Date: Tue, 6 Aug 2024 09:52:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/atomic: allow no-op FB_ID updates for async flips
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Cc: Xaver Hugl <xaver.hugl@kde.org>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <michel.daenzer@mailbox.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
References: <20240731191014.878320-1-contact@emersion.fr>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20240731191014.878320-1-contact@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Em 31/07/2024 16:10, Simon Ser escreveu:
> User-space is allowed to submit any property in an async flip as
> long as the value doesn't change. However we missed one case:
> as things stand, the kernel rejects no-op FB_ID changes on
> non-primary planes. Fix this by changing the conditional and
> skipping drm_atomic_check_prop_changes() only for FB_ID on the
> primary plane (instead of skipping for FB_ID on any plane).
> 
> Fixes: 0e26cc72c71c ("drm: Refuse to async flip with atomic prop changes")
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: André Almeida <andrealmeid@igalia.com>
> Tested-by: Xaver Hugl <xaver.hugl@kde.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Michel Dänzer <michel.daenzer@mailbox.org>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
> 
> André, can you confirm that the R-b still holds?
> 

Yes, it still holds
