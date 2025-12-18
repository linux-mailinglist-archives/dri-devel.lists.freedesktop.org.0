Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89DBCCC924
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 16:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD5010E404;
	Thu, 18 Dec 2025 15:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bt6sEqd1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F303110E404;
 Thu, 18 Dec 2025 15:52:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ABF3B4043C;
 Thu, 18 Dec 2025 15:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB74C4CEFB;
 Thu, 18 Dec 2025 15:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766073170;
 bh=sq+km+wvT4DGrv7PkS4uONGlYNLQhbs1OTtEFeLOWqw=;
 h=From:To:Cc:Subject:Date:From;
 b=Bt6sEqd1SrETZEoMhV+xw1Xf5/RORJDOUqXrGJrEaroGiWDeqK7Uo0S4NTJF9XC2j
 nA5ogDNI6Ja7u6HckBN6eAKGLZ3MT3aQHvOeXUoLaMYqi4oCdSUDSLkzgolei3ix36
 YY19napuyMc7QbJpHbA3YB8UFDDPEoxg7+BQLCwkqzNqulWwCDArZPUOAyAmZa2jen
 pTub+YYddgTTrKzntbRiDyrh/suPBilg0NaGMVp7HHAmAIxVhSeDGMJmXNfQfe+GVe
 +XCJ5TNhb40nVPRf6ZM3m90Iql/SNNiC10/qTiVI+CZZsRcKEubku+xEpJyNsOCmD6
 jXmp+SHsa+gCA==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com, jhubbard@nvidia.com, apopple@nvidia.com,
 joelagnelf@nvidia.com, aliceryhl@google.com, lossin@kernel.org
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/4] nova-core Improve pin initializer code
Date: Thu, 18 Dec 2025 16:50:47 +0100
Message-ID: <20251218155239.25243-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is a minor series to improve some of the pin initializer code to:

1. Reduce redundancy caused by Result<impl PinInit<T, Error>> return
values with pin_init_scope().

2. Relocate code that technically fits in the pin initializer into the
initializer itself.

While, thanks to pin_init_scope(), it is also possible to keep it as is,
moving appropriate code into the initializer has the advantage that it
structures the dependencies of fields naturally.

For instance, intermediate data that is only needed for a single field goes
into the initializer block of this field, making it obvious that it is not
needed by anything else.

On the other hand, intermediate data that is needed for multiple fields to
initialize remains above the initializer, naturally indicating that it is
needed my multiple fields.

Danilo Krummrich (4):
  gpu: nova-core: fw: get rid of redundant Result in GspFirmware::new()
  gpu: nova-core: fw: move appropriate code into pin initializer
  gpu: nova-core: gsp: get rid of redundant Result in Gsp::new()
  gpu: nova-core: gsp: move appropriate code into pin initializer

 drivers/gpu/nova-core/firmware/gsp.rs | 134 +++++++++++++-------------
 drivers/gpu/nova-core/gpu.rs          |   2 +-
 drivers/gpu/nova-core/gsp.rs          |  73 +++++++-------
 drivers/gpu/nova-core/gsp/boot.rs     |   5 +-
 4 files changed, 106 insertions(+), 108 deletions(-)


base-commit: 97cf6bc0abd381fd84e5d8e978322a62a58fb00e
-- 
2.52.0

