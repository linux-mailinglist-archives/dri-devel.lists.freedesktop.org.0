Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9682AB08342
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 05:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7C310E2FE;
	Thu, 17 Jul 2025 03:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Gv71cLfW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5957B10E2FE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 03:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752722060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EIpIhCOwLSFAr+1nMmsSviFbLEXMRa/+C05VonbTx84=;
 b=Gv71cLfW4y7ADaBJCssTKaxMmGxXaBaXJu2kKUexW4pkThxmwZiFNG9xoAtEi6t2F8bNUf
 B/3JioinGp9jo357KfcSSNdW/DBStC3JaZoIt4VmaF1AK52WsXrVFNDkW5O16xWHvdfZIo
 NhN3/kpLVg7otw69uajz44t2CGSIvIQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-oD9s0NC-Oxe_28aPNMFepA-1; Wed, 16 Jul 2025 23:14:18 -0400
X-MC-Unique: oD9s0NC-Oxe_28aPNMFepA-1
X-Mimecast-MFC-AGG-ID: oD9s0NC-Oxe_28aPNMFepA_1752722058
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-7179076c71fso6487967b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 20:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752722058; x=1753326858;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EIpIhCOwLSFAr+1nMmsSviFbLEXMRa/+C05VonbTx84=;
 b=S1vK6FOpMypaq8jTKa8PaMaVQwVz4lUteLMLH+UTtXtBXQSeDdi5W4hAk4dcqDr7/X
 cb3Da0eblGG5rfpAwuH/MdaCCisk+AOb54PPVt1jIxsAP/JxbhlN+BBMD5VHVbFI5UvP
 y7AbnFE02+3SFNx2WRheGhtOulOP6lol9UbJOBbiy3AlbxyIKSmyixyFSQtC4KMyDp3r
 D/BnT+L2AKwr9VC2WojFNN1KeAZdVc7iQYS6LMmpGrGX+DM6BBYAdOukfu3nq7y5pYIB
 BMRqMw90oy7oW5++Qf3qHCLJrojZwxYiNJti9kK0tNTbTSSSptI7Mv35KU+h3mUA5SMu
 Nz0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDt370hUZmUnPGUIW6mUMohlQlHydtVd2QijuAy6Zlzv+Bd8Kojf3NYCamaMs6nIyxR+ISD0m6EC8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1YhjGiS/m7Ui1GTp10iOy1Z3umYzmdea/4lzRXQOd2fzCBVp3
 btZH8Dm2UXNOBFOTNKnykX7spjahNKXq8d7dIpDAOBrrtjUUnv2JyZR5Otci7GNe5GKO3Gtks6z
 QXkI55MHyJmj2u/nX9m8YV+wb720n1IeROv7OTBSGmoflw3cjCQTlFJAzz7Zmgt5tofNZy+oKS+
 0EeaOdImRC8oV6eMKcn5kEe68boS79PGMXEK+o+2ix92EG
X-Gm-Gg: ASbGncuIKcC5kIWJ1JeDX1PZs38KZV6YLVv3Zhr7KBUPHUopwWOeupPlJjxZfvgbiIp
 Z3SvDp4x0qw35cLiWXYe4b9czqpDK5EJkyFyCOvYur5fALkv/oNOIiud/eb2fTVu1/GAegGQ5zX
 brVozALWA5qMd04gUPvV0=
X-Received: by 2002:a05:690c:9:b0:70d:f3f9:1898 with SMTP id
 00721157ae682-718374a1941mr78331397b3.35.1752722057891; 
 Wed, 16 Jul 2025 20:14:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtr2Y2HrRUY+4GFtBJLWY0DgaHZsSVMUD6JSv7nkA/CsiIZjPMnjce896j+JI44FJBDyJ2d2gEvJSB4xco0Pc=
X-Received: by 2002:a05:690c:9:b0:70d:f3f9:1898 with SMTP id
 00721157ae682-718374a1941mr78331127b3.35.1752722057555; Wed, 16 Jul 2025
 20:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250710-b4-driver-convert-last-part-july-v1-0-de73ba81b2f5@redhat.com>
 <175268024705.1893267.8357084891720845996.b4-ty@kernel.org>
In-Reply-To: <175268024705.1893267.8357084891720845996.b4-ty@kernel.org>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 16 Jul 2025 22:09:48 -0400
X-Gm-Features: Ac12FXz9lPyiDc9VczWtPUzedHzXg4CMmpkZxWl_FgKJyoV_-y_qvQw3wVo72zo
Message-ID: <CAN9Xe3QJenwW+50xN80vyvULLgGc9x-T+LchY_67Ak9xKKmezQ@mail.gmail.com>
Subject: Re: [PATCH 00/14] drm/panel: Use refcounted allocation in place of
 devm_kzalloc() - Part5
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>, 
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7EVpc_NHHd29yOWdDSpatHWK5C_r0mYXGPM2rMDhIzU_1752722058
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a18879063a176730"
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

--000000000000a18879063a176730
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 11:37=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:

> On Thu, 10 Jul 2025 23:31:11 -0500, Anusha Srivatsa wrote:
> > Use the new API devm_drm_panel_alloc() for panel allocations.
> > A major chunk of driver conversion was sent in a 3 part series
> > which is already merged. The coccinelle patch that was used to
> > identify unsafe panel allocations didnt flag about 20 drivers.
> >
> > Not using any semantic patch for the remaining drivers.
> > This series does the conversion by not passing explicit type
> > to the helper and maintaining type safety suggested by Geert.
> >
> > [...]
>
> Applied to misc/kernel.git (drm-misc-next).
>
>
Thanks!!

Anusha

> Thanks!
> Maxime
>
>

--000000000000a18879063a176730
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 16,=
 2025 at 11:37=E2=80=AFAM Maxime Ripard &lt;<a href=3D"mailto:mripard@kerne=
l.org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Thu, 10 Jul 2025 23:31:11 -0500, Anusha Srivats=
a wrote:<br>
&gt; Use the new API devm_drm_panel_alloc() for panel allocations.<br>
&gt; A major chunk of driver conversion was sent in a 3 part series<br>
&gt; which is already merged. The coccinelle patch that was used to<br>
&gt; identify unsafe panel allocations didnt flag about 20 drivers.<br>
&gt; <br>
&gt; Not using any semantic patch for the remaining drivers.<br>
&gt; This series does the conversion by not passing explicit type<br>
&gt; to the helper and maintaining type safety suggested by Geert.<br>
&gt; <br>
&gt; [...]<br>
<br>
Applied to misc/kernel.git (drm-misc-next).<br>
<br></blockquote><div><br></div><div>Thanks!!</div><div><br></div><div>Anus=
ha <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks!<br>
Maxime<br>
<br>
</blockquote></div></div>

--000000000000a18879063a176730--

