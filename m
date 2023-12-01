Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 001A58005D1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 09:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB7110E818;
	Fri,  1 Dec 2023 08:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E0C10E80F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 08:37:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 49B81CE22FA;
 Fri,  1 Dec 2023 08:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381EAC433C8;
 Fri,  1 Dec 2023 08:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701419862;
 bh=q6uyK3KduoHE8Rp2A1HWjw0i+9QdOkbCcHpv3VuzKnY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=s4GxHUbAKKrXLvZe3ST3qpBvL3RTor6PdTIMHw9UOwvaSIu9tECHqjjclSIEYSNkg
 7MVAtaMtUsUGDWyPw7vr0bEwQlaT1z+tF/P8xClmd409WFNKm64kyVM8xRLCqLFNg2
 zgPWLcNExCoXIpNdnfLMFcEOQNhIUxjn6RyzPbzWWrEIsRnQrT1JN/ADcKHFsVlMvk
 JvC1YSxJIfgBriYyHhFRa5atIeJ8QEtt0pzR58PS7hLDucW/jYbEcDPy7Yy+VXDKCl
 QpiPULE0NW6ARKPvk3RB0tFxVUON8WS1RFuSgpCrbYTVuM7sRUJ5Y13JMKGQ92/+d4
 gw9nNwnn4KjQQ==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Donald Robson <donald.robson@imgtec.com>
In-Reply-To: <20231130160017.259902-1-donald.robson@imgtec.com>
References: <20231130160017.259902-1-donald.robson@imgtec.com>
Subject: Re: (subset) [PATCH v2 1/5] drm/imagination: Fixed warning due to
 implicit cast to bool
Message-Id: <170141985986.3198881.16310139541433130875.b4-ty@kernel.org>
Date: Fri, 01 Dec 2023 09:37:39 +0100
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
Cc: matt.coster@imgtec.com, boris.brezillon@collabora.com, tzimmermann@suse.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Nov 2023 16:00:13 +0000, Donald Robson wrote:
> This line appears to confuse the compiler and had been noticed previously in
> clang-tidy output. There isn't anything fundamentally wrong that I can see.
> I suspect that it just looks like a mistake - hence the first note.  By making
> the second operand an actual bool result, const correctness can be preserved
> while silencing the warning.
> 
> >> drivers/gpu/drm/imagination/pvr_device_info.c:230:47: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
>      230 |         } else if (features_size == mapping_max_size && (mapping_max & 63)) {
>          |                                                      ^  ~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/imagination/pvr_device_info.c:230:47: note: use '&' for a bitwise operation
>      230 |         } else if (features_size == mapping_max_size && (mapping_max & 63)) {
>          |                                                      ^~
>          |                                                      &
>    drivers/gpu/drm/imagination/pvr_device_info.c:230:47: note: remove constant to silence this warning
>      230 |         } else if (features_size == mapping_max_size && (mapping_max & 63)) {
>          |                                                     ~^~~~~~~~~~~~~~~~~~~~~
>    1 warning generated.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

