Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8448377F41D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 12:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5645D10E42D;
	Thu, 17 Aug 2023 10:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92CC10E421;
 Thu, 17 Aug 2023 10:11:45 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CAD7A40E0196; 
 Thu, 17 Aug 2023 10:11:43 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id KfEvzXzcj4JY; Thu, 17 Aug 2023 10:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1692267101; bh=nwRKpw2lLdAbOLqAH3ClWxZ8c53sZrQ8xdbQI4tBrGw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i3YZ450yxXJoSOZ6sWhxBbqtASp9hjH1tcfbm4vIz4lVagX79hZnSJ33l1X0fLKua
 V0mcmNBS7/3/SYPV4fNCswxEPfQGlzO1F+mn8Jo+u/+/yGjG9BibKOBZRh+J5WacfR
 wRbDufBVzLxKj8iSIF2oXbCG8cCeMohRZevM/A2VpRod+zLCgw+C1a4kspYu6LbYVB
 s6NGGeDo8Cee4/IMG92FDLMVsla0byCbAUWvPRan9uCaXZs1Fol90/1ozMt2Q2JsrU
 fITHA8YbH2y6gLdtnKHBIYEhZP0jJXF6iDZvYazujX7RmMk8ycr/jDjANbaUVlrFRK
 djJ1BAfFv3taYdL8OLfeAiD5xYIBKCxCzIv7lWoXIEobrCN1xREzWWbjIZqmBX8iAM
 yjMXduDYBdhwWSE+MGTqatnP+K27n6yN026l8ULeNcAHH7r78knAxhhuSm5fsMFsKG
 rs86iRtSwjOxjZ1gM1mnrIXohpE8RuK8TSIawp2l8No/xi/0IXy49HapiyEfk9z8X7
 fLQUm/Zs2K2Angoli50CsrBZsOH4EuT3cZgY2yj0VHjDVYsPQv1p1XNX/2zxicZrEI
 rxYQgsOr5g+DzgC/7uzUzWUdUvxDVuoCWkt1GGz7oD4SjRKqCVnGKAoUbvX2lBbPTn
 fYKuClmwmbIm+LSUt/OrhTWc=
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 22D3740E0140;
 Thu, 17 Aug 2023 10:11:34 +0000 (UTC)
Date: Thu, 17 Aug 2023 12:11:29 +0200
From: Borislav Petkov <bp@alien8.de>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp: fix use-after-free in error handling
 of nouveau_connector_create
Message-ID: <20230817101129.GCZN3yUTWHkt22Jgec@fat_crate.local>
References: <CACO55tu8ab-rxCzxFXbUh4Z=W9E-1f8sH6BVd=P+16dQ9PQNjg@mail.gmail.com>
 <20230816145338.GIZNzi8o3d9x9bcPzX@fat_crate.local>
 <CACO55ttasKLxBTmZjN-XBOuJFC7rng2PbLgxCT8WT6ukOZNGzQ@mail.gmail.com>
 <20230816151252.GKZNzndDNySuWC+Vwz@fat_crate.local>
 <CACO55tunC5mEu3Tw64rKLqNM6MN6d=N90kYQKYwXWNMB=ahDaw@mail.gmail.com>
 <20230816221353.GXZN1KIXloRn8cGt5E@fat_crate.local>
 <CACO55ts7430tAUDC+0qY0EZ5ReO=2Rjwj1SzHaBLodmyBgrUrw@mail.gmail.com>
 <20230817081032.GAZN3V+NQ1blzQC2sU@fat_crate.local>
 <CACO55tv-dKnDzUYYFW+d2pNoAhEoEniUT=QAmD4-c_xKQw0cfw@mail.gmail.com>
 <CACO55tuWTYngfw+MZnan+U4eYyE+SvOWgxzffaCMNGQgriq3ig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACO55tuWTYngfw+MZnan+U4eYyE+SvOWgxzffaCMNGQgriq3ig@mail.gmail.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 17, 2023 at 12:00:47PM +0200, Karol Herbst wrote:
> btw, what would help is to know where `nvkm_uconn_uevent` actually
> fails, or rather, are you running into this "/* TODO: support DP IRQ
> on ANX9805 and remove this hack. */" condition?

Send me a diff, I'll run it here and catch output over serial.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
