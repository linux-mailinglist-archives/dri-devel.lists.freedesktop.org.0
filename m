Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D514A8C277A
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7759E10ED45;
	Fri, 10 May 2024 15:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NSPHihDw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7480B10ED45
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 15:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715354146; x=1746890146;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=clOzaIBNsY8/hFI2FBTqNXQdU+W7K+KPlCnXMEt9Pew=;
 b=NSPHihDwaFoAOusgL7dwF+6qwmcWcmj45U+LCiGpyasj9XUq2XX01GVw
 G4OwJ/6w5YhkwXvTh8KIhd/lPflX6A8JLPSOoT8tBfjl6jdIPi3qDPoPA
 r+q2d4utK3iDUN8b0Cj14u6FAW9zXICjgifkSpOiz/sXq2sGsQz7SjZzp
 Gxpa07azDkbbxtgCSz/LDo0wjQdzuuVn5nVMXvnb0FYQw0J4GiifjgTSw
 t/1m/MqJcNoJ0WvI1XI64aYjZhl8m6/UUnmZql+oqOtJqet1/HQIg/UwV
 jXUrrKzwQEbikLYwQELvR0FX0cjDOx4tjtXBlYLrPHC/dUaPzjIGUKD8D A==;
X-CSE-ConnectionGUID: +4My+cjeSZ6sxV6jEkEEgQ==
X-CSE-MsgGUID: 2Vqac02YQHmqbcSF4KUJWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11470255"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11470255"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:15:46 -0700
X-CSE-ConnectionGUID: kf/AJuQaQ+iJD6cngGl3BQ==
X-CSE-MsgGUID: yPGCvjS7TmuhlfgQHIQaJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="34083467"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:15:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Devarsh Thakkar
 <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
 akpm@linux-foundation.org, gregkh@linuxfoundation.org,
 adobriyan@gmail.com, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
 vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
 detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
 andrzej.p@collabora.com, nicolas@ndufresne.ca
Subject: Re: [PATCH v7 6/8] math.h Add macros to round to closest specified
 power of 2
In-Reply-To: <Zj42vTpyH71TWeTk@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240509183952.4064331-1-devarsht@ti.com>
 <Zj42vTpyH71TWeTk@smile.fi.intel.com>
Date: Fri, 10 May 2024 18:15:34 +0300
Message-ID: <87fruphf55.fsf@intel.com>
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

On Fri, 10 May 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> On Fri, May 10, 2024 at 12:09:52AM +0530, Devarsh Thakkar wrote:
>> Add macros to round to nearest specified power of 2.
>
> This is not what they are doing. For the above we already have macros defined.
>
>> Two macros are added :
>
> (Yes, after I wrapped to comment this line looks better on its own,
>  so whatever will be the first sentence, this line should be separated
>  from.)
>
>> round_closest_up and round_closest_down which round up to nearest multiple
>
> round_closest_up() and round_closest_down()
>
>
>> of 2 with a preference to round up or round down respectively if there are
>> two possible nearest values to the given number.
>
> You should reformulate, because AFAICS there is the crucial difference
> from these and existing round_*_pow_of_two().

Moreover, I think the naming of round_up() and round_down() should have
reflected the fact that they operate on powers of 2. It's unfortunate
that the difference to roundup() and rounddown() is just the underscore!
That's just a trap.

So let's perhaps not repeat the same with round_closest_up() and
round_closest_down()?

BR,
Jani.


>
>> This patch is inspired from the Mentor Graphics IPU driver [1] which uses
>> similar macro locally and which can be updated to use this generic macro
>> instead along with other drivers having similar requirements.
>> 
>> [1]:
>> https://elixir.bootlin.com/linux/v6.8.9/source/drivers/gpu/ipu-v3/ipu-image-convert.c#L480
>
> Instead of this, just add a patch to convert that driver to use this new macro.
> Besides, this paragraph should go to the comment/changelog area below.
>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> ---
>> V1->V6 (No change, patch introduced in V7)
>> ---

-- 
Jani Nikula, Intel
