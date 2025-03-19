Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD0AA69646
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 18:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C76C10E55E;
	Wed, 19 Mar 2025 17:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="J+9773un";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2043.outbound.protection.outlook.com [40.107.212.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E6D10E55D;
 Wed, 19 Mar 2025 17:21:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JErdTy2mQEZiXtpdBO8A1O+g4TRp5eQIBgDIYEamE4TiJ8YzgJncxx7lNKqW8ajWtnduczMXLrxvXtNGskOG3y1W39KQ3DUiaMOSPQZWSvTXzqe5wRaiLVZ9NJ4CC06QJGkwQGfwuOoubdjQLUcP+5zdfAz9j5vproWrKSKa1qihgXCptzN1o3sR4wC7lBgSzrHQRdbfY3zy56OWlePsip8DPf6X9aT3ZuZRpsIM2SCaLpeDH1yb2DRXoEAPGgMcPnq1M7ImOj1uO473rnlgdzUsrTEyD6WG2cnCwwV0aAwl9AmMYO2AXiS8Kx9tvOiRht7Zj64EjS/Folub8ikcLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXrBxXcrPEBjD6+NiwOT4DFSk8uaXepbseFNxuY3DGs=;
 b=L2Q9K4EsPq4b3+aONTOWuw16PQXAcr6v7SnbQn0qNduWJZieR3g5BT9YK1d4mKqdCZrwmI5TDAWiEtqN5aqCpJeTpJGt3A6tabj8FTRcvgX0nq3+6WXkDzBcs7cFRqkaRBXgJg9CkKd8Py/382BAPZDUrrKzUY5NAGX/zbTN1seLhiamiuDn5Wxw6M64NhSUlsSvj3GNg0KvZKaXOInk2j2YGEM2rYPvVbbKaj2CeQQi+6unYFVYjo9qhcvFd8cEFRsoNcNBhKXOSrrt3+mqKOT2bFZIocj95DxxtA+ZmE5mi0JaphUNJir8FnAMxSBdF+2iywKUeJsBohVCngjKJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXrBxXcrPEBjD6+NiwOT4DFSk8uaXepbseFNxuY3DGs=;
 b=J+9773un/B15Y50uEWzUXWmgIw7CbtmMPIrk65rwNW0RvefEbROCT4oATuHsneYA8Q+kaKE0N03BFppJUDkwaygm7aJOHm9DfZgV5Eco9GDQahMX7Hdm4H6Ssnv+KIxiHWUjlaKUClptCeMEVmu1E7x90b+QvgpSizEZXHZtKJQC4hFNbjss17R0P3SmIhUaGUHbqAtAgv2K8dIVKRvnGKWAsqd5KCs/IH5xEBX6sFr2KyEg5HfKJsNMNvvONOtnegtRSyGZDBPlVi2QQD3fbmpcjduDoCQWuQ457sALcF6zMfuqP08/8qQIHgs08tTEMWssrr7S9Qd4hXMZ5k/MdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA0PR12MB4397.namprd12.prod.outlook.com (2603:10b6:806:93::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 17:21:34 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 17:21:33 +0000
Date: Wed, 19 Mar 2025 14:21:32 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <20250319172132.GL9311@nvidia.com>
References: <20250304164201.GN133783@nvidia.com>
 <Z8f9mgD4LUJN_dWw@phenom.ffwll.local>
 <20250305151012.GW133783@nvidia.com>
 <Z8l8HgZOV7sDWqBh@phenom.ffwll.local>
 <20250306153236.GE354511@nvidia.com>
 <Z8rKVZolu8n6lB1P@phenom.ffwll.local>
 <20250307123255.GK354511@nvidia.com>
 <Z8rv-DQuGdxye28N@phenom.ffwll.local>
 <20250307145557.GO354511@nvidia.com>
 <Z9LsbhzjI-P3-edQ@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9LsbhzjI-P3-edQ@phenom.ffwll.local>
X-ClientProxiedBy: MN2PR15CA0047.namprd15.prod.outlook.com
 (2603:10b6:208:237::16) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA0PR12MB4397:EE_
X-MS-Office365-Filtering-Correlation-Id: 17414a5f-33ea-4240-7466-08dd670a7efe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aEttjp5vRXqegK7wPitZD6KxejTzKVb8eEM59onRJBRrZouV/xR3xbBM6mIS?=
 =?us-ascii?Q?nUmGG49KBto7ODsTQxBU0KjwT6uhPd593LwfK0dmoGiiUZZJYNIev0G6xITl?=
 =?us-ascii?Q?p8Fy37/XBmU2S68UCpWzvhGsA/oNdBUyYY/yk6NFjq5IlH/iOu6dzHKEpOn3?=
 =?us-ascii?Q?qecxSlbphniooS6zGUu+nt76bsqIkzY/yCJ+y6f0vpoV5O3IKvM5g9EuybbE?=
 =?us-ascii?Q?2w5oSuN3eeno4u4zAPNBKqeHxsUEhA9rJMQ0DZRakuZSiJRvwjyz86Nm+YWR?=
 =?us-ascii?Q?Kv9XzBdWI5cnIApTmdkr0Lt28Bkhij7sLBZ/faXMSUDHkAWFbx2sXiO4LA1S?=
 =?us-ascii?Q?JrmlwbyP4ARFJCgNIrdSNWQSTXiaJaK6SDl9LCnpE1oIWsM7QtP/MLVkHiXr?=
 =?us-ascii?Q?QIYZH8w6/blB/rkiqye5MNyIh9jHfjQ6Jr5j0GzO2sUV9U7yxoITres3Zm5G?=
 =?us-ascii?Q?L7MOCwL0DZ09itC2cc5HqedVRq5gDnEgG89KYLR8Zu1Yu/+w6qmXSTUP4wns?=
 =?us-ascii?Q?ks22RH0a92JO0YwHEJs6xoscDaW3SO15GdkSAP4VxzPvxpjwMURESCd+0lK6?=
 =?us-ascii?Q?xvJgn+8WAOPpLB4SOkvsqGG8njhT1P413XYwSH1+al+zBb1nEacjYKvOVv36?=
 =?us-ascii?Q?gomZHFi1CsB7tKBHNzwO1HPcRBsPRwRUmIIFCNUVV85F6GCyje/ZBeqRhR3r?=
 =?us-ascii?Q?8+baU2Cx8j0CfetQNsBuUXc+PWjHg6yyeEtO2PYcA15i7BJyvC65/7Vdnara?=
 =?us-ascii?Q?iIvfh56qdTGBxS5TTOc0hHLimMMfiZNNuXTSp4WKg1KAkDMLKhbjJ1SLnvz8?=
 =?us-ascii?Q?GWdfESLjmhMNsGzptW0D9jCmL3IdXu5D+DHhXTkQaUyahgZqnQilM7DOmuXK?=
 =?us-ascii?Q?RnXqjS8TDzT5lXqQgbs7xXMFXTzbdlvLjsPkVQgclEi8L5jEIP44MDVK3CjK?=
 =?us-ascii?Q?nieuAJbzJVhP9mk0T2NNzi1Cnxxc9VNKBSJ0k7/bf6ie7h52RPee/N0gAqRC?=
 =?us-ascii?Q?KqZEYcfDN0ADuAdAw18DUMc7rtbsLFL5bXZ10XFD/F8hX8oV+DIHTMK9Jsyl?=
 =?us-ascii?Q?eYZY5MOQjjyyoCmikt3kJBXOt6i8y+via3eXazNIbS2coGUbY0JEVkCoDVUq?=
 =?us-ascii?Q?lmQT4OYTcLxKRzreV3GhZ2c6Slm8o4o6UjdjpXwYnHMPAduHpcaLgjgnxFtB?=
 =?us-ascii?Q?b0NL0jiSv42aM/tIGtdw/XvGZXO6eFu33OGxSdlDKkk9Hp4hTU+qwaWY3Us+?=
 =?us-ascii?Q?qsi0QhD8c0AZxVKqdcvNCBGKUTawIsjMKNlKiIfQotxx78E6gcmg+aI4IO9J?=
 =?us-ascii?Q?waZ+6ReiPL6Gvyq8ZQx0Nhgz9n5l/0RmF6Hm0urwxu/9srZWoqHtVa0sL7HJ?=
 =?us-ascii?Q?h17g10IgJjlFAqSNVBVLngABx7Lg2GkFSmSkETPmVtZFbRC9z8BRGJUOwE+7?=
 =?us-ascii?Q?OV1IWsRaXZA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?joKIAXgE63Arbg7hwAWjSa/Arb75U8lxQeggMXR+1/t2jMd5qNSC/4gf5mL0?=
 =?us-ascii?Q?nniCZ0LvCBLS19Y39l1C273PEVzJAFIi31ZeQLsZclXT5xN7bYaxA+2ZLOfx?=
 =?us-ascii?Q?v2Ky3hvfpYzUzMFHaIxIY6WJE57ZZF9n6CYljyUiSebDlzIaVSXKEM3alkIF?=
 =?us-ascii?Q?hGE65aoxI8smPC+OM3zScYAtoKKObNYWIPO2HkKKJHVzyQD5YlsD4AYbVJL/?=
 =?us-ascii?Q?vlj9f8Zh1fQm91Uk4o8cFJ8k3YMN2oJJupgDBIddR/ZqrY5hKPg4kQ2OYJ84?=
 =?us-ascii?Q?tVeGSMoKmJSojHUMPWAHhbE6bNE3NnKb7vVilwMSA80lXDu66Bqe9fHF99Wz?=
 =?us-ascii?Q?aDHTJO8wP03h8feW/T/LCy5xFbweatkov9sMSWhLF+t38R/YY/xamG5BKqI9?=
 =?us-ascii?Q?5wY1TB/t5N5FKwV9umqVYUsO851PX5d0u0UIkc4X0S0wlB9ChThx6cFVhgA5?=
 =?us-ascii?Q?UxDk/GvyiXZjqq9K7nfT/bysFzVCZ9Gp6BmohB9Bl6X4oP+qrqr4+Tdq+pXL?=
 =?us-ascii?Q?5Icqg7ler4RJTn/YpYxCkYiU5AlqQi0O71v4Mo6S/C6gwyeCuiZ9B1x9uukt?=
 =?us-ascii?Q?OB+d261khelP/jbvgp4B26QlO8xhVTaStv2sG/qDOHE3j6rnfR8+sGVbd+o9?=
 =?us-ascii?Q?HEqPgm5Lz+50hackf90F0FzAeg7hRnT2XJvdWvz2AzmHdV26MVN2/wIDskC9?=
 =?us-ascii?Q?qjSv4v+GOpxw/EM8dj2fQfvauUUHjWSafbkKBXIdzo/sIWHPY1jZpJB814TA?=
 =?us-ascii?Q?rZ1xjVeRxfFPHYMs0wJC15EwqxTLWppA7C5OWel6uBaEDiiboOa29EGsS39S?=
 =?us-ascii?Q?Gk0HAynfZbahJDpqxDATJKlL9N/4wTm5fmUkVKpKUKfcannJW1rITFHw0o4n?=
 =?us-ascii?Q?PEt19nFlOmvZFoozdbUDRPFnHqCknSyOjHXUbcSPskLSA1W/yUk1A+iK/fyn?=
 =?us-ascii?Q?7I2yg4M5DSdKXUgHLus3yJeLnrB2H6N1QT9Uo0WmP3pXIlAroX3dZrTieswN?=
 =?us-ascii?Q?g+hA/YO3GfptVDxKeWOuImgxGSYlKX4EsgAfYus54O44c3RtDB53xWdvdrne?=
 =?us-ascii?Q?jIg0M6oydA92+B3+a/TkzT0+LYQQvA1S5CT3/PQO7GZYen5yi1Zk+ooN3OD0?=
 =?us-ascii?Q?K8U7Z6cH18IMVszbKqZfv5amNKV2nUFql1RHH1ltRXqzWlou8AezN8dpY+GF?=
 =?us-ascii?Q?xq+2zjhXCwIOLfG1rrlUu1j7t5xaHZB2EHm5GuofFF5jOpTS6HnWgx7ZOdoT?=
 =?us-ascii?Q?ijgUifc47SWkoyuCWVGYucJJkDvrgo9K53F3J7+How6zyHw016LvvlB/yANP?=
 =?us-ascii?Q?se50syEZ7zaC9FDknOeduBkOJMp0FIEC6oPELPWcmpZ5OrBUoi+TKdgaKJdT?=
 =?us-ascii?Q?MXOlqEbz7RHNACMI+FDQNhauDNHmBcyDDJunFp+h/wlaJYw+i9NVqQOEMu9y?=
 =?us-ascii?Q?yJ59zgPEiyj1XwJN//WKa9TPHU17KNVbZVEs+kYSE3anE7DlAsrT3VMtLdmY?=
 =?us-ascii?Q?lMy59J8LZYtIEW63Whfm5VGnSM4C927jmpdoFzQvnbqc0MjXFs2HGs5G1IAW?=
 =?us-ascii?Q?ZC+iGNLq0mMsHYpo8ZY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17414a5f-33ea-4240-7466-08dd670a7efe
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 17:21:33.6849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySFUoMnmyDz/HfgJwQYZZZi3zUVHQptreMvErMOm4hy4mIrwxFBCbmyIfCxnGlKJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4397
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

On Thu, Mar 13, 2025 at 03:32:14PM +0100, Simona Vetter wrote:

> So I think you can still achieve that building on top of revocable and a
> few more abstractions that are internally unsafe. Or are you thinking of
> different runtime checks?

I'm thinking on the access side of the revocable you don't have a
failure path. Instead you get the access or runtime violation if the
driver is buggy. This eliminates all the objectionable failure paths
and costs on the performance paths of the driver.

And perhaps also on the remove path you have runtime checking if
"driver lifetime bound" objects have all been cleaned up.

The point is to try to behave more like the standard fence pattern and
get some level of checking that can make r4l comfortable without
inventing new kernel lifecycle models.

> Yeah maybe we're not that far really. But I'm still not clear how to do
> an entirely revoke-less world.

Not entirely, you end up revoking big things. Like RDMA revokes the
driver ops callbacks using SRCU. It doesn't revoke individual
resources or DMA maps.

I have the same feeling about this micro-revoke direction, I don't
know how to implement this. The DMA API is very challenging,
especially the performance use of DMA API.

Jason
