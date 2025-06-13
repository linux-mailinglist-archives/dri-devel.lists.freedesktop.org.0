Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C41AD91C9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 17:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E186810EA1D;
	Fri, 13 Jun 2025 15:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vIEs58QW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6464F10EA1C;
 Fri, 13 Jun 2025 15:46:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 91AEC435FC;
 Fri, 13 Jun 2025 15:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED9AC4CEE3;
 Fri, 13 Jun 2025 15:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749829563;
 bh=nOgmaHF835CDydrDSXIMKjIVAD7R+qO1Y1v6X7VmPQA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vIEs58QWwvNcIIydKfkw6Bd+qZ+i+hMIXPj7yGbY/Xdjtc7OQS3/PSG1p8PTuZpAQ
 ee5oIJmeaLLOSAQfH468TYuvNid4UI9HzxO8KAy3M0/09d2t3H+ubMHpEEaOGVlIQb
 daEZm9/oR2C8Rms+ZwNWU0rdGPFGgMcTFlpq/rwctLhtKzPHlfsxuWotMeeKd0fdPj
 n17B2pqpXRoNc7jhvBSv2dpqSAqCLe6jWwD7DdiqEAtLA5477tW2EZiptxnpdGsJOa
 S4MQ4H5h9kv51T32Di/Vtj3NomyGUWLRd/abvXCxpHOGYvcEnPJKGc9i+81Hde1FZT
 GLqq/+bC+8nuA==
Message-ID: <6cf12bdc-e84d-4902-bd20-b14c880a2996@kernel.org>
Date: Fri, 13 Jun 2025 17:45:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/nouveau/gsp: Fix potential integer overflow on
 integer shifts
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Timur Tabi <ttabi@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250522131512.2768310-1-colin.i.king@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250522131512.2768310-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 5/22/25 3:15 PM, Colin Ian King wrote:
> The left shift int 32 bit integer constants 1 is evaluated using 32 bit
> arithmetic and then assigned to a 64 bit unsigned integer. In the case
> where the shift is 32 or more this can lead to an overflow. Avoid this
> by shifting using the BIT_ULL macro instead.
> 
> Fixes: 6c3ac7bcfcff ("drm/nouveau/gsp: support deeper page tables in COPY_SERVER_RESERVED_PDES")
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to drm-misc-fixes, thanks!
