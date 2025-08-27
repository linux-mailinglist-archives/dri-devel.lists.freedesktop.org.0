Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DD0B38091
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 13:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CC810E7B2;
	Wed, 27 Aug 2025 11:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hMOKcIoj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721F510E7B1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 11:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756292910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3PjxlAWf7veWGNv8WxmuluBCo2cmlQimJC4dQF/7vCU=;
 b=hMOKcIojpMtY6qdr3F+RLu97ElOIpF3xX4RjfiwLk1kSOyhRB2zyP6e12RgK1fitsbdnbQ
 R5uOj+QkoX+NqzagYMZzngnu8micYiyTvj7+1ykN3ZbdAX2Wc23AYZLemXm0oqUAHaAoen
 LNeSMyOkKQtqUifu6EtknHGrwD1QOOY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-bPYZhSB1M_i3vzooE8341g-1; Wed, 27 Aug 2025 07:08:29 -0400
X-MC-Unique: bPYZhSB1M_i3vzooE8341g-1
X-Mimecast-MFC-AGG-ID: bPYZhSB1M_i3vzooE8341g_1756292908
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3c9bf5c8b12so508318f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 04:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756292908; x=1756897708;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3PjxlAWf7veWGNv8WxmuluBCo2cmlQimJC4dQF/7vCU=;
 b=jx57ngoMOq4eOTC9v/etsPh5X6f0J67oEMgNdaNGL/Q3oMwkNF5PPiOoBMTrFk/Lv8
 Xhvm3m1dkbHo5PF5sAxHYIr2IbaDl3TLGpt7ijyMJUBebFKyX/BLDjYy9jsY98IVoWUL
 L8Ykd/lAkdiEZAyjCydZCs4KdqtfpTwXiYejVz48wS/naCVVvzcGfeCJJOWyNLua3eCn
 HCXP7ayD+9kxTLaruGRpx6TAOxmvii5PgV3eVXhtWgZSxXEDLWEeVe5E0uhHsssH3/ZX
 kqcr/E0KHDVPamUnMR4tRnN1yHwMqy6EgW7hmqB/Ob6L8frtN+yJU5CpmUXTjd9RpHi+
 42JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDhOIeimWvVeTXlgWPkbYeBUDOAV2NC1q3ZUhGRIIgaR+DLdp2RONklIhKhVh8ck5CJhTijk5EZUg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA8xjU0ODtP/jQ3PIgMDPhhdww3/fUFy05A4w+qaM54H1+tvU3
 IDBvD8yc+IQpQf+PalUvVuPPkDwbqffuqBc/V9GqNGcqL2N+fBOOPG1dI3K0nl+vC6lO8j9kM5B
 P7peJ/tqoXGs94IpzbTJ7fNjs35ZD7uuHkOFF0dP7nsgFZPkjk9dYFkCAnKf8GNEMtiYbvA==
X-Gm-Gg: ASbGncvFldo6pikv9gSyhEI+Kbx8vZ3JIqkn01/xLedrScoB/vnJcj8ArYcOIuPhOko
 R2I7zndsvlLf/cIlMMJtaKAPWGE3sfeQNAkcmolabE9PyIYJEAE2A+/KxI/8r6Pg58+3YDP9zA6
 OkJ8M2A7tvhmK38N+xVKCHAQia4KNbJ8A4L1VADlphaMUfsTX2xk/TdpmP2gOzsJeKwpQFIvdLU
 L6ARU3m33X+cabcauegQs/m7MugWgTAmmBbjkVmwLwNoz+fsgZsret7arVbqXC0He290NHLEkkn
 ls4EfLSLWxB/LYRgeocuq13ypo2OQrFRevV9fmjtFbos0A==
X-Received: by 2002:a5d:5f46:0:b0:3c5:c344:ffb8 with SMTP id
 ffacd0b85a97d-3cbb15ca309mr4023115f8f.12.1756292907980; 
 Wed, 27 Aug 2025 04:08:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnbaAqjIreMNe/bzEU3jkon+3zC2R03YKoR/bFzRlaIY/38ozGFFh2vpp9cdD5NjXCSRmsZQ==
X-Received: by 2002:a5d:5f46:0:b0:3c5:c344:ffb8 with SMTP id
 ffacd0b85a97d-3cbb15ca309mr4023053f8f.12.1756292907494; 
 Wed, 27 Aug 2025 04:08:27 -0700 (PDT)
Received: from localhost ([2001:9e8:898f:9300:ff23:be77:f1bc:ffc8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c70ef566dcsm19986409f8f.24.2025.08.27.04.08.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 04:08:26 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 27 Aug 2025 13:08:25 +0200
Message-Id: <DCD5VIFRKFB9.1KHIZI3ASID2I@redhat.com>
From: "Sebastian Wick" <sebastian.wick@redhat.com>
To: "Daniel Stone" <daniel@fooishbar.org>, "Maxime Ripard" <mripard@kernel.org>
Cc: "Shengyu Qu" <wiagn233@outlook.com>, "Marius Vlad"
 <marius.vlad@collabora.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <harry.wentland@amd.com>, <sunpeng.li@amd.com>, <siqueira@igalia.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <contact@rafaelrc.com>, <lijo.lazar@amd.com>, <jesse.zhang@amd.com>,
 <tim.huang@amd.com>, <dark_sylinc@yahoo.com.ar>,
 <mario.limonciello@amd.com>, <alex.hung@amd.com>,
 <aurabindo.pillai@amd.com>, <sunil.khatri@amd.com>,
 <chiahsuan.chung@amd.com>, <mwen@igalia.com>, <Roman.Li@amd.com>,
 <Wayne.Lin@amd.com>, <dominik.kaszewski@amd.com>, <alvin.lee2@amd.com>,
 <Aric.Cyr@amd.com>, <Austin.Zheng@amd.com>, <Sung.Lee@amd.com>,
 <PeiChen.Huang@amd.com>, <dillon.varone@amd.com>, <Richard.Chiang@amd.com>,
 <ryanseto@amd.com>, <linux@treblig.org>, <haoping.liu@amd.com>,
 <Relja.Vojvodic@amd.com>, <Yihan.Zhu@amd.com>, <Samson.Tam@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <wayland-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 0/2] Add "pixel_encoding" to switch between RGB & YUV
 color modes
X-Mailer: aerc 0.20.1
References: <TY4PR01MB14432B688209B2AA416A95228983EA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <aK1hPoCmLziaPPOd@xpredator>
 <TY4PR01MB1443219A9870877AF120FE63B9839A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <20250827-imperial-mongrel-of-dignity-712fab@houat>
 <CAPj87rPhK+E2FP62fnNxFySDOkqqKxo_oa94i7DR3_6a1j1o1A@mail.gmail.com>
In-Reply-To: <CAPj87rPhK+E2FP62fnNxFySDOkqqKxo_oa94i7DR3_6a1j1o1A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G6o-SCa397pKufGhww4MfxxFLrm0S88e9Q92f-WelKc_1756292908
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
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

On Wed Aug 27, 2025 at 12:39 PM CEST, Daniel Stone wrote:
> Hey,
>
> On Wed, 27 Aug 2025 at 10:41, Maxime Ripard <mripard@kernel.org> wrote:
>> On Wed, Aug 27, 2025 at 12:26:56AM +0800, Shengyu Qu wrote:
>> > 1.Can you send patch with only i915/amdgpu first? It's a long-needed f=
eature
>> > to deal with some monitors/TVs with broken EDID.
>>
>> If it's to workaround broken monitors, then it's really not something we
>> should be doing using a property.
>>
>> Most likely, those monitors don't support YUV* output and will just need
>> to be forced to RGB, so it's not something that the user (or the
>> compositor, really) has to care about.
>>
>> And it would be broken with every driver, not just i915 and amdgpu.
>>
>> We already have some quirks infrastructure in place, the only thing we
>> need to do is create an EDID_QUIRK_NO_$FORMAT, clear
>> drm_display_info->color_formats based on it, and you're done. No uapi to
>> agree upon, support, test, and it works with every driver.
>
> There are other reasons to have uAPI though ...
>
> One is because you really care about the colour properties, and you'd
> rather have better fidelity than anything else, even if it means some
> modes are unusable.
>
> Another is for situations which static quirks can't handle. If you
> want to keep headroom on the link (either to free up bandwidth for
> other uses), or you accidentally bought a super-long cable so have a
> flaky link, you might well want to force it to use lower fidelity so
> you can negotiate a lower link rate.
>
> I'm all for just dtrt automatically, but there are definitely reasons
> to expose it to userspace regardless.

Yes!

Broadcast RGB is a property that only works as a workaround for broken
monitors. If user space sets it to a value other than auto, even after
first checking the EDID if the sink supports it, we don't know if the
kernel just changes the values, or also sends the InfoFrame (or the DP
equivalent).

So even if the new property was just for broken sinks, we already have a
similar case, and it makes sense: If the EDID fails to read properly, or
the display has no EDID, the kernel can't really identify the thing, so
you need something in user space anyway.

Even for quirks where you can identify something, user space is a better
fit because we can update things faster. This is one of the goals of
libdisplay-info anyway.

Either way, like Daniel said, this *is* useful for other reasons. We
want to be able to switch between quality and bandwidth.

> Cheers,
> Daniel

