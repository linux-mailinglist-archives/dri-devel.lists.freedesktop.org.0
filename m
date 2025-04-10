Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F7FA844C6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 15:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5903610E9C9;
	Thu, 10 Apr 2025 13:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="m21pi5dx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A37810E9B9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 13:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744291780;
 bh=bq0+zzz8gpCkI2u450fNXD8guqy8VI6lmKIFlJ5A+p0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m21pi5dxxrSSBXqvw+Lyd7FzPWHu0dX7/dlcX+47p4IGO66l6SB1QKoOMKaNlnbUR
 zT3YYOI7RlrudsfYWChxfDI0jBAS+Rql4G4oKBKcZDFBAs4iSd+lV+gk05ciJxNMgV
 e49f5OrWuWKC6NY4flQTg7zb0DT8hni0W/GsQOFONzp8tdYBLhUTsT+S5CRIEQDqVN
 WXSQKtDDxVdXaV68oTP5qblp+UezyrHwpDwO6usANbldLqF4d3NncM5hKlxceSO+i+
 Ixaf3UlAPBcCfdrLFeoGyKk09mvjM06Tpiomd3+bepcccUwd/PShLm2YIUjK8AuVt8
 SdlAShjaxYzPg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C566117E101A;
 Thu, 10 Apr 2025 15:29:39 +0200 (CEST)
Date: Thu, 10 Apr 2025 15:29:35 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/9] drm/panthor: Use 64-bit and poll register accessors
Message-ID: <20250410152935.25ba7255@collabora.com>
In-Reply-To: <d8fb496d-7bb3-42ad-8af7-200f393b4a73@arm.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
 <20250320111741.1937892-3-karunika.choo@arm.com>
 <20250321085306.0d79ec5d@collabora.com>
 <d8fb496d-7bb3-42ad-8af7-200f393b4a73@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Wed, 9 Apr 2025 14:07:20 +0100
Karunika Choo <karunika.choo@arm.com> wrote:

> On 21/03/2025 07:53, Boris Brezillon wrote:
> > On Thu, 20 Mar 2025 11:17:34 +0000
> > Karunika Choo <karunika.choo@arm.com> wrote:
> >   
> >> This patch updates Panthor to use the new 64-bit accessors and poll
> >> functions.  
> > 
> > nit: I don't think it makes sense to dissociate the introduction of the
> > new helpers and their use. Could we squash this patch into the previous
> > one?  
> 
> It was previously requested that I split the patches into two to ease
> review. I can merge it back into the previous one in v3.

Thanks. Could we also have that submitted in a separate patch, so we
can merge it while we're discussing the rest of the patch series?
