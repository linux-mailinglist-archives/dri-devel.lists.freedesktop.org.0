Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 713ABA58061
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 03:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1994410E1A4;
	Sun,  9 Mar 2025 02:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="ZjSPWoGV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF7A10E0D4
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 02:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1741489120; x=1742093920; i=deller@gmx.de;
 bh=nJBkMsS0v7qRX5aa5e+44c/E2mxBpR2Z9drP3iujy58=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ZjSPWoGVfnFecFQnqiRuoZk3ARKST6TKeOCRDllcrSLVge83Sip/idtcxaUYLfoX
 ubGiycKBLcVe4iS6TgCfkVgj4u3tp4kA31vTH//E5K8+gW1bCQrS3J/Yuman0PdhP
 TL80WbR3DdwnrjpFr3lBoFPT8i4H8OQTiQzZS/bw9H61dtSZ0VMCLvdhIY8UnG2Xg
 tOGxc1rbFX1OZBlwS1UouXJmZClnNuSFRWmFJ+Kgq4JlTDV3RRHrbNccIrZ/RmZnW
 IVNB11xgG94MAgWFbVHEHuSyd/0DPjJ56EMDFVWH7T6P9e9brzAGAZgk9Qoyvwb3R
 SRUbVS/imUwEHV/q+Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.121]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3lc9-1trNim3l9n-00GPup; Sun, 09
 Mar 2025 03:58:39 +0100
Message-ID: <24668c7d-6333-423e-bd48-28af1431b263@gmx.de>
Date: Sun, 9 Mar 2025 03:58:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] fbdev: hyperv_fb: Fix hang in kdump kernel when on
 Hyper-V Gen 2 VMs
To: mhklinux@outlook.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, javierm@redhat.com, thomas.tai@oracle.com
Cc: tzimmermann@suse.de, kasong@redhat.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org
References: <20250218230130.3207-1-mhklinux@outlook.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250218230130.3207-1-mhklinux@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mjL3hSxydgxv7auKb+SF1HiGYsIAUsuqH4aH6FyBTYujmpsQrlr
 mVRi1TjTwptv0fzG3qplQmey45gO+xpH2l7vdBQdCxuQq36Uh0Zb7hczbnMI00hkvC8P71L
 zAEGWlfYgYFxMVAnxECokdx4vBaao1qvoqPk3Ogw8/FpOEIViSc19mK8T/FLXiFIdCZNjLO
 utPCl0/kTBxN+Y3JygsXQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SVlwpZIM65s=;hImY14q1ReQCkPBo9c3HVJW24Vi
 bySCSPP22C2nUvsMCaajKmS7Ixn8lCf1z9NhNY57sh5h57LWGdkOTAre915uDf8vkJTImdJps
 RziLMSvb6H9Ed1xeh0kniBLhqd9V4iNUbOf44e5vRBACzEnEZKXx/RyQjsFjDl2sB3fhnOsOg
 8p4sem9b8tesVNGN7QR756mHdCXHyiG4+RKEAinPvCR5payYzLvXsVzmLNwtqLx1yQIUaGP6X
 8OHtelwCBxnzSfrmzjLLkbRbY6mpeiAu5x/P3WM8QCyyfUcGxXU3ous33EdXt2vNUf5abJon1
 qCFnxw1k56rLVn2gvD11kSa7mPaQgxIq+kLZ8uFhzYijzixoI2cM9lqK5XuyxT+ZDyCrTjMhV
 Ms5j/ELgFb4W1lOxb2U1Rvx1I+n3tjQHEZ6FECK/aug59YYkVkYtS4w+UaBBioeIP/tJm/R9t
 ZxZKECUD1nY8ap2T0vnzq5eIoM8Bbnesmc9FnuwTdp3nrivyxd8+wNo6QRQvguCFBUtrEvYYG
 bgN+K9XWkxJsms1O2e8rbsLz42Qz/i9xadErW3Jja0Okycywb6ZlvIaZ8qe4oiyKV51vUS3NE
 ii0nfdTumZKx5PKJV4vIe3bbxsNyi6hLgLnktHd2fU4dT84tgTiKMsW1DAaXhxPTyDgp7l4ct
 JeeYpqzTV666IFgsa1Xi6I9kjaXdNQLcisTo8wqS6HxxGfOLdvxBvQhDdn5rfvOvN6rdGZNYn
 AD0VtqctXP3g0bGkvGAv8MALw4fpmBTb7hLjj09cqGID48Mtgo7FfQNDSa8gyF71BmGwmmjO5
 ywEKx4kBxP4fDz7ojBFjztWMwZE9QzHq9xuDNM/Ut/ve21+VZ3GphoOg8OK55qG0Khkqj176V
 Xh3CRwq9C5jPy2qFF7e37FFYnxOvojtiNua+CWsk2SXBfVZjl29Y7SR+hkPeYOimeGySa4YHk
 oPsGuseex5JPD1mZpAFNUFuAgUTNj38Gh9ZEQVUk++n0DFTQxzfMIgznKcCV7gskjlV/XFJMA
 xYfFXBuakM5ExaHtfI2HBXzXsnFpf3IV9HFB7aN+Yh7XVRJfmkH9sEeLhpewVSPj6bkzmvvg6
 iMnB0O2r2RpAErPWwCOoht4dZ25wVoYhlNK4VXlrerpGTk/tuNFFNIDHGUZ/Qzv+J90RkiFG9
 sw0EYyxp7PKwwXxzwPnC5dg0BDnA576PygDymsHoch/IHNeRY9U7aNj1DxCP8WFhkc+MIwA+l
 pSZYl1Dx/aDBVHKRkqTgHe/k6T6T0I00ukvxGrNSkClDyRguhhwUtogKh2HYGDsyqWcwcSxSk
 kvETH+12UG5nZcavO9srgVygPbj7tI46tNi8TTXBVGSBJnuoieYMOuvsZG+m8SLY+KxCQBgJZ
 A046kIBgGH147jaPBx8F35NqIgc/m49ZsYKB4nNhW8TzAMT0kt3PAGgcpibUepBWYRx0dVcxO
 fyK9rIw==
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

On 2/19/25 00:01, mhkelley58@gmail.com wrote:
> From: Michael Kelley <mhklinux@outlook.com>
>
> Gen 2 Hyper-V VMs boot via EFI and have a standard EFI framebuffer
> device. When the kdump kernel runs in such a VM, loading the efifb
> driver may hang because of accessing the framebuffer at the wrong
> memory address.
>
> The scenario occurs when the hyperv_fb driver in the original kernel
> moves the framebuffer to a different MMIO address because of conflicts
> with an already-running efifb or simplefb driver. The hyperv_fb driver
> then informs Hyper-V of the change, which is allowed by the Hyper-V FB
> VMBus device protocol. However, when the kexec command loads the kdump
> kernel into crash memory via the kexec_file_load() system call, the
> system call doesn't know the framebuffer has moved, and it sets up the
> kdump screen_info using the original framebuffer address. The transition
> to the kdump kernel does not go through the Hyper-V host, so Hyper-V
> does not reset the framebuffer address like it would do on a reboot.
> When efifb tries to run, it accesses a non-existent framebuffer
> address, which traps to the Hyper-V host. After many such accesses,
> the Hyper-V host thinks the guest is being malicious, and throttles
> the guest to the point that it runs very slowly or appears to have hung.
>
> When the kdump kernel is loaded into crash memory via the kexec_load()
> system call, the problem does not occur. In this case, the kexec command
> builds the screen_info table itself in user space from data returned
> by the FBIOGET_FSCREENINFO ioctl against /dev/fb0, which gives it the
> new framebuffer location.
>
> This problem was originally reported in 2020 [1], resulting in commit
> 3cb73bc3fa2a ("hyperv_fb: Update screen_info after removing old
> framebuffer"). This commit solved the problem by setting orig_video_isVG=
A
> to 0, so the kdump kernel was unaware of the EFI framebuffer. The efifb
> driver did not try to load, and no hang occurred. But in 2024, commit
> c25a19afb81c ("fbdev/hyperv_fb: Do not clear global screen_info")
> effectively reverted 3cb73bc3fa2a. Commit c25a19afb81c has no reference
> to 3cb73bc3fa2a, so perhaps it was done without knowing the implications
> that were reported with 3cb73bc3fa2a. In any case, as of commit
> c25a19afb81c, the original problem came back again.
>
> Interestingly, the hyperv_drm driver does not have this problem because
> it never moves the framebuffer. The difference is that the hyperv_drm
> driver removes any conflicting framebuffers *before* allocating an MMIO
> address, while the hyperv_fb drivers removes conflicting framebuffers
> *after* allocating an MMIO address. With the "after" ordering, hyperv_fb
> may encounter a conflict and move the framebuffer to a different MMIO
> address. But the conflict is essentially bogus because it is removed
> a few lines of code later.
>
> Rather than fix the problem with the approach from 2020 in commit
> 3cb73bc3fa2a, instead slightly reorder the steps in hyperv_fb so
> conflicting framebuffers are removed before allocating an MMIO address.
> Then the default framebuffer MMIO address should always be available, an=
d
> there's never any confusion about which framebuffer address the kdump
> kernel should use -- it's always the original address provided by
> the Hyper-V host. This approach is already used by the hyperv_drm
> driver, and is consistent with the usage guidelines at the head of
> the module with the function aperture_remove_conflicting_devices().
>
> This approach also solves a related minor problem when kexec_load()
> is used to load the kdump kernel. With current code, unbinding and
> rebinding the hyperv_fb driver could result in the framebuffer moving
> back to the default framebuffer address, because on the rebind there
> are no conflicts. If such a move is done after the kdump kernel is
> loaded with the new framebuffer address, at kdump time it could again
> have the wrong address.
>
> This problem and fix are described in terms of the kdump kernel, but
> it can also occur with any kernel started via kexec.
>
> See extensive discussion of the problem and solution at [2].
>
> [1] https://lore.kernel.org/linux-hyperv/20201014092429.1415040-1-kasong=
@redhat.com/
> [2] https://lore.kernel.org/linux-hyperv/BLAPR10MB521793485093FDB448F7B2=
E5FDE92@BLAPR10MB5217.namprd10.prod.outlook.com/
>
> Reported-by: Thomas Tai <thomas.tai@oracle.com>
> Fixes: c25a19afb81c ("fbdev/hyperv_fb: Do not clear global screen_info")
> Signed-off-by: Michael Kelley <mhklinux@outlook.com>
> ---
> The "Fixes" tag uses commit c25a19afb81c because that's where the proble=
m
> was re-exposed, and how far back a stable backport is needed. But I've
> taken a completely different, and hopefully better, approach in the
> solution that isn't related to the code changes in c25a19afb81c.
>
>   drivers/video/fbdev/hyperv_fb.c | 20 +++++++++++++-------
>   1 file changed, 13 insertions(+), 7 deletions(-)

applied to fbdev tree.

Thanks!
Helge
