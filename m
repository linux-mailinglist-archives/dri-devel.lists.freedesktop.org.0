Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ADA4F199A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 19:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA8910E44D;
	Mon,  4 Apr 2022 17:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB8310E449;
 Mon,  4 Apr 2022 17:39:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COdoseiOPHuVKirxEue845b5mhPlXT7+39fMIeE9eIXUAvw1x1clHHaW89OO2IWm5Ire/ldURHoQRCp+EZueA53PMkn4UAKhnWE1lwvX+a0jvQ54qqweAfUCwZEppuSM26x+gKPNT8uqLkXqTVnTIORLVNRyZ0w9u7Bcp+KDs6BEI3U83wL74JklxX9v9UFfmK/YC0f5qlfAiTChjLnYOWPVv6gP2+qXJ8aBkriSlLQVxDwS/nsgnIKGECGEEFzf7v4Hmi/zo/fKNaKJHGSrRvWfzm+iCgudyNm5AHiNfiXNwCQcJp8TXYbb8tKtIOMWbONkYg5+KkWK5aTfjCRNTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYOAz7xmnugnzgiRIZHEfmhmpWd1Bc0+wkCtsfoWffk=;
 b=DvM2E4JBNFkfvKvJo9tLQLN5Ha5+fGp4k8/1tjkSvbUBEi50QHKYnP8uXZcS9aNk/YTD4SNSZdKhGwelOUhhIlut/bEdYfdOz6/a0fv5UXRRwplV1oRwzA3snDlqANaWh98zSfd9xfwIVi7p4eRT22G9qwuvIEcDcyHPWPFgTihtIfFZ/N2DzAf5qJZ2Z0gU+mlTJGBmoQggSU6Gg0IJXMpk7ZMsgMND5udPh9uCfsLIfNqIRmLDmETk5d827D6/53GmMmULUOsXZlEYapGulu+dxo05tmCTL/dSGCilCRYsvUcBpRRg3qOhaGzBlbR7xXrO294hkNfUvNEeOpkUiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYOAz7xmnugnzgiRIZHEfmhmpWd1Bc0+wkCtsfoWffk=;
 b=DZ2/QsHq+Ta2enkwAFWqO9aaDTgY3TKpdCeAXZGFEG0FDEFSLzpJtR/qV5NioOuGDTjaFsiigt6hCJKQSp75zIFCRG5WWbqclmYNAGbVGwmZeRqrTNac9RitKByt3jfL0qZCqoROMKxy5pGjWj58ZMOIrpeaFpHoLwxxrI4ztl6bwWl9qumnPUkHV7lYijGCw5O/sNg0Y5WvCFxuQk8u9FGpNSMJn21HDMLqBAH8O4p6pRTPeRRdLJA3XkBKql7XCerRRkERC1RCWmOPEETBHEno2gTqfJSdlTMZr8A4+owggulQ2yRhIkNFbG6YdvDWpMIKiJ+2UcI8ZvBq8fcZeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MWHPR12MB1422.namprd12.prod.outlook.com (2603:10b6:300:10::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 17:39:00 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%5]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 17:39:00 +0000
Date: Mon, 4 Apr 2022 14:38:58 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH v2 1/3] mm: add vm_normal_lru_pages for LRU handled pages
 only
Message-ID: <20220404173858.GQ2120790@nvidia.com>
References: <20220330212537.12186-1-alex.sierra@amd.com>
 <20220330212537.12186-2-alex.sierra@amd.com>
 <20220331085341.GA22102@lst.de>
 <82ed845d-2534-490c-f9b9-a875e0283cc9@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82ed845d-2534-490c-f9b9-a875e0283cc9@amd.com>
X-ClientProxiedBy: MN2PR19CA0034.namprd19.prod.outlook.com
 (2603:10b6:208:178::47) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdd41846-42d3-45ed-2777-08da166200a3
X-MS-TrafficTypeDiagnostic: MWHPR12MB1422:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB142219285F1A4957E7EA458EC2E59@MWHPR12MB1422.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6uJsoSle6nOY97uW25wGlfQ16+wj5DAz2n5Bd60rdgNPeI8L6JSY1ShWnWe6beSvkBBuyYJrBpG0R4PpDeECpzujFKtGCjbiPosnmjeYZLND+NiHfIpQo91vs97JGVOc5rkfL9wN11kfZvu9HCcPNOsI0aeQ4hZD9zOa8YD59AetxekhD/kGD0tliQZRwpnPI58mh8N6dXXqkDTT5LG35mg4JUh4zPnz2fZnrinJvcqrMa+MnrnwUbiKyHPNOD0neMDiwDgQxaHf8OlmuzSRBOaZX6Zo4+uBdmzgCRDSTDbMOoaHK3PJvilVzHLxwVkt+/qul9I1xDKy6EnIoJwMxmCJAnn6PKUiyFPWxXHS0Qt9jeQ0Tmv0f/zGLEnIW6Vnq1845IawYKvDWKAyOh5Csj4h3jL2zeu6VF5n/KNtC397Q4QG7ICJ5cnMUAixO6a+6eI+n6MzpQTi+aySPSq8RSOo04SCGkuqDXkJKsyxExPvtUvfmyCQUUFhqJyWyqkU+0zCglBAyY6spbIq29mu+4j12008pbJWUEkKwivUl0TuQW9gZSDC2HvAvNSnEkffjCvkDmVRQhlGojWeQj32Fdi7oto8xbxBcKdJoKMZRd5Onx1Ic3eh+muOHQ+hlWXmwJxiC1ROWgkTD82cIz8cHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(5660300002)(33656002)(54906003)(2616005)(6486002)(8936002)(86362001)(186003)(508600001)(26005)(4744005)(38100700002)(1076003)(6916009)(2906002)(66476007)(66556008)(66946007)(6506007)(6512007)(36756003)(8676002)(4326008)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hnr1vzfh1ED8SBc/kdvoO4l+IVlu3YpXhBlGAKbUNJS3MR1yV8f6TVFRiELr?=
 =?us-ascii?Q?mL4z7nrFz8BAkf9utQ+zD/wCX+qxM9HiuFdrmS+3EJZkADG9ulgUwVyu3/f5?=
 =?us-ascii?Q?A5dBX61LeR2m6Gi4RKMCDc574RShFlhmmotQzkjq8pdpb/OHQtJ2fo51hGC3?=
 =?us-ascii?Q?a1l8Qi1syZt4Ktd7MgNKJCHe4LVLkUk9OPn+ZcRwHIeNze/8xIVTnewZkD1U?=
 =?us-ascii?Q?kCyVtJBbJdsxRAe9b4RpBPoqDYNkfj37mpaBhaKbe4MGPQoGJo3GuaDOTFD2?=
 =?us-ascii?Q?yzfjwRcQ/qQvWIUSqqRzZY/K0CYDAlOSouE/rIL/b+yh3lRCiN0srQ0dVe/Y?=
 =?us-ascii?Q?qyRjw+owoesBymD92AOlh2P0QopNQPGss9fmGTmOX+B5toy4cZyiW71q5rbX?=
 =?us-ascii?Q?O5PvZyEXJhjHudaHVZrV55OKaYgVh5pBQTesTeXVUjbyu01Erisg1J60077V?=
 =?us-ascii?Q?/uKuYl8qF/ntUuSxRnSp1ZH9YhPArGoFwvYk93g7V4TWDl2khk7yf5zemmio?=
 =?us-ascii?Q?nqcfIyWZolyVDhImvlODBjwcEarkboHdkNPJq+S1JImUXyZBQ9HpZz31pYFv?=
 =?us-ascii?Q?qvZBZGF+2XIS5BbnClovFifsBxtdZQLa6roiYrUe7VPpnMQ+8T16Xs4YHy8p?=
 =?us-ascii?Q?lGVkJWB42zUvGXJsgOKA70cjRXTHX4MldfZwOltQOfGWk6Ba9jMd4LXv4D0P?=
 =?us-ascii?Q?QZdMQsY4/ulmASO6H27/W8R8+3E8G+OjJllYSFc9bJT8fSMqpDqbYz9h10tE?=
 =?us-ascii?Q?032Xq25Wtz6boIghn6XEyFrkcZlk+7RS3WrEBikIN4qe80H8/b4BKecUI/V7?=
 =?us-ascii?Q?EKJIE9iGx9LEuPnibl77ZUfl4k0VsjCX6G/IlHSmGxCx6G15Dzk5RXrmBK0V?=
 =?us-ascii?Q?UeuKs6ZXgINu2OiSB/tSCHcbSUAcW9S2hO1PtSlClcW+rsNpyI7Tdj0nMByB?=
 =?us-ascii?Q?jOrIJRGX7EaB3Jp/4Rkx7D+/WQDtfUknkIn4y68ZMIM208a4lD+fK2B5RC+5?=
 =?us-ascii?Q?+ZCSrIHWODxe26p0qP3E/QcDprFbOHMLN+bz62hD8moAI+TtBCZbvAF8dPUl?=
 =?us-ascii?Q?GYZdpjLDfksstUP3zZN7ajnlsJ8wpxeZ+IT/6oPr782wPoNAxASM5ebcWkDz?=
 =?us-ascii?Q?nxpfQ2RQAf1huM1PhudVcLT+Mgir+GQdBsLhsoa6PPWroF2mGcWAbXupM1AQ?=
 =?us-ascii?Q?n8U2MlZxcd7Te7jMVENK5SR2islAmskBcUi8k+1IbPmzGO5CUEMaLxQ1585f?=
 =?us-ascii?Q?H7mZqduw+9BGMisHuT6/YhMPNgJIjohwp75sEdNZ1y1oFM3mZwdidYPg/LvN?=
 =?us-ascii?Q?1GkhiS1dM6Us5bnPuedDcfYVsY5r9290SgMiOyZgygZ6trI383lPZj8H60LV?=
 =?us-ascii?Q?dgcx5+s+D7tpGjAWXGpv7ndt1BzLrZRp+ePm+CpyH7jOds+6uoJLxnzEc2WE?=
 =?us-ascii?Q?FUSGm496uTr0rmb0k0CiEN97PrWtMlOjl+PWAs72xMmWNrRwcK9MnabRufwJ?=
 =?us-ascii?Q?UU9+xrgZOkXvpWEHWF1nseteVzDTz37Ok8ebNqkCgCeLf7YUm6VRFnfMFiV3?=
 =?us-ascii?Q?DFUZcejOFxs6vjAvYK6qAdD2Vbki8f7+pAWhdGwjNcGOWXnSTDHTnjvWERUU?=
 =?us-ascii?Q?Lsuq+MgZDXNL2RjCpgW4TrPVYfYvb/mBqm4xBBrIOGWdDQ2UyR/O7Od+ZW0V?=
 =?us-ascii?Q?fTfc9bGtc2CApw9fsUcjWpZXWqnxuEHjXaNUonke8vlk6XzHYUUXyuJ/V7+w?=
 =?us-ascii?Q?9FIsxWvuLw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd41846-42d3-45ed-2777-08da166200a3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 17:39:00.2127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhMsb9VNMgcgWYIyQHd8XLg3f4+HH0SAuZ8mU+S2FoRm/8jXCakFGLSO1hPnWYdH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1422
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, david@redhat.com, apopple@nvidia.com,
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 01, 2022 at 04:08:35PM -0400, Felix Kuehling wrote:

> > In general I find the vm_normal_lru_page vs vm_normal_page
> > API highly confusing.  An explicit check for zone device pages
> > in the dozen or so spots that care has a much better documentation
> > value, especially if accompanied by comments where it isn't entirely
> > obvious.
> 
> OK. We can do that. It would solve the function naming problem, and we'd
> have more visibility of device page handling in more places in the kernel,
> which has educational value.

Personally I find the 'is page XYZ' pretty confusing, like I don't
know half of what the PageKsm annotations are for..

Testing against a specific property the code goes on to use right away
seems more descriptive to me.

Jason
