Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD09F6A3EF2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 10:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65D710E3A5;
	Mon, 27 Feb 2023 09:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310D210E3A2;
 Mon, 27 Feb 2023 09:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677491904; x=1709027904;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WLpJB0qI2/zRDKGnG+kitqzMLkyJLUqz1gpLf8+y3Pw=;
 b=PlC9UhwO3iZ+X+U+rY+V2CiZkJb5c8ZAh9BGeJngS91fgKHio3qK64hy
 vm1eQW3+NBVGrBTAWim3S83tiGrG1QukRqNn3jKSUJbf3cegAI8CpJC5q
 jH9DQxLYjHVkGHxjZEKXmThkj7h0tCWHcGo0fRBaimX0ykwmicxxi4LB7
 ShmbWdBx1uySvWfrRYKMaMUOKqwxecYIHArIoeJ6//GB0oLKPhursMExL
 RSjm1AF9PWcU7nZ/h7TXUceqSJs7KRwY+/sv5ryafWDit33kd5/QgHO9U
 xAwhCCmr66W1S/v/XdyviJRQ40JNT9FVm944YucpynEBI4/Q2LcDZamWt g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="361380474"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="361380474"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 01:58:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="847757997"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="847757997"
Received: from jrissane-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.249.41.42])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 01:58:16 -0800
Date: Mon, 27 Feb 2023 10:58:13 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 7/7] drm/i915/gt: use __xchg instead of
 internal helper
Message-ID: <Y/x+tckkW3BbHBYa@ashyti-mobl2.lan>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <20230118154450.73842-1-andrzej.hajda@intel.com>
 <20230118154450.73842-7-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118154450.73842-7-andrzej.hajda@intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, Boqun Feng <boqun.feng@gmail.com>,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 intel-gfx@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, loongarch@lists.linux.dev,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Wed, Jan 18, 2023 at 04:44:50PM +0100, Andrzej Hajda wrote:
> Prefer core helper if available.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
