Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC117FEBCE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 10:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A29410E6C9;
	Thu, 30 Nov 2023 09:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7B710E6C9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 09:26:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0ACB361E0B;
 Thu, 30 Nov 2023 09:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C120C433C8;
 Thu, 30 Nov 2023 09:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701336386;
 bh=Fo0Pio3QZLXVJiyMZvAR93mM+9bLzpr7O6m3p7tFXVM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JGHM3KmMqmQn9ypX6vtyIaO67Rg22LUUwJduPHMI3VzXFwh9INwXPoy7oCW61HxF1
 fCy898LsZu93EhWv5YHrIPb8CHsjnfZ7UX4aLQ9Pyr0pzL8TCB3JGNSs4+VPrOJgRg
 wyX/zby9KDyvEkv1/sGp5GKV/dOQdeB2jRBpaaAxUF/L1nFaOzLOB1i9dBI3il2DV+
 8N+sXjHQz44DzUEwBZzewj7Lf4nVMqXOnyPmYXo0nRPBnH/8kg+Ynbv3KMPElmThcl
 ba2U1n61pmXsue249N3mysSWdtbkMrP5BOUDmce3SPr4wBjxgOrne0T83HjE+H8Y0N
 5x5pvzWn2dVVg==
From: Maxime Ripard <mripard@kernel.org>
To: Sarah Walker <sarah.walker@imgtec.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <a2d3210b-290f-4397-9c3e-efdcca94d8ac@moroto.mountain>
References: <a2d3210b-290f-4397-9c3e-efdcca94d8ac@moroto.mountain>
Subject: Re: (subset) [PATCH] drm/imagination: fix off by one in
 pvr_vm_mips_init() error handling
Message-Id: <170133638383.3077649.18368811865734250360.b4-ty@kernel.org>
Date: Thu, 30 Nov 2023 10:26:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matt Coster <matt.coster@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Nov 2023 10:27:15 +0300, Dan Carpenter wrote:
> If the call to vmap() fails the "page_nr" is one element beyond the end
> of the mips_data->pt_dma_addr[] and mips_data->pt_pages[] arrays.
> 
> The way that this is traditionally written is that we clean up the
> partial loop iteration before the goto and then we can say
> while (--i >= 0).  At that point we know that all the elements thus
> far are initialized so we don't need to have NULL checks.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

