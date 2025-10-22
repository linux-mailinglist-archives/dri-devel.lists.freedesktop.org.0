Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A908BFCDBD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 17:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1C210E15F;
	Wed, 22 Oct 2025 15:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hn540f1g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A6C10E15F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 15:26:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ageduid4tbSqfqEIU9gjShEHmd9wtT3Xa91oud5uNhaSVkCiJy+pE3epchRXOm40HG8cmo2yEi3IHGjlVY8dlNyZN9TpUwinkoxlgq0E5LfevWrm4LlZFEyAo/mmIWw5oI/nZ7420bSJ6Q6kPLpngaYvJALnbJKwUu1UrlFyO8+e4wdf/XqUMdlJw83Bjnnc/OFWKqJV6W0iAdjcEcpqRlLQH9vbIr8YLksd1y8uClA4MSrhVpTUpl1Z9O5fNzFMSDgdVCgjpM3U4QFWYa5NRQ4z1WovWqoepUComUxJgFNanhKaTLtp/bMCWyTh4femD6KpVIAWArMQF/Jpf8G2Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvwODNSW1sdGtUyhC788B5/luEwfCbkrjKK9kWC3vco=;
 b=A2VkjdZynfl4xR6TWK99ewqB+zw+IviriHMSGpH8jOyG/h4a9lu2gvmU/ze+vggMJ7g+8H8uX5VkxioBqTRgaPOTq4HREirwl+tk+e0fFzXDFhiwGLz7k9Ru7eWDP+/PTOz5UxS9JJ8wcd70J+H3u5JsbgA1VfM4SdR1wqCe5Uk0erSj5n08I6V9vxt9NA3CdXv3UPs9XTqHBu2W+50aB3PEg57h5ADS47t7Mepdm/Als5x81a8LeKFjL+g7Wb5GFJ1Ux+xTq2S7+CVp6WOZr68g7BV4mp3kKaLp37/jkoqHgIN9hj8B7QoOIbhmBXLPidTId/RWSfuiZeD4+NzodQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvwODNSW1sdGtUyhC788B5/luEwfCbkrjKK9kWC3vco=;
 b=hn540f1g3icJtRMWO6L4ILJ+KNaUXrYqeFM++irsRmTtCih36gheYxcSTJtJ2pTA9QmSaKKUegfSHmy6ihD3gv6N8Elkhz0Q+z84tMpqTzXPeBWsj77WUykYsgqggPNSDKnfmjmRNqii6Lgfo44W7WAY8xDlao5Irm4b+2DpQfhK/saYV39sJdTzpuHoZa159nDBitiRUCVt+wnvCiq5kx/p9ha5aV45titMLC6uG1brYPfKEcvmu3iXHujkbf4qA2n4WwEG811mLjnGWNUH1w1nVQtyrPorKzx8yTVvlhNfrG+2A8f/Fm0qcNYkBsRbbmU+umVy2UFRRUJMYc8uEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BN5PR12MB9510.namprd12.prod.outlook.com (2603:10b6:408:2ac::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.13; Wed, 22 Oct 2025 15:26:10 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 15:26:10 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 akpm@linux-foundation.org, David Hildenbrand <david@redhat.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [v7 11/16] mm/migrate_device: add THP splitting during migration
Date: Wed, 22 Oct 2025 11:26:07 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <8D530774-F2CE-444F-8453-529821F30E4D@nvidia.com>
In-Reply-To: <3d58b839-a24a-4481-9687-3083541b80a1@nvidia.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251001065707.920170-12-balbirs@nvidia.com>
 <20251019081954.luz3mp5ghdhii3vr@master>
 <62073ca1-5bb6-49e8-b8d4-447c5e0e582e@nvidia.com>
 <97796DEE-E828-4B12-B919-FCA2C86756DE@nvidia.com>
 <debc988e-45cc-481d-b688-a5764647f3e5@nvidia.com>
 <D00196E8-E812-41CF-A2F8-A38251161ACA@nvidia.com>
 <3d58b839-a24a-4481-9687-3083541b80a1@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::37) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BN5PR12MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c25889-80ac-4022-f84a-08de117f53c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0PYaqzaNBGm+BtrwXWwMfVbB9B1MJNLfViHu5q72svA3J9WEXuFmeNfxhQ7T?=
 =?us-ascii?Q?74JMYwEFBjigMRbEN/6kGE3FvNBmAE7G1yixzYbc5qhLfwBeh9fACSFxXMNd?=
 =?us-ascii?Q?cUC7I0XlXWbsFw4W0beGShLuv7RaZndtpEWrZIIErLkTbK8inWiwaPWAzw0C?=
 =?us-ascii?Q?ebysV2alR1L+Ue8WQ2RdvPy+d2TGaTmVTaG/ap14GfmC8vhxrrIfhX3zj5Dd?=
 =?us-ascii?Q?JbtUdjtd1zKEK6PsnLsQtZtSyN21NI38fJKrfNyYN/koNNyHbEVNutmdlvSE?=
 =?us-ascii?Q?6kF5qqolrp/3haYJeLul06BClJUnzo9uLFm5dU4KL94WdoaTHfzW8y4kTyZf?=
 =?us-ascii?Q?/oMH3dgJWr8dkCqWpPo482R+A46ryc1Uv8D1X9SJHye1I3pmXIwHkcMwPyDI?=
 =?us-ascii?Q?kkKcIBipr/w+c0kTHfnfAeNfOV55r7NVdaCpMtz9tUFiAl9MqzTMBpSpZcDg?=
 =?us-ascii?Q?chf24p6Az26DYaAuB88sxFKY909PzV6JhVjMZHz76YZUUyGh/K4qVw47QpoV?=
 =?us-ascii?Q?ENVy2/vx16SeEPiBp0FsLSwLhA+YOgc+H1yShFxJkKq6X7kum1LqVUDoexrv?=
 =?us-ascii?Q?bejJFxuAyawIdEpjPx7ydIzS+RmidkU8KaPk+0NRRmgr4x48a0boNwVpgpos?=
 =?us-ascii?Q?b24Xpk0NZVmUMmQ3tdvIBqVMzlgW5SA5e/OfL8HG4xR4SbGP58Fk4biUDOhm?=
 =?us-ascii?Q?T6Ya/qN8g70eKr3jZSUTVmNw5+FWN88D1mcIL6NN3jQdEBatmj6kUrGpmnaw?=
 =?us-ascii?Q?NADxNdsNo1lzD8uXCdUrTOdjGCpnLbbgJY950Hk0gIbm9rjQ2PN1Tq6fCQaw?=
 =?us-ascii?Q?9r+vkwjSIyf5kvMhcwtwnu3gEcw6w+l5++/GUngZFuImAyazC0ZmN6KXVAJL?=
 =?us-ascii?Q?EqTT8rDF15KCASda6/dVHlLY+h1skQ9MgwUTq7kZecz7jupKseoO+twwAdwG?=
 =?us-ascii?Q?3G8S21Y3TOp1TIDTm4wJwjnbl3eiyqtI9Hj72pq0gIflX/Ax2vl1InonKT4N?=
 =?us-ascii?Q?F2h2CAtFAihfIw/hCYBNxsVfiuNZQDz2PH4j+wDKf2hXDRGmkYjX6zz+aoiS?=
 =?us-ascii?Q?d5T2T4qgMda3tosO3y3nprdaqXduMMcfRKXrdg1YxKV8nJ0nJwOZH7wC7vmK?=
 =?us-ascii?Q?0VEiEsBitcB+ycwsMJV/gzni4HxOAxhaqLLWprHevhdQXlPj3KHVb2b660Dx?=
 =?us-ascii?Q?SjYiRHEYm9FgSYgMypSWaq1CVrEmj80Uid/junYK/aUA1nsYrqCE3BP++ROu?=
 =?us-ascii?Q?QN4StVAyNDODtLin27x1tqVUPWsekwnnFN6g1etLTK9kPeQrTWbx7FH9vDws?=
 =?us-ascii?Q?suCphMGDFN816C0t+kyZcyaGDxNUAE9xuCqdqcj16Y01vSPpUW2xdRL/zhJS?=
 =?us-ascii?Q?i4OOBLynNpA8Qe/Ez4UG1tNBz2+F5rnMfVAx6eezKAd4AkrXa3KKqqhoSpjO?=
 =?us-ascii?Q?oWqtbhU2OCVdqCrsXcvd+SVs0I0+ekhE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pQWiN9ALdy7M4K8PGaddh7v18/VdW+L2MCOEjLZARmHSbl6WidcKuodWOOci?=
 =?us-ascii?Q?RyQMTZr67vnyctpOLhF5rz9BQ+TYuUGZ0LSRqOf1OiLEcjPflTJPa9vZ1J9c?=
 =?us-ascii?Q?EqWxTMtgOT5Ih5kThEX1uP4aVCQu86YTmPrB/6xS40XgBur4hVJ0YzKCwhTb?=
 =?us-ascii?Q?jzyvt22VG7gL3c1OJTBa9bkcDjPUugNFkpOnrid+/sB9bUox0pOxJ/+INNv9?=
 =?us-ascii?Q?mVoQeGbKJ4g1Ys6kW7GgI0HJdjRgRob6R8S0TkLPE3tPHIiwRBIDm0JK16fo?=
 =?us-ascii?Q?n9XBbKj5bJRqWEckA0FD6t950XRaaQLKjPEH+X3amHuGdDFQPUJYcJ2GknAQ?=
 =?us-ascii?Q?u8Ha7YP3167gNBF0FjDbPMvPrxzl29KUUnQRfwuNbHXrq9SrY+cRLQygvADt?=
 =?us-ascii?Q?uXly1Wc6Pg+tQi0F2wJGsgalzQGebUY5OaasRw2MpXPKaZbIrx3o/+9Ye/+S?=
 =?us-ascii?Q?BMTGRCRoo1JQOESU9Y9VPCIPgj9/DYnjj91z9FFrpkykWiNy8f1skXwepBCi?=
 =?us-ascii?Q?f5104hWKTVJQrnyxQEmCIZp4/3SS888tHc5mqwHXLBD4eJaewEAgeigm44wx?=
 =?us-ascii?Q?Fol8xDpz52FKYDEWzMP68YxvoOz5Oxa7K84pY80it4vtd7Pxi5o56UElRf8u?=
 =?us-ascii?Q?B+HTdydoMjzCcXlF+8TJgkXmpaX5KXUGtjMYpnfTPuKN+1yDgbB+7kTFHYHO?=
 =?us-ascii?Q?vgaecQ86cZwVgfD4nJhRQO2sIagZX3hWWAKMmJLeAs0RIM985kS0ozx0M4B0?=
 =?us-ascii?Q?1OcP0Zufu5XYpDT4yuvBpwtZqABT/bC/p9+fcaNcgk+jFXdmzw+BcT+OvzRm?=
 =?us-ascii?Q?g5v6EWqwTqM4hGmhIUjREC9aVTOSWFXj4pde3WfYrq5ZItDncxrtjDfe/zvW?=
 =?us-ascii?Q?YcbDgVaBZiI9ZzSDoyVUQ1oHAw1GmNoU/766CGyjtI9YMF6N3ICZrHbDtaYS?=
 =?us-ascii?Q?r/mw+3Q2hb+WjSWE14PBcuSmkzl/pHet2DrkaxsGLqA4ybs5MxmM4bFo1Lxg?=
 =?us-ascii?Q?uDuB737av/AliTRFgCujkjbaYdA5BWsLlJxsOSNU+zKVWNYNUBYyflaVV7tl?=
 =?us-ascii?Q?U+Auu7SDm3fye+dxXYEdI6z6E65qUZsaxfRnbS2xA3R/RjaawyeqfBOEQgAo?=
 =?us-ascii?Q?igEFB5t9pgSXeM0Mawn/HuhSGybTnSDFxlA7heFitpOI9O8+gfJh74i6d1Wl?=
 =?us-ascii?Q?9FLgMH5YT8SYtNSyZxVVvItxUL/HMCpOHyY/g8sKWGKCrqxeJ9VIHrTKIJcF?=
 =?us-ascii?Q?0ns/k7qCjVgMqT4iHdtYSl8mOlwNOMoBgOta3IpQItCU2JOrDQcIehGOCM0G?=
 =?us-ascii?Q?OoVbdM6moglLZodQ1O0txVReCSUo7tFAE29ZBP0WYNoIIrjXJyHQ0pKLwPBl?=
 =?us-ascii?Q?GUBnzhmx4gWwNdEMEAZKBjdzG6mtoPCSyUOCA7Y0p89kOyKj82m5RW6tclCk?=
 =?us-ascii?Q?r2MvDe5/TdKnGzmql+PCnYAUShpAwZNlhJi6cvOQ1hKu1su8V4bf+D4tUfjx?=
 =?us-ascii?Q?rvcQTExtmdX4lvHbJzu/11j6bJWKabDP2e+fv5K4fZ3IBl95PAidJ//jxaJV?=
 =?us-ascii?Q?S7ezqm/YLln3xJw8avn0UkGunk/G7NV/CmeUBXFQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c25889-80ac-4022-f84a-08de117f53c5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 15:26:09.9545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1g1amGRmrBxWoMipnk76FJ+WUZ5faWoR+xEZypRiFbWdOwpZXpwmyLpgJ6USjohl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9510
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

On 22 Oct 2025, at 3:16, Balbir Singh wrote:

> On 10/22/25 13:59, Zi Yan wrote:
>> On 21 Oct 2025, at 17:34, Balbir Singh wrote:
>>
>>> On 10/20/25 09:59, Zi Yan wrote:
>>>> On 19 Oct 2025, at 18:49, Balbir Singh wrote:
>>>>
>>>>> On 10/19/25 19:19, Wei Yang wrote:
>>>>>> On Wed, Oct 01, 2025 at 04:57:02PM +1000, Balbir Singh wrote:
>>>>>> [...]
>>>>>>> static int __folio_split(struct folio *folio, unsigned int new_or=
der,
>>>>>>> 		struct page *split_at, struct page *lock_at,
>>>>>>> -		struct list_head *list, bool uniform_split)
>>>>>>> +		struct list_head *list, bool uniform_split, bool unmapped)
>>>>>>> {
>>>>>>> 	struct deferred_split *ds_queue =3D get_deferred_split_queue(fol=
io);
>>>>>>> 	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>>>>>>> @@ -3765,13 +3757,15 @@ static int __folio_split(struct folio *fo=
lio, unsigned int new_order,
>>>>>>> 		 * is taken to serialise against parallel split or collapse
>>>>>>> 		 * operations.
>>>>>>> 		 */
>>>>>>> -		anon_vma =3D folio_get_anon_vma(folio);
>>>>>>> -		if (!anon_vma) {
>>>>>>> -			ret =3D -EBUSY;
>>>>>>> -			goto out;
>>>>>>> +		if (!unmapped) {
>>>>>>> +			anon_vma =3D folio_get_anon_vma(folio);
>>>>>>> +			if (!anon_vma) {
>>>>>>> +				ret =3D -EBUSY;
>>>>>>> +				goto out;
>>>>>>> +			}
>>>>>>> +			anon_vma_lock_write(anon_vma);
>>>>>>> 		}
>>>>>>> 		mapping =3D NULL;
>>>>>>> -		anon_vma_lock_write(anon_vma);
>>>>>>> 	} else {
>>>>>>> 		unsigned int min_order;
>>>>>>> 		gfp_t gfp;
>>>>>>> @@ -3838,7 +3832,8 @@ static int __folio_split(struct folio *foli=
o, unsigned int new_order,
>>>>>>> 		goto out_unlock;
>>>>>>> 	}
>>>>>>>
>>>>>>> -	unmap_folio(folio);
>>>>>>> +	if (!unmapped)
>>>>>>> +		unmap_folio(folio);
>>>>>>>
>>>>>>> 	/* block interrupt reentry in xa_lock and spinlock */
>>>>>>> 	local_irq_disable();
>>>>>>> @@ -3925,10 +3920,13 @@ static int __folio_split(struct folio *fo=
lio, unsigned int new_order,
>>>>>>>
>>>>>>> 			next =3D folio_next(new_folio);
>>>>>>>
>>>>>>> +			zone_device_private_split_cb(folio, new_folio);
>>>>>>> +
>>>>>>> 			expected_refs =3D folio_expected_ref_count(new_folio) + 1;
>>>>>>> 			folio_ref_unfreeze(new_folio, expected_refs);
>>>>>>>
>>>>>>> -			lru_add_split_folio(folio, new_folio, lruvec, list);
>>>>>>> +			if (!unmapped)
>>>>>>> +				lru_add_split_folio(folio, new_folio, lruvec, list);
>>>>>>>
>>>>>>> 			/*
>>>>>>> 			 * Anonymous folio with swap cache.
>>>>>>> @@ -3959,6 +3957,8 @@ static int __folio_split(struct folio *foli=
o, unsigned int new_order,
>>>>>>> 			__filemap_remove_folio(new_folio, NULL);
>>>>>>> 			folio_put_refs(new_folio, nr_pages);
>>>>>>> 		}
>>>>>>> +
>>>>>>> +		zone_device_private_split_cb(folio, NULL);
>>>>>>> 		/*
>>>>>>> 		 * Unfreeze @folio only after all page cache entries, which
>>>>>>> 		 * used to point to it, have been updated with new folios.
>>>>>>> @@ -3982,6 +3982,9 @@ static int __folio_split(struct folio *foli=
o, unsigned int new_order,
>>>>>>>
>>>>>>> 	local_irq_enable();
>>>>>>>
>>>>>>> +	if (unmapped)
>>>>>>> +		return ret;
>>>>>>
>>>>>> As the comment of __folio_split() and __split_huge_page_to_list_to=
_order()
>>>>>> mentioned:
>>>>>>
>>>>>>   * The large folio must be locked
>>>>>>   * After splitting, the after-split folio containing @lock_at rem=
ains locked
>>>>>>
>>>>>> But here we seems to change the prerequisites.
>>>>>>
>>>>>> Hmm.. I am not sure this is correct.
>>>>>>
>>>>>
>>>>> The code is correct, but you are right in that the documentation ne=
eds to be updated.
>>>>> When "unmapped", we do want to leave the folios locked after the sp=
lit.
>>>>
>>>> Sigh, this "unmapped" code needs so many special branches and a diff=
erent locking
>>>> requirement. It should be a separate function to avoid confusions.
>>>>
>>>
>>> Yep, I have a patch for it, I am also waiting on Matthew's feedback, =
FYI, here is
>>> a WIP patch that can be applied on top of the series
>>
>> Nice cleanup! Thanks.
>>
>>>
>>> ---
>>>  include/linux/huge_mm.h |   5 +-
>>>  mm/huge_memory.c        | 137 ++++++++++++++++++++++++++++++++++----=
--
>>>  mm/migrate_device.c     |   3 +-
>>>  3 files changed, 120 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>> index c4a811958cda..86e1cefaf391 100644
>>> --- a/include/linux/huge_mm.h
>>> +++ b/include/linux/huge_mm.h
>>> @@ -366,7 +366,8 @@ unsigned long thp_get_unmapped_area_vmflags(struc=
t file *filp, unsigned long add
>>>
>>>  bool can_split_folio(struct folio *folio, int caller_pins, int *pext=
ra_pins);
>>>  int __split_huge_page_to_list_to_order(struct page *page, struct lis=
t_head *list,
>>> -		unsigned int new_order, bool unmapped);
>>> +		unsigned int new_order);
>>> +int split_unmapped_folio_to_order(struct folio *folio, unsigned int =
new_order);
>>>  int min_order_for_split(struct folio *folio);
>>>  int split_folio_to_list(struct folio *folio, struct list_head *list)=
;
>>>  bool uniform_split_supported(struct folio *folio, unsigned int new_o=
rder,
>>> @@ -379,7 +380,7 @@ int folio_split(struct folio *folio, unsigned int=
 new_order, struct page *page,
>>>  static inline int split_huge_page_to_list_to_order(struct page *page=
, struct list_head *list,
>>>  		unsigned int new_order)
>>>  {
>>> -	return __split_huge_page_to_list_to_order(page, list, new_order, fa=
lse);
>>> +	return __split_huge_page_to_list_to_order(page, list, new_order);
>>>  }
>>>
>>>  /*
>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>> index 8c82a0ac6e69..e20cbf68d037 100644
>>> --- a/mm/huge_memory.c
>>> +++ b/mm/huge_memory.c
>>> @@ -3711,7 +3711,6 @@ bool uniform_split_supported(struct folio *foli=
o, unsigned int new_order,
>>>   * @lock_at: a page within @folio to be left locked to caller
>>>   * @list: after-split folios will be put on it if non NULL
>>>   * @uniform_split: perform uniform split or not (non-uniform split)
>>> - * @unmapped: The pages are already unmapped, they are migration ent=
ries.
>>>   *
>>>   * It calls __split_unmapped_folio() to perform uniform and non-unif=
orm split.
>>>   * It is in charge of checking whether the split is supported or not=
 and
>>> @@ -3727,7 +3726,7 @@ bool uniform_split_supported(struct folio *foli=
o, unsigned int new_order,
>>>   */
>>>  static int __folio_split(struct folio *folio, unsigned int new_order=
,
>>>  		struct page *split_at, struct page *lock_at,
>>> -		struct list_head *list, bool uniform_split, bool unmapped)
>>> +		struct list_head *list, bool uniform_split)
>>>  {
>>>  	struct deferred_split *ds_queue;
>>>  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>>> @@ -3777,14 +3776,12 @@ static int __folio_split(struct folio *folio,=
 unsigned int new_order,
>>>  		 * is taken to serialise against parallel split or collapse
>>>  		 * operations.
>>>  		 */
>>> -		if (!unmapped) {
>>> -			anon_vma =3D folio_get_anon_vma(folio);
>>> -			if (!anon_vma) {
>>> -				ret =3D -EBUSY;
>>> -				goto out;
>>> -			}
>>> -			anon_vma_lock_write(anon_vma);
>>> +		anon_vma =3D folio_get_anon_vma(folio);
>>> +		if (!anon_vma) {
>>> +			ret =3D -EBUSY;
>>> +			goto out;
>>>  		}
>>> +		anon_vma_lock_write(anon_vma);
>>>  		mapping =3D NULL;
>>>  	} else {
>>>  		unsigned int min_order;
>>> @@ -3852,8 +3849,7 @@ static int __folio_split(struct folio *folio, u=
nsigned int new_order,
>>>  		goto out_unlock;
>>>  	}
>>>
>>> -	if (!unmapped)
>>> -		unmap_folio(folio);
>>> +	unmap_folio(folio);
>>>
>>>  	/* block interrupt reentry in xa_lock and spinlock */
>>>  	local_irq_disable();
>>> @@ -3954,8 +3950,7 @@ static int __folio_split(struct folio *folio, u=
nsigned int new_order,
>>>  			expected_refs =3D folio_expected_ref_count(new_folio) + 1;
>>>  			folio_ref_unfreeze(new_folio, expected_refs);
>>>
>>> -			if (!unmapped)
>>> -				lru_add_split_folio(folio, new_folio, lruvec, list);
>>> +			lru_add_split_folio(folio, new_folio, lruvec, list);
>>>
>>>  			/*
>>>  			 * Anonymous folio with swap cache.
>>> @@ -4011,9 +4006,6 @@ static int __folio_split(struct folio *folio, u=
nsigned int new_order,
>>>
>>>  	local_irq_enable();
>>>
>>> -	if (unmapped)
>>> -		return ret;
>>> -
>>>  	if (nr_shmem_dropped)
>>>  		shmem_uncharge(mapping->host, nr_shmem_dropped);
>>>
>>> @@ -4057,6 +4049,111 @@ static int __folio_split(struct folio *folio,=
 unsigned int new_order,
>>>  	return ret;
>>>  }
>>>
>>> +/*
>>> + * This function is a helper for splitting folios that have already =
been unmapped.
>>> + * The use case is that the device or the CPU can refuse to migrate =
THP pages in
>>> + * the middle of migration, due to allocation issues on either side
>>> + *
>>> + * The high level code is copied from __folio_split, since the pages=
 are anonymous
>>> + * and are already isolated from the LRU, the code has been simplifi=
ed to not
>>> + * burden __folio_split with unmapped sprinkled into the code.
>>
>> I wonder if it makes sense to remove CPU side folio from both deferred=
_split queue
>> and swap cache before migration to further simplify split_unmapped_fol=
io_to_order().
>> Basically require that device private folios cannot be on deferred_spl=
it queue nor
>> swap cache.
>>
>
> This API can be called for non-device private folios as well. Device pr=
ivate folios are
> already not on the deferred queue. The use case is
>
> 1. Migrate a large folio page from CPU to Device
> 2. SRC - CPU has a THP (large folio page)
> 3. DST - Device cannot allocate a large page, hence split the SRC page

Right. That is what I am talking about, sorry I was not clear.
I mean when migrating a large folio from CPU to device, the CPU large fol=
io
can be first removed from deferred_split queue and swap cache, if it is t=
here,
then the migration process begins, so that the CPU large folio will alway=
s
be out of deferred_split queue and not in swap cache. As a result, this s=
plit
function does not need to handle these two situations.

--
Best Regards,
Yan, Zi
