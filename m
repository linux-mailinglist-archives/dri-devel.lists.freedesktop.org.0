Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D9B65CA4C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 00:27:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1675A10E28C;
	Tue,  3 Jan 2023 23:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3011210E28C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 23:27:27 +0000 (UTC)
Date: Tue, 03 Jan 2023 23:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1672788445; x=1673047645;
 bh=1VNqUbphUuz2mqzkrIhHkTmFsJ42MuA5RLI7Ua0KvRY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Ug7SLLjWlvuq3xO+UzqdQSxlu/zH6IWiscDQ9hPJccK3Afs8RPZynnaDNIvoUTJ3g
 tK3sR1J5YPSnrX9UfwZnUhX1gi5wol5OZCub5BmyzN66QbdTeBX5GeoDHWI5dPKgxS
 18B1PvIdM2T2N/Q5+jOi1EL8fpokOtGgjgU2NHHLuhxXPHPrVvK9sbXAVyxQQVvkgd
 aQlbtzJ7KFCdnX7IoDocGdqvOOlqVh/5fJHHmVvoxDuDIzldNuzscbhtglm/J/qjDS
 OvweIyCftke8RaavuDqyyR0QsdvWk6P2G5//L1tVnkXdulTnalLDcQRYilrbTNNSjF
 oZqMQur4yRXkg==
To: Rob Clark <robdclark@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/gem: Check for valid formats
Message-ID: <p2BdIYJDkIwKx60q1N36ik-TrDdrLjmXTAEw3U3ROGNq_ReSeAIM6TkOOdrWJm2jZYP8JdWGSrJuIvmAQCtuXfUHBgbtC5WByK3OLMrIqbc=@emersion.fr>
In-Reply-To: <CAF6AEGt5g6+z3=LmTuP27pvbKYrL0YdLpDJCQmV=VHE6FeJ+Kg@mail.gmail.com>
References: <20230103125322.855089-1-mcanal@igalia.com>
 <CAF6AEGt5g6+z3=LmTuP27pvbKYrL0YdLpDJCQmV=VHE6FeJ+Kg@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, January 3rd, 2023 at 23:46, Rob Clark <robdclark@gmail.com> wro=
te:

> drive-by thought/concern, what are the odds that there is some wayland
> compositor out there that creates an fb for every window surface, even
> if it later decides to composite on the GPU because the display does
> not support the format? It seems like there is a non-zero chance of
> breaking userspace..

User-space is prepared for ADDFB2 to fail. Other drivers already reject
IOCTLs with FB parameters not supported for scanout.
