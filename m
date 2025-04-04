Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89C7A7C2F1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 19:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2BA10E0BB;
	Fri,  4 Apr 2025 17:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iQbfPOV2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C7510E034;
 Fri,  4 Apr 2025 17:55:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 328C9449AA;
 Fri,  4 Apr 2025 17:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9496CC4CEDD;
 Fri,  4 Apr 2025 17:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743789335;
 bh=y81hsvWpcMygSSeD/o27kW/3ofvl2OosCdgnUINzV/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iQbfPOV2VrpCK3DthCv1lI95Jku1N1dLQvaPpKbP8GiWZQRN4OgBApEXXQrPw0wO8
 CdiZH1mDBH5EF/WUZzpRcqzoS2r/wEm04+F4l9WVljE/Bp/2a8hIg1duxdeztimOLa
 A8vEnS3V6pjtQ41h3ln7lRdZGlg/BVNWM/avMwqSIRzBIszDfk5VnMbhL3jg9Df4+0
 jTNrh9/waebAbXWmYwujwsh2hA3ZF81ts2//OnhIcVw94PbshJcSKdhxWKtnS7Bo/z
 y7v2ETT3Kcn/Ur9wp1O10x6yz1oK1S2J4qoLqbj7u+xNeGrbbNrB9rNxo81yeBZzhi
 qM9Y5WeU7nxhQ==
Date: Fri, 4 Apr 2025 10:55:32 -0700
From: Kees Cook <kees@kernel.org>
To: Harish Chegondi <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org, ashutosh.dixit@intel.com,
 james.ausmus@intel.com, felix.j.degrood@intel.com,
 matthew.olson@intel.com, shubham.kumar@intel.com,
 joshua.santosh.ranjan@intel.com, lucas.demarchi@intel.com,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v12 2/8] drm/xe/uapi: Introduce API for EU stall sampling
Message-ID: <202504041051.CF3111DD@keescook>
References: <cover.1740533885.git.harish.chegondi@intel.com>
 <bb707a27975c33e4a912b9839b023acb7a1f9c90.1740533885.git.harish.chegondi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb707a27975c33e4a912b9839b023acb7a1f9c90.1740533885.git.harish.chegondi@intel.com>
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

On Tue, Feb 25, 2025 at 05:47:06PM -0800, Harish Chegondi wrote:
> +static int xe_eu_stall_user_ext_set_property(struct xe_device *xe, u64 extension,
> +					     struct eu_stall_open_properties *props)
> +{
> +	u64 __user *address = u64_to_user_ptr(extension);
> +	struct drm_xe_ext_set_property ext;
> +	int err;
> +	u32 idx;
> +
> +	err = __copy_from_user(&ext, address, sizeof(ext));

Why is this safe? (i.e. why is it not copy_from_user()?) I see no
access_ok() check anywhere in the ioctl call path to this function.

-- 
Kees Cook
