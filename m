Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4FC34FFD1
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 13:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4B76E1B6;
	Wed, 31 Mar 2021 11:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8176E1B6;
 Wed, 31 Mar 2021 11:57:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JduwZflemDtqMYso5IbtAuO20FX0KJM2ZfjEo/kietSN13X8MamUsElwHC4/Scgvsw2jOnd/8pKdxwT7wqwn3hm79JsmH/fDXRE6Fv97ijYHZuEdf7NaCc/LjzVDcRTEWoRNkOBsm1Qn2SKh9Vjtme6W/qz2C+giYoWoX31GDq3n4QsWxpmK9SCA0aBQFyj89ax2wNbphWuNRuqLpqTfEVeg/36jN6Lyyc6tj6D/b/R4Hx1bEylt5VoP8O6fDtSzM5bDojWrlZOdbgwSX5/49Jy5/PxXwPicL+hb5BcTAazxiVrPgj7LvMufVN7iG/n1nUNbPyGPjfQ/w6XF9tbCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8Kf0F+WB0x1rrOXSyglsj+C+MEf6Wmm5yul3iqvFyU=;
 b=JLJKWvTLAbCHQZaOOmQ5PoLCgSk8hejgvWaMijWIb+8IoHEgM9i7wxvwz1gE+eZCugnfnFj7UNMsMxufpWGz0/6BsOskArj3f7fn+hkqRTLKsOE6flJLfFrnuzd4gP5wbO/Jb48G1GJBnFFKvZQXUI47WncqV/c4ALJQdvlT2SdC9ZFYosnpkmWFylJ1pB/FAxgDCMqYJJ53F78ul25utsWR/Td7EikgenN9+KW5z3q+wYPo6yz3p9bqpQG3QWcqVck0M5nFjk052sMGnLl95n1GIujpHhCeq4RelNhtqxwkufkIhdiRNPkh1tFY7OGywg9uki2uk45Ek6WqgMSsbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8Kf0F+WB0x1rrOXSyglsj+C+MEf6Wmm5yul3iqvFyU=;
 b=bCmvlD9ZjoCSYf8O+s9hpg3rB7vQPnpVK7U1sLAFd9LNPEKGktkiREHEqwm7BLhv9EMG1wCNJ0IlfTHJllIeEHmUZI7XEjk2XraJWyegDY1ckIO+INphZ1h5gRxoKTevmuQDnbXny3cuJFllleUClYa6BoB5d3SuF9BxUTHb90Zqm//OdvOgpE18EpjpmWXn8lJaIW2Is23OPvtseLePhoK69hh9w9HBd/6QlqHoYS0eKafC8HtyAn4Mun8YwnaAYmeiIx8BqUJovI5VZsffLOISmlJ7bRo+YyU5Qsj50s7fMD1/6KlKehtsvp6Qtt1PIKGzro6bWzs7EBRUEYNHkA==
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3211.namprd12.prod.outlook.com (2603:10b6:5:15c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Wed, 31 Mar
 2021 11:57:48 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 11:57:48 +0000
Date: Wed, 31 Mar 2021 08:57:46 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v7 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Message-ID: <20210331115746.GA1463678@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <12636584.zsJ0Sx4KLp@nvdebian>
 <b4b11c59-975d-26c7-043a-6acddff78dfd@nvidia.com>
 <23784464.epyy5R1Yul@nvdebian>
Content-Disposition: inline
In-Reply-To: <23784464.epyy5R1Yul@nvdebian>
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: MN2PR20CA0048.namprd20.prod.outlook.com
 (2603:10b6:208:235::17) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 MN2PR20CA0048.namprd20.prod.outlook.com (2603:10b6:208:235::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Wed, 31 Mar 2021 11:57:47 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lRZTm-006JMb-5u; Wed, 31 Mar 2021 08:57:46 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c0dc4ed-e55a-4212-751c-08d8f43c33ca
X-MS-TrafficTypeDiagnostic: DM6PR12MB3211:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3211502192204632AE454BCCC27C9@DM6PR12MB3211.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PjuF3to13a4dFRBkY4PE79u+6Sxut23q2E12ir4KehklptPAfi1gMb8fK1WV/hzWDLgqElADvPVl76/pDTYc/ZNccQzfRWzNisM2Iay7ULh5AVXDjfkFvWoyOvwULAw3mmY2Vox9g8THdjy4ComRoZx0WeY7xpcziu9SLsDWTlBpql2A61C5FJfVY5LXvC8JPeVGUZUcoaEjdvhoC1ANZIsPnU7rcHZj0nYjs7aCoSazUreLRNb8Y0HOItOFarlXWOdPpwoLfFK/H7INNKAurwewYMIWf7l4Q0GQRrO+cXB1XAtvuKXfjFJoV/eE6rsCRoh2Pc59D25HJWu1Qw2VeDZ/uA5aCDwf+tzKf6jfxQL8OM2nWlN1MsC6tdyZPtID4RkcyZfcsqyRhTrManCIPCAYPemaGlV99EWETQDxDNs/e46K6rDV3KcQpIfaf9spnlZGIsg4d5IfuE6Z63EcZGkf3j31jhFqjNZC/yzeVyIt6pG1itY6QL5enDcitUJ5SPj7KzHXRpS1s/u90S+iQnzgr1anw5tMu/tECuUrJ/3WFfi4n6vY+503ot4JdE2brJ38PsO0KxWzD1v/nCRmhUzLa45723l6wtTFcSaF+Z7rsA09o4eY2oKtUsUmHtcurFmg9Z41i4rACnr3i5vTJoMMc+VwTxv85W7fzW3syPY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(53546011)(1076003)(4326008)(54906003)(6862004)(66946007)(9746002)(9786002)(37006003)(8676002)(86362001)(6636002)(316002)(8936002)(5660300002)(66476007)(66556008)(478600001)(7416002)(83380400001)(186003)(38100700001)(26005)(36756003)(33656002)(2616005)(2906002)(426003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9BOHDX4iC2KvnP1daBdoCyapUrNakitY5Ruj3qVHiKR2aHEh/2ye/0a0g1VK?=
 =?us-ascii?Q?9UI5qeI+Na/8v7r4w4pe11kh/kwsPHt9nr6FJRsesChncXhpwPU45/bqM3iT?=
 =?us-ascii?Q?OIkBGk2APAjR2f0Rhs9MD3l5hoDc9RqRfHA9k1nkKW8D8NUDSzPxBEwdEdy2?=
 =?us-ascii?Q?4klDiMoBRckWZHt0e00Iz5qD4tajSVxE/AfpAxRqf4g+NIv2bM4qC/nuq44M?=
 =?us-ascii?Q?2Igrebsoe5l2Y/aR3hXlJzDmdATqsO+mg6iWmI4SBKrl/VeYI1aPklBCNqVW?=
 =?us-ascii?Q?/3dc2BS6EBxk2v7y0FejR3Wf2+qVBIOd8Fr4m4wnS0uIKf4Z2VArPanzoyPQ?=
 =?us-ascii?Q?IdVs34trj/XQ7+6mOrzAT20JCNWiv1uxgq+KanZnkrX5hPg3qKLyr/8rZmtj?=
 =?us-ascii?Q?aumvkVnic1zddjlHbuBw6E+/lvV0aXhFn3XZYS3BA4eBr1uku3jg5XQMfPiX?=
 =?us-ascii?Q?B9Y7/3nkd17RZug6jhmrqv3/3IpU7IH0yfhcANIBnCsmgzSSNsn2o/rnYbg1?=
 =?us-ascii?Q?NF7GdJwtDvTYptPwsrVJX18uehx4ZAQXIyA9qYYjaZMIVfzUKec5nd0U+dQp?=
 =?us-ascii?Q?i38a1hwmA/YUurxGTiFDRK91rt2r/F4YzaSfxMSVimdHh3hevEciemkOdtGO?=
 =?us-ascii?Q?N3QYCMk72vNrfduZLTFQfd0jgHsb2qKScyon1t2/JG0IqOfKdHWw3DsRKzOi?=
 =?us-ascii?Q?pBJpfWWj5/jXGPtEgf5Xl6Ky1leaShtEK9Gc96HoIQxncf5RoUJAqJvZVwjX?=
 =?us-ascii?Q?Hz2FT9Oon2NxntboTqB4+1mnHfuhEa4iTKlfyBMz0T56fAfqlQOavbVAilc2?=
 =?us-ascii?Q?PY85nutzdXW5M1Gihv2vuXCP8hE7IY+b89TWzrxLCSWHE5GN9W158vg5K3gb?=
 =?us-ascii?Q?3LJrzmpMa6aYOhMbA2AtRz4axh1frxacT3/PLR5NFAvmoXezsIlt8w9u2WHM?=
 =?us-ascii?Q?BKQ8yhf2OB+aKeYSOIMhB6QkRHkNREd5BdY1+1jrUuJ1zqdJIcWgFUcRrB/8?=
 =?us-ascii?Q?Iootlg5XEACcKsVOpRSkCKHbITVTTkrzXrSku8YsNRUlT+mfUwxpeINQDhnS?=
 =?us-ascii?Q?il9vvc24JBPkT6vUU6M0Mdl0Ben3FltYtAancH6iE5lcGTh0pLpsHE4BGnh4?=
 =?us-ascii?Q?PkbdNWclFAKnuC8QptBj9ffyJDZZX0nXQ7Twu3b/cN/ndUhrtDYzMyNXj/J5?=
 =?us-ascii?Q?yKW70iH+hZRDUuoCnnOw8Yw7sH6HqN5aTJo+hRJeJFSc+Yot+Bx/qIw4iUl1?=
 =?us-ascii?Q?H0gOcqWKEQ1+swXV141YyrmnYCiobO+AVPVgrf8N9eCE1KHmFR0NoUm4DcxV?=
 =?us-ascii?Q?awSWVkr+YMY5VBe1AGuzoToK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0dc4ed-e55a-4212-751c-08d8f43c33ca
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 11:57:48.4352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIagtZ1C2tI5yrZKSVsBRnZqw9mRjSmPCXtaHQiFPzJhub6cjhNz9NqKObPYjHsD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3211
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, hch@infradead.org,
 linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 John Hubbard <jhubbard@nvidia.com>, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 31, 2021 at 03:15:47PM +1100, Alistair Popple wrote:
> On Wednesday, 31 March 2021 2:56:38 PM AEDT John Hubbard wrote:
> > On 3/30/21 3:56 PM, Alistair Popple wrote:
> > ...
> > >> +1 for renaming "munlock*" items to "mlock*", where applicable. good 
> grief.
> > > 
> > > At least the situation was weird enough to prompt further investigation :)
> > > 
> > > Renaming to mlock* doesn't feel like the right solution to me either 
> though. I
> > > am not sure if you saw me responding to myself earlier but I am thinking
> > > renaming try_to_munlock() -> page_mlocked() and try_to_munlock_one() ->
> > > page_mlock_one() might be better. Thoughts?
> > > 
> > 
> > Quite confused by this naming idea. Because: try_to_munlock() returns
> > void, so a boolean-style name such as "page_mlocked()" is already not a
> > good fit.
> > 
> > Even more important, though, is that try_to_munlock() is mlock-ing the
> > page, right? Is there some subtle point I'm missing? It really is doing
> > an mlock to the best of my knowledge here. Although the kerneldoc
> > comment for try_to_munlock() seems questionable too:
> 
> It's mlocking the page if it turns out it still needs to be locked after 
> unlocking it. But I don't think you're missing anything.

It is really searching all VMA's to see if the VMA flag is set and if
any are found then it mlocks the page.

But presenting this rountine in its simplified form raises lots of
questions:

 - What locking is being used to read the VMA flag?
 - Why do we need to manipulate global struct page flags under the
   page table locks of a single VMA?
 - Why do we need to check for huge pages inside the VMA loop, not
   before going to the rmap? PageTransCompoundHead() is not sensitive to
   the PTEs. (and what happens if the huge page breaks up concurrently?)
 - Why do we clear the mlock bit then run around to try and set it?
   Feels racey.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
