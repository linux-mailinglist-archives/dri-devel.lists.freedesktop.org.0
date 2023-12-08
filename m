Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5537E809F2E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 10:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6F210EA33;
	Fri,  8 Dec 2023 09:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F0510EA33
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 09:23:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 365E162310;
 Fri,  8 Dec 2023 09:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8611DC433C7;
 Fri,  8 Dec 2023 09:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702027430;
 bh=8OKSkc37GqD1hhdq1qHNAv72gT7ownApsTE4qDcF0aw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IEFVVX8rcnFCr8X12QXLAg/kSs1vQpQ0dB/O10eu0OqplaCbjSus2/W+zozrl4FXQ
 xKoLedcf+mBEx8NYJNFyN2f6AGIg2+0mmFiSZah1wgL8DtNjPuGRyYaAFhR4FZyZGa
 pU9V6b8voPW/3dUKQr6LBh9Y9iAYStW1GUPgUobBF6kKUZuzCXEW7NMkSfyOgeAU2R
 gbefywtzFVCsu4lZJQXeMBS261j0cMnYGhHGaMbku40yAVybUoufMKdKEDx+Lvtc+Z
 CxL98nX4fQ1U9US/6Nhd9mWiMchAgwlSSGtiPGGqtLInIRmvbc/m1cdEnO0NcOKmpy
 x1ld9JOeh0FAw==
From: Maxime Ripard <mripard@kernel.org>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 ivan.orlov0322@gmail.com, maarten.lankhorst@linux.intel.com, 
 skhan@linuxfoundation.org, tzimmermann@suse.de, 
 Ziqi Zhao <astrajoan@yahoo.com>
In-Reply-To: <20230721161446.8602-1-astrajoan@yahoo.com>
References: <20230716043411.4950-1-astrajoan@yahoo.com>
 <20230721161446.8602-1-astrajoan@yahoo.com>
Subject: Re: [PATCH] drm/crtc: Fix uninit-value bug in drm_mode_setcrtc
Message-Id: <170202742812.13384.8140202310424410642.b4-ty@kernel.org>
Date: Fri, 08 Dec 2023 10:23:48 +0100
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org, glider@google.com,
 sumit.semwal@linaro.org, syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Jul 2023 09:14:46 -0700, Ziqi Zhao wrote:
> The connector_set contains uninitialized values when allocated with
> kmalloc_array. However, in the "out" branch, the logic assumes that any
> element in connector_set would be equal to NULL if failed to
> initialize, which causes the bug reported by Syzbot. The fix is to use
> an extra variable to keep track of how many connectors are initialized
> indeed, and use that variable to decrease any refcounts in the "out"
> branch.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime

