Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E4A02EBE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 18:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C77110E990;
	Mon,  6 Jan 2025 17:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="clnRL3D5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49A310E990
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 17:16:56 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YRgpD4yKvz9sZZ;
 Mon,  6 Jan 2025 18:16:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1736183812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fTcpyBQI1C5j0fXATsfLcNIbkB39RKfnsca4og3FM5Y=;
 b=clnRL3D5k9ewWQj1833x6rTPxvc4TOWroAFjSttmGnR+R6DohZ92lJTtVK9cRwBE0R4oaL
 KZCp3PLgstbzZf2XfVL1gpwbvUGkJdmKkHwLsSJmRplIiSBBhDN8nrp2DjJ25gAbMgW3wg
 4nyEN05qp0hHy4VAj4bRLeKqIpukTjJvW9GRjVbqK7ogWHaroUA4E70Av53IrHi1NceThC
 yngDUlOYcIkFOnFuSmCxdyptljorxmBF6kFQuDRNDZIUF0LkgkPJ42i4DtHE8T2FNeIJbr
 RiwcQH4qZgEafW8lbd3oKXDLfiLoyLajIVtPORjuLWT/sYDXeTSW0hQHirI2NA==
Message-ID: <1eaea60f-fda1-423c-a109-18481958d00d@mailbox.org>
Date: Mon, 6 Jan 2025 18:16:51 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 3/6] drm/syncobj: Do not allocate an array to store zeros
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20250102194418.70383-1-tursulin@igalia.com>
 <20250102194418.70383-4-tursulin@igalia.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20250102194418.70383-4-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9b12119c9aea0d12d24
X-MBO-RS-META: j5ft13x684nc999afyyot61ptaynyipe
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

On 2025-01-02 20:44, Tvrtko Ursulin wrote:
> 
> "vkgears -present-mailbox" average framerate:
> 
>   Before: 21410.1089
>   After:  21609.7225
> 
> With a disclaimer that measuring with vkgears feels a bit variable,
> nevertheless it did not look like noise.

That's ~1% difference. IME the frame rate can easily vary more than that during a single run.

The frame rate surely varies by more than 1 fps during each run, so comparing such large average values down to 4 digits after the decimal point doesn't seem very useful.

Doing multiple (at least 3 or more each) before & after runs and comparing the distribution of individual measured values using something like ministat might confirm it's essentially noise, or give more confidence it's not.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
