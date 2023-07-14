Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 061DF753453
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 09:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237C610E810;
	Fri, 14 Jul 2023 07:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BCE10E810
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 07:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689321222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SelqxeKyBQtIj4KiXYdkVNmN0aLewo38VPrsEtLfSog=;
 b=DV5DZ/dHOsY9hebR/4RK4XQ3jr74DGupsBDnl4indisb2H09zRSXq9lhQ4PwT2EeLsJ6gk
 sevV0u6kTDQBId8X44idCBb3ggRVtdoBPmr1aStt5MNq5qiQFfxch6UkifJDUwRMZrvZRf
 DboaODzVtpG5nthA/H/tNb0hEHV6ErI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-fyuQIxFiOhea-PbECiYehw-1; Fri, 14 Jul 2023 03:53:41 -0400
X-MC-Unique: fyuQIxFiOhea-PbECiYehw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-314134f403fso974371f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 00:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689321219; x=1691913219;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1+9ZBEjT3mFJea6YptXe/CBaBHfnJsPQnoZEZ+DpvPs=;
 b=WaI2684r6b0HqBabbRLngMfS7+Y/wKuMGkqxuxzxL2xrl+XfJEd7iCzwxTd22FlEWV
 oFR7dgySeuE8bvt940u3XBt7rIvxTg5aOHh41ZTHTSd16liqNNvKcKan5uP6sK/VK4XZ
 cM+tuS37mmAGmo6t1tyQpnfpIdXMDLTAYiqMxPNx5jGAhZft+Ha3XmRrwDv8j5KRFXbT
 KQPulWHTm4o4Bcgnp7s+fbDcdb9z5BzMX5NiAvfbu97js0BOSxejf98UsF1sHuL2+5Th
 mdI5cm9e+IfnijzlfI2CtA55LSCioFRrfVjM5cf4I+czHUxlg3dpBQdmmoT3j82Z3rrq
 IHGg==
X-Gm-Message-State: ABy/qLZE+MI9uMjOo8/rS96+0mGk0OsrMWd8Bu+NXUfyDDd3WDTVPi80
 Gtm3PvOlZLah8fm1VFIKoaQH3wC68TUQ25IvIPsvt7ZhVma2yvAFdjaaSuU46rT+zjSokGWxyHr
 XmKojiITyDGf8zUqBd72JDWn0uVmxJKHaA88V
X-Received: by 2002:a5d:4bcc:0:b0:314:11ab:11a0 with SMTP id
 l12-20020a5d4bcc000000b0031411ab11a0mr3311912wrt.34.1689321219589; 
 Fri, 14 Jul 2023 00:53:39 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFADpuHUbZdK5ADJswylCCcQ4pxYAN8eI2QEsyDhW7qoWJSX8qkK3H+kEbsI7p7RxibRp7P/Q==
X-Received: by 2002:a5d:4bcc:0:b0:314:11ab:11a0 with SMTP id
 l12-20020a5d4bcc000000b0031411ab11a0mr3311905wrt.34.1689321219190; 
 Fri, 14 Jul 2023 00:53:39 -0700 (PDT)
Received: from localhost ([90.167.94.6]) by smtp.gmail.com with ESMTPSA id
 l13-20020a5d560d000000b0031590317c26sm10103869wrv.61.2023.07.14.00.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 00:53:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drm/ssd130x: Fix an oops when attempting to update a
 disabled plane
In-Reply-To: <CAMuHMdXbboXGYVezzw3_TEu8U6WR=q2x2NjD-aqeF91-DXOD3Q@mail.gmail.com>
References: <20230713163213.1028952-1-javierm@redhat.com>
 <CAMuHMdXbboXGYVezzw3_TEu8U6WR=q2x2NjD-aqeF91-DXOD3Q@mail.gmail.com>
Date: Fri, 14 Jul 2023 09:53:38 +0200
Message-ID: <87ttu7szct.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

> Hi Javier,
>
> On Thu, Jul 13, 2023 at 6:32=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> Geert reports that the following NULL pointer dereference happens for hi=
m
>> after commit 49d7d581ceaf ("drm/ssd130x: Don't allocate buffers on each
>> plane update"):
>>
>>     [drm] Initialized ssd130x 1.0.0 20220131 for 0-003c on minor 0
>>     ssd130x-i2c 0-003c: [drm] surface width(128), height(32), bpp(1)
>>     and format(R1   little-endian (0x20203152))
>>     Unable to handle kernel NULL pointer dereference at virtual address =
00000000
>>     Oops [#1]
>>     CPU: 0 PID: 1 Comm: swapper Not tainted
>>     6.5.0-rc1-orangecrab-02219-g0a529a1e4bf4 #565
>>     epc : ssd130x_update_rect.isra.0+0x13c/0x340
>>      ra : ssd130x_update_rect.isra.0+0x2bc/0x340
>>     ...
>>     status: 00000120 badaddr: 00000000 cause: 0000000f
>>     [<c0303d90>] ssd130x_update_rect.isra.0+0x13c/0x340
>>     [<c0304200>] ssd130x_primary_plane_helper_atomic_update+0x26c/0x284
>>     [<c02f8d54>] drm_atomic_helper_commit_planes+0xfc/0x27c
>>     [<c02f9314>] drm_atomic_helper_commit_tail+0x5c/0xb4
>>     [<c02f94fc>] commit_tail+0x190/0x1b8
>>     [<c02f99fc>] drm_atomic_helper_commit+0x194/0x1c0
>>     [<c02c5d00>] drm_atomic_commit+0xa4/0xe4
>>     [<c02cce40>] drm_client_modeset_commit_atomic+0x244/0x278
>>     [<c02ccef0>] drm_client_modeset_commit_locked+0x7c/0x1bc
>>     [<c02cd064>] drm_client_modeset_commit+0x34/0x64
>>     [<c0301a78>] __drm_fb_helper_restore_fbdev_mode_unlocked+0xc4/0xe8
>>     [<c0303424>] drm_fb_helper_set_par+0x38/0x58
>>     [<c027c410>] fbcon_init+0x294/0x534
>>     ...
>>
>> The problem is that fbcon calls fbcon_init() which triggers a DRM modese=
t
>> and this leads to drm_atomic_helper_commit_planes() attempting to commit
>> the atomic state for all planes, even the ones whose CRTC is not enabled=
.
>>
>> Since the primary plane buffer is allocated in the encoder .atomic_enabl=
e
>> callback, this happens after that initial modeset commit and leads to th=
e
>> mentioned NULL pointer dereference.
>>
>> Fix this by not using the default drm_atomic_helper_commit_tail() helper=
,
>> but instead the drm_atomic_helper_commit_tail_rpm() function that doesn'=
t
>> attempt to commit the atomic state for planes related to inactive CRTCs.
>>
>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>

Thanks for reporting the issue in the first place and for the testing!

>> --- a/drivers/gpu/drm/solomon/ssd130x.c
>> +++ b/drivers/gpu/drm/solomon/ssd130x.c
>> @@ -795,6 +795,10 @@ static const struct drm_mode_config_funcs ssd130x_m=
ode_config_funcs =3D {
>>         .atomic_commit =3D drm_atomic_helper_commit,
>>  };
>>
>> +static const struct drm_mode_config_helper_funcs ssd130x_mode_config_he=
lpers =3D {
>> +       .atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
>
> The docs say this is intended for drivers that support runtime_pm or
> need the CRTC to be enabled to perform a commit.  Might be worthwhile
> to add basic Runtime PM, so the I2C controller can go to sleep when
> the display is not used.
>

Indeed, I thought the same. But I believe we can do that as a follow-up pat=
ch.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

