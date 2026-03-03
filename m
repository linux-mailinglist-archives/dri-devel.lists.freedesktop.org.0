Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPHrL7PdpmnRXwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:10:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B831EFF03
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66A710E7C8;
	Tue,  3 Mar 2026 13:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mXOwY/0l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C452410E7C8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 13:10:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0488C6013E;
 Tue,  3 Mar 2026 13:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55358C116C6;
 Tue,  3 Mar 2026 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772543405;
 bh=HUeuT9h9PdBSYE/DGwyF8wqKXoc/6Qk3eot9qc8dq1Q=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=mXOwY/0lplsiNBAMoUcSfq5Gwic6Za+XuOA1oLsfQdiFpSsLDlzGt1nefY+6wghA0
 VLzRclPrmUqz+5UTEojQIBZR5pkNzIVEBrIwRYPzyrZlHmmIZLreMSCjQQ4O55K6rU
 vPoeV6OLrkRS1+bVJBZty9hADMJKUSsS3HWkwun7LNwoavmW/L8Lhl21Msx0l6YioM
 V2fnlfvRGB45l/9rfS+tQJ67oQkwcgghmwyRGQ5RT1vBrDqGvzTNUMf2Imw7xgYGTZ
 IcWpRccSLY0JTfuwlir3UupYNA3SUZHb9tWuY7iozVab7TzcK7ND7cMR74CLuB0K1J
 D+2LRd2meA+1w==
Message-ID: <ec1b4d750ae4d87d84d8a751400f468a@kernel.org>
Date: Tue, 03 Mar 2026 13:10:03 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Albert Esteve" <aesteve@redhat.com>
Subject: Re: [PATCH v2 1/6] dma-buf: dma-heap: Keep track of the heap device
 struct
In-Reply-To: <20260303-b4-dmabuf-heap-coherent-rmem-v2-1-65a4653b3378@redhat.com>
References: <20260303-b4-dmabuf-heap-coherent-rmem-v2-1-65a4653b3378@redhat.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 echanude@redhat.com, iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mripard@redhat.com,
 "Benjamin Gaignard" <benjamin.gaignard@collabora.com>,
 "Brian Starkey" <Brian.Starkey@arm.com>, 
 =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "John
 Stultz" <john.stultz@linaro.org>, "John Stultz" <jstultz@google.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Rob
 Herring" <robh@kernel.org>, "Robin Murphy" <robin.murphy@arm.com>, "Saravana
 Kannan" <saravanak@kernel.org>, "Sumit Semwal" <sumit.semwal@linaro.org>, "T.J.
 Mercier" <tjmercier@google.com>
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
X-Rspamd-Queue-Id: 44B831EFF03
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aesteve@redhat.com,m:devicetree@vger.kernel.org,m:echanude@redhat.com,m:iommu@lists.linux.dev,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mripard@redhat.com,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:christian.koenig@amd.com,m:john.stultz@linaro.org,m:jstultz@google.com,m:m.szyprowski@samsung.com,m:mripard@kernel.org,m:robh@kernel.org,m:robin.murphy@arm.com,m:saravanak@kernel.org,m:sumit.semwal@linaro.org,m:tjmercier@google.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue, 3 Mar 2026 13:33:44 +0100, Albert Esteve wrote:
> From: John Stultz <john.stultz@linaro.org>
> 
> Keep track of the heap device struct.
> 
> This will be useful for special DMA allocations
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
