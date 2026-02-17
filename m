Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id M7x0KRvgk2n09QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 04:27:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B971489C8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 04:27:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A2410E115;
	Tue, 17 Feb 2026 03:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDW0+wzG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AD010E115
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 03:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771298838; x=1802834838;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2m6koxxuM7n6l/jOLQFHEQ1o9KyPZ+dboD1swuR9uQY=;
 b=RDW0+wzGfW3yF9yqM9OnCqgZ0nFD6dSqu23veUBKpzbPpfJs95/e2Rb1
 lfUgUO9+YrbJIdeNOJGuiXmH1xkwCZ9DT/7A+ovYXKKn5JFS4jAPI+lWe
 PkkoqLNKS7Vf9TQVFLAl/FX/X6K0TeC9LxTajb4Z9d8y6PGC0N2LEaVn8
 eivU95N3wzRt2Q64X5d8BctqBlcYrCnxGvCUN5ROUmI+fjiME1fltJYxh
 wgubWVmgZanJMWdlXKTxcLczGGt4w2/w73WZgyGWa/EHj3Yv525YyM2O6
 xlM5vdD5Z3Ke80EpdIlrzaywHJ2870D2wnPERtgYkjbGgf+QolZOk/SG8 w==;
X-CSE-ConnectionGUID: BXACjQiaSnitBUVqOV2R8g==
X-CSE-MsgGUID: xVshDn9xRoGvE3YGKbQuEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="97829865"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="97829865"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 19:27:18 -0800
X-CSE-ConnectionGUID: DlXPHptKQkOBfFFlFw7TwA==
X-CSE-MsgGUID: DTibiXF/SNqAIcHhtzd3Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="217726185"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 16 Feb 2026 19:27:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vsBjx-000000010aG-0HmP;
 Tue, 17 Feb 2026 03:27:09 +0000
Date: Tue, 17 Feb 2026 11:26:28 +0800
From: kernel test robot <lkp@intel.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, chester62515@gmail.com,
 cosmin.stoica@nxp.com, adrian.nitu@freescale.com,
 stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 s32@nxp.com, imx@lists.linux.dev, clizzi@redhat.com,
 aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com,
 jkangas@redhat.com, Larisa Grigore <larisa.grigore@oss.nxp.com>,
 Radu Pirea <radu-nicolae.pirea@nxp.com>,
 Phu Luu An <phu.luuan@nxp.com>, Js Ha <js.ha@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH 12/13] serial: linflexuart: Add DMA support
Message-ID: <202602171112.rMhRspEp-lkp@intel.com>
References: <20260216150205.212318-13-larisa.grigore@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[oss.nxp.com,linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	FORGED_RECIPIENTS(0.00)[m:larisa.grigore@oss.nxp.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:chester62515@gmail.com,m:cosmin.stoica@nxp.com,m:adrian.nitu@freescale.com,m:stefan-gabriel.mirea@nxp.com,m:Mihaela.Martinas@freescale.com,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:s32@nxp.com,m:imx@lists.linux.dev,m:clizzi@redhat.com,m:aruizrui@redhat.com,m:eballetb@redhat.com,m:echanude@redhat.com,m:jkangas@redhat.com,m:radu-nicolae.pirea@nxp.com,m:phu.luuan@nxp.com,m:js.ha@nxp.com,m:ghennadi.procopciuc@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,git-scm.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 79B971489C8
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
config: i386-buildonly-randconfig-002-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171112.rMhRspEp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171112.rMhRspEp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171112.rMhRspEp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/fsl_linflexuart.c:1095:6: warning: variable 'baud' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1095 |         if (port->uartclk) {
         |             ^~~~~~~~~~~~~
   drivers/tty/serial/fsl_linflexuart.c:1113:67: note: uninitialized use occurs here
    1113 |         lfport->dma_rx_timeout = msecs_to_jiffies(DIV_ROUND_UP(10000000, baud));
         |                                                                          ^~~~
   include/linux/math.h:49:22: note: expanded from macro 'DIV_ROUND_UP'
      49 | #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
         |                      ^
   include/uapi/linux/const.h:51:46: note: expanded from macro '__KERNEL_DIV_ROUND_UP'
      51 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                              ^
   drivers/tty/serial/fsl_linflexuart.c:1095:2: note: remove the 'if' if its condition is always true
    1095 |         if (port->uartclk) {
         |         ^~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_linflexuart.c:970:19: note: initialize the variable 'baud' to silence this warning
     970 |         unsigned int baud;
         |                          ^
         |                           = 0
   drivers/tty/serial/fsl_linflexuart.c:205:13: warning: unused function 'linflex_console_putchar' [-Wunused-function]
     205 | static void linflex_console_putchar(struct uart_port *port, unsigned char ch);
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +1095 drivers/tty/serial/fsl_linflexuart.c

1d3f5f07fafc712 Radu Pirea           2026-02-16   959  
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09   960  static void
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09   961  linflex_set_termios(struct uart_port *port, struct ktermios *termios,
bec5b814d46c2a7 Ilpo Järvinen        2022-08-16   962  		    const struct ktermios *old)
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09   963  {
0b34325c5f79f1f Larisa Grigore       2026-02-16   964  	struct linflex_port *lfport = to_linflex_port(port);
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09   965  	unsigned long flags;
1312e6586227421 Larisa Grigore       2026-02-16   966  	unsigned long cr, old_cr, cr1, gcr;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09   967  	unsigned int old_csize = old ? old->c_cflag & CSIZE : CS8;
1d3f5f07fafc712 Radu Pirea           2026-02-16   968  	unsigned long ibr, fbr, divisr, dividr;
1d3f5f07fafc712 Radu Pirea           2026-02-16   969  	unsigned char ldiv_mul;
1d3f5f07fafc712 Radu Pirea           2026-02-16   970  	unsigned int baud;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09   971  
a75137a58feb092 Radu Pirea           2026-02-16   972  	uart_port_lock_irqsave(port, &flags);
a75137a58feb092 Radu Pirea           2026-02-16   973  
0b34325c5f79f1f Larisa Grigore       2026-02-16   974  	_linflex_stop_rx(port);
0b34325c5f79f1f Larisa Grigore       2026-02-16   975  	_linflex_stop_tx(port);
0b34325c5f79f1f Larisa Grigore       2026-02-16   976  
fb1da4d7f0bec28 Larisa Grigore       2026-02-16   977  	old_cr = readl(port->membase + UARTCR) &
fb1da4d7f0bec28 Larisa Grigore       2026-02-16   978  		~(LINFLEXD_UARTCR_RXEN | LINFLEXD_UARTCR_TXEN);
fb1da4d7f0bec28 Larisa Grigore       2026-02-16   979  	cr = old_cr;
fb1da4d7f0bec28 Larisa Grigore       2026-02-16   980  
fb1da4d7f0bec28 Larisa Grigore       2026-02-16   981  	/* In FIFO mode, we should make sure the fifo is empty
fb1da4d7f0bec28 Larisa Grigore       2026-02-16   982  	 * before entering INITM.
fb1da4d7f0bec28 Larisa Grigore       2026-02-16   983  	 */
fb1da4d7f0bec28 Larisa Grigore       2026-02-16   984  	linflex_wait_tx_fifo_empty(port);
fb1da4d7f0bec28 Larisa Grigore       2026-02-16   985  
fb1da4d7f0bec28 Larisa Grigore       2026-02-16   986  	/* disable transmit and receive */
fb1da4d7f0bec28 Larisa Grigore       2026-02-16   987  	writel(old_cr, port->membase + UARTCR);
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09   988  
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09   989  	/* Enter initialization mode by setting INIT bit */
5e8e1ccacae0470 Larisa Grigore       2026-02-16   990  	cr1 = LINFLEXD_LINCR1_INIT | LINFLEXD_LINCR1_MME;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09   991  	writel(cr1, port->membase + LINCR1);
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09   992  
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09   993  	/* wait for init mode entry */
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09   994  	while ((readl(port->membase + LINSR)
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09   995  		& LINFLEXD_LINSR_LINS_MASK)
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09   996  		!= LINFLEXD_LINSR_LINS_INITMODE)
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09   997  		;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09   998  
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09   999  	/*
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1000  	 * only support CS8 and CS7, and for CS7 must enable PE.
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1001  	 * supported mode:
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1002  	 *	- (7,e/o,1)
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1003  	 *	- (8,n,1)
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1004  	 *	- (8,e/o,1)
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1005  	 */
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1006  	/* enter the UART into configuration mode */
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1007  
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1008  	while ((termios->c_cflag & CSIZE) != CS8 &&
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1009  	       (termios->c_cflag & CSIZE) != CS7) {
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1010  		termios->c_cflag &= ~CSIZE;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1011  		termios->c_cflag |= old_csize;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1012  		old_csize = CS8;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1013  	}
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1014  
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1015  	if ((termios->c_cflag & CSIZE) == CS7) {
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1016  		/* Word length: WL1WL0:00 */
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1017  		cr = old_cr & ~LINFLEXD_UARTCR_WL1 & ~LINFLEXD_UARTCR_WL0;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1018  	}
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1019  
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1020  	if ((termios->c_cflag & CSIZE) == CS8) {
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1021  		/* Word length: WL1WL0:01 */
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1022  		cr = (old_cr | LINFLEXD_UARTCR_WL0) & ~LINFLEXD_UARTCR_WL1;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1023  	}
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1024  
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1025  	if (termios->c_cflag & CMSPAR) {
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1026  		if ((termios->c_cflag & CSIZE) != CS8) {
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1027  			termios->c_cflag &= ~CSIZE;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1028  			termios->c_cflag |= CS8;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1029  		}
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1030  		/* has a space/sticky bit */
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1031  		cr |= LINFLEXD_UARTCR_WL0;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1032  	}
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1033  
1312e6586227421 Larisa Grigore       2026-02-16  1034  	gcr = readl(port->membase + GCR);
1312e6586227421 Larisa Grigore       2026-02-16  1035  
1312e6586227421 Larisa Grigore       2026-02-16  1036  	if (termios->c_cflag & CSTOPB) {
1312e6586227421 Larisa Grigore       2026-02-16  1037  		/* Use 2 stop bits. */
1312e6586227421 Larisa Grigore       2026-02-16  1038  		cr = (cr & ~LINFLEXD_UARTCR_SBUR_MASK) |
1312e6586227421 Larisa Grigore       2026-02-16  1039  			LINFLEXD_UARTCR_SBUR_2SBITS;
1312e6586227421 Larisa Grigore       2026-02-16  1040  		/* Set STOP in GCR field for 2 stop bits. */
1312e6586227421 Larisa Grigore       2026-02-16  1041  		gcr = (gcr & ~LINFLEXD_GCR_STOP_MASK) |
1312e6586227421 Larisa Grigore       2026-02-16  1042  			LINFLEXD_GCR_STOP_2SBITS;
1312e6586227421 Larisa Grigore       2026-02-16  1043  	} else {
1312e6586227421 Larisa Grigore       2026-02-16  1044  		/* Use 1 stop bit. */
1312e6586227421 Larisa Grigore       2026-02-16  1045  		cr = (cr & ~LINFLEXD_UARTCR_SBUR_MASK) |
1312e6586227421 Larisa Grigore       2026-02-16  1046  			LINFLEXD_UARTCR_SBUR_1SBITS;
1312e6586227421 Larisa Grigore       2026-02-16  1047  		/* Set STOP in GCR field for 1 stop bit. */
1312e6586227421 Larisa Grigore       2026-02-16  1048  		gcr = (gcr & ~LINFLEXD_GCR_STOP_MASK) |
1312e6586227421 Larisa Grigore       2026-02-16  1049  			LINFLEXD_GCR_STOP_1SBITS;
1312e6586227421 Larisa Grigore       2026-02-16  1050  	}
1312e6586227421 Larisa Grigore       2026-02-16  1051  	/* Update GCR register. */
1312e6586227421 Larisa Grigore       2026-02-16  1052  	writel(gcr, port->membase + GCR);
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1053  
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1054  	/* parity must be enabled when CS7 to match 8-bits format */
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1055  	if ((termios->c_cflag & CSIZE) == CS7)
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1056  		termios->c_cflag |= PARENB;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1057  
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1058  	if ((termios->c_cflag & PARENB)) {
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1059  		cr |= LINFLEXD_UARTCR_PCE;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1060  		if (termios->c_cflag & PARODD)
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1061  			cr = (cr | LINFLEXD_UARTCR_PC0) &
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1062  			     (~LINFLEXD_UARTCR_PC1);
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1063  		else
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1064  			cr = cr & (~LINFLEXD_UARTCR_PC1 &
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1065  				   ~LINFLEXD_UARTCR_PC0);
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1066  	} else {
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1067  		cr &= ~LINFLEXD_UARTCR_PCE;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1068  	}
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1069  
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1070  	port->read_status_mask = 0;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1071  
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1072  	if (termios->c_iflag & INPCK)
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1073  		port->read_status_mask |=	(LINFLEXD_UARTSR_FEF |
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1074  						 LINFLEXD_UARTSR_PE0 |
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1075  						 LINFLEXD_UARTSR_PE1 |
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1076  						 LINFLEXD_UARTSR_PE2 |
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1077  						 LINFLEXD_UARTSR_PE3);
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1078  	if (termios->c_iflag & (IGNBRK | BRKINT | PARMRK))
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1079  		port->read_status_mask |= LINFLEXD_UARTSR_FEF;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1080  
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1081  	/* characters to ignore */
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1082  	port->ignore_status_mask = 0;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1083  	if (termios->c_iflag & IGNPAR)
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1084  		port->ignore_status_mask |= LINFLEXD_UARTSR_PE;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1085  	if (termios->c_iflag & IGNBRK) {
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1086  		port->ignore_status_mask |= LINFLEXD_UARTSR_PE;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1087  		/*
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1088  		 * if we're ignoring parity and break indicators,
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1089  		 * ignore overruns too (for real raw support).
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1090  		 */
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1091  		if (termios->c_iflag & IGNPAR)
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1092  			port->ignore_status_mask |= LINFLEXD_UARTSR_BOF;
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1093  	}
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1094  
1d3f5f07fafc712 Radu Pirea           2026-02-16 @1095  	if (port->uartclk) {
1d3f5f07fafc712 Radu Pirea           2026-02-16  1096  		ldiv_mul = linflex_ldiv_multiplier(port);
1d3f5f07fafc712 Radu Pirea           2026-02-16  1097  		baud = uart_get_baud_rate(port, termios, old, 0,
1d3f5f07fafc712 Radu Pirea           2026-02-16  1098  					  port->uartclk / ldiv_mul);
1d3f5f07fafc712 Radu Pirea           2026-02-16  1099  
1d3f5f07fafc712 Radu Pirea           2026-02-16  1100  		/* update the per-port timeout */
1d3f5f07fafc712 Radu Pirea           2026-02-16  1101  		uart_update_timeout(port, termios->c_cflag, baud);
1d3f5f07fafc712 Radu Pirea           2026-02-16  1102  
1d3f5f07fafc712 Radu Pirea           2026-02-16  1103  		divisr = port->uartclk;
1d3f5f07fafc712 Radu Pirea           2026-02-16  1104  		dividr = ((unsigned long)baud * ldiv_mul);
1d3f5f07fafc712 Radu Pirea           2026-02-16  1105  
1d3f5f07fafc712 Radu Pirea           2026-02-16  1106  		ibr = divisr / dividr;
1d3f5f07fafc712 Radu Pirea           2026-02-16  1107  		fbr = ((divisr % dividr) * 16 / dividr) & 0xF;
1d3f5f07fafc712 Radu Pirea           2026-02-16  1108  
1d3f5f07fafc712 Radu Pirea           2026-02-16  1109  		writel(ibr, port->membase + LINIBRR);
1d3f5f07fafc712 Radu Pirea           2026-02-16  1110  		writel(fbr, port->membase + LINFBRR);
1d3f5f07fafc712 Radu Pirea           2026-02-16  1111  	}
1d3f5f07fafc712 Radu Pirea           2026-02-16  1112  
0b34325c5f79f1f Larisa Grigore       2026-02-16  1113  	lfport->dma_rx_timeout = msecs_to_jiffies(DIV_ROUND_UP(10000000, baud));
0b34325c5f79f1f Larisa Grigore       2026-02-16  1114  
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1115  	writel(cr, port->membase + UARTCR);
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1116  
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1117  	cr1 &= ~(LINFLEXD_LINCR1_INIT);
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1118  
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1119  	writel(cr1, port->membase + LINCR1);
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1120  
fb1da4d7f0bec28 Larisa Grigore       2026-02-16  1121  	cr |= (LINFLEXD_UARTCR_TXEN) | (LINFLEXD_UARTCR_RXEN);
fb1da4d7f0bec28 Larisa Grigore       2026-02-16  1122  	writel(cr, port->membase + UARTCR);
fb1da4d7f0bec28 Larisa Grigore       2026-02-16  1123  
0b34325c5f79f1f Larisa Grigore       2026-02-16  1124  	_linflex_start_rx(port);
0b34325c5f79f1f Larisa Grigore       2026-02-16  1125  	_linflex_start_tx(port);
0b34325c5f79f1f Larisa Grigore       2026-02-16  1126  
7c6725ffd581335 Thomas Gleixner      2023-09-14  1127  	uart_port_unlock_irqrestore(port, flags);
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1128  }
09864c1cdf5c537 Stefan-gabriel Mirea 2019-08-09  1129  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
