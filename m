Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EE1BC8E2B
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 13:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B0A10E9D4;
	Thu,  9 Oct 2025 11:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="D1dYW+iF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38FC10E9D4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 11:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760010349;
 bh=ydT5M4LU+rhLL79QpjncBuMwrnRWUgqtMFqnfSJgBRw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D1dYW+iFyJHdB/WD4vXVwQlfkHSZtxoPucqlTsL3NmAsg/U+0MDRzaxpt+hkytQk0
 i6JGmp5SurPLwdqlLCZgCmbimiplgLa0y+BgKtKJBNXXBD6B+laBPDTV9+6A3QbEi3
 pq9tJNTiRQokJ6uICuzIPRTChCx5b1RFg0ZfmJWRXLEk5N6mlwENoB0Yf/KRJLONRv
 IthPBSH9EYMqesv4Y2vNTFL/GJHLJg1xyfT+F+FRH64Ci0wHJVG0VN1UlhfmExplIQ
 6pqSfz6y/W9MqmzWdkKaIReMNrzChuyHR690AfCAp1gPEQGNlbj1O/9VxiYrQRhPZX
 hH8VbgLCMK1uA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 00A5F17E1060;
 Thu,  9 Oct 2025 13:45:48 +0200 (CEST)
Date: Thu, 9 Oct 2025 13:45:44 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Ketil Johnsen <ketil.johnsen@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Ensure MCU is disabled on suspend
Message-ID: <20251009134544.4502df0d@fedora>
In-Reply-To: <d526aaed-b29d-4e19-aab4-aa735282055e@arm.com>
References: <20251008105112.4077015-1-ketil.johnsen@arm.com>
 <d526aaed-b29d-4e19-aab4-aa735282055e@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 9 Oct 2025 11:29:14 +0100
Steven Price <steven.price@arm.com> wrote:

> On 08/10/2025 11:51, Ketil Johnsen wrote:
> > Currently the Panthor driver needs the GPU to be powered down
> > between suspend and resume. If this is not done, then the
> > MCU_CONTROL register will be preserved as AUTO, which again will
> > cause a premature FW boot on resume. The FW will go directly into
> > fatal state in this case.
> > 
> > This case needs to be handled as there is no guarantee that the
> > GPU will be powered down after the suspend callback on all platforms.
> > 
> > The fix is to call panthor_fw_stop() in "pre-reset" path to ensure
> > the MCU_CONTROL register is cleared (set DISABLE). This matches
> > well with the already existing call to panthor_fw_start() from the
> > "post-reset" path.
> > 
> > Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>  
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> Do we need a Fixes tag? Or is this only actually an issue on newer GPUs?

I think it'd be good to have a Fixes tag, if it's known to be the right
thing to do after a HALT, even if it's not needed on the GPUs currently
supported by this driver.
