Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF95C23E71
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 09:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCC110E080;
	Fri, 31 Oct 2025 08:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="FEl1PeTE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511E210E080
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 08:49:03 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-592f5736693so1390494e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 01:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761900542; x=1762505342; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YcNQB2cz7cmMdG+LgLrQkA0i5OOSEJyUpwul2usY/M0=;
 b=FEl1PeTEJAkVEfmUvu9uPL2es7Xpz4XFyHdntup+BphQrid4w0khwRMunxDBjdH6lH
 zf3IyfmhgGdRcITzytE+uj+54NvXrGtnqoJA/hcCh2WXzGm62yYRnIFQpOdf8WIEwh6V
 ZGRHkmlI4vGjP+lHYizDlnHMJ6BfxJyb+QkJECChP1E/kSjwcPXgfzzDW+0TgPX+BJUQ
 fIYxRVR8H3KMPWNcN6UdTLjhYSwkhVfp80jPE1OBC9LspqfxpERKCKMaJGvPcf4ODTHN
 XfxyPZE0+qCzeWWkjXaUjtEQQsS7zUhQ+2yNaRkru9OkhWnHwaQqggx+TMsX3UoLr0ZS
 oaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761900542; x=1762505342;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YcNQB2cz7cmMdG+LgLrQkA0i5OOSEJyUpwul2usY/M0=;
 b=eF4RiZEJvvJ4r1q/0P8SxEl1/jbFk2mkeedCe6aBer40kYSM/+Gg53cBl5MwLa2lu0
 Jm5LykKrPWZyRUy77nIO7LMfh6gZS1mZHQr590RhA3AnOYk55kyH939ybqggo8mEUwzj
 kwhEx5VzvVCb0SUTaFkvfF3mH+pfaW2HrkTuabsfRpcCwt2rT9kZjcPppjf+buVIOMQ3
 Tlf/mSz4nVm8H1ArWyWBMDUN9EUo8gNRtAqHSdOB26049SBjakxl2UENjuY0CvAx2a83
 CGfcL0Zt5uIscsnojUCybsfFAz/ThrHQC1TIlXxvYFInukCR311s47vWELhmIpMNiMT/
 iStA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlV4sbCcEn56N+xCzr6INFDhdFwT6hYOAfC6emsMbhuvTkBFlZGYfH83E7YEneRXFeAqqxcP7HUgs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO7uE1aBvHlGC5tQxoHkBIRaBcAIpU/GKre3J2oDM1izSWBmD9
 f+cfQbSX2hpOHZYopW7TvAy2sK/TyC5gY7dzcEH3BcRs3W2j5MVsYlWBc4uhRLQlgYi9JurMesJ
 r+VvHtmmJPzfyppAVcu1/rnqgz2sC4Q7RdK+uLIYnVA==
X-Gm-Gg: ASbGncuWjBQI1FWb7awD8OU5VXqEGD1/IMyqmK5+DOonWqlC+Xnk8KkhkflQD7ev/2X
 vbn0vYGPcpGLbpyXFcOJTzExWSEyVq4Gs7PPVaQaC+Dof1+i5RuWGrntuKMt1ZfnpXJEcY/xLRP
 HCbiT554Et9kZlJJ196HTQHWJfHLyND2ZWj5fLXUZztMPrZNVyDZDaYLMPTVcU/4+3MgdTJYgfV
 LYJ8tNJpe9CpRPoCO8Xq53TDUn7yf5pfRPNJxG3aRW45ht0Bz8PFyDjNf+Njp7KCeJtFRtaHRvQ
 ImTH/yDB12KQdYgY5Q==
X-Google-Smtp-Source: AGHT+IG5f9LrT5nyeUFiNlUT6SjibsgaFtcZ7lVM5kJmZgFZMKb75gWV2jzCfnyesEQtIpQyfU8LfCkUsKtRhTh/eAQ=
X-Received: by 2002:a05:6512:3d8a:b0:575:c6:edae with SMTP id
 2adb3069b0e04-5941d5561cdmr988285e87.53.1761900541585; Fri, 31 Oct 2025
 01:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251030161011.282924-1-marco.crivellari@suse.com>
 <20251030161011.282924-4-marco.crivellari@suse.com>
 <690b3fd0-20a1-4245-8fc4-4e8b40695c98@amd.com>
In-Reply-To: <690b3fd0-20a1-4245-8fc4-4e8b40695c98@amd.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 31 Oct 2025 09:48:49 +0100
X-Gm-Features: AWmQ_bn-4zPvtMBML6N9b1bZZjys-qRUhwoiBnh0rijwWGoJyeJGXQ7WQEI95VM
Message-ID: <CAAofZF4V7gN=AqgLwcva+zhJyROYfSjzJ2uLxoNeS2KLuytW9Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] amd/amdkfd: WQ_PERCPU added to alloc_workqueue users
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, "Yang, Philip" <Philip.Yang@amd.com>, 
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
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

On Thu, Oct 30, 2025 at 6:15=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>[...]
> Adding Philip and Felix to comment, but this should most likely also not =
execute on the same CPU as the one who scheduled the work.

Hi Christian,

The actual behavior without WQ_PERCPU is exactly the same: with 0 it
means the workqueue is per-cpu. We just enforced that, adding the
WQ_PERCPU flag, so that it is explicit.

So if you need this to be unbound, I can send the v2 with WQ_UNBOUND
instead of WQ_PERCPU.

Thanks!

--

Marco Crivellari

L3 Support Engineer, Technology & Product
