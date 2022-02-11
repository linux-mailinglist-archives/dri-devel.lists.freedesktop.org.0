Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDF84B2AC3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 17:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068FE10E245;
	Fri, 11 Feb 2022 16:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E05710E245;
 Fri, 11 Feb 2022 16:45:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4DV9LySkGHSpcoNB4Sm5lHrx1HYsaqZlzMbqWCxjbIYlOSDkY+dhwKs/xDbJ/4bF9RJbupxhQ+RJCrf+BSUGS2L4CUcpFBl88b3qsEvfJrIx9psA+EEcrBE6zb5TTKEbMbpHaxYLtgQ10FUSCCjyHip+ikCXB+sWppa3tstPKK0/y3BQTgaK70SfY4FsRkrvu7Op/YRDCjJYByKT66SHJUYgKQUJuqVb9V+MNEoxRWWOE23/8lNW+l+2V0kBjlLplqX8KQ4Ms0cEjIyIPBCprN84rEeWAMVnDqxgHeXYo05adUk+ie/PratD+NU69KAJ6h+vvl1wiERZCjaY97y3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0q7hVifWbHkgCneLmFYqw1KsDmADe1ioXpzHF4oW3As=;
 b=ZK1IOdny1lKD70ATjmvik6Ki1+H5jF3awmhnIqWhQ1gqz9ZufZbk+QPa/ZS5pBm5oA/fHgEAXJCPv1d/nbzlBFZzRPmONbXcEBOKAh0l+p6i+NaZOx4SNUg4RZTiOal4JZTqILZY3IuL0wjGoa1FtngkWDTY3ANe1fmfnQCCJFBD0IRdqJMMzDYWNhy9Hm/IHDKOpuWU91Rn4S93N8jfYw/pvbH0Qu6D1J2Vb9Vebq7uSpr91XPD5DNm9JVnSiYzYKtXbRr4JxM31WeQ1keN4POaEMpCaU2G+cqvVKi5ZO3oITZgpDz/iWNMu2evNRkeNhJuyaRu7y4OUZ71X8XOkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0q7hVifWbHkgCneLmFYqw1KsDmADe1ioXpzHF4oW3As=;
 b=VqelS0OkGZ9tqkVI4N+FK0Iakey1XB4/2QQyRLAHD+2C9dn1iEeEeGZkwOIKF6XdjWOyncqv4d23trcf5+6RmpaLDSxYG5Aez9x+iq0pW73YA4EQj5uUTa6D5G3DzEtiv7wkwWHnxyVkHtdZFi1nGmDTQC9Md8SW9ppovAW6koW+8l/RQFyCLEJhKbAIfDoBDKupp6zKHjGHmUxLSQO9Z5YTSa3SckP5YOS84TdniYg1OSqmGfHP8TQEAb7pboUkb/jC8urxmQ2DTiS1rH4tQlX3ypxqjisORd1wSkCR591WTY4KilSGh/hqhuiVkxDd9G9WIe/ZwvIShGwmVwD8sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CH2PR12MB4875.namprd12.prod.outlook.com (2603:10b6:610:35::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 11 Feb
 2022 16:45:38 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3%4]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 16:45:38 +0000
Date: Fri, 11 Feb 2022 12:45:37 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Message-ID: <20220211164537.GO4160@nvidia.com>
References: <20220201154901.7921-1-alex.sierra@amd.com>
 <20220201154901.7921-2-alex.sierra@amd.com>
 <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
X-ClientProxiedBy: MN2PR14CA0018.namprd14.prod.outlook.com
 (2603:10b6:208:23e::23) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3b67288-2ce4-4852-4782-08d9ed7def00
X-MS-TrafficTypeDiagnostic: CH2PR12MB4875:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB48756B0E2B4F9F2127774B3AC2309@CH2PR12MB4875.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W10i9T6KBZOXiuE2lKrR38ln5EV9V24mxhFfHhC75+0/EHT21jVntK2z77ptzAV8nrTQF7dTUY7hCmY+0czE2ce6csEOey79nlhGBEr9L9vSdejMuYXAULEAA+BFiiM7upAgYkIl4kFMrssU/hy6mHLnoQ3Xr6P4ChakHF7FHG5q55OxPSxJ0grvEGZBqiRCRxwQy7HzhRcTh5/Dj0fOvpySAEp4vBqTclntQOpGmeQoU5sVhrJsQGHL+W2sAfzhFAd3r6QykmHamUJoNsu1CrYJX2RiyS1wpvWqZeEl2gY6GAFss1jDdT75f9M3FBak78fOXENOX4hbT7koZmbgu2Czl5k3y8wezCtvMy8rY3KGkabzXBKGizAWDJV5jXvNGXzmQtMyhbzaqG4Vhf2Ub03pRteT2rPzjTTi5Mpodv8CX+2HGXneYREzz2VVsuE9eBHxfmCdiD0zxq5anjeIsbhqhqzarxyz9pdZJkLfKfTtzaxL3HKnmsWs9apvxrV/xKozstg0ttOOLjqRq2xBKrQ9MjcxOgmHqEavB9Sj3q/Dha42cZ0ODaEhJb+E+lHOwgDstXCy1ULqkXHUMZ9H4ZkImiA2okAmoV8eN8i8ZQGCjVVoYxqc1wrO/ita4zOpiQC6ai/M3heZJUIt8NwnLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(6916009)(186003)(316002)(6506007)(26005)(36756003)(2906002)(66476007)(558084003)(2616005)(1076003)(8676002)(6486002)(33656002)(7416002)(508600001)(86362001)(38100700002)(8936002)(4326008)(5660300002)(66556008)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cmqBbkTjYQxUgXqDnfpymxUBs4Td+y5o/HRh7XQ1PCousr9XFI90AgIMvdk3?=
 =?us-ascii?Q?6EmetntOqFlCQXA99Z1QMex/mSEXT43yMmTZWCklq6tLSR8GJ/riAeV19Qlf?=
 =?us-ascii?Q?z1Vnlc8UovPL3dPThcsMRCsI7SlG+B0zv1Y9hLg8y+I8MIwViw6UZRI/ZoH6?=
 =?us-ascii?Q?KCQbJ3P7k57YuYz3fLlzTeBWo+EM3YpdxEWeNccTQFTrBtrJJHe00A/nEudl?=
 =?us-ascii?Q?r/YFkl2DirieZCWDtBoyGQB9v7DYvCBBVEHZx2wEPzlUN+4SOfx5f9MTb53c?=
 =?us-ascii?Q?SLIxT6kmRwdhRATzhHa5H/XxqCrQ541dVGy338/8B9Lj9tezvoJlIFmFxZvZ?=
 =?us-ascii?Q?0LpVEpPZ8e0UtWRObnlyYsfF6kBaIfg2WvE7anjX5ZlE3iv9vwoc31hTWjUV?=
 =?us-ascii?Q?SwGyDRzRRparpwCOKcTY9o90gF17xz1n2V6twe1xIGQO4xivCxRjhQIVNLSb?=
 =?us-ascii?Q?UCxApY7muBYeb4FsxkusF6X7C6HJ+tUBYEYLRMhSv9RR6zs22z47ZVyPAy5W?=
 =?us-ascii?Q?ohjQoNjjrSvFNoPohNWF9Grqr7m1KjLkw3cwjp++QPqlnlj3di2izcPdTCBQ?=
 =?us-ascii?Q?LyDIsQ29TX8HrpnKlJQAE45RrldxmZtMJ7pbvkNy1X0aglHkoW2WcawgJ5X2?=
 =?us-ascii?Q?Vvx591Hu/VaFuobdQVQcQumgR2ogu3VLX3qdURyDHVG2TCFsyDJJdLlQoClo?=
 =?us-ascii?Q?VBpJujIVz1IY5m9iCVDP/hl2IpDsQ+gqUjPyqE+kLsaSICKcD4dyFoyygpW0?=
 =?us-ascii?Q?SN8vfWxu52DEAoL0BlFHqdWcOfTT00ca4AG6/oWHsVmm3mS6CeqGtNDvIJKE?=
 =?us-ascii?Q?fuXwspnyWNjEqIvd7lWXENbFsdrvdeccfIJpYf1iHWA77a5VDx9U4syRnUZs?=
 =?us-ascii?Q?jZMZlphXvEyveJslM7y790Sfklgzy88Hl6QCnMFZ8XhhPSMwNmTWXkGc7bZg?=
 =?us-ascii?Q?NUMTohNVi6VrLv3PT7lzjqqgeUMQd/ikAWVDQtMMagoY0lj9Ff5jWNhaP0Cs?=
 =?us-ascii?Q?mxNebDKjJ0mHF62ZrcA09qDioHBirGgp5Y639+rJ9XPy94A8h6AnOx78yv2D?=
 =?us-ascii?Q?Oo/LnmD4qHVDAd4URoW9cTRbURoOBeIlqoy7Q37DuxxVoLlIUr6/mqvmnyLZ?=
 =?us-ascii?Q?9mQBWiT+pATYmydStAKoywuJzO6ITGcQgpQPCtPWnralB8AlFSSPCwYQgx+C?=
 =?us-ascii?Q?SJTn6yo+djSPaglY6BlS5DN+zclt7fSk/ZlrHpiu5lUXG36SBl1Kj6s4+5CV?=
 =?us-ascii?Q?M0tLnfmT8THXTVcmlwJW0cELmlTo68t06bKw90LzGyemjo0QT9L7oAIUryvr?=
 =?us-ascii?Q?QFGHx9qlyXvrK8qZAM1lTLzuSXECciQRLcJc0XarXQtpJy8P3fhslwj0ZSPe?=
 =?us-ascii?Q?4lCnTZgU0Yu+5krw5r4zyHLXLe5DZEuVnYFleWz0OtwTmueKS8Ximw7m9pF5?=
 =?us-ascii?Q?itDo7HZ5OTylslpik5LbTJhxyrzm9psNe9LbpRlDEl6RBHXXMSkVQwc2xE0q?=
 =?us-ascii?Q?NZRgqwOD5ZfEuTqK62ThCf+VQL5I8zcLCdgBDjNILCajaVLzVPA0ixVzcSTR?=
 =?us-ascii?Q?fQqGCS0n/cdVJPyLlL8=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b67288-2ce4-4852-4782-08d9ed7def00
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 16:45:38.7822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8QtxoM5ohe1EQqdfDXeZP/h5eXjHPNJHqN0uyoT1Jk8jabRLPTkYCVuTXzzY7PT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4875
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
 willy@infradead.org, Felix.Kuehling@amd.com, apopple@nvidia.com,
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 05:15:25PM +0100, David Hildenbrand wrote:

> ... I'm pretty sure we cannot FOLL_PIN DEVICE_PRIVATE pages

Currently the only way to get a DEVICE_PRIVATE page out of the page
tables is via hmm_range_fault() and that doesn't manipulate any ref
counts.

Jason
