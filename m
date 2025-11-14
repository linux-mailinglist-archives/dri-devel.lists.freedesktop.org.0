Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F7C5D010
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 13:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C1310EA4A;
	Fri, 14 Nov 2025 12:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GRWwBapB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4631510EA4C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 12:06:03 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-42b3d7c1321so1420263f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 04:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763121962; x=1763726762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K95f3YlNhCQTt8GtlNX0mi3FKRnBks4BFfnVQ8YE34o=;
 b=GRWwBapBrsxyfWgLaEjXF8spVlM9bDDnz3HdGDFO3FHhgE1LDolctkWZq1IxKS/stu
 tuZR4kLKlHC0QUzpidKgCHTnvo33QBacxT2y1r5gW/N2+ESeLqncQz9VzowdW+SL9kg5
 UkpCAzy9QZk55YJ58XvouEZbyRgEE8jIvP/vK0ipV3DzpPAKwNEGkZ+yNDV5vaLioP2l
 DpQd7DNsoNT35RuLFcumfFsHyOhOZ8gqBsATGdKDOzjs2alKdyh1ShiGryvFKFrgszG+
 fI257YBRnEwlpOF5kulu4b7ctr8okk5Fw58EIDkiCncGJMwjxHNM99r/socuJXcIoldT
 A1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763121962; x=1763726762;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K95f3YlNhCQTt8GtlNX0mi3FKRnBks4BFfnVQ8YE34o=;
 b=lBtNwUlTvAsI03l7EfK6NOFZWn+Yvhoc+ONPL4yfyPVRegd2h1jgXNW2FUm+BpWFMQ
 ueidCxhWcYZSMoIleATUrDswnRZhlzBqEz9hzPNgGm8W5Zdiu4Nw0lSDZ5P8u8adIb1h
 cHxv7G6zZN7tXVvNqdsShWBieJbsWzcmfy9ZCSbzPjFepvyzDKVC7WUsP0K9VQyrCOID
 3dIR3S3nIM8Dx1kQKygaPH5/obMD6B6OknLGys8pB+fs0C7ER211Ajap7N8zERIQdyx/
 Qid28viFk2+xrzWpYzXaOpNES2fo+1cPkWX20sIismb/fTV+SpkAkTFVYcnBod95l/om
 yOHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPxWTqSYGOGbW31C3o5lreZ7xl/eAIZ6+Gx2vF3vL5k73pYfylh5zd3jiFiNZIfPMuwNLTF1gi3Yg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIJo/YQEElrEZJbMPHpy39L55sbsHyNmm9kugGCe/P8VJIu26b
 iHSK72DPxsNkKRq8KzGu69+ZoFgainLCZmSvwStd1CGEt+q9L9OI+vGnI9IN3oDljH0=
X-Gm-Gg: ASbGnctDcoJmQHRMhV7XV4Br2ojKeSyvrYB+bGNrbEs4nkhWEQNf6C83H4GY4dWq4aa
 NVOoabj59PObXmh0M22Ar8BAgJGUPnAeXOTuHMWhJwf88LS8xNa280j62CjRGbYGRsdFKwDt4IF
 1FBE7oZ/DDL3mD7kQRWOlsJ6uTU4pDLzn76AfvgQpljjwD5wtP1DcC4X+EVa190Hj0UajTmpkyi
 6B7ZZ+6ZFEZXpSKEFx3GSZbXVZUxloUkOoWZHyJk+tteIxle2id4ykHK7ap7z7AefGnEgxw8Bl1
 FvUszHAGfHhpulyC99wPZ5Iw9nyVOzvlwHGjUtyeD+ez/mbFf/l8cUV8kqT4TGAIKT7b9omQyaZ
 2/bfUiuZ9t5+Y6hTpWq89hP0urRipA8hdPeE5Zy+jjJWDH7rJe9IElq10LFvhj9Z6AodyxbQFkv
 nz
X-Google-Smtp-Source: AGHT+IHE8wmfBLRimraz6qGrkqAB1kcfDLmC9Ei9799tyFpwTbyC2bx5mJA0Z5MS/+tIuTgQ7sZknA==
X-Received: by 2002:a05:6000:25c8:b0:429:c851:69bc with SMTP id
 ffacd0b85a97d-42b59342f3fmr1891458f8f.8.1763121961723; 
 Fri, 14 Nov 2025 04:06:01 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f206e2sm9569035f8f.41.2025.11.14.04.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 04:06:00 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1D11A5F820;
 Fri, 14 Nov 2025 12:06:00 +0000 (GMT)
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
 <michal.winiarski@intel.com>
Subject: Re: [PATCH v2 00/11] PCI: BAR resizing fix/rework
In-Reply-To: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com> ("Ilpo
 =?utf-8?Q?J=C3=A4rvinen=22's?= message of "Thu, 13 Nov 2025 18:26:17
 +0200")
References: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
User-Agent: mu4e 1.12.14-dev2; emacs 30.1
Date: Fri, 14 Nov 2025 12:06:00 +0000
Message-ID: <87jyzsq0nr.fsf@draig.linaro.org>
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

> Hi all,
>
> Thanks to issue reports from Simon Richter and Alex Benn=C3=A9e, I
> discovered BAR resize rollback can corrupt the resource tree. As fixing
> corruption requires avoiding overlapping resource assignments, the
> correct fix can unfortunately results in worse user experience, what
> appeared to be "working" previously might no longer do so. Thus, I had
> to do a larger rework to pci_resize_resource() in order to properly
> restore resource states as it was prior to BAR resize.
<snip>
>
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787

Ahh I have applied to 6.18-rc5 with minor conflicts and can verify that
on my AVA the AMD GPU shows up again and I can run inference jobs
against it. So for that case:

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
