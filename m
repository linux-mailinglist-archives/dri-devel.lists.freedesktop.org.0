Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECADB9949EA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 14:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD4910E4F3;
	Tue,  8 Oct 2024 12:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iUaNgy5o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1AD10E4ED;
 Tue,  8 Oct 2024 12:28:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 69851A40CED;
 Tue,  8 Oct 2024 12:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC28C4CECD;
 Tue,  8 Oct 2024 12:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728390518;
 bh=IP8ffe5Dzmmh5NHxdl4RiD92eKoxEaHlv8MBTGRIi7g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iUaNgy5o2y+iqGr73JqwFNvduRxX97hf0JVMebA1eaBxK5JtwJBQLbgh2L3OeyMGK
 O/9+tdeDMbOapnJT/kxdDhc0UiwA18ILVn/QHFZK1/N4QuNbnS/0ABGwPjHju6hR8x
 DSPhAbSJi+kumg/vtRdHHzmRelfgpOexIBTQEt+gCouEMLFqPkjeDEOMLQjbohjakT
 As8Mw/eB4Fat6Va4zRRJycsUt7YZ4jiVAB6KC5qsIqPFbNDKz5ihHyMKuOknSiFx52
 m9sfUdWMtFBNqlDgTzN6KsNepKZhCMU3nCm7y2MHU6VjLtZk9/yhRlaB5HBm9nhNGl
 x9usUaBSbZTdQ==
Date: Tue, 8 Oct 2024 14:28:33 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Yonatan Maman <ymaman@nvidia.com>
Cc: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, bskeggs@nvidia.com,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v4 0/2] drm/nouveau/dmem: Fix Vulnerability and Device
 Channels configuration
Message-ID: <ZwUlcWka1_CgXRyG@cassiopeiae>
References: <20241008115943.990286-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008115943.990286-1-ymaman@nvidia.com>
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

On Tue, Oct 08, 2024 at 02:59:41PM +0300, Yonatan Maman wrote:
> From: Yonatan Maman <Ymaman@Nvidia.com>
> 
> This patch series addresses two critical issues in the Nouveau driver
> related to device channels, error handling, and sensitive data leaks.
> 
> - Vulnerability in migrate_to_ram: The migrate_to_ram function might
>   return a dirty HIGH_USER page when a copy push command (FW channel)
>   fails, potentially exposing sensitive data and posing a security
>   risk. To mitigate this, the patch ensures the allocation of a non-dirty
>   (zero) page for the destination, preventing the return of a dirty page
>   and enhancing driver security in case of failure.
> 
> - Privileged Error in Copy Engine Channel: An error was observed when
>   the nouveau_dmem_copy_one function is executed, leading to a Host Copy
>   Engine Privileged error on channel 1. The patch resolves this by
>   adjusting the Copy Engine channel configuration to permit privileged
>   push commands, resolving the error.
> 
> Changes since V3:
> - Fixed version according to Danilo Krummrich's comments.
> 
> Yonatan Maman (2):
>   nouveau/dmem: Fix privileged error in copy engine channel
>   nouveau/dmem: Fix vulnerability in migrate_to_ram upon copy error

Applied to drm-misc-fixes, thanks!
