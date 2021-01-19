Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 030EF2FB53C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 11:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830146E09F;
	Tue, 19 Jan 2021 10:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E55F6E09F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 10:18:35 +0000 (UTC)
Date: Tue, 19 Jan 2021 10:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1611051513;
 bh=q+dny+d9bvN1Z30lIJh9zYFbNAX8RL+E2yHDrPen8dc=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=EEJJJiPIPVks4KgMcNX6viXtSMfYjtON2y4W70FpTyTi14JE/rViukoIbCoh/NwXN
 hS2y3D1bjc6lPimCVxpsJGSayd2xTHqIPYkw+u2PNQdJZGb4Ts6i0V0kinGewOOUKB
 oBAMay6gJFo6aUuzcfDMK+QfOwnHlqdJ+tcouH/UU4s7dbOdAFtGrHpPbrCtmEiLVr
 Uh2CHjzBIq/6E7dwbs5d92IPTrVY1/ye8B23nwyLheIdxzxKsSNI/011eJlJ3J6yIg
 gEdyJ1b35Ic670vTqrTU2L79iCZcVqEYXS/RsIj7UFODx29LjbOHcEuOjkhOp7NBYg
 OdkXmaVJ2dDfA==
To: Lyude Paul <lyude@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/3] drivers/nouveau/kms/nv50-: Reject format modifiers
 for cursor planes
Message-ID: <HfzDFy00Jir8FH_WqWz7EmLYojZvbfaoSAhmjdxfTSVxhBBpUYgpdApQFXXM2Uv3yzq0ySUYLCq2izrT5d9_gxna2IN9U8zHme2dvo7LlKs=@emersion.fr>
In-Reply-To: <20210119015415.2511028-1-lyude@redhat.com>
References: <20210119015415.2511028-1-lyude@redhat.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 James Jones <jajones@nvidia.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Jeremy Cline <jcline@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, January 19th, 2021 at 2:54 AM, Lyude Paul <lyude@redhat.com> wrote:

> Nvidia hardware doesn't actually support using tiling formats with the
> cursor plane, only linear is allowed. In the future, we should write a
> testcase for this.
>
> Fixes: c586f30bf74c ("drm/nouveau/kms: Add format mod prop to base/ovly/nvdisp")
> Cc: James Jones <jajones@nvidia.com>
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Jeremy Cline <jcline@redhat.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: <stable@vger.kernel.org> # v5.8+
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Together with [1], this patch allows me to run unpatched modifier-aware
user-space successfully, without a cursor visual glitch. drm_info
correctly reports the new modifier list, and wlroots logs confirm that
a flavor of NVIDIA_BLOCK_LINEAR_2D is used for the primary buffers and
LINEAR is used for cursor buffers.

Code looks good to me as well.

Reviewed-by: Simon Ser <contact@emersion.fr>

[1]: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3724
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
