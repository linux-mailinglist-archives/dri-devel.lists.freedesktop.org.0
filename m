Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0636A3502D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 22:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3B810EBA9;
	Thu, 13 Feb 2025 21:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YJy2LAQb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A419410EBA6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 21:07:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 96B045C5A58;
 Thu, 13 Feb 2025 21:06:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70487C4CED1;
 Thu, 13 Feb 2025 21:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739480857;
 bh=TafgeYLB37luVrkS85uWHNNuJq8xdW6/RJc0El72wMo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YJy2LAQbyodyu4wy4pWNS45Qz6mC4wZlLuVDkX94l3VbK8m3WsLD+ng4WmkaSSKBm
 hJvS5qvDYTbN/RUdfEMgvr99IWFALh6UvqD7PtM2199k9Wn6HVID4iVT8HdPKCNi+2
 PbVddaPCoS21/BjPrM2761cr6WFCiblmgok0i4TOB0WpkxVvytG0LkuMOH+RZ6prQz
 SgJpJ1hvoqWcHG+ojLILZTgoZGHvSmkbRP2hDl2vwHBsMLC7CscdQW6y3ekmWSkdWp
 I5fGf1HDEhnhTHTmFoDss1XGkTtmKBnhju4sPjvV1DoKGTOt2AlaOwRJW++QnKcDn9
 guhXz42cDwq8g==
Date: Thu, 13 Feb 2025 21:07:33 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Haoyu Li <lihaoyu499@gmail.com>, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 chenyuan0y@gmail.com, zichenxie0106@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] drivers: video: backlight: Fix NULL Pointer Dereference
 in backlight_device_register()
Message-ID: <Z65fFRKgqk-33HXI@aspen.lan>
References: <20250130145228.96679-1-lihaoyu499@gmail.com>
 <87ldun6u5o.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldun6u5o.fsf@intel.com>
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

On Mon, Feb 03, 2025 at 03:21:23PM +0200, Jani Nikula wrote:
> On Thu, 30 Jan 2025, Haoyu Li <lihaoyu499@gmail.com> wrote:
> > In the function "wled_probe", the "wled->name" is dynamically allocated
> > (wled_probe -> wled_configure -> devm_kasprintf), which is possible
> > to be null.
> >
> > In the call trace: wled_probe -> devm_backlight_device_register
> > -> backlight_device_register, this "name" variable is directly
> > dereferenced without checking. We add a null-check statement.
> >
> > Fixes: f86b77583d88 ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
> > Signed-off-by: Haoyu Li <lihaoyu499@gmail.com>
> > Cc: stable@vger.kernel.org
>
> IMO whoever allocates should be responsible for checking NULL instead of
> passing NULL around and expecting everyone check their input for NULL.

Agreed. This should be fixed in at callsites.


Daniel.
