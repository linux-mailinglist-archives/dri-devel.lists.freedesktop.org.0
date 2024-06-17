Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EBB90BC86
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 23:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C2E10E10E;
	Mon, 17 Jun 2024 21:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="ZhM2AqyE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A0410E10E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 21:02:42 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 64DE540E021A; 
 Mon, 17 Jun 2024 21:02:39 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id NQ3WlfuETGmc; Mon, 17 Jun 2024 21:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1718658156; bh=9xpQOfZZA/mdg5w3/+ttfZjxJn4+6vAUkviGsraw77c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZhM2AqyErdDkMFRKVkIORNvSKlCtivkYQFjyDB9ZUwCfNMs6C6y+PgwIxLOGm76S7
 LawNB3jCh6kX2wqa8lDNIx6oM6jdKKC1tLUtmdKdAuyahTeysbO7eI+AaW2PT2dwUS
 dWpRbaXf3cPZba2QcNTDmREVegJRXw57zeLyLN/KF7dstLeNt4PGMu5vNvPatykl7F
 DaV1E6wnZx9yrEzOkMnMXBXvyb4M6f4M1YarnYGIvc/UE1Y03V1pwYDlRxc4Fakhv9
 bIr3bTDkzgxihiWrAxwXnSmv8j9xBnl6iaUZ5AXizwiNBy+Q1+FwbOPJLQXCsX69t1
 c2cLcpjnnQOBTDKBEdPGrvTWNvekcKKdxcdEUaUiDBgQWAUPeb4qlZFLLTfV5rBuzg
 RGx+YxRsGUpEqNhZr0Ow+pAFfaaeTGZPNi/shvduRiszO37dmRD5g+qrpLOa7U3/qp
 iOXX/D+CCfQo/pgRxX7ZLL87FMdePu2RjI8gEkIpOvpFJfaQOL4eiha2m4pvvQOrai
 X15nYtZHrgsrZrCkxdapoSMxBOFIEufFl96219+0KGXvca6Ry4Jy9fqinHT3/Mmhye
 8e+mR8Kiv7S888osVRVbqkR7WoU4IXscZ/TsTAgVgmunMxR0IK/C+HM1NyjMSWfRE1
 OHgqvol/Ffe9cSe4s6F5IbXk=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0372F40E0185;
 Mon, 17 Jun 2024 21:02:15 +0000 (UTC)
Date: Mon, 17 Jun 2024 23:02:08 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 lkp@intel.com, zack.rusin@broadcom.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, linux-iio@vger.kernel.org,
 jic23@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 dragos.bogdan@analog.com, anshulusr@gmail.com,
 andrea.collamati@gmail.com, oe-kbuild-all@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH 2/2] iio: dac: Fix dependencies of AD9739A
Message-ID: <20240617210208.GJZnCkUIsiXmaQxxPE@fat_crate.local>
References: <202406152104.FxakP1MB-lkp@intel.com>
 <20240616012511.198243-1-alexey.makhalov@broadcom.com>
 <20240616012511.198243-2-alexey.makhalov@broadcom.com>
 <20240617090428.GBZm_8HMQ9XJe_VQga@fat_crate.local>
 <19e8a6dd-b0d4-4e88-9ad2-e38787a5aee8@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <19e8a6dd-b0d4-4e88-9ad2-e38787a5aee8@broadcom.com>
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

On Mon, Jun 17, 2024 at 01:48:38PM -0700, Alexey Makhalov wrote:
> > Don't get discouraged, though, when fixing something that is not in our
> > immediate area of interest!
> > 
> > :-)
>
> Lesson learned and noted for next time to address only related/new warnings
> and errors. Thanks!

I actually meant the exact opposite. :-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
