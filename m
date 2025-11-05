Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38221C349D1
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 09:56:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2FD10E6E6;
	Wed,  5 Nov 2025 08:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="cfsQULhU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B053410E6E6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 08:56:26 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-3637d6e9923so54536561fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 00:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762332985; x=1762937785; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y89yY7gWpcJMa11VuVNSbSETivlz9DMa4tLK5//0vTE=;
 b=cfsQULhUJpTl1MXuaj2Qm4DIp9xvJnnJM5Zu2jv9xzFkKFOawf6fwfdIBU9lDl2+oc
 kfLKW6jB/QkQxxjQmXKGl6xX2xhRf7tMJKOC2Kdy/ixr3m14WCIvXEGnIvWN4CvkkxbK
 jJWONV/67gBx07KYlEJsNRZRh5tpz+iesNiUgmDWYl07iBUsZXd0i1iiL1HpiIGL9lOm
 CeAWxBkwCSrXpnAQbJN+1Daa0FA2k0V4Lr370t4zUAeBrUHjhqMESBR5zMnCl3TMOTl9
 JjiAGC2GHYbGOQWNHz74N/l8A1Qb77UWcLKhrerUc7geAuUfe2Amn1hM0hxZJVZBjRCd
 tbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762332985; x=1762937785;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y89yY7gWpcJMa11VuVNSbSETivlz9DMa4tLK5//0vTE=;
 b=c1tkbx+8GmMLo+FpE99yZ8GIY0hh/fBTfrxq/pPQoG8IGhzyIHdcVKAg0hD0R2Rimi
 zQlN5KtsNYclfl+ltkXKZjdFWX37g5hn512ZqF5k4sOButbATP0xErliBg1NuHj2BOps
 dLeaPqeu7RaF7qj8s0735LdBtsV0lsztQ/+4LuZ5bjYWNjcpSHCTCINGWiw1oVu29VWS
 fn8UXffYiQhzCQamDFP4IcDu9vr0FIIYgmqcZevI2yVd8xLA+fJqkVAOKi1ePyKj7DBU
 HXcjdrV6v83CQq3CBTI7h2rh0U6FgoUvmDkmEsp+yrIc+5dsgqQWAs1HFXZgp5rIkV7l
 sGgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbstTbaL6vh1gC5nB0pusEPb+SXg3WurFa2QlAtG/HVvEeYE5ffhT5cvQygFZ/hGGPUnA6ljivsaA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8AO4ZfTefzpBL7S5FAcushNjxai61XRnQI4QpJJOJO3Vg4r5U
 TBzKOaIHeelIgwf7tmzkLihqTcp4+9qY+Xx1LC632CqUBx6WifO/3zt+SG3y+UYh9qabRj/XtdE
 c9toPlWRaymTeVTn1oNCtNl1amayNS5vTFC92d06Lmw==
X-Gm-Gg: ASbGncsy5mNYZsjj5KNZvIR6UX12ynFNreCBcsQfM0hOe7IkBOQkWm3qv+vylYPRqC/
 XTsA63HalL+IQOZgofQ00rXVf3Ugyvx1uhN20UqYHn8Jnq/+ps2oLnqsp1z1vN1/URjK0j8DTX8
 /Jz2RhTq19pw6//hWn44jztaDCIzwGYCFrqYsxHuRqlxkV/HMs8NcfGZtDIM7fhlCmjWQNBtgNA
 Yke4gKPJ+jUVaBPLg3ckXy7jJcco8c7YF8W0TcxZzE+kGzlS8+KqsRB5RjP7ghUBkIAQFMXsh75
 P5p0cs9kc9ufU1kkdA==
X-Google-Smtp-Source: AGHT+IH2rjJIpsbxE62mqch4SVAuW2LvIiNka9F2ObXZuE+K57palr/b0nf28uVcx1pSTOxZ7IFHRr6etH2UfGtiiGM=
X-Received: by 2002:a05:6512:4014:b0:594:31ef:daa1 with SMTP id
 2adb3069b0e04-5943d7cd5e6mr658796e87.39.1762332984967; Wed, 05 Nov 2025
 00:56:24 -0800 (PST)
MIME-Version: 1.0
References: <20251104100032.61525-1-marco.crivellari@suse.com>
 <34ozsv3e6ujs4rn6c2r4nrjcjifgazddy5jecwur6atfcop6vp@bunf3uyofmb4>
In-Reply-To: <34ozsv3e6ujs4rn6c2r4nrjcjifgazddy5jecwur6atfcop6vp@bunf3uyofmb4>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 5 Nov 2025 09:56:12 +0100
X-Gm-Features: AWmQ_blYxiJXoPM8ooqtIknwlby_KtGtLFK0wfQXFZtlNGpi-o6VVHAvM6Wyl48
Message-ID: <CAAofZF7zQUgF3xjxJr-Og4YcJLiaPopZANi37mC7qVgkvYYp_g@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] replace old wq(s), add WQ_PERCPU to alloc_workqueue
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
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

On Wed, Nov 5, 2025 at 9:42=E2=80=AFAM Krzysztof Karas
<krzysztof.karas@intel.com> wrote:
> thanks for addressing my comments!
>
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> on the whole series.

Hi Krzysztof,

Many thanks!


--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
