Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF82709FFB
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 21:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2D310E581;
	Fri, 19 May 2023 19:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601F010E584
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 19:36:59 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-561abf855afso42286957b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 12:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684525018; x=1687117018;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=lltC1PgnqCtsXAHgdMoCNdxe+omg+7CA2KzrLfAXLTA=;
 b=CireAviPmLkSmdipBP++kE9/Z/o7A1zNeQMMSTF1gKfHO/AEAjTD/rPOLqqF4atyld
 Pumh00GD78+7qgLFEV37n9uuMr8mGc1R6N7SR7SyF9zPRvcZ1hUvWgFWtjNqjN7T/TAP
 FXQKWz6s32Rcbdvt3gNQz8NVamXZ9cWuApLKMiPoCyjiICn/Gv9rQvJthueqly+OEMEl
 8+jkOA/GjpSx0MvFhq1QtIfoFDPlN7/zsnw85REjpTgZm7uC13dGdh2SljFNmQB+Jhya
 LlaKteGjngY/5nHdSrjNsrZsTrfENyhUhEOGzSatoWD7+AVvBDkjB36yigGuQoBR7hkj
 Pzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684525018; x=1687117018;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lltC1PgnqCtsXAHgdMoCNdxe+omg+7CA2KzrLfAXLTA=;
 b=Q0y2qYAR496jmVTnjvc8dJl62JXMwCfdCtBgH2NLtiR4O49qLrXzGNuO8bhxyI1q/O
 c7/B29s5wIMITi73v62KY+IGSsRXoqn/g3x7FeXiF8ta8ny8roeut1qcsFyZC4mMCpMy
 BAR2vfKDUdpA8JroL2p/YH8OSDs1G9Df7/MOXX4iwvi86Er5SRq5ZDoIEbyT42hp5l1Y
 ztYUiVB6CKECH3VssZgMamRUYfxTjBmWYPNbjM+ohQxbugoRbTt/MLM2ylqIUkTPglhN
 rgNdgX1blaFUEMLKMFEgcXKHCI8QCj1fa113E/8p9XliGip5XXK7/AVKgb2OR7MMBWtd
 RdQQ==
X-Gm-Message-State: AC+VfDzol7xMoNBUas+PnOI6RqUnsAxX9drIUxjoKW/tkAtpPU8xjNuO
 pWPAiqyUDBGREbfkxPbErobldhEqFyQrSQ==
X-Google-Smtp-Source: ACHHUZ4VOY8zSr3wK+p9w7ugyP1BBrvXNv1iLaCovvJCYG1Tew9sU3R7JGdy1cwVhKhYS+y1C4CufLm5yLkT0Q==
X-Received: from farnsworth5.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:3131])
 (user=prahladk job=sendgmr) by 2002:a81:a9c9:0:b0:561:c10b:6ebb with SMTP id
 g192-20020a81a9c9000000b00561c10b6ebbmr1869063ywh.1.1684525017968; Fri, 19
 May 2023 12:36:57 -0700 (PDT)
Date: Fri, 19 May 2023 19:36:56 +0000
In-Reply-To: <20230428081457.857009-5-tvrtko.ursulin@linux.intel.com>
Mime-Version: 1.0
References: <20230428081457.857009-5-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
Message-ID: <20230519193656.1929553-1-prahladk@google.com>
Subject: [RFC 4/4] drm/i915: Expose RPS thresholds in sysfs
From: Prahlad Kilambi <prahladk@google.com>
To: tvrtko.ursulin@linux.intel.com
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 tvrtko.ursulin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> One question is are we able to find a "one size fits all" values.

> However regardless of that, given we already expose frequency controls in=
 sysfs
> with the same reasoning of allowing system owners explicit control if so =
wanted,
> I think exposing the thresholds can be equally justified.

Exposing these RPS thresholds via sysfs allows for dynamic tuning of these =
values at runtime. Common scenarios where we can benefit from variable freq=
uency ramping include plugged in vs battery where differing thresholds allo=
w to weight more for performance vs power. Data from testing on ChromeOS Ge=
n12 platforms where GuC isn't enabled indicates gains > 10% across several =
games. See https://gitlab.freedesktop.org/drm/intel/-/issues/8389#note_1890=
428 for details.

