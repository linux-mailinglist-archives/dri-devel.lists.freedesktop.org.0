Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DE37FDBE3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 16:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61EC510E61E;
	Wed, 29 Nov 2023 15:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEB210E61E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 15:47:11 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1B8466602F24;
 Wed, 29 Nov 2023 15:47:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701272830;
 bh=9UgtxghB5ZsKV/j1SgrmWTsqD9lNpLOncvoxfSi/wv0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aUmILl2rTZ4ng0+NeRJ11u7hvQIAvX5CbKqyxTC/gDzr+OF8drVqd8JmJtlM0vLTB
 8mKREqaa9vvPJp0a7ug5iVFBMSuxY/nvQiSd3fBNQoVP6SdBB2FwnYbh6U8aR6kszY
 AEb/xAJ1jtcs+ZWh5uSJOz8SMxc0EtfiFo8eA2Aq7CnV+057lYtef9n/Hxy81Ksxv8
 gciTffEVC2xJ120AKYuN75FY6s1+fsTmkEuCoEJtsZ2cHDxnpqNeQwqQuZt2z2ToUe
 9XbxNe+tEUsHOV2Z3t+wMi+U0kvbrr6Olt4iL6XArGnnSfzSQmmvCaK0Lgw9kukVDa
 MBngokkWdluvA==
Date: Wed, 29 Nov 2023 16:47:05 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v18 04/26] drm/shmem-helper: Refactor locked/unlocked
 functions
Message-ID: <20231129164705.7461a294@collabora.com>
In-Reply-To: <6da6mzwfzwbn5rhiebypo5e2v6rhtpn2fovwvfnoo333zjgobf@bgtuwhum3trp>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-5-dmitry.osipenko@collabora.com>
 <wboljiwogeus7pwgaqzxaltt3xdavy2dzisygn6pdpoiwlnwgc@mwaiukjguzat>
 <20231124115911.79ab24af@collabora.com>
 <kw5bho3jx73d3glvtewmjvqt4qty4khju6dcwypuh25ya3gi4b@7slmijjqdi4p>
 <20231128133712.53a6f6cb@collabora.com>
 <37208c72-7908-0a78-fc89-2fa9b8d756a5@collabora.com>
 <20231129085330.7ccb35d3@collabora.com>
 <ioqghyaeftyo7tuyfecn252ykxwgltrkhh2pwktjejqhewntbb@bym3rsjxnxfp>
 <20231129144609.7544e773@collabora.com>
 <6da6mzwfzwbn5rhiebypo5e2v6rhtpn2fovwvfnoo333zjgobf@bgtuwhum3trp>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: kernel@collabora.com, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Emma Anholt <emma@anholt.net>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Melissa Wen <mwen@igalia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Steven Price <steven.price@arm.com>, virtualization@lists.linux-foundation.org,
 Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Nov 2023 16:15:27 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> > Now, let's assume we drop the _locked() suffix on
> > drm_gem_shmem_v[un]map(), but keep it on other helpers that need both
> > variants. This results in an inconsistent naming scheme inside the
> > same source file, which I find utterly confusing.
> >
> > Note that the initial reason I asked Dmitry if he could add the
> > _locked suffix to drm_gem_shmem_vmap() is because I started using
> > drm_gem_shmem_vmap() in powervr, before realizing this version wasn't
> > taking the lock, and I should have used drm_gem_vmap_unlocked()
> > instead, so this is not something I'm making up.  
> 
> Sorry if I gave you the impression I thought that you're making that up,
> I'm not.
> 
> Thanks for the explanation btw, I think I get what you're saying now:
> 
>  - drm_gem_shmem_vmap() is never taking the locks because the core
>    expects to take them before calling them.
> 
>  - drm_gem_shmem_vunmap() is never taking the locks because the core
>    expects to take them before calling them.

Correct.

> 
>  - Some other code path can still call those helpers in drivers, and the
>    locking isn't handled by the core anymore.

They can, if they want to v[un]map a BO and they already acquired the
GEM resv lock. But I'm not sure anyone needs to do that yet. The main
reason for exposing these helpers is if one driver needs to overload the
default gem_shmem_funcs.

> 
>  - We now have _vmap/vunmap_unlocked functions to take those locks for
>    those code paths

We don't have drm_gem_shmem_vmap/vunmap_unlocked(), we have
drm_gem_shmem_vmap/vunmap_locked(), which can be called directly, but
are mainly used to populate the drm_gem_object_funcs vtable. If drivers
want to v[un]map in a path where the resv lock is not held, they should
call drm_gem_vmap/vunmap_unlocked() (which are renamed
drm_gem_vmap/vunmap() in patch 1 of this series). Mind the **drm_gem_**
vs **drm_gem_shmem_** difference in the helper names. drm_gem_ helpers
are provided by drm_gem.c and call drm_gem_object_funcs callback, which
are supposed to be populated with drm_gem_shmem helpers.

> 
>  - And the variant names are now confusing, making people use the
>    lockless version in situations where they should have use the locked
>    one.

That's what happened to me, at least.

> 
> Is that a correct summary?

Almost ;-).

> 
> If so, then I agree that we need to change the name.

Cool.

> 
> We discussed it some more on IRC, and we agree that the "default"
> function should handle the locking properly and that's what the most
> common case should use.

Agree if by 'default' you mean the lock is always acquired by the
helper, not 'let's decide based on what users do most of the time with
this specific helper', because otherwise we'd be back to a situation
where the name doesn't clearly encode the function behavior.

> 
> So that means than drm_gem_shmem_vmap/vunmap() should take the lock
> itself, and drm_gem_shmem_vmap/vunmap_nolock/unlocked never does.

Not sure we have a need for drm_gem_shmem_vmap/vunmap(), but if we ever
add such helpers, they would acquire the resv lock, indeed.

Just to be clear, _nolock == _locked in the current semantics :-).
_nolock means 'don't take the lock', and _locked means 'lock is already
held'.

> 
> I think I'd prefer the nolock variant over unlocked still.

Okay, that means s/_locked/_nolock/ in drm_gem_shmem_helpers.{c,h}, I
guess.

> 
> And I also think we can improve the documentation and add lockdep calls

Lockdep asserts are already there, I think.

> to make sure that the difference between variants is clear in the doc,
> and if someone still get confused we can catch it.
> 
> Does that sound like a plan?

Assuming I understood it correctly, yes. Can you just confirm my
understanding is correct though?

Regards,

Boris

