Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2274E3BF1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 10:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3934E10E10E;
	Tue, 22 Mar 2022 09:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AAD10E10E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 09:52:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3CCAB210E4;
 Tue, 22 Mar 2022 09:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1647942747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=rjxz6Fi2dZC6nTVXM4+OUBhBa/HkZPtrCHPDKh15Ckg=;
 b=RliCtDZGILuQGBiSZ9HJY8BwnJ3EETCFCcEARcrCjl7iZROeBNxTLHk867NKmWk66mkgqt
 NNK5bhjtwFFJq4Gvh2BgHtaSjhzPfUUCqSaM8rgj2+kdoDR48n+IzL2Tu0MTn0BhDNspeE
 kIpVFhNFS35vl5JXRocWI/Whp9KFu0s=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 37D2E12FC5;
 Tue, 22 Mar 2022 09:52:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Z+9HDFqcOWIuGAAAMHmgww
 (envelope-from <mkoutny@suse.com>); Tue, 22 Mar 2022 09:52:26 +0000
Date: Tue, 22 Mar 2022 10:52:24 +0100
From: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [RFC v3 5/8] dmabuf: Add gpu cgroup charge transfer function
Message-ID: <20220322095223.GG8477@blackbody.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
	David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
	Benjamin Gaignard <benjamin.gaignard@linaro.org>,
	Kalesh Singh <kaleshsingh@google.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Shuah Khan <shuah@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>, Kenny.Ho@amd.com,
	Jonathan Corbet <corbet@lwn.net>, Martijn Coenen <maco@android.com>,
	Laura Abbott <labbott@redhat.com>, linux-media@vger.kernel.org,
	Todd Kjos <tkjos@android.com>, linux-kselftest@vger.kernel.orgbcc,
	linaro-mm-sig@lists.linaro.org, Tejun Heo <tj@kernel.org>,
	CABdmKX3+mTjxWzgrv44SKWT7mdGnQKMrv6c26d=iWdNPG7f1VQ@mail.gmail.com,
	cgroups@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	RFC@freedesktop.org,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 21, 2022 at 04:54:26PM -0700, "T.J. Mercier"
<tjmercier@google.com> wrote:
> Since the charge is duplicated in two cgroups for a short period
> before it is uncharged from the source cgroup I guess the situation
> you're thinking about is a global (or common ancestor) limit?

The common ancestor was on my mind (after the self-shortcut).

> I can see how that would be a problem for transfers done this way and
> an alternative would be to swap the order of the charge operations:
> first uncharge, then try_charge. To be certain the uncharge is
> reversible if the try_charge fails, I think I'd need either a mutex
> used at all gpucg_*charge call sites or access to the gpucg_mutex,

Yes, that'd provide safe conditions for such operations, although I'm
not sure these special types of memory can afford global lock on their
fast paths.

> which implies adding transfer support to gpu.c as part of the gpucg_*
> API itself and calling it here. Am I following correctly here?

My idea was to provide a special API (apart from
gpucp_{try_charge,uncharge}) to facilitate transfers...

> This series doesn't actually add limit support just accounting, but
> I'd like to get it right here.

...which could be implemented (or changed) depending on how the charging
is realized internally.


Michal
