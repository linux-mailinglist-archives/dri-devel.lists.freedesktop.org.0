Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9049C073FD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D55910EB05;
	Fri, 24 Oct 2025 16:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cUV4mLrq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EE410EB05
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:18:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B731E60210;
 Fri, 24 Oct 2025 16:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44D5C4CEF1;
 Fri, 24 Oct 2025 16:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761322723;
 bh=Lio6aSIN2AW0oulEGIcetaNn+Qrc/6jfNppmbbkRsqE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cUV4mLrqFgPPHs6P/+1O2qcE8fpSBixCRaJ/6yT/YsB2C3IvlcRfyQVA6xsWLB+9j
 pw7JFjbIc2LQwzARvlYfG1qD3jqAeNGykCFd/Xp7hHGSD7HmBk7AUEUPJYKOX/o/so
 rMx0MBEWgRHlwqhOnjsp1xTobyb9T6RwbsRn25i0NdYhGzX2Tft8KlekKpolVgJhqN
 FeiVvWAuShiAFtBfmAAf1OFgczcT/v/aEKdnoNIg60RGS+SRnOl/hMz2WmEGQ8Hayp
 A7V17aAFdPk7I9QF5Sv6h2uHQ+ApW1fPM0JYdbpDVBhDOP23FpgrDV4z31Up1rMlte
 PZ590fgeebX0g==
Message-ID: <18606a7a-82ea-40fc-a834-b32e843a6e84@kernel.org>
Date: Fri, 24 Oct 2025 18:18:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Correct return of dma_fence_driver_name()
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251024075019.162351-2-phasta@kernel.org>
 <11b7a8a5-170f-4815-a8ac-5dba2d8e67a1@igalia.com>
 <5de88e79575e06c053f2d61f7bb58bf9cf5b556e.camel@mailbox.org>
 <1d0bbdcf-f4d6-49c0-bbdf-364c2af80868@igalia.com>
 <89812f66-25a6-4f9e-aa4f-74adbf116db8@kernel.org>
 <5640fbf1-7b8d-4537-9f1a-b401a7a4934b@igalia.com>
 <8cba66d2-9608-4a5c-a2af-6cc91f46a49f@kernel.org>
 <cefe8f07-68a3-4c93-ae46-ebb01ff6fa2c@igalia.com>
 <b21ba8b4-a31f-44e5-a2da-ba585a93d3a6@kernel.org>
 <66f066b0-a8bb-40b2-bdd8-7cbcf114cde1@igalia.com>
 <02b7cdce-95fe-475f-a346-b41fd5615695@kernel.org>
 <5b828e1e-bebd-4730-8866-7a650c1f724f@igalia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <5b828e1e-bebd-4730-8866-7a650c1f724f@igalia.com>
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

On 10/24/25 6:06 PM, Tvrtko Ursulin wrote:
> Maybe "decoupled-driver"?
SGTM.
