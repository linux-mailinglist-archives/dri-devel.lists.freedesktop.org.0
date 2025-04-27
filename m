Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65383A9E069
	for <lists+dri-devel@lfdr.de>; Sun, 27 Apr 2025 09:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4554B10E169;
	Sun, 27 Apr 2025 07:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="apPGyhnQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BE110E169
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Apr 2025 07:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745738966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wcGQpFTguItVa6CDu+q0byxuNxLDL/Np928mwDKp2zQ=;
 b=apPGyhnQzKjMfEh8pc5VsOX8lReifZama9tM0SKqrxsRkE2ScvLODerhMZ5ldS6a2nVVtj
 ADNEB74uTrClC2tfRNEQ5eDJwe0ePWdEKhMrrMWPgmCDFS79yKriPf7jjN3w9+FK8eQTdZ
 jbQig6oY9AUX+Zmm+eVYdldl+jGH7+s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-jXIU_yhdPYmxPz18pHOJqw-1; Sun, 27 Apr 2025 03:29:25 -0400
X-MC-Unique: jXIU_yhdPYmxPz18pHOJqw-1
X-Mimecast-MFC-AGG-ID: jXIU_yhdPYmxPz18pHOJqw_1745738964
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43d00017e9dso21104625e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Apr 2025 00:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745738964; x=1746343764;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wcGQpFTguItVa6CDu+q0byxuNxLDL/Np928mwDKp2zQ=;
 b=Fsea9gzLfggeD7hUFTtXdast8diZCE4IF0330eGqpymtA25sXDrZsEtfUQOXkIwlRG
 XOy1lluAd1MEzOwpt5Ib6FB7P72+5+ICo6i1tPeFoUxQk3n7sQBkkReL+wnVzUNkG4au
 gTpuRg8nnnt33/R9qFZ7ZTbYPREEkI2biGokOaKul4fjoagc212tuFUEuxg7LOxvnW6U
 tqmRj60Ga8sVGatwTEr7P1V1U4uOfXKwCZO5uxCAwJnk04B+zLecUlAAGiYKwXFCRpay
 7jq9QVhMYqxPeqNih+Sa49u7Vb/xiOJJqX0ipwu9k/CmsPDVxIe0nS1p3sxtXoNvhXUg
 MpDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoBIKxmZToPFw5OFqME6EDDOihodpiyhaE0jda2vB34jc7at4yi29SVWy3guNFNTv1c/HusWS+vFM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/AAj0Rmu5WBIJIoZ6cRDtAOyozHoWxiqn/GQkP7GbNhO0zKvh
 veEb+gFP3tLHFFdFSnD0C329efF3Dt9BaDD5x8RnVizQzO01lAgVLzvlthH5LNp0CoCE1TKMYfO
 7xLRsAGb6xp+p55haO+nuMKAfbjt0frrewza4ZiI4F8kWA+uvV9nP5Zrd4qeXQIVrlA==
X-Gm-Gg: ASbGncv4rr/Hnhe5NRRCD93lpAoDv8+1Kh1LwNH/CQbQOBFNztgjRJRfmBIIa01bg4d
 E/z1e3i2TxcSOY/QD4BOchyF0x/S7IPtG51O613pLNfYj1MsWCRlN1JRF+54Flfa+49ol5YDozf
 yMWEK2kDA2T181fSdMnwNHBWLe/fksKztvCnnhfuLmlnMkysU5Z4Br7q2gKXjuxi0GfFzbiz/0w
 Xq+8aT/+VsoECO0MrLxElWiJJwho16cumKNrMtEEoJsWJbKyrxQvo09OUr2jC3gK1nf1nJgERas
 5mOz5RjF5Z18Oxdl466QKRBKyQU9mjXpoxfsMBLijmUcpBz/dsuT7O9e4AuFxSGDhOnMVQ==
X-Received: by 2002:a05:600c:1e84:b0:43d:172:50b1 with SMTP id
 5b1f17b1804b1-440a66b7b68mr66727245e9.29.1745738963927; 
 Sun, 27 Apr 2025 00:29:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHimZlDfyKX+dV1RunsI8DPPpzKCieKScXo5Xcy7H8gXFHsd947YK1+IzF4ivCFxFOjPMb/Zw==
X-Received: by 2002:a05:600c:1e84:b0:43d:172:50b1 with SMTP id
 5b1f17b1804b1-440a66b7b68mr66727125e9.29.1745738963562; 
 Sun, 27 Apr 2025 00:29:23 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4408d0a7802sm102831515e9.1.2025.04.27.00.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 00:29:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Ryosuke Yasuoka <ryasuoka@redhat.com>
Cc: drawat.floss@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jfalempe@redhat.com, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH drm-next v2] drm/hyperv: Replace simple-KMS with regular
 atomic helpers
In-Reply-To: <CAHpthZqJPKtXUjFiVRLP+LEmTKFowUKVHGDe9=NS4aGx7WWcMA@mail.gmail.com>
References: <20250425063234.757344-1-ryasuoka@redhat.com>
 <87wmb8yani.fsf@minerva.mail-host-address-is-not-set>
 <CAHpthZqJPKtXUjFiVRLP+LEmTKFowUKVHGDe9=NS4aGx7WWcMA@mail.gmail.com>
Date: Sun, 27 Apr 2025 09:29:20 +0200
Message-ID: <87selugizz.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k6vM7J6xI7FodFNTogoRhmPlffdrLwa0UAq9mkLMeJk_1745738964
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

Ryosuke Yasuoka <ryasuoka@redhat.com> writes:

Hello Ryosuke,

> Hi Javier,
>
> On Fri, Apr 25, 2025 at 4:15=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> Ryosuke Yasuoka <ryasuoka@redhat.com> writes:
>>
>> Hello Ryosuke,
>>
>> > Drop simple-KMS in favor of regular atomic helpers to make the code mo=
re
>> > modular. The simple-KMS helper mix up plane and CRTC state, so it is
>> > obsolete and should go away [1]. Since it just split the simple-pipe
>> > functions into per-plane and per-CRTC, no functional changes is
>> > expected.
>> >
>> > [1] https://lore.kernel.org/lkml/dae5089d-e214-4518-b927-5c4149babad8@=
suse.de/
>> >
>> > Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
>> >
>>
>>
>>
>> > -static void hyperv_pipe_enable(struct drm_simple_display_pipe *pipe,
>> > -                            struct drm_crtc_state *crtc_state,
>> > -                            struct drm_plane_state *plane_state)
>> > +static const uint32_t hyperv_formats[] =3D {
>> > +     DRM_FORMAT_XRGB8888,
>> > +};
>> > +
>> > +static const uint64_t hyperv_modifiers[] =3D {
>> > +     DRM_FORMAT_MOD_LINEAR,
>> > +     DRM_FORMAT_MOD_INVALID
>> > +};
>> > +
>>
>> I think the kernel u32 and u64 types are preferred ?
>
> I'm not sure if I should fix this in this patch because I did not add the=
se
> variables. IMO, we need to split the commit if we fix them.
>

Right, I got confused for how the diff showed the changes. But I agree with
you that should be a separate patch since the variables already exist.

[...]

>>
>> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Thank you for your review and comment. I'll fix them and add your ack.
>

Thanks!

> Best regards,
> Ryosuke
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

