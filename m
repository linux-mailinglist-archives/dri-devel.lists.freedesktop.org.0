Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700038D02B3
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 16:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CA210E285;
	Mon, 27 May 2024 14:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bC4JckMq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4B910E285;
 Mon, 27 May 2024 14:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716818794; x=1748354794;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=esIMTSoe6zhhWKEKkt5wS7n9Xn3QvTEZP+DHoYjHzU8=;
 b=bC4JckMqea6m4r3LobZMHRsWXA+pmOWMCvApxDOs5Q9ygN/XlhiXCSR+
 V1tKMVG4mXDrPCgXVm+HPj2y+WuqRGC8xho559+kzKL+ndtycosTYaAbC
 KhDAQZSb0GF9S9GC9EvnZqQU5TF6tI4qwQIXzu5f5AjevcBSWqrvZL/qO
 KRoG4CHvIyVVgjnyQ5KVFJN40kp/ELITyv86znJWSgdUw1yHwS+FWdjPj
 HC8kqRdZa6RknB0/4zMp42K1fyh5fk4SfgNyOG7uNuWTY3T4NK2U7mioQ
 Apj3Krxc1flNXs/xdzz7X7pkcpnB6pytVWsvXdrP6JE6Pd7IiLRsz7cmS A==;
X-CSE-ConnectionGUID: R4UZXOdxRtiIcUBQK50ERw==
X-CSE-MsgGUID: Yi/9iKfvRJet70ks5u0Aiw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24267958"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="24267958"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 07:06:34 -0700
X-CSE-ConnectionGUID: vqCrNranR/GTPXOOHJpqbw==
X-CSE-MsgGUID: a8cmA0bQR5WQoakChsMkzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="35260746"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.200])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 07:06:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Kees Cook <keescook@chromium.org>, Andy
 Shevchenko <andy@kernel.org>
Subject: Re: [PATCH 1/2] string: add mem_is_zero() helper to check if memory
 area is all zeros
In-Reply-To: <CAHp75VcWXCeQo4n67cfq0VQaO-+YW-=iqKx+r4NtFfYnJBTBFA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240527094320.2653177-1-jani.nikula@intel.com>
 <CAHp75VcWXCeQo4n67cfq0VQaO-+YW-=iqKx+r4NtFfYnJBTBFA@mail.gmail.com>
Date: Mon, 27 May 2024 17:06:28 +0300
Message-ID: <87jzjfmjrv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 27 May 2024, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Mon, May 27, 2024 at 12:43=E2=80=AFPM Jani Nikula <jani.nikula@intel.c=
om> wrote:
>>
>> Almost two thirds of the memchr_inv() usages check if the memory area is
>> all zeros, with no interest in where in the buffer the first non-zero
>> byte is located. Checking for !memchr_inv(s, 0, n) is also not very
>> intuitive or discoverable. Add an explicit mem_is_zero() helper for this
>> use case.
>
> ...
>
>> +static inline bool mem_is_zero(const void *s, size_t n)
>> +{
>> +       return !memchr_inv(s, 0, n);
>> +}
>
> There are potential users for the 0xff check as well. Hence the
> following question:
> Are we going to have a new function per byte in question, or do we
> come up with a common denominator, like mem_is_all_of(mem, byte)?

No. As I wrote in the commit message rationale, "Almost two thirds of
the memchr_inv() usages check if the memory area is all zeros". This is
by far the most common use case of memchr_inv().

BR,
Jani.


--=20
Jani Nikula, Intel
