Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 509DF66E0F1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 15:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91B610E54A;
	Tue, 17 Jan 2023 14:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B145E10E54A;
 Tue, 17 Jan 2023 14:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jvCND7U5mCx/0/d5hUtwhsEg9nPGo+xA4gIoGMnASvA=; b=Rf5a2/Bao6+pYgfKcC/BJrUsxL
 Q9iZ1PS+LTP5VyIP6P8AIwNqBNdx3n3E/OZNHR93EllE65kPfrZbXOEX+Dyck0kkTlom0hhTlhBqS
 8S0QhqEXz8Bih9CAeWdiLvlDtRQW5rtZlk23IVClKdd1ynl7qy/QtC7aWSFjLUALi4EswzozfOzF6
 3N31/2qWXCXC89fybY4EEOQMA+dbyJz1qu9uSrbJsqQkFcSF1yfMFjGydqb9edN02pXB03YW9a2ff
 mCfKynIs/jHyhCSfdtMHY+NSr7n+Kn5AmPvnzKNK3+PCjY+fHxGmmIx2SnqHA/4uoAdd3UjhPBolv
 ZKI2bzPQ==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pHn67-00AgQV-JC; Tue, 17 Jan 2023 15:37:59 +0100
Message-ID: <763513db-7d0d-5946-a9af-11db85aa0db6@igalia.com>
Date: Tue, 17 Jan 2023 11:37:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/3] drm/amdgpu: Remove redundant framebuffer format
 check
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20230113165919.580210-1-mcanal@igalia.com>
 <20230113165919.580210-3-mcanal@igalia.com>
 <feD8ifyiQQcVKESmwwRiyFCSBrXbRd6kGm8LGHgC0ympY2Qsc9Oi3UEqva2xVspk59CvZV4kpgCJUUKPJt9scwsIMAVBvDZrXMihMehs_WM=@emersion.fr>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <feD8ifyiQQcVKESmwwRiyFCSBrXbRd6kGm8LGHgC0ympY2Qsc9Oi3UEqva2xVspk59CvZV4kpgCJUUKPJt9scwsIMAVBvDZrXMihMehs_WM=@emersion.fr>
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
Cc: amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,

On 1/13/23 14:06, Simon Ser wrote:
> Hm, unfortunately I think we need to keep the check in amdgpu for the
> same reason as i915: amdgpu will pick a modifier if user-space didn't
> supply one on GFX9+.
> 
> I wonder if that also applies to vmwgfx? Maybe that would be a reason
> to have the check in framebuffer_init()? (Not sure!)

I tried to move the check to framebuffer_init(), but it ended up causing
problems in the i915 driver (the kernel was emitting warnings when running
the IGT tests). I was thinking of going back to the drm_gem_fb_create()
approach [1], as it would make the other drivers return EINVAL in the case of
a bad modifier and it wouldn't change the current behavior of i915 and amdgpu.

[1] https://lore.kernel.org/dri-devel/20230103125322.855089-1-mcanal@igalia.com/T/

Best Regards,
- Maíra Canal
