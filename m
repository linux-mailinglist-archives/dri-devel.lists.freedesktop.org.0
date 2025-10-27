Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC464C0FDD5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 19:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3B410E543;
	Mon, 27 Oct 2025 18:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b9FXfOoF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B43610E543
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:11:55 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso70092835e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 11:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761588714; x=1762193514; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h/tr4wNuP/viUV2bLwDGJ/MFnyH+q9BQY2mO1mUn+Lc=;
 b=b9FXfOoFEOvaXMTixLj/n0m7G7bIgm0K4VN0c+q+8fycolu9O3E+6RkKPHVn3xp14B
 IkLPq3uT2IGdfdCV8es4Jl7gO7gWjmaW0oiqTdTpMVkpdF1ANU0mA7WUnl8jGGTwBG0q
 3rm+/AZwTgH1Ux/CZxRLuenRGjLkCJ0hlNTIxoupmyN/B652vpQHwQFbqrAVFqsESQXQ
 PJDPtfZK/gLTwvvCeE338w022kqhPTiL6fQaMlzze+x4qBZ1RwEtdivqrbRfin2cuvw5
 DaP9jqxNeo8sY9+iCPyegrG/+T9pO5Zipbs6Grdmc1mZlKddlPOS47re0cLVTHMfTWpr
 5+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761588714; x=1762193514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h/tr4wNuP/viUV2bLwDGJ/MFnyH+q9BQY2mO1mUn+Lc=;
 b=U4PpPsVQ80tuPG7SxqyAb2RlgAjULWlmDSq01a7gEpBXxaEO0SQR7nyleh7WyhY+jo
 J3VbuVDU0qNE9xk6iZHJzDMrhu99yX0QoYpo6vax/KlhUBEC5qlQJ1jVyCP93kJ0p688
 z47yxz0N3/Q11rig1vPVcnZUpgP2Qj0iGJzJvsntzHsbxvVAY2m2XON518iOn0+BJLmh
 DLV22oRn1Ck8j+jbN6rfKV2IHbwBeA2rMgnn0xpCZXFkTClbnRTZjbxVbAU/XlQC+SNw
 06ek20Ob8tphNxW9sdz7T6hIH4BZ4HD95F/4FI1dTqTPbhvO2Ivo5ePYKkCgV56U4zFB
 V7ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9Jsa98Epidb0BW88KaMOrAQGoB4jpxHFrhDDPMaElc2/6bnisfObrss4uaBKVjhgXoCQXLr4GaSw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9EHiJMwsBFdHW5rtg7UcdPeqjBDslgpor4isg6GC+DKv48I2F
 6PT0NjLe/r9ZKgH2HOwgyEgaPUV5MQdmDtr/urdLCkFS8VWzQ/tB/L19
X-Gm-Gg: ASbGnctN8C0IuhQXii1gvgwZUihS+auT/xRRtAnKAXiAxFrmXhyRnHsdHdzjCfJAzq/
 hqP8JGGPPRiG13D5Xy3RBhvnW6+xLTZEpPE6f7m0os7E+QgaWG8vNaG6iISbTLi0n4L/V/5Sebm
 IfBt4N0LT7uA+rF5yoOEFzSRU/C129BqK86D2FPhq9zX7erkhV4QH9Fdyy+yQ2Ncd5dsYyPkSHC
 u0AEBZqOknYb89SrbW5hh7uReXJDLc0qtqGmf1jK1+Sf2kPlltR3xTClHK2Lis9gZOZEpiNuvat
 93F3EyWEU0YvyEPMI0FCxziohCTW44r3aHigBcsxb/CPEDR26o/4DYYGx2rqVEAMfwxc8l32Ilk
 bksj+tG55v4zGU4Veu44ISUQGUXsqcNM3qBe+ITV16sWEqLmsMhPk8jyD2UVuxKQWF/q/GXwuaW
 X25jFwcEW3E0woz2ENp1agyVEl5LBBULHer2rYYGcLs0NTYsVYidjWP2cvfNPMbguWrS3e
X-Google-Smtp-Source: AGHT+IGXaCcfOwLIrQj9yH9WMbrO4UAf1AZg1ch/afDpC4pXgTmkjf1NdqvThLXtmMqqXSWGbWSmXg==
X-Received: by 2002:a05:600c:4446:b0:46e:4a30:2b0f with SMTP id
 5b1f17b1804b1-47717e6ab4bmr5964995e9.29.1761588713974; 
 Mon, 27 Oct 2025 11:11:53 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952da645sm14913054f8f.30.2025.10.27.11.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 11:11:53 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/30] drm/sun4i: Move blender config from layers to mixer
Date: Mon, 27 Oct 2025 19:11:52 +0100
Message-ID: <3382705.44csPzL39Z@jernej-laptop>
In-Reply-To: <CAGb2v65KEKPtg=WZw9su_DBc5JKsjjYV3DmpUD+LXGhX96sEfA@mail.gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-8-jernej.skrabec@gmail.com>
 <CAGb2v65KEKPtg=WZw9su_DBc5JKsjjYV3DmpUD+LXGhX96sEfA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Dne ponedeljek, 27. oktober 2025 ob 17:00:05 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gm=
ail.com> wrote:
> >
> > With upcoming DE33 support, layer management must be decoupled from
> > other operations like blender configuration. There are two reasons:
> > - DE33 will have separate driver for planes and thus it will be harder
> >   to manage different register spaces
>=20
> So if I understand correctly:
>=20
> - the "layer" is from DMA up to CSC, which is the last stage before routi=
ng
> - in DE30 and before, routing was limited to within one mixer
> - in DE33 and onward, routing is global

If you mean routing layers, then yes.

=46or example, you have pool of 4 UI planes and 3 VI planes. You can assign=
 them
in any combination to both mixers. Later you have additional Z-pos routing =
too
within mixer.

>=20
> > - Architecturaly it's better to split access by modules. Blender is now
> >   exclusively managed by mixer.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>=20

Thanks.

Best regards,
Jernej


