Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D037A6B15B1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 23:58:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E8C10E5D1;
	Wed,  8 Mar 2023 22:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 607 seconds by postgrey-1.36 at gabe;
 Wed, 08 Mar 2023 22:58:43 UTC
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id CAAB810E5D1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 22:58:43 +0000 (UTC)
Received: from [192.168.0.2] (chello089173232159.chello.sk [89.173.232.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id 631267A03E2;
 Wed,  8 Mar 2023 23:48:33 +0100 (CET)
From: Ondrej Zary <linux@zary.sk>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v4 1/4] video: fbdev: atyfb: only use ioremap_uc() on i386
 and ia64
Date: Wed, 8 Mar 2023 23:48:29 +0100
User-Agent: KMail/1.9.10
References: <20230308130710.368085-1-bhe@redhat.com>
 <20230308130710.368085-2-bhe@redhat.com>
 <ZAjphWYHDoDw9sQS@bombadil.infradead.org>
In-Reply-To: <ZAjphWYHDoDw9sQS@bombadil.infradead.org>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202303082348.29416.linux@zary.sk>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Baoquan He <bhe@redhat.com>, arnd@arndb.de, mpe@ellerman.id.au,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, hch@infradead.org,
 linux-mm@kvack.org, geert@linux-m68k.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday 08 March 2023 21:01:09 Luis Chamberlain wrote:
> On Wed, Mar 08, 2023 at 09:07:07PM +0800, Baoquan He wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > ioremap_uc() is only meaningful on old x86-32 systems with the PAT
> > extension, and on ia64 with its slightly unconventional ioremap()
> > behavior, everywhere else this is the same as ioremap() anyway.
> > 
> > Change the only driver that still references ioremap_uc() to only do so
> > on x86-32/ia64 in order to allow removing that interface at some
> > point in the future for the other architectures.
> > 
> > On some architectures, ioremap_uc() just returns NULL, changing
> > the driver to call ioremap() means that they now have a chance
> > of working correctly.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > Cc: Helge Deller <deller@gmx.de>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Cc: linux-fbdev@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> 
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
> 
> Is anyone using this driver these days? How often do fbdev drivers get
> audited to see what can be nuked?

Older servers have integrated ATI Rage XL chips and this is the only driver for it.

-- 
Ondrej Zary
