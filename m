Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD158474C4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 17:31:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA34910E821;
	Fri,  2 Feb 2024 16:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="SJJ53zC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D39410E7FB
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 16:31:30 +0000 (UTC)
Message-ID: <7f3b8c61-3266-4bba-b866-c3e5623b3893@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1706891488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JwKDah+9JROKYiTvmPGJVpBw/xhrL3KACrk4d9rdK6w=;
 b=SJJ53zC5KNtHW4DTTROBmgMGudmS6iaqT+cuLlcOO/V+WkJfQBjWO3IDlKhWLPQeJv2/mb
 kSiw5lJ0csIhIMeq1XOccyMmjqB5eXxuZ2TLZXdNeeGJgRoNRljKgrZEoqF06iyvwWDHzs
 sFR2kTEY68fDTW3q1e7lWtQbXR311lg=
Date: Sat, 3 Feb 2024 00:31:18 +0800
MIME-Version: 1.0
Subject: Re: [v2,2/8] video: Provide screen_info_get_pci_dev() to find
 screen_info's PCI device
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20240202120140.3517-3-tzimmermann@suse.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240202120140.3517-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 2024/2/2 19:58, Thomas Zimmermann wrote:
> diff --git a/drivers/video/screen_info_pci.c b/drivers/video/screen_info_pci.c
> new file mode 100644
> index 0000000000000..d959a4c6ba3d5
> --- /dev/null
> +++ b/drivers/video/screen_info_pci.c
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/pci.h>
> +#include <linux/screen_info.h>
> +
> +static struct pci_dev *__screen_info_pci_dev(struct resource *res)
> +{
> +	struct pci_dev *pdev;
> +
> +	if (!(res->flags & IORESOURCE_MEM))
> +		return NULL;
> +
> +	for_each_pci_dev(pdev) {
> +		const struct resource *r;
> +
> +		if ((pdev->class >> 16) != PCI_BASE_CLASS_DISPLAY)
> +			continue;
> +
> +		r = pci_find_resource(pdev, res);
> +		if (r)
> +			return pdev;
> +	}
> +
> +	return NULL;
> +}


I recommend using the pci_get_base_class() or pci_get_class() helper function at here,
for example:


static struct pci_dev *__screen_info_pci_dev(struct resource *res)
{
	struct pci_dev *pdev;

	if (!(res->flags & IORESOURCE_MEM))
		return NULL;

	while ((pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev))) {
		if (pci_find_resource(pdev, res))
			return pdev;
	}

	return NULL;
}


