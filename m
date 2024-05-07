Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162108BDDDA
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 11:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0F110F263;
	Tue,  7 May 2024 09:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="Dqbd9DaC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DD110F263
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 09:15:03 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5B0DF40E024C; 
 Tue,  7 May 2024 09:15:00 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id t-Ir9M_E86JN; Tue,  7 May 2024 09:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1715073296; bh=hA/EMMoeb0yie87OtKrLxzw3vDjsbX8N+BD3HDiz4bA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dqbd9DaChjaUs6Gf5ijBOtLj75ALUwFjP33YhDNe96oth7dWvkwSAEYC6w6/7goFD
 rF3sHKacblkoCoAaw6E4bRh3zB+G4kCZz2QRn44ov6MB23bLu6TqDs8OhiBMpFM9R8
 Tj6zCtBBQvudwFAgI3aqf2cZwmsCXLPds2SHZ4BG1jM4M01Gu+iid4/l3HDXXImTBx
 DaXGgVxur9yr4aq4+EqVrAkRD0wJ9foGFlKI1QpGnyT96/cRqGdHK+Nkns/sSW3EAt
 8hlAB886/1B5el3/zg+9MNf7KFK8o7v+ELDYRiIkLGGF5quh5mwvpgeFhgg87u8MFL
 ibZuTFuEUuIXPhmi3tzmJbxBX2O3reR7H9KHSqMIS8EQ8/XlMTe3QdoQSwxjvsSG/7
 NzriVHS6gNn1dad88kcY/bvtdRBAqCkPXaKaac5PnYYlFifKw7yjclffpi4vRBZx5t
 /6mo3hw1y2IE/5s3v7fgK0ts97gSdfiTveDHo+40CnpQRPdGfNcU9wivREWdmbRJb1
 9qCYczwdKUNfw1OqL8AhCa33w6OE2cOtJpiAkXA0kP5OkrBqJGTJx/inq43sk/WRKo
 VxIym094m9x2zxhcJciuWm7sQy1cB12gsVF6jEAnmOnAI/tWEqSflNX7C88meKZuzw
 eF3nqOHBWbG+ACJ+MBC682cU=
Received: from zn.tnic (pd953020b.dip0.t-ipconnect.de [217.83.2.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0A3C340E0249;
 Tue,  7 May 2024 09:14:30 +0000 (UTC)
Date: Tue, 7 May 2024 11:14:24 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de, x86@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-input@vger.kernel.org,
 dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 timothym@vmware.com, akaher@vmware.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com, Nadav Amit <nadav.amit@gmail.com>
Subject: Re: [PATCH v9 1/8] x86/vmware: Move common macros to vmware.h
Message-ID: <20240507091424.GUZjnw8ErpQT6XJLVM@fat_crate.local>
References: <20240505182829.GBZjfPzeEijTsBUth5@fat_crate.local>
 <20240506215305.30756-1-alexey.makhalov@broadcom.com>
 <20240506215305.30756-2-alexey.makhalov@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240506215305.30756-2-alexey.makhalov@broadcom.com>
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

On Mon, May 06, 2024 at 02:52:58PM -0700, Alexey Makhalov wrote:
> +#define VMWARE_HYPERVISOR_PORT		0x5658
> +#define VMWARE_HYPERVISOR_PORT_HB	(VMWARE_HYPERVISOR_PORT | \
> +					 VMWARE_HYPERVISOR_HB)

You can't help yourself not sneaking in any changes which are not code
movement, can ya?

The purpose of a sole code movement patch is to ease the review. Not to
have to look at the code movement *and* some *additional* changes which
you've done in-flight. Just because you felt like it. But which is nasty
to review.

Maybe you'll understand that better when you get to review someone
else's patch which does crap like that.

Make sure you remember that in the future, when sending patches.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
