Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A49CB34851
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 19:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182D510E511;
	Mon, 25 Aug 2025 17:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="Zx+XKe1L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE46710E512
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:13:00 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-76e7af160f1so3194059b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 10:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1756141980; x=1756746780;
 darn=lists.freedesktop.org; 
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5JIy/ikd0BLnHtzJtlevyIk9/jwbmefHUhOitr8lfoE=;
 b=Zx+XKe1LjkKa2a8sEkkx6BFszjmzQ8+to/IwP64PvOT8W6ISkJF7mAKvPdWUmmssbZ
 XPLM9vV1wAKUDHjEQ9/B04Vq9o+jkMq+XgVvXPZET/wpY/G9kLyvVU+4FjUiap9L62MZ
 IqcdsMhNHTEs5A9fgP1VW0M5PDX9Vris+166WBFdXs6BKqfVNlRCJ/YKBxYYCntHkVLj
 GMWQ9uckspCSueV34ACy2wRoVeVFgNJD3jMqf4AwdbH7eZFaX/3MwyftKHDlgcKbSdFL
 lvmXQ2ZgoR3ZbHYKHCKdU5aTevpkNaezsXSJTmPpBfXMU0q8Fg+bXTOzPPD5Lc4VXATx
 0bzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756141980; x=1756746780;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5JIy/ikd0BLnHtzJtlevyIk9/jwbmefHUhOitr8lfoE=;
 b=igGu6maWtm4+obsUHGbz3qA14rJyVLYMz56+mug132yPkY6R5c823pm1+PCn8CDNqM
 A/CNGQl+QaoPm+XX4cn/CpnHm51Hrk7uH06Ifw5251l2Yqup3zProzBO972Ek+regzYG
 /4qDRVSiIYrpjKVaQKwBTnf55oXXcJxXpHXTwwG/k+cExlvjlZDEZ5/EkNQ0qYTHPgDX
 Y/7MekWvFvRotx4s/9kNb8I4HDX1GZljmdpGwtB2R8KXZCXlxuBrq454m2AiaFw5Y9eL
 YjtYhT4xP9FWN3f/Wio+/QqRpiwv5ur37R60V4XcYOKtWbIhT7cbAwRM7S3dEZBaOR9K
 458A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/q5JZ7toHkvq3ZyScUX6cQKqmzIWXEzWNgZYXplwHIay1gpIdeuXSoj/1nXkyGqlgEUwjZ/yqfNM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznE19LWO9GBcOkiFGeLXMjcaR5/2vrN2wRb5E/gcrhpsPgeMcf
 ptA+gTejl2JsGWemWPfoWq0hP7wSnyqBRE0/T7meXaUBJ2I1iib2Rr5tgTSNu41HGxY=
X-Gm-Gg: ASbGncvddTq3pHxdbaFMmsr8Wf6Knh+c7dCX5fr75IZocS3Y2NmWk8wtFsvJ3A3DtNw
 qxTZz7VHTbBpuGKGUjvTPQDb9TLaTCbaOIzVz6L3ubuPd3KwaRGp58nNfZSd09iBICsuDrndhNp
 gwOeXIg+OcEtxlRt6yHvvew25O8YJDWR71wLHPUo8gZVLM6RFQgcV/Ld7Ya1ZaiDIdQuUkhMWfN
 BJDj/Xmxzw5hzl2f5iaSFFWgaqZAaBi6icmLcx7txmyJ7yZUXhsIclB4E6KT7RAv2PzxOIG6w7Y
 zGiEeyF2Bi4pMep8lralEQBBqitRI58RO6lnGRpqT+/6eOhU32jjhP86guVwwUhYXtnNiY48sTU
 3CAj/rqA57SA2iTJzUFo=
X-Google-Smtp-Source: AGHT+IGeInbCP5zEJV/VOWe6y9YTaEHSH8v+IWrNO4j77bL4LJuoltCMmSx3sMyg2xrRhCTkabtopA==
X-Received: by 2002:a05:6a20:a110:b0:240:763:797e with SMTP id
 adf61e73a8af0-24340b8a6a0mr18926571637.25.1756141980050; 
 Mon, 25 Aug 2025 10:13:00 -0700 (PDT)
Received: from localhost ([64.71.154.6]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-324f3c94c05sm5317223a91.3.2025.08.25.10.12.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 10:12:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 Aug 2025 11:12:57 -0600
Message-Id: <DCBODJ411OLN.1IGN033564525@brighamcampbell.com>
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jessica.zhang@oss.qualcomm.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Douglas Anderson"
 <dianders@chromium.org>, "Diogo Ivo" <diogo.ivo@tecnico.ulisboa.pt>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH next] drm/panel: jdi-lpm102a188a: Fix error code in
 jdi_panel_prepare()
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <aKcRfq8xBrFmhqmO@stanley.mountain>
 <DCAVWVJ990VS.255346CDNF1GK@brighamcampbell.com>
 <aKv5tkJghj6DZQIB@stanley.mountain>
In-Reply-To: <aKv5tkJghj6DZQIB@stanley.mountain>
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

On Sun Aug 24, 2025 at 11:50 PM MDT, Dan Carpenter wrote:
> On Sun, Aug 24, 2025 at 12:54:41PM -0600, Brigham Campbell wrote:
>> Good catch, Dan! Thank you for the patch. I'll try to be mindful of this
>> kind of logic error in the future. Please let me know if you have other
>> suggestions.
>
> Heh.  This is just static checker stuff.  https://github.com/error27/smat=
ch
> Humans are expected to have mechanical attention to detail at the
> same level as a computer.  I just try to write the commit message out to
> prove that I've looked at the code as well.

Good to know! I'll consider integrating smatch and other static checking
into my preflight checks.

By the way, I'm interested in contributing more to drm as a hobbyist.
I've been working on todo items in drm documentation and I plan to
continue doing that. If there's anything you'd like help with or you
know of any work to be done which I may not find in the todo list,
please let me know. I can be contacted here on the public mailing lists,
via direct email, or via #dri-devel on OFTC (my nick is xeyler).

Cheers,
Brigham
