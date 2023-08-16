Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 084A677DE49
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 12:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BED10E322;
	Wed, 16 Aug 2023 10:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793C710E322;
 Wed, 16 Aug 2023 10:14:36 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CA57240E0140; 
 Wed, 16 Aug 2023 10:14:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id NAfdHTaWTMfe; Wed, 16 Aug 2023 10:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1692180872; bh=/jqkabeqa2xpX4msrJ9nDrEwixGNYwvNlIatn/h8eC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YcUEqyQqEFahZHh4B2yxjp2TdD9a6MbGbEi35aBGD1zSKpCkOaya44OLruJx6B7xy
 3EUgPTrB8ItN5n/8yF4ICsLLUAAgnPTXRAlKvfNwuK20UYJRcLRj5YCAnW6zUDsh6Z
 ai+DCmdR22HW9upLvnBP6TfAXjm69eLG2gTGDHr8f1Pn/lE+8vyhez1mFZITzKZcFT
 VJiZz7MAul9eWS4XwPATwU6qUmtJcPbY5EppsqDEPhAUYeFaHf7wbiyMrZdczw9QDj
 dy795PFdR5hcow8wWhzpwNWQavgrP37i3uuxjoflzSlbrjAat4MvLTDCJ1p2DSVP2Y
 uW9MOJSLsqLiLBuWQOsPpQUuZCWoytITKxFyEMvEjCr7QdhxelFynO/dj0sK6z+cUs
 XgBkVdL2JBeJk/iBGfqp9xXjrI0D/Cp08FNy6ILZHQxu2vhvDoJqnp1cwvP8yU1cYr
 /Nai/WDyWABzYAFful816QEi49Mv+2woilYgHL8ohxfNr+GwY08tB8ghAWZzz4ciqR
 5cSITEgcaev7io5NYkZxUOpmmva/VQ0h0nDhQ8j8w2ad8n6LbudOwq2Sn+1BuKDghf
 lyLFxqCNm/nF/grJ10dxpZnQItJgWkZ8bxS+o6SGhYupj8ICSI9maz4AnQoJTp7uXn
 JQ6Ic+9ArdUdXY3u/m7VSNS0=
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 613C540E0193;
 Wed, 16 Aug 2023 10:14:25 +0000 (UTC)
Date: Wed, 16 Aug 2023 12:14:24 +0200
From: Borislav Petkov <bp@alien8.de>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp: fix use-after-free in error handling
 of nouveau_connector_create
Message-ID: <20230816101424.GGZNyhgP6GpqZx9xi3@fat_crate.local>
References: <20230814144933.3956959-1-kherbst@redhat.com>
 <20230816093015.GDZNyXJ28y9uspb4Mr@fat_crate.local>
 <CACO55tu8ab-rxCzxFXbUh4Z=W9E-1f8sH6BVd=P+16dQ9PQNjg@mail.gmail.com>
 <20230816100344.GEZNyfAIt0CJa+g6Sj@fat_crate.local>
 <20230816101157.GFZNyg7QARIL+io6m4@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230816101157.GFZNyg7QARIL+io6m4@fat_crate.local>
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

On Wed, Aug 16, 2023 at 12:11:57PM +0200, Borislav Petkov wrote:
> Does that help?

Btw, note that this is *plain* -rc5, without your patch.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
