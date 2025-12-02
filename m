Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5155FC9B916
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 14:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930DD10E64E;
	Tue,  2 Dec 2025 13:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Bf+0VuHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C4910E649
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 13:20:18 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5958232f806so6158322e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 05:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1764681617; x=1765286417; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TPGuSfQN7RTqxMcHEP4Qt8V7/gXbXz1mQU1AIOr21Hg=;
 b=Bf+0VuHUm1SsgC5LaZTFJ/uuGr/IQ46qsp9oC2SRRi0JDfKP+mx0KAS77f8vm7OWyz
 3EPASh/JAq18vJGknL9+8G3j7oEMZNUT0OBsHNwab2+zz7MN/UVi2d+b/FELjkKu56mj
 FLY2DrQOyhrI6fGH8qIRFnRzqvANFHbOMy+VTnyNk1H9YxyyGltP7D8bUIS5Yl/gwucb
 qEKjfBWXd5lakdtnZBEGTVq/FBIHyh0oQI6Np4mSjm29NprtWiq64tsxKAAg2VYek0nJ
 y3P/zWm9RzX/4E8DT5BOZ6Pgm8io4jq0Zm1Dyd0sbIURstCM7J0AUJ/Dmfj0TzL06rk3
 ZRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764681617; x=1765286417;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TPGuSfQN7RTqxMcHEP4Qt8V7/gXbXz1mQU1AIOr21Hg=;
 b=nj3DxcpxymEOydRJorNXo9b96hiDK1YfxZfi3tk0icfQ7ePU0ueLM78KrLwOa41VVI
 4yg8RMHTK28a4ixjy7RpLlQpadswMmCIi5C+WoP7FRkqNaRwRC/UYuKwAZg1Q68BdgBu
 0e2DAhDEc7xK1flyYb3D7+lIcTQ9OWddpAbLPHweFBuDByXHW+ysJh31mEMqpPAaaNET
 Q15TGVIzR/LOAP/sXBDWmfIRU0ha7bzK3uNvDOPlYb6P1k4BoVyChWRzuUoAfd3ihUpJ
 m8NtcyZ0OypeyWeqtXA0Zp69dNGOVQ0LOmstYltfSSYATLNyIPyf0IeNEfSgBpINKNjj
 ogQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwBq2yEBvy3aJNSIOm6qHCNwuVHmgqhnj7hiVecO8+rELQkUDb7FczUaQwminAemqEXYAmOB9NlUA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy59SR5cY17QBb2TUM4f/5mH1POyCHQ2k8xkE9MQS/Cs+xCukmH
 O4WN/ddHTLSV62frS7/ZvYqt67O7xTl9ELuOEg8159QabC+AJaU3eZKrJG1r9tjVlRvUb01iWd9
 t2ue40BCv9C83TSk3XIWjPFq9kvl2rANHTWHz6sXMzw==
X-Gm-Gg: ASbGncs7uRJJk81pIrPgAKk8K93iMslebpc6k1Mqe1rCFu/fP/ZxdQTigy1HcaXRBYc
 0vP6IOWbTn6qOZQE0U1mXVR2omDmkFIKzoYMhAVyXLLGSEFgoygdHLHFxQrH+SwCrfPxrTFBYuK
 nbXB5GQ4C5h+Qgd33FnEN9Xd3gnbz8gOJ5pW1O2JyjvaOnx05OqC+Xkpv4UfhtwozM63Ux2y6OZ
 RTIrRwJUXrLqFOuhT3z1wKkdP0Qz3gCFPIDr1N6pUxAxWisChD6hMhRgi+8piW35CqKVihYhjTk
 BAQDBNxic5kskerklphsdUL+T060
X-Google-Smtp-Source: AGHT+IEA/K/HX/OW8V69s6PQ6GCdzTTi+Af2CoTxJJkGo90jaG61+aENobjT2as2NwixFWEwChx0gWllkjQBUmhw5ZE=
X-Received: by 2002:a05:6512:3e1a:b0:595:7f2b:4862 with SMTP id
 2adb3069b0e04-596a3ee5ccdmr15007743e87.44.1764681616654; Tue, 02 Dec 2025
 05:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20251031102020.95349-1-marco.crivellari@suse.com>
In-Reply-To: <20251031102020.95349-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 2 Dec 2025 14:20:05 +0100
X-Gm-Features: AWmQ_bmpt1iuUsFhYhQyqfygAi5Z2DrfW220D4MyKs9tGqKURWEt-kIZ5YrRuoE
Message-ID: <CAAofZF6M+87thr7KGyytcM1sqebH=U10nSNo-gmuDxeFSrkwCw@mail.gmail.com>
Subject: Re: [PATCH 0/2] replaced old wq name,
 added WQ_PERCPU to alloc_workqueue
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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

On Fri, Oct 31, 2025 at 11:20=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> Marco Crivellari (2):
>   drm/nouveau: replace use of system_unbound_wq with system_dfl_wq
>   drm/nouveau: WQ_PERCPU added to alloc_workqueue users
>
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c   | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c | 3 ++-
>  3 files changed, 4 insertions(+), 3 deletions(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
