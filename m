Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A71778A2E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 11:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2125F10E685;
	Fri, 11 Aug 2023 09:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BD410E684;
 Fri, 11 Aug 2023 09:37:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 133DB66D80;
 Fri, 11 Aug 2023 09:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07F3C433C7;
 Fri, 11 Aug 2023 09:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691746666;
 bh=jUB8VsZj4uee0oA780wgQ9ju7Cxe5ZCc6R6lPpXG4hs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gGaDJWkA9t43Cexb+KYgyTgJiDvCgE1Id7EFhXI3HzKZs0GpVE9wiTt9BA8iNhPSJ
 l55/GiQ695LqiZeP1tNT6rJ9ggknUV8zGbNY/e2xH17g/nVK0azwJdJwZDBOGXFH0Y
 KhwmAVBkZOkKPvVzHm5gSiCBgJw72KKE/yzHc8i10Dg0/S1CTsRQjEoYu9XbmZxRRo
 FdTSkylp/bTEmqmNpoowILfi+y4gARSbBl5EkVAA26rS62IPLkvwEl4uIYgNR84rXf
 /KTOWP+E6W2xLn1/ICLAmNIjZc6DEfDTCjSJ59rM7PmSNL64ifD0L6ORPDANa0P/dg
 HRr5Wl/SxqqPg==
Date: Fri, 11 Aug 2023 11:37:38 +0200
From: Simon Horman <horms@kernel.org>
To: Evan Quan <evan.quan@amd.com>
Subject: Re: [PATCH V8 2/9] drivers core: add ACPI based WBRF mechanism
 introduced by AMD
Message-ID: <ZNYBYuUSaio66vLN@vergenet.net>
References: <20230810073803.1643451-1-evan.quan@amd.com>
 <20230810073803.1643451-3-evan.quan@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810073803.1643451-3-evan.quan@amd.com>
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

On Thu, Aug 10, 2023 at 03:37:56PM +0800, Evan Quan wrote:
> AMD has introduced an ACPI based mechanism to support WBRF for some
> platforms with AMD dGPU + WLAN. This needs support from BIOS equipped
> with necessary AML implementations and dGPU firmwares.
> 
> For those systems without the ACPI mechanism and developing solutions,
> user can use/fall-back the generic WBRF solution for diagnosing potential
> interference issues.
> 
> And for the platform which does not equip with the necessary AMD ACPI
> implementations but with CONFIG_WBRF_AMD_ACPI built as 'y', it will
> fall back to generic WBRF solution if the `wbrf` is set as "on".
> 
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Evan Quan <evan.quan@amd.com>
> Signed-off-by: Evan Quan <evan.quan@amd.com>

...

> diff --git a/drivers/acpi/amd_wbrf.c b/drivers/acpi/amd_wbrf.c

...

> +static bool check_acpi_wbrf(acpi_handle handle, u64 rev, u64 funcs)
> +{
> +	int i;
> +	u64 mask = 0;
> +	union acpi_object *obj;
> +
> +	if (funcs == 0)
> +		return false;
> +
> +	obj = acpi_evaluate_wbrf(handle, rev, 0);
> +	if (!obj)
> +		return false;
> +
> +	if (obj->type != ACPI_TYPE_BUFFER)
> +		return false;
> +
> +	/*
> +	 * Bit vector providing supported functions information.
> +	 * Each bit marks support for one specific function of the WBRF method.
> +	 */
> +	for (i = 0; i < obj->buffer.length && i < 8; i++)
> +		mask |= (((u64)obj->buffer.pointer[i]) << (i * 8));
> +
> +	ACPI_FREE(obj);
> +
> +	if ((mask & BIT(WBRF_ENABLED)) &&
> +	     (mask & funcs) == funcs)

Hi Evan,

a minor nit from my side: the indentation of the line above seems odd.

	if ((mask & BIT(WBRF_ENABLED)) &&
	    (mask & funcs) == funcs)

> +		return true;
> +
> +	return false;
> +}

...
