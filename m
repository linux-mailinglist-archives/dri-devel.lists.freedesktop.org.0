Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 616E74A6D64
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 10:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023DA10E565;
	Wed,  2 Feb 2022 09:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8709510E57A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 09:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1643792447; x=1675328447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OHgF73yj+76ugOgwCHRvQ6IsnfupR1DLp7z5JwFrE+E=;
 b=NcAOJ/AZy+e41SsPtbBnG7BxZLmQT76+8Dctm2lfP+9io/sgc9isg01i
 BbUlhUh30d/uc2IEQbWPjhCXn+3Cu+Hw8CiWCkEawIHZkR+w+jcpgXmQG
 xSqMTdMbkYCzxofpmyAgijsuVBHRyqxdhBgKCsoxA22BtJPx4U5qMxDKE
 91m9qsikLEsXfUjNsH/eP563ML/r+eBwBiB80n0JBTEllTQKhM/m9/6u5
 zaUu0j2SbQ4zaKdcukJx6uVV08O0UhRg4eJD/oA4vyKELkfSuhfmaMxbY
 YgfIC762sPGQRA3m0geNpfTmEW+AMiQSQN0n/V0xfTI3cm5Ejz33iKXrS A==;
X-IronPort-AV: E=Sophos;i="5.88,336,1635199200"; d="scan'208";a="21846292"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 02 Feb 2022 10:00:43 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 02 Feb 2022 10:00:43 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 02 Feb 2022 10:00:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1643792443; x=1675328443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OHgF73yj+76ugOgwCHRvQ6IsnfupR1DLp7z5JwFrE+E=;
 b=ENTcmD+Ma/7vZkg0OJd53I6eHXRUhX6wRKeYOBLZSMEtNXxCduDOCBWY
 1YI0U+4CRlRhhOItFtQwJ6Dc8f43GMXaIiP6pfCAhV52MNiwawOrpbPDY
 mjx9xKiTgWfYvhlEjRa8PneD3vGbEps3uq8vy2J5DgzlVrk8gl4b5J8c4
 vVjIEw19uRqR1zr32e/dIrQbl9Npfx9NtqZEklqs65dPXV6TkgDHbXIr/
 GLV+S+yOybhHJdWIhjCYD8TOz5vUWkh+qsnuKSiPgDGWIhTls9z3i7aoG
 lvq35f23QYIGEJ1ecW8IUnSfdBUv3VlPIAzXR7GzMG8yS/OSuw7Y8txjy g==;
X-IronPort-AV: E=Sophos;i="5.88,336,1635199200"; d="scan'208";a="21846284"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 02 Feb 2022 10:00:40 +0100
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9F257280065;
 Wed,  2 Feb 2022 10:00:39 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: (EXT) Re: [PATCH v2 2/2] drm: mxsfb: Fix NULL pointer dereference
Date: Wed, 02 Feb 2022 10:00:37 +0100
Message-ID: <5678101.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <61ec1e37-d1a2-6561-493a-06bf37cd71d6@denx.de>
References: <20220202081755.145716-1-alexander.stein@ew.tq-group.com>
 <20220202081755.145716-3-alexander.stein@ew.tq-group.com>
 <61ec1e37-d1a2-6561-493a-06bf37cd71d6@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, 2. Februar 2022, 09:30:38 CET schrieb Marek Vasut:
> On 2/2/22 09:17, Alexander Stein wrote:
> > mxsfb should not never dereference the NULL pointer which
> 
> ... not ever ... but that's really a nitpick.

Doh, I just copied it from my mail...
You want me to send a v2.1? Or will someone fix it when applying?

> > drm_atomic_get_new_bridge_state is allowed to return.
> > Assume a fixed format instead.
> > 
> > Fixes: commit b776b0f00f24 ("drm: mxsfb: Use bus_format from the nearest
> > bridge if present") Signed-off-by: Alexander Stein
> > <alexander.stein@ew.tq-group.com>
> 
> It's perfect otherwise, thanks !

Thanks,
Alexander



