Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841A65E5A1C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 06:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CA710E431;
	Thu, 22 Sep 2022 04:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B6E10E433
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 04:19:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B54286338F;
 Thu, 22 Sep 2022 04:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3BEC433D6;
 Thu, 22 Sep 2022 04:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663820344;
 bh=8xodEWMTndBecZO1JG0sANGtdcIZJhdCKz1ZoOkxjMk=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=uW+exXsXSGrew87ZojaTnnu2Pv1UtGXzQqjjLX2b7oGph4+PQelJUJX11FgjpqatQ
 ELoqv5pR8bSV3/7535PDpBw6BVY4bi59s4BaKlJSIYVXzNRY6aDLmLKhJLPFtzieTO
 iB7297vU052/FKz0Dc21FYTixE1ykO1VrtaDUUK3SkYuK3biSXS0J7OKhhQjo/eWra
 7mj2sPUPAmfSHWCc1MV6VYkGtcRnMWzr/LNBb6lPibVdaMWLqUzHsztksp0W4hjZYv
 zIN6846mujkb0CwMdnKoomN+OWU5pYCeMqp4QWw7CJvtecSieKja+ya7GWiRyAj90B
 2nqT/vaz2aB1w==
From: Kalle Valo <kvalo@kernel.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 10/12] iwlwifi: Track scan_cmd allocation size explicitly
References: <20220922031013.2150682-1-keescook@chromium.org>
 <20220922031013.2150682-11-keescook@chromium.org>
Date: Thu, 22 Sep 2022 07:18:51 +0300
In-Reply-To: <20220922031013.2150682-11-keescook@chromium.org> (Kees Cook's
 message of "Wed, 21 Sep 2022 20:10:11 -0700")
Message-ID: <87fsgk6nys.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-wireless@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Gregory Greenman <gregory.greenman@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jacob Shin <jacob.shin@amd.com>, Marco Elver <elver@google.com>,
 Johannes Berg <johannes.berg@intel.com>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, Yonghong Song <yhs@fb.com>,
 David Sterba <dsterba@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "David S. Miller" <davem@davemloft.net>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kees Cook <keescook@chromium.org> writes:

> In preparation for reducing the use of ksize(), explicitly track the
> size of scan_cmd allocations. This also allows for noticing if the scan
> size changes unexpectedly. Note that using ksize() was already incorrect
> here, in the sense that ksize() would not match the actual allocation
> size, which would trigger future run-time allocation bounds checking.
> (In other words, memset() may know how large scan_cmd was allocated for,
> but ksize() will return the upper bounds of the actually allocated memory,
> causing a run-time warning about an overflow.)
>
> Cc: Gregory Greenman <gregory.greenman@intel.com>
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: Johannes Berg <johannes.berg@intel.com>
> Cc: linux-wireless@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Via which tree is this iwlwifi patch going? Normally via wireless-next
or something else?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
