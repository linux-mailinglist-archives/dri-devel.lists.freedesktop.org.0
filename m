Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EC3B3C25E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 20:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6AB10EC25;
	Fri, 29 Aug 2025 18:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c/s9WLe0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2858010EC21;
 Fri, 29 Aug 2025 18:21:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EE962601B7;
 Fri, 29 Aug 2025 18:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1127C4CEF0;
 Fri, 29 Aug 2025 18:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756491669;
 bh=GfZWqtlADmqaSwK58bN4YPjBOnDh3IWAcqxHeTchxJM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=c/s9WLe03Qp1EWf4wyAM7FX24Y85XVBrbLT7UHrw2w4XBEPBgKwb5L0m5Bfex4+mL
 YYQvwQdmtvThpdDxusAx4kdGEmUozHihiKHq+eHcZowXp3m8N9Nr1uJ4kpox6svZ1j
 wy/Z1ptYgT96PFs42fNktIn2A+F/QABMTdSgDLd4yf5bWSSPZiZBwcHCi7WBwpbmCj
 xL+9sCgkyhzU6JSEDS1x2uYjeFeKdkwyoYNNVZTWmKMBnEukIFYy8wVzecD+pzIgNr
 qTblAojx62DG8zKMpZjZJDfAEGFEPLUhEiIpW6UmMcv0u6mPmwbXzqvOlJrKBcTKhg
 py8aI2/lyydPw==
Message-ID: <b47c9ac2-60ae-49c2-883c-ac1bffd9e1fb@kernel.org>
Date: Fri, 29 Aug 2025 20:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nouveau: fix disabling the nonstall irq due to storm
 code. (v2)
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20250829021633.1674524-1-airlied@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250829021633.1674524-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 8/29/25 4:16 AM, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Nouveau has code that when it gets an IRQ with no allowed handler
> it disables it to avoid storms.
> 
> However with nonstall interrupts, we often disable them from
> the drm driver, but still request their emission via the push submission.
> 
> Just don't disable nonstall irqs ever in normal operation, the
> event handling code will filter them out, and the driver will
> just enable/disable them at load time.
> 
> This fixes timeouts we've been seeing on/off for a long time,
> but they became a lot more noticable on Blackwell.
> 
> This doesn't fix all of them, there is a subsequent fence emission
> fix to fix the last few.
> 
> Fixes: 3ebd64aa3c4f ("drm/nouveau/intr: support multiple trees, and explicit interfaces")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Applied to drm-misc-fixes, thanks!

     [ Fix a typo and a minor checkpatch.pl warning; remove "v2" from commit
       subject. - Danilo ]
