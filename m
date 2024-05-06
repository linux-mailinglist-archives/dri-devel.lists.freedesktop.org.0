Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6568BCD27
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 13:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA9810EF9D;
	Mon,  6 May 2024 11:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="du7BYsxk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6233310EF9D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 11:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714996162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UVOjuGHnijX2tGdsGbh2K5EBK8PBebK05w8A7S2lTKk=;
 b=du7BYsxkpiNgHIwIJBDVSKypIGOSDF8zUmSYd1e2DMu4O/JJHX6inkJ0AlsE+kanagNNTe
 TtAGxeNzl3c89lKHwH92fZKf06DR9qtHHlWZ1pZlKt86L+I4CZM8Q4o5ZckrfGY5DYwcg2
 ILMrY4HgnEYXv2yw3YvKwgPY4wQOP7U=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-TK4mrQ88M0CEMjxT51d8Cg-1; Mon, 06 May 2024 07:49:20 -0400
X-MC-Unique: TK4mrQ88M0CEMjxT51d8Cg-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a524b774e39so177199166b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 04:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714996159; x=1715600959;
 h=content-transfer-encoding:to:subject:from:cc:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UVOjuGHnijX2tGdsGbh2K5EBK8PBebK05w8A7S2lTKk=;
 b=rx6nuVQ7Ab2+M6YQtJP7nJY8jAI98Qtx6ZsFCDuw0mcY4vohDxPlktULJsvfFWkf2a
 +sbnR6sNCYdv3jWZUpLs9amh3v6/MdMrZ6ApEqS1ya51oiq+jeBQN9Ox+n3F5Z2cokZ1
 iJPdIGATtcbbXWE4A9HCP5lKDxYUsXji1NQnd7pZPT9s09voTE3Q4N0A2VLWCWQAIcp5
 qlf33pvt44ERA24rYMt/DCEbSPFSSLaf/hDh99pohe7XCW4PPEKh2QoWudobscm9LnBc
 99tp1cZBkQ99OOmbePs9pcu/JM2YaFuM9iCCKgOnug8JHUa1ERXXbCT/OBoBrO/6Eh+O
 ZnHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUevm/L03exE7tzk5fWa+8btTYZgSrji5Kj1y9R85aRpurGZMX5H5uFx1jJMjPMB1FfXV3xuiMnvxY5/Wkj3u7P2dRAwZC+nnaJNZTQKTi
X-Gm-Message-State: AOJu0YxJfFkMLwJxHqnxEMVQELxORTJ/pwUbvVfDeZgrjQXE5p6hDYXL
 /oqHRvaAcGR7UbDAmpBvhMxiyDpItKut/p3ebi04fF/CbBM8OuJoyyCcee0eepBH/ZuoD0c1x2J
 p+qiGBwMtyBvuJUV0mFZR46+bJc/ELgStbD71toRrcz4npfrklIVsT0e5DUset65NFw==
X-Received: by 2002:a17:906:f59d:b0:a59:aa7a:3b16 with SMTP id
 cm29-20020a170906f59d00b00a59aa7a3b16mr5438590ejd.4.1714996159601; 
 Mon, 06 May 2024 04:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/BF449P6oYtXTLNlNFAmroU8YxK+dtUwmZhtwQBPNCYWIPRiuWpV7/MJdB0SdzgHMSrhNTw==
X-Received: by 2002:a17:906:f59d:b0:a59:aa7a:3b16 with SMTP id
 cm29-20020a170906f59d00b00a59aa7a3b16mr5438572ejd.4.1714996159209; 
 Mon, 06 May 2024 04:49:19 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 ze15-20020a170906ef8f00b00a59ae3efb03sm2667510ejb.3.2024.05.06.04.49.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 04:49:18 -0700 (PDT)
Message-ID: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
Date: Mon, 6 May 2024 13:49:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Milan Zamazal <mzamazal@redhat.com>, Maxime Ripard <mripard@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Subject: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi dma-buf maintainers, et.al.,

Various people have been working on making complex/MIPI cameras work OOTB
with mainline Linux kernels and an opensource userspace stack.

The generic solution adds a software ISP (for Debayering and 3A) to
libcamera. Libcamera's API guarantees that buffers handed to applications
using it are dma-bufs so that these can be passed to e.g. a video encoder.

In order to meet this API guarantee the libcamera software ISP allocates
dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
the Fedora COPR repo for the PoC of this:
https://hansdegoede.dreamwidth.org/28153.html

I have added a simple udev rule to give physically present users access
to the dma_heap-s:

KERNEL=="system", SUBSYSTEM=="dma_heap", TAG+="uaccess"

(and on Rasperry Pi devices any users in the video group get access)

This was just a quick fix for the PoC. Now that we are ready to move out
of the PoC phase and start actually integrating this into distributions
the question becomes if this is an acceptable solution; or if we need some
other way to deal with this ?

Specifically the question is if this will have any negative security
implications? I can certainly see this being used to do some sort of
denial of service attack on the system (1). This is especially true for
the cma heap which generally speaking is a limited resource.

But devices tagged for uaccess are only opened up to users who are 
physcially present behind the machine and those can just hit
the powerbutton, so I don't believe that any *on purpose* DOS is part of
the thread model. Any accidental DOS would be a userspace stack bug.

Do you foresee any other negative security implications from allowing
physically present non root users to create (u)dma-bufs ?

Regards,

Hans


1) There are some limits in drivers/dma-buf/udmabuf.c and distributions
could narrow these.


