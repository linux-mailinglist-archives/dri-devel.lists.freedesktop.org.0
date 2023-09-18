Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 191887A5A52
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 09:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE24C10E355;
	Tue, 19 Sep 2023 06:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-224.mta1.migadu.com (out-224.mta1.migadu.com
 [IPv6:2001:41d0:203:375::e0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD67410E349
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 21:41:12 +0000 (UTC)
Date: Tue, 19 Sep 2023 07:40:58 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1695073271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OKF5pL6j1FaLIvd2+LW2+OTS2g0SVXD9k2NzY4oj/+o=;
 b=eAJF0wJ6X+530eG3LxNkM63PN7qnRhh/PzY1ZTLxsu03jkiohE+49ByAC21ZDo4tPqDmtD
 Utn+P2HHAWUCvdC82d1DJZj0HWLlFu7mjzqztVYJuCuS5sYcUXfbGos0zKvYfKnhR7Z5qA
 qsZyeZ553i9kSJquTAxHnKvwFOqfq7ojHi4OXupJ5Ksrc+skSooeb1y5IKQ9gRlRxHPlBd
 Gq+2ryiO6nAieBGVdorZt/bQxqNXWh2iM5PgGV7fJTiz2Y6F3ZwH7oPw7iAwLBvrwWlW9+
 mD/6OBOASGm4iSvTSmfKC45Yy3MNMGO/0KHhvpuKeDWRO5DGQMM1wyjRIxgOyA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC PATCH v2 3/9] drm/panel: nv3052c: Sleep for 150ms after reset
Message-ID: <ZQjD6gCEo62gMBX2@titan>
References: <20230918125853.2249187-1-contact@jookia.org>
 <20230918125853.2249187-4-contact@jookia.org>
 <7fc1ca68-ca7c-59b2-0b70-27bc34d83cee@quicinc.com>
 <ZQi4fFZ0VnsUIiXO@titan>
 <4d2079d66249a7052acded0abf30169a4e95d151.camel@crapouillou.net>
 <ZQi8Z45VCqr-GqN6@titan>
 <0d6b0159552b10548391a9bd88449d12c13fdcd6.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d6b0159552b10548391a9bd88449d12c13fdcd6.camel@crapouillou.net>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 19 Sep 2023 06:59:32 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>,
 Rob Herring <robh+dt@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 18, 2023 at 11:34:51PM +0200, Paul Cercueil wrote:
> The driver is guaranteed to always reset the panel in sleep-in mode -
> as long as the panel was off when the driver started.
> 
> What I'd suggest if you really need to support a case where the panel
> was enabled by the bootloader, is to read the 0x0a register after
> enabling the regulator to read the mode, and sleep 120ms if it was in
> sleep-out mode.
> 
> But that's only if it's a case that you can test with. I won't accept a
> patch that makes sense on the surface if it addresses a corner case
> that nobody ever tested for.
> 
> For what I know, this patch just adds a huge delay to panel boot-up for
> all existing users for no valid reason.
>
> 
> Cheers,
> -Paul

Thank you very much for this feedback. I am more than happy to throw these
sleep patches in the trash and come back later with a proper solution when
I have an actual hardware setup and use case to test on.

John.
