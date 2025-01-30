Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B724A22EB0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 15:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B65D10E98D;
	Thu, 30 Jan 2025 14:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iO5lIBQB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F095510E98D;
 Thu, 30 Jan 2025 14:08:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMF5W+o/NSy0Qn4SFOIhe9Dnw/5Pp+uSpDRr78d7Q9kcvjnSsJtT4xVsyK1oOA9mp2dpNiFa+fw+g8BBOIue1HqbP/GhVeGgccCZpfhORPZMwzqMzfluYMPKur/cZYH4Si7JzylhkJTo7fbloYSi2sF1iyNiM/xlUz4dn7pk72pIeOv/eIKwt/oBmVU9Egl20UG7H00TGcdtUxItTgtSlf3Lve5gMU58TMkK5WgqY2rxqyPPxOBz5u0WHpTCcetKXW9JsC/cfN8oyVv95bU23T1IBzYZPBFlCyIlNDYjvtc5M0e1fHpj3Pi7n1dmBSvi/BVR+GWjSFNK0lQDG3644w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVKrKUm2zojmnP7ZlMPfQYyg8t657KC/bf1LMjJaFf0=;
 b=HR5qkrBU/Z/eQGui4v/6d/B7LNAiwEW85FCI0pMXq+LnhmV5L6ZQfN1qjR9P+HWaI+RgIHbM36OYxZ8HwAIPssdzHp1hGyN3LO8HgOMcdt1IDiQTrnW0pLjTO2PmVUiTNLMGJK8tRpIgtQb3RTTWZJ6QEbF5SRMEm9lt1qKD860wTadYsYZDjDqPnOqADpzNvrxkcwBaLYj9Igsc+9l6aiULR54gSz9NewhxHvg6LE/7CBhE2AiOOsMRwArld3A4qakZivmHzoxklhw5MR5D6+BTZIzded/FjuDCdGa2Ssjn+/1WA1Ry/QfcwupLY72XtzPysVIc5jzBWs3cC2Fq2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVKrKUm2zojmnP7ZlMPfQYyg8t657KC/bf1LMjJaFf0=;
 b=iO5lIBQBsmSn1C042Du7xRDH9T3dq4Oc50ayyDs8670LUgXib1M0HSm5x5hBYyTCcRAvAKx0Yd6KhRW1xWufo7NtfQwaiRBknEI+Ggk+eIk8GIc01I4VMH9wyxCI7+WTy68FjCh2GTo0kGzTZyq3yk9lzTMOjnQ7tVdmV2BDTvwERO/nALsq2XNgbf8A9JAldTzsUy4eJmFVvc+AnDP/uo3Emo001Gc9orexej/eGstEi0ewXjJqKA4h+A8yWUyXUBFvz3LwnucXMOr0932eYuFT9ShNPmDQ7XI5QAGEchHr6q8ntTcluPs3CVVBMr8v5otXfdYEX04JvL7OI2QRrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SJ2PR12MB8012.namprd12.prod.outlook.com (2603:10b6:a03:4c7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 14:08:33 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 14:08:33 +0000
Date: Thu, 30 Jan 2025 10:08:32 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v1 08/12] mm/rmap: handle device-exclusive entries
 correctly in try_to_unmap_one()
Message-ID: <20250130140832.GM5556@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-9-david@redhat.com>
 <Z5tQL60SNNGCkfQR@phenom.ffwll.local>
 <59feb709-dadc-4d19-857e-49320cca3d98@redhat.com>
 <Z5t5RKFwl34vpqU4@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5t5RKFwl34vpqU4@phenom.ffwll.local>
X-ClientProxiedBy: BN8PR16CA0016.namprd16.prod.outlook.com
 (2603:10b6:408:4c::29) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SJ2PR12MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: d0efc02c-3544-444b-b6b4-08dd413794a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OLIQX0gZGMGbWzgw8aVl0nO0rJvPrGr2aMYu/TkGErm9ehthl7FcLyqlhdMT?=
 =?us-ascii?Q?mZcPiO1nSxkvXZWyhIMLLD9LPEcpQ0OEBdVaHNpcgQ5Dhm5WunF/Y1Jh4BxH?=
 =?us-ascii?Q?Kvd8ABb/TjgGu/kFihfb+gWjGPSov0oCXWK0NFC5+IH/M0Yx+kFWOu5r+mWg?=
 =?us-ascii?Q?pnCmJkJkzeKJdNko2AkfhdBbWBCesXfvdcAWv/lzKWChQM74+WD+TynEv1RQ?=
 =?us-ascii?Q?SQlsoYcum72AKJ0Cxff+fH1w3lVVc4RilRCnS46K9Wf7lBZPggMwy+RT2mDO?=
 =?us-ascii?Q?CBhjI3tjls9KgVN+Vuvi9DO68QOQvvMKq+9zLuKfukaBg7ttD5Ju/GDv5CHX?=
 =?us-ascii?Q?RkLyZBTUiyyMJXFZ7wQeWZVHunKvFa+FmluLzcMWH9KitfJNDtyw3cpNfXR6?=
 =?us-ascii?Q?O12CoR+lDL33UnB3drRTsY14clUiAda/iBZLymRNzkQQ7w+7lOPiEN8inT62?=
 =?us-ascii?Q?8SLolQEWSAWUfcy5mmKLdpQPypLQQJYNtzFFxg9aeMtqFvmRazBXF6SQpuvi?=
 =?us-ascii?Q?E/lOkoBcvmeJsu3arNFQFwtrBkA6CKLT1WE4rHQb7vjWEETQaYHNn3N6dIo3?=
 =?us-ascii?Q?UIBAz9BwzF2CSSKieRHzwJDluAeD2N6ZoMuU0dBiobdRliU/dzkAqLaQigy8?=
 =?us-ascii?Q?KPwfu0l1KXykDsrGzYB85JJcqPXcu3OiumU1dAkueG71qR33Q05YEaVkVAq5?=
 =?us-ascii?Q?+G+/o6UoAVvQ3CH1//n6k8R6RNt8Oi1iiXwRRkgw9w9mjLqkXlvsHexQcdl+?=
 =?us-ascii?Q?C/VXx8C9HQQD53zlpt5yMUZuk2VCIi7xzFZdwCkkI8ah9Fw6WLHs8LeUkB7W?=
 =?us-ascii?Q?ydsleJ2s4CHkp5i0PMyiDIildJp9hR61vJgwhMryDhwgcw7OrBQNev68BzOq?=
 =?us-ascii?Q?8QQ5Ex5X2gAkx9UYxL/3zRuRgBZNlvfTQ8TGvc5SizWKdMFPYLDmaP5Nkz1Z?=
 =?us-ascii?Q?7KwtHWi23FHNa9jDkNnokI8Poy3wOJw7gcUfAZryrf9o0zyVtXb7QVUDpH7w?=
 =?us-ascii?Q?/Zg49WUkLZGJwmZZXngwL6Z3lSF8uVv7hCoYr6bia+9uc9NU061m/Kmhet/q?=
 =?us-ascii?Q?Fus4FPaIYyTKU+n2Ws7FSWj2gp3ZRFuoUKB0KQEc0g/C4XtZCTH81Mq9fl6E?=
 =?us-ascii?Q?u4AylSy+rH8u6CA50aUtFu1186fX5zs/DRqc1hHyBHF0/5VpzMbFmrAkFWOA?=
 =?us-ascii?Q?H6GaD2Bo2s+s3LqJ/xyvmqzn5y05S9kqCvxE2qQk1vcG3EB/mk81YympCZ4y?=
 =?us-ascii?Q?KTT9Oa41m1J6OcUvaiXhSd2k0sJ0GEj3ilKYN/JXs6JJO3pOH8n49IT0t7/a?=
 =?us-ascii?Q?0fbFf7vy98SQg+CQF0wGAc8gyaS/ebstiQkX5TCe3VLihP30b3ab1MO50GWa?=
 =?us-ascii?Q?QJYNufpfXgdtBMn+l7WYFAAWYKF5S0BwOPdboQMRLJ7v/+bgcqbajxdSKOMN?=
 =?us-ascii?Q?t4cyQIBnleg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lvqYAbFMzlZXIiM1Eh0WMAWPrmx2bOgsKGtsLN4qSvnDa2o29/zuWwn9YlQo?=
 =?us-ascii?Q?Q+SDF0rkpaYR3pxZgC23vr7znjhlMuG76B9Mi0vkoM8qxnh52oQ7kAkeNMAD?=
 =?us-ascii?Q?eETfswwoG8/+da/Nc+0f7jCNRH6vSBIHQtDHIsg2OGqWBpyPhG7Iq28CVka1?=
 =?us-ascii?Q?/0FOe1oof965yjoBH4xW9x/o1SiNlTm0NgShyWr447nntGiIGeI/UQfkKdic?=
 =?us-ascii?Q?dU5f32ZwidyHnmo5PlRR1fghpCO5BbcAux+Pq5nmOcSeeOVvXxCaWrBQRQ5s?=
 =?us-ascii?Q?zDJBASRy7vHJJ1FfnnAR6JLMfIYOeN9TELPsCIj2R4eMz9Ty4x9U+uSPku6B?=
 =?us-ascii?Q?aK4jwIecMOCuSDiQKEWhDREeoCLt8D7W/xo1sSzspqKY+XivhP/jcQNLryug?=
 =?us-ascii?Q?+EPgu2VXLB6hBnGCCQeiCysQCzIr791UWxZbSQYj6gwR5m29oHvW4qC1ideB?=
 =?us-ascii?Q?TRRfsVDkXhvMTJ+p3+V30u4GTSN7v7o3JRNGk9q3jbh7vtZsAL1F6hym2tnJ?=
 =?us-ascii?Q?bNnomuTno/5gyXk5B1s1fPZLsrfE0Hr0Evea3bkGW5ASchnxzxFbdK5Cs8lO?=
 =?us-ascii?Q?8dcBinJVyHFOo13xQROkPpPVkolva7LxhMWTzNVz6o5zELx5m7WHhnLSEa5x?=
 =?us-ascii?Q?y6d6zoLcHXqWvIbRsR5Tz1hbEJBgn2ZI4VpOUJZwXRfcwtO1eUmTQZi4Nl3c?=
 =?us-ascii?Q?ab60FlVWIJAxHlXnJU3K38TBgCBlPwFVit5vhKq91gZeqUZ7rOTgz0jeZsGa?=
 =?us-ascii?Q?i9j2CpZC2jPaoTAoNVFEzFfPHTYH7bUAQdf3O0rdTr02ZZa/+OC2FnztKhMm?=
 =?us-ascii?Q?diNOvJDlMPYed7PE0jBycDXpVqlG2GogO9xbeD0VLeX4WqsbH2/tmSR0aNd/?=
 =?us-ascii?Q?RJ/V7OyUeChPpTp+8A/mp2dD/jGLDOZCKs1EZS0BF9WAPzY0WfI2SvIZpDtp?=
 =?us-ascii?Q?Bkbsuf/89d/G92ZNlKAtaBP/C7VqufODHaCbw0H3H9/x82Dabg7UDpMXuJHi?=
 =?us-ascii?Q?2bo3WlrHp5iTVBZ0cqqIAUfz8wEXT+0ekNBnsiQnXAQxRAKM4kv7guJBluxt?=
 =?us-ascii?Q?cz2xl4PK1R2ycrGigu/a+BsjlU085EbpJWbJ0113TAwfbXR0o1SkjJKD42Qy?=
 =?us-ascii?Q?wAMhU9uQhFNNNs5y2/wzsJBqmfNyPvun2qgaTWz4tflZCwjA5y8P7OE8HIMJ?=
 =?us-ascii?Q?wu0Ut9a44Jv6Mc2Rc26ZUxUZqOsS67wFdLpe2KZ+cB11EL8K6W8NwfsRSKYn?=
 =?us-ascii?Q?F/i28/zkruZ3+ExvYuLzSalb1IpGF3blQPQ92PxP+MYQCBwpv/9xgpySoKM6?=
 =?us-ascii?Q?/clXtQ6z1BXA5J7vyZpBs+JPP2Vvqq5HAttAAGN4f+VqcZLUV+2EjOUn8wTX?=
 =?us-ascii?Q?VZnmTVnnyx1GcXRzIWBMuhvDI7lVG82xZrp7qCF5ZIfvBZk59Muz+7kvr4uP?=
 =?us-ascii?Q?/lzOPdDGFPhT2bx2bu1RaTOG0GuupjOfZ+HsImp/jUVB2WsBSfp1LmZxiRHl?=
 =?us-ascii?Q?UZTbJFMggZHsgIDTG4ooacW6u+GAe7yslsyu34miTQGqdYDdxhEehPiLWqbS?=
 =?us-ascii?Q?tiV/2cVKHDtPjEQIeDE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0efc02c-3544-444b-b6b4-08dd413794a6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 14:08:33.2140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JclOrCHgiypMNGIsI2Na4bCaOuwa861AOxikFXw4wDOpzKtmA1Gm/2/mHuZpGquJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8012
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

On Thu, Jan 30, 2025 at 02:06:12PM +0100, Simona Vetter wrote:
> On Thu, Jan 30, 2025 at 12:08:42PM +0100, David Hildenbrand wrote:
> > On 30.01.25 11:10, Simona Vetter wrote:
> > > On Wed, Jan 29, 2025 at 12:54:06PM +0100, David Hildenbrand wrote:
> > > > Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
> > > > we can return with a device-exclusive entry from page_vma_mapped_walk().
> > > > 
> > > > try_to_unmap_one() is not prepared for that, so teach it about these
> > > > non-present nonswap PTEs.
> > > > 
> > > > Before that, could we also have triggered this case with device-private
> > > > entries? Unlikely.
> > > 
> > > Just quick comment on this, I'm still pondering all the other aspects.
> > > 
> > > device-private memory is entirely owned by the driver, the core mm isn't
> > > supposed to touch these beyond migrating it back to system memory in
> > > do_swap_page. Plus using rmap when the driver asks for invalidating
> > > mappings as needed.
> > > 
> > > So no lru, thp, migration or anything initiated by core mm should ever
> > > happen on these device private pages. If it does, it'd be a bug.
> > 
> > I was not 100% sure about HWPoison handling, that's why I added that
> > comment. In other regards I agree: reclaim etc. does not apply.
> 
> So maybe I'm just entirely lost, but unless you have a coherent
> interconnect I don't think hwpoisin should get involved with device
> private memory? And for a coherent interconnect it's just device memory,
> which isn't treated very special.

I'm not sure it is meaningful, but in principle a driver could keep
track of the poisoned private memory using that struct page
bit. Perhaps in that sense it is more of a driver private flag than
something the core MM would touch.

If you have a coherent interconnect then you should not be using
device private.

Jason
