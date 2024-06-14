Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 027C69092D5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 21:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9C210E077;
	Fri, 14 Jun 2024 19:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="GMMByZxo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752A510EE46
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 19:10:37 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 48A8B40E019F; 
 Fri, 14 Jun 2024 19:10:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id B5wNnYZxtOcc; Fri, 14 Jun 2024 19:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1718392229; bh=YHoeX2aqNxFOwawwQ+u5gyShZuN1d3XKK09wgoJEq6M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GMMByZxogyqO6iERv7yE9B7Z+yBq6IlzYQqdEj+amC/+SOkkItb2DuZlWjCQQ1A6s
 4j1l3t+xWiBaOYtb1Al3DKaXwLYbfyEbq6vBOtibH3OjF/V7yrzolInVRgYc6AMYy1
 BPfOWGzHMmCGjmKpE0fwq2kvxt7ITrQ/CDLbpRlMGaITjvpc+cooDPh4hjbqbMARrc
 T4DqEw1jIwN+zP3q3iz6jK8lSCUkBVd4JFPnoznFFEx6V6rgfTNHC1Ya6hHOUYGerP
 Q57jaD74y8ePgm4lOTLR9TCHMjDaPmM9uRYgNmLuU2eqAARF8vX616Ujz3wAGfTyLK
 E5TZmCp7aCUmazqXGtQAwE+0xxALHZCoDv6pF+a2uN51Q4JxwqAoDfQkYnKnmIFS9l
 JbITCJLj6U7tSyrhVqRPatVQdvVLoBchGuxljqYuJp/zNW1N/n4Tyl8JZ69yyB8x6X
 y7ExtB5sc/1Hloa/p/JGAzXdGa1U1IPFlhzn+MEU+X3B9NhLEA+LwX3NZkWNOD9Tgx
 8jPMEICeHzymu5qZSHKHGkpJgHRXvfor9d6MR4pvbBpgpuLFWoDj0Aug+D84BzZaRp
 WveoTopHFukaDU9dgrasYcIpVsvYEHREkHgYfbe7KMFFdmpwiyvBPlihqjieXCpD+g
 kAdmvYhHy+8dVwGMXIAmsTHo=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6B90C40E00C9;
 Fri, 14 Jun 2024 19:10:02 +0000 (UTC)
Date: Fri, 14 Jun 2024 21:09:56 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, hpa@zytor.com,
 dave.hansen@linux.intel.com, mingo@redhat.com, tglx@linutronix.de,
 x86@kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
 zackr@vmware.com, linux-graphics-maintainer@vmware.com,
 pv-drivers@vmware.com, timothym@vmware.com, akaher@vmware.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com,
 Tim Merrifield <tim.merrifield@broadcom.com>
Subject: Re: [PATCH v11 8/8] x86/vmware: Add TDX hypercall support
Message-ID: <20240614190956.GFZmyVhLGeyLjwvA6X@fat_crate.local>
References: <20240613191650.9913-1-alexey.makhalov@broadcom.com>
 <20240613191650.9913-9-alexey.makhalov@broadcom.com>
 <844ef200-aabe-4497-85c9-44fc46c9133a@intel.com>
 <20240614161404.GCZmxsTNLSoYTqoRoj@fat_crate.local>
 <74f8300b-3520-4824-81e3-71464e3da3b6@intel.com>
 <1750e44f-f9a9-4c2a-afb3-f1ae8237ccb0@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1750e44f-f9a9-4c2a-afb3-f1ae8237ccb0@broadcom.com>
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

On Fri, Jun 14, 2024 at 11:32:16AM -0700, Alexey Makhalov wrote:
> 
> 
> On 6/14/24 9:19 AM, Dave Hansen wrote:
> > On 6/14/24 09:14, Borislav Petkov wrote:
> > > On Fri, Jun 14, 2024 at 09:03:22AM -0700, Dave Hansen wrote:
> > ...
> > > > You need to zero out all of 'args' somehow.
> > > 
> > > You mean like this:
> > > 
> > > 	struct tdx_module_args args = {};
> > > 
> > > ?
> > 
> > Yes, or do all the assignments with the initializer.  We seem to do it
> > both ways, so whatever works.
> 
> Thanks Dave for pointing that out. I missed that at v7.

Ok, I'll fold this struct initialization oneliner into the last patch.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
