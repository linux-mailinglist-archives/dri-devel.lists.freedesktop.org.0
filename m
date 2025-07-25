Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEE2B124AC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 21:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8451010E02C;
	Fri, 25 Jul 2025 19:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Gy3ZY3CN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F272610E02C;
 Fri, 25 Jul 2025 19:14:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753470855; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=c/ChNizIilZBnl3u9pOD9ri6IJtwX7FBbpt9SZb9lvrYABZGfoZTfZbmrTNUcHRtPz1pHE3phsGcM6L5co9VDTza6X+n64Rz22mYfI2Q6zVzXs/0fb8sVa5xBeA8XqRWuIRGOsk1VC+fCFv5WEf6IvGbj+otcjk3Y3qI3eSPA3c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753470855;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=3nWI/X9rRBiEr2NqIzAIqtYm3orV1MzmKQSYQeh0vlY=; 
 b=UKGzRK8Yw0tgtrnjMEMV3lR3s/CnfepjbG5u6aAVWSt2ojGrJFzXvDBBv1UZUudP+Wh9r4t/Bm+Io0RwipNEZhXQRPN8QRZvYo2WhxFgNvsbKof6JPluEPBFkXgvFI2G7ffk17KM0PWPY4HwDAp8v/08gmDVT0GtSwjiVLAinvo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753470855; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=3nWI/X9rRBiEr2NqIzAIqtYm3orV1MzmKQSYQeh0vlY=;
 b=Gy3ZY3CNERCXwvCGwtvIR3QcudSuJpycnMBiT24+uD8VPDJL2FfA4vVHdqu8D0wL
 8ea75vdfIdZwcZ9LKjbe66nvnvgY8EEsd0CZFUJeMyPT6Cq3t79EJmXtQWoANjYUUie
 uyrQKQ1om+mUDj8MH2yoGqMyHAJLH+jJ5HWow2gc=
Received: by mx.zohomail.com with SMTPS id 1753470853076366.46647032927183;
 Fri, 25 Jul 2025 12:14:13 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 17/19] gpu: nova-core: register: add support for
 register arrays
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <D0DDB132-68E8-43D0-B7EB-AA607C9BB72F@collabora.com>
Date: Fri, 25 Jul 2025 16:13:58 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D08E06C1-D8E4-42F2-861E-C11712351EE8@collabora.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-17-7b6a762aa1cd@nvidia.com>
 <D0DDB132-68E8-43D0-B7EB-AA607C9BB72F@collabora.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
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


[=E2=80=A6]


>=20
> Assuming that the @io_fixed stuff is correct:
>=20
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>=20
> =E2=80=94 Daniel

For the stuff in macros.rs <http://macros.rs/>.

I did not check the device-specific part in Nova, as I=E2=80=99m not =
familiar with
how it works.

=E2=80=94 Daniel=
