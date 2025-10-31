Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EDAC22D39
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 01:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D5310EA8C;
	Fri, 31 Oct 2025 00:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="eFbo4yN4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5855810EA8C
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 00:52:48 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-64071184811so1937717a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 17:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1761871966;
 x=1762476766; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gEQ18anQMYI+7tHFQ9c7MoTWULdEXT6+PJ++e+/5Yis=;
 b=eFbo4yN4FTjJ8CWwWef2iIydNipu/9ZPZKQfGY8SL0eIIjRxJXdw/1asET1gvSf65j
 Bk+tfrOxe6BCNN8ZU5tELtSBUT8ub5vm+REPfgJaVySx7Kf6FPBfGf4zOPH0a+4q8u1l
 l7HugkvwEaiWpKcIBNn99YU90C0S0HlVkS6eJzJEI5k7OQ/YL7cD7lq1hgnDycHbEWh6
 dvf73gr4IR1wcwg3f1BB6kWOASUzfRln4WwImIsgKnMU9N+ic+FkdFfEd63si6qvI0En
 /YGGtBn613d00i3ATyRoBdNXxkRdce2Ijoig+GRI869YbjMxrYfKPNNLqV7Gwws2nRWE
 cxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761871966; x=1762476766;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gEQ18anQMYI+7tHFQ9c7MoTWULdEXT6+PJ++e+/5Yis=;
 b=MOEMwQM2qRzaL6lUlachcBcymH7P3231tNT23p4F6V8l8propnxOGHy0XQJZXEtFc9
 aWMm3vKCLHF2ZIQmDPVrfKPX3qVLugC+FD4DIT4IKAhRKxuRzuWhQ6iSsnpgDVlaZrI5
 5d9ik5Iza+EK13ynI5FLEEOInRzlMaslEpGTdtbMrU6RVNc3uCQ/EzbVu5fljDzeDRjY
 seJwLaZXtpYsAf8GPgf8VCZdTSFvYlYJwHlDy+lt+sTkWKO0+2vxx99C64WzaspMQm7y
 tlLV44NkwQuP85HSfwyz3Iz0Esg382HOQCTwJymOxwRZeFFugXvmHpO62cSTRbmyIgCs
 E0lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw8vw+kfKr2imvCzNd7sqWsiqVXnanMfhLaF9K+gsjUBa4eeo0DmpBEGiVOwjRWOvjjb1sCp8BGQg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHbhK2BmntDjXzsyP1iReiQIeMV+Z+5a8TfkXvgBkM9HMy/gUc
 jmjkRyGlVIcU8HwamfwuqftaQhjQ/OKYTQrtF41HXr7kht5g0sm4Fk6IFOfZ6QhBC5M6g0IOx/v
 cB7lolH5MKSYZ3cI7+W2gvQXJKX0apbZ8q6axwjBA9a+7zrEw89vU9b8muA==
X-Gm-Gg: ASbGncttpEr3GHVQ6sYIXpJlwPiJygnLmlEEJq09aZSUu3/u190e6Mz0WCkw8pEzpW9
 1sTJYBDhLC1bB7qopASi7OmfRDquHA/JPSFwF/x/AeHG4lYHYjjUGUwfqDAXtJf/g1z5nm9uo14
 b+Cs+YSgGfsE64aqYuTCmm5QLN7btf79spt1wdU+8+ziY3UVSg79NlwdVMy7u+On49mMotgx7F/
 H1+lkphG3CM3OTagdznLposPPq72W4kFqHYq1soRZn/Ld5I/RaoPIoqpZEA
X-Google-Smtp-Source: AGHT+IH2SGUq2JivC0VwG4m1roqAWpSLfoI246C8KIQXIlrqoVKC3sTa2sFKJ2ZdL8ZfCzcdbIrSayRHAHYKBw+6C5s=
X-Received: by 2002:a05:6402:4315:b0:63e:142e:4b18 with SMTP id
 4fb4d7f45d1cf-64076f6beeamr1270481a12.7.1761871965943; Thu, 30 Oct 2025
 17:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251030230357.45070-1-mohamedahmedegypt2001@gmail.com>
 <20251030230357.45070-3-mohamedahmedegypt2001@gmail.com>
In-Reply-To: <20251030230357.45070-3-mohamedahmedegypt2001@gmail.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Thu, 30 Oct 2025 20:52:19 -0400
X-Gm-Features: AWmQ_bnsMkSJn0hwatI9MRI7jNKarfabhU-buAXAiUf2EvCIPzigfImDg_Tk7nc
Message-ID: <CAAgWFh02dw=omW-yiBqZ8S7Q2ka79=5eNicXVhBb7Zz_fEB81g@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] drm/nouveau/uvmm: Allow larger pages
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Mary Guillemard <mary@mary.zone>, Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org
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

On Thu, Oct 30, 2025 at 7:04=E2=80=AFPM Mohamed Ahmed
<mohamedahmedegypt2001@gmail.com> wrote:
> +static bool
> +op_map_aligned_to_page_shift(const struct drm_gpuva_op_map *op, u8 page_=
shift)
> +{
> +       u64 non_page_bits =3D (1ULL << page_shift) - 1;
> +
> +       return op->va.addr & non_page_bits =3D=3D 0 &&
> +              op->va.range & non_page_bits =3D=3D 0 &&
> +              op->gem.offset & non_page_bits =3D=3D 0;
> +}

As discussed on irc/discord, this is buggy because it needs more
parenthesis =F0=9F=A4=A6=E2=80=8D=E2=99=80=EF=B8=8F
