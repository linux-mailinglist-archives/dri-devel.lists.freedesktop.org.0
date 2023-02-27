Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCB86A3EDF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 10:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EFB10E3A0;
	Mon, 27 Feb 2023 09:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932B910E3A0;
 Mon, 27 Feb 2023 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677491817; x=1709027817;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QoU6yA4OU0JwXW/AH29osWOnR5IWich2UMqOTYGbHiA=;
 b=GZ28Lyb4jnzXy21OhF0+LFG0v6lgrq79rE8SQXADVzlofWJ4RL8jOI0Z
 ZHqFj6a7a+LYZWOefhTEdXABpXiWFqrb84Ugad3wIfc/pHGzZry10K2q/
 FXTMk97YXesnYvSP6dRsLjzYQ0FuKTkKtQSmM+8nR01eF8YvimKethypR
 GzXanmasaD+uU+KRk4rFVQya1WlLJcELzotkmwgBPtIQaTUcEuDddrPfz
 HcG2YSlcDiXZJ0A+WgLemqB6dJ+xeHx+Uskr6K5FgLsoyQdLEPDVtVXuT
 HDYUGk6ic5JzypT0Jg2acUHlwe63D64nnfNlQaGdQqZIdUiXDcDoTSmk4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="332545931"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="332545931"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 01:56:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="675796769"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="675796769"
Received: from jrissane-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.249.41.42])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 01:56:49 -0800
Date: Mon, 27 Feb 2023 10:56:47 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 6/7] qed: use __xchg if possible
Message-ID: <Y/x+XzSaHTo23F/H@ashyti-mobl2.lan>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <20230118154450.73842-1-andrzej.hajda@intel.com>
 <20230118154450.73842-6-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118154450.73842-6-andrzej.hajda@intel.com>
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

On Wed, Jan 18, 2023 at 04:44:49PM +0100, Andrzej Hajda wrote:
> Recently introduced helper simplifies the code.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
