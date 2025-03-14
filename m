Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E016A60668
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 01:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA11F10E155;
	Fri, 14 Mar 2025 00:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IR9ODnTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3649210E155
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 00:05:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6852D5C57AC;
 Fri, 14 Mar 2025 00:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D9CC4CEDD;
 Fri, 14 Mar 2025 00:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741910737;
 bh=F9FO9I6Gv6TkCqiBMccTZtM3eIaDVyVuRG1zgD1RXe4=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=IR9ODnTuDxCKFwlsx6aNR5bSRbdNoDd64633B7ZzVz4T9tSuSztvNtsCh5S6mUIsn
 4Txn6oBIHywGXDFK1nWds4/PrA8xxs7guEWahsVf+USGcZ4Se/MWDoqPZyrwwh5sIM
 HFd3YIaihu66XOZfIG5dgfG5T9ua4U/5xUYRlRRYgj4Q+x4yNbrH7mv7gCFfMIpCh2
 BAILfL/0Lsuhj3k3PTNr5HM2hfd0wuKug5UzGMMkHcdhsdGRQRkVqjvzua7pmOsYjK
 wNZqrHuYYLalPd3y7qqIjiItBaFRJIy6BzHaYa4QGElh24Re5YQ62+XYZrtAcxaaZ2
 k04h84oY1hL7Q==
Date: Thu, 13 Mar 2025 17:05:32 -0700
From: Kees Cook <kees@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
CC: Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 "airlied@redhat.com" <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>, "joe@perches.com" <joe@perches.com>, 
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Hector Martin <marcan@marcan.st>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/2=5D_lib/vsprintf=3A_Add_suppor?=
 =?US-ASCII?Q?t_for_generic_FourCCs_by_extending_=25p4cc?=
User-Agent: K-9 Mail for Android
In-Reply-To: <PN3PR01MB95972EFA147FB0453D5A7FABB8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB959715C19BCEA54426D24934B8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <ff3a9c58-5c7a-4c48-8a9e-cc828a43baed@app.fastmail.com>
 <PN3PR01MB9597E5C609290DB1A967263CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9HgVn-XELC065w0@smile.fi.intel.com>
 <47AE7FCD-0F30-4379-ADE9-090A15ACD58F@live.com>
 <Z9Kb8zMJgmSP-rgD@smile.fi.intel.com>
 <PN3PR01MB959780176C0B16C36FBD59C3B8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9KdzZUxs3vlwp0Z@smile.fi.intel.com>
 <PN3PR01MB9597A8F02423B9E4C585F5EBB8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9K36SRz7Ja_AyQb@pathway.suse.cz> <202503131035.A5FEBE32@keescook>
 <PN3PR01MB95972EFA147FB0453D5A7FABB8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Message-ID: <0F278A68-EC62-4267-9AC0-C1FFB9B5592E@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On March 13, 2025 10:42:10 AM PDT, Aditya Garg <gargaditya08@live=2Ecom> w=
rote:
>I already sent the 1st patch to DRM=2E I can rebase the test-printf bit t=
o this tree=2E Sounds good?

Yeah, sounds good to me! Thanks :)

-Kees

--=20
Kees Cook
