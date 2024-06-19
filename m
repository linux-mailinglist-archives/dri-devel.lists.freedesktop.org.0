Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04B490E3B1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 08:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B762B10E9E4;
	Wed, 19 Jun 2024 06:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kWtjTl3u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B454310E975
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 06:46:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 58C3C61CDB;
 Wed, 19 Jun 2024 06:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A832AC2BBFC;
 Wed, 19 Jun 2024 06:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1718779595;
 bh=E9h5i7a/Nda7xk6rlhVkEEvh2+X53mJFzwmYnwIC/K0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kWtjTl3uCuNUCDVdB3RCY10JRxLw0KUOAs2etyf2d+x3v76raryHnifbrGkct2U2N
 kvJYwWzFWwhaRGjT2jiduAsX3cZbsZIIJFBpmgQNl8VyAKSiXybZOAZSrqGk219QAF
 HB3/fGhiTHDuRBEL7DtWJctxK3fwX7pAaQouxYzA=
Date: Wed, 19 Jun 2024 08:46:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Oded Gabbay <ogabbay@kernel.org>, srinivas.kandagatla@linaro.org,
 linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Message-ID: <2024061910-lily-overlying-53c6@gregkh>
References: <20240612064731.25651-1-quic_ekangupt@quicinc.com>
 <zbpia232dh4ojfsvhcqxrp6cwfygaalu5cycdrs47pqmnrisvk@dq24nww26gkm>
 <00b2c65e-c00e-48bf-b118-4785d216cd19@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00b2c65e-c00e-48bf-b118-4785d216cd19@quicinc.com>
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

On Wed, Jun 19, 2024 at 12:15:03PM +0530, Ekansh Gupta wrote:
> 
> 
> On 6/12/2024 11:58 PM, Dmitry Baryshkov wrote:
> > On Wed, Jun 12, 2024 at 12:17:28PM +0530, Ekansh Gupta wrote:
> >> Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
> >> to be added for PD notifications and other missing features. Adding
> >> and maintaining new files from within fastrpc directory would be easy.
> >>
> >> Example of feature that is being planned to be introduced in a new C
> >> file:
> >> https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
> >>
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  MAINTAINERS                          |  2 +-
> >>  drivers/misc/Kconfig                 | 13 +------------
> >>  drivers/misc/Makefile                |  2 +-
> >>  drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
> >>  drivers/misc/fastrpc/Makefile        |  2 ++
> >>  drivers/misc/{ => fastrpc}/fastrpc.c |  0
> >>  6 files changed, 21 insertions(+), 14 deletions(-)
> >>  create mode 100644 drivers/misc/fastrpc/Kconfig
> >>  create mode 100644 drivers/misc/fastrpc/Makefile
> >>  rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)
> > Please consider whether it makes sense to move to drivers/accel instead
> > (and possibly writing a better Kconfig entry, specifying that the driver
> > is to be used to offload execution to the DSP).
> Planning to keep the driver to misc/ only as part of this patch. Moving to accel/ might
> introduce some conventions to be followed which might require significant changes
> in driver.

Which is a good thing, please don't avoid this :)

thanks,

greg k-h
