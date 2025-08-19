Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F678B2C9F1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 18:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0E710E207;
	Tue, 19 Aug 2025 16:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="ZIi7HtUf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF75510E207;
 Tue, 19 Aug 2025 16:45:07 +0000 (UTC)
Received: from localhost (unknown [10.10.165.20])
 by mail.ispras.ru (Postfix) with ESMTPSA id 6A5694028386;
 Tue, 19 Aug 2025 16:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 6A5694028386
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1755621904;
 bh=1337loEO8MUNn10D9XiV0gPwVxSGBJFo6tLNowKy9l0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZIi7HtUf2AYTzpnLPyFJ0jL/5fXHjBwCmp7PTX2ACycfnWVPVQWcmjClstpECC9hf
 a9fVAeAkwY0YTowUxvIsZFgb4VWCpHymTyl+uBa4yfsTnCIxT94YNREH1VnH/qyoLi
 kSAcg7SVlF0FphB+EWojZU+1ym48Api4UaMw+//g=
Date: Tue, 19 Aug 2025 19:45:04 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 Melissa Wen <mwen@igalia.com>, "Wentland, Harry" <Harry.Wentland@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hansg@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/amd/display: fix leak of probed modes
Message-ID: <bbur73jxf7kubbtgdieflkjw5q4rxw5w4ztkgrozq3i4mrdjxh@r352gbxsso3s>
References: <20250817094346.15740-1-pchelkin@ispras.ru>
 <79a7f64c-4afa-441d-b1be-bab489174c7e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <79a7f64c-4afa-441d-b1be-bab489174c7e@amd.com>
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

On Mon, 18. Aug 21:17, Limonciello, Mario wrote:
> On 8/17/25 4:43 AM, Fedor Pchelkin wrote:
> > For what the patch does there exists a drm_mode_remove() helper but it's
> > static at drivers/gpu/drm/drm_connector.c and requires to be exported
> > first. This probably looks like a subject for an independent for-next
> > patch, if needed.
> 
> So you're saying this change will take two iterations of patches to ping 
> pong the code?
> 
> Why not just send this as a two patch series?
> 
> 1) Export the symbol drm_mode_remove()
> 2) This patch, but use the symbol.
> 

Initially I wasn't sure if the exporting patch was worth moving the code
around and in the end decided to make the current patch with a minimum of
prerequisites.

But giving this a second glance, I see exporting the symbol would be
technically better. I'll send out v2.

Thanks!
