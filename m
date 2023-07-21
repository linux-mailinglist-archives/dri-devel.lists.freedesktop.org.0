Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA7A75BF2C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 08:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8EF10E61F;
	Fri, 21 Jul 2023 06:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1EF10E61F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 06:59:28 +0000 (UTC)
Date: Fri, 21 Jul 2023 06:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1689922766; x=1690181966;
 bh=qQPFCGU9Mg3mth/9pdSf1QnoQdvX5PHr5OeL/Njecck=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=DWJ9pT0dKIgnrvSj8AOhpMWFXmjsibZ4nC+pSX+ww8raYV+TTCAcgswlNcVi7cb48
 6LG7xXcq5+K/af33gQTNxqrlG3R5ll82mmW5tX/8+m/P8CGZC55HuYBHYcGjuPdcz0
 OrRPTnRkw3whDtZjf/ls4tWzdWKmAQrCeE4XdZiHxVa1ZXWGYltLX3c2KHJSJ96QGq
 ddhdRUsXBTomUfQURVKP9yVm2Jm+CxPbVZgz9tzSrHCGJbmO80U2/WE76lWm0UMPQx
 U2siFJ70dsrE0ACAEK3ISDgf3zvN+WN1DA20i2bv1eRo6xUa4ELbDA4gyXX/bzBSBA
 zSfoFjowpJY7A==
To: Erik Kurzinger <ekurzinger@nvidia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/syncobj: add DRM_IOCTL_SYNCOBJ_IMPORT/EXPORT_SYNC_FILE
Message-ID: <am6e2dlPCIXALvjqZO6G5x2UJYRoTBJxShrZpZxzKbJ8cnYd4dsKuOK5Pm9Ai-vE5yJO2sYNq2JQRWvpIAp9bLDa8awF-ZMJsNpZEdJGGRo=@emersion.fr>
In-Reply-To: <d01ca12e-f914-12c4-de1b-8918a6dd0df0@nvidia.com>
References: <d01ca12e-f914-12c4-de1b-8918a6dd0df0@nvidia.com>
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
Cc: James Jones <jajones@nvidia.com>, Austin Shafer <ashafer@nvidia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I had a look at the IGT and I'm not sure about the approach. It seems
like the patch replaces occurrences of the old FLAGS_IMPORT_SYNC_FILE
and FLAGS_EXPORT_SYNC_FILE plus TRANSFER with the new IOCTLs. However
we still want to test the functionality of that old codepath: we need
to continue to test that the old IOCTLs work as expected.

Are the old IOCTLs still sufficiently tested elsewhere? If not, we need
to either duplicate the tests, either add a flag to the test function
to select between old and new.

Also, it would be good to have some basic tests for invalid cases, e.g.
for the invalid zero syncobj handle, for timeline points which haven't
materialized yet, etc.

I wonder if we need to detect at runtime whether the IOCTL is available.
I'm not sure what the IGT requirements are, is it supposed to run on
any Linux version, or does it require drm-next?

It would help to post the IGT patches on the mailing list so that we
can do a proper review there.
