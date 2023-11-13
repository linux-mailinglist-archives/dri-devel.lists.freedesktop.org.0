Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B94437EA423
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 21:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F8910E408;
	Mon, 13 Nov 2023 20:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE69A10E15F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 08:34:54 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-507bd19eac8so5506110e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 00:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=juliahub.com; s=google; t=1699864493; x=1700469293;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nSmZOQp3NDYoYQRoOZeW69Lq5ePPtNZcj13zDtILkTQ=;
 b=bG5QN1Agk7EH6IkmOoC/9zPnDBX0ADnThrCCNiWzDJKih0mq80qKstiEKL/9A9RxME
 uzNgKGtXq7Am8p3J/4mBLdFSQPxF5z5h/UVPpwiTrmb5Tn86ENCYPalrPHag1xPKQtvV
 bMbuQB3x3mJ0CvUdSCVEwI1qSFqnIRkQ2csmTDiHcUkO4nwxnvwqWjg1Bsi+htoB811r
 4zVfMJv3Nl8DDDEdjJkRPjem+vwgctc9Re+oTDVAWxhc4TcdgIZ3iyzvATNHNM4MUMY2
 rnbQwJ6dI4eeUL7542TkBQXnm0BjoAO1po4kCT/HWz7unv/cWJk2b7C+iomVYxwE0n7p
 3P1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699864493; x=1700469293;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nSmZOQp3NDYoYQRoOZeW69Lq5ePPtNZcj13zDtILkTQ=;
 b=MJS+jau0+JwJtktqaZGXF8nP6boyhCCXROCA5bqSpi/a2eq2xUVuCndB1nZkWkxK63
 qvsE0QPpR8OvGo+jgjDAkNByVlpiRbNojwfZPhKl/9IU5Bawiho5QJWA3t10gmeL+rJP
 SuSKWKmP6yigaQP20gLajDUgeIPDjF3maqvX2FaiRWzgvw7Dxp7pZPCcjJoh4yHIePsF
 m2iMUEQv+N/0ymNJH9rOIxdRrrxC3Ik/Q+4x/+AnZS8C7WJFqquQJUJpTwXvl/5WDuz9
 XHvbKSkkZMR/pry9lqdJX26rd232SYRwuFprcLS06V9g0F0VKSNG46CLJHH0K/mv2+Cq
 Aypw==
X-Gm-Message-State: AOJu0Yw2DQEj0uLerd+1DsyQsx/fNKVC6nn/PB9jSAbfymR2v/xsCitj
 9gsXtVjVVsEk6lIkCwvsSx9kQ+ggz872ykGJrojwuQ==
X-Google-Smtp-Source: AGHT+IFgq88MRaTHmaB9J8NNC+BSZ2b2vgGjklcYDBiGTryencLrXHqw3v0z2CHQw9bfeLiZxgYwLYjzwO05rQCXNX8=
X-Received: by 2002:a05:6512:3904:b0:503:258f:fd1b with SMTP id
 a4-20020a056512390400b00503258ffd1bmr3749298lfu.18.1699864492911; Mon, 13 Nov
 2023 00:34:52 -0800 (PST)
MIME-Version: 1.0
From: Keno Fischer <keno@juliahub.com>
Date: Mon, 13 Nov 2023 03:34:16 -0500
Message-ID: <CABV8kRwx=92ntPW155ef=72z6gtS_NPQ9bRD=R1q_hx1p7wy=g@mail.gmail.com>
Subject: Incomplete stable drm/ast backport - screen freeze on boot
To: stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 13 Nov 2023 20:01:09 +0000
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
Cc: sashal@kernel.org, jfalempe@redhat.com, regressions@lists.linux.dev,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Greetings,

When connected to a remote machine via the BMC KVM functionality,
I am experiencing screen freezes on boot when using 6.5 stable,
but not master.

The BMC on the machine in question is an ASpeed AST2600.
A quick bisect shows the problematic commit to be 2fb9667
("drm/ast: report connection status on Display Port.").
This is commit f81bb0ac upstream.

I believe the problem is that the previous commit in the series
e329cb5 ("drm/ast: Add BMC virtual connector")
was not backported to the stable branch.
As a consequence, it appears that the more accurate DP state detection
is causing the kernel to believe that no display is connected,
even when the BMC's virtual display is in fact in use.
A cherry-pick of e329cb5 onto the stable branch resolves the issue.

Cheers,
Keno
