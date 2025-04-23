Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB26A9951D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 18:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E7E10E205;
	Wed, 23 Apr 2025 16:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UtkWTpV1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2A510E205
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745425811; x=1776961811;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=blCd0egQnP2RQ1crpeuSGS0mStW2KuzlnHkxCncnzPw=;
 b=UtkWTpV1tuWRuDbrzuP3PhYgWNeeFvumhMG2II5EFyB3BApBQ91g3Ef3
 L25vZMFsbNjBhyN0hXakSnx3998+kwjmpbr9vkiHSUmhoRozenjQCurKI
 Uc6KRyvSD1sv2+0DjAyZcFRhL2iljy58IT+dJ9+gY0G+8HfrpOEV7OBU3
 eHpDLLxh9bJSmx4B4GmgWsodyzaBC/txr1Ydo5Ny8h4hrCIU/5GgkMgRy
 vUhoQ3fMwVuIjrFyo44NcSlOD2ahMqzVj6x8t0ABe16VTD++nF/JRuE2S
 C/rkXitN6z2wC6GmXCPV/nFrSHcwErHRmxVnAE3Ov0ArbV3XIO9IIpPv6 g==;
X-CSE-ConnectionGUID: EBSllheDRNCo39ZyB+3EtQ==
X-CSE-MsgGUID: Z6ItIuvyQLWOGU8ng1K9Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="50691988"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="50691988"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 09:30:10 -0700
X-CSE-ConnectionGUID: AOZmElnvQS6Bz4a7vmV+Lg==
X-CSE-MsgGUID: k1cYvI4HTxyrG+74eZSxKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="137527738"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 09:29:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1u7cyf-0000000F7DT-2dhw; Wed, 23 Apr 2025 19:29:37 +0300
Date: Wed, 23 Apr 2025 19:29:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Petr Mladek <pmladek@suse.com>, Aditya Garg <gargaditya08@live.com>,
 Hector Martin <marcan@marcan.st>, alyssa@rosenzweig.io,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>,
 Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
 Simona Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
 joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
 Kees Cook <kees@kernel.org>, tamird@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 netdev <netdev@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Message-ID: <aAkVcaRrMmqXRSFz@smile.fi.intel.com>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
 <PN3PR01MB9597B3AE75E009857AA12D4DB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdWpqHLest0oqiB+hG47t=G7OScLmHz5zr2u0ZgED_+Obg@mail.gmail.com>
 <aAjthvTuIeUIO4CT@pathway.suse.cz>
 <CAMuHMdXuawN0eC0yO40-zrz70TH-3_Y-CFSy6=hHCCMLAPvU5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXuawN0eC0yO40-zrz70TH-3_Y-CFSy6=hHCCMLAPvU5w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Wed, Apr 23, 2025 at 04:50:02PM +0200, Geert Uytterhoeven wrote:
> On Wed, 23 Apr 2025 at 15:39, Petr Mladek <pmladek@suse.com> wrote:
> > On Tue 2025-04-22 10:43:59, Geert Uytterhoeven wrote:

...

> > The problem is that the semantic is not the same. The modifiers affect
> > the output ordering of IPv4 addresses while they affect the reading order
> > in case of FourCC code.
> 
> Note that for IPv4 addresses we have %pI4, which BTW also takes [hnbl]
> modifiers.

Ouch, now I think I understand your complain. You mean that the behaviour of
h/n here is different to what it is for IPv4 case?

> > Avoid the confusion by replacing the "n" modifier with "hR", aka
> > reverse host ordering.

Not ideal, but better than 'h'ost / 'r'everse pair. Not giving a tag and not
objecting either if there is a consensus.

-- 
With Best Regards,
Andy Shevchenko


