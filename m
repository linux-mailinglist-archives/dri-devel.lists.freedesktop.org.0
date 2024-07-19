Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F119937B4F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 18:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0507410EC5C;
	Fri, 19 Jul 2024 16:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Fs0X6bEs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDC110EC5C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 16:51:10 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-664b4589b1aso16745967b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 09:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1721407869; x=1722012669;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hf1CRb6FNxTXLmc8WoPLCBZSAPine/5ipBZyPoxKfzc=;
 b=Fs0X6bEsQ8/4vO1b2A8bABvood5uK5ib3wlAu8sth0Q9/dHYP4ZvD0a5cVAb+gsHE1
 RFf3LlW3v4np7WiSA6gnXPB1lKN3g2yufs1T+ztYU+Aue0vaRKZBJXiVQ3KUHSJs+pIb
 +lepM6ewFtpZfQJ7+mYa3qlnElEoE7Db8ztsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721407869; x=1722012669;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hf1CRb6FNxTXLmc8WoPLCBZSAPine/5ipBZyPoxKfzc=;
 b=DgjBscWjjOjgFikwIBEODttxD6TO+bSpbT9q6hWTgmcXSOxOcTCUF9sTb4zCIpeV5Z
 c+NDQ42AfbTFJ7P07NkYdK7MyL2F/Scs33Vm7jpdpqnQK7Fl0GnPEtSzye6FDL+La+Ty
 cSuG1RzIUvuMPSEWfwcUzBmlBCQCEcT+W6AfJqc7QugYUyYB6OadYS0qbp8VhHJOzC5O
 iDst0oPyqrnIkZUYxkbAZqNC1eyKYGgPkjyROL3TbY9+e6iVtTcDwRms64Cjanm7FUDu
 DL5DNrNlqe0tMjtfm0jr0Pl8bQ0OjTfWXEVsikxBBYzGvkVGpFW53WeHUDUBScBSoq+9
 i6WA==
X-Gm-Message-State: AOJu0YzSJnBRcgkriSPJ6en/D+Q1AATlInTyhSfdZslmJWkncYJlBqMO
 VdnRnl60fSFQmEoo7DbTM5NO5dO9x/rwYfvpyC+M3O6Z1GXdbe/R1T4GY6Np9RGwFqC9uXTAOR4
 KIXyU22t4t0I7quFY0yE4ZwICpChRFktJy7qC
X-Google-Smtp-Source: AGHT+IHjw/mdIBtdJ9CtXyE6ZdUSxa1bQoYQxXnYcEvWAQfvu6Ek1Q7HBTHtbx2WExpB7oCU8juUPXdiADXIwVjn+jw=
X-Received: by 2002:a05:690c:2a92:b0:61a:e5b8:7a18 with SMTP id
 00721157ae682-66a6925fbc2mr1526537b3.20.1721407869563; Fri, 19 Jul 2024
 09:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240718162239.13085-1-zack.rusin@broadcom.com>
 <20240718162239.13085-4-zack.rusin@broadcom.com>
In-Reply-To: <20240718162239.13085-4-zack.rusin@broadcom.com>
From: Ian Forbes <ian.forbes@broadcom.com>
Date: Fri, 19 Jul 2024 11:51:00 -0500
Message-ID: <CAO6MGthS85Mmba_-MpsK=0Q08sk6vqjgCxcjeqfhKuQ+OqtpPA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] drm/vmwgfx: Fix handling of dumb buffers
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 martin.krastev@broadcom.com, 
 maaz.mombasawala@broadcom.com, stable@vger.kernel.org
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

On Thu, Jul 18, 2024 at 11:22=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:

> +bool vmw_user_object_is_mapped(struct vmw_user_object *uo)
> +{
> +       struct vmw_bo *bo;
> +
> +       if (!uo || vmw_user_object_is_null(uo))
> +               return false;
> +
> +       bo =3D vmw_user_object_buffer(uo);
> +       WARN_ON(!bo);
> +
> +       return (bo && bo->map.bo);
> +}

map.bo is set in ttm_bo_kmap but is not reset to NULL in
ttm_bo_kunmap. We only reset it in our vmw_bo_unmap. So we have to
ensure all unmaps go through our vmw_bo_unmap or use map.virtual
instead of map.bo to indicate the presence of a mapping. I prefer the
latter.
