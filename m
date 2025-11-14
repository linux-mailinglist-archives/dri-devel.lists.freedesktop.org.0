Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ED2C5D9B9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 15:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F120F10EA56;
	Fri, 14 Nov 2025 14:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QXt6OgYv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A0610EA56
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:35:12 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so10453165e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 06:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763130911; x=1763735711; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dWXLhPsJovH76m+UWdSFM19WXCf+smwi4mOSlHBAWM0=;
 b=QXt6OgYvB0GrccRY4O/EVcLjkMbn+DlDWyNkAUdiOnNwqvKk92sOwFWTezHXn58Q9S
 mw1siUfJL0+hkSKLuRo3si3NdEbU14tElEK/Y4WAxVUwSsHAt0dpNxiQLhr71+eh8Wgs
 7Epk38xAJNLQwkeGlqvJZs+ZfPC3TTfugHMmiSeJAzD9S5CPadte7p/kZ3E1QjHhjjd1
 X6RQiGLmC+HFNJnemHOkeOkpaIZ3Umoj91TEf1AQgq1uernXrN9JmTuWSEOVWSMGMSop
 fVU9elwaWX7QI5HDzGTVOFQuajEfhrZyZ9MGcuYRAJG1bi1bwrLc1Vt+5+r02/7urLQl
 V8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130911; x=1763735711;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dWXLhPsJovH76m+UWdSFM19WXCf+smwi4mOSlHBAWM0=;
 b=M8qwIQaPpYxi/ZFnzvOtpU9PA0ukUVWeQVR0LYBH6HhRuXzPk58LUKa5YTTg85zfnG
 fa50lULVkEmsNeE5fTQHRVQNsRq7PFwet/ElAMkIiYIJqWRC7whUY9FjrW8NgzckMZsc
 zVZsbU7m1/urRMcE9V+n9OjH0ryR2kjoR86gPuT5BkloA82+whVFNgI0QmYl5+KZ/vnb
 0p0PgySHkWv/v0IwWdWR354EZgNPsOfP5TZtBZR99R3AYlDxnW9uOtWLIgJrev7RZtsv
 zKYhUSRtrivv7reRHnZpWPQhkbgroxVcXFZJX8ZlwEOeBUcXUqR6hFm2l1eh7fSH4iKz
 3dEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyh5fu9jRoRZO67gNT3A8wOqpQaNP0GYJly258KH7Tb3VcuFiBqNXJXWd/8M94vXvllieQXOLcN54=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNRbFEBf/HjzIvLozxsMKIibFugtWxy9MGh3vCDHxKKhNXw/jC
 +UaCS+aMNNdOFuj8rJwk3x8N/3/P89oQBv4QwI6P28GzMMxIENy8ZC5OyuyJhVFfZm8=
X-Gm-Gg: ASbGncu9Q3ed9Q2xjFWh0tygnwUSmdIB66g4r/r6VI1ZeTTkNvjmFsu1Qz49cVxwAc2
 eV1ypqZIt/09pb5bxbBPhGfv7Mqf+oECW864p4jaxV6h0ZihhGI+4+UKGYE11dj7Hyl7g1l2bnU
 8qqevmVYQ8r8XpCoS2NHWq89idloqRhJdCGUyPe1V7lMjlqxalBd+XdJio+98n3J6/uwejt6Fhs
 E4/ltQsX+j6lN7dRG0z4Ycer+FeqIBPfBzGckTKe1udCPE51V798dIU3xWR2IR9PR2dG5hYuN6r
 kWii+cUFa8SETFD6Yaayc7pJwO7awp3tuLbM4fU29TzHOegGGw0HZsQ4Iu8paJzEzc8H8xq8QjY
 0V2TkPTtOMm08pEpYsdc+LKKC9vjtSYXgGCC98VOtp3N4c1ZHJmK++8M6DOUjauWXseKd0ojjqv
 1r
X-Google-Smtp-Source: AGHT+IHw5DY+d3JMXj0ehkwCi00kh1fcOQgwNxL358oZwa3xTlItactqY9kSp562T/u4HnhssT9g/A==
X-Received: by 2002:a05:6000:230b:b0:42b:40b5:e681 with SMTP id
 ffacd0b85a97d-42b593450f3mr3355692f8f.26.1763130910639; 
 Fri, 14 Nov 2025 06:35:10 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b8a0sm10330771f8f.25.2025.11.14.06.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:35:09 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CCE895F820;
 Fri, 14 Nov 2025 14:35:08 +0000 (GMT)
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
Subject: Re: [PATCH v2 03/11] PCI: Change pci_dev variable from 'bridge' to
 'dev'
In-Reply-To: <20251113162628.5946-4-ilpo.jarvinen@linux.intel.com> ("Ilpo
 =?utf-8?Q?J=C3=A4rvinen=22's?= message of "Thu, 13 Nov 2025 18:26:20
 +0200")
References: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
 <20251113162628.5946-4-ilpo.jarvinen@linux.intel.com>
User-Agent: mu4e 1.12.14-dev2; emacs 30.1
Date: Fri, 14 Nov 2025 14:35:08 +0000
Message-ID: <87346gptr7.fsf@draig.linaro.org>
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

> Upcoming fix to BAR resize will store also device BAR resource in the
> saved list. Change the pci_dev variable in the loop from 'bridge' to
> 'dev' as the former would be misleading with non-bridges in the list.
>
> This is in a separate change to reduce churn in the upcoming BAR resize
> fix.
>
> While it appears that the logic in the loop doing pci_setup_bridge() is
> altered as 'bridge' variable is no longer updated, a bridge should
> never appear more than once in the saved list so the if check can only
> match to the first entry. As such, the code with two distinct pci_dev
> variables better represents the intention of the check compared with the
> old code where bridge variable was reused for a different purpose.
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
