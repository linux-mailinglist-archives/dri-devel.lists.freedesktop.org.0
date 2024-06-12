Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE1E904D20
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 09:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDFE10E2B4;
	Wed, 12 Jun 2024 07:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Q3uFokjS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F86F10E1D0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 07:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718178592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZ00sZ6/zOrVviIBgzn5YtJcs9IvJ9l3KD7aAvJ8idM=;
 b=Q3uFokjS7v63mQvtLw5vUEjz6IBRuoONuHPkKksaoUk5RK25Azw2WA6ivyZLop+UgAfNvZ
 DkapNDh2YDYehPu7BVByo11D+GoJhaV3G2j25/TeKtYtxH5ZRsWRm4+6pqYE94+kSmrMc+
 +BDy5TVyuhZQkOeiCoRGQ3Ai/sMXWSo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-GFWSsnRxNhmH5cuxrOHWEg-1; Wed, 12 Jun 2024 03:49:49 -0400
X-MC-Unique: GFWSsnRxNhmH5cuxrOHWEg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-35f1d26b0fcso2456881f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 00:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718178588; x=1718783388;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZKxDuZ9ntXNIIPhfkdeYI6FLW7SiBSvG27NW9i1F67Y=;
 b=rXwqQ/KvEWRy7vXgOdkUQkniNeP8PaatwEaL8vGzQyCnS6eecrrnJPQpJak0xVoBns
 8pAds/CPiPEXsd3p8rGVMihyI4fAXIcJs90Q1JAkJQ/NwFSWtOt6F+3mnkU8jN3KIoP4
 KqrFRirh26Iun/besVkh6y14M2AVhD/+B5rW0pa1G10ibATnr5NFqj5K7fgflWPBUu3d
 kLK81VJMEzGVCgMOG8SFlD+GnPdDvWJMGQXegqCidoDMzmjfRE36ypjY+MZ04s2wSsOG
 eQNZ9gIuZ06urNNboplr6qwq7swNKenf7q5OprzpUmBZi1Q/oTNFvymTqs6qxpkNQ5X7
 J8Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpqgpy8yHcPe+Ob2cysTz6+wOsB4u9PiWB/Nilolb+0vBT/ZfQVo7rKB6IMA8YrEE/z+mhKUusV0mXWk3Iz3GGXTA7/DDkLRDsLh4Artzr
X-Gm-Message-State: AOJu0YzrC6LMnAdxQl4JoLhCHrCWyg02e1m019SHbcaQUnDz5VVTqMja
 GhAS6A0NOLZSlara9GM5tOy5iGXshsJsXT5pN1/hvBlKIVEwPNK3Gs1Xb8EOTTM5g9tNYM/+p9w
 iiwLyJDE0Q/3KDvPAM4+LYYfiUV1TgbX0MuiVgHaqrJ4mBmfa79ATxow4lcx6pAlUEQ==
X-Received: by 2002:adf:a3cc:0:b0:35f:1c27:4520 with SMTP id
 ffacd0b85a97d-35fe8940368mr611469f8f.70.1718178588370; 
 Wed, 12 Jun 2024 00:49:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKAPKA3NydN1HfhRMshyH4ixhOfCaN6U5l2ihyWJ97s/Qvnara/m2quSOqhTxCgY3IobtRMg==
X-Received: by 2002:adf:a3cc:0:b0:35f:1c27:4520 with SMTP id
 ffacd0b85a97d-35fe8940368mr611451f8f.70.1718178587927; 
 Wed, 12 Jun 2024 00:49:47 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f228cbfb8sm8065167f8f.57.2024.06.12.00.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 00:49:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "Peng Fan (OSS)"
 <peng.fan@oss.nxp.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Peng Fan <peng.fan@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/fbdev-dma: fix getting smem_start
In-Reply-To: <e307fdc0-553d-4946-9017-ed3a28e9cae2@suse.de>
References: <20240604080328.4024838-1-peng.fan@oss.nxp.com>
 <8f4a6d80-dd3e-422f-88af-d26f50c973ff@suse.de>
 <e307fdc0-553d-4946-9017-ed3a28e9cae2@suse.de>
Date: Wed, 12 Jun 2024 09:49:46 +0200
Message-ID: <87cyomsiqt.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi
>
> Am 10.06.24 um 10:47 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 04.06.24 um 10:03 schrieb Peng Fan (OSS):
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> If 'info->screen_buffer' locates in vmalloc address space, virt_to_page
>>> will not be able to get correct results. With CONFIG_DEBUG_VM and
>>> CONFIG_DEBUG_VIRTUAL enabled on ARM64, there is dump below:
>>
>> Which graphics driver triggers this bug?
>>
>>> [=C2=A0=C2=A0=C2=A0 3.536043] ------------[ cut here ]------------
>>> [=C2=A0=C2=A0=C2=A0 3.540716] virt_to_phys used for non-linear address:=
=20
>>> 000000007fc4f540 (0xffff800086001000)
>>> [=C2=A0=C2=A0=C2=A0 3.552628] WARNING: CPU: 4 PID: 61 at arch/arm64/mm/=
physaddr.c:12=20
>>> __virt_to_phys+0x68/0x98
>>> [=C2=A0=C2=A0=C2=A0 3.565455] Modules linked in:
>>> [=C2=A0=C2=A0=C2=A0 3.568525] CPU: 4 PID: 61 Comm: kworker/u12:5 Not ta=
inted=20
>>> 6.6.23-06226-g4986cc3e1b75-dirty #250
>>> [=C2=A0=C2=A0=C2=A0 3.577310] Hardware name: NXP i.MX95 19X19 board (DT=
)
>>> [=C2=A0=C2=A0=C2=A0 3.582452] Workqueue: events_unbound deferred_probe_=
work_func
>>> [=C2=A0=C2=A0=C2=A0 3.588291] pstate: 60400009 (nZCv daif +PAN -UAO -TC=
O -DIT -SSBS=20
>>> BTYPE=3D--)
>>> [=C2=A0=C2=A0=C2=A0 3.595233] pc : __virt_to_phys+0x68/0x98
>>> [=C2=A0=C2=A0=C2=A0 3.599246] lr : __virt_to_phys+0x68/0x98
>>> [=C2=A0=C2=A0=C2=A0 3.603276] sp : ffff800083603990
>>> [=C2=A0=C2=A0=C2=A0 3.677939] Call trace:
>>> [=C2=A0=C2=A0=C2=A0 3.680393]=C2=A0 __virt_to_phys+0x68/0x98
>>> [=C2=A0=C2=A0=C2=A0 3.684067]=C2=A0 drm_fbdev_dma_helper_fb_probe+0x138=
/0x238
>>> [=C2=A0=C2=A0=C2=A0 3.689214] __drm_fb_helper_initial_config_and_unlock=
+0x2b0/0x4c0
>>> [=C2=A0=C2=A0=C2=A0 3.695385]=C2=A0 drm_fb_helper_initial_config+0x4c/0=
x68
>>> [=C2=A0=C2=A0=C2=A0 3.700264]=C2=A0 drm_fbdev_dma_client_hotplug+0x8c/0=
xe0
>>> [=C2=A0=C2=A0=C2=A0 3.705161]=C2=A0 drm_client_register+0x60/0xb0
>>> [=C2=A0=C2=A0=C2=A0 3.709269]=C2=A0 drm_fbdev_dma_setup+0x94/0x148
>>>
>>> So add a check 'is_vmalloc_addr'.
>>>
>>> Fixes: b79fe9abd58b ("drm/fbdev-dma: Implement fbdev emulation for=20
>>> GEM DMA helpers")
>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> I'm taking back my r-b. The memory is expected to by be physically=20
> contiguous and vmalloc() won't guarantee that.
>

Agreed.

> Best regards
> Thomas
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

