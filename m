Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E147CC2B119
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 11:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4518910E3A8;
	Mon,  3 Nov 2025 10:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="YP6f+7nw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C4F10E3A8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 10:31:44 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-57bd482dfd2so4266755e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 02:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762165902; x=1762770702; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FoPFhQQS89S0PG9IrFQ4Ih5iU0Zai424+/DcdPiuCSc=;
 b=YP6f+7nwo07487EKDvl7c/BmGP5NZ+3Y2GSmsks5dCKBMnDjli6xfaT32u1o15XQgR
 y1BmmRDEgsI/crrUYwY9tU79c7WN83Ldc2VEchEQpiXopiiQGy56Nttwx/1V//vtJYsj
 E87L4NyJ60/y29b9O4uxuJTkgVoEwHipOKnEI/ZcQMu2tACqbAoC5Wfk6cIone41uLci
 4w+OFNqO81erF/hJF0Ooe0LsFnP95rauNiAicWptuJjWFA1dB/BOvsERnIsOmcJkrv+8
 N+MXtCwLWqJivoAczYkQudtFoiwNDwFUjspdY4pUkioOreGzqClQjqu9iMS/T2drK3Dy
 /ZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762165902; x=1762770702;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FoPFhQQS89S0PG9IrFQ4Ih5iU0Zai424+/DcdPiuCSc=;
 b=E9eNfjPf83RfTISI9sFZ2yY8wqRHq2NoPTlyMKAUz9/O3wwsGwRwAsAbZqmYPTUlKV
 gNW6NEIGfletthM6N7yApdSxnaG2V1jUjMIFn7+es0eSEr5i50gt1482Z6Oz/3r1RgZL
 ON423TLZQB/M2GFYfEDVsyRD+f0XnLjXNkmjeb7kOgeWdq7OWw6EobdPL8ZfTEKxopRJ
 cFXR+QQn5apwrxn7kKZlzrUCvqstKgDFYeHxyYisSFl80BcYPBlHgpIxHAmgI4+CK11B
 cwMdvob3yYp/BtASIg0Ehnz0/Mfg0ArZKEG1eoZOK6PtNIseQv98FcIuM0h0JcUxz3L3
 fWDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwDZc5BjLFWpkqVbewjtEHK4pllPjbso40KsYsIgYovwHY4fVlFdp0LwK9sPwtO3rtUi1qFf7eOHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxF5nZf9iyrGq1+my1zBSUNM7y8wFNbzh83JkOqQC27HHWbuh0E
 fyKewoywsp4nbEG9VjhAn8EZdbp4fI5jLrv9SpCuaCUx5vekZfYOjA+v29th8DoLq4DUDpd1axF
 1EI+pR2/FmuKggafN4opucOq1+7hjxg6uI65OpujcwQ==
X-Gm-Gg: ASbGncvac7Hctwh4bn8MCPS4qk5REbgjQOPtShKElvWkp9qhxd13HxP3u9VoVVdLfl0
 78jbL/QqbHAN7TPatQslpwpig0uhGNexyUOvp0zOAyFpHsGNu8CJEgC+MlT/sYr7Wz5a4P3EI2L
 OfVfGtRkCkD5KAxd2kBaKWrn1nZAbJDolBquw2FgwVMgaN+QBGnNhvp6TyBDNC+pePPXS7HJGVZ
 28r6WJQY0nBneX5uV1viBhcZQ/P48khorBCl4v+vy3qpt2e4gNGpRHfGlNWky24cgc4TTcfvxmC
 147RsPoSfPAmxwegRR5e+LD4K8U6
X-Google-Smtp-Source: AGHT+IEwAU4SOZwUJVarSaQslcnJLXDLRhKZeIYvNp3qfEofTMUe8ZL6Dwbf77J+nSRDOQjf4bHs+Hk1B3ORqp9w7+c=
X-Received: by 2002:a05:6512:3b9f:b0:594:2f46:3906 with SMTP id
 2adb3069b0e04-5942f463d1amr413899e87.42.1762165902161; Mon, 03 Nov 2025
 02:31:42 -0800 (PST)
MIME-Version: 1.0
References: <20251031100923.85721-1-marco.crivellari@suse.com>
 <20251031100923.85721-2-marco.crivellari@suse.com>
 <zduzgow2hyvxfzmrhqansber4eeg63av6i533oihvx4ubxdqaz@wu64gw66b4jt>
In-Reply-To: <zduzgow2hyvxfzmrhqansber4eeg63av6i533oihvx4ubxdqaz@wu64gw66b4jt>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 3 Nov 2025 11:31:31 +0100
X-Gm-Features: AWmQ_bkkbh1PZ_mUlCEwcGKqGMRPmj0_7LacVUfhPhRpCu1buDmddrltRgzVqeM
Message-ID: <CAAofZF6EE=grXh8mowNRDcDkL8RwwrvGhawcjGqcEhn5M4M6zQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/i915: replace use of system_unbound_wq with
 system_dfl_wq
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

Hi Krzysztof,

On Mon, Nov 3, 2025 at 11:19=E2=80=AFAM Krzysztof Karas
<krzysztof.karas@intel.com> wrote:
>
> Hi Marco,
> [...]
> This commit message is very similar to your previous change:
> 128ea9f6ccfb6960293ae4212f4f97165e42222d - did you do that
> intentionally or is this a copy-paste mistake? This is also
> prevalent in other two patches, so I am curious.

Yes it is intentional. Well, the idea was to give a bit of the context
about the rename of the workqueues, sharing more details in the
cover letter (where is present also the commit hash you shared).

Sorry if this created confusion.

> >
> > Adding system_dfl_wq to encourage its use when unbound work should be u=
sed.
> Please remove this sentence, because this has already been done.
>

Sure, that was not intentional (copy and paste mistake).

Thank you!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
