Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE91DB44CF9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 07:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4C310EB1A;
	Fri,  5 Sep 2025 05:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PKZt52X2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECC910E102;
 Fri,  5 Sep 2025 05:07:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D40CC402C1;
 Fri,  5 Sep 2025 05:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5A2C4CEF1;
 Fri,  5 Sep 2025 05:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1757048863;
 bh=Ink7x/UMnv0pA1jyrItyKela2fO1SaLcgrzgep4j6wQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PKZt52X2nhRDZT2WTYCyzMa4pjKmL0t/psW5LPAH/Uyo9R00uWucciWf11UoKD82c
 POVPQtfesmATN06YTys8w82ZLbD5sJFTCoDMvd5sMilc7TrJIkzkHE3o8AhYBszR6p
 dyVFY9aoLZeXW+CuaQOLlTSzx9GJWn1i52Lpuwaw=
Date: Fri, 5 Sep 2025 07:07:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Imre Deak <imre.deak@intel.com>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 6.16 139/142] Revert "drm/dp: Change AUX DPCD probe
 address from DPCD_REV to LANE0_1_STATUS"
Message-ID: <2025090551-setup-crescent-a670@gregkh>
References: <20250902131948.154194162@linuxfoundation.org>
 <20250902131953.603872091@linuxfoundation.org>
 <aLoJG4Tq4nNwFLu6@ideak-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLoJG4Tq4nNwFLu6@ideak-desk>
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

On Fri, Sep 05, 2025 at 12:48:11AM +0300, Imre Deak wrote:
> Hi Greg,
> 
> On Tue, Sep 02, 2025 at 03:20:41PM +0200, Greg Kroah-Hartman wrote:
> > 6.16-stable review patch.  If anyone has any objections, please let me know.
> 
> Thanks for queuing this and the corresponding reverts for the other
> stable trees. This one patch doesn't match what I sent, the address
> should be changed to DP_TRAINING_PATTERN_SET not to DP_DPCD_REV, see
> [1]. I still think that's the correct thing to do here conforming to the
> DP Standard and matching what the upstream kernel does, also solving a
> link training issue for a DP2.0 docking station.
> 
> The reverts queued for the other stable trees are correct, since for
> now I do not want to change the behavior in those (i.e. those trees
> should continue to use the DP_DPCD_REV register matching what's been the
> case since the DPCD probing was introduced).

Ick, why were the values different for different branches?  That feels
wrong, and is why I missed that.  Can you just send a fix-up patch for
the one I got wrong?

thanks,

greg k-h
