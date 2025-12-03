Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA836C9EECE
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 13:00:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA8010E13A;
	Wed,  3 Dec 2025 12:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="YAU3Gdhc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973188.qiye.163.com (mail-m1973188.qiye.163.com
 [220.197.31.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C997710E78F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 12:00:02 +0000 (UTC)
Received: from [127.0.0.1] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2bd94477e;
 Wed, 3 Dec 2025 19:59:56 +0800 (GMT+08:00)
Message-ID: <31c64e8f-3129-4766-b735-84a26198e6d0@rock-chips.com>
Date: Wed, 3 Dec 2025 19:59:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] RFT: drm/rockchip: Create custom commit tail
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>, Vicente Bergas <vicencb@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
 <20251202-mcde-drm-regression-thirdfix-v6-4-f1bffd4ec0fa@kernel.org>
 <5d6e8e0e-3129-49f1-8c5f-c2f837a36139@rock-chips.com>
 <CACRpkdZwgsbVezfQBRP6pX-o8TLvtFMt+M+rL7GrTmeuzN8xvQ@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CACRpkdZwgsbVezfQBRP6pX-o8TLvtFMt+M+rL7GrTmeuzN8xvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ae4155c6103abkunmdafda06941e8a2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk0eSFZPH0lKSE0ZShgdSkxWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=YAU3GdhcWgxEahXohg2T2PUXRrn7FEt4Pfj+0ryOWfo7paJh/sIHpwHv6eZGbRXhxOxqdKJ2csyeFBoVy4+DZvLN5e3fDu7EvsYzNoPJtnG8EXFOKZJpuxA1KGru6m6E+nXvtJFz0oqk2zPGjL9J8SiX0NwsHgxamdtZgnPSwQk=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=2d07mvFdS01wxsxr01fOMc8tzwEqyFdVB0HHl3Od8g0=;
 h=date:mime-version:subject:message-id:from;
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

On 12/3/2025 5:54 PM, Linus Walleij wrote:
> On Wed, Dec 3, 2025 at 4:10 AM Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
> 
>> It seems that multiple drivers currently depend on the CRTC being
>> enabled and they implement the same atomic_commit_tail().
>>
>> Why not implement this in drm_atomic_helper_commit_tail_rpm() instead?
>> Or why not use another common helper function for this?
> 
> So my v2 version of the patch series added a new special case
> helper tail function to do that:
> https://lore.kernel.org/dri-devel/20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org/
> 
> It was politely NACKed for complicating the helpers library (short story).
> 
> It's part of the trail of how we got to this current patch series.
>

Ah, got it. Please take a look at my other comments to see if there's
a chance to change the bridge functions to achieve this. Thank you.

-- 
Best, 
Chaoyi
