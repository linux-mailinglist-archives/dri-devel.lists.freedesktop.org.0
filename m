Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5A880F4CD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 18:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918DB10E1A0;
	Tue, 12 Dec 2023 17:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F6B10E1A0;
 Tue, 12 Dec 2023 17:42:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 412CECE1B01;
 Tue, 12 Dec 2023 17:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912EFC433C7;
 Tue, 12 Dec 2023 17:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702402975;
 bh=+h9Hy/o6qPUoywDyWEUPYa0LHvbEAwTr1e24Paq/tos=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lDcLxHelMIzPI8uabqZaj/J1ptw8Bbp3/fmYDq0ra7rMT0PeFkQ90OOZCAPFaUb6A
 Pf1xrFjFQDntjBJ4litDwDD96rI7P1hbXkHlQbxzfymZPaWqFcP3fJIKPQdbiwgy5V
 BZJhfu7qQSK2nEpGdAWBr/1DJIdxCNhkDvpMPJNKnZReAND+JosLQhQEoKLVyhjNHY
 7QQIjUTZ9p13DxnOVCRkam5wdQ9+3tPoCM9vtVV5SAZCsuMYJISitUvT7/vXsbJMJc
 Qmgwwdb2RgC0munn2yFEdl9n2A/m1gqB5rjiOmGfk/xWixe+wxrvaEF4X8ZUEXoRmv
 Bu4BZ7fKxNpRQ==
Date: Tue, 12 Dec 2023 09:42:52 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Message-ID: <20231212174252.ycztjhgyhtcrffur@treble>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <ZV2+f/yu3C6xTVqn@infradead.org>
 <6d4cecd5-9083-4d68-a7e2-266dae9e3952@sifive.com>
 <ZXgH6un2uLdjQ48X@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZXgH6un2uLdjQ48X@infradead.org>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Nicolas Schier <nicolas@fjasle.eu>, Will Deacon <will@kernel.org>,
 linux-kbuild@vger.kernel.org, Leo Li <sunpeng.li@amd.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Pan Xinhui <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alex Deucher <alexander.deucher@amd.com>,
 linuxppc-dev@lists.ozlabs.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 11, 2023 at 11:12:42PM -0800, Christoph Hellwig wrote:
> On Thu, Dec 07, 2023 at 10:49:53PM -0600, Samuel Holland wrote:
> > Actually tracking all possibly-FPU-tainted functions and their call sites is
> > probably possible, but a much larger task.
> 
> I think objtool should be able to do that reasonably easily, it already
> does it for checking section where userspace address access is enabled
> or not, which is very similar.

Yeah, that might be doable.  I can look into it.

-- 
Josh
