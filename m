Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91395974EEC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 11:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BD710E989;
	Wed, 11 Sep 2024 09:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UuMt8XD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0904810E989
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 09:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726047860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gEW0jS8LUsDsnEjTisv0s/wXC5wogSnkWd/VnDh8aDY=;
 b=UuMt8XD8PMds9I83ayh6hO7G0MTdmkgkQ1x3SCqk/mWgzi22DxY45Vo6+iPGFF676wIsg3
 doxFOguthHJ8U9MSKmZ6qoiwJ5rRsx3EBzPjXFtKYzmD+mLRbpcwfl+jvb891f9X1ljHwA
 /+p2lDbyZ3g6NBJ7NRwyuUE2EPbfM8Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-KpbfgzNTNJ2QYM3Ha4XENA-1; Wed, 11 Sep 2024 05:44:18 -0400
X-MC-Unique: KpbfgzNTNJ2QYM3Ha4XENA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42cb080ab53so27543855e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 02:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726047857; x=1726652657;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CFjKHrocNNIqUSTMwNcia1sfNDsLex7KVGJdwSQ+buo=;
 b=K0Mc/xejfFW2gc5w06201dVuVqyZ52ClHVu1iHZI7vDIAEz/BnDVQkzbOeRdkOuwYL
 zNo+6rzW8J4Z/BK8WNo1XeqWw4/pj4qxE1uJqxmkZjPxN/L4GJzDrjctHUR+Hsob5W1+
 iradvkepfFUKD+JVijxPN/xR3114VBakj/+sTNrWPq9ySkXrGF5m5oTlneQMMnhiZmQ5
 kLAXQSmVW8wMyexUiH3zljb2PL62DoWkG1LsvjlKDEcRehZRXhJce89dLRi1eJA8UYbY
 nD6VC2Fm71RIUNrp2DAK1JIj6WSaui4dbU2YWX/EYC0F+e0csOHXYUybvC1QEdZUDG3A
 I4XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGefBHp2WSXtIdMHfL9uDD0j1x6JvDUGGeO9wSJeh1xOpQAIptfSfbrS2i3599JmPmbSxCnEly+BM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2bPl53PaYJHrTXGdPDrfvKzHrtWrtlDu4RQ44LArC2RCVod8I
 nBjUfHiRPCMdh54ngUR5AjP21MzLLBBC4CO0A7WwfL+8JjniuZeOYUA0B2EtT88eiuL62Wqy8BO
 4sgkaL3Pc2ybfS4CHBwsPEZSdPm3LT9lcGKlZ9ncIPpjvn5DhRyTEh0Q2F0M5VvsauEsR7Y+dOg
 ==
X-Received: by 2002:a05:600c:4f4a:b0:42c:c401:6d86 with SMTP id
 5b1f17b1804b1-42cc4017025mr31396785e9.27.1726047857163; 
 Wed, 11 Sep 2024 02:44:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvYVXKn6tsaMIsjCUGdidIQEzvAY2M8caK94Hm7SWhCo3Wao2eKiqWyOprB3yp28S4S2SFNA==
X-Received: by 2002:a05:600c:4f4a:b0:42c:c401:6d86 with SMTP id
 5b1f17b1804b1-42cc4017025mr31396565e9.27.1726047856579; 
 Wed, 11 Sep 2024 02:44:16 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb218d7sm138492435e9.9.2024.09.11.02.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 02:44:16 -0700 (PDT)
Message-ID: <55b17b3e4af2ee28d44645535f0c8995c72f842c.camel@redhat.com>
Subject: Re: [PATCH 1/7] dma-buf: add WARN_ON() illegal dma-fence signaling
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 simona.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Date: Wed, 11 Sep 2024 11:44:15 +0200
In-Reply-To: <20240911085903.1496-2-christian.koenig@amd.com>
References: <20240911085903.1496-1-christian.koenig@amd.com>
 <20240911085903.1496-2-christian.koenig@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 2024-09-11 at 10:58 +0200, Christian K=C3=B6nig wrote:
> Calling the signaling a NULL fence is obviously a coding error in a
> driver. Those functions unfortunately just returned silently without
> raising a warning.

Good catch

>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/dma-buf/dma-fence.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-
> fence.c
> index 0393a9bba3a8..325a263ac798 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -412,7 +412,7 @@ int dma_fence_signal_timestamp(struct dma_fence
> *fence, ktime_t timestamp)
> =C2=A0=09unsigned long flags;
> =C2=A0=09int ret;
> =C2=A0
> -=09if (!fence)
> +=09if (WARN_ON(!fence))
> =C2=A0=09=09return -EINVAL;

While one can do that, as far as I can see there are only a hand full
of users of that function anyways.

Couldn't one (additionally) add the error check of
dma_fenc_signal_timestapm() to those? Like in
dma_fenc_allocate_private_stub().

It seems some of them are void functions, though. Hm.
There is also the attribute __must_check that could be considered now
or in the future for such functions.

Regards,
P.


> =C2=A0
> =C2=A0=09spin_lock_irqsave(fence->lock, flags);
> @@ -464,7 +464,7 @@ int dma_fence_signal(struct dma_fence *fence)
> =C2=A0=09int ret;
> =C2=A0=09bool tmp;
> =C2=A0
> -=09if (!fence)
> +=09if (WARN_ON(!fence))
> =C2=A0=09=09return -EINVAL;
> =C2=A0
> =C2=A0=09tmp =3D dma_fence_begin_signalling();

