Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C27081DEDA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Dec 2023 08:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3DF10E0D7;
	Mon, 25 Dec 2023 07:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B71510E02E;
 Mon, 25 Dec 2023 07:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=fuas5bPzOn9MZEW/fGo0qm2zTQtEOJAGCSSJzEQDXqU=; b=YAAmsBdVJB16MYQ9rG2ieV8wE6
 OdNhR8sSgZDbMgBwuNiDmodRQGSvWI72hbz5krTOtOe9hBQ8ZTqHB70h/t4/AnRlMnM+N/bC17TCZ
 W3ZteqWJC7dA4gB+cF4TR8jfMRf1tzrBtW4iMXMaguUkV9jXHSyrmmcZsdNcDLElQ2miTkVi+bJB+
 ABCUyIxD8tUWQGY91mmOQZi4lncYQqqVJ877Vx5Mn6+2akIUSsSiJoW49C7b01ZOANWyDsZnC9MwD
 alpfmRVc+zmfqvAd08OXJOsqIRcl/GzvAXdcKdcFg0XgtF8xvvvcguIGUaZFS9BuZMpb8sgAysn4W
 E+/NXKjA==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rHfZt-00AM72-13; Mon, 25 Dec 2023 07:40:45 +0000
Message-ID: <009fcdc4-b10a-4ab9-b368-7cea75bb74e2@infradead.org>
Date: Sun, 24 Dec 2023 23:40:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] drm/nouveau: uapi: fix kerneldoc warnings
Content-Language: en-US
To: Vegard Nossum <vegard.nossum@oracle.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>
References: <20231225065145.3060754-1-vegard.nossum@oracle.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231225065145.3060754-1-vegard.nossum@oracle.com>
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
Cc: nouveau@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/24/23 22:51, Vegard Nossum wrote:
> As of commit b77fdd6a48e6 ("scripts/kernel-doc: restore warning for
> Excess struct/union"), we see the following warnings when running 'make
> htmldocs':
> 
>   ./include/uapi/drm/nouveau_drm.h:292: warning: Excess struct member 'DRM_NOUVEAU_VM_BIND_OP_MAP' description in 'drm_nouveau_vm_bind_op'
>   ./include/uapi/drm/nouveau_drm.h:292: warning: Excess struct member 'DRM_NOUVEAU_VM_BIND_OP_UNMAP' description in 'drm_nouveau_vm_bind_op'
>   ./include/uapi/drm/nouveau_drm.h:292: warning: Excess struct member 'DRM_NOUVEAU_VM_BIND_SPARSE' description in 'drm_nouveau_vm_bind_op'
>   ./include/uapi/drm/nouveau_drm.h:336: warning: Excess struct member 'DRM_NOUVEAU_VM_BIND_RUN_ASYNC' description in 'drm_nouveau_vm_bind'
> 
> The problem is that these values are #define constants, but had kerneldoc
> comments attached to them as if they were actual struct members.
> 
> There are a number of ways we could fix this, but I chose to draw
> inspiration from include/uapi/drm/i915_drm.h, which pulls them into the
> corresponding kerneldoc comment for the struct member that they are
> intended to be used with.
> 
> To keep the diff readable, there are a number of things I _didn't_ do in
> this patch, but which we should also consider:
> 
> - This is pretty good documentation, but it ends up in gpu/driver-uapi,
>   which is part of subsystem-apis/ when it really ought to display under
>   userspace-api/ (the "Linux kernel user-space API guide" book of the
>   documentation).
> 
> - More generally, we might want a warning if include/uapi/ files are
>   kerneldoc'd outside userspace-api/.
> 
> - I'd consider it cleaner if the #defines appeared between the kerneldoc
>   for the member and the member itself (which is something other DRM-
>   related UAPI docs do).
> 
> - The %IDENTIFIER kerneldoc syntax is intended for "constants", and is
>   more appropriate in this context than ``IDENTIFIER`` or &IDENTIFIER.
>   The DRM docs aren't very consistent on this.
> 
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>


This all looks good to me. Thanks for your help.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

I do see one thing that I don't like in the generated html output.
It's not a problem with this patch.
The #defines for DRM_NOUVEAU_VM_BIND_OP_MAP etc. have a ';' at the
end of each line:

struct drm_nouveau_vm_bind_op {
    __u32 op;
#define DRM_NOUVEAU_VM_BIND_OP_MAP 0x0;
#define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x1;
    __u32 flags;
#define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8);
    __u32 handle;
    __u32 pad;
    __u64 addr;
    __u64 bo_offset;
    __u64 range;
};

so something else to look into one of these days....


> ---
>  include/uapi/drm/nouveau_drm.h | 56 ++++++++++++++++------------------
>  1 file changed, 27 insertions(+), 29 deletions(-)
> 
> diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
> index 0bade1592f34..c95ef8a4d94a 100644


-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html
