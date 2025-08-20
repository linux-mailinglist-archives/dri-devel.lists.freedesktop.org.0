Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A03EFB2E066
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 17:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C97F10E779;
	Wed, 20 Aug 2025 15:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="NdroixU5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA51710E779;
 Wed, 20 Aug 2025 15:12:32 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1848F40E0194; 
 Wed, 20 Aug 2025 15:12:30 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
 reason="fail (body has been altered)"
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Z2tVUzpDWO-Q; Wed, 20 Aug 2025 15:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1755702744; bh=LGLZVRQ2NAELNhRDq0F4HuDey+l3OBeasKMqDuq1tH4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NdroixU596knSGcu5bna46ox+YRT3zlfEeUm7dbZgK4mYC1YsQrt8nUUvJyv1MgU0
 ueITnxqG8cjKcBzkVQv5XfjKaYZo9DXYD9wRLs167RNv6lOBlfiDxRDTdeicK6S6zV
 x87Fb2gMGT3I5vrbIOuCsuI7vBNRoeaYaUOco433exzXPdyxL9aBL5GvXp2AYGUazW
 9HsYka6JWQQXdax8jmRBCPCekBNohdPX5F3ODDasyxbW8bmjopEwxzB1l5pppdsXcT
 sk7bWHUwb5NQL7D+hhn5iZ5V1Ix5DtBaRvE1l+Fg/2c+597bxcRvpOGqPx5XtY2/Y7
 EZV5Iuznzd2mk2He0ET9iEAbUMnRcYtPuF2uayLbm1lZTohmAQyt6yDu+TygMvAPdj
 kKPFpZ/8rowHhV0Ku0r6kDWAP/v5/ePu8TwR61lN22arsH92hyIUlyQ5mSdhOKDfnk
 9HRDYlqMMd3rdWi4xF0b1aOWntuSoWJm612m9QA/36/FkT0rMs1NR7R84mRuyHwSZF
 4mYDwGieNj/gLlF2XBuKpu2WN/nOD7BkWX+rqjMrFlIrpA6NO3AWS9M9LODCsoV/Z3
 0P9ayedDn6xwlpDslePpbDIJpJD0EBawpSyknzYxTt2qDfM5ZSv6NaIRo06XGhnmot
 zgWb3gad5fDcK4GVa6pbjUAs=
Received: from zn.tnic (pd953092e.dip0.t-ipconnect.de [217.83.9.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9649240E0206;
 Wed, 20 Aug 2025 15:12:11 +0000 (UTC)
Date: Wed, 20 Aug 2025 17:12:05 +0200
From: Borislav Petkov <bp@alien8.de>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 x86@kernel.org, airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, david@redhat.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org
Subject: Re: [PATCH 3/3] drm/ttm: disable changing the global caching flags
 on newer AMD CPUs v2
Message-ID: <20250820151205.GJaKXlxVn3ZBsvBqLg@fat_crate.local>
References: <20250820143739.3422-1-christian.koenig@amd.com>
 <20250820143739.3422-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820143739.3422-4-christian.koenig@amd.com>
Content-Transfer-Encoding: quoted-printable
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

On Wed, Aug 20, 2025 at 04:33:13PM +0200, Christian K=C3=B6nig wrote:
> +#ifdef CONFIG_X86
> +	skip_caching_adjustment =3D
> +		(boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_AMD) &&
> +		static_cpu_has(X86_FEATURE_CLFLUSH);

cpu_feature_enabled()

> +#endif

I'd prefer if this would call a function in arch/x86/ which tests those
instead of using x86 artifacts in drivers.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
