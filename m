Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA89C9A7B9
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 08:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913DA10E578;
	Tue,  2 Dec 2025 07:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pp9xHE8u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7BE10E578
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 07:37:44 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-8b2d56eaaceso499933685a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 23:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764661063; x=1765265863; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uMUqOtbQRuBycaLGOZXvsFQQacfvpLgzgzobZhOZjuM=;
 b=Pp9xHE8uNJ4PnL7lhJQn4Dj3xLo2DVjtDVBzPhO/rBC1/lYL1WOY1u/EO39DMqaFeI
 K/kDf6t+oM3W6ceXOuy8n2iQSioT1SangRoUhDA4h+EFpPJNYX3XIG33lReO/u4RlPQt
 vbTCaNrCAri3WPxWm8tGPwf0lMC/arWe+zmREqLiXIwNUO3c6j++GEK0HLQduPTdz+1X
 wV+aLCJ7YLKVPajXjH97dVI3azWQ6ipfSEKasZa15FXnWV6sRXFW3/9yKYTG48Ff4L2l
 xLJllctwBhzs2KRixPX1Z9QLZu2PrsJJMsl5bpKicsTFzWC3qWbfpyD0y97jL8bF7dLq
 nGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764661063; x=1765265863;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uMUqOtbQRuBycaLGOZXvsFQQacfvpLgzgzobZhOZjuM=;
 b=ehA593pzyG0v0nTEgiDXktBgtxoM/wr4Lh2VmSx1Wt7rrV3Y8EOsstZInbVf08E/s/
 1GDQf/GKGfGf5FuZuoiAwRpZeUSOjPyHOE2TdW+TUeVqKLdu+qC0s9YdWCmFYQwpiXtk
 T2Tt6lpkVa9xnxlVNOAf9J8RYzCLaQpMUFcGtNxcpJpKhX5oSzb4KQSvfRpUuF0mvn8D
 /3jCPZB6Y+WsUtO69+giZqNVGXDCoSRUcPJmeCXNOUQVBe3IPXesiCcSub8TZM1EFP1l
 O7daPmP4SSOwO50q7/oHR/onkqoL2knb319HABcppg27yS4ERrxxR7TLLAvpwCHofLVx
 5e9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFcFsoPHx41yfL4DiIvd+ee65E2DuLABMfE3YuXc0TSK4qPKv9dqt2Vdcara/llaGe/gBT7dBQS3E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywaKR5OOXT2wMlDP4w2mJE4lFXEuN5X5u/7JvPfUsAW3YG57qT
 YxfS7Xs0lErCsiar19DCe3afU/g0GizeapmzFyHG3ByS25jSlYq1jfMcB6BJ0OzESK17Q+eYQ0s
 cAMp93HteT4mSmrCCo/WhweN9axcZIkw=
X-Gm-Gg: ASbGnctwsEQK/zJGO0QcOYIx+eBEDSJX9OqQk0q2veXQ7s24HcNoHkZm7jgSO1yIlKv
 N9LqcHfUk3HaURqsqLNP/mzslRbOP1uL2H01pc2xmAYMdSWiXZc1QBVk7Eq4VeCv9dVnBzgEEit
 HRfXs2P0ndutmMLxWfhA+ZTdFXm3zgjt+cErDquBwuP9AgxKiG+oEalcKYQwJBk/iiDOtj2c9oq
 ZJYw0w1JUCjWhVun5yTUX/aQQblRbi0JsIto1PYAaq7gmgtkC56dkjvmPxaPj3QQVURZbEwRYkn
 BfOm
X-Google-Smtp-Source: AGHT+IGopKlmXLCFS1fuJTBQDpmGNuHcj1qAM5tdnHITeRvJEMu/jP7kOUGnQ1XvT3kDhIqVYBpkKESEJ61Y//iTWms=
X-Received: by 2002:a05:620a:4492:b0:8b2:735b:973b with SMTP id
 af79cd13be357-8b33d1d0e9emr4997633585a.23.1764661063253; Mon, 01 Dec 2025
 23:37:43 -0800 (PST)
MIME-Version: 1.0
References: <20251107135701.244659-2-phasta@kernel.org>
 <c35026065b1d109b7f4b9e1d8dee8ea45f9a1dba.camel@mailbox.org>
In-Reply-To: <c35026065b1d109b7f4b9e1d8dee8ea45f9a1dba.camel@mailbox.org>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 2 Dec 2025 17:37:31 +1000
X-Gm-Features: AWmQ_blLBdudWw8MvRxu2fQVyMFReBG71QSBVpfR0YW24N-X61nRZ4UlCjTmc0k
Message-ID: <CAPM=9twe+Q0pP3KiWy7ZTYxRs_yN1bHEto6Mptqb3ub7vimgtw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/todo: Add section for GPU Scheduler
To: phasta@kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Acked-by: Dave Airlie <airlied@redhat.com>

On Thu, 27 Nov 2025 at 22:50, Philipp Stanner <phasta@mailbox.org> wrote:
>
> +Cc Matthew, Tvrtko, Christian
>
> On Fri, 2025-11-07 at 14:56 +0100, Philipp Stanner wrote:
> > Changes in v2:
> >   - Fix wrong list item index in patch 1.
> >
> > The GPU Scheduler has enough problems to be covered by the drm todo
> > list. Let's add an entry.
> >
> > This series is the succesor of [1].
> >
> > [1] https://lore.kernel.org/dri-devel/20251023143031.149496-2-phasta@kernel.org/
> >
> > Philipp Stanner (2):
> >   drm/todo: Add section with task for GPU scheduler
> >   drm/todo: Add entry for unlocked drm/sched rq readers
>
> Can someone give this series a review please?
>
> Thx,
> P.
