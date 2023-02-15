Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F26D69818C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 18:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC2210E285;
	Wed, 15 Feb 2023 17:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19E910EB1A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 17:04:11 +0000 (UTC)
Date: Wed, 15 Feb 2023 17:03:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1676480648; x=1676739848;
 bh=6zOKLS5DJ9Ik6QTW/giWUMW/sz7tzK6cTBKHurVu7gQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=fLnD5YHH/dRn7/II7/qshliFtS69bp8CTmnFXM9zq0Pmi+ZAk2WQA315v8hQMcZ+w
 GEYocCLOV7rlUrj9j1WRhjQHzg3AzakBgSbrl1k/Wd/NrWMYAmZoLsT/V8WdTJrjvs
 0s0U8aE78sk/5m6skRBxtQQWqLsdt5SJacL7GbWdn5Y/lSIMVGRRHcXJwq61zZHvpW
 wmcC+BjgbnlkM0CYQYvg+PlzD6cl9+CxOXmNWFZNGgqGWeAz/qbX9YFmQioY/Elrw4
 zVxyenRDkOoZDBUzady2osHWmr3npW8VeM5nFvsg84OdUFxaCAogJkI2FdMuFjU099
 m51iATehymSqA==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document expectations for GETFB2 handles
Message-ID: <ia5oa4sV74Cq0n0T5yDytOheked1Uuxb8CHh7L_Hdi51oIWuWIwOuqWsidJz3LrNdpoQqT7wNBgvSxVfKV-ZbbHLIC6U0aRrae9rVqUUpYg=@emersion.fr>
In-Reply-To: <20230215154123.3f9fefce@eldfell>
References: <20230215124152.101548-1-contact@emersion.fr>
 <20230215154123.3f9fefce@eldfell>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, February 15th, 2023 at 14:41, Pekka Paalanen <ppaalanen@gmail=
.com> wrote:

> I didn't know it was at all possible to have different GEM handles
> pointing to the same object. DMABUF import is guaranteed to return the
> existing GEM handle, right? Why is GETFB2 different? Why does it not
> have the same problem as what forced DMABUF import to return existing
> handles?

drm_gem_prime_fd_to_handle() explicitly checks whether the memory object
already has a GEM handle via drm_prime_lookup_buf_handle(). OTOH,
drm_mode_getfb() and drm_mode_getfb2_ioctl() just unconditionally call
drm_gem_handle_create().

Yes, it's a rather inconsistent detail. A detail which becomes very
important when ref'counting and trying not to leak GEM handles from
user-space. Fortunately GETFB/GETFB2 usage is pretty seldom.
