Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 767AD89A720
	for <lists+dri-devel@lfdr.de>; Sat,  6 Apr 2024 00:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A1E10EA94;
	Fri,  5 Apr 2024 22:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="HqCB5Jou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8646E10EAA1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 22:26:34 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-6154a3df493so27792177b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 15:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712355993; x=1712960793;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xrnb5MtXsI2Kp4v4sJECmVVPOAlcnmKTXOp4YBctWyc=;
 b=HqCB5JouBWhMYn3Y5NpF9F2fftokOwR3CW+Zxbz6wDpM+XRpUZMmEerH0sz7rH9M/M
 mJbgGaqpSWmPDFwE2ZLUZ93u3D3SLSN7K8VqM/QV20VLz4oYFFtEVQIg2USF2G6OY/wJ
 q1xJUBlO9bYjVRrHkdLe1p+2DkBz5m+SYKHgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712355993; x=1712960793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xrnb5MtXsI2Kp4v4sJECmVVPOAlcnmKTXOp4YBctWyc=;
 b=e1CqRObvWvQVpbDjFADiLBRPLXfQ88a1FwtFtazApB8c6ocn4A84SWLTIY1wKeE7tJ
 ppuxaScsSHVVrBxY5wIgSH/10GqHYcsDQf6TAx2u4SoyYHOWF1M9ZZsjNaT/4TZGCGay
 lBm4sf70udy82Ai/sKN+uYvTKel1uN6RN00uzPiHmH5SSA5Z4bHgjElXJ33tZP4qleUo
 jbJEeTg2L4XkC6ewQvpxXkyC4JFQVb0lTnn0CWo1+IdI+WaGH+erVTuu0yllTfEAcjXB
 CoHMJrbynmH6UjixWNSvXlpagnOMN2l0Uh0Iz8TtWlh1A/ZhCJ/TPyab8prZ8ndtnxOn
 jpFw==
X-Gm-Message-State: AOJu0YzM8q4L0VwtyfZrWPeCyuPl5CpeZNy+sQTI2GMgy9CS5yll3I2O
 HbUJQgUEWj/NNnA6QZ1tVMn3Eo/ypHsCCrrFguz75/kOADrwQAF2hUfz0n6VD3TlERfC/Ieb7cG
 DR+vfFueRZUeyKfdeQlDJR77yA3istcRZ+XMz
X-Google-Smtp-Source: AGHT+IERvzLPhjAYXLm4XgtUq1vz6bgV/5+OmA3yoYOjPp+4hToVjNsB2bZwrwd4weKGxw34vyhOKqJGczzcUIgsBy0=
X-Received: by 2002:a25:818a:0:b0:dc6:daa4:e808 with SMTP id
 p10-20020a25818a000000b00dc6daa4e808mr2962223ybk.12.1712355993422; Fri, 05
 Apr 2024 15:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240402232813.2670131-1-zack.rusin@broadcom.com>
 <20240402232813.2670131-2-zack.rusin@broadcom.com>
 <0e7ad871-36e8-42bc-a5df-f418b971dfef@broadcom.com>
In-Reply-To: <0e7ad871-36e8-42bc-a5df-f418b971dfef@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 5 Apr 2024 18:26:22 -0400
Message-ID: <CABQX2QPhW_M9SUZLcT5c30VYK3TFOOusCNQ8utJ7AC6-ticFNg@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/vmwgfx: Implement virtual kms
To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, martin.krastev@broadcom.com
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

On Fri, Apr 5, 2024 at 5:53=E2=80=AFPM Maaz Mombasawala
<maaz.mombasawala@broadcom.com> wrote:
>
> On 4/2/24 16:28, Zack Rusin wrote:
> >
> > @@ -541,6 +518,8 @@ static int vmw_ldu_init(struct vmw_private *dev_pri=
v, unsigned unit)
> >                        dev_priv->implicit_placement_property,
> >                        1);
> >
> > +     vmw_du_init(&ldu->base);
> > +
> >       return 0;
> >
> >  err_free_unregister:
>
> > @@ -905,6 +900,9 @@ static int vmw_sou_init(struct vmw_private *dev_pri=
v, unsigned unit)
> >                                  dev->mode_config.suggested_x_property,=
 0);
> >       drm_object_attach_property(&connector->base,
> >                                  dev->mode_config.suggested_y_property,=
 0);
> > +
> > +     vmw_du_init(&sou->base);
> > +
> >       return 0;
> >
> >  err_free_unregister:
>
> > @@ -1575,6 +1576,9 @@ static int vmw_stdu_init(struct vmw_private *dev_=
priv, unsigned unit)
> >                                  dev->mode_config.suggested_x_property,=
 0);
> >       drm_object_attach_property(&connector->base,
> >                                  dev->mode_config.suggested_y_property,=
 0);
> > +
> > +     vmw_du_init(&stdu->base);
> > +
> >       return 0;
> >
> >  err_free_unregister:
>
> Shouldn't calls to vmw_du_init() be behind an if(vkms_enabled) condition?

So the vmw_du_init is supposed to initialize the base, so that's
unconditional. To match the unconditional vmw_du_cleanup. There's an
argument to be made whether both of those should unconditionally  call
vmw_vkms_crtc_init and vmw_vkms_crtc_cleanup. My opinion was that
they're not doing anything costly and just initialize members and
having the members of vmw_display_unit initialized whether vkms is
enabled or not still makes sense.

z
