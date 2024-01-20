Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B972983362F
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 22:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E0410E352;
	Sat, 20 Jan 2024 21:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC78110E352
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 21:10:13 +0000 (UTC)
Message-ID: <5c5963ff-a534-48cc-8f9f-f4fdf148a78b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1705784971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+S2ObV2/YH2S8+7iUwGpRhOQmSga0yvQ9tyOFWkUX/Q=;
 b=C7vCrYOjac4pVxEdnNRwLXxHTU8pf5OcLPIhsQzXmkHuOjq2XuQi9wkrgYJuy99EMOjOXH
 yn+Y7oclr/PptlZUuZnNVOR0+bFKjn19qLIg+K56NdbkqgmgvFYhx9+dVKNGRLHI2LU8eu
 YHBrf4oG2SSO/MXAkJvCu7BlCjdUQPE=
Date: Sun, 21 Jan 2024 05:09:24 +0800
MIME-Version: 1.0
Subject: Re: drm/loongson: Error out if no VRAM detected
Content-Language: en-US
To: yetist <yetist@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Huacai Chen <chenhuacai@kernel.org>
References: <20240119104049.335449-1-chenhuacai@loongson.cn>
 <1ead2284-dbc1-4938-bdce-66971c70ef1e@linux.dev>
 <4144ea1c-f500-43b6-8641-ea21acae3376@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui JIngfeng <sui.jingfeng@linux.dev>
In-Reply-To: <4144ea1c-f500-43b6-8641-ea21acae3376@gmail.com>
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
Cc: "loongson-kernel@lists.loongnix.cn" <loongson-kernel@lists.loongnix.cn>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2024/1/21 00:07, yetist wrote:
> Without this patch, my server cannot start the DM. It is a Loongson 
> 3C5000L server, with both a Loongson display controller and an ASPEED 
> graphics card.
>
>   $ lspci |grep VGA
>   0000:00:06.1 VGA Compatible Controller: Loongson Technology LLC DC 
> (Display Controller) (rev 01)
>   0000:03:00.0 VGA-compatible controller: ASPEED Technology, Inc. 
> ASPEED Graphics Family (revision 41)
>
> When not working, there is the following information in dmesg:
>
>   loongson 0000:00:06.1: [drm] Private vram start: 0xe00472a6000, 
> size: 0MiB
>   Loongson 0000:00:06.1: [drm] *Error* Request (0MiB) failed
>
>
> Anyway, this patch works fine with my server now, thank you.
>

Does the sever you are using has a dedicated VRAM for the 0000:00:06.1?

If not, the driver shouldn't be probed. This also means that the 0000:00:06.1
(Display Controller) shouldn't be detected by Linux kernel, because there is
no way for this driver can works correctly on such a case.

