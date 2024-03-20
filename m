Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AC58816B8
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 18:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E5D10FE9E;
	Wed, 20 Mar 2024 17:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="OBMB51H9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com
 [91.218.175.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D47610FE9E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 17:42:39 +0000 (UTC)
Message-ID: <de284953-ce42-4607-a59c-f38148089b8a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710956557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=biY2sJwOIQ1gykN315MV2n3xhHytDJlMOOMZOMJ8/kQ=;
 b=OBMB51H9XJrTT49WNIyh0e5XzlXNNsCuI8si3AWf7d/QSejtY55Z7/MiZdnI3aqwC1IZc7
 7JCOtAcOKl+JskElBnllpcYypWx+nt79Rh04USfaTDEX541IAoZAGgozvjtGinsp8V8PXL
 pZwz//WisZyGXZnplQxcakr5so6dmaE=
Date: Thu, 21 Mar 2024 01:42:29 +0800
MIME-Version: 1.0
Subject: Re: [v5,10/13] drm/ast: Acquire I/O-register lock in DDC code
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240320093738.6341-11-tzimmermann@suse.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240320093738.6341-11-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


Tested with ast2600 hardware, no obvious problem found yet.


dmesg  | grep ast

  ast 0000:09:00.0: VGA not enabled on entry, requesting chip POST
  ast 0000:09:00.0: Using default configuration
  ast 0000:09:00.0: AST 2600 detected
  ast 0000:09:00.0: [drm] Using analog VGA
  ast 0000:09:00.0: [drm] dram MCLK=396 Mhz type=1 bus_width=16
  [drm] Initialized ast 0.1.0 20120228 for 0000:09:00.0 on minor 0
  ast 0000:09:00.0: [drm] fb0: astdrmfb frame buffer device


On 2024/3/20 17:34, Thomas Zimmermann wrote:
> The modeset lock protects the DDC code from concurrent modeset
> operations, which use the same registers. Move that code from the
> connector helpers into the DDC helpers .pre_xfer() and .post_xfer().
>
> Both, .pre_xfer() and .post_xfer(), enclose the transfer of data blocks
> over the I2C channel in the internal I2C function bit_xfer(). Both
> calls are executed unconditionally if present. Invoking DDC transfers
> from any where within the driver now takes the lock.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>


Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Tested-by: Sui Jingfeng <sui.jingfeng@linux.dev>

-- 
Best regards,
Sui

