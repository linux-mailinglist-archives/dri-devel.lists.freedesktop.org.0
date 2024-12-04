Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850939E4A38
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 00:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC91910ED92;
	Wed,  4 Dec 2024 23:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PuwxZRtU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203A110ED91;
 Wed,  4 Dec 2024 23:58:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E17925C6E03;
 Wed,  4 Dec 2024 23:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB77C4CECD;
 Wed,  4 Dec 2024 23:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733356727;
 bh=SfP6s4VIWMTbvk2G5z6Y+FMQluZGJn5y1iWBpbzQLUc=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=PuwxZRtU1iEBR/hrQMvR1LQ1CsjdX/f/kpaeCbz5fjMfNxC+GosCTzHqeudqViaOp
 2ByBbMc0Xx7W6RQa45NHVJrOc08iwMl4EMELNSi73UKzocDCFK/cXH+k06ZX7fy+AZ
 Uos7beTN5nbUG3fLgt+9mc5/mrID4QO6b40hz6xhx+/bMQMX2uUsS4/iLjMC3Am76c
 +4Hi2+CPbMm0bju/NxMSwHWGmn6nF9BQ3EWk/NBi519OE+V43OAyoZ3LrofjbipWHf
 UGGDPVG5ToCDAMjPrZujCikcuAgIft5iQMchwh4MM5duEzj+UnwtisVNrEFEcPDjTI
 B7Ajhpsb+SmqA==
Date: Thu, 05 Dec 2024 09:58:44 +1000
From: Kees Cook <kees@kernel.org>
To: mailhol.vincent@wanadoo.fr,
 Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Laight <David.Laight@aculab.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
CC: linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_00/10=5D_compiler=2Eh=3A_refactor_=5F=5Fis?=
 =?US-ASCII?Q?=5Fconstexpr=28=29_into_is=5F?=
 =?US-ASCII?Q?const=7B=2C=5Ftrue=2C=5Ffalse=7D=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
Message-ID: <FBEB24FF-5885-4938-8D1C-9B7BA9071FB9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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



On December 3, 2024 3:33:22 AM GMT+10:00, Vincent Mailhol via B4 Relay <de=
vnull+mailhol=2Evincent=2Ewanadoo=2Efr@kernel=2Eorg> wrote:
>This series is the spiritual successor of [1] which introduced
>const_true()=2E In [1], following a comment from David Laight, Linus
>came with a suggestion to simplify __is_constexpr() and its derived
>macros using a _Generic() selection=2E Because of the total change of
>scope, I am starting a new series=2E
>
>The goal is to introduce a set of three macros:
>
>  - is_const(): a one to one replacement of __is_constexpr() in term
>    of features but written in a less hacky way thanks to _Generic()=2E
>
>  - is_const_true(): tells whether or not the argument is a true
>    integer constant expression=2E
>
>  - is_const_false(): tells whether or not the argument is a false
>    integer constant expression=2E

But why make this change? Is something broken? Does it make builds faster?

> 7 files changed, 97 insertions(+), 84 deletions(-)

It makes the code larger too=2E I don't see what the benefit is, and given=
 how much time has been spent making sure the existing stuff works correctl=
y, I feel like we should have a clear benefit to replacing it all=2E

-Kees

--=20
Kees Cook
