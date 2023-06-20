Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA21B7374D4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 21:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9619510E37E;
	Tue, 20 Jun 2023 19:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9374F10E37E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 19:02:20 +0000 (UTC)
Date: Tue, 20 Jun 2023 19:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1687287738; x=1687546938;
 bh=WiaJUOeZASFeiGn5fGJM83EsPCaUn7hFbThOySiUnRE=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Aj+0UFcsQC7PEf/av2hMU1/39L+cl/KmlsILBo+QoZCfGb/ES3L8UywbDOWs99ymw
 FLRcr2wcAXkfXaexrkr7lTpNRWH7lkDCX8G3aeqUum9oRarC1KQXOrACh09rpXMjN4
 tsfq/JAW8Ycy5/w3+mL7uRa0mi8bxmND0tws5QuwQvUdU0WYH4zmyoJfnP7asZzPw1
 5dSDQrtApl6IqMISDWcKpE4FwveNlgnUy5whmpOd7sDRuCCEMkKoVd01QavMDiOJ8p
 hTbmaK0BKObE4wTDT/eqivpF2L8kpudQV2afCbtgfdn8RDrGGL/JFDpYSSA30Qt2oY
 I5txoSHjXBU6g==
To: Sam Ravnborg <sam@ravnborg.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/bridge_connector: use
 drm_kms_helper_connector_hotplug_event()
Message-ID: <Wa05vV4e8z9QQhDQelGxxOZ7pw1T5X0JxcJgvMN2F6G-LlG5M-LifebMp3chY4XpgiIEPjb3TtLObXgFKJkGa2eN_0Z2eczrfuHhE29Ja-8=@emersion.fr>
In-Reply-To: <20230620185820.GA2192874@ravnborg.org>
References: <20230620175506.263109-1-contact@emersion.fr>
 <20230620185820.GA2192874@ravnborg.org>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, June 20th, 2023 at 20:58, Sam Ravnborg <sam@ravnborg.org> wrote=
:

> On Tue, Jun 20, 2023 at 05:55:09PM +0000, Simon Ser wrote:
>=20
> > This adds more information to the hotplug uevent and lets user-space
> > know that it's about a particular connector only.
>=20
> Will this change have impact on user space?
> They will start to see CONNECTOR=3Dn where they did not occur before.
> Asking as I have not really worked with the hotplug stuff.

Yes. CONNECTOR is an optional udev event property indicating that only
the specified connector has changed. User-space unaware of this
property will just ignore it. User-space aware of this property will
only refresh information about the connector instead of the whole
device.

A few months back, we've converted calls to
drm_kms_helper_connector_hotplug_event() in amdgpu and the DRM DP
helper.
