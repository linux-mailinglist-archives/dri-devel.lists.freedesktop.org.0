Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B9FA1B1DA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 09:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EEE10E2B8;
	Fri, 24 Jan 2025 08:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=erik.faye-lund@collabora.com header.b="fGQ5Fifq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF4B10E2B8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 08:42:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1737708154; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fOD57Q5pdWgAIVzQAkGV/GPTc7DmdQf6Is4QXC6Nyb3c6TdGEEHh6ettD2f6aTL8StF/11IDfcamlUmcLr6WXUCOBwt25gBayT9rOm+kCMMyhHqD5aRYoV31szrKpNYj437NfdLYg6kg+m6GR0PA3MWHvPKLDI8OKGv4jGQrvlY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1737708154;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=977jEw+PSgKIyacemkv3jXeTJb9+EwX9fkvMDO5qEkM=; 
 b=VJaUUvQtsVztp1dZV2ntrYk7yrn1kkw1hsuvPr30HE+r9TY7KRPAFCxQiS3Knu82DPPzQ4qid9Nu/km6pp/K6t5KCk3scUsp7p7gK94j5YvYVdjzIgEO74HbGBu1FbxyWMNQ4BLzCzSasXDlCDwSNTcbIMO4vTBt3so8Qn1mH58=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=erik.faye-lund@collabora.com;
 dmarc=pass header.from=<erik.faye-lund@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737708154; 
 s=zohomail; d=collabora.com; i=erik.faye-lund@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=977jEw+PSgKIyacemkv3jXeTJb9+EwX9fkvMDO5qEkM=;
 b=fGQ5FifqT1ftBlV/janzpUfazKlOdJc+vV5MNk9MaTptSFLbjCpbBMr1EpzTwjvi
 QwtZd8Yz2A/YXGCRL7M0DfGhYgkQTaofp1s+RXvBILfZt88TjgAhKEjV18JbCIYlvvo
 7zOAKaUAnlXeEvLcNg6iZYYEzH0AAvZwwrAhDa+g=
Received: by mx.zohomail.com with SMTPS id 1737708125992688.5750700778362;
 Fri, 24 Jan 2025 00:42:05 -0800 (PST)
Message-ID: <27c6cd114cd37131582e3e81716d09074cab0223.camel@collabora.com>
Subject: Re: [PATCH v2] drm: add modifiers for MediaTek tiled formats
From: Erik Faye-Lund <erik.faye-lund@collabora.com>
To: Daniel Stone <daniel@fooishbar.org>, eric.smith@collabora.com
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, healych@amazon.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Fri, 24 Jan 2025 09:42:01 +0100
In-Reply-To: <CAPj87rPQZTg2Laws1BdzL-UOLV6jWinJqM=GeLdvm7UNEEnrdA@mail.gmail.com>
References: <20241219174929.126205-1-eric.smith@collabora.com>
 <CAPj87rPQZTg2Laws1BdzL-UOLV6jWinJqM=GeLdvm7UNEEnrdA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (by Flathub.org) 
MIME-Version: 1.0
X-ZohoMailClient: External
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

On Thu, 2025-01-09 at 13:14 +0000, Daniel Stone wrote:
> Hi Eric,
>=20
> On Thu, 19 Dec 2024 at 17:49, <eric.smith@collabora.com> wrote:
> > MediaTek (MTK) uses some unique tiled memory formats
> > for video decoding. Add these to the uapi drm_fourcc.h
> > so that we can use them in Mesa, GStreamer, and other
> > tools/libraries.
>=20
> Thanks, this is:
> Reviewed-by: Daniel Stone <daniels@collabora.com>
>=20
> I can push into drm-misc as well, but give me a bit to get dim set up
> again.
>=20

This is not yet in drm-misc, my understanding from back-channels is
that we're waiting for some sort of ack from MTK. Do we have any
timeline for this, so this can land at some point soonish?
