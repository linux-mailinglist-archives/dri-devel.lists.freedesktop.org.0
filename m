Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0850F842227
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 12:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6217A112F20;
	Tue, 30 Jan 2024 11:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F3A112C52
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 11:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1706612589; x=1706871789;
 bh=cYhntMSvc2MQ9UlZnJhG8eD51SepVoA/G5xtLrHgJgY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Va4iGz6XebcW70npMHgNmN/9mIutcs1itAXpO5jphdw1h9KXqlKwWppoZlcJEo0PF
 cujXSLc0uZo3e5VGNWXk56QhAC/l9mLssoxotvoj0Uvm0Ffg3KmxE0moUXUmS1h6Vw
 3yAScwDcQhk+/roxlzkWWsrR83V3ENrV1dSvUD26i9QY+nuUhmelXP+t3cEFrjfTzL
 9ur0/SbL0WkuJWafnXhYMMmrdQ1foUUAN1nSU9DWqUSx17AOGztEPJIYn3VWTC4le5
 9NT83Y8XSw0Afzmt17cZOvNiDNVY+/REp1+Ao/PvAl+HoPxCyzKDZqZqyDVTfDEGnX
 95lZb9ARmrJbQ==
Date: Tue, 30 Jan 2024 11:02:13 +0000
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 3/3] drm/amdgpu: Implement check_async_props for planes
Message-ID: <T6R8csfFYwdxGqaYt8syjZ6qa143x9HHPS2vS57_sk-NKMY9hJhP5xsHyIFlmhjzkZ9S7gR92E15Zz6DfEBN7qhdF2-fS5x88VeCExqReNE=@emersion.fr>
In-Reply-To: <ZbjVyI_AnTBHACT8@phenom.ffwll.local>
References: <20240128212515.630345-1-andrealmeid@igalia.com>
 <20240128212515.630345-4-andrealmeid@igalia.com>
 <ZbjVyI_AnTBHACT8@phenom.ffwll.local>
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
Cc: =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?utf-8?Q?=27Marek_Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, Joshua Ashton <joshua@froggi.es>,
 Dave Airlie <airlied@gmail.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Do we really need this much flexibility, especially for the first driver
> adding the first few additional properties?

AFAIU we'd like to allow more props as well, e.g. cursor position=E2=80=
=A6
