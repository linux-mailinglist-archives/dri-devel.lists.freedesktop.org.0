Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB9296D0E0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 09:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DA010E753;
	Thu,  5 Sep 2024 07:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PR0P264CU014.outbound.protection.outlook.com
 (mail-francecentralazon11022104.outbound.protection.outlook.com
 [40.107.161.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0649210E753
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 07:54:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVCX5XdMZB0qk4p6jzyYYq69nH/DP1PEx9EemWdfmsudMK8vpdk8xsYjvoxQnB0vY+1WwDrXLSSACTlsFRQEdeZvHFyi6KgoVKud2Roz6KblhlynGnka9aBlZr5QWtWCa5rCMOmVB3Ck/39q66EXh3VrxRUTn8a3kBpVWxDeVqhQDrRcuisWgBmkiDSAReMnHOrYJYD4ersY1QAtWwJKu7XdG+YoNFS4A6E+D4B9wjo67VjxBLePKnaq1ixUxpo4f/xM93IoeLdDNLn3MygVkYDsr1BLhJQz2+MnQuhixuYqgbbTADg7nksBtybVD94iMJPkuDDlQjAydf6YbezxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giRsvzMd+xqyHvT4vYVWmfb9Pds724zWuoXr+aPCm30=;
 b=g6jiM6al/XsZB2aNuKjT3MCf9nJ73Z6x1bqgDAtkdX8yWXir7Ml8HraoVMSnPIjR4UPaHgrdVi5qEPdSl9q50PRNTTC83Aky9rh4kG77+hV7w3WoBLjSxKdZyyVqBkI9KEKx/GwvzPqfitNefXLoE0/N3luUn6FkEVe+m+x3jXx88tmwmnPUz4DVn0QhSh7qaS6ENYVvmrusqNrBCwqlZmrdhQZ6RbZrr0xDrcB8vRQtCOEkhTF5f6aZWzz5rcRDSp/CVQ8v49bNePvRoFebTC3okF4vn/gBEnp6I9I5kZ8Mj6QsgGuNtDT3p0+ccThFS4CqEedBc9ykC8CiIDHX6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witbe.net; dmarc=pass action=none header.from=witbe.net;
 dkim=pass header.d=witbe.net; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witbe.net;
Received: from MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::5) by
 MR1P264MB3281.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:29::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.27; Thu, 5 Sep 2024 07:54:13 +0000
Received: from MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4a3d:42ec:6933:fa65]) by MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4a3d:42ec:6933:fa65%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 07:54:13 +0000
Date: Thu, 5 Sep 2024 09:54:12 +0200
From: Paul Rolland <rol@witbe.net>
To: Christian Heusel <christian@heusel.eu>
Cc: Zack Rusin <zack.rusin@broadcom.com>, Andreas Piesk
 <a.piesk@mailbox.org>, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maaz.mombasawala@broadcom.com, martin.krastev@broadcom.com,
 rdkehn@gmail.com, regressions@lists.linux.dev, spender@grsecurity.net,
 rol@witbe.net
Subject: Re: [REGRESSION][BISECTED] vmwgfx crashes with command buffer error
 after update
Message-ID: <20240905095412.243d6176@riri>
In-Reply-To: <948af4e4-6da4-4f49-82c8-ef061485e49f@heusel.eu>
References: <CABQX2QM09V=+G=9T6Ax8Ad3F85hU0Cg4WqD82hTN=yhktXNDaQ@mail.gmail.com>
 <40cf01ab-73ad-4243-b851-a02c377bdbde@mailbox.org>
 <CABQX2QM1A9yWCuOHV6kgi3YbPvPHz-zazkOXM6Up9RWrZ-CgPQ@mail.gmail.com>
 <20240902103436.5806f7ec@riri>
 <948af4e4-6da4-4f49-82c8-ef061485e49f@heusel.eu>
Organization: Witbe
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
X-Ncc-RegId: fr.witbe
x-ms-reactions: disallow
Content-Type: multipart/signed; boundary="Sig_/5oantwkgyLvbmvVtYQ0_jbm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-ClientProxiedBy: PR1P264CA0149.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:346::20) To MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:17::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRZP264MB1704:EE_|MR1P264MB3281:EE_
X-MS-Office365-Filtering-Correlation-Id: 109fa714-910b-4080-b12a-08dccd7fef2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U84O6oZJxuuvbd+JuhamN11tadJR/4M5yrUr6sOoNoyEMJCRAhTjNEcaV4Qn?=
 =?us-ascii?Q?L8L6Gq2TDavQzI4WLta8fA/ZfMfLpD4nhvuXeCmfMXStG+MfT/E9U+izxd92?=
 =?us-ascii?Q?5eCizr1WO+8bnuMFzyJcVCGmp7/4RuN94WWHbanAuJvZGurYIDhpg+UAazzE?=
 =?us-ascii?Q?5j3vnDLtoSnIx35My/gxzrEqmfAvWxVlJUgE2g85mNoLKq8pgTNit/3BRXYR?=
 =?us-ascii?Q?hniX20RC7NObTUYkMpTyxq21JACQOzP1xiHB8RRWZtJ0Wnhp4EGGlK/Nevfi?=
 =?us-ascii?Q?dHwB6g2ZhvDXbWSzAHS+3ChlhG3feW+RHC6QoPuzH7ZD5OxL8Vcntc4Xpu43?=
 =?us-ascii?Q?2WbAW4zzZRoMMEXj818/q05CUdRfBbT1BleasBoyl8UVlEnPe12dpLyifL3E?=
 =?us-ascii?Q?8L8W8AjR7AXPy7npiOgYUUEa1p0vHw787lrfjkaNICQ17KmGqvWugOtyUbJQ?=
 =?us-ascii?Q?Xz/LTnnHOSqHVrSOVhYOXndcyeqb6MEsk3y24yJZUp9tHyuGQ0PEs5guVhwn?=
 =?us-ascii?Q?0LsIGi73efXU3oOvoeglKhRLtl0iKWju3Pz3tTdJ2MjH73n0SLbw/1go7q/F?=
 =?us-ascii?Q?zI6Q313J070lq1oCMOH0Qx27OAMGrTSWAuE+MUBHQQNCto5Hajp0pRR+exls?=
 =?us-ascii?Q?81jLaBPTshRqcG+aoXrAXzjweukxR8UXHjcbMy6veosNalKtJ9KEXejOMufr?=
 =?us-ascii?Q?SK1Fe4Fgo/HQyz4ToYpaDBpFxj+uN3TzTrgESxzukP0twnPsF7h5Lm9IdBCw?=
 =?us-ascii?Q?ZGJeNXhZWzmC2/Kq6ZYpRKjXXl8Eolk1bIuUv1WaySZcmpNwgRSeIHsc+eGN?=
 =?us-ascii?Q?vB/wUwnDIXE2PQBrLxV7afTsW2KXDV0GdiKOJ4m2bbgNKLvDkAxhwAvSBhzJ?=
 =?us-ascii?Q?C3Zc/mKUfNLsg+YUNPEe4CX1F7WyJCUivuyGDL7V+z+enzf1X3fj5HxewNS4?=
 =?us-ascii?Q?mw5+YUiMqjIk/jd0OoiZLJJMD5AKyHGukBzgxoATSOnVOHrzQtG7xlKmfzu9?=
 =?us-ascii?Q?SsBZITaXO/IbM9OupQtX+qxtDG13rMssSpx828IcdQ/5szd83142WrYNETW/?=
 =?us-ascii?Q?3l2LssBY7UHVVV4UyCm3aEOEW+vr8EFRMFYv00uDqWbzFLfva5H8R/AIubuh?=
 =?us-ascii?Q?ESDYflj9Y45Pztp6Rn9j6jX4igR1MwPnAtp0DWVYAV7c0b/UyDfjgK1Im2Jd?=
 =?us-ascii?Q?LtLhaEflhzBV1wOcwx16VuND+IazM00M4CeLzea47gbGeEahaJSGa/f/zDMk?=
 =?us-ascii?Q?rJuT5DrpEQert4QlG9bc7PU5uTlorrCU9Kmd8LGM3txzI8UQBhdsrhwLsyH4?=
 =?us-ascii?Q?iigdGCF3VP3N4bPZ21DqwZwDVA96m8haFrP+5B3D0gwwlw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xiRX3iMcLqhdZ1w3Agk4VsHWK5ggyCk4WmY13t+AROukFqaEvl7salROAI0I?=
 =?us-ascii?Q?KyZisLm0rFfu3p5GwSB50k0K3kzl3jhq0saK1DcsVHQD7h1r4OeZ/dPZeQzp?=
 =?us-ascii?Q?9KsWwvBbdPe7mNnf/sxT9Os8tYgDP27T0sRonzYurhLpDjOCtwmI+mOvBCam?=
 =?us-ascii?Q?oeZsDVEZkiNroP5ljEIeWhrW7F3cALarhJgktaBUFKvwG+FO076Gu3eM3H38?=
 =?us-ascii?Q?pnDibApphI64XLXIwtaQa3H5gUPomXKI87wyxIzSyBgNFeZbM8N5dO28YpfR?=
 =?us-ascii?Q?c7LkAuRa/EBjCSlZ4wbpiK/0keTbAVia6lEnH6Q33Se0Y6CRVE+8ZhX1aHuA?=
 =?us-ascii?Q?XcnmsuaeaejlY6Q9Xlh39jRn7B8vw/2qKxEXRZ6U8aAx/g64arID2y8VMA8+?=
 =?us-ascii?Q?4Ovia1G4dc6OKa2LZUrxshPXapJEf1Ex8LOpvJAHss+NuzVTnWDGmtdXMlf9?=
 =?us-ascii?Q?4+0CPk3YWZysReEPWmyRsAjWhTTfdG+xaQCFQYJZnLi3osFdI/US3necN2au?=
 =?us-ascii?Q?H9GJJ4AW1Z3mte5GQlhUgYXv40z7vIKoQcwpdQY1G24F/KKfwITYBN0UShpu?=
 =?us-ascii?Q?xx5xuBz5UFKXVPa/BHfRA+J/neJ99A9aEQ5JbCrvuwVfEoWSx8+7yH6uWd5x?=
 =?us-ascii?Q?0pwsGQ2BRu+HiqlGKxzS8anb053gbYaQj+sZzyzVLfcsXMYpRBqj8EVZFPAM?=
 =?us-ascii?Q?L9+cS6rFdm0P4l0K/aF10hhp709QM3J2joi+XwbLJh6K5Dnifjdrk6nOzW0W?=
 =?us-ascii?Q?Yw4cWleyE3Bp4TdVHBbL7z7EGfgcHFis16G/a0VwVu2454F9V50+u3XTuzri?=
 =?us-ascii?Q?9XQ9jkMKwPsSKZv1aAhDPHnlutQgbPI4yW6u5RlfwGFW12J0+1BxGoiFACuq?=
 =?us-ascii?Q?a2hYgASVNjWh7kVhgbgn77VP7c7tdAHyCh9CrKSMrMMHIIlUTGHWrrLPak1z?=
 =?us-ascii?Q?PXQ/8n7jeS9z2Wje9biQzSqOCtsZqvIywNEY3HkQYEm9ZP5axVeAvn17ju89?=
 =?us-ascii?Q?QiDCKcpB2IB4NN7TrJMas6Vz0PqX1ncXZ2qacCk/8ImNlIVb8WRA7N26kFee?=
 =?us-ascii?Q?hOHcNwm4viGWRPsk3DlBGRLg15PL4cBY5TNF3Ha56bKn/sCYJ/HagWrFlQV+?=
 =?us-ascii?Q?2ybHiP9ndMD+jejrhsu1uNCE4W5257YU2prMiaojEpI7hW8MLaIew8LPT6gb?=
 =?us-ascii?Q?spp81dyRheZdCvMKfQICxHiU/NSjd8NGMHLe9D1/BoAOqw6a6b8KyV3ET5IY?=
 =?us-ascii?Q?1MDxBC1Xq1gyQ22effbAHurCZa8tT88GAZb7OnyAajCZlDGWdL1KYalDdSQn?=
 =?us-ascii?Q?DDeKAEGwcm5ZPNI5z7txcSRbPZOGiXLL/mfvl2oluHTuPDm+Hmhww43AnGRh?=
 =?us-ascii?Q?WXNDLqhlL3gJQE9Eex27knJ5F5qKtv8TlyIu8SUV3Agrp2eM5ZeiljvYiwOw?=
 =?us-ascii?Q?y3o/EwVj3PNTcQ6l1l+UxI3ixEttLRsXQekZiEhfOi8VG13p4w7G9ju1vvn+?=
 =?us-ascii?Q?Lg5uM56nJHZ4WFSwjsPwGX7NThm+Oh5PsrLC5UpNIuL429SKjV1RzLiBzqV9?=
 =?us-ascii?Q?Vg5M08p+27g+pri23H3Xgkbu/RTQur2Xp/dNa3oc?=
X-OriginatorOrg: witbe.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 109fa714-910b-4080-b12a-08dccd7fef2d
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 07:54:13.8038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3f8d401f-95c5-4cdd-94d3-64af2479cf89
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCdeJTUoal4pl93p9N2xNhjeDh3Y74HUcMiynD4BhybY7ND5UkiPlIcvfpqDBmJb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3281
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

--Sig_/5oantwkgyLvbmvVtYQ0_jbm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, 2 Sep 2024 10:42:57 +0200
Christian Heusel <christian@heusel.eu> wrote:

> > Any chance to see that one pushed to stable 6.10.x kernels so that we
> > can have a working console ? =20
>=20
> this is on the way as the stable team has already queued the patch for
> the (to be released) 6.10.8 stable kernel:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/t=
ree/queue-6.10/drm-vmwgfx-disable-coherent-dumb-buffers-without-3d.patch

6.10.8 is Ok (at least for me), thanks a lot to all of you !

Best,
Paul

--Sig_/5oantwkgyLvbmvVtYQ0_jbm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCAAdFiEEfJBudf4KU8bw8ox368Rc5Xmx8y0FAmbZY6QACgkQ68Rc5Xmx
8y3zvwwAuqlBSmDzNh16/SqwAvDE9gD6K9133rtI38NOe8aXZhNL7e4CtFwlsgzm
/iXbrI3yeS4wjmwRVUDsA7msu/XmVava8RStwoEBeCffzfPdfPYW5i1jK4hbopuC
HmEgkgGcoxAn5IgxSzkNWkSg20UhX0+R7s/GQppwemQDpoTZMQVcvwcpWYRHoBwu
GPlwHq48Y7Tnsz4zu7jRUN6Vt7VUrbrhJnmhLpmKUiaZ6mSo0MBFLrXWx4tFPIF1
ntvVyCVt+7NCRI5Aipixxu4uw4ZpTW7Qq38nzTvyndC5aWf62zJeysT7ccqrfSZD
U7zliWvjJvZjOp4RVl6D8a/KYdQB9bq9nFNgn5fJMEG/LwLfJyMc9cRzVFjdOd27
s0eGU0oU3ozL7dPiseOQixs7rzXn4p1jRoQK2iNct55hIjFx7PUZC9QP6XkEpzJG
6+jAeOSiMgVfkt5a/y3zi3Val6Zse+nIN5Jly34a3XOFdefhxtjegyTeSmUdGLCz
lWR/Tgl7
=NQfg
-----END PGP SIGNATURE-----

--Sig_/5oantwkgyLvbmvVtYQ0_jbm--
