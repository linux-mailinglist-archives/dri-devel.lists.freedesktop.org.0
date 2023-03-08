Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B62FC6B1288
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 21:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7922B10E00B;
	Wed,  8 Mar 2023 20:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474DD10E00B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 20:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VHBqNuY0x1wxfPhHVQhisSv8VveYnM+bpNzuUcj7maw=; b=QsbvVsbo95uqiUQ+u8JFvQ518z
 V5F2rcstU9wf3BOZjyhsTy80HKciKLqA7C14qMCSfqBzZ1KHmQfO5BarLsBQjON8VhmhTfD4E8v8N
 Ay1lYX9BjQwNAR/mvrNrDq+5gM49bap//5a/DKAB8Giq6IF3UlDstW9ya8c8i4jerLCVZ9uUtswrx
 dEI6EPvcZckPC6tcmbgoHTJrrf3mrcCuf1ngncIgFqJJuRKlRqW4WKieMX0zO0Nd6mVDErZ2TwWib
 wrqBsyJGkc+C/nbyErpVX/GVqfwMldJMf4Qilms8fJSjmgqZ+2ECdfmTnMHTr3ZmgT99hupAIshNB
 8JBgY0QA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pZzyH-006cUe-Bn; Wed, 08 Mar 2023 20:01:09 +0000
Date: Wed, 8 Mar 2023 12:01:09 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v4 1/4] video: fbdev: atyfb: only use ioremap_uc() on
 i386 and ia64
Message-ID: <ZAjphWYHDoDw9sQS@bombadil.infradead.org>
References: <20230308130710.368085-1-bhe@redhat.com>
 <20230308130710.368085-2-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308130710.368085-2-bhe@redhat.com>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, arnd@arndb.de,
 mpe@ellerman.id.au, Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, hch@infradead.org,
 linux-mm@kvack.org, geert@linux-m68k.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 08, 2023 at 09:07:07PM +0800, Baoquan He wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> ioremap_uc() is only meaningful on old x86-32 systems with the PAT
> extension, and on ia64 with its slightly unconventional ioremap()
> behavior, everywhere else this is the same as ioremap() anyway.
> 
> Change the only driver that still references ioremap_uc() to only do so
> on x86-32/ia64 in order to allow removing that interface at some
> point in the future for the other architectures.
> 
> On some architectures, ioremap_uc() just returns NULL, changing
> the driver to call ioremap() means that they now have a chance
> of working correctly.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Baoquan He <bhe@redhat.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

Is anyone using this driver these days? How often do fbdev drivers get
audited to see what can be nuked?


  Luis

