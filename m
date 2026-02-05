Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI46Av+ThGk43gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 13:58:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D12DF2E20
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 13:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F08710E892;
	Thu,  5 Feb 2026 12:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mkkng4ci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44C310E896
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 12:58:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 99CB54396B;
 Thu,  5 Feb 2026 12:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184FAC4CEF7;
 Thu,  5 Feb 2026 12:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770296314;
 bh=S2s8/bMyKmVdiSDHAWjHlKyaaSVCT0Yx1Zo2MXvJ1WI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mkkng4ciZVY11wIeOZkrjjS1eW04HepM3zK7vDKNRh2Gzrz5ZYTA8oNpDipCVaBt6
 Zju30QUlAMefAPOOjTGaXXLVUV1j3QM0oc/xRbw5x0XTqwH3O14ddftpyKslwxOuJF
 OcB71+Bg3NLhejGFSqcv7La1FyMwzYLXBRiHjlMGoDhwM1PoGWqV82Mhxdku5fQFE2
 2UhjTPRQ/72BvjUm3jWYNQcm6KAEIiosAvAhIiIB1Phz+pdAL8MGAyu1F4CrQ2hC6+
 P6/bK3xP8hOEVKWZ28iCgV7/jIF+CMBcfVyIXI9aTucOTbYl1TK+nrvLj2dWceXko/
 7twWrocbp3tEg==
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Edward Srouji <edwards@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Yishai Hadas <yishaih@nvidia.com>
In-Reply-To: <20260201-dmabuf-export-v3-0-da238b614fe3@nvidia.com>
References: <20260201-dmabuf-export-v3-0-da238b614fe3@nvidia.com>
Subject: Re: [PATCH rdma-next v3 0/3] RDMA: Add support for exporting
 dma-buf file descriptors
Message-Id: <177029631173.955437.5307722032449149162.b4-ty@kernel.org>
Date: Thu, 05 Feb 2026 07:58:31 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgg@ziepe.ca,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:edwards@nvidia.com,m:linux-kernel@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:yishaih@nvidia.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6D12DF2E20
X-Rspamd-Action: no action


On Sun, 01 Feb 2026 16:34:03 +0200, Edward Srouji wrote:
> This patch series introduces dma-buf export support for RDMA/InfiniBand
> devices, enabling userspace applications to export RDMA PCI-backed
> memory regions (such as device memory or mlx5 UAR pages) as dma-buf file
> descriptors.
> 
> This allows PCI device memory to be shared with other kernel subsystems
> (e.g., graphics or media) or between userspace processes, via the
> standard dma-buf interface, avoiding unnecessary copies and enabling
> efficient peer-to-peer (P2P) DMA transfers. See [1] for background on
> dma-buf.
> 
> [...]

Applied, thanks!

[1/3] RDMA/uverbs: Support external FD uobjects
      https://git.kernel.org/rdma/rdma/c/6b848074a32078
[2/3] RDMA/uverbs: Add DMABUF object type and operations
      https://git.kernel.org/rdma/rdma/c/e6738fe6cad448
[3/3] RDMA/mlx5: Implement DMABUF export ops
      https://git.kernel.org/rdma/rdma/c/992a14bb2150a1

Best regards,
-- 
Leon Romanovsky <leon@kernel.org>

