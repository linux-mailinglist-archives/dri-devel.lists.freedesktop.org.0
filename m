Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81FAC073DF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917FB10EAFF;
	Fri, 24 Oct 2025 16:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rM6yYU1E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C72910EAFF;
 Fri, 24 Oct 2025 16:17:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 60D5640655;
 Fri, 24 Oct 2025 16:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBF3C4CEF1;
 Fri, 24 Oct 2025 16:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761322663;
 bh=H7diD6T2VvAt22VMSasAL/ILfy7efjFZ2iYWqCWT09o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rM6yYU1E8iOOQFjtTl8Jo/klRzEi/E7UdXUyUShksymBBkz62ajzVmiwH2hDRoWe/
 TWYb86RW7fuVBGrfSEdBmHD6wTOYzHIBK4PEd9ME/Oe7JDepUAm8DaT2GhsquVKQED
 l2tRabtgzE2sUyr0EhTX0ibxhaurpxolrDN0TajBYVBloJpD1aRCCFC2a1I7dwwDha
 zapx9uwQ0XTmi+JLu+M5J+Kc68ytFK4LQ/f69kv8BkqNMfjI3qV4z8TCI12Em7W0PV
 N4ZiTfGsTeK8/EnwNOxxEqSuNDUPl7dC6xQReyPz4RctRziT9rTR2c4BNmzJKl6VmR
 jvNAunAwOiuTg==
Message-ID: <25c97722-e05d-467c-908e-baa31e636a44@kernel.org>
Date: Fri, 24 Oct 2025 18:17:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: Fix race in nouveau_sched_fini()
To: Philipp Stanner <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251024161221.196155-2-phasta@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251024161221.196155-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
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

On 10/24/25 6:12 PM, Philipp Stanner wrote:
> nouveau_sched_fini() uses a memory barrier before wait_event().
> wait_event(), however, is a macro which expands to a loop which might
> check the passed condition several times. The barrier would only take
> effect for the first check.
> 
> Replace the barrier with a function which takes the spinlock.
> 
> Cc: stable@vger.kernel.org # v6.8+
> Fixes: 5f03a507b29e ("drm/nouveau: implement 1:1 scheduler - entity relationship")
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Acked-by: Danilo Krummrich <dakr@kernel.org>
