Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 455FB778A0A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 11:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB3B10E682;
	Fri, 11 Aug 2023 09:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7DE10E682;
 Fri, 11 Aug 2023 09:35:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7AAED66D3A;
 Fri, 11 Aug 2023 09:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D312C433C8;
 Fri, 11 Aug 2023 09:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691746499;
 bh=6nDL0utgw9wol8LbIsinlH77MMHM0gseUrwwE+1ZLyU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EeG1NLe583ovTo1ZKn2ViOlb2z0+MIv6z8INw8IouAdVmkw4jEAlxtWA55ZI/rENV
 2JS9IQHwBpdxSeezxRH21OyWoY/KJXJzAtUk71UgGeUvVJmNvJiUnbMra0c19t+tyy
 XFVZZFQkrjbB+G7hfjPPq1lwkJq/npA8LYbO3LXS7x5GJJSw8tWGDsOU1d/5QOZG9R
 7MLbnKt2uSes8rpWROYaRfjlziiS9cHmBz97Ys/d8kolTTgcs9NQO0Hi/7mZjE2xQH
 j2eWboyoeIujLA8u9+EMXQZvZS4hpGDbBOtDFLKIValNbUrgKMFqu+MLcm+CtFycfK
 z04vFqqVFQPsA==
Date: Fri, 11 Aug 2023 11:34:51 +0200
From: Simon Horman <horms@kernel.org>
To: Evan Quan <evan.quan@amd.com>
Subject: Re: [PATCH V8 6/9] drm/amd/pm: setup the framework to support Wifi
 RFI mitigation feature
Message-ID: <ZNYAuyrEWbRiHm55@vergenet.net>
References: <20230810073803.1643451-1-evan.quan@amd.com>
 <20230810073803.1643451-7-evan.quan@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810073803.1643451-7-evan.quan@amd.com>
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
Cc: andrew@lunn.ch, jingyuwang_vip@163.com, bellosilicio@gmail.com,
 rafael@kernel.org, trix@redhat.com, Lijo.Lazar@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mdaenzer@redhat.com, Mario.Limonciello@amd.com, amd-gfx@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 lenb@kernel.org, andrealmeid@igalia.com, arnd@arndb.de, hdegoede@redhat.com,
 netdev@vger.kernel.org, Xinhui.Pan@amd.com, linux-wireless@vger.kernel.org,
 edumazet@google.com, Christian.Koenig@amd.com, tzimmermann@suse.de,
 Alexander.Deucher@amd.com, johannes@sipsolutions.net, davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 03:38:00PM +0800, Evan Quan wrote:
> With WBRF feature supported, as a driver responding to the frequencies,
> amdgpu driver is able to do shadow pstate switching to mitigate possible
> interference(between its (G-)DDR memory clocks and local radio module
> frequency bands used by Wifi 6/6e/7).
> 
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

...

> +/**
> + * smu_wbrf_event_handler - handle notify events
> + *
> + * @nb: notifier block
> + * @action: event type
> + * @data: event data

Hi Evan,

a minor nit from my side: although it is documented here,
smu_wbrf_event_handler has no @data parameter, while
it does have an undocumented _arg parameter.

> + *
> + * Calls relevant amdgpu function in response to wbrf event
> + * notification from kernel.
> + */
> +static int smu_wbrf_event_handler(struct notifier_block *nb,
> +				  unsigned long action, void *_arg)
> +{
> +	struct smu_context *smu = container_of(nb, struct smu_context,
> +					       wbrf_notifier);
> +
> +	switch (action) {
> +	case WBRF_CHANGED:
> +		smu_wbrf_handle_exclusion_ranges(smu);
> +		break;
> +	default:
> +		return NOTIFY_DONE;
> +	};
> +
> +	return NOTIFY_OK;
> +}

...
