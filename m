Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3507D847593
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 18:04:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E7A10EF5B;
	Fri,  2 Feb 2024 17:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="eIeXMofi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [91.218.175.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E326B10EF5B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 17:03:55 +0000 (UTC)
Message-ID: <16b3f80f-9b55-4b91-8fc3-9b8ad414437b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1706893431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJaPMNeazUzXDoh/gUAOxSSPoKtwbUU77GxfKC9lEu4=;
 b=eIeXMofiIAiZuvFInz6yrJS98T4hDr+aIksfA30EHCqFQt+DWX7C05snBoADsJOpHkM0no
 XJhequ3vv655zksTgmD8JM13Jg8jAwtn2jFBN3AfLn0M7qU6Cogov+gQ6fYmB6QWjBfNrf
 n4+DnUjXy1Iegl1u+30WauEUDUzVU8Y=
Date: Sat, 3 Feb 2024 01:03:43 +0800
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
> +
> +/**
> + * screen_info_pci_dev() - Return PCI parent device that contains screen_info's framebuffer
> + * @si: the screen_info
> + *
> + * Returns:
> + * The screen_info's parent device on success, or NULL otherwise.
> + */
> +struct pci_dev *screen_info_pci_dev(const struct screen_info *si)
> +{
> +	struct resource res[SCREEN_INFO_MAX_RESOURCES];
> +	ssize_t i, numres;
> +
> +	numres = screen_info_resources(si, res, ARRAY_SIZE(res));
> +	if (numres < 0)
> +		return ERR_PTR(numres);


Please return NULL at here, otherwise we have to use the IS_ERR or IS_ERR_OR_NULL()
in the caller function to check the returned value. Meanwhile, I noticed that you
didn't actually call IS_ERR() in the sysfb_parent_dev() function (introduced by the
3/8 patch), so I think we probably should return NULL at here.

Please also consider that the comments of this function says that it return NULL on
the otherwise cases.


> +	for (i = 0; i < numres; ++i) {
> +		struct pci_dev *pdev = __screen_info_pci_dev(&res[i]);
> +
> +		if (pdev)
> +			return pdev;
> +	}
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL(screen_info_pci_dev);
