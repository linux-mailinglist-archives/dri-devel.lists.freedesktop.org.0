Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC4D6BD0E6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 14:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0325710E19D;
	Thu, 16 Mar 2023 13:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D738D10E19D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 13:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1678973683; i=deller@gmx.de;
 bh=dw+iQ9rvbmABYoF8/RwO4zPaytP0u+W8BAyDnWXpy1k=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Q2b/FtZ4mX1JXBx8y442QEyA2bBCKyd5kx1RxudwesxblfO4VQSThZ3Omfl7vrmtH
 zqLmuSlH/b2AJHKA93Aqk14PPFCwHtLiDByp7BNsN4w02dwQ2Yi0o0033ve5dxTxY7
 RLswatRo0yEumduLLP/kJSH/7ZnsOv3m2KwZp+FPeUwRU/1vsIs/UWtaFVhby5+z/b
 Wivt9kFuIFc1K0d3Yhd7xx6yF9L8PwOzcDLTT3E0tY08CG/ohX9g5F6b0VUeiSR9GG
 +HuQjusIiDVwX46IocWmPfJ+wZbUbKqUtO/+1/bpGOWN+oTBdUX7t+8Hb7YdY3ixRl
 AXbmr/2nlij+Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.149.95]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2O2W-1pfXqP0ggw-003rqR; Thu, 16
 Mar 2023 14:34:43 +0100
Message-ID: <78ea59ba-72ab-db50-4d66-b1ad84ed8548@gmx.de>
Date: Thu, 16 Mar 2023 14:34:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] fbdev: nvidia: Fix potential divide by zero
Content-Language: en-US
To: Wei Chen <harperchen1110@gmail.com>, adaplas@gmail.com
References: <20230315071831.3833948-1-harperchen1110@gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230315071831.3833948-1-harperchen1110@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fNcJl7Z4HC0lzHljP7pqiCwEqkxUbZX9jGfP/jXuGbZOznQr4wP
 FCYe1fz3OyoZkdYeKa47XD/CvxIV6sltPRf9R9krQJEffpSt6hM7kWBzit9up59T+Qy6jmN
 Fi4tFOYgxI5OunqqnT81g0r2p/BDQ2NkD2YEXEC4nEI/ML04TkKwLArJLR0J9jE26+7k+Mt
 mW+3QVTBJY+a3/SEHyjwA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:13xPqJdiFKY=;w7KyePPl+2LLpb5kyifOh3wr6eA
 NRSZVIvZ0pHrmjRyp2MDB/vkUmB+uqpaS/pCGZiobLgwenlQ29z16esekj2kqUCdgB2+nOS7L
 55SgUu574/c7fS0BV0jhM37Bu37H7iXOekPBgVgpoOGOl+8Qhh3IBcbNyXld8CJayZ7xy+UPv
 tSIdYW+WU1u3zWi7rpEoQJaNBtjDijE34kZkh9ZWn5ixHCRS4VQdtP/xCKVFROemqfVM6BuO8
 GHHE76J37/eBuQE8wS3kVZikrYbd2iUk4leXpgkQ3ja+SpkRZ/ACO+HMG96XFOPNHwiCCQD+S
 lJRStEfNFQnXO1h1wPQSIj2Jtl8UskBzhkIow5pNwxIzvNEKy8hsUFurZpLLp/J+7l8z0NGHH
 zosxulVsWbhUtqqa3pa0RB1YOMxmQMeZEhg9OtP1Pn6q32kxGmRR1oHRlmEZuDAWg25qoYCdG
 LQaGpPSyExdYVAVYJQHXFuGyMKpkTD6Zjzjf6onsKo1DCt/F62EXBbn063U7OJO6F0ai4hy/Q
 pGmlJyQ810KNYzFvkjU1PQUKGC5OTTI55KE1leWaTC3K7OVsBZg/0HaOSVljqPtQpkDJ89rON
 zSHkPUXrPdCSyU6/7Kt9MIgC0K1rSzFgaC2s7FXmNuZxlu9Edyr8gDhc3uM2z7JA1nFyNeV7u
 dAqDFwBs+fEU1h3w7WJlTFK18ZmoGBgLn5d2EocIwO8cc7Nlh9bI+0f5Van5anghPyi/lUqOq
 0KdnitRRf7XYQtPm2PMhbcz3ooY5K6d49GGju9c8cozCdA+/u1tGcU2SHZwQGSnNpAdBCHDT1
 Ygigfl3kQ+paaR/iIyhsbYqLJYnhQFJlfLXTTr736QZVnrApmcJMlZZ9mw8GB2SqlLlALnO3e
 RSV78Qtb6TVKnDFB4s1hPY9OCsR/dIiLBdbuEEm1GJZQSXejwAuS97iffkd7x/G0L4YN/wj2M
 vSyTZg==
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/15/23 08:18, Wei Chen wrote:
> variable var->pixclock can be set by user. In case it
> equals to zero, divide by zero would occur in nvidiafb_set_par.
>
> Similar crashes have happened in other fbdev drivers. There
> is no check and modification on var->pixclock along the call
> chain to nvidia_check_var and nvidiafb_set_par. We believe it
> could also be triggered in driver nvidia from user site.
>
> Signed-off-by: Wei Chen <harperchen1110@gmail.com>

applied all four patches.

Thanks!
Helge

> ---
>   drivers/video/fbdev/nvidia/nvidia.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/n=
vidia/nvidia.c
> index e60a276b4855..ea4ba3dfb96b 100644
> --- a/drivers/video/fbdev/nvidia/nvidia.c
> +++ b/drivers/video/fbdev/nvidia/nvidia.c
> @@ -764,6 +764,8 @@ static int nvidiafb_check_var(struct fb_var_screenin=
fo *var,
>   	int pitch, err =3D 0;
>
>   	NVTRACE_ENTER();
> +	if (!var->pixclock)
> +		return -EINVAL;
>
>   	var->transp.offset =3D 0;
>   	var->transp.length =3D 0;

