Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA7477F1DE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 10:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF4B10E40A;
	Thu, 17 Aug 2023 08:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E1110E40A;
 Thu, 17 Aug 2023 08:10:52 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3A41E40E0198; 
 Thu, 17 Aug 2023 08:10:50 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dsaLMhCIx1WX; Thu, 17 Aug 2023 08:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1692259846; bh=KosVJk9TqczkP8Tl2l3dW2XQ5WUolMhM7fcHi7ojzPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PU5ypwRfFRuvhSlxCMQUekpfoB5WweTKuJm0mBQoPMOQWdP4n0S9YrfgpFjmKuk1P
 QWNXdhccvBmrtDS8jXal1WRQ6Cs6ARpOOtfRuyO8bSmMRLWlJYmAWF/EKLPgsOov8s
 ESaeKMmD/bIe5sQkfrJ4IaDthABIwkc1h+ow5MIZoCmegbEadDfll65SI80znjUSRT
 aaUtq6C/eRKqayz7C+4hl0cySihMGitBO03J9Eh9pvrauJJRvRCKlL7weImJu+nImm
 tdqMkMVhK/ajM/RTvuEPMryu+LAR+ZfpxRaxWc/VE8L0pcbCL0ujTzZ2xTngCtnWfp
 BEOB3tCNijR+xS6C1XF5YLhNmGAWtVFitaSiCoq533MC/U/mm8oMyyR/nbquY0BJGu
 JB/cfcqAplTAsvaJHEgUmboiXtHcoZ01qJABEGFca8FEtrO/Vqx3fLFnHF8bz9II+a
 ZkpldKqr9hYrjN84jg2IjvzZ9EPw04f3odYZq6pghCoJPjwqG9DcXGoKoCEeSLKly1
 neUnP07G1Qh5UeawHGCrMz8Gr0BUzcDtXjC8FP0mFNcnvDyTEEJm/Ta33/T/af/4uN
 /pkmFrLYGksUf8qL0Y9wwnQZObCJ/scvWds7wCM+ttEmamootGP4i8yb0mepHSh1lm
 Mb1flELPwQJNd3aXYSOP+ngc=
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4B8E340E0140;
 Thu, 17 Aug 2023 08:10:39 +0000 (UTC)
Date: Thu, 17 Aug 2023 10:10:32 +0200
From: Borislav Petkov <bp@alien8.de>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp: fix use-after-free in error handling
 of nouveau_connector_create
Message-ID: <20230817081032.GAZN3V+NQ1blzQC2sU@fat_crate.local>
References: <20230814144933.3956959-1-kherbst@redhat.com>
 <20230816093015.GDZNyXJ28y9uspb4Mr@fat_crate.local>
 <CACO55tu8ab-rxCzxFXbUh4Z=W9E-1f8sH6BVd=P+16dQ9PQNjg@mail.gmail.com>
 <20230816145338.GIZNzi8o3d9x9bcPzX@fat_crate.local>
 <CACO55ttasKLxBTmZjN-XBOuJFC7rng2PbLgxCT8WT6ukOZNGzQ@mail.gmail.com>
 <20230816151252.GKZNzndDNySuWC+Vwz@fat_crate.local>
 <CACO55tunC5mEu3Tw64rKLqNM6MN6d=N90kYQKYwXWNMB=ahDaw@mail.gmail.com>
 <20230816221353.GXZN1KIXloRn8cGt5E@fat_crate.local>
 <CACO55ts7430tAUDC+0qY0EZ5ReO=2Rjwj1SzHaBLodmyBgrUrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACO55ts7430tAUDC+0qY0EZ5ReO=2Rjwj1SzHaBLodmyBgrUrw@mail.gmail.com>
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

On Thu, Aug 17, 2023 at 01:18:12AM +0200, Karol Herbst wrote:
> do you have one of these? https://en.wikipedia.org/wiki/DMS-59

Ah, DMS == Dual Monitor Solution :-)

Yap, that's exactly what the GPU has. And the Y-cable is 2xDVI. It is
a Dell workstation and it came this way, meaning I haven't done any
changes there.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
