Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AB6AAE563
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 17:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB66A10E84B;
	Wed,  7 May 2025 15:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S8kuPuDd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5F110E84A;
 Wed,  7 May 2025 15:50:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5A3D043B0B;
 Wed,  7 May 2025 15:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE80C4CEE2;
 Wed,  7 May 2025 15:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746633035;
 bh=/kk+lMEV9goTpRWvoLzP681rFcpsKOtwSv5IQnnAQ4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S8kuPuDd6TlAsDYR9wp/41rHJDkWTwCjPWtbetr2wt+mtHbzmWO/O4YbNXWmOnPuK
 lPI7BM5lKG4tmZknGtWx0DzN8j237oovyYxK0eSY8vBLn2C8rlaxK19nGqeFknm4Mp
 GVemygZS90+SZg7Xn4cMcGikJAogcL8d/QwCs3xpxdecblPyxjSmRbvKKVKiXM/1z6
 7Z/GpR6USHjgbaPQ8HuxmfroCUndcgyygAi/5bFQn3XOnhUwyeuJgC83MS7g8pHiYw
 ozqpF0hwkJaLjtFMiH6c7CKqWRMyZ2JHtQ3O+2OWictKYYePBibZE2bY1aj6r5g7CJ
 GeU3GNh+GbKdw==
Date: Wed, 7 May 2025 17:50:32 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 Gnattu OC <gnattuoc@me.com>, Nitin Gote <nitin.r.gote@intel.com>, 
 Ranu Maurya <ranu.maurya@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Angus Chen <angus.chen@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Yu Jiaoliang <yujiaoliang@vivo.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gt: Remove const from struct i915_wa list
 allocation
Message-ID: <e4rgvbw3ts7bnj2opz44exharx2ybxvjzzwu3kzthnc5i2a37u@fzswrwnjggqd>
References: <20250426061357.work.749-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426061357.work.749-kees@kernel.org>
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

Hi Kees,

On Fri, Apr 25, 2025 at 11:13:58PM -0700, Kees Cook wrote:
> In preparation for making the kmalloc family of allocators type aware,
> we need to make sure that the returned type from the allocation matches
> the type of the variable being assigned. (Before, the allocator would
> always return "void *", which can be implicitly cast to any pointer type.)
> 
> The assigned type is "struct i915_wa *". The returned type, while
> technically matching, will be const qualified. As there is no general
> way to remove const qualifiers, adjust the allocation type to match
> the assignment.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>

merged to drm-intel-gt-next.

Thanks,
Andi
