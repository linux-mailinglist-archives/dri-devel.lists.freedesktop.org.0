Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D684431264
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 10:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037A26E997;
	Mon, 18 Oct 2021 08:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F17C6E997
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 08:45:54 +0000 (UTC)
Date: Mon, 18 Oct 2021 08:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634546752;
 bh=GxsgcId5Sw0Za4sYeKStskwVp9Dyj9SlMnDZAKBUjdk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=MsCAOreMNRRC7C5QcygebGwCCkLT/DXmFBxItpfQQpt0ditWYj0qvnZ+p/v90xhaI
 oUCzGSQ3vw+HTobuKwejWujXE9fSNn1BiTL8snkjt5hzmTjlj+oeg4KuayDBuXqvzG
 tof0Y2b6jq0D6j+UnLLvKwuK7Hf/WjTnRjX4MQLihe/mmFFfsCyoB/SCOzFbtkW8zt
 25j1Uwr4CJ/m9r2IbdDssp/eWcs4Lf+pIQgzMM0xnf9msQ90mXb1IkjNF8DbwEtoE7
 fp4OZJHIH6/XvVuqSsJAjGKvMkuoE9RoXHcMhrmHqslYRuVwgNPeNBDeDQfVnnaM8E
 mttOQAsOaWM6Q==
To: Sam Ravnborg <sam@ravnborg.org>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/6] drm/probe-helper: use
 drm_kms_helper_connector_hotplug_event
Message-ID: <5MqPv-tuMML6L87dZ8hUeXQ9Ykf7D8GmhSmV9OLm0RFyS5cZyLM3sO-SQDbnuHcZYrK2OSyiyxuiDTefG9r_WanSV-EywsSHmmdhoKRu3qA=@emersion.fr>
In-Reply-To: <YWnehSIgW1YOrOba@ravnborg.org>
References: <20211015163336.95188-1-contact@emersion.fr>
 <20211015163336.95188-6-contact@emersion.fr> <YWnehSIgW1YOrOba@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, October 15th, 2021 at 22:03, Sam Ravnborg <sam@ravnborg.org> wro=
te:

> This code is a little confusing to read.
>
> In case we have only one connector with a change we hit the else part.
> What we really want to find out is if we have one or more connectors
> with a change.
> We could do something like:
>
> =09struct drm_connector *changed_connector =3D NULL;
> =09int changes =3D 0;
>
>
> =09...
>
> =09/* Find if we have one or more changed connectors */
> =09drm_for_each_connector_iter(connector, &conn_iter) {
> =09=09if (!(connector->polled & DRM_CONNECTOR_POLL_HPD))
> =09=09=09continue;
>
> =09=09if (check_connector_changed(connector)) {
> =09=09=09if (!changes) {
> =09=09=09=09changed_connector =3D connector;
> =09=09=09=09drm_connector_get(changed_connector);
> =09=09=09}
>
> =09=09=09changes++;
> =09=09}
> =09}
> =09drm_connector_list_iter_end(&conn_iter);
> =09mutex_unlock(&dev->mode_config.mutex);
>
> =09if (changes =3D=3D 1)
> =09=09drm_kms_helper_connector_hotplug_event(changed_connector);
> =09else if (changes > 1)
> =09=09drm_kms_helper_hotplug_event(dev);
>
> =09if (changed_connector)
> =09=09drm_connector_put(changed_connector);
>
>
> Maybe the only reason why I think this is better is bc I wrote it?!?

Ah, it's not just you, this version is much better. Thanks for the suggesti=
on,
will do that in the next version!
