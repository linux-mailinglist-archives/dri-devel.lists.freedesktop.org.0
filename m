Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CA9731BBB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 16:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C7710E50B;
	Thu, 15 Jun 2023 14:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EEF10E503
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 14:47:50 +0000 (UTC)
Date: Thu, 15 Jun 2023 14:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1686840466; x=1687099666;
 bh=FKAUli3o4hy8Ej3BV4NaF7G+I501rWlHmYecmIQngXI=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Ne9VCqfTgLOqKLU81j5rT0Xqk8XPEWCRUhpqAQCdKmg+zMnbq9BWS2Z4Ll4VMeild
 ncqJYPKMHgvKDqYhhNInMLdW2mgf4I18yN+L8lDkzAfLf2E2CoCDlT/txtR5CCeCRf
 Yx+8kcQeXph8qTd4Em4eKaZo4+rcTm/FS6nddH/kVTfs9kr3lOrVyX3pHtwzYFjuCp
 2q3Lz4yzcbKAgtZggB3/a3YIk6sM950e0JtRCek9bDiyDIthszXnMJeojmaJkDORgR
 U/jTrirw+RQfUowOmBWGdHHNqHnptgDsqVqpD9/07NQVDBYg4NrMgY9oQuxUPV/CUM
 Xy2VZPzbq9AWg==
To: Thomas Zimmermann <tzimmermann@suse.de>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/3] drm: Enable PRIME import/export for all drivers
Message-ID: <-Zu2xcAP6KgnhQVsOLkYcnIH7KhL5Tancp7W66ZA-tToQbsE_4bbcB8oIGO1RIHhIDcGTXyAHX-aPuANlbN1FH50uAxXL1VlNFHwSXO2s_M=@emersion.fr>
In-Reply-To: <20230615094206.4424-2-tzimmermann@suse.de>
References: <20230615094206.4424-1-tzimmermann@suse.de>
 <20230615094206.4424-2-tzimmermann@suse.de>
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
Cc: mripard@kernel.org, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, June 15th, 2023 at 11:31, Thomas Zimmermann <tzimmermann@suse.=
de> wrote:

> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 89e2706cac561..10af1899236a0 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -309,6 +309,9 @@ struct drm_driver {
>  =09 *
>  =09 * For an in-depth discussion see :ref:`PRIME buffer sharing
>  =09 * documentation <prime_buffer_sharing>`.
> +=09 *
> +=09 * TODO: Convert remaining drivers to drm_gem_prime_handle_to_fd()
> +=09 *       and remove this callback.
>  =09 */

The docs right above still state: "Should be implemented with
drm_gem_prime_handle_to_fd() for GEM based drivers". Maybe we can replace t=
hat
and state that leaving this NULL will use a default implementation?

>  =09int (*prime_handle_to_fd)(struct drm_device *dev, struct drm_file *fi=
le_priv,
>  =09=09=09=09uint32_t handle, uint32_t flags, int *prime_fd);
> @@ -320,6 +323,9 @@ struct drm_driver {
>  =09 *
>  =09 * For an in-depth discussion see :ref:`PRIME buffer sharing
>  =09 * documentation <prime_buffer_sharing>`.
> +=09 *
> +=09 * TODO: Convert remaining drivers to drm_gem_prime_fd_to_handle()
> +=09 *       and remove this callback.
>  =09 */

Ditto.

>  =09int (*prime_fd_to_handle)(struct drm_device *dev, struct drm_file *fi=
le_priv,
>  =09=09=09=09int prime_fd, uint32_t *handle);
> --
> 2.41.0
