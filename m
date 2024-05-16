Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 820108C78E0
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 17:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EF710E21B;
	Thu, 16 May 2024 15:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PruRqEPA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37DB10E21B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 15:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715871811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nKBUSAzkxF9Zs4eRSjZEOq3e8C2Kq3MU7w45eIpOnW4=;
 b=PruRqEPA2Rrte/ywuqyD/wuVDEQzyCAJ9M/9tBVTwfbpHYHYwaEyRp9U/sGiPTBdmyXYEG
 oqCnzhE6AwdmvR2n9LmrKvtsbv6OAlwYkqHKxS8ET9cmGM5ozLiaDwrezDSEtZjpKKokkj
 Oh7L2rG6OtHB9Szq1gqC16+sIQpuxsQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-OFPQ_vpRN06q1pSStu6quA-1; Thu, 16 May 2024 11:03:28 -0400
X-MC-Unique: OFPQ_vpRN06q1pSStu6quA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-572b993d8ffso2288473a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 08:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715871807; x=1716476607;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nKBUSAzkxF9Zs4eRSjZEOq3e8C2Kq3MU7w45eIpOnW4=;
 b=nPNGZRYFiLAYU6CLpxBQtc+8oJwz7hZmeaNlaqlXOipJqe+00IOZuC2tQN7G79bsL8
 x9ooAW7I0tuHO+uTDU/BvWZOjFcxx7DSycDPxextj3FDjYfjGUT9NOVLhu8p9/3W32Ot
 nRk1dkXl36wZWuBkRW2+/3nI1MstDW0XRLBkEeUhfcUPDGcxOTEFEl2tEcz5oDx27RyY
 locgIUSF4+2mrwgZXIDuIvrj6X7mBgNtK3nXZRWq6RjPVCHLFkYV8/IrwZeGdAoI4y0Z
 TP+q4qDS9AdmB8QaLHRp/70i8RKmO1T2w/G+1oqE7LQarQxSW8HUQzILa/VIsqBT25+2
 ipmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN+zVXazxt3IYVwh/ZSAyh6MaIUSvdrEiBH1NGuKMdGTDneupYrp1hIWM1UjquHbzkPnJ5zNemGQCujjX1/SCZTIbS3OqKVazFlZGR2xWG
X-Gm-Message-State: AOJu0Yym0pq1TYh1DiBAm5XlNbGDgxjeGzDKVrTCdnn3D5LAMGrLTikQ
 ZtdVtz7ApEkHT34eVFqUjcgJu/HMH+FfioK8Bk3H8h9qarhyBRIjlpfMePNXJ5mTb/T1XymIXmD
 wI0F6UnX+HI7pjnBUUiYccRnat6s9vN2qMEyM+Ke5BBC8pzO1vDMmGV85n5Kd1rrMow==
X-Received: by 2002:a50:d583:0:b0:572:637b:c7e1 with SMTP id
 4fb4d7f45d1cf-5734d5f48b1mr19637051a12.21.1715871807578; 
 Thu, 16 May 2024 08:03:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgvrzhNOwipq4x4p3Hw4REcPng/U01BJKv87Sp+Z20QuaHZ/2tw+/vdsLUK4lIsDrkAAHqdA==
X-Received: by 2002:a50:d583:0:b0:572:637b:c7e1 with SMTP id
 4fb4d7f45d1cf-5734d5f48b1mr19637027a12.21.1715871807208; 
 Thu, 16 May 2024 08:03:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574f6b8b9d7sm2749663a12.82.2024.05.16.08.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 08:03:26 -0700 (PDT)
Message-ID: <1850b44d-e468-44db-82b7-f57e77fe49ba@redhat.com>
Date: Thu, 16 May 2024 17:03:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ACPI: video: Fix name collision with architecture's
 video.o
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: lenb@kernel.org, arnd@arndb.de, chaitanya.kumar.borah@intel.com,
 suresh.kumar.kurmi@intel.com, jani.saarinen@intel.com,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20240516124317.710-1-tzimmermann@suse.de>
 <CAJZ5v0gw620SLfxM66FfVeWMTN=dSZZtpH-=mFT_0HsumT3SsA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0gw620SLfxM66FfVeWMTN=dSZZtpH-=mFT_0HsumT3SsA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 5/16/24 3:04 PM, Rafael J. Wysocki wrote:
> CC Hans who has been doing the majority of the ACPI video work.
> 
> On Thu, May 16, 2024 at 2:43 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>
>> Commit 2fd001cd3600 ("arch: Rename fbdev header and source files")
>> renames the video source files under arch/ such that they does not
>> refer to fbdev any longer. The new files named video.o conflict with
>> ACPI's video.ko module.
> 
> And surely nobody knew or was unable to check upfront that there was a
> video.ko already in the kernel.

Sorry, but nack for this change. I very deliberately kept the module-name
as video when renaming the actual .c file from video.c to acpi_video.c
because many people pass drivers/video/acpi_video.c module arguments
on the kernel commandline using video.param=val .

Try e.g. doing a duckduckgo search for 1 off:

"video.only_lcd"
"video.allow_duplicates"
"video.brightness_switch_enabled"

And you will find a lot of hits. The last one is even documented as
being "video.brightness_switch_enabled" in the main kernel-parameters.txt
as well as separately:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/admin-guide/kernel-parameters.txt#n39
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/admin-guide/kernel-parameters.txt#n7152
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/firmware-guide/acpi/video_extension.rst#n118

https://wiki.archlinux.org/title/Lenovo_ThinkPad_X1_Carbon#Brightness_control

If you rename this module then peoples config will break for
a whole lot of users.

So lets not do that and lets rename the new module which is causing
the conflict in the first place instead.

Regards,

Hans

