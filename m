Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903CB80B414
	for <lists+dri-devel@lfdr.de>; Sat,  9 Dec 2023 12:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D79F10E0A4;
	Sat,  9 Dec 2023 11:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4524410E0A4
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Dec 2023 11:58:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0F2DCCE2A0A;
 Sat,  9 Dec 2023 11:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF8FC433C8;
 Sat,  9 Dec 2023 11:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1702123116;
 bh=bUkcbYm3WxckF21AIuPjIRLSkA5yfXmJno+EKnsiAfk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SrySE21XH8rQ/QG0wSUdjiCugzs39zZOj3cxkHO2ma4qAEy1X9ocv9rICCfIoJQUV
 vzHN0n6Z6zP5teEThatUsvnNE4mjhRzHaOpqokZbkqEOBsO+YD2hoM1jSbS44U2C5E
 MrEmJCvdPSpT35uImmqqQOEY8NALK0RSZ9/ocmsU=
Date: Sat, 9 Dec 2023 12:58:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: kovalev@altlinux.org
Subject: Re: [PATCH 1/1] Revert "drm/edid: Fix csync detailed mode parsing"
Message-ID: <2023120959-unloader-empower-4dc2@gregkh>
References: <20231206084946.111835-1-kovalev@altlinux.org>
 <20231206084946.111835-2-kovalev@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231206084946.111835-2-kovalev@altlinux.org>
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
Cc: Jani Nikula <jani.nikula@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devel-kernel@lists.altlinux.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 06, 2023 at 11:49:46AM +0300, kovalev@altlinux.org wrote:
> From: Vasiliy Kovalev <kovalev@altlinux.org>
> 
> This reverts commit 5a46dc8e4a064769e916d87bf9bccae75afc7289.
> 
> Commit 50b6f2c8297793f7f3315623db78dcff85158e96 upstream.
> 
> Commit 5a46dc8e4a0647 ("drm/edid: Fix csync detailed mode parsing") fixed
> EDID detailed mode sync parsing. Unfortunately, there are quite a few
> displays out there that have bogus (zero) sync field that are broken by
> the change. Zero means analog composite sync, which is not right for
> digital displays, and the modes get rejected. Regardless, it used to
> work, and it needs to continue to work. Revert the change.
> 
> Rejecting modes with analog composite sync was the part that fixed the
> gitlab issue 8146 [1]. We'll need to get back to the drawing board with
> that.
> 
> [1] https://gitlab.freedesktop.org/drm/intel/-/issues/8146
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8789
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8930
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9044
> Fixes: 5a46dc8e4a0647 ("drm/edid: Fix csync detailed mode parsing")
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.4+
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Acked-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20230815101907.2900768-1-jani.nikula@intel.com
> Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
> ---
>  drivers/gpu/drm/drm_edid.c | 26 +++++++-------------------
>  include/drm/drm_edid.h     | 12 +++---------
>  2 files changed, 10 insertions(+), 28 deletions(-)

You sent this 3 times, why?  And what tree is this backport for?  It's
already in the respective stable releases, right?

confused,

greg k-h
