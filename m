Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6B7C16E61
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA12010E1EA;
	Tue, 28 Oct 2025 21:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="ZSylgAtc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE1910E1EA
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1761686110; x=1762290910; i=deller@gmx.de;
 bh=MbSuqvYTWyysj/QidqqkZwh+9BWIHr/TunCLSDd8ZQU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ZSylgAtcRM9n4ETOclWB90Benf3+Zx8vYffW9TjjjsyeDHRBVBF/ATU3p/i9YmCd
 /lDKQo5gtUg94xq8cWFC5IPsvfXyBkfVUpGQfNDth/yGvcjxdIVFgaivSWIpP3CHe
 KBO8f8UpshdpCmJCIvFl5J4s3owi9D7PMIQalKB76o91Nghckus16CuddyENsawUL
 BK2s14HdbNaVkn8pL/+Rv+3YeHhVXIi9S4G/E9+MXA9xrjXGyZYLfF2lI9+9Yr+gH
 3klie7lC/XqcA9HHHMBwXBP/0en5fttLr+kNvN20/fsRHAFnMOvaZIYunllq98iKy
 mBW8cpl0o6VNachQ3Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.74]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxUrx-1wBAsZ3CiP-00sxeT; Tue, 28
 Oct 2025 22:15:10 +0100
Message-ID: <1e872104-e744-45f9-b2f3-8007fb818b05@gmx.de>
Date: Tue, 28 Oct 2025 22:15:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: valkyriefb: Fix reference count leak in
 valkyriefb_init
To: Miaoqian Lin <linmq006@gmail.com>, Paul Mackerras <paulus@ozlabs.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20251027084340.79419-1-linmq006@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251027084340.79419-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rWqTqucdygaqtmK0fPiWZJuXQNe9Ki5Xytp2RsfKGoLXOyJ5iLM
 jDfRACRx6gavtWMhZ1mkZx15YQNHeL/M9wbczz542sFpGb4RAZ/iQrO6TvfZWkWCFI+kyC3
 Vt7eVY7Mg7sHW3Qcm8pzgf+e9ZeBR4Fx085HTRSY9b3e4Ai2nvxMGDStQSYQxcknwY60X04
 caSsCLWdRw+m6ibxb8kCg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:k4rWfg6ov4s=;2Mzdh9JwF5zLFHyqzp5fIFnmKah
 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
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

On 10/27/25 09:43, Miaoqian Lin wrote:
> The of_find_node_by_name() function returns a device tree node with its
> reference count incremented. The caller is responsible for calling
> of_node_put() to release this reference when done.
>=20
> Found via static analysis.
>=20
> Fixes: cc5d0189b9ba ("[PATCH] powerpc: Remove device_node addrs/n_addr")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>   drivers/video/fbdev/valkyriefb.c | 2 ++
>   1 file changed, 2 insertions(+)

applied.

Thanks!
Helge
