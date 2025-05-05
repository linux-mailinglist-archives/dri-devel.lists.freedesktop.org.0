Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92568AA9179
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 13:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4FF10E3B4;
	Mon,  5 May 2025 11:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UbfkzcaD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0782910E0F8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746442824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=12227oQcClANdsmAr+zYH4cNE2cunVLZjHCM4d8y22g=;
 b=UbfkzcaDyRtvqKNZnxBud0T+l/DC4A8NxRVB/HJK3r3G0b7QKMSnbQ6N1+DVZErUtxz5As
 SR8Om0qpwcO/T5QZOTjzDWZZiKXkA5awkINksNdCBl6qoDetLAtoNkLpyio2PUqStnomCv
 1JF/pX7F2DMkzq4u9fLNRWurKAtldvM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-dHvmJvZKMBazJlDiJb8ckw-1; Mon, 05 May 2025 07:00:23 -0400
X-MC-Unique: dHvmJvZKMBazJlDiJb8ckw-1
X-Mimecast-MFC-AGG-ID: dHvmJvZKMBazJlDiJb8ckw_1746442822
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3912e4e2033so971521f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 04:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746442822; x=1747047622;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gYZVyBXjALhKKXNyoTTAghH2Cljj5vQ2jFdSmpambSs=;
 b=jIthunAshcKrXlQYC2wvnl5ZaLYb+bP9uXfuf+GhzOvUOlnFwaxzLkt2zR72CjtcSP
 uC/K4rnHOvUsoNNkHVYoWh32bt+q6vKKi1gWVPppFAimuojofwm2WVr8pvUACVshxmoU
 EQxeRj6F0vAZpxE9yOChvbr1K+BoEvI3Udzchybx/L2Rm7i521Zyoe1We38KadgSk52L
 PbvDJ76X+LRiR/tzddcDE8a6sy/S1CbSX3hPNQOO3DfRbnHo/IGSbSU2FMJHwMrSB0B7
 L9xLATkGxwJ2AYHHOM74bqTRGx/me/DCtMxnmlfaItU08xfmrnLnzsYIUUR/yhU5el6r
 /0Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8H5MktIfIg6G3ZR3aisPxqMdYgms+MhM8gnt1hdo1T1Y9Gn9WoELMIfnKJru2h1W6A8mL9YGd2Ok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu/+g/G4NC7ryBzK+oSw4TYpp+q34ZJD7Fb7BuMng5sbXjtZ56
 VLpG3S0U9Jw2dA8GCcTVZLpEvE952J9S+Bc27BwdywZ5R73Z8TWqyMwW5dS/2Pn4fMUweasEGjv
 +yAuHjzONGhoJgUfNtC7O8Y/+X40dm+z1JdGPv0JP1LgRD4PNPF2zjH1S5NR7EL10Ww==
X-Gm-Gg: ASbGncsDELboZ0eutex75txOxGmZGB1tBqou9RxiP0h6UURc+e8O6zJnJmhh0+/Gich
 o9yzYfYgKXPaWlFfl4Hsh4LeZ6jTCjh0+obXaLg4r7q506B6/NhkXUbZiI06a5FU8aw4XqndU+P
 Tj8qS2o9rA+IUvfP+oSbQumhxytIEXD8I5pB3U2RTXnJVqep/ijLubIG9XOqJnds+EkeH7QnKtS
 WSiDDaDqw4obLzlzRpPVpWxMnB4P6/g1+f2fd+lqlHbZ356bd0UXybfa6jrufWPrKcxkXcA8f08
 JRRURwvSwDQc+XX+ixfZx/aiCP6PiOcllJZefo7IVg==
X-Received: by 2002:a05:6000:178f:b0:39c:16a0:fee4 with SMTP id
 ffacd0b85a97d-3a09fd88901mr5903271f8f.27.1746442821962; 
 Mon, 05 May 2025 04:00:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGBxRsfJq3WL/X8i0OkbQ6itau/ggn7k4p8e3Vj8ihS5socMSRfYRyDLKwDFZM/ivQvZNUfA==
X-Received: by 2002:a05:6000:178f:b0:39c:16a0:fee4 with SMTP id
 ffacd0b85a97d-3a09fd88901mr5903250f8f.27.1746442821629; 
 Mon, 05 May 2025 04:00:21 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae7a55sm9913932f8f.45.2025.05.05.04.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 04:00:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, David
 Lechner <david@lechnology.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/sitronix: move tiny Sitronix drivers to their
 own subdir
In-Reply-To: <29c139fe-337d-4cd2-944b-8e26080a326f@suse.de>
References: <20250503-sitronix-v2-1-5efbed896be2@gmail.com>
 <27a5f519-de87-4fab-b465-bb89ae5b988b@suse.de>
 <87r013wgoy.fsf@minerva.mail-host-address-is-not-set>
 <29c139fe-337d-4cd2-944b-8e26080a326f@suse.de>
Date: Mon, 05 May 2025 13:00:19 +0200
Message-ID: <87o6w7wce4.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FUqjmwLaxOx_E0d3ZjQ4wp1CzIoV1XxWZ4cVbIWNPbc_1746442822
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

> Hi Javier, Marcus
>
> Am 05.05.25 um 11:27 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>>
>> Hello Thomas,
>>
>>> Hi,
>>>
>>> there's one major issue here. You must not change the Kconfig symbols o=
r
>>> you'll break kernel updates for a lot of people. So those TINYDRM_* mus=
t
>>> remain as is.
>>>
>> I disagree. The https://docs.kernel.org/admin-guide/abi.html document
>> explictly states that Kconfig symbols are not an ABI, and userspace
>> should not rely on these not changing over time.
>
> To summarize our discussion on irc [1]: changing the symbols is ok, but=
=20
> we should make it compatible to ease the transition. To do so, the new=20
> Kconfig file can still contain the old Kconfig symbol and the new one=20
> defaults to it. Something like this:
>
> config TINYDRM_ST7586
>  =C2=A0 tristate
>  =C2=A0 default n
>
> config DRM_ST7586
>  =C2=A0 tristate "bla bla"
>  =C2=A0 ...
>  =C2=A0 default TINYDRM_ST7586
>
> Doing 'make olddefconfig' or a similar make command sets the new symbol=
=20
> from the pre-existing one. After a few releases the old symbol can be=20
> removed.
>

That makes sense to me, yes. I'm not against making the life of distro
maintainers easier. We can then drop these transition symbols after a
few kernel releases.

> Best regards
> Thomas
>
>
> [1]=20
> https://people.freedesktop.org/~cbrill/dri-log/?channel=3Ddri-devel&highl=
ight_names=3D&date=3D2025-05-05&show_html=3Dtrue
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

