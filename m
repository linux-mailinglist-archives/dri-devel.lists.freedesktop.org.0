Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A74C9E945
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 10:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AE710E76B;
	Wed,  3 Dec 2025 09:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHj0cfMI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D90710E672
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 09:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764755353; x=1796291353;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+y+ApfGHtvycxU7K4CHZWLTcI3W9kqMhc7+aZGtfHlE=;
 b=OHj0cfMIXEsJNpTgDcJLP/dK6NCY2pxYBwg9mufr86zJLlGCBX1VhY4Y
 6S+jOputN11I11BtqCg+9H/rzqVA+s6CjrEol/D8nIswk2FqGQmk2wmlZ
 Ryw/8wo0nC2efkTNiRknA/sILj+RyRhhRabmMUTWU1PpSeydiuhXxujFq
 TguRcB4Zu5+jEUbYjUKtw3KKDZrXWObdFGCrqN9UgCw50lFjjvnwMzyoX
 TgstBddoJAIzffJAY2Jp2qRrUVyUtsAHMoCCUz41TJYmh1q4sCfxZEQTi
 /PtwS2KiMG6ZrArPR6TJUVxr2iaZ0Bkjw1G+kkH+tVV0JE/Bh5zwLHgB+ A==;
X-CSE-ConnectionGUID: fR2aUupBR3+jBpiHATMIrQ==
X-CSE-MsgGUID: XntjrFqHRuSf8u4ajJbIfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="65931138"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="65931138"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:49:12 -0800
X-CSE-ConnectionGUID: Ligm7xApQ+ysHdo5uJFotw==
X-CSE-MsgGUID: 2GSroBjKTIScsZRWaWWZ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="193915649"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.217])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:49:10 -0800
Date: Wed, 3 Dec 2025 11:49:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Helge Deller <deller@gmx.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
 Chelsy Ratnawat <chelsyratnawat2001@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Raag Jadav <raag.jadav@intel.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev/pxafb: Fix multiple clamped values in
 pxafb_adjust_timing
Message-ID: <aTAHkxg1_LDzZNSb@smile.fi.intel.com>
References: <20251202181600.511166-2-thorsten.blum@linux.dev>
 <a7213b69-f6ae-4975-8c8b-2783dbe9f9b3@gmx.de>
 <C3FDBCE7-14D9-4999-B463-C2E3E384E7DB@linux.dev>
 <77ac64e5-709d-4eb5-8b47-9fc15e579d1a@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77ac64e5-709d-4eb5-8b47-9fc15e579d1a@gmx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Tue, Dec 02, 2025 at 08:36:08PM +0100, Helge Deller wrote:
> On 12/2/25 19:36, Thorsten Blum wrote:
> > On 2. Dec 2025, at 19:28, Helge Deller wrote:
> > > On 12/2/25 19:15, Thorsten Blum wrote:

...

> > > How did you notice? Do you actually have the hardware and tested it?
> > 
> > I only compile-tested it.
> > 
> > I stumbled upon another driver with the same bug and then used grep to
> > search for other instances and found about 6 or 7, including this one.
> 
> Ok. But this then means, maybe the clamping isn't needed (since nobody complained),
> or that nobody noticed because nobody uses the driver any longer.

I think it's a combination of factors: 1) rarely people have this hardware,
especially nowadays, to run more or less new kernel; 2) there are no conditions
happened that this patch fixes in their environments; 3) something else I
missed.


-- 
With Best Regards,
Andy Shevchenko


