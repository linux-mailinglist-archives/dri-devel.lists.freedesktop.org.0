Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 797467E5A42
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 16:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBF910E7A5;
	Wed,  8 Nov 2023 15:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B119210E7A5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 15:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1699457920; x=1700062720; i=deller@gmx.de;
 bh=RQou+busEXK1el5zagRtSD2v4f/DHN4LUnOWxuImoNc=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=MVoryq9aaD0lgknM+UykwFhr5H8QWMEsO8Ivs+H0RX38+Yoq2lpvcwUXRqsP4ssp
 9MyqRQGuza8yUUkXHpWXCtYrXg22Hu15Qq9iWRXemfFi4zVLnC+KBn7ZMtNBXXR5l
 x9pf8UpCCfscsNVfFfa3z69nbq2HrtBg/cjPdZBWEFY0LdPAOxv+rrj8b4cveEjqI
 6rGj0uUD3ALOkGv5F9goOa9RP4CyGYtqom0+nUnSHconA2EYThZYAXWBvh4vRX1te
 agHhUOmuhj+02AoOOFDTeJ6z4j8hBt18x/ShQ7AOeIg7JFS5y0kHd9hQN/T4+r5jR
 RWQ+QOf51XI4dy7DtA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.158.7]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M59C8-1r1r6K0dUa-0017cZ; Wed, 08
 Nov 2023 16:38:40 +0100
Message-ID: <a320ae82-24ce-4c0d-bae3-b14e43c1f512@gmx.de>
Date: Wed, 8 Nov 2023 16:38:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: hyperv_fb: fix uninitialized local variable use
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Arnd Bergmann <arnd@arndb.de>
References: <20231108145822.3955219-1-arnd@kernel.org>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20231108145822.3955219-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FZdTMf13wFxPAhxWZWg2c1R3JIZiLXzi/PpA4Y686kMa4OeoiGp
 x6GgrfU4s0EUvilEfSxrx4rA7HQ8K2+0QusK1x0dx3F+fm3PUWMiVRNNlX/ynD4svy7cwYb
 yftFBOfAyxH9/5V5gJ/2mULmAaO/J57ltXHmoB8AmvWOAWu8n1wfw2Q+AZlu9JTvcP8LY8T
 262qXyYAdhsFVuANvXxsg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hE/kDwUmU60=;TSD0lDDHyPmTJmerdbCVP0c9oNq
 6s+JIPQ12n+ya4EhCeunURrxv4I63E656WsUxI7rfjk8ARQp+yhm94wvcOT/p6PFqqMkU0PM0
 DgmboqYbkD80qovpuVrg90hNBK3T+AzRPw1A9HS/x2NhyA4y75Rfk+hIqU1OFw9cA5AqsZ+H1
 lCuN34bxMFVpj+PAaGFHPBgQPlbXM5SpLmPiu/5nrjIBKSnpZBsEecNKqdaC/jd7ONzLOcLoP
 yXE6EoMq7KnnRDrEhUrg+dRXwDbb372t+SdhCbi2n//gMs6+DzPdj7YfCfd0phTO15EJoweiZ
 BlBgnLNrV/gpSP+tyxqpFrDdAVan1v1g4P5sRHWmEgkVyLPouz2nAArjZqPffs1l081/34TGq
 aQUR0GU7HYzHxzM+GblqI55RlGlyd72a/+wBzy7MGocW2Lv23Z8PSRmsLACncV7UymPiyCpXk
 hYM1oTJkcO9sk4u9Z4zdmBEdB7ULZ4pWYW2SfocwqV1gKgX9DnJBt53G3jXSzEFVMYPnEYcTa
 W0Tr2ur5C1OYdA8izMCxUWCKevB9xJ8MXerz0FwQHIU+lJUL1zuOCmJs+rpjFj0/0S/n/UtbF
 qN3xctWBFI0U7atNq8XaW3owvweBiHje3LLudMg9dDNaAYxM8of+SJSihRyEVhB3w55B61m3i
 mas4m21VMuowLihJnaraz0lJZvh+A8fdEi/z9z7xNbd9iI2QuJObRoJPouhZkqp6iEOBfP4zC
 LJwHwAGXX9pfMUSHew9WF5zRx5Pl1SQlXvTduA0Uf3VuDqXjmPQpXLvR65PJaD2xdbqn1fI/S
 jrJfhqiptQoW3I1aMmOjiqdBDZvHGLdOfj/hxKD+OmD9zHYJuiQ7NXax2t2niWLdEXl2hT7vf
 tmWfTARiAuxGpyZ4RsCI/InRvA+vQBHAFTyjdk2gPj1/JOXSCn5Ss7EMpB71+Qv9lZZUpTaj6
 tM8Ia6NUFaedoGUX3e4H+TJSrpI=
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
Cc: linux-hyperv@vger.kernel.org, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michael Kelley <mikelley@microsoft.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dawei Li <set_pte_at@outlook.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/8/23 15:58, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> When CONFIG_SYSFB is disabled, the hyperv_fb driver can now run into
> undefined behavior on a gen2 VM, as indicated by this smatch warning:
>
> drivers/video/fbdev/hyperv_fb.c:1077 hvfb_getmem() error: uninitialized =
symbol 'base'.
> drivers/video/fbdev/hyperv_fb.c:1077 hvfb_getmem() error: uninitialized =
symbol 'size'.
>
> Since there is no way to know the actual framebuffer in this configurati=
on,
> just return an allocation failure here, which should avoid the build
> warning and the undefined behavior.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202311070802.YCpvehaz-lkp@intel.com/
> Fixes: a07b50d80ab6 ("hyperv: avoid dependency on screen_info")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

applied.

Thanks!
Helge


> ---
>   drivers/video/fbdev/hyperv_fb.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyper=
v_fb.c
> index bf59daf862fc..a80939fe2ee6 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -1013,6 +1013,8 @@ static int hvfb_getmem(struct hv_device *hdev, str=
uct fb_info *info)
>   	} else if (IS_ENABLED(CONFIG_SYSFB)) {
>   		base =3D screen_info.lfb_base;
>   		size =3D screen_info.lfb_size;
> +	} else {
> +		goto err1;
>   	}
>
>   	/*

