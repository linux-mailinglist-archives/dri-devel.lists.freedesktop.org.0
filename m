Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D3F6F1B4D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 17:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFD310E3D4;
	Fri, 28 Apr 2023 15:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C186A10E3EC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 15:18:29 +0000 (UTC)
Date: Fri, 28 Apr 2023 15:18:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1682695106; x=1682954306;
 bh=LrbmbN5yEoHXA+r5EngZYYH+gFixmZ2epfSPwffF4/E=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=TnTqKh6Z9pP7ZgYdi9zlYBR/TN2jZ7gmINOH2KZz22m83Yvx6kT/fOePwmmhU2myS
 lrgLJM1YA/ioym1o29xDaQKJ7GS6oV9zP2OEPUnCJyTF63/ekvRzhrGYiB5I2ddh1H
 A8S43S8h2u5+Xgq8U0HGkTDnjhkoGmsejGGNKs8TPzmLqcxU1ez9mnabGNkWOI0G5E
 eQqLGhjzMgBwAXmNBrUoQyerJ5a7uZE30it67nAqGbg/xutyevORsVCQn4Yk/2Obxf
 IojuHgwSgHikPsiOr2LcchWEvBmUNPaNodGGC3FgSHCGr4GlOCShzWpbEg6R0Yzj7c
 NcRsK3LXt69DA==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/3] drm: add define for Static_Metadata_Descriptor_ID
Message-ID: <L_YfgCIGl4p-4QPTienpRDDZoDvWUIBve-Abz5UOVPxHL1WZDKYnn2_lgIpMPnds8va9-fVajLGXgOYyVeAubMDPXEcME9ms0lLCt7W1rtE=@emersion.fr>
In-Reply-To: <20230428161218.338591a4@eldfell>
References: <20230428100115.9802-1-contact@emersion.fr>
 <20230428100115.9802-2-contact@emersion.fr> <20230428161218.338591a4@eldfell>
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
Cc: Joshua Ashton <joshua@froggi.es>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, April 28th, 2023 at 15:12, Pekka Paalanen <ppaalanen@gmail.com> =
wrote:

> the subject says "define" but this is an enum. No big deal, but the
> thing I started wondering is how I am going to use these in userspace.
> There is no #define I could test to know if I need to provide a
> fallback definition. What's the migration plan for userspace to start
> using this and patch 3?
>=20
> Nevertheless, these are good to have.
>=20
> Oh, is it a libdrm version check I should use?

Yeah, that's one way to do it. Another way would be cc.has_header_symbol().
The same kind of situation happened when struct hdr_output_metadata was
introduced.

I chose to use enums because they better group the different values and
document the intent. If I had gone for #defines, the docs would need to
either list each individual #define or refer to "DRM_HDR_EOTF_*" which
doesn't get linkified.
