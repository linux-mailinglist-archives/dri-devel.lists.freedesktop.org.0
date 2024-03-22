Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00E9886ED5
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 15:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946DB11250B;
	Fri, 22 Mar 2024 14:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W/v/hAI7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34CC11250A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 14:42:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B9A80CE175F;
 Fri, 22 Mar 2024 14:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB27C433C7;
 Fri, 22 Mar 2024 14:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711118523;
 bh=WOSj3F3OfM3HjItJG0aKTUFwCYD1ysI0kLGRlYk90go=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W/v/hAI7BLuZ59qdzSztB+Ba45vaFFSxOnPgZ9lnH/O/kU3V4zL9lt65LG03g+V+k
 rOoP6LnZyFf8EPY9SoHfl72r1eL3kSSrWTizeU9zNHPhN/EfMHfzj8xP10uHwJtRp6
 HWgduOIwM/hbGHf9Pig0xpAVA1AhULiT5vdn5MwU34O33Ahwe4Zz7r45xhhc3VDuU8
 puAnDX+VzMkZCCbR9CTdYZ/wj/zTpeQ/giVnD/haFr0+I3d+4YWUUAtS+FyCo62PX7
 1s7StiUDnb8O1qHewdguvEFYnt43BDGLfzZ0a82Fx9x1bs2bO1bGdmiv2b/FW2ZPgP
 u7fBPiF3gVTNQ==
Date: Fri, 22 Mar 2024 09:42:00 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_bjorande@quicinc.com, quic_carlv@quicinc.com, 
 quic_pkanojiy@quicinc.com, stanislaw.gruszka@linux.intel.com, 
 jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ogabbay@kernel.org
Subject: Re: [PATCH] accel/qaic: Add Sahara implementation for firmware loading
Message-ID: <bv7pdgwx5rm6wblikmit6tw3znea5g4xrzntilt7idqdas4cmo@ejxbddbq6kwa>
References: <20240322034917.3522388-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322034917.3522388-1-quic_jhugo@quicinc.com>
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

On Thu, Mar 21, 2024 at 09:49:17PM -0600, Jeffrey Hugo wrote:
> The AIC100 secondary bootloader uses the Sahara protocol for two
> purposes - loading the runtime firmware images from the host, and
> offloading crashdumps to the host. The crashdump functionality is only
> invoked when the AIC100 device encounters a crash and dumps are enabled.
> Also the collection of the dump is optional - the host can reject
> collecting the dump.
> 
> The Sahara protocol contains many features and modes including firmware
> upload, crashdump download, and client commands. For simplicity,
> implement the parts of the protocol needed for loading firmware to the
> device.
> 
> Fundamentally, the Sahara protocol is an embedded file transfer
> protocol. Both sides negotiate a connection through a simple exchange of
> hello messages. After handshaking through a hello message, the device
> either sends a message requesting images, or a message advertising the
> memory dump available for the host. For image transfer, the remote device
> issues a read data request that provides an image (by ID), an offset, and
> a length. The host has an internal mapping of image IDs to filenames. The
> host is expected to access the image and transfer the requested chunk to
> the device. The device can issue additional read requests, or signal that
> it has consumed enough data from this image with an end of image message.
> The host confirms the end of image, and the device can proceed with
> another image by starting over with the hello exchange again.
> 
> Some images may be optional, and only provided as part of a provisioning
> flow. The host is not aware of this information, and thus should report
> an error to the device when an image is not available. The device will
> evaluate if the image is required or not, and take the appropriate
> action.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn
