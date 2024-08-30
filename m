Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEDE965ED9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 12:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD98610EA62;
	Fri, 30 Aug 2024 10:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="lROkO8R6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4820310E9F3;
 Fri, 30 Aug 2024 10:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1725013362;
 bh=dQzQQaW/lJQe5gEqWz7/siYJFCDJ0BBsoSUipXH98P0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lROkO8R69ThIazwkifncYI+/Jp6q7etFprg1o+WwsZkYQHS6hdFbVfrxZLUdCXLrK
 PJvQlrgai0wA4VU6Z8q2EaoML8jVa8la6pLGqK7nNOjbJqFyOXzpWGaCW8uWV8hOaY
 0OQmPwhpvjpqUZJN2u7OxTU923ux+jDBK1WU0Y8o=
Date: Fri, 30 Aug 2024 12:22:42 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Helge Deller <deller@gmx.de>
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bert Karwatzki <spasswolf@web.de>, 
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 intel-gfx@lists.freedesktop.org, 
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>, "Saarinen,
 Jani" <jani.saarinen@intel.com>
Subject: Re: [PATCH] fbdev: Introduce devm_register_framebuffer()
Message-ID: <7a35a26c-a80b-419a-b2dc-f5c207c540b6@t-8ch.de>
References: <20240830-fbdev-devm_register_framebuffer-v1-1-6d4186519c68@weissschuh.net>
 <729c4f82-a683-4302-b4ae-f591ac04daa1@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <729c4f82-a683-4302-b4ae-f591ac04daa1@gmx.de>
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

On 2024-08-30 12:16:46+0000, Helge Deller wrote:
> On 8/30/24 11:45, Thomas Weißschuh wrote:
> > Introduce a device-managed variant of register_framebuffer() which
> > automatically unregisters the framebuffer on device destruction.
> > This can simplify the error handling and resource management in drivers.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> > This is a fixed resend of [0], which was broken.
> > Thanks to Bert [1], and Chaitanya Kumar [2]
> > for reporting the issue.
> > 
> > [0] https://lore.kernel.org/lkml/20240827-efifb-sysfs-v1-3-c9cc3e052180@weissschuh.net/
> > [1] https://lore.kernel.org/lkml/20240829224124.2978-1-spasswolf@web.de/
> > [2] https://lore.kernel.org/lkml/SJ1PR11MB612925C1C533C09F8F62F7CBB9972@SJ1PR11MB6129.namprd11.prod.outlook.com/
> 
> I've applied this patch to the fbdev git tree.
> Please double check at
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/log/?h=for-next

Looks good.
Sorry for the extra effort necessary.

> Can you please check if this fixes this new report too:
> https://marc.info/?l=linux-fbdev&m=172500784802901&w=2

I double check it and am decently sure it's the same issue.
It tries to unregister the framebuffer but then notices that it never
was registered in the first place.

> > Helge, I didn't document the function devm_unregister_framebuffer() as
> > it is only an internal helper and will ever only used by one user,
> > similar to other helpers in fbmem.c.
> 
> Ok.
> 
> Helge
