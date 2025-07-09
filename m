Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6967AFE174
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 09:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EF510E754;
	Wed,  9 Jul 2025 07:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aSd8H5Ba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FC910E756
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 07:37:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 19AFC61483;
 Wed,  9 Jul 2025 07:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F402C4CEF5;
 Wed,  9 Jul 2025 07:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752046661;
 bh=sN1FBorFWsdlH0wPpgViuDr0g+ntVgJSYzyFcsEEdWg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aSd8H5Ba4DqABFHmO/4o5mG5OEjOjmou65ScvWFU00/kp+bs9PzE+rSUqcT3NVkU5
 K91fpryjaASoUJzAZkHXTsJdbritRRBpAhiIU+WgPskrQ1bbnZVQR4w3a3a9i4PEYj
 kun0Mo32XKNjOI2OxNXvcbWUdsUctUPcj+ecG2AHQAlnW3zM8tCHoIQQ4u+DExPYjc
 0nrhiAHhMNMR944lxXUbEP+8t53Jvl8W0fMlwz1Lh2jJZaY9xjW2wBAAeD+ocPcMD9
 iSgZcBoXq6GLqfNLlZgYKMKMVgbHYqzvZoyp7S6VcUMWPn/NxeX6oIcEQZjUI644UC
 YvQDxsvQRBSxQ==
Message-ID: <aade485e-0880-4c68-9b37-d8a27dc122e3@kernel.org>
Date: Wed, 9 Jul 2025 09:37:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gpuvm: Wrap drm_gpuvm_sm_map_exec_lock() expected
 usage in literal code block
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Raag Jadav <raag.jadav@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20250709024501.9105-1-bagasdotme@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250709024501.9105-1-bagasdotme@gmail.com>
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

On 7/9/25 4:45 AM, Bagas Sanjaya wrote:
> Stephen Rothwell reports multiple indentation warnings when merging
> drm-msm tree:
> 
> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2445: ERROR: Unexpected indentation. [docutils]
> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2447: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2451: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2452: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2456: ERROR: Unexpected indentation. [docutils]
> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2457: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2458: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2459: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> 
> Fix these by wrapping drm_gpuvm_sm_map_exec_lock() expected usage
> example in literal code block.
> 
> Fixes: 471920ce25d5 ("drm/gpuvm: Add locking helpers")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20250708192038.6b0fd31d@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

I assume this has to go through the MSM tree?

Acked-by: Danilo Krummrich <dakr@kernel.org>
