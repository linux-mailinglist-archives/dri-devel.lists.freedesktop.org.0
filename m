Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2BB847316
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 16:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB6C10E7DD;
	Fri,  2 Feb 2024 15:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ixo6/KIb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com
 [95.215.58.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAC110E7DD
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 15:23:59 +0000 (UTC)
Message-ID: <eb221db3-76b0-4c69-8736-df5576392717@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1706887437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4aVZhq7FIbirPhZ1n41A8Y/v4CohpET3+Yrw3Uhku5U=;
 b=ixo6/KIb0+6clrNw5EHtXu8r2gG9UTTb3DZaYaDjnqX4Mb28QZm6dGE0QRTwq8rGKjnkWL
 NE9gd2Lob6EQGR8MgvT1T0XxGWSk6Zm7A07CJ2B5+ndMcl25SGVaddtYvUuIfcAmEmgUKo
 B/DthZgvkJ5kYJNDCLoO31+o3kM3NQ4=
Date: Fri, 2 Feb 2024 23:23:42 +0800
MIME-Version: 1.0
Subject: Re: [v2,3/8] firmware/sysfb: Set firmware-framebuffer parent device
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20240202120140.3517-4-tzimmermann@suse.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240202120140.3517-4-tzimmermann@suse.de>
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
> Set the firmware framebuffer's parent device, which usually is the
> graphics hardware's physical device. Integrates the framebuffer in
> the Linux device hierarchy and lets Linux handle dependencies among
> devices. For example, the graphics hardware won't be suspended while
> the firmware device is still active.

This is a very nice benefit, I can't agree more!

Because the backing memory of the firmware framebuffer occupied
belongs to the graphics hardware itself. For PCIe device, the
backing memory is typically the dedicated VRAM of the PCIe GPU.
But there are some exceptions, for example, the gma500. But I
think this can be fixed in the future, as majority(>99.9%) PCIe
GPU has the a dedicated VRAM.


For ARM and ARM64 platform device, the backing memory of the
firmware framebuffer may located at the system RAM. It's common
that the display controller is a platform device in the embedded
world. So I think the sysfb_parent_dev() function can be extended
to be able to works for platform device in the future.

