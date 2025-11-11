Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C100BC4CD4E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 11:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1903110E536;
	Tue, 11 Nov 2025 09:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="l/oJIHkn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr
 [80.12.242.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC04610E536
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 09:59:57 +0000 (UTC)
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
 by smtp.orange.fr with ESMTPA
 id IlAHvWHdhUOYJIlAHvMunr; Tue, 11 Nov 2025 10:59:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1762855196;
 bh=rFk/u5DUIUOnbpwpW5YN8Igu4wBiIQtesflrYhSz5qw=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=l/oJIHknGgHm9tLXVlQVKfbV2ktA1ZUuWCay6cnp9XlDj6BimiqzCReBk8nQksH8V
 quW0bxax5WHxVRkSJ8aknh1ZPBQLEdRmC5G48SylytGo+XXPsHj78d7WQYOCiIVfuS
 mrEULjQAOEjcBTZ+ZCPC9N696K7e+4f6MvpDqxOVAhSV4v5Prti0HOyTlJxCK9Axw5
 TUDC2YABvIA22HIiS2b+oBtzcGPNLx+smfdJiPuHUF8vj/49c3JFGPO6oN2MyvFT9+
 Nqmx0va8PQGtcIOluIanisna36z0WVpKdVT6S7OvaaU7nMelwITmt45UwbCZTo3d9e
 aNN03tCE11WEw==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 11 Nov 2025 10:59:56 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <2c0da6a9-e766-49be-a679-9d19e5d14992@wanadoo.fr>
Date: Tue, 11 Nov 2025 10:59:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 5/5] accel/amd_vpci: Add communication channel service
To: David Zhang <yidong.zhang@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sonal.santan@amd.com,
 mario.limonciello@amd.com, lizhi.hou@amd.com, Nishad Saraf <nishads@amd.com>
References: <20251111011550.439157-1-yidong.zhang@amd.com>
 <20251111011550.439157-6-yidong.zhang@amd.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <20251111011550.439157-6-yidong.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Le 11/11/2025 à 02:15, David Zhang a écrit :
> This patch introduces the communication channel (comm_chan) service, which
> enables communication between the management PF driver and the user PF
> driver.
> 
> The comm_chan service provides a shared-memory-based command channel
> located in a BAR-mapped region. The user PF driver issues requests by
> writing command messages into this region. The management PF driver
> periodically polls the region and process any pending requests.
> 
> Supported operations include firmware (xclbin) reloads, where the
> management PF invokes 'versal_pci_load_xclbin' to reprogram the embedded
> firmware through the remote management queue service.
> 
> This service provides the foundation for dynamic firmware updates and other
> management requests from the user PFs.
> 
> Co-developed-by: Nishad Saraf <nishads@amd.com>
> Signed-off-by: Nishad Saraf <nishads@amd.com>
> Signed-off-by: David Zhang <yidong.zhang@amd.com>

...

> @@ -160,10 +222,13 @@ static const struct config_item_type versal_pci_cfs_table = {
>   static int versal_pci_cfs_init(struct versal_pci_device *vdev)
>   {
>   	struct configfs_subsystem *subsys = &vdev->cfs_subsys;
> +	char dev_name[64] = "";

No need to init I think.

> +
> +	snprintf(dev_name, sizeof(dev_name), "%s%x", DRV_NAME, versal_pci_devid(vdev));

This hunk could already be in patch 1. This would make this patch smaller.

>   
>   	snprintf(subsys->su_group.cg_item.ci_namebuf,
>   		 sizeof(subsys->su_group.cg_item.ci_namebuf),
> -		 "%s%x", DRV_NAME, versal_pci_devid(vdev));
> +		 "%s", dev_name);
>   
>   	subsys->su_group.cg_item.ci_type = &versal_pci_cfs_table;
>   

...
