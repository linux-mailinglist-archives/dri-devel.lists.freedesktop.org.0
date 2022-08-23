Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AECE59CECA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 04:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5130212AE85;
	Tue, 23 Aug 2022 02:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4B312B5B2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 02:51:52 +0000 (UTC)
Received: from maud (unknown [75.98.19.152])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 17B636601B2A;
 Tue, 23 Aug 2022 03:51:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661223110;
 bh=yC0jbyNivWm+pTBbxjqpy6sBh2y6lvG4Ri5hA7de/GE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=StiT2ctHrLKJZA5f1b5TUvXNKYUwbQ6d0PzdwA0bZ3UrC3x0jk58LYPHHbSAA9bJ8
 bUspln6sUbmpQAiAKnpULaHEvHb2qMfXZmyJDuCqXD8lfLY/U8JANpSzong2lLMklH
 XDg8YN4jOBueRVKTxc3m1X85KF14i+e36ohJOxxl0rTybcWujPgv475tpWD7Ldua9s
 yXZyj2b7tqwbuGR6XfFmq6cGGu0PVOMcWqwumLOvBJtubKRBA+0TPIiR8vODRyyioT
 3/p+FIm26Ay6au9NPur+TkMohNbB8m06ijvO6trvf+LafJ9ZESEcSvZSA0E8QOgHsV
 lmOXVtBRNv5Pw==
Date: Mon, 22 Aug 2022 22:51:09 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] drm/panfrost: Update io-pgtable API
Message-ID: <YwRAnbNdx9nbGLom@maud>
References: <daef7f8c134d989c55636a5790d8c0fcaca1bae3.1661205687.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <daef7f8c134d989c55636a5790d8c0fcaca1bae3.1661205687.git.robin.murphy@arm.com>
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
Cc: tomeu.vizoso@collabora.com, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -static size_t get_pgsize(u64 addr, size_t size)
> +static size_t get_pgsize(u64 addr, size_t size, size_t *count)
>  {
> -	if (addr & (SZ_2M - 1) || size < SZ_2M)
> -		return SZ_4K;
> +	size_t blk_offset = -addr % SZ_2M;

addr is unsigned. if this is correct, it's magic.
