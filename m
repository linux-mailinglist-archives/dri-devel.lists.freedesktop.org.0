Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4586EB17553
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 18:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14C810E231;
	Thu, 31 Jul 2025 16:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nlYAoigh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A400D10E029;
 Thu, 31 Jul 2025 16:54:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 72556A552C5;
 Thu, 31 Jul 2025 16:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07711C4CEEF;
 Thu, 31 Jul 2025 16:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753980862;
 bh=RFT+unNz9YD8n7J2IfXYOln4J96Jv/o5vG/NxjuMD14=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nlYAoighajV+2KB/yai024exQXQhpbPmK7A8oy6k3uj9hM2tawrN4In0RGQ67WvEM
 7DhBDXejbr8R32LYDPhsFb0p0hrMJ2S+Uo6jz+Dv3gGGRjb32ADxYI1Cwl4xTbkgSG
 Tmge34PHiSY1pkDiIWqH/QtrKO4LDkv33+u2dZAKEE0WAA6GzqkedEhrazBlNN6/vo
 dIfSGPCmyLO6uwyFbq5g2vitx72P0CHDAQlJPEnuK+pvsRPxyd4Fe05UNP8NLV0LJJ
 fqyIy5fyX42VyalhgbrLrRZj1rqHejWpY4jAgJeTfOZ4S6RoteOK0PWjXjOoNg+nKX
 6GslmxrM5XmIA==
Date: Thu, 31 Jul 2025 09:54:21 -0700
From: Kees Cook <kees@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v15 6/9] ref_tracker: automatically register a file in
 debugfs for a ref_tracker_dir
Message-ID: <202507310952.7255AA30@keescook>
References: <20250618-reftrack-dbgfs-v15-0-24fc37ead144@kernel.org>
 <20250618-reftrack-dbgfs-v15-6-24fc37ead144@kernel.org>
 <202507301603.62E553F93@keescook>
 <6270c853cdf90172d4794e2b601ebc88590b774f.camel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6270c853cdf90172d4794e2b601ebc88590b774f.camel@kernel.org>
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

On Thu, Jul 31, 2025 at 06:29:00AM -0400, Jeff Layton wrote:
> "If you think you can justify it (in comments and commit log) well
> enough to stand up to Linus’s scrutiny, maybe you can use “%px”, along
> with making sure you have sensible permissions."
> 
> Is making it only accessible by root not sensible enough? What are
> "sensible permissions" in this instance?

Yes, I should have been more clear (or probably should update the
document), but root (uid==0) isn't a sufficient permission check, as
address exposure is supposed to be bounded by capabilities. Putting a
filename into the tree exposes the address to anything that can get a
file listing, and DAC access control isn't granular enough.

(Thank you again for the fix patch I saw in the other thread!)

-- 
Kees Cook
