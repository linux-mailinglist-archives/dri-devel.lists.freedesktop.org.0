Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B19A0B387
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1401A10E5FA;
	Mon, 13 Jan 2025 09:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ea6HsPqt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2A010E5FA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736761680; x=1768297680;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cXC8TN1xN8hl9kriYp7PuPtdADBmjjsDXk6R7Zd8rsA=;
 b=ea6HsPqtjmQrdZeIAB0T69Fzeizb+VX+Gd2fU6ADfuGevXnGXkI8YiTi
 6rRbeIHlez4mE3GFvluQ5VuoQu41gXGqrDZNciAyS6NM8lrBpDRgFgZ1U
 YOZbLas5vNpdA1y+8XoOAYQLJ/ZQX0iN7wTpybvP9UGCBjP9C7DzLBNCB
 yrVW3xqEFf2RBPxZ/8iRhHiekTiEhNEp/O3SJEwDVzvb8ZLqQihPHPri+
 XUfGPPtWCM8NB7/1BtEjRpU344jcGa4C/gJp38rl6iBUD121WpF7Ps0Tc
 hgI7543looSPhuKvXs75U/OmsYz6Ku8TXhd8INxbr0pcePkPGT+XJZ9z5 w==;
X-CSE-ConnectionGUID: 7sDQgiGJT5GnKfo4kB29ag==
X-CSE-MsgGUID: WdMQVo6qQPCCmbWnkJWvFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="24611724"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="24611724"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 01:48:00 -0800
X-CSE-ConnectionGUID: I0TjqpBSSnaK8CEDtRcNZA==
X-CSE-MsgGUID: nXDSzjKzQnWIRrg4Zi293Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="109353456"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.145])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 01:47:56 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vitaliy Shevtsov <v.shevtsov@maxima.ru>, Simona Vetter
 <simona.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 syzbot+9a8f87865d5e2e8ef57f@syzkaller.appspotmail.com, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, Michel =?utf-8?Q?D=C3=A4nzer?=
 <michel.daenzer@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/vblank: fix misuse of drm_WARN in
 drm_wait_one_vblank()
In-Reply-To: <20250111043753.b4407fcd52413ca37ed80ce9@maxima.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250110164914.15013-1-v.shevtsov@maxima.ru>
 <Z4Fy04u7RjaZIsqI@phenom.ffwll.local>
 <20250111043753.b4407fcd52413ca37ed80ce9@maxima.ru>
Date: Mon, 13 Jan 2025 11:47:53 +0200
Message-ID: <87y0zfhwom.fsf@intel.com>
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

On Sat, 11 Jan 2025, Vitaliy Shevtsov <v.shevtsov@maxima.ru> wrote:
> On Fri, 10 Jan 2025 20:19:47 +0100
> Simona Vetter <simona.vetter@ffwll.ch> wrote:
>
>> Hm, unless a drivers vblank handling code is extremely fun, there should
>> be absolutely no memory allocations or user copies in there at all. Hence
>> I think you're papering over a real bug here. The vblank itself should be
>> purely a free-wheeling hrtimer, if those stop we have serious kernel bug
>> at our hands.
>> 
>> Which wouldn't be a big surprise, because we've fixed a _lot_ of bugs in
>> vkms' vblank and page flip code, it's surprisingly tricky.
>> 
>> Iow, what kind of memory allocation is holding up vkms vblanks?
>> 
>> Cheers, Sima
>> 
>
> I don't think this is because of memory allocation. As far as I can see
> there is no memory allocation in vblanks handling. Okay, there is a kzalloc()
> call in vkms_atomic_crtc_reset() without checking a pointer but this is
> not the root cause of this issue. My first thought was that somehow a
> vblank might not be successfully processed by drm_crtc_handle_vblank() in
> vkms_vblank_simulate() function which always returns HRTIMER_RESTART even
> if a vblank handling failed. But this hypothesis was not confirmed -
> all vblanks are fine. The hrtimers in vkms have a hardcoded framedur
> value of 16ms and what I can see is that the fault injection creates
> some delays by unwinding the call stack when it simulates an allocation
> failure and this caused the hrtimers to lag. This what I was able to
> investigate while I was debugging the kernel in the gdb.
>
> A similar issue was being discussed in
> https://lore.kernel.org/linux-kernel//0000000000009cd8d505bd545452@google.com/T/

Seems to me in most cases we do want the WARN, but there are corner
cases. Arguably those should be addressed instead to ensure we won't
ignore the real bugs. We want the warning, you want the panic.


BR,
Jani.


-- 
Jani Nikula, Intel
