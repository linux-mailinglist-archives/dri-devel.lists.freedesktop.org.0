Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CD1184C0F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 17:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1616EC05;
	Fri, 13 Mar 2020 16:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90726EC05
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 16:10:22 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B8CD2072C;
 Fri, 13 Mar 2020 16:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584115822;
 bh=B47v85trEWvjV/lzKS2P3e07BiG8jYMtvyGlf1skrfw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=seaW/ZYd0aXN5SgqyFlnl4kSLtqoDKP8TliSQ3i0Q53m4sCK1YU8bJ1a6qlGaHr4X
 BrZee8SEmHmW8x9xOjqxZVr0dfAmp4VOxRChmKuYj1Khu6nkenoj1K0KEWcFg15I3P
 lcd/h45POIXuc49iOEqu8SdveQ9M50HQzZUsJeOU=
Subject: Re: [PATCH] dma-buf: heaps: bugfix for selftest failure
To: Leon He <hexiaolong2008@gmail.com>, sumit.semwal@linaro.org
References: <1583300076-28392-1-git-send-email-leon.he@unisoc.com>
From: shuah <shuah@kernel.org>
Message-ID: <9be2873c-79c2-2d02-f15a-1e6e0ff7e898@kernel.org>
Date: Fri, 13 Mar 2020 10:10:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1583300076-28392-1-git-send-email-leon.he@unisoc.com>
Content-Language: en-US
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
Cc: Leon He <leon.he@unisoc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kselftest@vger.kernel.org, shuah <shuah@kernel.org>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/3/20 10:34 PM, Leon He wrote:
> If the 'name' array in check_vgem() was not initialized to null, the
> value of name[4] may be random. Which will cause strcmp(name, "vgem")
> failed.

Nit: "to fail" instead of "failed"


> 
> Signed-off-by: Leon He <leon.he@unisoc.com>
> ---
>   tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> index cd5e1f6..21f3d19 100644
> --- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> +++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> @@ -22,7 +22,7 @@
>   static int check_vgem(int fd)
>   {
>   	drm_version_t version = { 0 };
> -	char name[5];
> +	char name[5] = { 0 };
>   	int ret;
>   
>   	version.name_len = 4;
> 

return !strcmp(name, "vgem");

While you are at it, why not change strcmp() to strncmp()?

thanks,
-- Shuah


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
