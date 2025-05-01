Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D585AA5DBD
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 13:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F55A10E243;
	Thu,  1 May 2025 11:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="KjV1d61z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch
 [79.135.106.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB8010E243
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 11:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1746098718; x=1746357918;
 bh=fSW+ofvXJ5e086b3wOVC/Wu9GsgxQurrL69rlzicz7c=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=KjV1d61zYT9de6edezTlDpUPiVX3kdIvy+FTKdnBDM6w2QE/F+v+RLyEvyNY+iBsS
 hMvctYSwgUbrIdBseKCGpF7UUWu9OKdaFYdIDMemBQ60PsZYMq92XG1YF9wa2/TjOp
 zlJJsEzemOkQwYkh3Z+etpKXGqNWRMZycOgPwQoQ31CQGa6tVZCM+3ppQ7SecVh+WI
 c7Uh4HZt+pP35fxGEruWeGR9asI6wg+zcHwZewjtwlUQDIJfIfAt3uZhH2/uHDjr7c
 cp4moWyY+KYjf3ff0e0o1iuccJ7LYspFen9eb0uRjcwYcSO/g3WZZ+cWPEvSKYM3wv
 68c8agTnOVG5A==
Date: Thu, 01 May 2025 11:25:11 +0000
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2] drm/doc: document front-buffer rendering
Message-ID: <7fLdC-okfQ3e09zwXInhSeD2aOqmwMIfjKXkBIfKE86bP_Tw3eGwhZj578-18aMD50dM1nv9MtQP-HEIqp_yDwm68RfFng6bNrvR7UTD47k=@emersion.fr>
In-Reply-To: <Z_0Nl9Z8GFoiaxTs@intel.com>
References: <20250414085652.43904-1-contact@emersion.fr>
 <Z_0Nl9Z8GFoiaxTs@intel.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 77fbe8a5d1951debbabee5abfb10084c0f0281b7
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ah, sorry, I missed this message.

On Monday, April 14th, 2025 at 15:28, Ville Syrj=C3=A4l=C3=A4 <ville.syrjal=
a@linux.intel.com> wrote:

> Should probably add a caveat that this needs to be a sync commit/flip.
> The way the async flip was specified for atomic explicitly requires the
> driver to ignore the plane when the fb doesn't change.

I don't believe so. Async flip should work fine with same FB. The kernel
will only ignore other props if they match their previous value.

> Also use dirtyfb instead if you don't want to get throttled to the
> vrefresh rate. Tthough I think with some drivers you might get
> throttled even with dirtyfb...

Like Simona, I'm really not a fan of mixing atomic and non-atomic. It's
caused issues in the past, e.g. ChromeOS forcing amdgpu to reject atomic
commits which could cause future cursor IOCTLs to fail.
