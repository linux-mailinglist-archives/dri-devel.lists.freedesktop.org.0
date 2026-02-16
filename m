Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JXXMOeCk2k46AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 21:49:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED6814789D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 21:49:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8731A10E0D8;
	Mon, 16 Feb 2026 20:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mcc2se07";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB9210E0D8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 20:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771274979; x=1802810979;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kLdYIq6SYQsYCiukpbRLt9V5tJH5I16KOa7znlZAcK4=;
 b=mcc2se077cPMsZ3HMSKLmIQrXrm/GoKZ2WJYAQxMct9QhNsBzokTBiUl
 cctKPu37Aq2oWW8Zl4A6jPLAdVOKGb0lEhaVfVgC9iRmDFU9ObR9OTVlq
 v6twpLtrAmoyb0126L+VEOI0oCIlmYKMhy8DK7fjh9g3B3ux4scITSkGZ
 STHbCn3KL0XseDy6Yd//eD65opgmZZaNh0afPuhsWMSzwyqlSuby3LAMU
 lz72tx2gOZPTWHa/XUQkXIs+iMDonrUeB+4yWSKQfh2UnO5J2SCnQVRAf
 hP8TBfBQhG/3GCGIxyuK7hA7s6FFMXi2mwtFGp2UBlfOdzSyPFuwO1qQP A==;
X-CSE-ConnectionGUID: xFMvBcchTi+ajbCwfLqwKg==
X-CSE-MsgGUID: Vb8RbgdPT/afC5SDopAP0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72399707"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72399707"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 12:49:39 -0800
X-CSE-ConnectionGUID: nahu5ToeTQ2eopx+iuUz6g==
X-CSE-MsgGUID: ogXU4/T0T/uV3GV2X23/Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="218232127"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 16 Feb 2026 12:49:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vs5X8-000000010H2-0ZIN;
 Mon, 16 Feb 2026 20:49:30 +0000
Date: Tue, 17 Feb 2026 04:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, chester62515@gmail.com,
 cosmin.stoica@nxp.com, adrian.nitu@freescale.com,
 stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, s32@nxp.com, imx@lists.linux.dev,
 clizzi@redhat.com, aruizrui@redhat.com, eballetb@redhat.com,
 echanude@redhat.com, jkangas@redhat.com,
 Larisa Grigore <larisa.grigore@oss.nxp.com>,
 Radu Pirea <radu-nicolae.pirea@nxp.com>,
 Phu Luu An <phu.luuan@nxp.com>, Js Ha <js.ha@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH 12/13] serial: linflexuart: Add DMA support
Message-ID: <202602170428.SOCWu0Wb-lkp@intel.com>
References: <20260216150205.212318-13-larisa.grigore@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216150205.212318-13-larisa.grigore@oss.nxp.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[oss.nxp.com,linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	FORGED_RECIPIENTS(0.00)[m:larisa.grigore@oss.nxp.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:chester62515@gmail.com,m:cosmin.stoica@nxp.com,m:adrian.nitu@freescale.com,m:stefan-gabriel.mirea@nxp.com,m:Mihaela.Martinas@freescale.com,m:oe-kbuild-all@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:s32@nxp.com,m:imx@lists.linux.dev,m:clizzi@redhat.com,m:aruizrui@redhat.com,m:eballetb@redhat.com,m:echanude@redhat.com,m:jkangas@redhat.com,m:radu-nicolae.pirea@nxp.com,m:phu.luuan@nxp.com,m:js.ha@nxp.com,m:ghennadi.procopciuc@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,01.org:url]
X-Rspamd-Queue-Id: 2ED6814789D
X-Rspamd-Action: no action

Hi Larisa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus robh/for-next linus/master v6.19 next-20260216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Larisa-Grigore/serial-linflexuart-Fix-locking-in-set_termios/20260216-231403
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20260216150205.212318-13-larisa.grigore%40oss.nxp.com
patch subject: [PATCH 12/13] serial: linflexuart: Add DMA support
config: parisc-randconfig-001-20260217 (https://download.01.org/0day-ci/archive/20260217/202602170428.SOCWu0Wb-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602170428.SOCWu0Wb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170428.SOCWu0Wb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/fsl_linflexuart.c:205:13: warning: 'linflex_console_putchar' declared 'static' but never defined [-Wunused-function]
     205 | static void linflex_console_putchar(struct uart_port *port, unsigned char ch);
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +205 drivers/tty/serial/fsl_linflexuart.c

   202	
   203	static void linflex_dma_tx_complete(void *arg);
   204	static void linflex_dma_rx_complete(void *arg);
 > 205	static void linflex_console_putchar(struct uart_port *port, unsigned char ch);
   206	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
