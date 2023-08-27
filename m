Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF0E78A006
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 17:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9445110E1B8;
	Sun, 27 Aug 2023 15:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6546B10E1B8;
 Sun, 27 Aug 2023 15:43:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F4EF602E5;
 Sun, 27 Aug 2023 15:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD65C433C8;
 Sun, 27 Aug 2023 15:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693151007;
 bh=bPb4p4j0igZCsViibtVoyOO+JM0u5QNB2s0HIgV+F8I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lC44SRzrz4+W1/99hfg3uctoMoGo8F8b9BvJLyDlihyuz3NJ3XpESzTeDCSAw5uBR
 p0dwoGWIBkEt5/2tCuIHNUtllS+hiJjoQ1zpyofy47tXbEMI2VPMhm1q4R1kSluSNx
 2MxxGeDs6JiyybQdvmUEp7BpegjQ2oXA2oKROvhDj/3y7ZGUTqO8kB5vLUEVGJrUls
 J7omuqoSq0psI8MzX+L6V8SzHkTb0dXSWNnYafi+TeW/pW8Ig8R1WhPWgiZNTKsIIn
 iTowfQ5UTG1oH/WXP9oeYXumpG6f2BFAbv50c4NxjItLE5vPDNNiFYdCdZe6XwZ9lr
 LFWxOpV/Fz3Yw==
Date: Sun, 27 Aug 2023 17:43:12 +0200
From: Simon Horman <horms@kernel.org>
To: Evan Quan <evan.quan@amd.com>
Subject: Re: [V10 1/8] ACPI: Add support for AMD ACPI based Wifi band RFI
 mitigation feature
Message-ID: <20230827154312.GT3523530@kernel.org>
References: <20230825083846.4001973-1-evan.quan@amd.com>
 <20230825083846.4001973-2-evan.quan@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825083846.4001973-2-evan.quan@amd.com>
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
Cc: rafael@kernel.org, netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lijo.Lazar@amd.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, edumazet@google.com, mario.limonciello@amd.com,
 alexander.deucher@amd.com, kuba@kernel.org, johannes@sipsolutions.net,
 pabeni@redhat.com, davem@davemloft.net, lenb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 25, 2023 at 04:38:39PM +0800, Evan Quan wrote:
> Due to electrical and mechanical constraints in certain platform designs
> there may be likely interference of relatively high-powered harmonics of
> the (G-)DDR memory clocks with local radio module frequency bands used
> by Wifi 6/6e/7.
> 
> To mitigate this, AMD has introduced a mechanism that devices can use to
> notify active use of particular frequencies so that other devices can make
> relative internal adjustments as necessary to avoid this resonance.
> 
> Signed-off-by: Evan Quan <evan.quan@amd.com>

...

> diff --git a/drivers/acpi/amd_wbrf.c b/drivers/acpi/amd_wbrf.c

...

> +/**
> + * acpi_amd_wbrf_add_exclusion - broadcast the frequency band the device
> + *                               is using
> + *
> + * @dev: device pointer
> + * @in: input structure containing the frequency band the device is using
> + *
> + * Broadcast to other consumers the frequency band the device starts
> + * to use. Underneath the surface the information is cached into an
> + * internal buffer first. Then a notification is sent to all those
> + * registered consumers. So then they can retrieve that buffer to
> + * know the latest active frequency bands. The benifit with such design

nit: ./checkpatch.pl --codespell suggests benifit -> benefit.

> + * is for those consumers which have not been registered yet, they can
> + * still have a chance to retrieve such information later.
> + */
> +int acpi_amd_wbrf_add_exclusion(struct device *dev,
> +				struct wbrf_ranges_in_out *in)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(dev);
> +	int ret;
> +
> +	if (!adev)
> +		return -ENODEV;
> +
> +	ret = wbrf_record(adev, WBRF_RECORD_ADD, in);
> +	if (ret)
> +		return ret;
> +
> +	blocking_notifier_call_chain(&wbrf_chain_head,
> +				     WBRF_CHANGED,
> +				     NULL);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(acpi_amd_wbrf_add_exclusion);

...
