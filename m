Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB2292EC7C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 18:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF5410EAE0;
	Thu, 11 Jul 2024 16:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="N6ZPVA5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C4E10EAE1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 16:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=18iV27idHL6ogjyfEuVYDsrPE9cQqrBLoOIELW58sU8=; b=N6ZPVA5lwp0xSvPC9ZOk9LQs8F
 v/4CxNShTrvz6Xy6ZxRMiugwdN8pmjTQ2CWWNDD4uVg9ui5MgGyrTu30g+HJ7DwkDTZptXMgECSDY
 6nzvgbhAq0P0peoNbFMvt7+kv5UIWM1Bl0UYv5mPScpOZVEuxt1BCQCdUT/ZuLE8yZVmicE33LU7O
 bEiO3LSOsTsKaG6hptckBNfpLwhKponzcjBsNGldDl5GkT5BqoO78En/NGJUzPST+dXZ6C0DNiE3z
 m4HB1j4J6/ejFUeSEFHO6mPM4dhZ2si4ckOJgQwFhMMKE6GznRiJYaVfeXc9WnwqFXQi4Ly7FS3bD
 1fRoCa1A==;
Received: from [191.17.120.113] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sRwVh-00DmbK-CI; Thu, 11 Jul 2024 18:19:09 +0200
Message-ID: <18acaf1d-8a6a-448c-9ba5-bc5a6db2bc9f@igalia.com>
Date: Thu, 11 Jul 2024 13:19:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/atomic: allow no-op FB_ID updates for async flips
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20240629152204.666748-1-contact@emersion.fr>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20240629152204.666748-1-contact@emersion.fr>
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

Hi Simon, thanks for the fix!

Em 29/06/2024 12:22, Simon Ser escreveu:
> User-space is allowed to submit any property in an async flip as
> long as the value doesn't change. However we missed one case:
> as things stand, the kernel rejects no-op FB_ID changes on
> non-primary planes. Fix this by changing the conditional and
> skipping drm_atomic_check_prop_changes() only for FB_ID on the
> primary plane (instead of skipping for FB_ID on any plane).
> 
> Fixes: 0e26cc72c71c ("drm: Refuse to async flip with atomic prop changes")
> Signed-off-by: Simon Ser <contact@emersion.fr>

Reviewed-by: André Almeida <andrealmeid@igalia.com>
