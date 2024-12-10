Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550219EB0B3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 13:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C280210E010;
	Tue, 10 Dec 2024 12:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dsNpp8Rm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518FF10E010
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 12:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733833459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aSecLXEIEH9VAnhyNAFzRJvrLm7yztvw8Khy2pOpSMo=;
 b=dsNpp8RmLkayvkRGWzdBaKUnZ07B47+VNUkt0E3KkCCm3u1C/wloVHvbDqL4/15C8U3KGb
 +n9cWof0L4qpy1VWXt/Byt56LcLzNK5q12ylIDAPXiA05uXZ7EwrmVszzjhvljXgxdtwfC
 qITQGiUUjmcG8f9/WeTF0hWQVHkvPwE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-MUb2nFCfMz-Z3xuoSF_qjw-1; Tue, 10 Dec 2024 07:24:16 -0500
X-MC-Unique: MUb2nFCfMz-Z3xuoSF_qjw-1
X-Mimecast-MFC-AGG-ID: MUb2nFCfMz-Z3xuoSF_qjw
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-aa634496f58so89319766b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 04:24:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733833455; x=1734438255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aSecLXEIEH9VAnhyNAFzRJvrLm7yztvw8Khy2pOpSMo=;
 b=rCkU9Fmv7/d+VCOcDEEbWPSXM4jcimxA4MRVJhCSPiGH3G1Incyg4639zvh4hUd5ms
 bQIQKQ035CnIFvEe5QCqpB5Jqmf4N4m5R09/csX+vVhXST+GZMBPWcPxbDczooTacVCf
 tO/YcFOTVgvn/5bIr4JU+0OgxMPLPjC0RSIKrhvYSQQHfPJyKkCIFUbf9dk6cy3zEJwF
 rhw62on79/k8tOiDNcXGwURI8p8hDjIJRQMPtFjeAXKM8h0phP1vZDvcxowjb8RR7jOS
 a03c9aZ8Px0+c2n7MmKfqNNWj0GZ96cKyinObr49HaneDQq8D0kWrN2ECUg19PrXL2+z
 IvLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNa/z4OL4DA+vM38KV0MlbD3ERqnZHGhR6e0jcjtMvfLPdMLbP/2yhzSROn/kYCR1lCmnU4ABxhlw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylgepTwMyVK9gN6YIrWOsdUkbObbqN1PXHOfplg7Ep2K3cFoQX
 0qvW/r8Ef+/zKzP68BucPBISkZYrgFrVOibDfs5BRRbB/z44ijO/+uCA/7qap0VVtmhmSveh+hC
 1K0H527EgF+TeohZiNWVy6v+1UI+cMchK64h5WIkaUlFFYgNxdE968KjItsRWoR75KQd6QwI6/+
 2TawwwpvI0dQSOWmrDnLiW/5qQurRZPepFK0MnsAf9
X-Gm-Gg: ASbGncvukTBMu8RtadzZP9xM4vkzrkfVIgUlSzIQ+g47hzwQnEjPmCKrpSIMA/oUv9I
 s28ct5SDvTclNj4bCOfMCVoMes5Cknd8tobTwFekhQGIDYoJDYXugwJkexsJ6G76lR24=
X-Received: by 2002:a17:906:18a9:b0:aa6:8a1b:8b7c with SMTP id
 a640c23a62f3a-aa68a1b8e98mr630992566b.2.1733833455443; 
 Tue, 10 Dec 2024 04:24:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcgyA52HfEjey88Kb6EsuqPIgVlks8Qpk8hL6qKkV1dFhRyyCd5ELr+Iz6VA2G2PWuz4gd34tfvQzS/RzCBTs=
X-Received: by 2002:a17:906:18a9:b0:aa6:8a1b:8b7c with SMTP id
 a640c23a62f3a-aa68a1b8e98mr630989266b.2.1733833455085; Tue, 10 Dec 2024
 04:24:15 -0800 (PST)
MIME-Version: 1.0
References: <20241129122408.4167150-1-ryasuoka@redhat.com>
 <be01d2f7-8423-4e10-b65b-a84a7bc7c99e@collabora.com>
In-Reply-To: <be01d2f7-8423-4e10-b65b-a84a7bc7c99e@collabora.com>
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
Date: Tue, 10 Dec 2024 21:24:03 +0900
Message-ID: <CAHpthZrZ6DjsCQ4baQ80b2vOTdkR=vHDx=10W7DTS4ohxb6=pg@mail.gmail.com>
Subject: Re: [PATCH v5] drm/virtio: Add drm_panic support
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: airlied@redhat.com, kraxel@redhat.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, daniel@ffwll.ch,
 jfalempe@redhat.com, 
 christophe.jaillet@wanadoo.fr, virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6JRwkeQ2-mLE881poygqivhhhtZGD3r6I6t50I0GxqQ_1733833455
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

On Mon, Dec 2, 2024 at 11:30=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 11/29/24 15:24, Ryosuke Yasuoka wrote:
> ....
> > +     } else {
> > +             iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
> > +     }
> > +
> > +     sb->format =3D plane->state->fb->format;
> > +     sb->height =3D plane->state->fb->height;
> > +     sb->width =3D plane->state->fb->width;
> > +     sb->pitch[0] =3D plane->state->fb->pitches[0];
> > +     return 0;
> > +}
> ...
> > +static void virtio_panic_flush(struct drm_plane *plane)
> > +{
> > +     struct virtio_gpu_object *bo;
> > +     struct drm_device *dev =3D plane->dev;
> > +     struct virtio_gpu_device *vgdev =3D dev->dev_private;
> > +     struct drm_rect rect;
> > +     void *p_vbuf =3D vgdev->panic_vbuf;
> > +     struct virtio_gpu_vbuffer *vbuf_dumb_bo =3D p_vbuf;
> > +     struct virtio_gpu_vbuffer *vbuf_resource_flush =3D p_vbuf + VBUFF=
ER_SIZE;
>
> This p_vbuf + VBUFFER_SIZE looks suspicious. The VBUFFER_SIZE macro
> isn't guarded with parentheses (), hence this vbuf_resource_flush is
> pointing at the CMD part of the vbuf_dumb_bo?

No. I intend vbuf_resource_flush to point to a different vbuf than
vbuf_dumb_bo. I allocate 2 vbufs in virtio_gpu_plane_init() so that
vbuf_dumb_bo points to the first vbuf and vbuf_resource_flush points
to the second one.

> Won't be using kmem_cache_zalloc(vgdev->vbufs, GFP_ATOMIC) to
> dynamically allocate both buffers make everything cleaner?
>
> ...
> > -#define MAX_INLINE_CMD_SIZE   96
> > -#define MAX_INLINE_RESP_SIZE  24
> > -#define VBUFFER_SIZE          (sizeof(struct virtio_gpu_vbuffer) \
> > -                            + MAX_INLINE_CMD_SIZE             \
> > -                            + MAX_INLINE_RESP_SIZE)...
>

Yes, it is feasible.

Thank you for your review.
Ryosuke

> Best regards,
> Dmitry
>

