Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 673C4AD368F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 14:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCC110E540;
	Tue, 10 Jun 2025 12:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vi6E0YDd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C683810E540;
 Tue, 10 Jun 2025 12:37:45 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-747c2cc3419so3785289b3a.2; 
 Tue, 10 Jun 2025 05:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749559065; x=1750163865; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jRQOPbrVNqSVVdbbGZatVj1/1oRXPCI6nL+WDn+7b74=;
 b=Vi6E0YDd5/Y6IxBjm34HQCoZGm80yHTiM+gl5x5fdW9UP0nZUydauJhfg6G15PH7GN
 U7I2Il1b0SQ63trUSHq6u+/keU7d2TSR1WPBcw78UdqCoAGjkvhaTi5z30WrXEeJyXtF
 amydOAuSa3+W9ikXvloSp3LIOTDwmIJ167pRPD9tcNE85+DrCUmRdozDWiAPNuHBwAKv
 gcQ9b7v4QCuuMVxxRQ9KqLFoy9MXFao0++XX1bwh3d6rjrRG0cAFUVp/2W3MElgO3WDc
 Z1gbwwa1hdl7e8ACWUEkO8qWPsxFLXb9DE7v7OcpVrHNZquExvj0EILn0FvTYpgJAvvh
 XOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749559065; x=1750163865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jRQOPbrVNqSVVdbbGZatVj1/1oRXPCI6nL+WDn+7b74=;
 b=wTvTIoNN5lWep8oaGuR6w5A8T/8a63EjvA86S4NpVPJq9K50GIGBQhwNkfbqtqIIxB
 rF3JaCX0L1XJvYrlGu7irZ2OkBikobzcT623NJG13A4n5tR5uLQ3800dKULRAI3dt5Ci
 ITVwb250jX3U/gfEa49GRmB1636xhwD+7S0I0sapZnJaWXKQ4Y4FEjlzKzY/BgC6QbBW
 E+SvGrevFsJC4GF0jnRvOH5FFglENqhlu3P51sPi2I2OM3fktGCXiyvnoqyhJR732XdR
 bvCi3HkMxlZNrrxK1Bfq4JbX0GZ4wBJXxMv9dshBzq/9zwRthlKSDgWroKRxYyyf2FU0
 n1lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWijNjF/Y+NAMSHzYcXS4W+EWNedlyne/J/1XqPD+OxeK1mZjL8sh06FTn02F8AAOypzw3s0jiV2UU=@lists.freedesktop.org,
 AJvYcCWlfpNSf/BY59MGjk80TxH35HrKzWcPlVC7RQDXd41Pc84d5GjZa14K5EpRD5qGatTlQWDnsFQ6Rw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNVO3KR5uR/vHY7HIsHE3khPRmUR/4W4kPpulsEEHAuZdoY2Ip
 p6FmpcOU5xXydEOMrtNqCSnCtsym1KuCfz3YWoEUzUpJvzzKHDoTCEzG
X-Gm-Gg: ASbGncvJysgrvvZGKP5mGUmxXknvmWIhTvetui5qpguwFFEhfmrCivPm1bzmrzL4XTJ
 4vzOPYNPPW2yfCm8GT8d7Gv3vmOkpl1bGsEpCqKNjJBzCGTN5dmGhH8IbDhMwe3r25e7ZG3DtH1
 xhXvqVM4zbuYy9EUfPEqUtagKPIIn1R1JReR4CovBxRQNGY64OnA/w+mCivzk3VMEHlMa92BrYG
 CbRDYEZvPVcj/ASHHLyNzW0xXOk2BcI5ExskBdNymyLYGiuf2q+gODtVqzee+qLXl/75tZzLI6c
 00QtnTrlrJ/CjvGv1jl6hLfynak610IfUpgsdVCsJZ0dUnP/3YAB5AkuTR+WpA==
X-Google-Smtp-Source: AGHT+IHMtYtVG5PabZhuHRmGJDtif89AiGbDOj70nrBza0cLJnhQteMI3FHrOV9iM3nIwFTlh0+ugw==
X-Received: by 2002:a05:6a00:13a4:b0:736:5725:59b4 with SMTP id
 d2e1a72fcca58-74827e51491mr24120722b3a.3.1749559065038; 
 Tue, 10 Jun 2025 05:37:45 -0700 (PDT)
Received: from pop-os.. ([201.49.69.163]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0e9d36sm7318995b3a.157.2025.06.10.05.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:37:44 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org, airlied@gmail.com, alex.gaynor@gmail.com,
 aliceryhl@google.com, anisse@astier.eu, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, dakr@kernel.org, david.m.ertman@intel.com,
 dri-devel@lists.freedesktop.org, fujita.tomonori@gmail.com,
 gary@garyguo.net, gregkh@linuxfoundation.org, igor.korotin.linux@gmail.com,
 ira.weiny@intel.com, leitao@debian.org, leon@kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, lossin@kernel.org,
 maarten.lankhorst@linux.intel.com, mcgrof@kernel.org, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ojeda@kernel.org, rafael@kernel.org,
 russ.weight@linux.dev, rust-for-linux@vger.kernel.org, simona@ffwll.ch,
 tamird@gmail.com, tmgross@umich.edu, trintaeoitogc@gmail.com,
 tzimmermann@suse.de, viresh.kumar@linaro.org, walmeida@microsoft.com
Subject: Re: [PATCH] rust: module: remove deprecated author key
Date: Tue, 10 Jun 2025 09:37:31 -0300
Message-Id: <20250610123731.194853-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CANiq72kORZjTe3tPEBueDi57TGF7KfxgTSw4Tn0DQeK_X5hi5A@mail.gmail.com>
References: <CANiq72kORZjTe3tPEBueDi57TGF7KfxgTSw4Tn0DQeK_X5hi5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrotes:
> On Tue, Jun 10, 2025 at 12:12 PM Benno Lossin <lossin@kernel.org> wrote:
> >
> > Hmm, I guess a checkpatch lint fits better then?
> 
> Yeah, that would work.
> 
> Probably for the C side too -- from a quick grep I don't see it.
Maybe, after this patch we can make a checkpatch change for check the `authors`
key (and MODULE_AUTHOR for C side), and throw a WARN if the author is a name
(not a url, or "rust for linux") and don't have a email address. 

Unless you guys tell me otherwise, I guess this is not so priority.

Thanks,
Guilherme

