Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4D776BC22
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 20:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39C610E428;
	Tue,  1 Aug 2023 18:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7A210E1DD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 18:19:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJvB4qr8r0bhuXtNc9xPg1sqzpVUDeCjr6v06ZrdnamUbHzERCEyGmY2U9Gk1FQHToqk5LuhruYkyhrm5xbXELGNFCBkyDAdt42WO0JsfMBOTuKem51rhfdOi6RvE2kIayA1mcx4aENLiSHAdzWSaz9OMxorM3ztRuMqODuWw7Ti9wQUVP2+0mJR3rSg1kA2ZxemmoLjBBFQoV0UirhgtCYJ0GN1cNofdPFhsfTS0nzv3N1hEc3G2uCXYUnbxfwuQzV9fdnb8k5awG77Bg0WfyjY2uZzfSlIMwOTwI9YLQFi+fLittoMh+1FJqhL3yTsR5u/oV0VoW/BPJ3AOQZRNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLV57gseTS/iETGEtJVSrndxe8Su7+IOzPpz3gXPiKo=;
 b=mZ3+rZipbuBd4yGVb+f9qR5KmQ3bE8KOHXwZhd/ROqVl6EIfIoK9Ky/R7QlABq4scXfkqjm/D6sCX6yYqpDhDG6nX8dDSl35wNFbvefaaN39Aivr6iYj6kUW1wn7CDeQTtLNsRqRqX5olwDtX0U6NPKOodaSUlys149CjOWP6//v9nKdzHg/wb2AHJRNvhOMfZgJOzkhoucblLvdm/Dx5tNYnzMp4J04BtpN8rWMwVLGUFYIdWFsvhqDY4OxfsU8oG9WunAkDpv6mfZtn0KjIEovI1izLbbkh77/qJqZjfAzCFsthsAeel+VYbHoj3uozlS6XnJam6QjGhcuxU3mzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLV57gseTS/iETGEtJVSrndxe8Su7+IOzPpz3gXPiKo=;
 b=f/bKwsxhW1yhdYkoUChhdJDCeIOWPpHqgjaWdYkmxdnMxPsK535SSlcMVJ/3KX6WPQ6+he6rw8wDejC7uGtPvqEaG+7cnejGQ0ZZvoEvZlgZ/SpQFRGopCcj+D+ncbD1qiGkn73D2st2BwUT9ddnIMbkHAln0ZHvkK+ozOOb1DpFAPSacgW6UKgOI7PehaI+JplYRvYdKolBqjgRDeG5222kGRDbtowmwswNM2Q4yQ7l6u5XbWhwj9TV8AvxnttQa6/NihJ1dWtsNYhia/9v7t7JAeKbgv6CcCoQS2qNYhMPZxCXMkRWXq+1P/75426ZhSek3N6lQdI6pbcLkiZflg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ2PR12MB8979.namprd12.prod.outlook.com (2603:10b6:a03:548::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Tue, 1 Aug
 2023 18:19:15 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 18:19:15 +0000
Date: Tue, 1 Aug 2023 15:19:13 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZMlMoRIkPoO0gG3B@nvidia.com>
References: <CH3PR11MB71779C83F8A0EC6C2F3F4B0CF807A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMbtsY4O3Ho3B69J@nvidia.com>
 <IA0PR11MB71857E9D6C3AD311CF698D13F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMj4Og063T6T/okI@nvidia.com>
 <d4bae5e4-ff92-bee9-d585-9f30e34ef646@redhat.com>
 <ZMj5MvQGk2PQiJn+@nvidia.com>
 <48f22686-2c1b-fd9d-91ba-da6105d410db@redhat.com>
 <ZMj5+7sgkPqHT5Vt@nvidia.com>
 <3427735b-2a73-2df7-ebd9-0d1066a55771@redhat.com>
 <IA0PR11MB7185CF1FDFA5D5EDE3B6AF08F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB7185CF1FDFA5D5EDE3B6AF08F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: CH0P221CA0026.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::6) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ2PR12MB8979:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f6b73a-cc52-4014-2450-08db92bbd01c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GeNsMGBHDXcdUgjKWjiEOXd6FSpFgTntzwbcnCIfjwBZ2UQzb2xNgPu3s3z/HYXWoqsDJjs0gE7eSRDJWpMOoAZrz0YW7o/zy3f7y886O/Fh+yWm5HATO1BiChiCSI+wlPjvYPcVnmz7UE92gxa409++xzploEdm/RGEfMHeujTPGh75CPfCzm6T59Zzono0VgkaoDtAKbhsJbGvrlEql3EJAxqDR6wRLMoUhAFYoGSfpMowmyqTcpf/bw8jVpjspmj/GgorJniKFmJjOBjBIC1f10xC6cNc1XBAfqdR0uFHOCIdNtgsHlIbzXn4kiMcqRr+wnPRtFlEK/E18UwC9VNaYS9rnQ24kVCHRF7cNSoXXQHwCa82NHZ5gChP+TMzp+AG15abXwySaRm3czgMOYBnKACUrR5iVBMOu01OiXywZGadozoGbx4/zEQMlgGquz3i2lKDjJZrVf/UzuvlarfrFWU0ZFMQYlcOq9x7P0MZRtuHirtyv3+uMe7m81s9JyK52hNREX0dWudvD9mXhb5cLzp1ecBjSR4MhwyH7Qgz1h1hQOU9iSo61Lz7A8Wo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199021)(186003)(54906003)(6512007)(6486002)(478600001)(6916009)(83380400001)(86362001)(36756003)(4326008)(4744005)(38100700002)(2906002)(316002)(6506007)(2616005)(66476007)(26005)(66556008)(66946007)(7416002)(8936002)(41300700001)(8676002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r4WDA9bye4hUi99XMrK8eB65xggDbcIDPR7cJlrxNO3nlBU1WN/WjCaZ2P6Z?=
 =?us-ascii?Q?SQF+Rz8gKlDbJPLw8llmR5Qf8ypcS0UK/oV68rXZ8JgHxDTDzwHr6gy+nq9n?=
 =?us-ascii?Q?0TAYwJwbNXu7WYFByEH6cbLlFJejSFN24F+2lMXOIO+4Ii+1PFBAH4a7sL4m?=
 =?us-ascii?Q?3DT5I331zs0AmclEzQ0UYJJy5hcPWh0y2L7Vd8OlSnU8aXvq0KIjih5nkD01?=
 =?us-ascii?Q?no3+Nf9RnwGCd+Q8t0Tue0/NhAiGq74tvQOG6gjUiFpiSPt+J4ApxHKeBJjN?=
 =?us-ascii?Q?6+P6eUnNMG/Eq2ZBncWaXLdGGHzayIHt6+IEyVoGeXKaaY61gBjOwySe7qWZ?=
 =?us-ascii?Q?YcBofDnoWyGYY4pMH4J+HOurIQ/l72wuaHGGkNyxXJcLLS/xqTBySqaPqW8J?=
 =?us-ascii?Q?ULywNyj3KZduT2EUYTJuMvzBzhuEKiDdJ2199d3/UTFODy4muoyv+8EFURHC?=
 =?us-ascii?Q?JpRVsH2pNin70spQNunmLXPr9fwRvTLW3w8lsMPJZVeSQA8sp+NR199foI6U?=
 =?us-ascii?Q?MonoTxszk0sUJXyLEiyHhxSAHaETeCruN8IsZpv0YtoaW7XwxaS4MhLMSbUe?=
 =?us-ascii?Q?kYbOl5LnZmHw8zlECb2+gIQZdZAgdf3TkdV9OZrbor8J2GNj+o+6VQQOJ6MZ?=
 =?us-ascii?Q?HcdAHfrW0Jtiu0+DJS8B/onJ2H3V8PnVJbpIOnT9ViqnFAvDVegqVkdEOaqR?=
 =?us-ascii?Q?BDsDQR/22Y9tyugvTeyinWb0fwp6MS2EUkCeJpEoDZ5VX0ARqc1eBB+Uw3bU?=
 =?us-ascii?Q?8kUtAN0qawkU/dqq/3yEu7iCqnV94CQyiHrfxWELxAe8iMOLYMJbZ3i2bfnT?=
 =?us-ascii?Q?QuF/9RNvCmLJmHt+oTUwdkN/SpeiX6z+uJgHb9WvI9JTNcgBLZUAr2323fVV?=
 =?us-ascii?Q?C2vDKWjS0sXYJrPFlCA5lITYxlHjNl/WTr9Fv2IbfgB7xw1klgYrF+wABDtf?=
 =?us-ascii?Q?8Tcqg/Urh+M2ZHxNW09VYJ3X73MOPCgpM5uDBSc+ekwf3FVPH66oKqtxI/bb?=
 =?us-ascii?Q?3chmQWiJGJlv+hJkrueLxXH2l1VFQPLkgaRh6DDxRQWhkYZw4ZYrDXYAOxeN?=
 =?us-ascii?Q?SEH8wJPCWzXn7zQ1NXp/Ym+m9XsWN7ILUhss0JCq/jcikSSsrl9neuZSgsSx?=
 =?us-ascii?Q?+rawHoOjcmgqw77EUPax4mhm52s1PHiChcg2iPz5jlcVSSOnk2HE5tY2EVGy?=
 =?us-ascii?Q?kbBz9T/g0uLLuXQB+XU2j586skAZ1cbeFfqz3sy10cjTOsQ5X7FzsLncrGy4?=
 =?us-ascii?Q?tjmKq5IYjnDGH2F/iAU/bWvisWkXgAJqhhFWltYb4fpXGNpLIe9XwvuSdHjb?=
 =?us-ascii?Q?dErAJniDw3wJrepGcx6O/2Zz/2OjzvS1xKf5A8tsblaVfV9VEyT40Z5Qwxjy?=
 =?us-ascii?Q?iDJ/rUL7iSWppnT5uVTFuWTjo43sGNZ1Bt+IMYv/5JlY4bJTZj0+Uq4l2P1k?=
 =?us-ascii?Q?wMaoGi24C++COBtiVtJ973uETHd3rs9xGYj5J86FlbxthdFGknRCTqF+jvjC?=
 =?us-ascii?Q?wxb8iyxFvp3HlJd1G0U6IeOnjPTzGjiWxv7MbcV6Or3d2fEtuzgtT8zVDskm?=
 =?us-ascii?Q?RfQEzAsfOvSoR62gTPUAI2uKjHPbf/WMkV6t4sJJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f6b73a-cc52-4014-2450-08db92bbd01c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 18:19:15.3980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3E89Rd/l0ROgmw18Ls+8MX4JnbxroXaFTWZgPP1GoGfrMMqWlDorCMWp2YPpE/AX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8979
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Alistair Popple <apopple@nvidia.com>,
 Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 01, 2023 at 05:53:32PM +0000, Kasireddy, Vivek wrote:

> > Right, the "the zero pages are changed into writable pages" in your
> > above comment just might not apply, because there won't be any page
> > replacement (hopefully :) ).

> If the page replacement does not happen when there are new writes to the
> area where the hole previously existed, then would we still get an invalidate
> when this happens? Is there any other way to get notified when the zeroed
> page is written to if the invalidate does not get triggered?

What David is saying is that memfd does not use the zero page
optimization for hole punches. Any access to the memory, including
read-only access through hmm_range_fault() will allocate unique
pages. Since there is no zero page and no zero-page replacement there
is no issue with invalidations.

Jason
