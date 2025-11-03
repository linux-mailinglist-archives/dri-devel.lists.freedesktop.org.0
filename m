Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B47C2D644
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 18:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F62D10E453;
	Mon,  3 Nov 2025 17:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Nz1n+yBA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC3D10E1FD
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:13:40 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-640ca678745so1781533a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 09:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1762190016; x=1762794816;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7M2HlEY/xp7Tvs+4XpnDO9jxGXqGnNjvVLof1sAc3tc=;
 b=Nz1n+yBA1hUJFNzYJ6A06BslUIvRed2/FlKP+a3C0kwMaeLQaN3B7l2SO4FYQ96hYT
 HV0U+xOs2VTI/zewyeDzw6iBEpxk7ZNf/9A55VWNBlGlNA/4sFBYFYuidi7rP7tYzJJD
 VttFy8sgYPf7ZXOqZSXma6gwk5txKw6QqziMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762190016; x=1762794816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7M2HlEY/xp7Tvs+4XpnDO9jxGXqGnNjvVLof1sAc3tc=;
 b=vnfZbkQbT/TKe/1L3+vSfea/sJzb3rFI8NPYx3PA435KOwaxTdHm3E0JMARVwao52G
 LX3XSQoPUI46WvnJ66XNbo55Lx8GFqXL7U1fvI3zi7Gc4bmfKUp9bCPTm72Ewx9BoQyr
 st35lH7vHdluWOOdzyRKAz9wMSmqBGgYB7NikMWHNQ6e1ylB8QKMjzcYV/mshkUV4IzU
 w7UotQg9OwRfDRsNJJETvHJBdcHQq/fmj5A5c1lkhOMt+EZC9MK9tJk+sh0ObF672Ikd
 2Jbu22zp5deic6uxdMda+nop2Wx9QnlYtY/y8q0WU17dZidSgteptDbLvOCv9iU2fkiZ
 x4XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJu5p3QeAlFJswn2gJ++43oLEzCvyChz6uSbRVv49RmcOTNBgo/2khQqZl5l4Wgoq5Iw1pgTLbmrs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyt4a3mvyBDmqaP+0TSV173sO3wVRZ1dtn8okNyrsa9xnWVFspD
 0FbVLypmDYBJyAqhcj9rxZjja490Fa4aalnoi7GAtjcZRdMRphBFKbLIfzZr2vFmaL0tBuaHiKc
 KEDo=
X-Gm-Gg: ASbGncu1YUSRzwQvnAbi/crYd4HTNo8cKtWM2oKtkH+Gg4A9qhMgtNpvmvOiLLIwliX
 DMI6MgwZmGYrJFQ3F8jxdOrJvzSqRhfi54y19fpYjsTYZmUsGJuWNyGaB4aO8jOkc2/RAG0U+6v
 Xdh7sSDoYkoqkFEa4tsc68/W9b4N08CqBF/YFG9OA+pv0be5mB21sAbzZDN4OdP6CqDWROmK1j6
 Syno3UHKPut2cRj3sZ15pQTGj2MsAnlsRu9JLuM3WmH7Yi8yaOV/Lnqfle6QBhXObK7+w85G1WY
 tZXJ50Xrl/YN5yv0cMGNOkHZmo02CxTS5EKnfYASUllG8glCH1Lf/F8TvCHJdpZj/43APQBzYj6
 5+Yeel2lSr1ElQ0fmewFjsyTnOt2sr30Kmcb9OtV53eS2qha4BJd32Nny5/3AgEHUNTR+azlzyM
 A2v1A/jiXbGbP3sq8n2A4VlBEn2wl6Hh66IILGeng=
X-Google-Smtp-Source: AGHT+IEkNGtIWPrbcqEuKEGu59sTl689h06k1AUOoGby8uqsT7UyxDSOET2V8n6YEOgYgLvZGwoAjg==
X-Received: by 2002:a17:907:807:b0:b6d:6ae2:b85 with SMTP id
 a640c23a62f3a-b707013ee16mr1488692866b.20.1762190015648; 
 Mon, 03 Nov 2025 09:13:35 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b71e9fd0d3esm61797366b.42.2025.11.03.09.13.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 09:13:32 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-429c82bf86bso2153584f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 09:13:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXUe7wyuzY5kLY1gKY7QfUplN2GVz7mQeEvqMluwf0irfeIODafumkImdtFoO07d04a41HsNXh38Eg=@lists.freedesktop.org
X-Received: by 2002:a05:6000:1867:b0:429:cbf8:1765 with SMTP id
 ffacd0b85a97d-429cbf817f7mr6677495f8f.33.1762190011276; Mon, 03 Nov 2025
 09:13:31 -0800 (PST)
MIME-Version: 1.0
References: <6209957.lOV4Wx5bFT@precision>
 <339fb24ed184567e8bf0810ab70638a852c2e40d@intel.com>
In-Reply-To: <339fb24ed184567e8bf0810ab70638a852c2e40d@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 3 Nov 2025 09:13:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UbL3XSWw-Q_UYW5nDep86BpkGBFWAyE+bzTAcWwu29xw@mail.gmail.com>
X-Gm-Features: AWmQ_blyxmYbX4YshHiyBFM06dgaM-Vms9WJ7lJETawA9xXRrrlbUhG9EA4Ds_g
Message-ID: <CAD=FV=UbL3XSWw-Q_UYW5nDep86BpkGBFWAyE+bzTAcWwu29xw@mail.gmail.com>
Subject: Re: drm/edid: Add kernel parameter for override edid check
To: Jani Nikula <jani.nikula@intel.com>
Cc: Christoph Thielecke <christoph.thielecke@gmx.de>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 Alex Deucher <alexdeucher@gmail.com>, dri-devel@lists.freedesktop.org
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

Hi,

On Mon, Nov 3, 2025 at 5:39=E2=80=AFAM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> > The only workaround to get the higher resolution working is to provide =
a edid firmware
> > file using the parameter =E2=80=9Cedid_firmware=E2=80=9D. This needs to=
 be created manually and build into
> > the initrd to be available early at runtime.
> > I think the workaround isn=E2=80=99t very user friendly.
> > Putting a flag to disable the edid strict check would help more people =
get their moditors
> > more easy runnning by their own responsibilty.
> >
> >
> > At a later time I think a solution for controlling the edid check at ru=
ntime should be made
> > possible, so that desktop environmens like KDE can implement an manuall=
y override by
> > specifying a firmware file or disable the the edid check.
>
> I think generally the solution would be a quirk, but we don't really
> have a mechanism to identify displays based on half-read EDIDs. Chicken
> and egg.
>
> And then there's the problem that it's not just the checksum that
> appears to be wrong here. The workaround pretty much is the edid
> firmware option.

FWIW, I know when we were working on panel-edp.c someone mentioned
that if EDID identifiers weren't good enough then potentially we could
get IDs straight from DPCD. In theory I think there are ID registers
from 0x403-0x40b. I don't know how consistently monitors set those
correctly. ...but I guess that would only work for DP and maybe the
monitors that are failing are old HDMI / DVI ones?

Hmmm, though as long as the EDID was consistently corrupt in the same
way then it seems like maybe we could still solve it. If the EDID
looks corrupt then we could hash the EDID and then look the hash up in
a "corrupt EDID fixups table". If we find a match then we could
include instructions for how to deal with that corrupt EDID. Of
course, someone would need to write that code...


-Doug
