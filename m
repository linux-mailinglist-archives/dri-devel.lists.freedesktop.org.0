Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3E47B64E5
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 11:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BAF10E263;
	Tue,  3 Oct 2023 09:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2C910E263
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 09:01:00 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 447B26607079;
 Tue,  3 Oct 2023 10:00:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696323658;
 bh=cvW64htWBwkbZa50ehWwGHppuYY384nnu1olxbLOfrc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lqsfHalCz/aFw0YXCDQqUQrDpgV1BVfV9FUbldI+Vn06NWEt0/oE9DpNqCi0NV613
 Zzv5Ow+cc+O3QQG7+dqsPgK2Aot/H30/KoH3vPb9vjhzuEJh4D+bKBtTI4Krngkx2B
 SNf1Z9OpJPONNAcaDwMAmFLV8DVRYz1JAhoR8bCLY/x6oT4TVyTvLrnOhBkYzQ0HWj
 YurT6ILG14bLcU57gj5zKdhPt2SBMXYXJB3tNEcbpIVIHQFmRpf5o+GB9Ym8FK5F17
 W6i4ktGWuDT6mJrDi4sQ2oAsxFIRaLMiFA6TDg3GFrMOjpf9qaeiqs7TPqSlvLn21r
 203pqcOgXn6bQ==
Date: Tue, 3 Oct 2023 11:00:55 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v17 13/18] drm/shmem-helper: Add memory shrinker
Message-ID: <20231003110055.346fd94c@collabora.com>
In-Reply-To: <bbbd82a5-41bf-4ca3-476d-e5039e94631b@collabora.com>
References: <20230914232721.408581-1-dmitry.osipenko@collabora.com>
 <20230914232721.408581-14-dmitry.osipenko@collabora.com>
 <20230915104633.0d5c3932@collabora.com>
 <454c464e-4534-7ec3-6d38-49b7df83c7be@collabora.com>
 <20230926093517.11a172ad@collabora.com>
 <bbbd82a5-41bf-4ca3-476d-e5039e94631b@collabora.com>
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Dmitry,

On Tue, 3 Oct 2023 03:31:32 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> On 9/26/23 10:35, Boris Brezillon wrote:
> >>>> +	__drm_gem_shmem_release_pages(shmem);    
> >>> Make sure you drop the implicit pages_use_count ref the sgt had, this
> >>> way you can still tie the necessity to drop the pages to sgt != NULL in
> >>> drm_gem_shmem_free().    
> >> This will require further refcnt re-initialization when pages are
> >> restored if it's dropped to zero. I don't see how this will improve
> >> anything.  
> > Sorry to disagree, but I do think it matters to have a clear ownership
> > model, and if I look at the code (drm_gem_shmem_get_pages_sgt_locked()),
> > the sgt clearly owns a reference to the pages it points to.  
> 
> It creates too much unnecessary trouble because, again, pages_use_count
> can't drop to zero easily.

Not saying pages_use_count should drop to zero, I'm just saying the
reference that was owned by the sgt should be released when this sgt is
freed, no matter if this sgt destruction is triggered by a GEM eviction,
or because the GEM object is freed entirely.

> Shrinker doesn't own the refcnt and not
> allowed to touch it.

I'm not asking the shrinker to own a reference on the pages either.
It's really the sgt that owns this reference.

> The pages_use_count is then used by things like
> mmap() and etc that use get_pages(), which can be invoked for evicted GEM.

Yes, and I still have a hard time seeing how this interferes with what
I'm suggesting to be honest.

> 
> I'd prefer to keep refcounting as is, don't see how to implement your
> suggestion.

Can you be more specific? I don't really see what the problem is with
decrementing pages_use_count when you free the sgt (eviction), and
re-incrementing it when the sgt is restored (swapin).

Regards,

Boris
