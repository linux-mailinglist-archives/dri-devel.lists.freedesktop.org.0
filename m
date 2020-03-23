Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45611190126
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 23:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A6589DB9;
	Mon, 23 Mar 2020 22:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2C489DA4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 22:39:07 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id h8so16176698iob.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 15:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FRiaZL1pTj8qeEw22WSzEFwOw6DWl95eMt1+igbR+Js=;
 b=vIBNaGao3fvitI+mRWN1Be+LQjeITjB4JZCbQbtvUwumajijth+r9/7KLXPrMBwBTt
 GsL8nsnt+pduh+zmY0vvOIrenGT+0AAVvrWCP4JUKAfymeQRwCaSnvSMK+b8TYvY27qX
 TbpG3U4Sr7Ges/djw+ba/PSGhudvjDTC2E+gioPCIkslyxF77gWx4sL3+PmKm+9yTM3g
 q2/0IQJW+Fdm33TTlxyqrEb0XGG1FEPp41TN07vhOpQCpkiWTc/X9nDeCHsGf+gZ2FTO
 YZvZGkL5SQBhvmhVHgpC7hBe2rhELAnoKXCftyzv+Axj8grdZeadX26CjaIA5gCk6YZP
 sH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FRiaZL1pTj8qeEw22WSzEFwOw6DWl95eMt1+igbR+Js=;
 b=F5zM37jInAYPbbiwmsWHGNxOyRm3tBbuPDCSa8qtb5H3w6q5zd0EyRz/8TeURF4cIK
 3nCZjHq7WPkw1bfIzzE3yegZZYcX/F2RDkUTDWKYBRdkDsVfNbLa/EIHwi/uCIzBu/Vq
 KlCA08SonTdUrcS8DNZvuZ0zRWE4UlfueRnWtQMt8xurOVw4tkfPlAViPeYYN+eR6k1Y
 hOZJ11J2nYxnzdbPAufrtII5FNH3i+Zs+Gb3Ak7iptaDioPcg9LtnmDkG/Upy3Z6ChYT
 jZThxtP4C9cyvEo42yQ4N95XucPgQjZgDUmhNoSxsQzBbD7yJEot+COSzDgVUdAYFw80
 LOWQ==
X-Gm-Message-State: ANhLgQ3qXvywiokGcVfTP0wb7MP+3gkmc+Xn5+LQFoX9n8HsAY+i/GC6
 nKQeJ3mRnWyx0x9e3SWjdwIiPipJNQVzZ2JBepM=
X-Google-Smtp-Source: ADFU+vvqZq2vWiX3dHQexRcnhwYpI5xzRg1jBEdOKijn9xZWt2CDYe1Wufhmn0Kqd3QkPlkNWUJwpmfTgzyAG/jkEQY=
X-Received: by 2002:a02:934f:: with SMTP id e15mr18329775jah.109.1585003146792; 
 Mon, 23 Mar 2020 15:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200323205137.136530-1-bigbeeshane@gmail.com>
 <20200323205137.136530-3-bigbeeshane@gmail.com>
 <CADnq5_MvGT8BY8T6DQqaC+5FX_Tbb0f6K25wv8fGsy1F1KV_+w@mail.gmail.com>
In-Reply-To: <CADnq5_MvGT8BY8T6DQqaC+5FX_Tbb0f6K25wv8fGsy1F1KV_+w@mail.gmail.com>
From: Shane Francis <bigbeeshane@gmail.com>
Date: Mon, 23 Mar 2020 22:38:56 +0000
Message-ID: <CABnpCuAvHOsQ7bdVtzpncoK2+Joo1_DrMPwa8daQVxwUyxPL-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: fix scatter-gather mapping with user pages
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0596335266=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0596335266==
Content-Type: multipart/alternative; boundary="00000000000088577905a18d4d3f"

--00000000000088577905a18d4d3f
Content-Type: text/plain; charset="UTF-8"

> I think the other call to drm_prime_sg_to_page_addr_arrays in amdgpu
> needs a similar fix.
>
> Alex

Looking at the other call in amdgpu tmm it does not seem to undergo the
segment
remapping that happens in dma_map_sg, so should be safe.

I will port the changes to drm/radeon as that seems to use the same logic
for
user pages.

Regards : Shane Francis

--00000000000088577905a18d4d3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; I think the other call to drm_prime_sg_to_page_addr_a=
rrays in amdgpu<br>&gt; needs a similar fix.<br>&gt; <br>&gt; Alex<br><br>L=
ooking at the other call in amdgpu tmm it does not seem to undergo the segm=
ent<br>remapping that happens in dma_map_sg, so should be safe.<br><br>I wi=
ll port the changes to drm/radeon as that seems to use the same logic for<b=
r>user pages.<br><br>Regards : Shane Francis</div>

--00000000000088577905a18d4d3f--

--===============0596335266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0596335266==--
