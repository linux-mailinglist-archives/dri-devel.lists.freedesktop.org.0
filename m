Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1797F65F0EC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 17:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC4510E75A;
	Thu,  5 Jan 2023 16:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B54F10E761;
 Thu,  5 Jan 2023 16:16:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A35271063;
 Thu,  5 Jan 2023 08:17:36 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.45.56])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CAE13F71A;
 Thu,  5 Jan 2023 08:16:53 -0800 (PST)
Date: Thu, 5 Jan 2023 16:16:50 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: David Laight <David.Laight@aculab.com>,
 'Jani Nikula' <jani.nikula@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 'Andrzej Hajda' <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] linux/minmax.h: add non-atomic version
 of xchg
Message-ID: <Y7b38vH8lgsnCI/m@FVFF77S0Q05N>
References: <20221209154843.4162814-1-andrzej.hajda@intel.com>
 <f58ab17e5c6c4a4e8b0d687b44618c51@AcuMS.aculab.com>
 <Y7bK8drngH/NIlOa@phenom.ffwll.local> <875ydlw1p4.fsf@intel.com>
 <733cd0037bd14a269b54d701e1b80323@AcuMS.aculab.com>
 <Y7ba8UlkhjpJI4F0@phenom.ffwll.local>
 <6617dfb150f94cbb9654a585843e3287@AcuMS.aculab.com>
 <Y7blVTSogV2miG8+@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7blVTSogV2miG8+@phenom.ffwll.local>
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

On Thu, Jan 05, 2023 at 03:57:25PM +0100, Daniel Vetter wrote:
> It's more fun, for the atomic functions which don't have the atomic_
> prefix in their names, the __ prefixed versions provide the non-atomic
> implementation.  This pattern was started with the long * bitops stuff for
> managing really big bitmasks.
> 
> And I really don't think it's a great function name scheme that we should
> proliferate.

FWIW I agree it's not great, but we're stuck between a rock and a bikeshed
w.r.t. better naming -- it's quite hard to clean that up becuase the atomic_*()
namespace is reserved for atomic_t (and mirrors atomic64_*() and
atomic_long_*()).

We could consider renaming atomic_t to atomic32_t and atomic_*() to
atomic32_*(), which'd free up the atomic_*() namespace for more genral usage
(e.g. allowing us to have atomic_xchg() and xhcg(), with the latter not being
atomic).

Thanks,
Mark.
