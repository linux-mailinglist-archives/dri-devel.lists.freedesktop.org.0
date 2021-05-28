Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26646394339
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 15:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E306F5BD;
	Fri, 28 May 2021 13:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2869F6F5BD;
 Fri, 28 May 2021 13:08:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMxgZYC9dqV/31CjKO1+mznYsavsJ4SPLqysi6cueT3F/auncdJV+HyZPOaPIMqnJ2tKIssflPvKx5zW9xiEhFOFdkgUmL4X7QfAZfx8TrMmTbIsWPs9KPJGmn/DQjmdb4ZbkRmey+BRTIMsG9YVfhhlkiLrrdPG4p9WpxLEcGh7plBwCUmZ6ldcof8BZDt2Rof/WAkPplTHaED1ges1BDveHWvtS9bZefIBphd27v3WVbzKoc2nKzBc1pfdAH5uBbNQqMXH1f9ekgiVHIl1uJQyCbaCFRVp9ChFoESojEkKoTjwnwFy3/evy28R7Kh4bhA+XUGSrVZbQAR1jLCmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXVqZFMpdZj4fDWpY0EIrNM8cXPsmV6Ttf7D3Hgc1BQ=;
 b=GEksb5QWOCu0/Zrs65SQw3ko2bqoRCITVhsfkTuEo986cLvuVPrQc0oZigN6q828u31fq/Q07FRkcxds7r4p78VCbGkzIHlDfpuVZ3Yrw3kH4wwLTFPBDiTAoSLi9wmOM5gb7nbAM79rWhNkOX6ouXRECzFj6DrPu+UlQkllbjc4sHYE37Z0kcpiT7qDhhnRIIIMao3SUCit1rN9YQ3MDzDjl2yRoeqFLyqbJfnM4s8PLgV8Q4yxq9/R76LEyFvQ1DvcmwvHYphmEqpgTGR0C9YnVXwTkiTBj8vaonCHL/BmIJlIuKXXmeeqt1WOVlrcv3/GGaBNTBBckoSH9+fcZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXVqZFMpdZj4fDWpY0EIrNM8cXPsmV6Ttf7D3Hgc1BQ=;
 b=HNvOGraitn0u+rokHG1/Lytj21ikF7cjyCIaOP8pI2axpH4n+CGXt7SZi3na4NsPl8dFhz1WhvT5u2cQmZEKq/G1pW1MNECVuWPqNIWuPoiRbwEJLLi6wbsLVE4OATYARQGRVf2nLbyVujNA2e8gHHqB3JfS0zMjg3S1I9Xn2ozO8s6jba3FX10Go+L0lty1fHabnbo1gmucpiHGzWd0o6w1kI2R+v47KcA3asoQizj95qWiVgTKlaTUe6/EpFgEIEkGy7WYLhgRBfR1LVZ+eP6ehb6tS1X9PNL6MqnqxTAUiwZF/32v44SIxw62aNdcHVJ7L44AHxxXdHPpVyocLQ==
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5253.namprd12.prod.outlook.com (2603:10b6:208:30b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Fri, 28 May
 2021 13:08:17 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e%7]) with mapi id 15.20.4173.023; Fri, 28 May 2021
 13:08:17 +0000
Date: Fri, 28 May 2021 10:08:16 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Felix Kuehling <felix.kuehling@gmail.com>
Subject: Re: [RFC PATCH 0/5] Support DEVICE_GENERIC memory in migrate_vma_*
Message-ID: <20210528130816.GM1002214@nvidia.com>
References: <20210527230809.3701-1-Felix.Kuehling@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527230809.3701-1-Felix.Kuehling@amd.com>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: BL1PR13CA0238.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::33) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 BL1PR13CA0238.namprd13.prod.outlook.com (2603:10b6:208:2bf::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.9 via Frontend
 Transport; Fri, 28 May 2021 13:08:17 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lmcDo-00FwuC-BD; Fri, 28 May 2021 10:08:16 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfe100dd-a793-4343-8733-08d921d9a8a9
X-MS-TrafficTypeDiagnostic: BL1PR12MB5253:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5253BBA95A69E0C8C920ABB7C2229@BL1PR12MB5253.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FnYTubnWu//RyGWXrWOgNzbbaaf9C0XfhARbbXA/FwOZt2fBj6xDSpYPwJ7WWA3OlNvm1b5zia68h5rsxahX7nZXGCBku/Zc1XC1m8sCA483dhFBCXlGZ5zH90tpNtTqxeAGqndn+xx924QGHaShqEOkXQXu6yWemPV5EBmr1zYw9up9A89AkzAeRDRNk1LgkqeHox6/S4xyka7D3hhXHk7rpGZ4lLsj2B0dAHiyhuq+087A1S31IxWEBiizXNLUcANQedKT0uSuTZdDueJdU77eHyaC1Ykus22JImsEYXheQuP/0ypDWKXS8050W8Qz3rTcmw2zOqjX+jyGSEbYlB/woq9ABUaIi8E/di5GKGh105Ggo0LjDIWxWbwTqcNBvQEtsGQ9CCeUHD0FM3a8sVFx7dwjOIn5bi94DLz58pa09ujQ3k0F1afEdPcjyrXNbQUvYOjV9sUzQOWkT4e+C4LOJaw3EofCSjbyCmJATk6oG+6iPmSh/5RWzm9N7D1lGX3w5oSCDyb0AQoXJKmqgwNuGMA60Ksu+t/ZBbiN0xE+V0xnUjSbS3dIDbQdf7HFwpY/CbO2/b+aRfJTkx6cF4gg23MdOJbWDVS300Gt5rSah/T/bx3X8qvTtHZIvmIPoV3++9farUh7lurN6UFAPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(26005)(9786002)(86362001)(38100700002)(9746002)(8676002)(8936002)(66946007)(33656002)(36756003)(66476007)(66556008)(4326008)(316002)(186003)(1076003)(426003)(6916009)(2616005)(83380400001)(2906002)(478600001)(5660300002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TwBo1+MW8IMaiRAm4bginEhhIw93RwLIw+zBkLfIDIsMUnFlt7vmHYAHKnRN?=
 =?us-ascii?Q?q8AyLmnEfVdr6CzLDXujUktjJCDkVMRga0PFiuUzQVO3hp1aFwZ8lojJgZ1L?=
 =?us-ascii?Q?rfSB4/JQnsrf3IXZ648nGB/yh+dIwDZCZY7u7vF1sT2b2dT8hAasVuuKS7n+?=
 =?us-ascii?Q?KPXuSXcMLGk4QmJPm8Fo+PIFWPIEGdWnegugyNUHAJez7cvnrymfUgUYBpEn?=
 =?us-ascii?Q?As491H+rHXZCjVrNawHdtxzUC2uKF7xaNp0wPvzgDStpMT+xi9o+jp7vpiSX?=
 =?us-ascii?Q?mzHNs8HqrZj8E8ctEeno75fSF53bM6FBzVg5BMVycETkisUxNgcOEIB9eL/S?=
 =?us-ascii?Q?7HQyxDLLpwd+XapOJFSSGfvbQ1rCqB616dBhwAhm5fuW9+uesEk8mPFFTxmj?=
 =?us-ascii?Q?hQ/Mo/YYj4NAiKYPQCJDTAA4iBU95SmwkG8ssFtxoPAkQ8Q0I1uGB01zuKys?=
 =?us-ascii?Q?e6YcaIeuBPjZRST6kKzjsrL1ld6ne9YVPBz2xiYc39nL6M/qhXQ0NYBecILB?=
 =?us-ascii?Q?gLWhT7W9q/YwTzkxbKz9SB8/DhAn61iYC0/PbpiYYBz4GNno3mG6oawYcQjv?=
 =?us-ascii?Q?6zo+wLxHk+3ghEQGVxaOAmPGmKkSrwtHkmb+wccMlr+s7DrkImP9m/2S3rWw?=
 =?us-ascii?Q?ilvxcY+XzO1UHQiLQaNd+wKBElF+lnwsxYAPuWtiEHAktisiW199pscRGkD0?=
 =?us-ascii?Q?q4N4/QwE1CXgPzo8578Qc7rkgO/XHiL4dytsywu+JAPHPNxVabl72F8ksZNK?=
 =?us-ascii?Q?qFiClEviFdvbjxE9DkrsW7Fei+MvYUXkFNA91xrjsghJaG2z6nAw6us6PGlX?=
 =?us-ascii?Q?0SxwQdWE6ZfCBrR3QJRMyAgGvDezFYdsuxv0cUOFGfoLPrWoGIxvQL25LDpL?=
 =?us-ascii?Q?RPQ6o9CqpoL7OxRXLaTAROB7w5TMFZwHcc3OeJVmYxoXJ6lZe0Xv5qircvR9?=
 =?us-ascii?Q?KqhBXx8xLDNpO1W6XrXIxjH/cugs+lDC9uZhMozJz50eMHnwCyE4G/Z52Lf9?=
 =?us-ascii?Q?meJhm714uD47vsTv5eWvR900pht+h1J2hYUYMDUttso2AaBFtdkygjhXEpKE?=
 =?us-ascii?Q?Rd7hCgiWCAD2NGfKt5Fgm9Z/I7KAees7kA0nED5WZLoRjbB8G7RMTBn8uW7m?=
 =?us-ascii?Q?dzU8RESk3sU4lCd0JeaIpwmpy/ILkcd0Jf+seBkdYn8UHA/SZDkHZ3+hhSJl?=
 =?us-ascii?Q?5iMcADSFI8KcSfBCROMHHmG4bzBEl1lwt21pExwy0lO51r0/v0+tNw2xsKjL?=
 =?us-ascii?Q?2LeHvJQ7nrbOymNs7y5QvFCjMT/ph1nKlS8otpHZhCERhqMiPeaDGLhefLmS?=
 =?us-ascii?Q?Cuba1pYm8FAXH/xY80fMHqwg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe100dd-a793-4343-8733-08d921d9a8a9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 13:08:17.1844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6v+OrUAi60leIutP33N2lj+jJEIXfxwL7zl3+1kW9BU2dUZILdHbdUwksd5UMuH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5253
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
Cc: felix.kuehling@amd.com, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, akpm@linux-foundation.org,
 hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 27, 2021 at 07:08:04PM -0400, Felix Kuehling wrote:
> Now we're trying to migrate data to and from that memory using the
> migrate_vma_* helpers so we can support page-based migration in our
> unified memory allocations, while also supporting CPU access to those
> pages.

So you have completely coherent and indistinguishable GPU and CPU
memory and the need of migration is basicaly alot like NUMA policy
choice - get better access locality?
 
> This patch series makes a few changes to make MEMORY_DEVICE_GENERIC pages
> behave correctly in the migrate_vma_* helpers. We are looking for feedback
> about this approach. If we're close, what's needed to make our patches
> acceptable upstream? If we're not close, any suggestions how else to
> achieve what we are trying to do (i.e. page migration and coherent CPU
> access to VRAM)?

I'm not an expert in migrate, but it doesn't look outrageous.

Have you thought about allowing MEMORY_DEVICE_GENERIC to work with
hmm_range_fault() so you can have nice uniform RDMA?

People have wanted to do that with MEMORY_DEVICE_PRIVATE but nobody
finished the work

Jason
