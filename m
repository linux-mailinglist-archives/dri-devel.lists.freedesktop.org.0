Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AC0BB7377
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 16:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B5D10E92A;
	Fri,  3 Oct 2025 14:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="PfAUnsuf";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="X8xWTx8W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0728710E12F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 14:42:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-fg8d.prod.antispam.mailspamprotection.com;
 s=arckey; t=1759502536; 
 b=neenuxwEfV3JjgPFITtNr3JMHNzAlYQbmXWuUwtjQfNvq/WA1OFB36LW6uBM3PEEeYRPnI05Ec
 u53UiwVcAOZsLZdUXvBpmUDpeQuxSSh1ioTMjfsWx8rSdHpLgUeNq93CIWL7vLdVdsm4ZlRqaD
 ANYt735z3lAxxtVMWIBh/IMVXuKVQDznLCsCDpFLML9/8/2YWH2RaICgByQ4nZHtL9geusT2o/
 2ts1/AHIy2bvs7hbhYm0+TH0dAJMKdCINbx8FYl4qyREh3OxLzN/SuHku91xvXh0/PQcNtkLkg
 ugZswg+Dit98695XUHKpDh/AFsBzBqNkBbfyqb7wJdXFJg==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-fg8d.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-fg8d.prod.antispam.mailspamprotection.com;
 s=arckey; t=1759502536; 
 bh=z5pWesQeBEu2tz3WESYSl81lA5ozGiJ2lIViR3AO4N8=;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:DKIM-Signature:DKIM-Signature;
 b=aCk7Hn5s6Q0fLbJ1L6SrvEeb5A7iSMbGyn1AIPObYY3jjwx5M4AeMk8wkPwOwnPX6VZAql4x4x
 h/ko7bK1tSm1pgbGLBGpt7R9zTsPj0B+zQfyD2mE+lep4hr8zsY1cdhIVU0O13cC/NFTaaF1Er
 AazFIAPcgEbjRp/JE4UnBdK/3zot4JvRpAACa6SfH6O7ttouaeyirVSvwBqR9xf//zk617mi/V
 ezBiczGqCVHAKlg+tS8oEHLkKsUzjFhERZmCtMMyi//ygdg9E/ATxkrDF0t7s3atiR/AJAGhQO
 appr89W8Sk+MNv8jbM/p60IqiO5UvaUifWjjFrDUyJ2WNw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Reply-To:List-Unsubscribe;
 bh=9xIOa3STLJfIfWlCx0nyVc0lcGQQgCGdRx9kH4nGS4k=; b=PfAUnsuf6f4KSjsg5KF75HYbBI
 ZI45XGVGTaFWTOtFru0c/D4ww8NZxml2sNxFlVAb0Qx3+iljxOCSbrS8aFCYb4l4ZYdkUhJ4r4jTZ
 O3FnI0Gdh93S6sh3ptiasDIUAN17F+jpaBG/SgxXRm8sFw+nxGGHHTLJleLFvTXcrRmE=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-fg8d.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1v4gz5-0000000C3Lq-3bb3
 for dri-devel@lists.freedesktop.org; Fri, 03 Oct 2025 14:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=9xIOa3STLJfIfWlCx0nyVc0lcGQQgCGdRx9kH4nGS4k=; b=X8xWTx8WTHrKuBU+R71bjKlABL
 KEcHl3O8rRc1w7t20kn3PL4HiO1b25Ovk5SDqpQKFYk4GIuwrsHL/XyiePmnNK8Aa/2PZszBNVbTp
 2mMu6Zb75tgN/5WjFg87+UnkVSS9Mt6A9Q05GODu7bgTMP6VDG2pt38zqpNnF6Hl9dWU=;
Received: from [87.16.13.60] (port=60027 helo=fedora-2.fritz.box)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1v4gyp-00000000ERx-0Fjt; Fri, 03 Oct 2025 14:41:55 +0000
From: Francesco Valla <francesco@valla.it>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/draw: fix color truncation in drm_draw_fill24
Date: Fri, 03 Oct 2025 16:41:54 +0200
Message-ID: <3881844.vuYhMxLoTh@fedora-2.fritz.box>
In-Reply-To: <70cbbf88-7c1e-44f4-8091-ee76944d2f6b@redhat.com>
References: <20251003-drm_draw_fill24_fix-v1-1-8fb7c1c2a893@valla.it>
 <70cbbf88-7c1e-44f4-8091-ee76944d2f6b@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 7d6809437680047ed37ab8089c2e1bc0
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1v4gz5-0000000C3Lq-3bb3-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-fg8d.prod.antispam.mailspamprotection.com; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
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

Hi Jocelyn,

On Friday, 3 October 2025 at 14:48:03 Jocelyn Falempe <jfalempe@redhat.com> wrote:
> On 10/3/25 12:33, Francesco Valla wrote:
> > The color parameter passed to drm_draw_fill24() was truncated to 16
> > bits, leading to an incorrect color drawn to the target iosys_map.
> > Fix this behavior, widening the parameter to 32 bits.
> > 
> Oh, you're right, my mistake.
> Did you find this by using a 24bit hardware, or by looking at the code?
> 
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Best regards,
> 

I am working on a graphical splash DRM client (which I hope I'll be
able to post soon) and testing it on a Beagleplay - which is
RG24-capable - I started to see a strange behavior with non-black
colors. After some investigation I found the cuplrit, and strangely
enough it wasn't me this time.

Best regards,

Francesco






