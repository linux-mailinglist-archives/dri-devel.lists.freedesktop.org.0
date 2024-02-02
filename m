Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197668476AF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 18:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A9B10E5E6;
	Fri,  2 Feb 2024 17:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="gM4GFtbJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC83610E5E6
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 17:55:02 +0000 (UTC)
Message-ID: <0fffeeba-b5b5-4ead-92ef-ae0fa7696d17@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1706896500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sog/RReS2NWyNE4PZRnVt/GhPxlyLGb3WF+6769+1Q4=;
 b=gM4GFtbJMjQQGVZhkUC0WlyN3PR+R0Ptw8RHPKq5qZpEn05v6MI43d3aul3XDeFcKGlMg8
 IZjDpXnykx1+5kUgIz5ARX3c8SABbEV45DObm/9NQyfzWhCLd4cjvv22FUSelmSBn2+Z59
 gpkCn96F5+8v0gImpZA1PL8yPKO18MQ=
Date: Sat, 3 Feb 2024 01:54:53 +0800
MIME-Version: 1.0
Subject: Re: [v2,7/8] firmware/sysfb: Update screen_info for relocated EFI
 framebuffers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20240202120140.3517-8-tzimmermann@suse.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240202120140.3517-8-tzimmermann@suse.de>
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
> +static inline void __screen_info_set_lfb_base(struct screen_info *si, u64 lfb_base)
> +{
> +	si->lfb_base = lfb_base & GENMASK_ULL(31, 0);
> +	si->ext_lfb_base = (lfb_base & GENMASK_ULL(63, 32)) >> 32;
> +
> +	if (si->ext_lfb_base)
> +		si->capabilities |= VIDEO_CAPABILITY_64BIT_BASE;
> +	else
> +		si->capabilities &= ~VIDEO_CAPABILITY_64BIT_BASE;
> +}
> +

Do we really has a need to modify the si->capabilities at here?

