Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0155D82DE8D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 18:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D0D89CE3;
	Mon, 15 Jan 2024 17:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D12C10E341
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 17:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705340284;
 bh=iduTJ/WtuW2mW9R+esEiBxFH2e4txAtiiKj024vBohA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QJPS0gkzt14hopKXiDWNY+Ymedf4whA+0feWgB6E0nbSchlFoiBGWdt5XaiQO2Apt
 AeAlgvnMWLn60ZkwIsy0XLK+oUed//YAM/lDeAwNLitysdZe7Np9OUJFGTfuNok78m
 bv+BptLfd1NCr3S2o+HaCjmIlUnfkxVrjQXJtl3raZYj2RRfInur6Us1Z8+hXXJeJo
 TlROi0BeyY461IUVbgf1N7th5/U21uODOeMsOtmbi6QdC9WeNtwtaDDkPMgQ8hrPPN
 Gsf0Bzfa0nTqHnToWNSEvlq+GJXZvA+FpIUlKGa6UHs2ErsUyoP4mOPMY47DU8UQKU
 NNPWVxyACcJWA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DE38537813E4;
 Mon, 15 Jan 2024 17:38:03 +0000 (UTC)
Date: Mon, 15 Jan 2024 18:38:02 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 07/14] drm/panthor: Add the MMU/VM logical block
Message-ID: <20240115183802.56752678@collabora.com>
In-Reply-To: <20231204173313.2098733-8-boris.brezillon@collabora.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-8-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Grant Likely <grant.likely@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  4 Dec 2023 18:33:00 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> +/**
> + * panthor_vm_idle() - Flag a VM idle
> + * @VM: VM to flag as idle.
> + *
> + * When we know the GPU is done with the VM (no more jobs to process),
> + * we can relinquish the AS slot attached to this VM, if any.
> + *
> + * We don't release the slot immediately, but instead place the VM in
> + * the LRU list, so it can be evicted if another VM needs an AS slot.
> + * This way, VMs keep attached to the AS they were given until we run
> + * out of free slot, limiting the number of MMU operations (TLB flush
> + * and other AS updates).
> + */
> +void panthor_vm_idle(struct panthor_vm *vm)
> +{
> +	struct panthor_device *ptdev = vm->ptdev;
> +
> +	mutex_lock(&ptdev->mmu->as.slots_lock);
> +	if (vm->as.id >= 0 && list_empty(&vm->as.lru_node))
> +		list_add_tail(&vm->as.lru_node, &ptdev->mmu->as.lru_list);

This doesn't work as soon as we have more than one scheduling group
per VM. If one of them is being scheduled out while the other stays on
a FW slot, the VM becomes idle and its AS might be re-assigned to a
different group. We need to refcnt the active users here, and only
return the AS when this active_cnt reaches 0.

> +	mutex_unlock(&ptdev->mmu->as.slots_lock);
> +}
