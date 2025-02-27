Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E101A487E4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 19:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F9B10E287;
	Thu, 27 Feb 2025 18:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RlVtBGsM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBAD10E287;
 Thu, 27 Feb 2025 18:35:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3239D61F3D;
 Thu, 27 Feb 2025 18:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A601CC4CEDD;
 Thu, 27 Feb 2025 18:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740681302;
 bh=sAJRYRGK3w6GvTTl2sxildoAonH5/GMP+Mj1aAQ7Qxk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RlVtBGsMBB/u/6D/4mht5TGcJe6DjuDbk2Y2awU55lvWixJhiQvJoCGnKLXHJtx75
 bszfBmK46QhtO+XDJSPZDkozLs7fi2vkBJ2ifqiwLIPAJdxPHsn2UXNtuukW+y+s1t
 zUXTukrqujHnxCckpntplYeGLNgA2miXObzQ9fgqoNIW4oGD7NgxGuA6180fGX81ws
 C2Wf+LjxxgW0NhySzpXdDYE9IQXL0rZilbXslOyyMB55qBBWmDOBZQuJqyF3qQEQzj
 Aw53Ir13xzBODZuN+R52G3kwjlaHn+ANN0VKJnHSfpQgYo3ea2osYPuL7Dzifcw5wP
 GXrzlfsYYUHnw==
Message-ID: <df8b8d59-470f-43e6-a8c2-cc40a4ebe5d6@kernel.org>
Date: Thu, 27 Feb 2025 19:34:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/nouveau: Avoid multiple
 -Wflex-array-member-not-at-end warnings
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <Z6xjZhHxRp4Bu_SX@kspp>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <Z6xjZhHxRp4Bu_SX@kspp>
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

On 2/12/25 10:01 AM, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> So, in order to avoid ending up with flexible-array members in the
> middle of other structs, we use the `struct_group_tagged()` helper
> to separate the flexible arrays from the rest of the members in the
> flexible structures. We then use the newly created tagged `struct
> nvif_ioctl_v0_hdr` and `struct nvif_ioctl_mthd_v0_hdr` to replace the
> type of the objects causing trouble in multiple structures.
> 
> We also want to ensure that when new members need to be added to the
> flexible structures, they are always included within the newly created
> tagged structs. For this, we use `static_assert()`. This ensures that the
> memory layout for both the flexible structure and the new tagged struct
> is the same after any changes.
> 
> So, with these changes, fix the following warnings:
> drivers/gpu/drm/nouveau/nvif/object.c:60:38: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/gpu/drm/nouveau/nvif/object.c:233:38: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/gpu/drm/nouveau/nvif/object.c:214:38: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/gpu/drm/nouveau/nvif/object.c:152:38: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/gpu/drm/nouveau/nvif/object.c:138:38: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/gpu/drm/nouveau/nvif/object.c:104:38: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/gpu/drm/nouveau/nouveau_svm.c:83:35: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/gpu/drm/nouveau/nouveau_svm.c:82:30: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied to drm-misc-next, thanks!
