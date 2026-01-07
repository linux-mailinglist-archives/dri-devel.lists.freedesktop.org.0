Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7D5CFFFD8
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 21:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D32E10E168;
	Wed,  7 Jan 2026 20:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BOJyFSqW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010046.outbound.protection.outlook.com
 [52.101.193.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87ECD10E086;
 Wed,  7 Jan 2026 20:21:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMjWKQ2z5PSowpW3aGse7E5PTFNXm2vpW76EqMdJkb59wTUpU9wbEZUzTYqXTr9O89ZU2ZaZCuh7cmGgKEY3nGkEHFqXVFllVXsQPtIKhOInxoAb0JVxhCgNwEcMryCWarcVeNAQMX9eVJ7JvX1PWWJqh2wa+We5gmghtfXGY6tRncUGg6rX2hF0gt1VSXwOVI2u43C2jc/cG+zlJ39Y3M2dyE4E7zCZ/qHstauiyBhDX151vddYEGPICTwvXv+2fq7mhuo1ie77lbZWjdg/IbVejP87sYJDbUxWnk+TTa1rjV5fhxbHQbF9A3UXJQFJjWmn61INfhpzNLsD2V0lpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsohBkGRHHllCnTdnXjS6kqwnu6Z+QdPtR9H2GrEfeo=;
 b=zM9W4fvYfk4MqSLTEr6KJ2z9nRRYFQEAqELQyuEfAVCLWt+HeZO+FzHcs8E75e6Q6tiM//SFb60qnKRVGBhZvCwj4KE5kZtx6/QQCQYbowteX6JqWpZFJqyv2tAwk3/xqdU8+QRrXXFJOwAw2LkMm8B7FpYYTm5kgY7MO0UJI/5oc7dlj5t53ss0CdLlXgRn5peNEpe3Mybh5mJ93IiUUhD+WKjBifS64OdR7/Dvm/YZo36fcTVWyEyuexPLJFdxb6SAYlb/7fK6h93CbkqG+8aTBtEk4HQCC8LM24Gan0SNZxNzHPTjP8kumWlaqODPKWzZEKapDGfSEnlBdTVSAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsohBkGRHHllCnTdnXjS6kqwnu6Z+QdPtR9H2GrEfeo=;
 b=BOJyFSqWiT88LqH9+u+X+6/ZcxZQvRTmInvrf/v43Pu3by/DSP3/tUX+ZUUbrKZiZEKME5uId+dzZSXwXbAGjUVuXL+RgSDjAcM/mjJtZhamL0MkcbTTQGal8u0oVcLZ5vfJkMNb9j/RiByLWph8LYqBG4xiFvoC9Jc7a+mR1AgdUbu5CIYtYtNy9aIpMkyhpWfGY84xSkC9aFoRR71vHhvTJRdQkocQTJYEefAz9OzcqBsdoU5TlmJvea8mqDzTggxodSTszbZwh32Ad2no0AOxw9+OTPhKAy2DMEPrKM8kwkuSjCf9fjvEiXxKLyo2xrqThNeWy09Cf/bEX4AMww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SN7PR12MB6670.namprd12.prod.outlook.com (2603:10b6:806:26e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 20:21:38 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 20:21:38 +0000
From: Zi Yan <ziy@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org,
 balbirs@nvidia.com, akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, david@redhat.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com
Subject: Re: [PATCH v2 00/11] Remove device private pages from physical
 address space
Date: Wed, 07 Jan 2026 15:21:33 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <02D37B25-E2E4-4E1E-A714-1CF90AC7AA35@nvidia.com>
In-Reply-To: <aV6nvCw2ugAbSpFL@lstrano-desk.jf.intel.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <aV6nvCw2ugAbSpFL@lstrano-desk.jf.intel.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR06CA0021.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::34) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SN7PR12MB6670:EE_
X-MS-Office365-Filtering-Correlation-Id: 7620f76a-8e9c-4de7-141f-08de4e2a5c9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?toRkQ/mrS1PIM/kpfOfSC8XiVxsqGN12y/XEzY5/Y92Su+tdr7L+0WkFEb//?=
 =?us-ascii?Q?DAg0Pmkcm0mooiXLlavjWujynCZ8+3vrAojGlmIECq3BTY2iWufzUY2bNoTJ?=
 =?us-ascii?Q?efQSdHWtA6xw61gqIxRfTxsBzlkZ+eNAr731M3Sq1gmgmud03aNo1mMy24XT?=
 =?us-ascii?Q?CycIfUULX4s7F/V5KH5owAHC37f2hLMYV0maV+Hv7p2LfiphsZWY4oviFDFy?=
 =?us-ascii?Q?TWca0Q7gczsjEPgMGlCzTDWoSF+jdElQbBLE37AT4PWpJx22UbOj2onf6eyl?=
 =?us-ascii?Q?e3ZfbHO9VMpqpuohuVXHG+QNWo80hSJnOg2y/DWnVza6vGT7pf+i15xF68qn?=
 =?us-ascii?Q?qEMVD3vfhJ0IqXxplyvJQhh0D7X9ZU94wxd/oWfKzGZTXvMytr/htT9FtMgf?=
 =?us-ascii?Q?z6jke1RmAlVnKjlbu7SrQJ5JQ1J69i/l01Z4tZz1qKpsXgJ8qaDLihlUtAmd?=
 =?us-ascii?Q?kSFBAJXYWyrGIZKtPXzVyvIrKNWLnA7ComoisihLEAiUmTucgKzcB2Y3VI1o?=
 =?us-ascii?Q?RVICFs6g0zYK1mOEb2mVwto+Pq0RixHDMyRksAfOyU6SRBG2mEWFT1rsoKrF?=
 =?us-ascii?Q?nYxoodkELnI+avy5X97a58F6DUSi9+bbBGCQwblIsSnZn+W44oAnYdUtt4MT?=
 =?us-ascii?Q?ECABdN+o6vBKDC3EiuUb42pAHDsqucqpJSdnsKVTuN+fGbMpC31qSj2egp6/?=
 =?us-ascii?Q?H2hoUc2pawdg1JopcJVz0MdwMf4uD+1ripyMMfUrsjJ+mouKbGCLljyOGtbc?=
 =?us-ascii?Q?dqWlCm09T3WnEoKMdNcraiEEEif+5wGi2Sg/HGuVlkbQCZA57m5Uvn6KzBjv?=
 =?us-ascii?Q?5JEGeg3QUiC/f7QY0RBgza37lQ2YgmY8LhjZvN7s1sQ2whUtorV9Yv3V9P3K?=
 =?us-ascii?Q?crNSSzKG+ICbAXqXAz/uYle7cieEiv7+2xNdaJSSJu5RZOz6CTiBTWbHDgXl?=
 =?us-ascii?Q?9//W3IgaWSDNka7HyZSylqGviIyYWeHP1QiDRrOmd3Fvr6wMQveHep3RC8hp?=
 =?us-ascii?Q?Jah7S7+hFPQrkgxA8z7X36/RobIO+ijLjwgNu7Z1RoXT/QWy9eIbgZQEG2qf?=
 =?us-ascii?Q?Wh2xq6Duhyp/54LvDldaPfUALW+KdHiwSqtJOLACsLlIJ3hF2MFrE5lZMFPa?=
 =?us-ascii?Q?qFfwYRMJ8HgEhihOHw6B6CoZW7sGqnwj3Xq2CchksrGqwHEQJwrnz7NKDFMc?=
 =?us-ascii?Q?OoFBdEEcRjv81VBgQvJ5PYauXoCxtBxLQp7oqjcp5AwiUHrbxgRc6cuurV4W?=
 =?us-ascii?Q?SEKDvrjg4Ry2r8i/XdZqzWaWY9qIKqWny8q9Le0I638ZL27kCurYGlsy5m9d?=
 =?us-ascii?Q?QNq8+bMgOjU/9xHuPSNzpAumV/cm1f4A337FLJbMob6RTUOBPmM7E9Ugo0jb?=
 =?us-ascii?Q?OJ89xguAOwYc6tDqCSAxXPugy5QX+NZiPTc6gmteZFZA7cM/Q7mRtTPSrxoo?=
 =?us-ascii?Q?JziUYxPWd0HJLleyyJtR4VjD6vqy1fW/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mSTur9QCazf9qA1hoQhBAhJm7h5O5PYlf4KfVkh2Q0CRfFKuF3VzuDbllbzF?=
 =?us-ascii?Q?jAMsy1+Wj84TknJTMLIYDUAT4PhEXG8CixS9vi3Lmi3dkz+fXhxAF6mYzQ9X?=
 =?us-ascii?Q?rXhZS+l6qTdw0L2bDA60PaQCShBl3RVqMQZsqx+T1Wh5D9aplhivNY1J5ir6?=
 =?us-ascii?Q?ITWjFrpqizGXqdH9vQZrgbGdTA5axkli3cneBIm/8a9QZVAi16a4KMOJMbAG?=
 =?us-ascii?Q?yy3BfHevWvGkJHGoxa+z7Pm8OKa8MrZbMNG4WrU64vT5RqMNLpaGdMZmmaaU?=
 =?us-ascii?Q?SyHZ3VoYCdjsxcX4WN7g3e5sPL7801nzaLXLYLGDtBYCSt/PAfcitpTcFp64?=
 =?us-ascii?Q?UUpiSCxwe1a0nfotVUZcc7H7/tvS+74BFg+efeeiDqfYAOjLMEdcgk7ApDJf?=
 =?us-ascii?Q?LcTHTEwv8GEKCiPL73aNS8GHqxdB11Wc68qaYXaz515MPeKX/2UjNfJFweAP?=
 =?us-ascii?Q?3mNlEbn8pyFmaqNpx7pHihUNcEkI99Rv20DYS35CV1AG7mIXKwjHQ1SCEggv?=
 =?us-ascii?Q?iN1S3yMJZLUmoEjNuxieKPdNjeS7YT9JMBl5cOGtJFFuQYeVr+4RFnQXvhMG?=
 =?us-ascii?Q?Ta2PRyNOh75vFqeaZ7FZg9SYc9wtCtTI32lpA6Vm8AdDkgfY/SFqnDgA1/5f?=
 =?us-ascii?Q?zQ0i0IzF/xx4mUk13bIr8W89KF8PBCTmoxtMfSmWsnHIXRVQeI2CKM8FAl16?=
 =?us-ascii?Q?oCSxzp8Ev75wIkWnuil0Oh+QYtjI1OvlIa9gmWp0NOiAxbfPvv3Zi9Nnrjey?=
 =?us-ascii?Q?FlXhq5N/7g9/ss4m+xoKXga4hZSvf9LpeBai67bJ3/bjumPZUUxbhnVETF/9?=
 =?us-ascii?Q?305v4cFitPcpbF0QJQH/p+vcGUB1hFpRfu0+FLnpEbSXUYCf4Y4Nvkw1DPA5?=
 =?us-ascii?Q?eZdrQPZ8swuNxSMx07b6Gj9JtSw1OWojvNnKX9ZptKBkjf/mZ87vwI8w6XYG?=
 =?us-ascii?Q?478X0qTr923jEgWAjoI/utEvDsOc4e+3ucryS+8XY5USzJwSQtHgi96viCSj?=
 =?us-ascii?Q?zSQU7zClRFKloIwe1dnNGuT/mZWNNggdR42++zjStTudKqMWpdGUvDwgy8bO?=
 =?us-ascii?Q?SGRbU+rqoNxGbRuC0mXYO9d7zoLgtMXyPlKlNNBZZVtLHIYPxY00KnSbbElk?=
 =?us-ascii?Q?HETwHEXvvPD1oUc1cslZ2Z6EUAUFzaiWsAO86vN2fS6NqPLKX9C1YwHuKlYM?=
 =?us-ascii?Q?JwyF86rTA4HAtT0w2ozgFeYblwagN4+TG4wOWe8uPk/+9dzI7yG7RY6NFTYL?=
 =?us-ascii?Q?jebc1EO4HBa8WRFsMA9civjWYPFzAY0k0RT4447eOIBMGXI+IQUR9MmEnCq5?=
 =?us-ascii?Q?6mbWFOy9zNYavhwrl1IpEp2rXN+dNUW5mM8tZuRvFKceK0C1I1b7fHB1Pu35?=
 =?us-ascii?Q?3uH7KCmftjWkTKm0rI+KcLWVMchWkt5g8kitmkQgX9mxfMx1LMsiaA8mTVgR?=
 =?us-ascii?Q?IYlSZ3fLC0lHr74UBVr8SKUw1UoWLVoLXxX78eshDlzXrnnxnBioBF0cnsxM?=
 =?us-ascii?Q?Z/PtlMlxO6jAjnD5acBDOWY/txOjSmTiBkoy63gAzJ0HTAFya8662NF0wG6v?=
 =?us-ascii?Q?HVcQw22K6kup7i2aDJ4o6LdyN7Z7yBGzrFA4DFOAl6JRAgp11N/zfv8x4KC6?=
 =?us-ascii?Q?shJ3cLt+eFFrCA1Gna9/EynAsMRS/p5R9OOqzkzqRXFl0v8n0rjU2BmFM8zN?=
 =?us-ascii?Q?uHB18sVq0QcKAoabb7rq9AkMtWOs8423omnst3xxaXD5AYgnl5htRcFSb5Wc?=
 =?us-ascii?Q?Ws5E5EUQug=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7620f76a-8e9c-4de7-141f-08de4e2a5c9e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 20:21:38.4002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CraGEstQm7tkVhntxDl0ehOme9pjfXb5YvNlEk642Ei06pOPyCYF7OolTMuTmTL5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6670
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

On 7 Jan 2026, at 13:36, Matthew Brost wrote:

> On Wed, Jan 07, 2026 at 08:18:12PM +1100, Jordan Niethe wrote:
>> Today, when creating these device private struct pages, the first step=

>> is to use request_free_mem_region() to get a range of physical address=

>> space large enough to represent the devices memory. This allocated
>> physical address range is then remapped as device private memory using=

>> memremap_pages.
>>
>> Needing allocation of physical address space has some problems:
>>
>>   1) There may be insufficient physical address space to represent the=

>>      device memory. KASLR reducing the physical address space and VM
>>      configurations with limited physical address space increase the
>>      likelihood of hitting this especially as device memory increases.=
 This
>>      has been observed to prevent device private from being initialize=
d.
>>
>>   2) Attempting to add the device private pages to the linear map at
>>      addresses beyond the actual physical memory causes issues on
>>      architectures like aarch64  - meaning the feature does not work t=
here [0].
>>
>> This series changes device private memory so that it does not require
>> allocation of physical address space and these problems are avoided.
>> Instead of using the physical address space, we introduce a "device
>> private address space" and allocate from there.
>>
>> A consequence of placing the device private pages outside of the
>> physical address space is that they no longer have a PFN. However, it =
is
>> still necessary to be able to look up a corresponding device private
>> page from a device private PTE entry, which means that we still requir=
e
>> some way to index into this device private address space. Instead of a=

>> PFN, device private pages use an offset into this device private addre=
ss
>> space to look up device private struct pages.
>>
>> The problem that then needs to be addressed is how to avoid confusing
>> these device private offsets with PFNs. It is the inherent limited usa=
ge
>> of the device private pages themselves which make this possible. A
>> device private page is only used for userspace mappings, we do not nee=
d
>> to be concerned with them being used within the mm more broadly. This
>> means that the only way that the core kernel looks up these pages is v=
ia
>> the page table, where their PTE already indicates if they refer to a
>> device private page via their swap type, e.g.  SWP_DEVICE_WRITE. We ca=
n
>> use this information to determine if the PTE contains a PFN which shou=
ld
>> be looked up in the page map, or a device private offset which should =
be
>> looked up elsewhere.
>>
>> This applies when we are creating PTE entries for device private pages=
 -
>> because they have their own type there are already must be handled
>> separately, so it is a small step to convert them to a device private
>> PFN now too.
>>
>> The first part of the series updates callers where device private
>> offsets might now be encountered to track this extra state.
>>
>> The last patch contains the bulk of the work where we change how we
>> convert between device private pages to device private offsets and the=
n
>> use a new interface for allocating device private pages without the ne=
ed
>> for reserving physical address space.
>>
>> By removing the device private pages from the physical address space,
>> this series also opens up the possibility to moving away from tracking=

>> device private memory using struct pages in the future. This is
>> desirable as on systems with large amounts of memory these device
>> private struct pages use a signifiant amount of memory and take a
>> significant amount of time to initialize.
>>
>> *** Changes in v2 ***
>>
>> The most significant change in v2 is addressing code paths that are
>> common between MEMORY_DEVICE_PRIVATE and MEMORY_DEVICE_COHERENT device=
s.
>>
>> This had been overlooked in previous revisions.
>>
>> To do this we introduce a migrate_pfn_from_page() helper which will ca=
ll
>> device_private_offset_to_page() and set the MIGRATE_PFN_DEVICE_PRIVATE=

>> flag if required.
>>
>> In places where we could have a device private offset
>> (MEMORY_DEVICE_PRIVATE) or a pfn (MEMORY_DEVICE_COHERENT) we update to=

>> use an mpfn to disambiguate.  This includes some users in the drivers
>> and migrate_device_{pfns,range}().
>>
>> Seeking opinions on using the mpfns like this or if a new type would b=
e
>> preferred.
>>
>>   - mm/migrate_device: Introduce migrate_pfn_from_page() helper
>>     - New to series
>>
>>   - drm/amdkfd: Use migrate pfns internally
>>     - New to series
>>
>>   - mm/migrate_device: Make migrate_device_{pfns,range}() take mpfns
>>     - New to series
>>
>>   - mm/migrate_device: Add migrate PFN flag to track device private pa=
ges
>>     - Update for migrate_pfn_from_page()
>>     - Rename to MIGRATE_PFN_DEVICE_PRIVATE
>>     - drm/amd: Check adev->gmc.xgmi.connected_to_cpu
>>     - lib/test_hmm.c: Check chunk->pagemap.type =3D=3D MEMORY_DEVICE_P=
RIVATE
>>
>>   - mm: Add helpers to create migration entries from struct pages
>>     - Add a flags param
>>
>>   - mm: Add a new swap type for migration entries of device private pa=
ges
>>     - Add softleaf_is_migration_device_private_read()
>>
>>   - mm: Add helpers to create device private entries from struct pages=

>>     - Add a flags param
>>
>>   - mm: Remove device private pages from the physical address space
>>     - Make sure last member of struct dev_pagemap remains DECLARE_FLEX=
_ARRAY(struct range, ranges);
>>
>> Testing:
>> - selftests/mm/hmm-tests on an amd64 VM
>>
>> * NOTE: I will need help in testing the driver changes *
>>
>
> Thanks for the series. For some reason Intel's CI couldn't apply this
> series to drm-tip to get results [1]. I'll manually apply this and run =
all
> our SVM tests and get back you on results + review the changes here. Fo=
r
> future reference if you want to use our CI system, the series must appl=
y
> to drm-tip, feel free to rebase this series and just send to intel-xe
> list if you want CI results.
>
> I was also wondering if Nvidia could help review one our core MM patche=
s
> [2] which is gating enabling 2M device pages too?

I will take a look. But next time, do you mind Ccing MM maintainers and
reviewers based on MAINTAINERS file? Otherwise, it is hard for people to
check every email from linux-mm.

Thanks.

>
> Matt
>
> [1] https://patchwork.freedesktop.org/series/159738/
> [2] https://patchwork.freedesktop.org/patch/694775/?series=3D159119&rev=
=3D1
>
>> Revisions:
>> - RFC: https://lore.kernel.org/all/20251128044146.80050-1-jniethe@nvid=
ia.com/
>> - v1: https://lore.kernel.org/all/20251231043154.42931-1-jniethe@nvidi=
a.com/
>>
>> [0] https://lore.kernel.org/lkml/CAMj1kXFZ=3D4hLL1w6iCV5O5uVoVLHAJbc0r=
r40j24ObenAjXe9w@mail.gmail.com/
>>
>> Jordan Niethe (11):
>>   mm/migrate_device: Introduce migrate_pfn_from_page() helper
>>   drm/amdkfd: Use migrate pfns internally
>>   mm/migrate_device: Make migrate_device_{pfns,range}() take mpfns
>>   mm/migrate_device: Add migrate PFN flag to track device private page=
s
>>   mm/page_vma_mapped: Add flags to page_vma_mapped_walk::pfn to track
>>     device private pages
>>   mm: Add helpers to create migration entries from struct pages
>>   mm: Add a new swap type for migration entries of device private page=
s
>>   mm: Add helpers to create device private entries from struct pages
>>   mm/util: Add flag to track device private pages in page snapshots
>>   mm/hmm: Add flag to track device private pages
>>   mm: Remove device private pages from the physical address space
>>
>>  Documentation/mm/hmm.rst                 |  11 +-
>>  arch/powerpc/kvm/book3s_hv_uvmem.c       |  43 ++---
>>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  45 +++---
>>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   2 +-
>>  drivers/gpu/drm/drm_pagemap.c            |  11 +-
>>  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  45 ++----
>>  drivers/gpu/drm/xe/xe_svm.c              |  37 ++---
>>  fs/proc/page.c                           |   6 +-
>>  include/drm/drm_pagemap.h                |   8 +-
>>  include/linux/hmm.h                      |   7 +-
>>  include/linux/leafops.h                  | 116 ++++++++++++--
>>  include/linux/memremap.h                 |  64 +++++++-
>>  include/linux/migrate.h                  |  23 ++-
>>  include/linux/mm.h                       |   9 +-
>>  include/linux/rmap.h                     |  33 +++-
>>  include/linux/swap.h                     |   8 +-
>>  include/linux/swapops.h                  | 136 ++++++++++++++++
>>  lib/test_hmm.c                           |  86 ++++++----
>>  mm/debug.c                               |   9 +-
>>  mm/hmm.c                                 |   5 +-
>>  mm/huge_memory.c                         |  43 ++---
>>  mm/hugetlb.c                             |  15 +-
>>  mm/memory.c                              |   5 +-
>>  mm/memremap.c                            | 193 ++++++++++++++++++----=
-
>>  mm/migrate.c                             |   6 +-
>>  mm/migrate_device.c                      |  76 +++++----
>>  mm/mm_init.c                             |   8 +-
>>  mm/mprotect.c                            |  10 +-
>>  mm/page_vma_mapped.c                     |  32 +++-
>>  mm/rmap.c                                |  59 ++++---
>>  mm/util.c                                |   8 +-
>>  mm/vmscan.c                              |   2 +-
>>  32 files changed, 822 insertions(+), 339 deletions(-)
>>
>>
>> base-commit: f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
>> -- =

>> 2.34.1
>>


Best Regards,
Yan, Zi
