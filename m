Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD3596820C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 10:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FC410E256;
	Mon,  2 Sep 2024 08:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PAUP264CU001.outbound.protection.outlook.com
 (mail-francecentralazon11021128.outbound.protection.outlook.com
 [40.107.160.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DB110E256
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 08:34:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cg33sFitujIDZI+1Z4mNJjcYI89I5ZTnaRqwkulGHWIv0IIrc313qGg0CllkJGhUTYEdXg+vAqMYLKXKIGbueSG7psl48QC27gX7KW1mN9zIpY7Im3GOCKIe59CsyMRTvHyBxw8lKPxQWrhJFjladeBiKTWjJDNJ2Wgk/dpF1ydxiarU/lZScmi8ipnTMtLgDjGMR/bhEL9dWB15rtzppYb6gUNOo0xnjDaZ8vxRGyQx5E19ddy83OkgfO36/9p0RgjElUHGyGeOr+Q8UfNxSsUQi30Uur0qPvjkEv/G3NV7ST8OomnO1ArVxjcgZmE7UkhMPPhpmWsJ3oLINuQtnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uz4TdKEfp6564JCz5lPV7NxRQP5iF+8WptaTK1E2pPw=;
 b=gbZoRNTGZEctSEV6jtpGGlEEJXKR+9ogyxswSUB/a3bvvH/t1389DPeyOFSygdkAm1fBNHTSpXXxhTl4sOxcsnXnMvqHb5PwfI6eh3PG7s7itotCxpHK1tYH2SC2y68LORPACWhrzmJxRuvqpvy1SUOfvwieocam8whHaa79LwbX3T8P2MVetcL2I8SZY+CMilFOY8iN8y1M4K5QOxEwwp4iJNsJDstYKSqSsX6Ot7ckFofaheUONvpgcBRBeJF/EtQZyKvhniutIgV/7AN/Kyzob/VpmND7h0BLW/6DSlSN1AyXD7QvtuxI0Navd98+6I/ZfNkmjul11O5nSV3wsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witbe.net; dmarc=pass action=none header.from=witbe.net;
 dkim=pass header.d=witbe.net; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witbe.net;
Received: from MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::5) by
 PASP264MB4594.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:432::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.23; Mon, 2 Sep 2024 08:34:38 +0000
Received: from MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4a3d:42ec:6933:fa65]) by MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4a3d:42ec:6933:fa65%5]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 08:34:38 +0000
Date: Mon, 2 Sep 2024 10:34:36 +0200
From: Paul Rolland <rol@witbe.net>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Andreas Piesk <a.piesk@mailbox.org>,
 bcm-kernel-feedback-list@broadcom.com, christian@heusel.eu,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maaz.mombasawala@broadcom.com, martin.krastev@broadcom.com,
 rdkehn@gmail.com, regressions@lists.linux.dev, spender@grsecurity.net,
 rol@witbe.net
Subject: Re: [REGRESSION][BISECTED] vmwgfx crashes with command buffer error
 after update
Message-ID: <20240902103436.5806f7ec@riri>
In-Reply-To: <CABQX2QM1A9yWCuOHV6kgi3YbPvPHz-zazkOXM6Up9RWrZ-CgPQ@mail.gmail.com>
References: <CABQX2QM09V=+G=9T6Ax8Ad3F85hU0Cg4WqD82hTN=yhktXNDaQ@mail.gmail.com>
 <40cf01ab-73ad-4243-b851-a02c377bdbde@mailbox.org>
 <CABQX2QM1A9yWCuOHV6kgi3YbPvPHz-zazkOXM6Up9RWrZ-CgPQ@mail.gmail.com>
Organization: Witbe
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
X-Ncc-RegId: fr.witbe
x-ms-reactions: disallow
Content-Type: multipart/signed; boundary="Sig_/taM5N/+LFcbSnpLQ0vWX+7b";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-ClientProxiedBy: PR1PR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::28) To MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:17::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRZP264MB1704:EE_|PASP264MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ced0148-4f7a-4c71-31e4-08dccb2a14bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XNjvyle0rhyuv41h2vxuYdqCMoxtj+sfIbl8YHWHIADjcglPcC1gUX7zdmXZ?=
 =?us-ascii?Q?5X+GpmhN4N7eW7hkIacUbRd5Ui6WbyX9XTjZhRgYlyXonTbHYxof8UryYZee?=
 =?us-ascii?Q?iqQtV8yjhURIaEA7JkA+oZLDnYcXoetVUzTx0HBPnusXtTA8Cj3wGl/t7ctb?=
 =?us-ascii?Q?nZby5pYOsjInME8DW1XTk2zAV6ljMR4akMh2VwjxLT5SQu/W7ZythcsmgziN?=
 =?us-ascii?Q?2F5norQyVJQFtZ7IECjchqd9kn84bsGeNC/KKjONjnun6Ti+3TnkmkKiotJB?=
 =?us-ascii?Q?HU+jfMF1tZN//Yxl15ClCQ9RF+4GRxeuumWy6YvVzCIMj+s77G17wRTUI8P4?=
 =?us-ascii?Q?TkOdIb/UraegJ7D0dpwYh4CNyebt+tbg3hXyv2ov0ZForGP1HYzm5KDWmaoc?=
 =?us-ascii?Q?dZawMEI+nt7iiLNs4Sn6lxhvQ+jlvoqKVOpWr37bUxOq0fpJioBI/3OwouNo?=
 =?us-ascii?Q?g1eP44hgHdLEiTi91/S93u7Z197ySgS57eK/qobHCBBkTa/mmkO+ep7IJj65?=
 =?us-ascii?Q?5fH7kb958hJxfHy4x+hfKBcqEYFQhL1XGQYUav86q48tVrRyKrFbArV9Kdph?=
 =?us-ascii?Q?AK+7E5DqXreoySBMZnVT3qCbYJYwKPSle/KKdhROEWWrpHAxz4mAvLwMx5K2?=
 =?us-ascii?Q?ax7/7SbUUvbJXjwJPw36vn4PknP7HYHzRMNhHLa4c/qQRcuJiRS6SBB4T3SQ?=
 =?us-ascii?Q?2P1B4eh63lvvu3yrqmmfqgykakNHnv+cbOPFgBkBC7udljlcdmwVLhpfdv1z?=
 =?us-ascii?Q?ixI4ZsoEx7q+/HX+IHAmruS329evFIdbzm6Bi04XgQj/4+Z1amPk2iYG7xPS?=
 =?us-ascii?Q?6ecWKP5RzNkiVhQxhQmvxJ6cyG+t3HECQ9zk6qL6KrnbCn6Dl08naWvM+zMh?=
 =?us-ascii?Q?jmzKxyme87sTEynQy0o4vo5Xf9lvSe0M1Ef7NtJ9AtBGisDzAaAeRiVEXc0C?=
 =?us-ascii?Q?SUhlj9nj4AVeRJOGP4ULFXdQXvSCP0LvmrWF6TqrNVp8pPe/7ITMe3a9WnK1?=
 =?us-ascii?Q?Xfo8kmMpzc1Hx/XFPb9JOmUoVaBu1veXIZ91autwh661ADietCHiha9pgin/?=
 =?us-ascii?Q?lAND4avB6FS9aCpRqwc3V6Lq6TFuoCgLYh2ETl85tAlsuFezW95Ncm+j5zy3?=
 =?us-ascii?Q?rKD/zmcUe7vj7zN+P9gAWl5FwnlsfOdO/ElBh0s6uXut8i6AmKiFibt9ArkK?=
 =?us-ascii?Q?zATgAGqmTQUM7hauU73nIbO4ZOd4sYgpeQv0123tXkmqwGv2EmzvZ+VHAGRM?=
 =?us-ascii?Q?cCA/l5pj2ZYLEP38DHzECPHJ4Tz7M8nkfH4tUGHZH/loqeLSRhPsA5kx4eZh?=
 =?us-ascii?Q?CC2sBk193CW0oLHwQJTtUTk+NsP9aYpHU9irjEciHuWRCw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oyaguXowy4M9L2F4fiDa4vZrTSq95aF54Y2ApKw2EHSaDLr177sDH10bTgyI?=
 =?us-ascii?Q?notqsfyVYa77rl24z25AtvmjH5uhkoa46MoYZDLIYtVuwpkjEWjqrE8hGZwH?=
 =?us-ascii?Q?rljFosC3/zVUA4xyf++JJ2/TyTeQLH/q0G6CO2hhfzlgESaWZNXv7wsvHsbQ?=
 =?us-ascii?Q?5zhb82yg1JL+wYxtVY/pfA91taZejFMWKurIzvjnBpUmu+rmJ7l0b/vG8xti?=
 =?us-ascii?Q?3ea706kBPh8xalxXRZdhn4Rgskw0/ydG+rgiV3Lrav9zPzstlsPH2P9134Hf?=
 =?us-ascii?Q?YEo2s61vmVScVeMWKxewN75rNa0/rRmwEgacAwz3BawEH8lTWfiN46TgPHob?=
 =?us-ascii?Q?ows1Bcm81XoUITgZKDkSsxAwz553pyexmXpgLhhKKe6WQFU3zBEWuhsRph1O?=
 =?us-ascii?Q?KTEcWOOppBlFtFbysoxanNqcyFha5evH1+PE0zIQoRNBXI4Mo5VR2JqhGZDv?=
 =?us-ascii?Q?8yMMwa2QcAY5LJpf/zpnGf09qx2RSK2lSs8z1pM29OnYzQPSbRoLXXO87Z9u?=
 =?us-ascii?Q?R9jGqfbI+a9HCDgGwxnGHNYvQDjz6t7WI0vLh6D6PXln5PZSmeZ11a2H/meQ?=
 =?us-ascii?Q?r3SOulreXtG9l3YdFyFMnuyeKMiyOvjmH/Ctaa46UluXO6qGY1UOx9KQBXFR?=
 =?us-ascii?Q?9v1CQ5BGQMy/2t7wiplWZq4AcSKVRi72q1D3r2zBLfHTYMLrPHySlfl4i44C?=
 =?us-ascii?Q?a/LVOM77clV6X/oMTwai08i4MfPp1pjumyiElwhtfI1WP0CtNJus4ep02i1+?=
 =?us-ascii?Q?1u2alYUDtzO8QKHSfSHlXG3FTjXGGIXyKZSu7ZpU6OqR4i+8+rkoSid0Uz2H?=
 =?us-ascii?Q?LtHxXfhWdaN6kVtOi0ByYUzsy3Bogzjr0dczgY4XN+u5c/Bhy7mERKM60s2M?=
 =?us-ascii?Q?/94ACbGECVHupT3tyZA2Yg1Moqp1GIvjZgycvHgzZNPc/yxd6UmnsBjzDo9O?=
 =?us-ascii?Q?XF3Kqc4MZpMLmnk3ZAr8zr+AJYVrVW5zzHhzW7JIux1v6cwUQAJEURRNAaPf?=
 =?us-ascii?Q?/vlD5Ym9mUOpNoNgHnx0VSXpXEdsBNgbcfxERfjKe6AJg/dBYYHQgpLwCN3H?=
 =?us-ascii?Q?x8kb67mmPFZq9n4LJd9l2Cb3aGiewbhQJSYUvA8OW5XtJhBQmdR+Pd8XfxA8?=
 =?us-ascii?Q?/wqpXGP1uYf3NhgAvBDwI6PfSpXdXGIZEnPcR0wFCJPhz6Vg4Y/Nt3Nldxs+?=
 =?us-ascii?Q?oEsXGZED4f0+T/y2YZ2J7gyS9yaLflj1VwoIvbM7jCX/urZq+cDzkd9lRTOY?=
 =?us-ascii?Q?6Tw6+3h/TMehlvSP5aCxzUJFPKFlN3JgL0LFHalMzjbP8rcRsWZrtfF9lN61?=
 =?us-ascii?Q?iffEbWiEtyRp/LK/4HjEgiNzuLaNVmsN6D9csd316dPqA2FdwipD/DdfE9JF?=
 =?us-ascii?Q?nUseXWaFWVZKq5EEohp80U73etMxwl5ADK+Pdcp93BxZYs2h5s4S9g43yB8z?=
 =?us-ascii?Q?BmBwjPR6CXymVy93NXo3U1FOCC8eZ4E2Am2EOKRlDxovu5VFoCIZuq+rbn3U?=
 =?us-ascii?Q?MJp+vE8PqD67VWZaQNHg7DyyIlk3DpR68/qPzUk2ZMAJ4ze/aEVbVOD4qiEq?=
 =?us-ascii?Q?a8FDXVFdH3fp+lcS5E4=3D?=
X-OriginatorOrg: witbe.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ced0148-4f7a-4c71-31e4-08dccb2a14bf
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB1704.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 08:34:38.0392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3f8d401f-95c5-4cdd-94d3-64af2479cf89
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6s5vBx/oR9lyf5raQmJ2fgowFag/o73hJkRvWER+N41JHxMqJKI5AW1KfY+zMTJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB4594
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

--Sig_/taM5N/+LFcbSnpLQ0vWX+7b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, 16 Aug 2024 14:56:19 -0400
Zack Rusin <zack.rusin@broadcom.com> wrote:

> Thanks! I see. I have a patch out that fixes it, but in general I

Any chance to see that one pushed to stable 6.10.x kernels so that we can
have a working console ?

Regards,
Paul


--Sig_/taM5N/+LFcbSnpLQ0vWX+7b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCAAdFiEEfJBudf4KU8bw8ox368Rc5Xmx8y0FAmbVeJwACgkQ68Rc5Xmx
8y30LwwAqhXL1bXwqY2aYI0KoxVaTqe0GUsZYiz6iV+1w2gkl1U/U3/jan1tAK84
Mw6pSa7SHwhThHvnF8YAqCuaarE5BjIZDugKK3kXpl+O2PWFgvCpgEIqqpYlLCXj
LSzXHFRBcL3NfvgGmzEIhjS8wn5p16p9m3dFtehn0NDFeKMcZf1vXJS1VBeFFLoi
6CWuZz/4BK4AFyO3ghUZGeiuDa1y05K735M4yt0JCxcpGOzkXAt82LjpGaul+FnU
t5XgXnsF7znen3Wvn/Z0CCqccCmfrZro92J0VTLkpTYHfqD3cJQBiCm+MKIjZxf/
cEPCJJRoU2TtbCxzbRlNlXPfnFvM84+XTqyQ26aM/eVuu2Fw1QN7BkORYOHt6wBz
75q33V5+7HXugjasSlGvqzjNVa0xK54XFNn6ve2yRz3DJ6vdJv0RUBj+lXtZQA8o
uyzPVFKRyFZh+7WiQUi/0dHwOgyg7o2mvM49q2D56t1lgoD5UetMKsknco4qJ//A
bv+n0Mn+
=kkhz
-----END PGP SIGNATURE-----

--Sig_/taM5N/+LFcbSnpLQ0vWX+7b--
