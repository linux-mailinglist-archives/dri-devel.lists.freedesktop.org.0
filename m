Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C46330F1ED
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 12:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014676ED42;
	Thu,  4 Feb 2021 11:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106086ED16
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 10:45:01 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DWZtr4RvTz9sXV;
 Thu,  4 Feb 2021 21:44:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612435496;
 bh=7gUDiKUJsUlnyL1hzNVaMIZFOrtzUH+RnQewMgPBJXA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aeithg5XbYtGR3+3M0J2fWWh+BH4YzO0m/tpovXY4JTNI34gGy0ZFPKzi6lAxzbdt
 p4lAuxnwJYSnrDXZnLVdsh8F0iA2jhQ4lDRw7p1Ocl/U6Q0wMnDs23z3/QrU4Q+lno
 vB6Wm/ETnQGaQPRkmOAk+Cg4eN2q25qRCTLtm9IPEiw22Jg7kttOdCnyq2xIB3d3Mu
 W6uJuZIKbssUj6v53+5imSR9JR3l28/X1jC6TANDAQeGIAHjg+1q4qg9hrQPw8eQ5U
 eF+le40oSyflT3D2CclEO5XCqDqyoXIurBtwcjRAc2Wf+Tc0nSes3mnm+UAEcPnkf7
 5fFb3xrUGnKIQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christoph Hellwig <hch@lst.de>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jessica Yu <jeyu@kernel.org>, Josh
 Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>, Miroslav
 Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>
Subject: Re: [PATCH 01/13] powerpc/powernv: remove get_cxl_module
In-Reply-To: <20210202121334.1361503-2-hch@lst.de>
References: <20210202121334.1361503-1-hch@lst.de>
 <20210202121334.1361503-2-hch@lst.de>
Date: Thu, 04 Feb 2021 21:44:51 +1100
Message-ID: <87h7msp0ws.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Feb 2021 11:20:51 +0000
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, live-patching@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Christoph Hellwig <hch@lst.de> writes:
> The static inline get_cxl_module function is entirely unused since commit
> 8bf6b91a5125a ("Revert "powerpc/powernv: Add support for the cxl kernel
> api on the real phb"), so remove it.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/pci-cxl.c | 22 ----------------------
>  1 file changed, 22 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
