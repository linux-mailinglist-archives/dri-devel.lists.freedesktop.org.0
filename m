Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5A1727F8C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 13:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614E310E239;
	Thu,  8 Jun 2023 11:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4604A10E239
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 11:59:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1DA5664CD6;
 Thu,  8 Jun 2023 11:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A83C433EF;
 Thu,  8 Jun 2023 11:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686225574;
 bh=kqj+AnBwnPPQKa4kzE0ArmNg7GgENWk2/+XafiMcx5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ShsluX5d4ZlHzfqTkZLdoPZBxhpZcjulNtqKiPyvLfOFldMuyZRaBqS8VsiweyA51
 YNHEaBAA/InLeOtEo07ZiCploLCoXMWfEvkj0PSWD0+TWlUuZ/0BLzuZCOU3giTIZR
 sF+xPlNzefUTZ87VeWWpIfUPY4Z7TSJQefk8VEZHAJcaYLvAel5OjTNwAZF9pbJAIQ
 aWL3+5FRnJMXiws5nnodAruR7tn6JE6s0QcEXih9XEJlGOrDQNp8mDOTIeUXuxhuVT
 +plZk0SdCa705FgMjgMb9VPaoxe4jP6kh013tmsG7cFC4ewDKyxPhbx7/nkKF6pt3K
 wBXqnmXruZJfg==
Date: Thu, 8 Jun 2023 17:29:28 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v2 0/2] Add MHI quirk for QAIC
Message-ID: <20230608115928.GA5672@thinkpad>
References: <20230519163902.4170-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230519163902.4170-1-quic_jhugo@quicinc.com>
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
Cc: mhi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mani@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 19, 2023 at 10:39:00AM -0600, Jeffrey Hugo wrote:
> With the QAIC driver in -next, I'd like to suggest some MHI changes that
> specific to AIC100 devices, but perhaps provide a framework for other
> device oddities.
> 
> AIC100 devices technically violate the MHI spec in two ways. Sadly, these
> issues comes from the device hardware, so host SW needs to work around
> them.
> 
> Thie first issue, presented in this series, has to do with the
> SOC_HW_VERSION register. This register is suposed to be initialized by the
> hardware prior to the MHI being accessable by the host to contain a
> version string for the SoC of the device. This could be used by the host
> MHI controller software to identify and handle version to version changes.
> The AIC100 hardware does not initialize this register, and thus it
> contains garbage.
> 
> This would not be much of a problem normally - the QAIC driver would just
> never use it. However the MHI stack uses this register as part of the init
> sequence and if the controller reports that the register is inaccessable
> then the init sequence fails.  On some AIC100 cards, the garbage value
> ends up being 0xFFFFFFFF which is PCIe spec defined to be a special value
> indicating the access failed.  The MHI controller cannot tell if that
> value is a PCIe link issue, or just garbage.
> 
> QAIC needs a way to tell MHI not to use this register. Other buses have a
> quirk mechanism - a way to describe oddities in a particular
> implementation that have some kind of workaround. Since this seems to be
> the first need for such a thing in MHI, introduce a quirk framework.
> 
> The second issue AIC100 has involves the PK Hash registers. A solution for
> this is expected to be proposed in the near future and is anticipated to
> make use of the quirk framework proposed here. With PK Hash, there are two
> oddities to handle. AIC100 does not initialize these registers until the
> SBL is running, which is later than the spec indicates, and in practice
> is after MHI reads/caches them. Also, AIC100 does not have enough
> registers defined to fully report the 5 PK Hash slots, so a custom
> reporting format is defined by the device.
> 

Looking at the two issues you reported above, it looks to me that they can be
handled inside the aic100 mhi_controller driver itself. Since the MHI stack
exports the read_reg callback to controller drivers, if some registers are not
supported by the device, then the callback can provide some fixed dummy data
emulating the register until the issue is fixed in the device (if at all).

Quirk framework could be useful if the device misbehaves against the protocol
itself but for the register issues like this, I think the controller driver can
handle itself.

What do you think?

- Mani

> v2:
> -Fix build error
> -Fix typo in commit text
> 
> Jeffrey Hugo (2):
>   bus: mhi: host: Add quirk framework and initial quirk
>   accel/qaic: Add MHI_QUIRK_SOC_HW_VERSION_UNRELIABLE
> 
>  drivers/accel/qaic/mhi_controller.c |  1 +
>  drivers/bus/mhi/host/init.c         | 13 +++++++++----
>  include/linux/mhi.h                 | 18 ++++++++++++++++++
>  3 files changed, 28 insertions(+), 4 deletions(-)
> 
> -- 
> 2.40.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
