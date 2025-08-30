Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E6FB3CB55
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 15:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECAC110E05F;
	Sat, 30 Aug 2025 13:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FY6k6nEf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A73910E05F;
 Sat, 30 Aug 2025 13:51:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 11593601AE;
 Sat, 30 Aug 2025 13:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8240BC4CEEB;
 Sat, 30 Aug 2025 13:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756561916;
 bh=2uyG4+ulgAzEzQvhrODw7yVCoX+JjMIGXVH6/1D9sgU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FY6k6nEfkzkw4RLA8A3XB78AzuOPkaqDpXLULO9+9DX2t3i7KrQcB+ccnFI4gA/tB
 L5BCHDY0auXo3e0xdwr+WyGNhQ8J8TtGDx+wxvo4ijhXcU5uKHLha03l+2vmoSSGbj
 /bN6HAxFamFwbnO8bccQIxX0FcOWIWnx86wKiwgmejIMgMj4uCVTC0zupCfdpPkz8R
 FaUB2bfBe1mxiH8hW6y+sTWm6CzcpBfQWgd8nf1UuoouA1AXCL/xjlNlNELbI16B/x
 DGZjSyc1WnwxmRIVBQA/AL6Io7omfmTaUnbxlPvKV5wE6EeWNfQzoDc6gibBjlwt+/
 tl/8dk6yRieyQ==
Message-ID: <41730916-2f02-4584-99bc-5556355bceeb@kernel.org>
Date: Sat, 30 Aug 2025 15:51:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: take advantage of pci::Device::unbind()
To: acourbot@nvidia.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250830133255.62380-1-dakr@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250830133255.62380-1-dakr@kernel.org>
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

On 8/30/25 3:32 PM, Danilo Krummrich wrote:
> +    pub(crate) fn unbind(&self, pdev: &pci::Device<device::Bound>) {
> +        // Unregister the sysmem flush page before we release it.
> +        kernel::warn_on!(self.bar.access(pdev.as_ref()).map_or(true, |bar| {
> +            self.sysmem_flush.unregister(bar);
> +
> +            false
> +        }));
> +    }
>   }

Actually, inspect() + is_err() is much nicer:

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 2db9afdc6087..ca4ea5749975 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -303,10 +303,10 @@ pub(crate) fn new(

      pub(crate) fn unbind(&self, pdev: &pci::Device<device::Bound>) {
          // Unregister the sysmem flush page before we release it.
-        kernel::warn_on!(self.bar.access(pdev.as_ref()).map_or(true, |bar| {
-            self.sysmem_flush.unregister(bar);
-
-            false
-        }));
+        kernel::warn_on!(self
+            .bar
+            .access(pdev.as_ref())
+            .inspect(|bar| self.sysmem_flush.unregister(bar))
+            .is_err());
      }
  }

