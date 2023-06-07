Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5816E725AD8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EAB010E4A2;
	Wed,  7 Jun 2023 09:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429FA10E4A2
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:42:13 +0000 (UTC)
Date: Wed, 07 Jun 2023 09:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1686130930; x=1686390130;
 bh=x67qiGvM7KF/tVDJArPKY6A/o4dTYbNV/diGB4MoJZc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=n9FCFcjDZ7g+9sUCei3+ZvtWnyt067z3yEXebQyeXqzSWd9hQn6oUMYEHceS93AK0
 1ew03GwyLTCSHBxDcRnOEY+1Xo89r5QSuv0Kvkk/tQlnV88B6WISxlnMNN+kLBIQqk
 GSd/gSVac8Js+4VQ8MAq+02UgUZnAqSU2A4jruYcBj8oe9M/gVe7u2M/etoViDVWc7
 XEmCV+1xRuNsbVkCEVERbwSaVPnoYJP05u6rWsLkCDrYhhQOEM5MakmPSeSemA7Yw/
 ZtDd9xWYvp8IqCD7tv1zPLY71mqUjg75yWk2a8jbUNh7sgAKeJ+fto8p1grEDrvZaj
 qWcRsESgK2BqQ==
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v5 06/13] drm/connector: Allow drivers to pass list of
 supported colorspaces
Message-ID: <TKjxspHl8aKZqasklhnRL_RQzlhqrRD35JBIOw2HEBPECtg6OrM4wY6-wF1GStScWVtiur3N76vNTgr2cr1hWgxkVIW_o-WIpiIWN9IvH1s=@emersion.fr>
In-Reply-To: <20230606202607.122914-7-harry.wentland@amd.com>
References: <20230606202607.122914-1-harry.wentland@amd.com>
 <20230606202607.122914-7-harry.wentland@amd.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, June 6th, 2023 at 22:26, Harry Wentland <harry.wentland@amd.com=
> wrote:

> -int drm_mode_create_hdmi_colorspace_property(struct drm_connector *conne=
ctor)
> +int drm_mode_create_hdmi_colorspace_property(struct drm_connector *conne=
ctor,
> +=09=09=09=09=09     u32 supported_colorspaces)
>  {
> -=09return drm_mode_create_colorspace_property(connector, hdmi_colorspace=
s);
> +=09u32 colorspaces =3D supported_colorspaces & hdmi_colorspaces;

This creates a potentially weird situation where the driver passes a
non-0 supported_colorspaces, but the intersection with hdmi_colorspaces
ends up being empty, and all colorspaces end up being advertised.
