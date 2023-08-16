Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDCE77DE15
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 12:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C2D10E31A;
	Wed, 16 Aug 2023 10:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2004 seconds by postgrey-1.36 at gabe;
 Wed, 16 Aug 2023 10:03:56 UTC
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD62C10E317;
 Wed, 16 Aug 2023 10:03:56 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EA9ED40E0140; 
 Wed, 16 Aug 2023 10:03:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xZBDBaXCll6W; Wed, 16 Aug 2023 10:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1692180232; bh=oHVGfQmdLztoSjvTf1LFJ+5NoFHy0dpxilKjS5Iw1vo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=floOfcHckZfB6EmQGcU1bY0eevy710qB37uSuHVHdRSE/YmdhAwkCVj9b2S+WIMRz
 xMtpvhMWWw6TFsbjN/nfBWUxNZLL5zFIRu47ejORZThUn9ec9bC6qKrrlp6KWTRz9x
 f0p4szVPLH3VQXVg4FV95LMQXvjRq2HY+G80BLT81DjVfWBJXFGYEpHi96zPbw1rcv
 67csx543h6x7ySs0+BAU1sp07zS/imWSP5Tm4lVwP+ynfdGLfM3Cg3BnHAWS1soxsA
 FyiUJ6A27fxV8ddt7cZZbC7zT1rys2eoleIpaVgprPLLkJ9sUMGWbj/2Aq88bLzJeY
 KTFx/0nsoGNCNLH3pBvRT39kVY5dsr7FHaz9mcAZl1f/IaJyo1+kw3/YIWq/hmgzEL
 3S3S+hZcPbRXEbIkxkVhs5tSPOvghM97rxLJ02UNCeiB12TJm0hBw1VnC0d1H4szGI
 x/BWCRBk2ZDzCDkRLWUW/lfmIsXIb5EI1zcF0l6ENsQ3R3yvEoYdr23x6r/H2AHCn+
 yl8d4cp1aP3+fAAxJwrl9puIWL3P3lZa0RlRA57EgtxeTEDqwJVwDN7bvUtg1kErzF
 tT4NDQCTvOUxi8FO9oUEFYudxSiJjyWzKics4rA5SIa78a6zhEwyoKkgMjT1gjzFZJ
 2gevMpv8SARz2nguG+Wo4Qr8=
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 867B540E0193;
 Wed, 16 Aug 2023 10:03:45 +0000 (UTC)
Date: Wed, 16 Aug 2023 12:03:44 +0200
From: Borislav Petkov <bp@alien8.de>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp: fix use-after-free in error handling
 of nouveau_connector_create
Message-ID: <20230816100344.GEZNyfAIt0CJa+g6Sj@fat_crate.local>
References: <20230814144933.3956959-1-kherbst@redhat.com>
 <20230816093015.GDZNyXJ28y9uspb4Mr@fat_crate.local>
 <CACO55tu8ab-rxCzxFXbUh4Z=W9E-1f8sH6BVd=P+16dQ9PQNjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACO55tu8ab-rxCzxFXbUh4Z=W9E-1f8sH6BVd=P+16dQ9PQNjg@mail.gmail.com>
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

On Wed, Aug 16, 2023 at 11:51:50AM +0200, Karol Herbst wrote:
> Mind sharing your kernel logs with that patch applied? I suspect your
> system boots up but you might just not have the connector available or
> something? It could be that you have one of those GPUs affected by the
> original change and then we'd have to figure out what to do with that.

Lemme do the KASAN run you requested first. It is an old and slooow box,
the grandma. :-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
