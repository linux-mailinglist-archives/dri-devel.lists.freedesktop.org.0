Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A20C6A3EC9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 10:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABF510E39F;
	Mon, 27 Feb 2023 09:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA63D10E39D;
 Mon, 27 Feb 2023 09:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677491747; x=1709027747;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2+o9dIFNlD8/pbPtj1kqozcC4rPUj0z7l8HRWh7LVuA=;
 b=OZR5Cx/MpYorAfshY3Dcc4pK2Dp7TWB8v/SotNnLyljLGajEu9kc3ZIy
 hv4Shl9ShpkCCNnV4Izke1DwEbjvZt7Pj4WK9Ap6YeDB7wWucWDDpWjS/
 rr9/z/RYWX3UDd5aau767E3Xt/iYfUjQuvKKb4JYTK1quhtCCdPQ2NY41
 ROEBbCdXF2d799ZPx/tBrKiKR+Sbml6y4Bn+sKU1ySoQPsh7NO4tQ1fhm
 gfIsdYzQRQgGeXz91erGQ86Yg4HMhIBMztQRA1ruqjpPq/D23/PsZcK06
 0PGhxuiYScKg1bDzYsrdXXXueWNTgZRrNFWZKwG77K0jwJsOHZHW8SgrL g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="314247205"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="314247205"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 01:55:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="816570294"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="816570294"
Received: from jrissane-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.249.41.42])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 01:55:39 -0800
Date: Mon, 27 Feb 2023 10:55:37 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 4/7] llist: simplify __llist_del_all
Message-ID: <Y/x+GTZzRJ7ExEPd@ashyti-mobl2.lan>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <20230118154450.73842-1-andrzej.hajda@intel.com>
 <20230118154450.73842-4-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118154450.73842-4-andrzej.hajda@intel.com>
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

On Wed, Jan 18, 2023 at 04:44:47PM +0100, Andrzej Hajda wrote:
> llist_del_all uses xchg, let's use __xchg here.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
