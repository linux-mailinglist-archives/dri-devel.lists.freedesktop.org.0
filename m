Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49637A359D7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 10:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACBA10EC10;
	Fri, 14 Feb 2025 09:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Wt5hy5Mb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D6510EC10
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739524289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tc1JWOShCi1X8A1xhO1+gcj4TkWCQ20kztsYnt5EtUI=;
 b=Wt5hy5MbnOFyRncE/n9BdnSxI+Ge6cAB92PS/gPaMk49EScSWepB9BLZC91DuET01Era/j
 M53aVNjwZ7eORAyGSU6eGZvA95GTjk/iAmyDHTGisVSCvZs4fNuBBhDYi9hxC2kyNZOTWR
 CyLsy7WcJXp4Sj5T9dXI0pvHpGnotp8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-YoSwEB83OmCavVl5moOFNQ-1; Fri, 14 Feb 2025 04:11:27 -0500
X-MC-Unique: YoSwEB83OmCavVl5moOFNQ-1
X-Mimecast-MFC-AGG-ID: YoSwEB83OmCavVl5moOFNQ
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43947979ce8so10585405e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 01:11:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739524286; x=1740129086;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tc1JWOShCi1X8A1xhO1+gcj4TkWCQ20kztsYnt5EtUI=;
 b=ReMHDfMRnJnwtiM0fWAZab//uEgPSmiV9l1cshAa0fN+1HxXX2vzhWQqd8SMYWMlR5
 eNa4JJgH6SpNbw/S/fERIMsMoRh4M1gs+xXQWsKGWY4Ie1AjeQlJbrK+ucfA3NCbMrZ0
 DY5unRAS+ztEdLzGlOYlSLsdM3fW4nMzY4VZc1RfCPDZ2SepvNYC0yF2Je5x8rkp8NoI
 LGplNwTvtLipEcFX+cN9KkPSmUHa2kDtd/cOcpYZb8kQw41tfBlq2oi5FIa28hfVwWtU
 MGk0ZzVspwj3WUd44fk0TivdSMZ2gGS28ZaDJvq86xEXn7ZxQ7RNCtPkMEtjs/qDUurh
 8A2w==
X-Gm-Message-State: AOJu0YxsZ2cA7yIkCcAtfGgk9/S4+70n/62O7wNefanPSBF96d+KuwQX
 V26Fmm3NpmufEV/RepwDyj9q/DM2hoGZsW5eIUO+TStu8O6mK0XAwdJwz8WO4+W3zJm9+FRzp89
 TqN5rPjTM+z8j7Ty4Iyz7ZIia78OivcvPGc1LD144vR2c3h2U5lGxDmEGEtXwKN+yEg==
X-Gm-Gg: ASbGnctc+z5XraBjyHVXWAGfpLyzuOwdMmzhYCjdyrfTiVW+CWSfJh/Avw+4tZ1pXbJ
 lPntVm9MoDn25sXYerjjzwWtMscrqHp1EDeplN0j0pZykI8SxC+G0P2HIrWF0tv+VKA1KoPu2d9
 JIORuHCSehTw533Y1zqbLp1nUS4CsNwWY6ozmVrmXQsxtSrUN2+qSotJxAexEucP3h1cdFKHFwZ
 mFffeEzG+mgBU+8ckEArl1q2i5UgNTutMe7fz5j1Bf/fmCndpt8Bq1IHJ673ALWHHXG+joKfi03
 r7pD15HypyPApDv0p9IU6yAftkoHBLRYYhSufSbu4zYN
X-Received: by 2002:a05:600c:1c82:b0:439:5803:414f with SMTP id
 5b1f17b1804b1-43959925af0mr124879125e9.5.1739524286286; 
 Fri, 14 Feb 2025 01:11:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGm8E96RB+m5k1Gt+SNihIV0fG42Jn/aA5AqyqoTBxngX/vsPEjKtSg1L/z2dEVb0ZzNTtCJw==
X-Received: by 2002:a05:600c:1c82:b0:439:5803:414f with SMTP id
 5b1f17b1804b1-43959925af0mr124876945e9.5.1739524284504; 
 Fri, 14 Feb 2025 01:11:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a04f208sm69679755e9.6.2025.02.14.01.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 01:11:24 -0800 (PST)
Message-ID: <cd7a9908-d4ba-45ca-a5cb-de8ac7ef72d0@redhat.com>
Date: Fri, 14 Feb 2025 10:11:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Include ASPEED ast-drm 1.15.1 video driver in kernel tree
To: Nicolas Baranger <nicolas.baranger@3xo.fr>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, airlied@redhat.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
References: <d507f6268ea3158b5af82b6860ca7b71@3xo.fr>
 <194c4656963debcf074d87e89ab1a829@3xo.fr>
 <b296bfef-1a9c-4452-baeb-09f86758addd@suse.de>
 <984c317de1027f5886390a65f1f66126@3xo.fr>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <984c317de1027f5886390a65f1f66126@3xo.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uFYevNpQ5JK_gLL8jTpyE4K3pmUZhOf1rIMWxhP7MNU_1739524286
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 13/02/2025 10:27, Nicolas Baranger wrote:
> Dear Thomas
> 
> Thanks for answer and help.
> 
> Yes, due to .date total removal in linux 6.14 (https://github.com/ 
> torvalds/linux/commit/cb2e1c2136f71618142557ceca3a8802e87a44cd <https:// 
> github.com/torvalds/linux/commit/ 
> cb2e1c2136f71618142557ceca3a8802e87a44cd>) the last DKMS sources are :
> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/ 
> nba_last_src_20250212/src/ <https://xba.soartist.net/ast- 
> drm_nba_20250211/nba-dkms/nba_last_src_20250212/src/>
> 
> You can also find this sources in directory drivers/gpu/drm/ast_new of 
> the tarball https://xba.soartist.net/ast-drm_nba_20250211/nba-kernel/ 
> linux-6.14.0.1-ast1.15.1-rc2_nba0_20250212.tar.gz <https:// 
> xba.soartist.net/ast-drm_nba_20250211/nba-kernel/linux-6.14.0.1- 
> ast1.15.1-rc2_nba0_20250212.tar.gz>
> 
> I'm surprised by the fact the in-kernel driver 0.1.0 is more advanced 
> than Aspeed version 1.15.1 because on my system it has very poor 
> rendering and is very slow, twinkle is high and had poor colors.
> The screen flickering is high and it's like if I was using a very old 
> cathode ray tube monitor (In fact I'm using a SAMSUNG LCD monitor which 
> is perfectly functionnal and which display a nice and eyes confortable 
> picture when using ast 1.15.1 driver or the video output of the Nvidia 
> GPU ).
> 
> 
> My testing system is a test Xeon server with an AST2400 BMC with its AST 
> VGA card as the main video output (to be able to have a screen on the 
> BMC KVM) +a discrete NVIDIA GPU I'm using for GPGPU and 3D rendering 
> with Nvidia prime render offload.
> What I constat with embed kernel driver 0.1.0 is that the Xeon processor 
> is doing the video job for example when watching a video, and it's not 
> the case with version 1.15.1 even when displaying on the AST VGA card a 
> vulkan rotating cube (compute by nvidia GPU with nvidia prime but 
> display by the AST VGA card of the AST2400).
> Note that with in-kernel version 0.1.0 it's nearly impossible to make 
> round the vulkan cube at more than half a round by  second where it's 
> working (very) fine for a 32MB video memory card with version 1.15.1 as 
> you can see in the video present in the online directory
> 
> I'm not developer or kernel developer so be sure that I wouldn't have 
> done all this work if the in-kernel ast version 0.1.0 was usable out-of- 
> the-box
> 
> Sure you can give me a patch I will test on this server (building 
> mainline+ast_new yesterday tooks 19 minutes on this server)
> 
> PS:
> here is a 'git diff linux-6.14.0.1-ast-rc2/drivers/gpu/drm/ast 
> linux-6.14.0.1-ast-rc2/drivers/gpu/drm/ast_new'
> https://xba.soartist.net/ast-drm_nba_20250211/nba-dump/ast- 
> fullpatch.patch <https://xba.soartist.net/ast-drm_nba_20250211/nba-dump/ 
> ast-fullpatch.patch>
> Diff is about 250+ kb so the 2 drivers seems to have nothing to do with 
> each others...
> 
> Thanks again for help
> 
> Kind regards
> Nicolas
> 
> 
> Le 2025-02-13 08:57, Thomas Zimmermann a écrit :
> 
>> Hi Nicolas
>>
>> Am 12.02.25 um 19:58 schrieb Nicolas Baranger:
>>> Dear maintener
>>
>> That's mostly me and Jocelyn.
>>
>>>
>>> I did include ast-drm driver version 1.15.1 (in replacement of 
>>> version 0.1.0) on the new mainline kernel too (6.14.0-rc2) and I 
>>> issue a new dkms patch
>>>
>>> Last DKMS patch had been sucessfully tested on mainline.
>>> And last ast.ko version 1.15.1 included in linux tree had also been 
>>> sucessfully tested
>>>
>>> Online directory is updated with :
>>> - new DKMS patch
>>> - new DKMS srouces
>>> - new DKMS debian package
>>> - new tarball of mainline included ast_new ported in kernel tree
>>> - new kernel debian package (mainline with ast_new)
>>>
>>>
>>> NB: online directory is here: https://xba.soartist.net/ast- 
>>> drm_nba_20250211/ <https://xba.soartist.net/ast-drm_nba_20250211/>
>>>
>>> Please let me know what I should do to see this change in linux-next
>>
>> I'm having a little trouble with figuring out which of the many driver 
>> sources is the relevant one. Am I correct to assume it's the one at
>>
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/ 
>> nba_last_src_20250212/src/ <https://xba.soartist.net/ast- 
>> drm_nba_20250211/nba-dkms/nba_last_src_20250212/src/>
>>
>>
>> About that driver: Although the official driver reports an ancient 
>> version number, it is an up-to-date driver. It is actually more up-to- 
>> date than Aspeed's package. Both drivers share source code and a few 
>> years ago there was an effort to bring the kernel's driver up to the 
>> same feature set. Since then, the kernel's driver has been updated, 
>> reworked and improved.
>>
>> About the performance: From what I can tell, the only significant 
>> difference in these drivers is memory management. Your ast_new driver 
>> uses an older algorithm that we replaced quite a few releases ago. The 
>> old version was unreliable on systems with little video memory, so we 
>> had to replace it.  I don't know why the new code should be slower though.

Regarding the performances of ast driver, I remember doing profiling 
some times ago, and when running glxgears (with llvmpipe), 65% of the 
CPU time was wasted in page fault 
(https://elixir.bootlin.com/linux/v6.13.2/source/drivers/gpu/drm/drm_gem_shmem_helper.c#L534)
But as this driver is mostly used for console/basic desktop usage, I 
didn't investigate more.

If I remember correctly, the switch to shmem, is because some devices 
have only 16MB of memory, and 1920x1200x32bits takes ~9MB, so it's not 
possible to have double buffering in this case. (And this is required by 
most desktop environment).

The switch to shmem was done with "f2fa5a99ca81c drm/ast: Convert ast to 
SHMEM", and introduced in v6.2. So maybe if you can try with a v6.1 
kernel, using the built-in ast driver and report if it has better 
performances.

Best regards,

-- 

Jocelyn

>>
>> If I give you a patch against a recent Linux kernel, are you capable 
>> of building the patched kernel and testing that change on your system?
>>
>> Best regards
>> Thomas
>>
>>
>>>
>>> Thanks for help
>>>
>>> Kind regards
>>> Nicolas Baranger
>>>
>>>
>>> Le 2025-02-11 19:15, Nicolas Baranger a écrit :
>>>
>>>> Dear maintener
>>>>
>>>> For my own usage, I did make work the ASPEED ast-drm 1.15.1 video 
>>>> driver on mainline kernel (6.13.0 + 6.13.1).
>>>>
>>>> ASPEED video driver is availiable here:
>>>> https://www.aspeedtech.com/file/support/Linux_DRM_1.15.1_4.tar.gz 
>>>> <https://www.aspeedtech.com/file/support/Linux_DRM_1.15.1_4.tar.gz>
>>>>
>>>> But it only work for LTS kernel
>>>> So I modify the DKMS package and I build a new Debian DKMS package 
>>>> with the adapted  source.
>>>> My patch can be find here :
>>>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/astdiff.patch 
>>>> <https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/astdiff.patch>
>>>> See the README:
>>>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/README 
>>>> <https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/README>
>>>>
>>>> Using this new 'ast 1.15.1' driver, performance are amazing compared 
>>>> to the 'ast' driver include in kernel tree, specially when using a 
>>>> discrete GPU and offloading VULKAN / 3D on it but using AST VGA card 
>>>> as the main video card and as the main and only video output (the 
>>>> discrete GPU is used only for offloading 3D or for cuda/opencl)
>>>>
>>>> So to make things easier, I include the new 'ast 1.15.1' driver in 
>>>> kernel tree as AST_NEW : linux-6.13.1-ast/drivers/gpu/drm/ast_new'
>>>> It's working fine as you can see on this video :
>>>> https://xba.soartist.net/ast-drm_nba_20250211/ 
>>>> vulcan_nvidia_prime_render_offload_on_ast_vga_card.webm <https:// 
>>>> xba.soartist.net/ast-drm_nba_20250211/ 
>>>> vulcan_nvidia_prime_render_offload_on_ast_vga_card.webm> I upload 
>>>> all the work I've done here :
>>>> https://xba.soartist.net/ast-drm_nba_20250211/ <https:// 
>>>> xba.soartist.net/ast-drm_nba_20250211/>
>>>>
>>>> See the global README :
>>>> https://xba.soartist.net/ast-drm_nba_20250211/README <https:// 
>>>> xba.soartist.net/ast-drm_nba_20250211/README>
>>>>
>>>> and the README in nba-kernel sub-directory :
>>>> https://xba.soartist.net/ast-drm_nba_20250211/nba-kernel/README 
>>>> <https://xba.soartist.net/ast-drm_nba_20250211/nba-kernel/README>
>>>>
>>>> I'm not a developer so please let me know if I made the things the 
>>>> right way and if this new 'ast 1.15.1' driver can be ported to 
>>>> linux-next or linux-? ?
>>>> If you need more explanations, do not hesitate to contact me, I 
>>>> would be happy to help
>>>>
>>>> Kind regards
>>>> Nicolas Baranger

