Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D25C5D42C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 14:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B05410EA69;
	Fri, 14 Nov 2025 13:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YU++uOa/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C2610EA69
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 13:10:14 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-477775d3728so20060895e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 05:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763125813; x=1763730613; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJ9S8y/liwc1XSXK0RvzbAJey2hh3NqcyHJfhnjyxSE=;
 b=YU++uOa/prmyZdae+fODyXW3wecgtfGXB+Mt8uCcw5T07DnltADGzjPP2nkrVrU61g
 FwploZLaPwsU5qgTnCw6xYlJgyi7WWLUdeMIt/9xe9sSs4wOdN84qY+WcE1Q7EbMApLG
 4m90WEdsyuJiHaS3Rg4fSqO6o9YZlYNl37ZgfweAtZK+dXxKosJM707C1+SuT1wfj1mn
 7M/2Nb/PfqPna17ZfJAJx2CPguUDmUMF2XMoFMr1pha5FcsnCF+2Emj3ToYBcO0ALLyF
 nhf/zMjhLcBQt6P9YQAEudvWWnUhSt9DlC5bB7jpTraP223MuehUpjT5BPgbOtMSWrtJ
 S/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763125813; x=1763730613;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EJ9S8y/liwc1XSXK0RvzbAJey2hh3NqcyHJfhnjyxSE=;
 b=ro7TZdDryRX7xN0vmgDqbdlYaIvEvIM841XgynebAcQ+1yKbn9zOGVqPxFl8+ghK5q
 g6M+GPV/BDiHcHyIReOnLuBECAoAGqfQ/mwqXZ/vBI1ejeDISfFbq9Vh3bMw3Co7g5mM
 vm7EEI9FUDoAOTp+INABK74h/W8NxYklM/pAE0ABktryYtsNvOQcDX2eBvImm/EHP5aQ
 k5DYrzUvQ+e0rSefEPltybk2V0SXNCuKkWuuXyKP9mz5DR1neG3QKGXECHviIPAr6AOf
 mAHfL12ykJX39BLIYLYrF7e3pV2lQaop+v/cNsT6lG/iiT//yrj0VvAtxZsHqd8pmuTp
 ArMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTLhP2AEvQ5Q4bGIqnUhEl3s4ZoR92XPRvd6GLaQtdQEGmt3B4gkx7zJSz4IFhUVdGRkVjBFtNO0w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDAwHZhIy/5uZ9rxt5KDP8Cj/qfqorSfnsdouGkB3ryl7ZZz+T
 XIYyMK5QuDf8+lGwYbvk4dKJ1az2QliyxPYlNv2VbKo178ycvfVCNylq+59BAe/50YQ=
X-Gm-Gg: ASbGncvq/NoNliJdYxDnYm7xg7Jx1lkHY4706yJ4UaFwZM1XwVph41mBw6DyLPZSAfL
 6rFjUThRnCasVTObOzDpJRt1o1HCfIWytNNdek+IDK2YXcgyPOP96MAdPiY5yRjXRJTTDnVMSCt
 O2hGUPzAuB1pgAaPp28daxJ1zpKkJ65qKEGrvXVQ9ykeVznCjXy6yLHSq/BCYtY63MRQ7kWW67Q
 a3r3Or8trwEjn5wq9MQeQFgi/kT1VLqCf/Ofz/zfO9PsNivqpCnqJ9qdIij5Jk+9oV1CsoWckrA
 IqOJW9SYlEQusTRwlw48StcJ/0+C1M+ufBK2+EwTs1WyvAc2zGHpnWGsdpsLPUkDPz1spZZBS9X
 /NJuSzizw/KhD8RWQgPzyo8Ab3C/Kw2UHWK1a5fXx1EbVxSG3q+Iw7pVDwuX6SVARuHOcEZ/KyL
 +Y
X-Google-Smtp-Source: AGHT+IFRUwKdmMnVHD85N3NvYRNZUnPZKMrSMMhF+DQcXz4gku9fHv+s1niWianlCFXxAAY6/RwthA==
X-Received: by 2002:a05:600c:3587:b0:477:63b5:7148 with SMTP id
 5b1f17b1804b1-4778fe55174mr31972855e9.6.1763125812943; 
 Fri, 14 Nov 2025 05:10:12 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779527a656sm5951845e9.10.2025.11.14.05.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 05:10:11 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1B92A5F820;
 Fri, 14 Nov 2025 13:10:11 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Simon Richter <Simon.Richter@hogyros.de>,  Lucas De Marchi
 <lucas.demarchi@intel.com>,  Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org,  Bjorn Helgaas <bhelgaas@google.com>,
 David Airlie <airlied@gmail.com>,  dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,  intel-xe@lists.freedesktop.org,  Jani
 Nikula <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  linux-pci@vger.kernel.org,  Rodrigo
 Vivi <rodrigo.vivi@intel.com>,  Simona Vetter <simona@ffwll.ch>,  Tvrtko
 Ursulin <tursulin@ursulin.net>,  Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,  Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,  =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/11] drm/xe: Remove driver side BAR release before
 resize
In-Reply-To: <20251113162628.5946-9-ilpo.jarvinen@linux.intel.com> ("Ilpo
 =?utf-8?Q?J=C3=A4rvinen=22's?= message of "Thu, 13 Nov 2025 18:26:25
 +0200")
References: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
 <20251113162628.5946-9-ilpo.jarvinen@linux.intel.com>
User-Agent: mu4e 1.12.14-dev2; emacs 30.1
Date: Fri, 14 Nov 2025 13:10:11 +0000
Message-ID: <87ecq0pxos.fsf@draig.linaro.org>
MIME-Version: 1.0
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

Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> writes:

> PCI core handles releasing device's resources and their rollback in
> case of failure of a BAR resizing operation. Releasing resource prior
> to calling pci_resize_resource() prevents PCI core from restoring the
> BARs as they were.
>
> Remove driver-side release of BARs from the xe driver.
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vram.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 00dd027057df..5aacab9358a4 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -33,9 +33,6 @@ _resize_bar(struct xe_device *xe, int resno, resource_s=
ize_t size)
>  	int bar_size =3D pci_rebar_bytes_to_size(size);
>  	int ret;
>=20=20
> -	if (pci_resource_len(pdev, resno))
> -		pci_release_resource(pdev, resno);
> -
>  	ret =3D pci_resize_resource(pdev, resno, bar_size, 0);
>  	if (ret) {
>  		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enab=
ling 'Resizable BAR' support in your BIOS\n",

This didn't apply, I assume due to a clash with:

  d30203739be79 (drm/xe: Move rebar to be done earlier)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
