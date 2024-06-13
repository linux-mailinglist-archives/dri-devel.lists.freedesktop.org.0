Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B15906622
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 10:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A907510E98A;
	Thu, 13 Jun 2024 08:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="f/V7kgni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9769810E98A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 08:04:14 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3393040E0176; 
 Thu, 13 Jun 2024 08:04:12 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id h8uzvgyUn1Zb; Thu, 13 Jun 2024 08:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1718265849; bh=CXGamu8jKIXOAZLQQMPeCyqZUI6y95bTPViTuHGstrM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f/V7kgni8MqGhgjd1en6uOEtdwzlwB8Q2ophMmCKYH0x0BIGKhGrf/U4tDU9Z+r+E
 GFxFwsCFd2CbJH/BbvPS8WZdwaguKOG4tIAsK8qhJ3VGp2xYore3f+/v/Nr8NHd10J
 CcH5j9ouqky30cO9L4BjtaNSLT+i0+5nmHw65zm5kgj5Xjcn8aHAadAFy99Hyu37pt
 /o6us2VJ1Pj89anyKx9T2oT0x3gdYWab14MxsnCgCQBxNo7DFpfM6o4uKhEt/PpCs6
 krh3bqaLuyoVyYn9PI6aUMm+VCmPu/fnQJ8acvH418iRp6fcsshmpfOarlpb15Ipea
 KYtRwriJfgWFy2MGOSzhozF9cN/v4vMUwodLQ3++rdBOdhVbO29ZqVrjT8h7vNTbkf
 GgrldhecCOfOR+1Z7LvEunSZBbdxu4kvABVAHSlegdY98TsPKc/xAdNeJKSDrJGLbq
 A0DfJJhxhbfzS/v0mvPbqwHxdj7fBST5Da98BEDg0Xi2BDehXtFDIQuUSmmBXH0YTC
 D/R6ZlcnBKeN1TXRKe/2ZXkKn7eLsmVmX3Jhh04A+tyEQLOc3ZQOwBCFnZuR7jNMB3
 yCY2zCE6SPnQ7fdp3OHyaBEH7Do63qUZc0gjRzJwC8PLe9HmsE1jXBkP/fYk3oMRae
 Jvme4X2fj40CBrvKXHkfzjgM=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B125E40E00C9;
 Thu, 13 Jun 2024 08:03:43 +0000 (UTC)
Date: Thu, 13 Jun 2024 10:03:35 +0200
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
 kirill.shutemov@linux.intel.com
Subject: Re: [PATCH v11 1/8] x86/vmware: Introduce VMware hypercall API
Message-ID: <20240613080335.GBZmqn12gqzWlNZHGH@fat_crate.local>
References: <3d6ec46c-53c2-4a13-90ff-eb419863c1d5@broadcom.com>
 <20240606232334.41384-1-alexey.makhalov@broadcom.com>
 <d366491d-2f5b-478c-8968-b0a3a298827c@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d366491d-2f5b-478c-8968-b0a3a298827c@broadcom.com>
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

On Wed, Jun 12, 2024 at 03:11:54PM -0700, Alexey Makhalov wrote:
> Borislav, please review v11 implementation of 1/8 based on your proposal.
> I'm waiting for your feedback before sending full v11 patchset.

Sorry about that - -ETOOMUCHEMAIL. :-(

Yeah, that patch looks all good and regular now, and at a quick glance you know
what's what. I think that's definitely better than what you started with. :-)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
