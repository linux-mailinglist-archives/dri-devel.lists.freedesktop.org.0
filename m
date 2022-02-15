Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117B44B6F03
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 15:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAB410E2E8;
	Tue, 15 Feb 2022 14:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA3410E2E8;
 Tue, 15 Feb 2022 14:45:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hfe1ClDFEnMVDgMsJQgvW1+E9rwhR4+HrkwqIbnLeqGY8AJwPbGvUwdrHgRiQFOVP+t9SyS9zmfAf4PqQ/VhdYB04algAsDbC8o9mH4jsPrUeAomDp7/sNBaVl7MZZ/FHshgCHL1ohGq4GcfNVD+KQxQ5goEjPl/K8hzOAFTz8+4jFSSIjSTrwsplc4I+ccuGTqfeoWCz3mzhv51Abb3yyiWlaRDVpgcx+1JPqnFtVOi6LaX9Sv6pU6iM1sPfyPHB1cIensvs5oZzi9ImMKUTFwLhq7LuspVmSfCLfTxfhVkIOxY3ewPjTbmsSV3z4BTyJHQGBgKaVrwiwKtphzzlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kyPbBUhjsNKqby6NXIDU5TFDJlvkBAZFZDZE8OGN8k=;
 b=c2f20Oem0JWeig+5Pn8S4aDiXcaqCE7iU3VcusIuPvCrtHRPrz/kXDUG5U1gqzBoiY1WnSCNRpYiGof8pKfzWJOyF4znIA1p3yYo/J92JehJ6CFx6omwBlW9JJImtHbxoumZSQ+B7hsmK7aCSqHOGyko98FygAjKAwGvMzNWaulN0SyJscyXfCgt5fluVyRi4R9INX0HacpJFFY2Bb5fULwary7v5AhvppdguapRn0mzr2pp20GLVID1MnPuzyyYuPW7PFoNSp8sqBcJfalkjw+7540eRDGJ8AoZiEeWkWV3k9MkYOs2KMbqbq/bB3FARbFmcbKpMygfMnZeoQeapw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kyPbBUhjsNKqby6NXIDU5TFDJlvkBAZFZDZE8OGN8k=;
 b=j4ZGibCbIwYepo3yDgWLV4ZGeNU1a0aqq/B6W4MLfs1OTH8SVPy2RXhocqSCc/qP5Zm1ZtEG8WJfp5urqh57shA1hDKSAjDWxbwQBJCnCVuy8jWRt+fqf7mbidlDA1ZOcbm1AC3nZGogXHFxeY3gLH3jNi6Jq5P+gHqZCxb4JAEY1dwxkBEXkmZUekNhhlKQZ+fJ6Q5DW0KaSczAd8XIO5zX7g0fXPQ6KXPwm7CDUQHi+xc5K4IZsE6MIHOO2obEaMSGaGsdKa4mvqVe7eYy6iwDwaPuRE9H+VuzpJHIgTX63d2PBd/fc45EFjiXhwUDkDKiD2+3M8banki3FC0i8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 by BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 14:45:25 +0000
Received: from CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::287d:b5f6:ed76:64ba]) by CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::287d:b5f6:ed76:64ba%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 14:45:25 +0000
Date: Tue, 15 Feb 2022 10:45:24 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Message-ID: <20220215144524.GR4160@nvidia.com>
References: <20220201154901.7921-1-alex.sierra@amd.com>
 <20220201154901.7921-2-alex.sierra@amd.com>
 <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <f2af73c1-396b-168f-7f86-eb10b3b68a26@redhat.com>
 <a24d82d9-daf9-fa1a-8b9d-5db7fe10655e@amd.com>
 <078dd84e-ebbc-5c89-0407-f5ecc2ca3ebf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <078dd84e-ebbc-5c89-0407-f5ecc2ca3ebf@redhat.com>
X-ClientProxiedBy: MN2PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:208:120::34) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ea7756b-1a62-454e-37b5-08d9f091cd62
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB575302CA4A9F9B37DB4B119CC2349@BL1PR12MB5753.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dis+xxQLe/rSPTEj2uIwLzV7Kd3Lw42GXRacT9+wzW9Tu1P+S9TDmZCkkWUHUm//hE4mwaET1QXX06QCDJXRDuhqhjnL470WCkXuS1CG2Y2l98EmDF3q2OyafSHrnlyBbFWgXnFEiViZoMSV6xVwvAKOqwtIIvIQymkLAub1//V8DDBblVyoDub0BwqREdFqJIaAWqbRxriFVWv0FALHfJ4R+AwTgyK+MnAWdX2kqmSPl+1funpwghqmVXr9/eZzWnvqUtxU5IEJXa0JvqDHjH7XK/9ssMbICfhqNEZKDTwKRoJRvqCynqd0QsX/gnbgu/LqfKDsB/pmo/mB8Z0iSAOJNaKtMmhtg1x/EtshCJVa46VSrerQpQXOWa+LEi5IL6WpY+SFnGC/oISXImsfkidW5hxJM681xyALsWtODc4CjsdpmdDDauF2vYr2RbsIpTmBjHpCzOCfpr5lG+fG54Hcr6c/U1BfLX21Mj9FkhaJf3bHjdjScLIK5sZ3REecDDimKZstygpx20pbR2S6aRDILD55YcQ9Ml5H3GpbLQrHzsBeKvzMkeJ5sudoEiNv17VXGUMJPQWXpVXNBXhH4eBS9UuUzuRO6Jk+pw/gDIjxnuaxrkL3ZGBCGAIkym80lIt/0JoxWHbVdWjQ5ztHYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(2906002)(6512007)(6506007)(508600001)(4744005)(7416002)(4326008)(38100700002)(33656002)(36756003)(6486002)(54906003)(86362001)(6916009)(26005)(66556008)(316002)(8936002)(2616005)(66476007)(186003)(1076003)(66946007)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Syh9eRIMED1leK9rLOa0QQUONJJmdiEeQKje9bT+UhlnOppEABIrUkME53y1?=
 =?us-ascii?Q?+SugnVW0jTh5GbN3s+lnYkCcqFQFrZITWrmpzV49PGvB8dRIu71LuckuCRVd?=
 =?us-ascii?Q?STWyaIPZOjOXvRcKA+xJ4vRFdM8eV04gp2xFiTnQpAFqoiTfkZYtC/rgo6aK?=
 =?us-ascii?Q?nFQnrTyCGa+j3nyEi4/d3s9nFF9G8AVNG0c7GzcmHD7MwZdZkW4eG6r1BLfa?=
 =?us-ascii?Q?n1vzNATEzuIJS2KkjDB06JgfgOIlInbeD1CPlgH51BD5gOo0lrjNZYTsHOCi?=
 =?us-ascii?Q?Z2l3c3G/msq3XBikfBLmcraW5jDdRpVdFN/8MuOdiWcF/MjItGTZJDz63e3n?=
 =?us-ascii?Q?/rE0oE1XNSA60XwdnRjvaRAkai53uuUxuT9rTQo4wKlVc8BmqKz1m+e3aCUI?=
 =?us-ascii?Q?xdcuBxmb49h8zo36sr+YQW3YfMXyQ3XD/CYErBxnS+VQj2VWt/dKJT3gBbGw?=
 =?us-ascii?Q?TtWA41hY2J+bj6H8E5lOvqu6V0gBBoQVdxmrhiU4GAu7dpAEWo0jC1WaxwZ/?=
 =?us-ascii?Q?HsMT6KM278QMwUJQ+jG4huwG7fQ06YixwiSyKFfhmkWXIhMdAzGfc746slTz?=
 =?us-ascii?Q?y+lJXrtqLbNW+7mt0CT1XAKBKPqkpTcS6Xs3W/seXD61cuiFAAxi9wsAw2Q7?=
 =?us-ascii?Q?N6m/snv1yA7Q4ARxNWurKEwS9EF3FCt6Du06W9t2uPlOAVt6lXc3X5qN0bUG?=
 =?us-ascii?Q?mbimOG7MnvtjbYjEpEonlOtwOKC8Qv2W5tiI260LvP0Fjfzgu9rVnU3++rQO?=
 =?us-ascii?Q?yftCHZLcxNb6NU6Std6fg9LMFl97gI50xq93+u8WzOTwQxjDurNptTmVnip2?=
 =?us-ascii?Q?zTc+PsCfPa5/e2ozTAWxA6zZUSqPwZ95R2ri7lRu1nJZIRuriqXqqcuZifTf?=
 =?us-ascii?Q?ElOluX7Wx8gH0STVgR2pQBZBG35OqVlXwb8yZ2Npq3HNUIq8iTIlAlBub9Ky?=
 =?us-ascii?Q?u3HfGWvyIEJ9zNlwrMeVdTjdLmpGSfyYY7L/3mga9EI84NL9kxacevHxHHgY?=
 =?us-ascii?Q?eM3PioKt+tKMykLL8MmDaqr32tO1mnZ7ELsIT6wlpavhKmWA16xpU5jWZlrl?=
 =?us-ascii?Q?hA6D9V1qyxNb2BIfV+cPZf8pQTmzGchh3lrYhrikMVBRWV68zYy3oYe2/6Jz?=
 =?us-ascii?Q?PmLhiNdaiK6R+0ayZO1VQsLmWf3KOZ9HhDcy6n0mowoVKx7iv5HMx/Jd/2AS?=
 =?us-ascii?Q?oWwbUZNdAIFdsep02yIrxVFckrSSwRNTdjh7yACh+rxAD66WpzRDq7DC/1M1?=
 =?us-ascii?Q?jYmX20E2KQzLwt6/FPk/Lovs5iGZaQfGT91FKXeRxfLNNdHqZB3+aKFXWsqE?=
 =?us-ascii?Q?Wm7f2QWIW+C8Qc7rZTSHZWEUg8Gul7xRjpKWgnuA875hTGl3xIrpklVTi2fu?=
 =?us-ascii?Q?NoIib5RlNPhCil2l0YWaH7irT5Ae5jjd2AG/WXzpCLhogD8OVgBR8MZ61tbC?=
 =?us-ascii?Q?5/pbc9hGYBmMpEeHJvjjNyBbkW2/HzCjNhGQRKT4kci0H1zQCq2EwNVVRxp6?=
 =?us-ascii?Q?1MfhG56ac7H4EW/+aEiZ4mCq0+s1QU2smPGADaveag6iHrSnIGEBr4R0WI/R?=
 =?us-ascii?Q?b/uH8tmeXxQ4YebBrig=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea7756b-1a62-454e-37b5-08d9f091cd62
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 14:45:25.7575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JsEKIYthh8Lf6khvZ7B9lmUlV4NCTkG+OgBkO6Cexn/DhEaY3hs6YpS+AsdQ/jsv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5753
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
 willy@infradead.org, Felix Kuehling <felix.kuehling@amd.com>,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 15, 2022 at 01:16:43PM +0100, David Hildenbrand wrote:
> > fact, the first version of our patches attempted to add migration 
> > support to DEVICE_GENERIC. But we were convinced to create a new 
> > ZONE_DEVICE page type for our use case instead.
> 
> Do you know if DEVICE_GENERIC pages would end up as PageAnon()? My
> assumption was that they would be part of a special mapping.

We need to stop using the special PTEs and VMAs for things that have a
struct page. This is a mistake DAX created that must be undone.

Jason 
