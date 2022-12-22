Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511286546C7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 20:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBC710E56A;
	Thu, 22 Dec 2022 19:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCFA10E564
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 19:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671738123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c6opeyDV1vvYEXPZl4nDcDDesr0ymBrUc8eK9By1AXY=;
 b=IC+Wv50mm5n1/53XFqEzonVexplb9WT+0OjkahVKrlterUnB7TDrOgyF14cqAwx2qbX7p1
 a4fUE5BHn8yiY9p9AzgyqJUqluWGX1e5ER+Y6TZe3FP5fbE1K7dvhpEQbWevRcDx2a9UTR
 3bUYJVAJqEJ2hsdEgEFdeW36t0VLgw0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-650-o2tbQOVnPfWJyL-0tBu0QA-1; Thu, 22 Dec 2022 14:42:02 -0500
X-MC-Unique: o2tbQOVnPfWJyL-0tBu0QA-1
Received: by mail-wr1-f72.google.com with SMTP id
 v14-20020adf8b4e000000b0024174021277so722928wra.13
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 11:42:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c6opeyDV1vvYEXPZl4nDcDDesr0ymBrUc8eK9By1AXY=;
 b=KWnO7S8LUzKJ5tEatuwQhAt5gPmVrL3yWoktSUBYBhzrqoTLWM8QP8qGMcz//5cX2N
 Oo51c5mBq4dyCNd+jbGB8igiLw4vEUYtsrDSUmb5R4hT/nOJ8bxqf5UciLA9fUpj2U4R
 0SkfRWPkhu+12pck2I/SnACq8e7iVoGgftys6qLVm/5tKEFe99j3YZOf7/7Vy1Bmo3cG
 XhIbZqAFdC7gX/u8i1M2s8xh6pF6lpkMpDt6TzMtDs06hlE5SKnpuHJZ8cXFogGAnXp6
 C320zZiNsSmydV0/yj0EPo6zQ+2GmqPN7zrv9Mwz4PTG05xM90FZ6aZIWOAkaPHcLv/I
 DavQ==
X-Gm-Message-State: AFqh2krh0iWRf0m/K/vXE9DdNxe9aWZxgFhReNaB43i2qx6uh7NC4IUB
 H+V88yizPbk1p3OvBt4FAP4QOuaoTCO7vSnhr85R4m3j4qJV+RVGMDysDh+PPxr1adi0aClsCX3
 DoZuQ3zL2oc3D+SKJ3MajHp/j35hL
X-Received: by 2002:a1c:770b:0:b0:3cf:a18d:399c with SMTP id
 t11-20020a1c770b000000b003cfa18d399cmr5474548wmi.1.1671738121116; 
 Thu, 22 Dec 2022 11:42:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXua2pBCLdIUTK2il3tyI+qb37XQYcbG9+c/wf8ZI9xsGdWo4nMVaeXno0nD2PPtp5ugEfOmfA==
X-Received: by 2002:a1c:770b:0:b0:3cf:a18d:399c with SMTP id
 t11-20020a1c770b000000b003cfa18d399cmr5474531wmi.1.1671738120918; 
 Thu, 22 Dec 2022 11:42:00 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 6-20020a05600c024600b003cfd0bd8c0asm1820428wmj.30.2022.12.22.11.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 11:42:00 -0800 (PST)
Message-ID: <a8a6a28a-2d24-8a85-d87a-1289b9eb26a7@redhat.com>
Date: Thu, 22 Dec 2022 20:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/2] Recover from failure to probe GPU
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-efi@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221222183012.1046-1-mario.limonciello@amd.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221222183012.1046-1-mario.limonciello@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[adding Thomas Zimmermann to CC list]

Hello Mario,

Interesting case.

On 12/22/22 19:30, Mario Limonciello wrote:
> One of the first thing that KMS drivers do during initialization is
> destroy the system firmware framebuffer by means of
> `drm_aperture_remove_conflicting_pci_framebuffers`
>

The reason why that's done at the very beginning is that there are no
guarantees that the firmware-provided framebuffer would keep working
after the real display controller driver re-initializes the IP block.

> This means that if for any reason the GPU failed to probe the user
> will be stuck with at best a screen frozen at the last thing that
> was shown before the KMS driver continued it's probe.
>
> The problem is most pronounced when new GPU support is introduced
> because users will need to have a recent linux-firmware snapshot
> on their system when they boot a kernel with matching support.
>

Right. That's a problem indeed but as mentioned there's a gap between
the firmware-provided framebuffer is removed and the real driver sets
up its framebuffer.
 
> However the problem is further exaggerated in the case of amdgpu because
> it has migrated to "IP discovery" where amdgpu will attempt to load
> on "ALL" AMD GPUs even if the driver is missing support for IP blocks
> contained in that GPU.
> 
> IP discovery requires some probing and isn't run until after the
> framebuffer has been destroyed.
>
> This means a situation can occur where a user purchases a new GPU not
> yet supported by a distribution and when booting the installer it will
> "freeze" even if the distribution doesn't have the matching kernel support
> for those IP blocks.
> 
> The perfect example of this is Ubuntu 21.10 and the new dGPUs just
> launched by AMD.  The installation media ships with kernel 5.19 (which
> has IP discovery) but the amdgpu support for those IP blocks landed in
> kernel 6.0. The matching linux-firmware was released after 21.10's launch.
> The screen will freeze without nomodeset. Even if a user manages to install
> and then upgrades to kernel 6.0 after install they'll still have the
> problem of missing firmware, and the same experience.
> 
> This is quite jarring for users, particularly if they don't know
> that they have to use "nomodeset" to install.
>

I'm not familiar with AMD GPUs, but could be possible that this discovery
and firmware loading step be done at the beginning before the firmware FB
is removed ? That way the FB removal will not happen unless that succeeds.
 
> To help the situation, allow drivers to re-run the init process for the
> firmware framebuffer during a failed probe. As this problem is most
> pronounced with amdgpu, this is the only driver changed.
> 
> But if this makes sense more generally for other KMS drivers, the call
> can be added to the cleanup routine for those too.
> 

The problem I see is that depending on how far the driver's probe function
went, there may not be possible to re-run the init process. Since firmware
provided framebuffer may already been destroyed or the IP block just be in
a half initialized state.

I'm not against this series if it solves the issue in practice for amdgpu,
but don't think is a general solution and would like to know Thomas' opinion
on this before as well.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

