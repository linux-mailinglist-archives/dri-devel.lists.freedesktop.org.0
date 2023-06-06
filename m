Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D328C724A8A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 19:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3B110E396;
	Tue,  6 Jun 2023 17:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A8410E24C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 17:49:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126253223039.31.openmobile.ne.jp
 [126.253.223.39])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7C302BC;
 Tue,  6 Jun 2023 19:49:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686073746;
 bh=Wfzm05QKSXtSKpr/M7q7S0IxtecYSBK8fJ2Y6B5EI7Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ErqSfbfjEHkyXpnZVELPiDZOlZyVabpXFU9jTgUvAiAhE/M4elDW2I3AbLNTQuH1R
 FE/c6zTs01+nxiplb53owhiULMhkkLKdDMEBa8v9U7i+P0b7oorHQ4+1CCDkHbsg6O
 9U5MflNUkJW5dtTI56XnnZ0WPEoeS4Sr4R5Cp7lk=
Date: Tue, 6 Jun 2023 20:49:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v9 0/8] drm: Remove usage of deprecated DRM_* macros
Message-ID: <20230606174928.GB14101@pendragon.ideasonboard.com>
References: <cover.1686047727.git.code@siddh.me>
 <20230606150545.GJ5197@pendragon.ideasonboard.com>
 <18891c17458.393a54b1127185.1502341592143085000@siddh.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <18891c17458.393a54b1127185.1502341592143085000@siddh.me>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 06, 2023 at 10:59:14PM +0530, Siddh Raman Pant wrote:
> On Tue, 06 Jun 2023 20:35:45 +0530, Laurent Pinchart wrote:
> > This is a nice series, thank you for working on that.
> > 
> > Now that the deprecated macros are used in drivers only, would it make
> > sense to move them to a drm_print_deprecated.h header, to make sure no
> > new driver uses them ?
> 
> Sure, but then should that header be included wherever drm_print.h is
> included with a find and replace, to avoid breakage?

The idea would be to include the drm_print_deprecated.h header in
drivers that still use the deprecated macros.

> Not every file can be seen at a case-by-case basis or by coccinelle
> as far as I understand its usage. Consider the following:
> 
> DRM_INFO is used on line 210 of amd/amdgpu/amdgpu_acpi.c, but the
> file does not even include drm_print.h directly. It includes the
> amdgpu.h header, which includes the amdgpu_ring.h header, which
> finally has the "#include <drm/drm_print.h>" line.
> 
> If a simple find and replace has to be done, then that can be added
> at the end of the series.

Maybe a simple grep for the deprecated macros would be enough to
identify all the files that still use them ?

-- 
Regards,

Laurent Pinchart
