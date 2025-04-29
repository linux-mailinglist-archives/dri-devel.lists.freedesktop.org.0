Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2F4AA0D76
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 15:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8554710E31C;
	Tue, 29 Apr 2025 13:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A96D10E31C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 13:27:18 +0000 (UTC)
Date: Tue, 29 Apr 2025 09:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1745933236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGKyjw77rWmay1DOSlZ8I5JMs4Q6+3CzvC6nIU4jMr0=;
 b=uHVOeubjTaAxFMf5fyLHquAyLEBt2QzS6LaJIB2pb/Lyj3GGrvPyhEPsDJzxD6tTEzxEjK
 7w3EQgRr5oPb95yGbdPQk2vBf2Uekp4PFz+2pyPFi5W6b5jRQ4Rx8dQ/gUcKx2V8DlIpa3
 bnZeeM2ogNz6N6V9QEBmGs6Vv437mVDPN6dnSGptmk1abX3ix0mG87V8b4KDfbqrTzSias
 3cvSnfLGNYSy6rp2dNvNxcklaCvdAuEKC/VP4uNxD2KHu/5Cq9O/OMO3g6/iLaoVurJ4Et
 ypTMJ+mVq6PoxSMtdiWwm/p6+CJvX7QzNVPGVQEAbnbAAKnKE2u8+fYz6wkMdg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Petr Mladek <pmladek@suse.com>
Cc: Aditya Garg <gargaditya08@live.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
 Hector Martin <marcan@marcan.st>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] vsprintf: Use %p4chR instead of %p4cn for reading data
 in reversed host ordering
Message-ID: <aBDTrIhSmyVRJ1cv@blossom>
References: <20250428123132.578771-1-pmladek@suse.com>
 <aA-0MuLxVTueDAhm@blossom>
 <PN3PR01MB959715E4B4C95911A60ED075B8812@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aBC6f8Vmlik9ua0K@pathway.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBC6f8Vmlik9ua0K@pathway.suse.cz>
X-Migadu-Flow: FLOW_OUT
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

Le Tue, Apr 29, 2025 at 01:39:43PM +0200, Petr Mladek a écrit :
> On Mon 2025-04-28 22:38:13, Aditya Garg wrote:
> > 
> > 
> > On 28-04-2025 10:30 pm, Alyssa Rosenzweig wrote:
> > > Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> > > 
> > > Since the other patches went thru drm-misc-next, I guess this should
> > > too?
> > 
> > I think yes.
> 
> Yes, it would be ideal to add this to drm-misc-next as well.

ok, will queue this
