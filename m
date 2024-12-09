Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD559E8FEA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 11:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0623410E02F;
	Mon,  9 Dec 2024 10:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gRBBZc0S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981A710E02F;
 Mon,  9 Dec 2024 10:16:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E2284A412B0;
 Mon,  9 Dec 2024 10:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21335C4CED1;
 Mon,  9 Dec 2024 10:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733739382;
 bh=PpQczTMRlRoCfSfucalSSQ+k0Y9bCRyp5dFa6bogxgI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gRBBZc0SILjc2viU8ITTLHkQzhaHu/UAIf2xue3tvihWIKj16Z4XTz0r5NSwp7b5l
 s3kJSaSBPDJhLY5/3hcYWa8U05HNRBcdlPB02gRbj+oxCRCui36awU27AOzXdObQJu
 Gm9elqwtZXfMnsFkCgw7lGSUoxYJxHxSn1vwwbIOM2aNkJ1iLo0+cN9D2vSo3Q3syC
 KQFskq22yd+auuqpHxXK4G2lg+ZkKXurVMxzZoiWUeGuVE9ZWqHKHWKOnrPl13wWtm
 zo8Y/sPvAwh4e2jX4qL3L1JGQQe/1M8wHtLKNFpTY9/IQkNbNLbaOnCGVVKSgi3G/h
 kM0uNx2pwcLOQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1tKaoQ-000000008Br-33Rv;
 Mon, 09 Dec 2024 11:16:23 +0100
Date: Mon, 9 Dec 2024 11:16:22 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>,
 =?utf-8?Q?Gy=C3=B6rgy?= Kurucz <me@kuruczgy.com>,
 Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3] drm/msm/dpu1: don't choke on disabling the writeback
 connector
Message-ID: <Z1bDdj1XvWfGjM21@hovoldconsulting.com>
References: <20241208-dpu-fix-wb-v3-1-a1de69ce4a1b@linaro.org>
 <Z1a3jOB8CutzRZud@hovoldconsulting.com>
 <CAA8EJprxosWNWojXWAzkM5eeNXewpT1hpBxCq3irmkuGf==b+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprxosWNWojXWAzkM5eeNXewpT1hpBxCq3irmkuGf==b+w@mail.gmail.com>
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

On Mon, Dec 09, 2024 at 12:00:07PM +0200, Dmitry Baryshkov wrote:
On Mon, 9 Dec 2024 at 11:25, Johan Hovold <johan@kernel.org> wrote:

> > I noticed that the implementation had this status check also before
> > 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to
> > dpu_writeback.c").
> >
> > Why did this not cause any trouble back then? Or is this not the right
> > Fixes tag?
> 
> If I remember correctly, the encoder's atomic_check() is called only
> if the corresponding connector is a part of the new state, if there is
> a connected CRTC, etc, while the connector's atomic_check() is called
> both for old and new connectors.

Thanks for the explanation.

Johan
