Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89321C2B137
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 11:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406F110E3A9;
	Mon,  3 Nov 2025 10:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="eoproUjB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F9410E3A9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 10:33:27 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b6d4e44c54aso559561666b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 02:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762166005; x=1762770805; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kOJ/IBO3oLNySkAjeUQaEpdFOYftnABdhDgKv6rsMUc=;
 b=eoproUjBwKBPNAfAHeYOWI2cphwhQ2Q/C1Z/vRATxO6gJlmkAH2Lsc0ajx8nsdzhS4
 zC51HmZS3nE8XFGhF1CB0PEd50xUgu4qw39Km3azcojYgaJVKUKZHZtzskksfNPkPMAg
 AK5H74sUOJwatGDIx2frcK3n4IKnasdTX0is3Pl+dnX3VVXh+8pAfEatmCofjl+YKaaF
 OSSX17FJvaYWZ7pIgBbmHQ5ZiXR7Jg8jl+vBccsbsLExw6ntZd6I0VDGn7kyd4MYektL
 C1lJIKTvMb3ZIr0RWgA6eFOG/CW1c/mEt1Gef1W7Wd60MMocAF2WCmXfMdmxvaBuqsgX
 6SDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762166005; x=1762770805;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kOJ/IBO3oLNySkAjeUQaEpdFOYftnABdhDgKv6rsMUc=;
 b=cKSMnLTu/MRSTcfW9FDVZMJH+VgQFFiUCfabBJO5+m7dulhLT9n38o9lf5eh7l9t19
 R0VoSxjGkMe+BzK02u+EI2czwZOYagn4PnO9ktQlpwHUHg2MKOaOqdYkda8q3Ad1wPfL
 626uGqQxjC1yiPZJhG99KVVNcCZD/SEVZ45xG+4dS+u6UBW0xfNulCV5EA186XmvGXCv
 Q5Z26Niyk7hDicMJmsFGLWtq+jNssmfpeSY9zCtfVwLZrwFJgsfOL79TUPh+XYtD9vwu
 iSnFy1B1L2b5lcPV4yfSByIeZGlcVJ1OfO0oSGHl1Sd40E/J4PQuKXlmEZJyFhdInD0D
 38EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3/VeX5NCiYlMcShfD53r6u5Rxj57TPBTMX8MPBz25NLnNW/YO+b0lLGOsJWc2LcvsmW/djiicphc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzN3jq7Ufc3dqNLbhqpAJT0LnPNATbs5DK6sq5Mghi567K99n46
 m1dAHUejzMR+c6MXWJXhGqU5qhVdwu7NLzBePGfZ7KfDlTRyQwoDRTdFpRtmX3Sm9jIvyrgjRJa
 hPxtwXkA6+pHVNd7/r8VVBgO7Z5d34qsxhXurvBnfLQ==
X-Gm-Gg: ASbGncvbmMAG/Yc5M7WQ4rRBBG7PaTdUVYP5tVCHqT0FDtCr5cmdhsXIpgRFyM/1qe/
 PH/5KbJYMLJyuYEVLz92lp4S7Jt35NThMKSIp8XIXIZ0s8nVwC294cP6p1o3s1kuNkAjHaDLJWf
 bzm2lcpTzKER3jDvLpKrWm1DaS3xHwWdH4IJWV00E1SW2jTJkD67R+bz9ZRKOD0E9uCZBVjv1iD
 L0+eOPj/dkFNyuxNsRnY9St2pTMPwtEyc4Weds4Cw2TTjLH9WRX8K3uJ+mHBBKoNeK3tItiReaJ
 hUPwGAtb6sG5iNGVaA==
X-Google-Smtp-Source: AGHT+IHpCT3s3+uBnbx+aIMiSutrxjkGQNeoToq6J0kcvc+HGBKIO6gpJGl7JMeuoPpFA+c6+/i+1zgolV3NiZNm/q4=
X-Received: by 2002:a17:906:6a07:b0:b71:1c98:d270 with SMTP id
 a640c23a62f3a-b711c98ef85mr163236166b.22.1762166005609; Mon, 03 Nov 2025
 02:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20251031100923.85721-1-marco.crivellari@suse.com>
 <20251031100923.85721-3-marco.crivellari@suse.com>
 <s7jsq4mbpkpon3stlizr3mc2nnwpvngmzvnqzfbeg252ua6gto@ohb7js3ufmmt>
In-Reply-To: <s7jsq4mbpkpon3stlizr3mc2nnwpvngmzvnqzfbeg252ua6gto@ohb7js3ufmmt>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 3 Nov 2025 11:33:14 +0100
X-Gm-Features: AWmQ_bk_JyhXrMnXA1L70qG_7G1mhPIIkUfgB3eygmui2C_xUmOMiFJJ_9B5MgQ
Message-ID: <CAAofZF43CkrumJ0wy4p197pDzKHGhu7j+Oo5eDghbiwONQNq9g@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/i915: replace use of system_wq with
 system_percpu_wq
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

Hi Krzysztof

On Mon, Nov 3, 2025 at 11:30=E2=80=AFAM Krzysztof Karas
<krzysztof.karas@intel.com> wrote:
> you could be a bit more specific with your patch title:
> "replace use of system_wq with system_percpu_wq in the documentation",
> so that it is clear there are no functional changes.

Sure, I will do it.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
