Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B3476AA18
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 09:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1836E10E312;
	Tue,  1 Aug 2023 07:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE5610E312
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 07:35:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 82390614AC;
 Tue,  1 Aug 2023 07:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FDE2C433C7;
 Tue,  1 Aug 2023 07:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690875353;
 bh=AQikNOlQWCp2x7FJn2Cn9VEoR/2PqWHH3l3dMxcPtgY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=aJOd5ELviFpFzoh0J5s52THZhEEVd3E5AVDjIVivwMHq3axo05NXM94wVzqdCU7aJ
 x2mCoTrkIM4K+En+lmMwQxNfkYYBwG4zx6ZbOwK9OSARbd43WnLw7d1DzIU/Y1i0cR
 tWAZNByzGkrbdQPn6xbjH2XwlD+Jz5NMiP9nNfIMzGp0IMadtAaD0DI3X6hKoHOJwj
 3GKzpjk7r22kRf8DaOZtSuyrRPqqDuwvFKEYaILx1L6fObrxsvPKIWk9zjV7EBUSst
 gwYpYSkAqrSoEal/4sg1jseBwVkeSt0qIWIo7aLoKFQoQG0ynhPUMVK79ZWyBvm79y
 zHMGk25gcBk1w==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20230731182241.240556-1-arthurgrillo@riseup.net>
References: <20230731182241.240556-1-arthurgrillo@riseup.net>
Subject: Re: (subset) [PATCH v3] drm/tests: Alloc drm_device on drm_exec tests
Message-Id: <169087535074.1035208.10252919179734883843.b4-ty@kernel.org>
Date: Tue, 01 Aug 2023 09:35:50 +0200
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 mripard@redhat.com, tales.aparecida@gmail.com,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, mairacanal@riseup.net,
 boris.brezillon@collabora.com, dakr@redhat.com, alexander.deucher@amd.com,
 andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 31 Jul 2023 15:22:41 -0300, Arthur Grillo wrote:
> The drm_exec tests where crashing[0] because of a null dereference. This
> is caused by a new access of the `driver` attribute of `struct
> drm_driver` on drm_gem_private_object_init(). Alloc the drm_device to
> fix that.
> 
> [0]
> [15:05:24] ================== drm_exec (6 subtests) ===================
> [15:05:24] [PASSED] sanitycheck
> ^CERROR:root:Build interruption occurred. Cleaning console.
> [15:05:50] [ERROR] Test: drm_exec: missing expected subtest!
> [15:05:50] BUG: kernel NULL pointer dereference, address: 00000000000000b0
> [15:05:50] #PF: supervisor read access in kernel mode
> [15:05:50] #PF: error_code(0x0000) - not-present page
> [15:05:50] PGD 0 P4D 0
> [15:05:50] Oops: 0000 [#1] PREEMPT NOPTI
> [15:05:50] CPU: 0 PID: 23 Comm: kunit_try_catch Tainted: G                 N 6.4.0-rc7-02032-ge6303f323b1a #69
> [15:05:50] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-1.fc37 04/01/2014
> [15:05:50] RIP: 0010:drm_gem_private_object_init+0x60/0xc0
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

