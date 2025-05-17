Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E662EABA88B
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 08:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412C910E0FF;
	Sat, 17 May 2025 06:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qvlrmp44";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA5E10E0FF
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 06:48:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CF7E7A4DF6B;
 Sat, 17 May 2025 06:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36998C4CEE3;
 Sat, 17 May 2025 06:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747464488;
 bh=Xw1uOWDTS8cJfWEwczX8etpCdiQEsuEKHcfBPRVFTtc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qvlrmp44LmwgRqENA39Oze/Bs+R2hEqseN6xlQcGTPbJlAys5KH5cdds5dga/aIbY
 9FpW972Osi42vO9/SO6P1k+o0uma5cdC99pKTIdpavNEeWezfKsIAMxMOEvj2Wl0Lq
 a8o9hbrnG0vHm/VaLx0lgHBA8iUSbd9oh9LvuHVvVAQfk50Dvyt3kuPBQiWMU49buG
 bjoYQ2UaVCuTDQI6L8OlAmhG3R4BDHfMIZ7d2nKcKjwhY7Zzn/4jr99k0srAbCzzlG
 wE/xZOmP1Y5Mjls4y9tCp9ie7LnDy8WTfyDgME4ecKDn5GRRm8RokWBVW3WlHs/Alj
 K5n5sXFHvWLzQ==
Date: Sat, 17 May 2025 08:47:46 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zheyun Shen <szy0127@sjtu.edu.cn>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Kevin Loughlin <kevinloughlin@google.com>,
 Kai Huang <kai.huang@intel.com>, Mingwei Zhang <mizhang@google.com>
Subject: Re: [PATCH v2 3/8] x86, lib: Drop the unused return value from
 wbinvd_on_all_cpus()
Message-ID: <aCgxEhLBLIK-qq11@gmail.com>
References: <20250516212833.2544737-1-seanjc@google.com>
 <20250516212833.2544737-4-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516212833.2544737-4-seanjc@google.com>
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


* Sean Christopherson <seanjc@google.com> wrote:

> Drop wbinvd_on_all_cpus()'s return value; both the "real" version and the
> stub always return '0', and none of the callers check the return.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/smp.h | 5 ++---
>  arch/x86/lib/cache-smp.c   | 3 +--
>  2 files changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
