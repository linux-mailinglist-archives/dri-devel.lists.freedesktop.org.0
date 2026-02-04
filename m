Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE3VLoMmg2kxigMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 11:59:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1875EE4D77
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 11:59:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6D310E5E7;
	Wed,  4 Feb 2026 10:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="V/CVfNsr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012067.outbound.protection.outlook.com
 [40.107.200.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9EA10E5E3;
 Wed,  4 Feb 2026 10:59:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qa384mHba8ba7lRPh15xfNmuM3A4mddTw2Qsaocu4RPQED/ehJGnHhp1/tjFKvQ5cgnCDKLfsXrfIke5Q3ee5u3rV+sKEYBmTFBJ3q67VC2TcOnEphDn2zU2fCSb7EO89UR3FVtphx7XrqLX3aTsBDBNCBAGIM+DeQHnNx+YC2MN5KrplqLbIbE0FnC1zEOlER8m4mrDLu7XU6/ryb1IYexQFI1LmlVVcVoohiWOJvtiniaoOlgX6AfCVY9Dc+61f4hcQv8cE4cP51ZTEzDKAfrvCAo4YC1KKYI1TUHfOp2Hk/RA7/BHKKFrg9WZ3N8Xr+LJ43FKhah4Z64rfMsKfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jehpltHLsBoRmQxy434axTlFgBBafylWk0bWGmb9jA=;
 b=J+268eWlrlx8K8cwFfmNSVRr9FrRukW+IQJI/8OsHPpJP2UmG5/1W5YqtK2XVETeAtjl/sC46UoJHvi7ktvHAahSc/tPbtls6vV7WnxmDY3p6Iby7/vQmjQziAH1EDQnzIKzuE1tQMTpmzmu+PDtNXB3VpQ0F72D9IGUPqBXLKMK8EFDzOLSWpg2bSCyKAki2qrVnibEAc28Ce2xDV6+qSPafOOfc38IKiS0vfm1F3O0cm+Uyk/So4aPHxrSc6MwqBI4beBbYxaGuTN8zmg4gO34HjFPzeBkqknl7xWlTPZcMwGsjM4K4vwNfYRqWlrtj+5sR9cVeNYTm49RY+xR9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jehpltHLsBoRmQxy434axTlFgBBafylWk0bWGmb9jA=;
 b=V/CVfNsrXeC9N50buR4HhL7llIVrLbWWMlLVXFWYpkrlQXtybDfx+tGTIUugxMlBgul8jQCj6XfDXXVNm9C6neHTVBSZx2yKuPfc7M3R7gH/G49+S6o8HMbepoBwUDU8PjCoWuApcKGmr9y5SadiEgDskv9PMM1EuTbKoh7sHJJKwP5xh5KLBTsaqLvzzRDbROC/th7NJ5UUcA4Q6rmBi1kMZ34/OWFUQeKisvH23wf/JSdhEhPjNSJStQaOhqjhDNlYVh3wp48OPZ2y7utjJ2LyIt5mi6zA/peFkoIWr5dip5PJsfmqTf0F7LQ4mOAAoxnBBJayR+56WqAPbqzfUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SN7PR12MB8027.namprd12.prod.outlook.com (2603:10b6:806:32a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.13; Wed, 4 Feb 2026 10:59:07 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::5807:8e24:69b0:f6c0]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::5807:8e24:69b0:f6c0%4]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 10:59:07 +0000
Date: Wed, 4 Feb 2026 21:59:01 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Ralph Campbell <rcampbell@nvidia.com>, 
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Brost <matthew.brost@intel.com>, 
 John Hubbard <jhubbard@nvidia.com>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] mm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-ID: <2mts4ijet6ezaqmqgzfljiptv6dgqduzhn6sfxvmec257j4beg@tuj322lx3j5y>
References: <20260203143434.16349-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260203143434.16349-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SYBPR01CA0185.ausprd01.prod.outlook.com
 (2603:10c6:10:52::29) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SN7PR12MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c0e199-2ead-4a1d-2740-08de63dc6b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?sNNPmEDNqHPLQL0LFzn2qsvb34tmhdVnthgrLmK1VGVLnmXV0eU8MJZnvI?=
 =?iso-8859-1?Q?cc4J6pgnKNpmVDH+qMY7ZMZaptC9KCDSm949RVSRSBifqCd1dcDJEGkz4Q?=
 =?iso-8859-1?Q?V9gSLcBRytv6LD3tzS6LemDjakHAA8BYxrZdAytqDJS7/OHhjlRDEEGLX4?=
 =?iso-8859-1?Q?k4km5PlJoVeKnLTBhWlpqAE1nbADbwdmmxYpeipz+6vPxTEWURi4XJC6+6?=
 =?iso-8859-1?Q?+L6vjH1Sf+f8zREzJDSnj3xGqaid9IanfW9hcoxgxINdCuKXZMII+NRVP6?=
 =?iso-8859-1?Q?knWCkTU87nyJVyuzcqAm9zEMUcKSOApixXvSxRQ6GpOAEcDRdODL23x5fj?=
 =?iso-8859-1?Q?OzRYbX+74olR2TpXSfrTW5ONo/2ndFFJdNgjDmLWmczQ3xdt/VIWRnl9tT?=
 =?iso-8859-1?Q?is7PaNKkRWU3AjVBTCoxobkzld4J0h6jMxkwslrotojJ/c8sIMtEE3XIQ+?=
 =?iso-8859-1?Q?qCSQ3Aw32wdYjjHD7qUQAgZQT90FBPjB72YrJAhVNDnmCeLec6BTnoyY9O?=
 =?iso-8859-1?Q?ESY/ePnUF+GeKvlQN1p6mgadLX4Nc+uTGet0V2sA3oZh5vinkXleqfp8VM?=
 =?iso-8859-1?Q?XINZNXSQee0EfVdWH1kMEbCk7Eq1PmPde93hBhzS+O1xemiQLFroQsX7Mt?=
 =?iso-8859-1?Q?QAzb2Qgku2KJ6oXVkQ0Rb7OloB7t+ytgVVEUWQIV+olIEijAjC8et6HuCB?=
 =?iso-8859-1?Q?cBlaIsOzw2CvVOjMafemCbjO4R6tyopqB/Yd/HphMGHenSyrKosTfxM1u9?=
 =?iso-8859-1?Q?enMs3qh2y5jbJ8Zjv4XFMxe9LMhtMxTp3MbXFSE0geS65pvMOhZhofh/q7?=
 =?iso-8859-1?Q?m7YpnfNZeXPHou118PIwiK5vf+tm3twaUuc5m13dZWS5ufT0Nq9HjuZ0E0?=
 =?iso-8859-1?Q?TfHhNvmavznS5KinULv7jj1WF01AW2nU28LEKAL+/FbE/wr3cRnxuvQf8a?=
 =?iso-8859-1?Q?BxFhquTXR+2bgNjoUxlF+TvS8uPLBN46qmINEmgpl9uFlEebgbyR2sb/C9?=
 =?iso-8859-1?Q?f4HwK2tTeD1KrP4gzfNasEp4xHobj49OaxPTdlrZUKb8Scm8eYDnq+vDrW?=
 =?iso-8859-1?Q?2GSKCBMCqiW7Kq2+1BHUkXFF4JGCVplAsU+zNnXY7pKNGimh7HTf9OLBN5?=
 =?iso-8859-1?Q?loGO6CwmNe9ubeND2L4xX0Zzb15MRuNbRkZ7LSMj1WDzOCsOaHPdWneTlI?=
 =?iso-8859-1?Q?SnxHUuEF9aJQX8/nCrNlsqa5d4DWWqqxM010F3cnc7bVY2DlMAXSS+rqIl?=
 =?iso-8859-1?Q?i679YyEhSKH6GLsoT76dwnb8+2ieLW9xLtxyeoT6jG+MHvKbu/6EoOracz?=
 =?iso-8859-1?Q?DV9+o/IWhDfrIHx6WCuHAIlS8x8QvyvJXyupvVnjPlhLYT+2O72AyG+tVN?=
 =?iso-8859-1?Q?XQlcTUHtLtqdfpwQQ3k1e17LSO6CbInQXKy/TP/A2O1QcDsAj9eSLyV5DS?=
 =?iso-8859-1?Q?coMS9zzPXEQuIPFLyct9Qk7wg0rW/zfiP8tqLvcbUmOhTsbXiIxbqTO27g?=
 =?iso-8859-1?Q?O6DcCcgSv5cdpkDkOHXNPE2PnVGuUjZP3kmH3arcr83HFpPao9P3OLYlgI?=
 =?iso-8859-1?Q?/zC+NFmZ2+5gVzn9es40pw4xymW6IuZ4lNUQnBhhWHDVSCrhhUm5CUIrxD?=
 =?iso-8859-1?Q?J5xA8/PqTRwYc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vxOcJyF0TUhxG2v9WgT72zkrs1gO3g7pfxV6/8UukjqaHBKlhvAj5ktEGu?=
 =?iso-8859-1?Q?Va685LFcywMZvofu9I2K79ANa7ym3seZuVWWrmMzLeO3tTVLT6XAgM2Psg?=
 =?iso-8859-1?Q?S9SUQEGNLkc5KKIN4yOhqYtPiQFhlIdyigLfgcBgtOXRtzkYYE78uvsnpP?=
 =?iso-8859-1?Q?Ppc6/0DH6EyvJ+ecF0TCBPjJ1GNIe1i6sKSOE8p2hNkq+CyTMiYBxWpks1?=
 =?iso-8859-1?Q?kET3KScJvhWNpxuaJ6dePzwXXfMFAeWYyBVu/sA6bweTf615fgrBmv7yFl?=
 =?iso-8859-1?Q?frFZ5ISlQe0nzxWsaouwhNzoaGxJI6XYqtZOgll3GfD9rmAnxulB0ZHT2n?=
 =?iso-8859-1?Q?CRv0+9YH8zk42OeMmqYmDLknhZsrpdIQhm8nd9XCrHUOLmWE6q9a8N3JXO?=
 =?iso-8859-1?Q?gCVJm4SZZ8FR/hdVcs3pGNExIXpLgl3/aSctM30Lk9/BuA8/Tfo1Qs209U?=
 =?iso-8859-1?Q?ljelUSjoXUzpOHUHu/nydg0iT+f+vx6yGi6e9dwyF60OZZBvTvjBO3heT/?=
 =?iso-8859-1?Q?yJyK8+eK+Hpu+wUzaBLp1f14dh2YdlLRh2yptTkErXMpGpvrD3JlSBZL1h?=
 =?iso-8859-1?Q?I9PKUaK98VCEW8/ZyDZMArifPitYD5CqDEp3sHaXzm/06DbKnR16ObEyNq?=
 =?iso-8859-1?Q?kbT0Pv5vqBLe0VlAwPIbDIRVnQiWZQYFk4It/afLIg8DyrcbtUQ/2BD0kj?=
 =?iso-8859-1?Q?2RnvDyqwyWxQeLRLyVsZhYhckrR2WdiSS4gsxC4FPR3FSphuvNUe7wnL/U?=
 =?iso-8859-1?Q?aDVwzrvtXAuwK/IuILcUXQ0MU0+bNaMGB88tWXOSTz/s8Qn6q714nGK9Hm?=
 =?iso-8859-1?Q?j6r8k0KrniuFC1DaX2y4xMDgZY1MapapsH7Amdo8o6uatOisNBKzfas9SU?=
 =?iso-8859-1?Q?9ZsmCuS7zQdOqVkwN44h1daIIzCqPeHS/+kM0GuX17EaIwkcKzvY2+PlEF?=
 =?iso-8859-1?Q?kZgSmofvOGTryf4OfEFSQiVRIA0Hqhz6jwGzv1/L9m9P0SvqhVcwJl61+S?=
 =?iso-8859-1?Q?/yL2RwI1VJPQWbmRl76dtrcCZJUcmYN4RHqlLusDPkqXQhVSfHWkx9hqU7?=
 =?iso-8859-1?Q?osLUzWfeJ+4+vHiDD5R6oKF66ysBLOtM9yYuxd80AW1Xm9vyCAtw6ecg/k?=
 =?iso-8859-1?Q?k2TOSOoWx4cgeeMSXaUl9kB+iI8aXOUdrs9X7Qd2v7rvPj/AxKBkD2EdaO?=
 =?iso-8859-1?Q?MzYlskeNiAQ4y0NeZoAZCIHuWObHf7cF+zNiTaZkIlBWYJpehx6UxJb4RZ?=
 =?iso-8859-1?Q?P9sTKtFsWggRqCoq6sxHNSga201pHoBWU7k4EwmIi/XeiwWS8YSL8DB7D8?=
 =?iso-8859-1?Q?m0SqbGxNaaQTul/OftCc/oy+sZKpt/nbSUtll9w0k9JNKs2FT9qgzA0Ayj?=
 =?iso-8859-1?Q?r/PQ6u+hUfidvpQs8fJLuIABKoSmuC8kHI0H5xMgKOEWxzFOQKn/06soHs?=
 =?iso-8859-1?Q?X3wcULv43XJHZq1w3PhC5oUQls8boMJAWEgkEjvMBcB+KgAVC4ipkvlFs+?=
 =?iso-8859-1?Q?cb0I33KvkC1xdIf0QHnan6o6yhO/gZVO3AQmRkeAyPspHyCu/jCVwHfsfE?=
 =?iso-8859-1?Q?1V9wV5sf3u8l9REo9UIej+m6hGN7KZoB8Y6FyP1OGw2dypXgWebj3Nx2hi?=
 =?iso-8859-1?Q?tbKedo6XL58Nu4mO8hkoK4wNjQMOlCJiZp01iIsHtTq2adSIDjpd8i9Cyo?=
 =?iso-8859-1?Q?a05+mNke/EseFKFkOjAPIMDIh5EWzFIkG5gSDYkM3xpIdcEOC+3Lt0CMfp?=
 =?iso-8859-1?Q?F3ICFSy+ibA6SR0Er34JM0hFJW1glt+XTk1FFJ2sLY/2ko6s0vlXX86KfB?=
 =?iso-8859-1?Q?eAreWo72+Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c0e199-2ead-4a1d-2740-08de63dc6b04
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 10:59:07.4386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdOoOTRFtPvabNk+rAIcokcAMQpo7KztXHKRXHmFuYWNj2zdxcnlsxNJsROsSTy0wQLnn61W4Ug65ehNNhWuTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8027
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apopple@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:-];
	NEURAL_HAM(-0.00)[-0.979];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,nvidia.com:email,lst.de:email]
X-Rspamd-Queue-Id: 1875EE4D77
X-Rspamd-Action: no action

On 2026-02-04 at 01:34 +1100, Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote...
> If hmm_range_fault() fails a folio_trylock() in do_swap_page,
> trying to acquire the lock of a device-private folio for migration,
> to ram, the function will spin until it succeeds grabbing the lock.
> 
> However, if the process holding the lock is depending on a work
> item to be completed, which is scheduled on the same CPU as the
> spinning hmm_range_fault(), that work item might be starved and
> we end up in a livelock / starvation situation which is never
> resolved.
> 
> This can happen, for example if the process holding the
> device-private folio lock is stuck in
>    migrate_device_unmap()->lru_add_drain_all()
> The lru_add_drain_all() function requires a short work-item
> to be run on all online cpus to complete.
> 
> A prerequisite for this to happen is:
> a) Both zone device and system memory folios are considered in
>    migrate_device_unmap(), so that there is a reason to call
>    lru_add_drain_all() for a system memory folio while a
>    folio lock is held on a zone device folio.
> b) The zone device folio has an initial mapcount > 1 which causes
>    at least one migration PTE entry insertion to be deferred to
>    try_to_migrate(), which can happen after the call to
>    lru_add_drain_all().
> c) No or voluntary only preemption.
> 
> This all seems pretty unlikely to happen, but indeed is hit by
> the "xe_exec_system_allocator" igt test.
> 
> Resolve this by waiting for the folio to be unlocked if the
> folio_trylock() fails in the do_swap_page() function.
> 
> Future code improvements might consider moving
> the lru_add_drain_all() call in migrate_device_unmap() to be
> called *after* all pages have migration entries inserted.
> That would eliminate also b) above.
> 
> v2:
> - Instead of a cond_resched() in the hmm_range_fault() function,
>   eliminate the problem by waiting for the folio to be unlocked
>   in do_swap_page() (Alistair Popple, Andrew Morton)
> v3:
> - Add a stub migration_entry_wait_on_locked() for the
>   !CONFIG_MIGRATION case. (Kernel Test Robot)
> 
> Suggested-by: Alistair Popple <apopple@nvidia.com>
> Fixes: 1afaeb8293c9 ("mm/migrate: Trylock device page in do_swap_page")
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Jason Gunthorpe <jgg@mellanox.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: linux-mm@kvack.org
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v6.15+
> ---
>  include/linux/migrate.h | 6 ++++++
>  mm/memory.c             | 3 ++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 26ca00c325d9..800ec174b601 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -97,6 +97,12 @@ static inline int set_movable_ops(const struct movable_operations *ops, enum pag
>  	return -ENOSYS;
>  }
>  
> +static inline void migration_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
> +	__releases(ptl)
> +{
> +	spin_unlock(ptl);
> +}
> +
>  #endif /* CONFIG_MIGRATION */
>  
>  #ifdef CONFIG_NUMA_BALANCING
> diff --git a/mm/memory.c b/mm/memory.c
> index da360a6eb8a4..ed20da5570d5 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4684,7 +4684,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>  				unlock_page(vmf->page);
>  				put_page(vmf->page);
>  			} else {
> -				pte_unmap_unlock(vmf->pte, vmf->ptl);
> +				pte_unmap(vmf->pte);
> +				migration_entry_wait_on_locked(entry, vmf->ptl);

Code wise this looks fine to me, although it's confusing to see
migration_entry_wait_on_locked() being called on a non-migration entry and
ideally this would be renamed to something like softleaf_entry_wait_on_locked().

Regardless though the documentation for migration_entry_wait_on_locked() needs
updating to justify why calling this on device-private entries is valid (because
it's also just waiting for the page to be unlocked). Along with some equivalent
justification for how we know there is a reference on the device-private page:

	 * If a migration entry exists for the page the migration path must hold
	 * a valid reference to the page, and it must take the ptl to remove the
	 * migration entry. So the page is valid until the ptl is dropped.
 
Which is basically just the page is mapped in the page table, therefore it must
have a reference taken for the mapping and the mapping can't be removed while we
hold the PTL.

Thanks.

 - Alistair

>  			}
>  		} else if (softleaf_is_hwpoison(entry)) {
>  			ret = VM_FAULT_HWPOISON;
> -- 
> 2.52.0
> 
