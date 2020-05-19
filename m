Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7581D9DB0
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 19:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F216E11A;
	Tue, 19 May 2020 17:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE976E11A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 17:19:08 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA80B20709;
 Tue, 19 May 2020 17:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589908748;
 bh=XTf3GXvvKPis3qS60syTZxccwFz7ZD9sbAXlJXifamY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=chicMmrTiHVMnEkCiI/ijQjxwAyxygx1vrTAchl8JGL98z30Y6KgeXCPEr17gcM1A
 9A4Qt1W2gZTbAgbRLtlDdrZtL6HsbsnoJ+uVUQmcG6rf7elaJ5smVFOwjQudXNDecd
 iG80B2sOSKcYwgBCE8R9y6ZInrU7uBSuZTNRGhLM=
Date: Tue, 19 May 2020 19:19:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [RFC PATCH 1/4] gpu: dxgkrnl: core code
Message-ID: <20200519171906.GA1101627@kroah.com>
References: <20200519163234.226513-1-sashal@kernel.org>
 <20200519163234.226513-2-sashal@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519163234.226513-2-sashal@kernel.org>
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
Cc: linux-hyperv@vger.kernel.org, sthemmin@microsoft.com,
 tvrtko.ursulin@intel.com, haiyangz@microsoft.com, spronovo@microsoft.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, wei.liu@kernel.org, linux-fbdev@vger.kernel.org,
 iourit@microsoft.com, alexander.deucher@amd.com, kys@microsoft.com,
 Hawking.Zhang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 19, 2020 at 12:32:31PM -0400, Sasha Levin wrote:
> +/*
> + * Dxgkrnl Graphics Port Driver ioctl definitions
> + *
> + */
> +
> +#define LX_IOCTL_DIR_WRITE 0x1
> +#define LX_IOCTL_DIR_READ  0x2
> +
> +#define LX_IOCTL_DIR(_ioctl)	(((_ioctl) >> 30) & 0x3)
> +#define LX_IOCTL_SIZE(_ioctl)	(((_ioctl) >> 16) & 0x3FFF)
> +#define LX_IOCTL_TYPE(_ioctl)	(((_ioctl) >> 8) & 0xFF)
> +#define LX_IOCTL_CODE(_ioctl)	(((_ioctl) >> 0) & 0xFF)

Why create new ioctl macros, can't the "normal" kernel macros work
properly?

> +#define LX_IOCTL(_dir, _size, _type, _code) (	\
> +	(((uint)(_dir) & 0x3) << 30) |		\
> +	(((uint)(_size) & 0x3FFF) << 16) |	\
> +	(((uint)(_type) & 0xFF) << 8) |		\
> +	(((uint)(_code) & 0xFF) << 0))
> +
> +#define LX_IO(_type, _code) LX_IOCTL(0, 0, (_type), (_code))
> +#define LX_IOR(_type, _code, _size)	\
> +	LX_IOCTL(LX_IOCTL_DIR_READ, (_size), (_type), (_code))
> +#define LX_IOW(_type, _code, _size)	\
> +	LX_IOCTL(LX_IOCTL_DIR_WRITE, (_size), (_type), (_code))
> +#define LX_IOWR(_type, _code, _size)	\
> +	LX_IOCTL(LX_IOCTL_DIR_WRITE |	\
> +	LX_IOCTL_DIR_READ, (_size), (_type), (_code))
> +
> +#define LX_DXOPENADAPTERFROMLUID	\
> +	LX_IOWR(0x47, 0x01, sizeof(struct d3dkmt_openadapterfromluid))

<snip>

These structures do not seem to be all using the correct types for a
"real" ioctl in the kernel, so you will have to fix them all up before
this will work properly.

> +void ioctl_desc_init(void);

Very odd global name you are using here :)

Anyway, neat stuff, glad to see it posted, great work!

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
