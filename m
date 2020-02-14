Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4804A15D37D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637E86EB4E;
	Fri, 14 Feb 2020 08:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4B96E45F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 07:35:27 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id g12so7298950ild.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 23:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I1eG2NiwnMHcD+8ZEBk/TQZkr1ocwevoK5Q1stsGPh0=;
 b=UZ6fDAw4oN8KlRZPMnBhJd0Ev8dZAqA7G1U4REXYuJiWgp0PEusoKpzvbadHqnAz/M
 KuGdLZbhYZ1znnKIXK1Dvcdh+8gFSkQq1PS3X2WfvZ/h91VHULyySwO0TTPA/H4LgRxR
 KiY61A4PCh63xBcYTtdEEow9lR9sIb0KkJ1E4V7ei5bxq4/XqhxVv1ZftYgq8/Zgb/rt
 ZH/X8w3p0MKGOrspJqJm4+U+8EBBU7ghgaJkhkORbSfzHDTqMxihRLzWwt2y4YrjlvDk
 l9myA1r5rLq84wDBjMMRPmYwWrpLwKsCG5Udq8zQeW1I5ivieU3AxYA805kVSpDOu3S/
 Yfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I1eG2NiwnMHcD+8ZEBk/TQZkr1ocwevoK5Q1stsGPh0=;
 b=AvQwSaF/64FfKZXgV35Nyiv2cB3kQGniagypKjE2k+kPYCqG8Af8mhZ+U8VV+vOjVf
 zRwlDFQBArnc+PUbbtsukdc7dtFOisB67+6F3iyINfencJ69XTAKRshfPR2Dq2+Vziab
 eLYwZOo47sXYo76qmISI0OMOnuETBOJywkKsu3B5WKSHBjTdcNaZ0oSrLhbr0dUKQyi7
 0B/0JqGbaC/HuD9Rrr+E6V+rOxZ8hjjTNn3r6eyrmp2HsfHrvTcI65jUNQvPfkfLQFGT
 bcjwGtiIMquQuvmMdlV8c+0Xgb0c/VkdQVlf0FhrkGhwUpd5U8K/ngCPv4GcZ6scFHen
 3D1g==
X-Gm-Message-State: APjAAAXim1Kslb1GLVlcuygv9dPpLBFmzUM3uuJgypceIjL1lhBohEvA
 NelX2UtgYDbAOwjepPaYEMfGJyyo3viygZYQtQ6apA==
X-Google-Smtp-Source: APXvYqzd5x9vUof79ss9P8ZSwc9sQuJX+BQLK7R4MtTtWZfQ+G1G0z3XtZitNmw0tqejxBn+XcigB+3jeNXBx5X/tnM=
X-Received: by 2002:a92:9c52:: with SMTP id h79mr1618052ili.213.1581665726341; 
 Thu, 13 Feb 2020 23:35:26 -0800 (PST)
MIME-Version: 1.0
References: <20200213153226.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
 <1581664042.20487.4.camel@mtksdaap41>
In-Reply-To: <1581664042.20487.4.camel@mtksdaap41>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 14 Feb 2020 15:35:15 +0800
Message-ID: <CA+Px+wW0BWz0-8L_UXJ-OYbwG6W9vmCWRr7kevpk0yokp+NKKg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: fix race condition for HDMI jack status
 reporting
To: CK Hu <ck.hu@mediatek.com>
X-Mailman-Approved-At: Fri, 14 Feb 2020 08:07:58 +0000
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
Cc: ALSA development <alsa-devel@alsa-project.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Dylan Reid <dgreid@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 3:07 PM CK Hu <ck.hu@mediatek.com> wrote:
> I think sound driver could be removed for some reason, and fn should be
> set to NULL before sound driver removed. In this case, codec_dev != NULL
> and fn == NULL.

No..if you see sound/soc/codecs/hdmi-codec.c, plugged_cb is statically
allocated.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
