Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA03D022C3
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 11:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D935910E32C;
	Thu,  8 Jan 2026 10:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jCLRsYOl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C20410E32C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 10:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767869006;
 bh=6G16GTbcXpV/IbrJzz3ga5ZkfVDBClUP+PfOx8QJ55Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jCLRsYOl0aSiqu1cQ5xiDsxuYtl5b69pO+A+/MaZtkwQq28mt/BzhvhkF1ku0DhFh
 B5m1nXEID8PGBPi9EheAZSVHiLhTAo4wOQB1Vnyk5FMHbZ/2eO9EtgyUOQi979MscB
 mZlRLQfB0WkN4misCZJALPnCKdXAOolEizPf3CzR5MhPE7XVskFp/MZqh02oyoRs3U
 OvQF/I38yBVq9d205dSxKNXrJ6C2ugJwsggJp95QCBOawkMpuu7TaSFk274g32AOrj
 GF+I78wgqDS+9q4v8Kkl8aMlRsyikf9R8icmJvi9ZcZ8SpgbJpr/86Ws7lfnjvxa6u
 14323Pg5fmaQw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 98BD417E1330;
 Thu,  8 Jan 2026 11:43:26 +0100 (CET)
Date: Thu, 8 Jan 2026 11:43:20 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Rob
 Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, =?UTF-8?B?TG/Dr2M=?= Molinari
 <loic.molinari@collabora.com>
Subject: Re: [PATCH] drm/panfrost: Fix a page leak in
 panfrost_mmu_map_fault_addr() when THP is on
Message-ID: <20260108114320.02fc2df7@fedora>
In-Reply-To: <bca803d3-692c-4939-a342-e3e018b25823@arm.com>
References: <20260108101025.933843-1-boris.brezillon@collabora.com>
 <bca803d3-692c-4939-a342-e3e018b25823@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 8 Jan 2026 10:28:00 +0000
Steven Price <steven.price@arm.com> wrote:

> Hi Boris,
> 
> Happy new year!

Happy new year too!
