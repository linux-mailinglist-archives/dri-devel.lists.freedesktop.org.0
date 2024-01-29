Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A7D840203
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 10:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CDB10EDAC;
	Mon, 29 Jan 2024 09:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8CF11277C
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 09:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706521665; x=1738057665;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=VBR7uHoh5G4bx356M7+wqgaO8/xBmXdJrn7Uz3rJrXU=;
 b=lk0kIwj2EXYZH4Y2TkbWviidjLS+XXM8Qx+Lu1RL6GUrZn29Oe77BWB0
 QtBMiNq2GOEliD2McD12XRbzCaSDq10xHcRsdumCcZhKTDdXhy0St/w5o
 qK4FRoi+beNOkMrBDwJA++5/zrRh8yvJNBbOeFACrT6ofW3OuNCN2oT3P
 jArvC+UQIMqul+v6EvVsm3AGLQ4HqmtQgkGtW9Mag2p48BOV0cfjBPV0l
 cLNnkwCs6Rr2UQHIRDhuUTfbJvf/u9raiu1WAyZtDlzCR5R4sDWZ8iYxi
 +W2cIRNY4iiF9L/baVV4ihgDK474aDwfdndF37USll46tY8ojJ2QLr7F9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="9652177"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="9652177"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 01:47:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="787778209"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="scan'208";a="787778209"
Received: from hbrandbe-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.53])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 01:47:40 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: David Laight <David.Laight@ACULAB.COM>, "'linux-kernel@vger.kernel.org'"
 <linux-kernel@vger.kernel.org>, 'Linus
 Torvalds' <torvalds@linux-foundation.org>, 'Netdev'
 <netdev@vger.kernel.org>, "'dri-devel@lists.freedesktop.org'"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH next 10/11] block: Use a boolean expression instead of
 max() on booleans
In-Reply-To: <963d1126612347dd8c398a9449170e16@AcuMS.aculab.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <0ca26166dd2a4ff5a674b84704ff1517@AcuMS.aculab.com>
 <b564df3f987e4371a445840df1f70561@AcuMS.aculab.com>
 <87sf2gjyn9.fsf@intel.com>
 <963d1126612347dd8c398a9449170e16@AcuMS.aculab.com>
Date: Mon, 29 Jan 2024 11:47:37 +0200
Message-ID: <87il3cjwsm.fsf@intel.com>
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
Cc: 'Jens Axboe' <axboe@kernel.dk>,
 "'Matthew Wilcox \(Oracle\)'" <willy@infradead.org>,
 'Christoph Hellwig' <hch@infradead.org>,
 'Dan Carpenter' <dan.carpenter@linaro.org>,
 'Andrew Morton' <akpm@linux-foundation.org>,
 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>,
 "'David S . Miller'" <davem@davemloft.net>,
 "'linux-btrfs@vger.kernel.org'" <linux-btrfs@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Jan 2024, David Laight <David.Laight@ACULAB.COM> wrote:
> From: Jani Nikula
>> Sent: 29 January 2024 09:08
>> 
>> On Sun, 28 Jan 2024, David Laight <David.Laight@ACULAB.COM> wrote:
>> > blk_stack_limits() contains:
>> > 	t->zoned = max(t->zoned, b->zoned);
>> > These are bool, so it is just a bitwise or.
>> 
>> Should be a logical or, really. And || in code.
>
> Not really, bitwise is fine for bool (especially for 'or')
> and generates better code.

Logical operations for booleans are more readable for humans than
bitwise. And semantically correct.

With a = b || c you know what happens regardless of the types in
question. a = b | c you have to look up the types to know what's going
on.

To me, better code only matters if it's a hotpath.

That said, not my are of maintenance, so *shrug*.


BR,
Jani.


-- 
Jani Nikula, Intel
