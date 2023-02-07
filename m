Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587D168D44D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 11:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4529F10E4AF;
	Tue,  7 Feb 2023 10:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0673710E4BF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 10:33:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 6589E42458;
 Tue,  7 Feb 2023 10:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1675765990;
 bh=hAMlWeDJ4c/zMHDvd5uFXNWbzM/FlEFJhQdmya+1U7E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Tj8QR0jq995v24jo/ri2KPjXagTxIHEwYohVVXKwH6LlT43N86YeG3PgFRgE9+xPX
 9W3bSaHJhPnSz2HdvF5TgyXkYm6LyM58+NugJGbAV6gQpFyFMDQB4TX26OO3pTIoIL
 W7CEQ+lXhMtEs2OMlysnXembeLZ9ZLxHM/QI6/2ytpm5Y/dpZqKwGVTmMXEbmMg0t2
 tqOWxjWWqYVe3Mo8/JOQ25+AD2QfGg2pDIBeCwqMVn7b/TUPYU/GQDA5Qw/g6r34oU
 WGkK91NnfoIjsNYUas0CeNzs4m4vt14tk5cVD+goYGL/U2RJixqYD3ugLWvPhjIUly
 lBcxi9YrjwpVw==
Message-ID: <d3331cf8-02df-bf15-586b-af9d10830758@asahilina.net>
Date: Tue, 7 Feb 2023 19:33:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/shmem-helper: Fix locking for
 drm_gem_shmem_get_pages_sgt()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230205125124.2260-1-lina@asahilina.net>
 <a1cd8c74-98f4-bff0-0344-cbece787c6e8@redhat.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <a1cd8c74-98f4-bff0-0344-cbece787c6e8@redhat.com>
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
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/02/2023 03.47, Javier Martinez Canillas wrote:
> Hello Lina,
> 
> On 2/5/23 13:51, Asahi Lina wrote:
>> Other functions touching shmem->sgt take the pages lock, so do that here
>> too. drm_gem_shmem_get_pages() & co take the same lock, so move to the
>> _locked() variants to avoid recursive locking.
>>
>> Discovered while auditing locking to write the Rust abstractions.
>>
>> Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
>> Fixes: 4fa3d66f132b ("drm/shmem: Do dma_unmap_sg before purging pages")
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> ---
> 
> Good catch. The patch looks good to me.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> What about drm_gem_shmem_free() BTW, I believe that the helper should also
> grab the lock before unmap / free the sgtable?

That's called from driver free callbacks, so it should only be called
when there are no other users left and the refcount is zero, right? If
there's anyone else racing it I think we have bigger problems than the
pages lock at that point, since the last thing it does is `kfree(shmem);` ^^

(In Rust terms this is equivalent to the Drop trait, which takes a
mutable/exclusive reference, which means no other reference to the
object can exist at that point, so no races are possible. And in fact in
my Rust abstraction I trigger a drop of the Rust object embedded in the
shmem object before calling drm_gem_shmem_free(), so if this invariant
doesn't hold that code would be wrong too!)

~~ Lina
