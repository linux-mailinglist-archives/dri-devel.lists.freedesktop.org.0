Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EF9887757
	for <lists+dri-devel@lfdr.de>; Sat, 23 Mar 2024 07:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E07310E8EC;
	Sat, 23 Mar 2024 06:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="i6jnN+xq";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="cVjUCt3q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0E410E8EC
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 06:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=kHVpvatmACLIHkQBpgUbroXh+MVsVFpq6tArzu/ykOs=;
 b=i6jnN+xq/VdVv+HkVL4ICMSlaFskB+k+43rEVsmWuJAGORLjqZZsVKaV5JWuTtZco2dadtZR3to5y
 srXJuv/2I75lVQj/mnuN94BytRg6V6uiKXOPWFFdA4OwAUmZdaPlaIbx3lVSxo3DgiMtY/yu/dGrXx
 Ba6KzApuIu+Tl8OeXqFTIW7Nthk1MHU8XI0ChjY7bWLpFWf7zLLa+yeeCCVqTx4tDVn7Y7mxpjI+nW
 vy6yFbjPZUVnbgPlarPlipdN16ijfQal4Cm5PAwQSeNbwB+DCIUOUu25XMmn+dQW7F5u7JaXSNAoLe
 4+YHY7YW1+iQv9YyHkWHGp6O8yIC+UA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=kHVpvatmACLIHkQBpgUbroXh+MVsVFpq6tArzu/ykOs=;
 b=cVjUCt3qIpk1zz093kSoT9yNiAJtNN/6tMO6ofj+yw9LAoN5BEKt6xyNp3YuH+U6MZ5+0Xq5QAGoe
 mPps64CAw==
X-HalOne-ID: b499b8b2-e8e2-11ee-9527-31e85a7fa845
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id b499b8b2-e8e2-11ee-9527-31e85a7fa845;
 Sat, 23 Mar 2024 06:58:10 +0000 (UTC)
Date: Sat, 23 Mar 2024 07:58:09 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: nbowler@draconx.ca, deller@gmx.de, javierm@redhat.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, stable@vger.kernel.org
Subject: Re: [PATCH] fbdev: Select I/O-memory framebuffer ops for SBus
Message-ID: <20240323065809.GA886373@ravnborg.org>
References: <20240322083005.24269-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322083005.24269-1-tzimmermann@suse.de>
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

On Fri, Mar 22, 2024 at 09:29:46AM +0100, Thomas Zimmermann wrote:
> Framebuffer I/O on the Sparc Sbus requires read/write helpers for
> I/O memory. Select FB_IOMEM_FOPS accordingly.
> 
> Reported-by: Nick Bowler <nbowler@draconx.ca>
> Closes: https://lore.kernel.org/lkml/5bc21364-41da-a339-676e-5bb0f4faebfb@draconx.ca/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 8813e86f6d82 ("fbdev: Remove default file-I/O implementations")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.8+
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
