Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED63413C86
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 23:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF2B6E82A;
	Tue, 21 Sep 2021 21:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7A06E82C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 21:34:02 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id y28so3389096lfb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 14:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=onYH57UKgRX2y9FA652B6Jil/Y6sRo6kbtM4byaxFbk=;
 b=eBVF3W3VBl8/Kcc3edgbmiaMz5aGtiFcsghvZhSejZhbmeEyK5UQw/1PFkiQyXYHaG
 ep1Qe79XGKoddakjbluJzSSdU6e7ItIa/VyOBVU9ai0Bymzz3iDJtyFjRD39EIPM25vz
 4qz0qSZamNXJd68fq5IJpTDDpau43+mSfg2XWhoKoGxbOFiuRtiRYE7GfxGmSUDaHEJg
 E7kAQREHoi4We6KjgT1K6PZUTHBzzEa/WGaKq/wElm+NwA9Dj3BI08sAZJBTPlkJn2D7
 eFgy10WdV1zv/1WS3CBekNlpT18oJkYC++DPHzSZnogr5FAXrL71q6vwYz/oJyJkBY1z
 HMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=onYH57UKgRX2y9FA652B6Jil/Y6sRo6kbtM4byaxFbk=;
 b=bvTH4Mjx3vr2lwELYZ06hFrcUY3HpOkH4mKFU3gbpb9ucCS6SbH0gPNZU5CP3bQEth
 JaZVLQp/HRTadM1MORyTT9V1TgN7wEsOHiUJ9CkTgDwj3NgaMoOePo4xeEli6K4e35oR
 cDVA2MLyc9S7wRdBm3sokknI5/xw9lEfuTjmwd6cypG6l0XoL2P2MOonFgn7EFHyBu3F
 f2eN9JEKW5+nYoS4fdlgPWbbquCmdgK/4qvAZmbZ/0aXtW0O9U09+VrmUWk5ZkQCUoMS
 HJb0R226XhXaldlajCzkXBo49u+2pvRADl7ytdD66wV7kgMnxxou7rYRHwsI2IbJuFN7
 jCUg==
X-Gm-Message-State: AOAM532rFEBcpu++WZ4drUgvD7aPq9Po9/pNK59yauZAayWjAXlFxrno
 orWueV8Wbk2GjaQFzASoHendIA==
X-Google-Smtp-Source: ABdhPJwdW58yGabAJZgobn6vaDrfqJrmQRLjEbi4LByZcJNYEBlALvg49HirVUieAeO4lwAN455DSA==
X-Received: by 2002:a05:6512:3096:: with SMTP id
 z22mr19350411lfd.167.1632260040535; 
 Tue, 21 Sep 2021 14:34:00 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id t14sm16618lfp.15.2021.09.21.14.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 14:34:00 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 3890410305C; Wed, 22 Sep 2021 00:34:01 +0300 (+03)
Date: Wed, 22 Sep 2021 00:34:01 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Borislav Petkov <bp@alien8.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, iommu@lists.linux-foundation.org,
 kvm@vger.kernel.org, linux-efi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Andi Kleen <ak@linux.intel.com>,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Christoph Hellwig <hch@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 5/8] x86/sme: Replace occurrences of sme_active() with
 cc_platform_has()
Message-ID: <20210921213401.i2pzaotgjvn4efgg@box.shutemov.name>
References: <cover.1631141919.git.thomas.lendacky@amd.com>
 <367624d43d35d61d5c97a8b289d9ddae223636e9.1631141919.git.thomas.lendacky@amd.com>
 <20210920192341.maue7db4lcbdn46x@box.shutemov.name>
 <77df37e1-0496-aed5-fd1d-302180f1edeb@amd.com>
 <YUoao0LlqQ6+uBrq@zn.tnic>
 <20210921212059.wwlytlmxoft4cdth@box.shutemov.name>
 <YUpONYwM4dQXAOJr@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUpONYwM4dQXAOJr@zn.tnic>
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

On Tue, Sep 21, 2021 at 11:27:17PM +0200, Borislav Petkov wrote:
> On Wed, Sep 22, 2021 at 12:20:59AM +0300, Kirill A. Shutemov wrote:
> > I still believe calling cc_platform_has() from __startup_64() is totally
> > broken as it lacks proper wrapping while accessing global variables.
> 
> Well, one of the issues on the AMD side was using boot_cpu_data too
> early and the Intel side uses it too. Can you replace those checks with
> is_tdx_guest() or whatever was the helper's name which would check
> whether the the kernel is running as a TDX guest, and see if that helps?

There's no need in Intel check this early. Only AMD need it. Maybe just
opencode them?

-- 
 Kirill A. Shutemov
