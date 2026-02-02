Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAMPAHiKgGnO9wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:28:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7ABCBA01
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF31989262;
	Mon,  2 Feb 2026 11:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gQYhBJen";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010032.outbound.protection.outlook.com
 [52.101.193.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C67589262;
 Mon,  2 Feb 2026 11:28:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjROVxaAau/JmFu+dFUiIk6gB9zaETWJVhxE46LC6sAGNetfw8LpTEzevFLrsMYig6OGT45PwKV2mT91AKUiq1fGABL+zN5g4zRKoTcTC0RM3o3cPH6NEkPXU76tAQ9nEAcokWuz80t8x7l/fQtir39oJUGuJ2UphUCXkHsukmbcnfca8L/2Yz+AN+8E57a7zPbpiJZQAoxFhB7ZDIz2iyDcffDxaJOaoP6LfpzoO+v+U9jc1cFDwGZwY7BvLgKi8hpYv4w55o7XO7NxQmM0TxzKveFfT2kHXnknWYtPFFJ5g7B0Xr5lxWxtHCCBmHGtsPwP/hpeZnUVsth6c+GWyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3M+mgOctxXPYYPupbdMD08ESj48SyWoOBsCm0UcTRuY=;
 b=N/sp0epyHK4iRE78Uety9Ub4Nr5jxFk2h6Ji8WVPNXX6Dtyk64ByXo52SLyvLoyryzIlBJWSlBW7Igf/EW5GaUOruefuSbbZt45dIufZ2/m+kCBLsv94sFe7eLQ4Eh9LZObcgvWvsxJVVvsdwfqxMcCBRuQM2jpS2ysjBsW3BOe0wSduDsOgnu+mxLBQLFHKTqRiTfeRn5hFeYIuYsDLh+etPXhR/gRae2F/5tTUWLS65ptMiiBadNVVTkJGJ03cyr11civ6F4ddFcEFak+gK7z+dcCsgEN9AsaPsmWDPn0bUMgPY8b63by4R6lLSWeQcqLBwFkkaVhlSG9B/h5tMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3M+mgOctxXPYYPupbdMD08ESj48SyWoOBsCm0UcTRuY=;
 b=gQYhBJenKRWTmCndJodr399HZluT6pb3uKdmC6Pw9G2ZdJaigcqLo1YI71YTnoR9fVWWnRLihAllkxh99L3VW8C4BDelVkBFASWE76Iwf7ChtvlU5AVrqTIlhMdBWwsnrrC2D2ATmdd5gFK9L8gj3inBy/YLadGlmRhtoXnFkTe79YGxuFh1YdilphJY5jk4T+K0lwB9XSqHHxiJ3hc4Fybz4+kJZZUbZryEG4crRDkvviAp75S5ByxSfgNBnPEuR+E8HB2FT6h94LDxHXzbpX/zdi2rQXVnRbQ7KFfD+TH4jYUiBxM9JLCspgO5R6evOsPmiq2/5uJ4tHtZS/rzww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB7354.namprd12.prod.outlook.com (2603:10b6:510:20d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Mon, 2 Feb
 2026 11:28:43 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:28:43 +0000
Date: Mon, 2 Feb 2026 22:28:38 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 intel-xe@lists.freedesktop.org, Ralph Campbell <rcampbell@nvidia.com>, 
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 linux-mm@kvack.org, 
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-ID: <27rdfv2mw6ibphgqzrys4weeonqofo5mc2mzkomewqjsyk7kga@zuip5drbskpf>
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
 <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
 <57fd7f99-fa21-41eb-b484-56778ded457a@nvidia.com>
 <2d96c9318f2a5fc594dc6b4772b6ce7017a45ad9.camel@linux.intel.com>
 <aX5RQBxYB029/dkt@lstrano-desk.jf.intel.com>
 <0025ee21-2a6c-4c6e-a49a-2df525d3faa1@nvidia.com>
 <a459f147b461c6e6e806282956b7931f74a0aa93.camel@linux.intel.com>
 <nm4qa6fz2kecodhtt7yfcnfx77ik7pr7332amfqvgyhgs5xwqf@v2v6coz5genz>
 <6a6e054bb6efe76c439b3329702829dbc75b9060.camel@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a6e054bb6efe76c439b3329702829dbc75b9060.camel@linux.intel.com>
X-ClientProxiedBy: SY8P300CA0002.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:29d::11) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: 172d509d-ca69-4025-cd87-08de624e38db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?gllMY2ITmcgvfWlTHUydCdjb3Aubo33IknsUycW+wT3eQ4n58ELF344LPK?=
 =?iso-8859-1?Q?nTZV7hhmTelAWeEwOm3lGjKy7OQIRW7TwPe4dRgfqasicJc4LIEBZ23QgN?=
 =?iso-8859-1?Q?+ICbgR/fbCUTDnY57L75s969fH4c7xSZgZHm4yZNdXknTzoUXqCDrBfcRu?=
 =?iso-8859-1?Q?BtjUuu+thcBjYnlyiBZlAA0Yhn+D2bQwdKicu8BM9G3R7giExg5wcnYNcN?=
 =?iso-8859-1?Q?zuF2qYo1DezVugRhZn8ur55MKhOMMApbDIP26nlQjs4MWF/g3M2lIJSmfr?=
 =?iso-8859-1?Q?MiCPItqGjqtaoKen8VM+5mgfQKI7xIbjailz2fTI5a2+ORfMsCIrxWYkMF?=
 =?iso-8859-1?Q?Z7k94rgQN0/m+EJa9yC2+e5Ep45NPe4L1myjNM5NQo4+V3R5i0IPgr72pj?=
 =?iso-8859-1?Q?PLlSfYHOS8swJ59acu2SGaZKuRfIE7voIFsdbwExEVYzufFJx6Rs4g1b49?=
 =?iso-8859-1?Q?9KiAZzwYQriFzZtRSmEVHtTgPzcjrmjDH/NSZThyTNs2jY3Rq1oeQ7kLqn?=
 =?iso-8859-1?Q?H82W5xgTcZRE7XoAI1zCh47E/QJdZagBV4GH0o/rB8ECypJ0YH0NrLZfqc?=
 =?iso-8859-1?Q?0Fts2PjZ+Ny+tk7NYbtOXmk6YQPHWy2z0TOd18TJ++llGFAuqn/Zwkpw8q?=
 =?iso-8859-1?Q?0K+8cGIeYhqNcZ02NGSqkRVJ6ZStZT6ik0li7itMWMn3lr5DHMsyTWd67w?=
 =?iso-8859-1?Q?xZFmFab8dtSFgvdCH/00Au9VXf+QSYNdfbGWChWvKhJJZC2zqviwq/UboQ?=
 =?iso-8859-1?Q?h7wTL07IqoN3tETNH0eMjdLjfgNk97iwtschZOrAuOCcApOiNEg2KJKEV4?=
 =?iso-8859-1?Q?h4UoiCP8+Q6ckCj6pFgAW2+w8tYcXer6hrZBVCIQ9IQ865BrQE81oqNMuw?=
 =?iso-8859-1?Q?bMO13mU340xRoiikdmHPVc26jne1W8H1eVbVOJCPpRb2qKR7+ljm9BxIw0?=
 =?iso-8859-1?Q?HafHVp8/h5IHr8u72rBxTVatAIPIT2fMM4YlHpCNAtncurQagkXD5BJqfP?=
 =?iso-8859-1?Q?Wr3cnc66M9L9JFtt+UhD1JHb3Ykv3F+7WQg+WTG/+yaZfKV1SLQPtPQq8s?=
 =?iso-8859-1?Q?NTsgxmxSDGqA/dNKc0ivmRvZ070tQ6lvxDlBxFuYiWFJYHnJb/p1o9g/+i?=
 =?iso-8859-1?Q?Cob97y3WK/l/3aNycIKX90VjTpZC3Qz0pGYYMn3wm1XMYuZchf8QUqIvs5?=
 =?iso-8859-1?Q?O+19FCIUl49mj2ccU2n4hbepUbqpDLtIbjimdNuCRi6fdWwZHP4wRU07l0?=
 =?iso-8859-1?Q?lOuJ0FwA2xqQ4XsN+o9b3P9e6vQm35/XWQ1WI2QO9F+PPyn0euGwVzrUrH?=
 =?iso-8859-1?Q?wbwTx/F3+OXaV2wpftiM8CbLCjAjh5antufkK9QZhaWjhlMDbr8pKDnzkV?=
 =?iso-8859-1?Q?Vzi+PT2JasA1IveGCQMmhdt7WbV/3as8JtGYV0f/e/veoWI8VSOKAd1I6E?=
 =?iso-8859-1?Q?P9nVdzE1oUlqt2h/rzjl89eCF35hGAEHfPPX5jXs33czPCL5hX8JoyD4Gm?=
 =?iso-8859-1?Q?h5+AwAjNcZIUL0ZzpyTgVbPT1phxkxmG6gFnVLSDDEXxQCOl7fL/jMyG0i?=
 =?iso-8859-1?Q?5lTlEHNgHUKr/3J7QD5GHSAWR3qLIO29g7m2D9bBffIvBf8l9kVB4KT23d?=
 =?iso-8859-1?Q?yM8hXt5YVLqas=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vB8FQcsjVQUenDEY9SH7d1Wwb0vJw6K5lcvShssxOuIGYuzUyGV9/6ZVXl?=
 =?iso-8859-1?Q?xzPXYHk0ex9Ce7BlhiMdpXY48VDPJiUMCO0iUqTo54Z7gMr+UsAd7rOROf?=
 =?iso-8859-1?Q?SUwxGxODzJ4tUFjTr8hD5TetxRX4jwDaNhVX4C6PHs57YzJX9LPFjbz3Gg?=
 =?iso-8859-1?Q?YR10qmZLsUxJ7SGmRKly3pkSicFc0j3dapNESIsPwNSyYKqTVTcXnhyPNM?=
 =?iso-8859-1?Q?3dlpFuGNJkire9YPPOHwxm9lmyIvex8BiyDegkjXGM6WHamH06DMGOj1Sn?=
 =?iso-8859-1?Q?CT6LqJcOdoMZMqSlWZF1qo5KSSPxURDVmPJ/MvUxBAA1KaAygEKFkbnj6+?=
 =?iso-8859-1?Q?E+xAfy99DEIoXlW299+tyJ+NHgLbQYDyGcKXQ3DPCiLSjcKJf+3iVgou3C?=
 =?iso-8859-1?Q?vxMOt4QxQAkgdyYCIcrxs3jaD7kdshENNp9/pOGwsdtHO7vTjA5Yot6QUl?=
 =?iso-8859-1?Q?qzz/oCSBQnOgtojq8MrxwODrWRoYxSDOdLAXJ2gQGuCbe0w6wi8Q6TCUoH?=
 =?iso-8859-1?Q?PJJXx2Ihqo9iTePEHQDb6uXqUuq5+pE1XfIn9X1WDZ/d0GKImfg9DFt5U4?=
 =?iso-8859-1?Q?HeJwcgwrrqNGbyuyGqwqJDUrRcWXPBA3t/+hGb+xqhBBaXzHQvXbzJySqc?=
 =?iso-8859-1?Q?E0dlnHN2WQmNQeEwfFuSh4lvo9ZhL5MIwDtlz0R6s5EvW7LIyiY3JiL6l7?=
 =?iso-8859-1?Q?3O2pzjtzasK2TPRF3BwAAp4r36Pno2foKRsXUjW7x1I6Z/z+7yTdyGbO3t?=
 =?iso-8859-1?Q?GQOQ4esMSMj3Ylxs86O9bnYCuhWQsYTaLA3CqxlPHDSeSqDNepcQKXD5u8?=
 =?iso-8859-1?Q?bsMq4w+BNIE2bgUwyQBcIHrtvMgUrfDVweHwaXllxf2iLO8LOsiQi6Q08I?=
 =?iso-8859-1?Q?4U9lfWh3c01zrQb5rIdByehqFTz+qzlHqifP+b5/z6whpCjN9N7BvVNxqf?=
 =?iso-8859-1?Q?ORU7tjhMUZqUeYe0VMfV1MYclCkpwRqfrQlyydDnRHhBXXUob2Z22R72ue?=
 =?iso-8859-1?Q?53QjZEjmS8EnMoTVQqXQVzBxUdkPDz9Lc3lWFZn0nLWoJORRtXM9leR534?=
 =?iso-8859-1?Q?BF+H7BgNm0SKTQWgPZlNtsy6o7Qe4ABcXTvveaD8zOn3J5clMh1TDRmlmq?=
 =?iso-8859-1?Q?F+xccMzDFJyFFK7u/gDYlKIR8swOdlYGC1WX34X808QNbl+UvJBisZUdqL?=
 =?iso-8859-1?Q?MH4ZQcDWia0Tm3Q1rFq1YKBE1vFZxGH4/h8yKdVwE41hufO98stxMrLbxK?=
 =?iso-8859-1?Q?KbSPxWb9RnNP7+TGgByoSxwmGg7Fptwuln8ZRIv0w6DukovV+gQ7OYTbTv?=
 =?iso-8859-1?Q?Dx1loRDJnuSsmgm58EyuQYdAW1mzrqfyg2eP9UbmiBc+iyaDQh4KI/kb7k?=
 =?iso-8859-1?Q?LhJoDIbchfC+09hm5nBAPVi0swgSpkSN0qs3s4f2oTF6HWBDNn1m7iPQ1w?=
 =?iso-8859-1?Q?6uAWfzodpPBIP3LWDpfocQoYIVVfkqHf8Sa1pgtQgCU6OzQlBAqEbmLwhg?=
 =?iso-8859-1?Q?Q7/OBErDSr19GE6Iy9RI4QFOg+V3oi54PglPn6Nm7D0gLXeAIpx99jIzd/?=
 =?iso-8859-1?Q?O/nrWY408+zrjWdEZ+nKWo++e9fKjnhkGmonywHJHJwZV2SlhOkpCKcNCC?=
 =?iso-8859-1?Q?vq/RMojQ1ZM3FV+bxnHyA5PiC4vo0uOBDQzXs3CQyWH/yJy1Vu2OhwKPQu?=
 =?iso-8859-1?Q?SAh1tACXISeNEPVyj5cWE4GUXN+pHV3WlM0ai17jDVinMhFneV5ogfZVJf?=
 =?iso-8859-1?Q?uMeyYjZ+B7i4lBYdnQnx+E6frP/YKDngP4m4xr1olekT/Se37pCmN+umyT?=
 =?iso-8859-1?Q?Kl2wPr5y8g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 172d509d-ca69-4025-cd87-08de624e38db
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:28:43.5096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ESOWGuvjP3E3gH/hgUR0/m38EfcEvhMkVFhWg91WFaiLUV3Ifb1HXisCqTu9ZL5mgnSckapSRC7RJuVNjO15Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7354
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[nvidia.com : SPF not aligned (relaxed),reject];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[Nvidia.com:s=selector2];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[apopple@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:-]
X-Rspamd-Queue-Id: 2A7ABCBA01
X-Rspamd-Action: no action

On 2026-02-02 at 21:51 +1100, Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote...
> On Mon, 2026-02-02 at 21:34 +1100, Alistair Popple wrote:
> > On 2026-02-02 at 20:13 +1100, Thomas Hellström
> > <thomas.hellstrom@linux.intel.com> wrote...
> > > On Sat, 2026-01-31 at 13:42 -0800, John Hubbard wrote:
> > > > On 1/31/26 11:00 AM, Matthew Brost wrote:
> > > > > On Sat, Jan 31, 2026 at 01:57:21PM +0100, Thomas Hellström
> > > > > wrote:
> > > > > > On Fri, 2026-01-30 at 19:01 -0800, John Hubbard wrote:
> > > > > > > On 1/30/26 10:00 AM, Andrew Morton wrote:
> > > > > > > > On Fri, 30 Jan 2026 15:45:29 +0100 Thomas Hellström
> > > > > > > > <thomas.hellstrom@linux.intel.com> wrote:
> > > > > > > ...
> > > > 
> > > > > 
> > > > > > I'm also not sure a folio refcount should block migration
> > > > > > after
> > > > > > the
> > > > > > introduction of pinned (like in pin_user_pages) pages. Rather
> > > > > > perhaps a
> > > > > > folio pin-count should block migration and in that case
> > > > > > do_swap_page()
> > > > > > can definitely do a sleeping folio lock and the problem is
> > > > > > gone.
> > > > 
> > > > A problem for that specific point is that pincount and refcount
> > > > both
> > > > mean, "the page is pinned" (which in turn literally means "not
> > > > allowed
> > > > to migrate/move").
> > > 
> > > Yeah this is what I actually want to challenge since this is what
> > > blocks us from doing a clean robust solution here. From brief
> > > reading
> > > of the docs around the pin-count implementation, I understand it as
> > > "If
> > > you want to access the struct page metadata, get a refcount, If you
> > > want to access the actual memory of a page, take a pin-count"
> > > 
> > > I guess that might still not be true for all old instances in the
> > > kernel using get_user_pages() instead of pin_user_pages() for
> > > things
> > > like DMA, but perhaps we can set that in stone and document it at
> > > least
> > > for device-private pages for now which would be sufficient for the
> > > do_swap_pages() refcount not to block migration.
> > 
> > Having just spent a long time cleaning up a bunch of special
> > rules/cases for
> > ZONE_DEVICE page refcounting I'm rather against reintroducing them
> > just for some
> > ZONE_DEVICE pages. So whatever arguments are applied or introduced
> > here would
> > need to be made to work for all pages, not just some ZONE_DEVICE
> > pages.
> 
> That's completely understandable. I would like to be able to say if we
> apply the argument that when checking the pin-count pages are locked,
> lru-isolated and with zero map-count then that would hold for all
> pages, but my knowledge of the mm internals isn't sufficient
> unfortunately.

We don't actually have a good model for pinning device-private pages anyway
so I'm open to discussion, but I don't think we need to do that to solve this
problem. I would appreciate it if you could look at the proposed solution in the
other thread a litte bit more closely - AFAICT it should address your problem
by doing the same thing as replacing the trylock_page() with lock_page() without
requiring getting a page reference, etc.

 - Alistair

> So even if that would be an ultimate goal, we would probably have to be
> prepared to have to revert (at least temporarily) such a solution for
> !ZONE_DEVICE pages and have a plan for handling that.
> 
> Thanks,
> Thomas
> 
> 
> > 
> > > > 
> > > > (In fact, pincount is implemented in terms of refcount, in most
> > > > configurations still.)
> > > 
> > > Yes but that's only a space optimization never intended to
> > > conflict,
> > > right? Meaning a pin-count will imply a refcount but a refcount
> > > will
> > > never imply a pin-count?
> > > 
> > > Thanks,
> > > Thomas
> > > 
