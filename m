Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAB8AD1DEE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAF210E0E4;
	Mon,  9 Jun 2025 12:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qbpDb4hy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9700510E0E4;
 Mon,  9 Jun 2025 12:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7secJjDVA9749QLJuQUPdGVTCaa4cHmTCEXJuagOrNA=; b=qbpDb4hym+8yFZyrYS5WyjgRF7
 KCWMEL4ilnaavv/VmY/i5YzREAFV8mvorrSigGfIEFHnFvCH1fReCarZRlA6gipa10+baaBKYBxKh
 FvEQe5aurdR9KD0Gb7BfRh1pa1oiHbaplsIyl+WQRuYTzutgZxlpDoDk5la0j/DjPHnToUAhp9aFq
 lTwuCt+jOua1UkU0QCq24N1kcbfCRfgf2gk0F2dY9cgeSspM0L96vVzqlggYVok0ZHJtxrYSM3wGB
 BGa6uCgW++EK/Eg9BJurms1Gmvju9tALJkToACIs1WgqfcAy/Uh23AHKbTEcCVwVvVKSKoaoKlJLJ
 L17Zc8AA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uObkD-001Q4d-W6; Mon, 09 Jun 2025 14:36:54 +0200
Message-ID: <7e8a86d4-447f-4e50-a745-0f6f5771d1fa@igalia.com>
Date: Mon, 9 Jun 2025 13:36:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] gpu/trace: make TRACE_GPU_MEM configurable
To: Juston Li <justonli@chromium.org>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, Yiwei Zhang <zzyiwei@google.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250603225123.2535767-1-justonli@chromium.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250603225123.2535767-1-justonli@chromium.org>
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


On 03/06/2025 23:50, Juston Li wrote:
> v3:
>   - Patch introduced to replace per-driver config (Lucas)
> 
> Signed-off-by: Juston Li <justonli@chromium.org>
> ---
>   drivers/gpu/trace/Kconfig | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/trace/Kconfig b/drivers/gpu/trace/Kconfig
> index c24e9edd022e6..cd3d19c4a201c 100644
> --- a/drivers/gpu/trace/Kconfig
> +++ b/drivers/gpu/trace/Kconfig
> @@ -1,4 +1,13 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
>   config TRACE_GPU_MEM
> -	bool
> +	bool "Enable GPU memory usage tracepoints"
> +	default n
> +	help
> +	  Choose this option to enable tracepoints for tracking
> +	  global and per-process GPU memory usage. Intended for
> +	  performance profiling and required for Android.
> +
> +	  Tracepoint availability varies by GPU driver.
> +
> +	  If in doubt, say "N".

Maybe it is a bit sub-optimal that the item shows up under the top level 
drivers group. Which is already pretty busy. Maybe on top something like:

diff --git a/drivers/Kconfig b/drivers/Kconfig
index 7c556c5ac4fd..c5edbd2288a1 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -209,8 +209,6 @@ source "drivers/thunderbolt/Kconfig"

  source "drivers/android/Kconfig"

-source "drivers/gpu/trace/Kconfig"
-
  source "drivers/nvdimm/Kconfig"

  source "drivers/dax/Kconfig"
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 5df981920a94..96adceab2df0 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -70,5 +70,6 @@ if FB_CORE || SGI_NEWPORT_CONSOLE

  endif

+source "drivers/gpu/trace/Kconfig"

  endmenu


To move it under Device Drivers -> Graphics support? Give or take the 
exact positioning.

Regards,

Tvrtko

