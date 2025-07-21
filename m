Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B216B0C772
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 17:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E82810E571;
	Mon, 21 Jul 2025 15:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="TagpAvYU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB18810E57F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 15:22:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753111353; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ResISgvdQ7+B1dwAdYc1g+nlY9TdFyqT+IamdqnAd42vhpTpWv7Z4QJWrRnds+uAfgoyiVTnu1auJSYje+Q6DpDFS4OJdUTtOK0Ie2WFfv2VrO0TgfWJlBCWgiMl/fZK+NKfnq4uR6kvKzDGmd3bt2Bs3n53lansX1r5iImLZt8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753111353;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=IxXUbcpCNO1VRjeBGCX0RCfjhgn/HwP6y2M1fhgftew=; 
 b=flfy1UsOIBbLlzNDdJjMkpq5broKy3C2N/gXVJPOWWvV43Fnx1Z91gxmcZ0VvF2u2H2UxDZS/O41DlpecClE+SNIPlaZnf/t+kIsdhXX3h8rSihozcXlOeVzKOlZwOtKl9oXHFZfg31lbt7Im7zbmDsgJXHfIuPbUX7toitQL6Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753111353; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=IxXUbcpCNO1VRjeBGCX0RCfjhgn/HwP6y2M1fhgftew=;
 b=TagpAvYUqtL/Zpe9uU+nVEWRFHGr+2HvpjYj8kGxzA7oBAYqV9E+NTPbhIqUEvbS
 v6GzeNw2XMeqdnHUR+8q5SzQ1NwHH78XSy/5lziI2xHlozOt7SB3kjJqyv0AUcdmA+X
 k5lck0zZhrp6iDbBS5d9udqm25V83REXs+isRvWE=
Received: by mx.zohomail.com with SMTPS id 175311135062948.822018112220235;
 Mon, 21 Jul 2025 08:22:30 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v5] rust: drm: Drop the use of Opaque for ioctl arguments
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <f71d7815-f478-4930-bc8e-cb5a412062ad@kernel.org>
Date: Mon, 21 Jul 2025 12:22:15 -0300
Cc: Alice Ryhl <aliceryhl@google.com>,
 Beata Michalska <beata.michalska@arm.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, alyssa@rosenzweig.io, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <41534EB3-B6FE-4430-BF4F-2628CA0DEA3D@collabora.com>
References: <20250626162313.2755584-1-beata.michalska@arm.com>
 <aH5U2Jm6Jpf5LyB9@google.com>
 <f71d7815-f478-4930-bc8e-cb5a412062ad@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
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

Hi Danilo,

>=20
> Yeah, I can pick it up, but it won't be considered for the upcoming =
merge window
> anymore, but for the next. After -rc6 drm-misc is in feature freeze =
and I also
> already send the PR for Nova.
>=20
> Daniel, Beata: Is there a reason you need this earlier?

IIUC, this will be merged into drm-misc-next, but it will not be picked =
up in
the PR for the current merge window, is that correct?

If that's the case, then I don't think there will be any issues because =
Tyr
will go through drm-misc anyway. This means that if you pick it up, we =
will
have this patch as soon as we rebase on drm-misc-next regardless of =
where we
are in the cycle.

=E2=80=94 Daniel=
