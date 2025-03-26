Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE64A71503
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 11:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0779A10E6AD;
	Wed, 26 Mar 2025 10:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fzY02YHq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3905E10E6AD
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 10:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742985565; x=1774521565;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jzGCBkutBgzfiA+VlgU2fbb9z16gst/HAke89+6OrwA=;
 b=fzY02YHq2Whil2uqqqgOwS2fzog4HsFPg1xkPPlePntL2e8aT9GZJcbm
 j+esYylcl7TsFvny0D0DsdflH6T2U6wK3ErXHrevo48QJVlvZAA3TGr8H
 UPJb6SmnBwJaGTLdaiRjSgjAMjImD9c+ol/CpniVN4yee5VCvrltIg0MU
 MCm+7FqDuY1GVaao1XhwgbnWuBIMFl58VRuvOG3QCugurrjoXn6h6XL9U
 vGAJ8VC4GtVhs+dyPQNvSofKCtTwqxiD4Fg9A684t8HqpdnJacXAUqkR9
 HSWjpw1hY2a5UMMvqeyTudPoFwwyzKpKeZpF65uLrVhyQRAdgDYgMdR4c A==;
X-CSE-ConnectionGUID: sq/FzLzCT0mzkT/HG8PuxQ==
X-CSE-MsgGUID: R+pTtEajTMK32MWqIYtc4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44144996"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="44144996"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 03:39:24 -0700
X-CSE-ConnectionGUID: 8tQtKnKxS7yJ/BafNRrroA==
X-CSE-MsgGUID: R2XbqdYXSyS3ofmm/GBCqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="124896092"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.210])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 03:39:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, "open
 list:RUST:Keyword:b(?i:rust)b" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/edid: Use unsigned int in drm_add_modes_noedid()
In-Reply-To: <20250325212823.669459-2-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250325212823.669459-1-lyude@redhat.com>
 <20250325212823.669459-2-lyude@redhat.com>
Date: Wed, 26 Mar 2025 12:39:15 +0200
Message-ID: <87wmcc6ppo.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Mar 2025, Lyude Paul <lyude@redhat.com> wrote:
> A negative resolution doesn't really make any sense, no one goes into a TV
> store and says "Hello sir, I would like a negative 4K TV please", that
> would make everyone look at you funny.

That is largely the point, though. You know something fishy is going on
when you have a negative resolution. Nobody blinks an eye when you ask
for 4294963K telly, but it's still just as bonkers as that negative 4K.

I think the change at hand is fine, but please let's not pretend using
unsigned somehow protects us from negative numbers.


BR,
Jani.


-- 
Jani Nikula, Intel
