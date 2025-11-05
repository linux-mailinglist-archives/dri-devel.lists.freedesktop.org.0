Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC04C3842B
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 23:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A8210E7BC;
	Wed,  5 Nov 2025 22:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TMBqAPzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AFD10E7BA;
 Wed,  5 Nov 2025 22:51:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4F8074349C;
 Wed,  5 Nov 2025 22:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0737C4CEF5;
 Wed,  5 Nov 2025 22:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762383074;
 bh=pVqiMffJ+/+3iCw/xeioPbEjfyBueyeofbkgdZ2WABQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TMBqAPzHGUcab+wR+R9Vg1polDI6xrnGmUGYgjNYqeA1W+/VoDgpDiY+mEkhK7PHq
 pGF0csZ6Izt3JUt7Y1WTE5jfVZObf9paLmHWKV3d5Z4h8H+cj6Gkd87mXqI6yTkLU1
 4PUvVm9Px2kcnojCv+jEuPUWMGtezcd6b2GbLByNpn8aG0eYlwoXXl8GIdwslBQAiR
 38rHxXrJpjkVFM/A/0DtJO8okerR9hvLWQyWI5roB+ZZMoLNiKbnqOXOcBBbyTPfHo
 6FoQJs5MkJ8AP037qB1I5ZODQulbWDI/CFJhl+bxOukaWDrjdVCBvtX/57OieMIJWj
 LGAOnCMpKYR0g==
Message-ID: <de2900a9-79cf-49b7-8fa8-f9321f9a21e9@kernel.org>
Date: Wed, 5 Nov 2025 23:51:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] drm/nouveau/uvmm: Allow larger pages
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, Lyude Paul
 <lyude@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org
References: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
 <20251031104924.10631-3-mohamedahmedegypt2001@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251031104924.10631-3-mohamedahmedegypt2001@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 10/31/25 11:49 AM, Mohamed Ahmed wrote:
> +	/* If we get here then nothing can reconcile the requirements. This should never
> +	 * happen.
> +	 */
> +	WARN_ON(1);

This is called from a userspace path, please use dev_warn_once() instead and
return an error code.

