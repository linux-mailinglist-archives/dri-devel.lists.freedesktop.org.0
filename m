Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D10C918067
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 14:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D8310E889;
	Wed, 26 Jun 2024 12:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="c68jgGf3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FAC10E87F;
 Wed, 26 Jun 2024 12:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1719403226; x=1720008026; i=markus.elfring@web.de;
 bh=IQxnmOTy/nTJbMuTK9u/hbf4ySukoqQ03dXl38g0l4o=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=c68jgGf3jmL4lYVK64HR+FKFqnwWPRyThQ8eYdVdMjSpy8e0dr38Q7SqKY0jH69k
 PDE2upMUoWO6YmzKsxhOb1zCFSZZa1VbplZu8/KqRyBduo2O/ZTUTSmtlYsXqrgEs
 HN/vDwstWEHIb1B+2v7YgplgC7zB12e1xA7f5L0e3WMI/POFZMdtXVqlF3DFynXtP
 EAgZR9APZew9sVdEWkYi6YJ5IgvZ8hRB3GmMDB5lYeepQ/7ynzGIWqYjTMAwxSTHh
 Qdl4yPDSjBBApBG2dHGngBHQ/13XdLTsgDfj7/y981sRKvMJnPxnM4ahIHwHsH1qA
 iNvQlD10v0gs2/bPIQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MyvB8-1saPQu0zis-016ckv; Wed, 26
 Jun 2024 14:00:26 +0200
Message-ID: <e241961e-d065-4fff-a5dd-4c1570ac538f@web.de>
Date: Wed, 26 Jun 2024 14:00:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ma Ke <make24@iscas.ac.cn>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240626025640.2779322-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] drm/radeon: fix null pointer dereference in
 radeon_add_common_modes
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240626025640.2779322-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6GshtGLYBX5UFr3ooZaB3TwOYGhS7UXL9dmwVi9q3J1zg09LBe+
 XPIYwfSQUVl/hlaExdQ7j6NJ63Otr/S3KN74iqVW8YORp8bsifm5EuY0+NF1x/ZD9wtzC3t
 6l8pmstN/gLudXEjWpE5EH7UzvThjgTnjbJRdhLRx1SSy3wZiylhYKyPzSYB4wxPZMdh9Qb
 h0mrP1gT019Nzi8yXhw4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4+b9D9ng5kU=;m8gR0bZ0O4ljQYg7ynaCHOuEqdS
 W2hJCu4zFCU3kihLaGX6Mcisqd7CHkm4jO+wUhKlKgnJSbrV5ag5LFeCi1jJHaOr2LVm7/S6W
 zUKo4PCTBBbfdTF7cLAsvO8low9U1DrEp6bObwi7zyrQYnyEkbdcHGTx6vl81YeVDxMHnZeaL
 X3Lwg117HiGbaxR86hpRbI22TZ2wvI7f3sPsPsdWK1E3wXnL70x0bRThw56Wu+1nRdfIg/XwA
 jlg3hS+hdNXQEVUAKJa9BIy4iayHE8o5BTNr4VhETPqimVG/fHW+Mf+6j+t8MJPQ4yCIKumN5
 JVZKQ3D5apfIkeQBEjZWGaJ3hSjf3CXz5hWTj0pkwSsK2865h8nQEm3GzHNqsjd1H8CJ3OXiz
 CJYctOOnUXQ5h5ZKPjtnW2eO0sDWveHyLNm0GJayRCref7eaH8x3Za/MYk6NGcFEZktT6fuxJ
 WUF8tdAjvC+PPaKbcznrhy/CP95rVAmZYPVlocNEBUFKVonUtxvPek6gtuEOhjOK/1yofV7UX
 0dvDpGAmKROwzn4vGGR3TvLXltJjW4+vwfdeIPJgQy/XBxAVbSwfz5B4ItN+C7EiruBCcY2D4
 RVimx4lGVXWr0L7zsMs9llpsnepQe0ZpH2L1CDkIECy6ZXUxZCnnsihSSdBY484y4XLn7uJL0
 k7JsrXdPS1bxd7kFwxWdtqgGlKKCjkIrcR72l1JD/dvY3wYuSngduNMpzF0P94/YadzSIJqXv
 RxIMDKlMO5qNingLy+gGdxVoYGYWJ3OUJeJEaWKkeP6CNvcnt48u0V6Vt+ctddQE0w7LOAgFP
 eWN4UHkimzCltdxZT+nMcgTbK/45eJ2RWlBO+MIM4CXb8=
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

> In radeon_add_common_modes(), the return value of drm_cvt_mode() is
> assigned to mode, which will lead to a possible NULL pointer dereference
> on failure of drm_cvt_mode(). Add a check to avoid npd.

1. Can a wording approach (like the following) be a better change descript=
ion?

   A null pointer is stored in the local variable =E2=80=9Cmode=E2=80=9D a=
fter a call
   of the function =E2=80=9Cdrm_cvt_mode=E2=80=9D failed. This pointer was=
 passed to
   a subsequent call of the function =E2=80=9Cdrm_mode_probed_add=E2=80=9D=
 where an undesirable
   dereference will be performed then.
   Thus add a corresponding return value check.


2. Would you like to add any tags (like =E2=80=9CFixes=E2=80=9D and =E2=80=
=9CCc=E2=80=9D) accordingly?


3. How do you think about to append parentheses to the function name
   in the summary phrase?


Regards,
Markus
