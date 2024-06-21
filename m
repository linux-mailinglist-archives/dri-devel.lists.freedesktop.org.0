Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B4B911B67
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 08:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273A310E1D8;
	Fri, 21 Jun 2024 06:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fcYAvO1L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED8110E220
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 06:19:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8C8686243A;
 Fri, 21 Jun 2024 06:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D732C2BBFC;
 Fri, 21 Jun 2024 06:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718950789;
 bh=er+wYh9AQ6uJk85XjeYB5lcqPTMyxJ8Uawx5iswT9Ho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fcYAvO1LsTvIcT0CLhh8l+htxR7UMoL1BsRb+zcm/D6vSpiCunj2mcHqm6Xm3qGqz
 LAFR6e1nTNMct62czOEgsxapSV96QojElKOu87PNe0/H8QVVnlIGcbKbqoYTcFl8g7
 YDwAohZZoVcC9D+hXvG0O3GPY4Lm+TgN1nWuLVb0dlLN8FZXk0ra7DIbZ5rcZdP1ru
 s2WeQ6FWOvVJZxV3BlAb4oACtOqaNVGVBbSUktMnkTNJdbf1mGAsCot82Ny8BhU4l7
 O4KAJky0OW0uHyO4aco8oo1I3G7zB5ygpBajaCwFlhZ+rksgnqADZrGya+LBEoehy9
 3PX7HDNNOiNiQ==
Date: Fri, 21 Jun 2024 01:19:46 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>, 
 Oded Gabbay <ogabbay@kernel.org>, srinivas.kandagatla@linaro.org,
 linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Message-ID: <z6g5ool5vomkudiroyaxh532rhlfu5x4i3l5xoqrsho2sxv4im@v5ghemjkpc3v>
References: <20240612064731.25651-1-quic_ekangupt@quicinc.com>
 <zbpia232dh4ojfsvhcqxrp6cwfygaalu5cycdrs47pqmnrisvk@dq24nww26gkm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zbpia232dh4ojfsvhcqxrp6cwfygaalu5cycdrs47pqmnrisvk@dq24nww26gkm>
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

On Wed, Jun 12, 2024 at 09:28:39PM GMT, Dmitry Baryshkov wrote:
> On Wed, Jun 12, 2024 at 12:17:28PM +0530, Ekansh Gupta wrote:
> > Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
> > to be added for PD notifications and other missing features. Adding
> > and maintaining new files from within fastrpc directory would be easy.
> > 
> > Example of feature that is being planned to be introduced in a new C
> > file:
> > https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
> > 
> > Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> > ---
> >  MAINTAINERS                          |  2 +-
> >  drivers/misc/Kconfig                 | 13 +------------
> >  drivers/misc/Makefile                |  2 +-
> >  drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
> >  drivers/misc/fastrpc/Makefile        |  2 ++
> >  drivers/misc/{ => fastrpc}/fastrpc.c |  0
> >  6 files changed, 21 insertions(+), 14 deletions(-)
> >  create mode 100644 drivers/misc/fastrpc/Kconfig
> >  create mode 100644 drivers/misc/fastrpc/Makefile
> >  rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)
> 
> Please consider whether it makes sense to move to drivers/accel instead
> (and possibly writing a better Kconfig entry, specifying that the driver
> is to be used to offload execution to the DSP).
> 

Wouldn't this come with the expectation of following the ABIs of
drivers/accel and thereby breaking userspace?

Regards,
Bjorn
