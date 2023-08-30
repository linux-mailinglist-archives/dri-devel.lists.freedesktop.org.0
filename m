Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 424D478D764
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 18:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6308110E558;
	Wed, 30 Aug 2023 16:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2085.outbound.protection.outlook.com [40.107.212.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DE610E558
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 16:02:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzFeKScLPSyk07Pq1fkCto96IGxd/tp2i0bEe0SekUiXF69UCYuiNoH8TePdo0+3e/b5zJjo5OFau3I7nWwKHsLZhzS3yc7ZTeuS04h/A8yT9AyCXN0o36xNyftbgBZG0NuCMiNtG58i/T5iapxcdyWDxA3FXpMdHnl1n9ivzbSqdYpw41LMWRQmNwCNvBQSPGydtEKng/nmCOi9auSUQ99ytp3x5lJCvkXJwhAyGUtwZ2YjJdAEaQJcBv+Rx7k2/TM4kTbpaXU0B4rClaW/hQwsCCXQPWbgk9tOpp/1seU0T12oniaRfrED7QJBR42j/mmybml6jxgGtRqAb8RMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDUKx57B6DksmABGY1AZwOhnfW9w+zF/hRQ6+PObYfQ=;
 b=RdP5IQICanL98glP1Iv4cHRCJCSYS9s2dFdsyBmu/sGbgYmaO0xIYTa2cGGoajIVCQLvpmeJ7IJVeZNTvwqYwz/fkRWQOPqIeQ4ZwYN93ljfHVzc18WZe9qiroTvWPoCjwhQbrBexFwRW55oHzZG3lxHrmzTRGy401Ieb1Z3S+BCxj3zCh7tGGtdpd8c26n5stavocigdpQXZKshk4xZ1cA4T3F4vrDux1dzowZ6K0dSLgIjiW62enSiQkN8SagASmcmelEJeFbwesYeANZIVc34+VmGggETQ5q5Nnp6NRJBy9//fEKWHZ4sgM1vWo40KARzuJW9TqukTHexMak0BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDUKx57B6DksmABGY1AZwOhnfW9w+zF/hRQ6+PObYfQ=;
 b=Lb6JxXRq+F1fX/mieXZsG5rm96yMiYn3F13CgeWdQADW6+C/w72pG8OnNPnxf9sm0mXg1Vxf7BlENCV4K5gRwNjJ4H/KjQyYLcT3ZenK7upGFKG8q2k8mMnsrj9ii8lFuY/ZO7fsQMxgRLMwM173/lxSj/60/faL1tCZcqsD8iXeXLS+EW8FhgUZ8klzueDIIjQhd7s9Cr8ay0k9DfhQYBYdKGJzQlpfk0xrCiiqUH8yYrDi26DDFUmT3FIEcNvmrExooFv1AlzVuntRKk3zsWjsYKECWPFD3ZzaEHq+/bVvQLWA/u9TItw3s4lnjFoYz6YeTeNqA6YhFUpmJZsJAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB8124.namprd12.prod.outlook.com (2603:10b6:510:2ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 16:02:20 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 16:02:20 +0000
Date: Wed, 30 Aug 2023 13:02:17 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZO9oCU0PZv+rBrHp@nvidia.com>
References: <IA0PR11MB7185974FA204015EA3B74066F809A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMzz2OKbmiD6SKPE@nvidia.com>
 <IA0PR11MB718593A011700F06BD6414E8F80DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZNI4KV+Z7CvffiHI@nvidia.com>
 <IA0PR11MB71857FDD99CAC23C88C9F27CF815A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87h6oswysm.fsf@nvdebian.thelocal>
 <IA0PR11MB71853FB79625A4F2399FFD79F81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87o7izlcg7.fsf@nvdebian.thelocal>
 <IA0PR11MB71855031E9159C8DCB311702F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <IA0PR11MB71856D8161600A04427E5A87F8E0A@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB71856D8161600A04427E5A87F8E0A@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR03CA0034.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::47) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf003fc-1022-42b9-0d7e-08dba9727dc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JKhWPqvx+W2JHj2N1oSleg+9H+wA+fu+qiDj05/dvnpMm6OcV2eXRnWw7im9tcUMjzKuKHdCNl2jMuJQZDDDPrXZVv7KX79aCVoZC6fSf15Q0X+5gZXeoV8YUuDXnIWuFrgI/AGsdg8PFy+IOzL/2wVmHV+zW6TghOHbQZm1btJPbG6RQ0o8AtyhZrDbxt7R4aVtxoYY5g861HejNJZjXtdyyJ574DhPBiPLaE0W3YMWXA0batfIgak6sENL1Hzy5sIugXbTWM8nMrTybKpMOxOmogMSRgJJTAdcdjUJzQK/zPoevjp1W+rWm0F4y7dbwYeEgM3frOahu5TlwCW1tSW9yvrSSwyAlQy/qjzMFrXsCaogrNg+20ZJXKgwq6RqRxfPCVGb/GWQ6PYT0T0RXV9OXarfayNXLx4R02dFmRLIvGffoZVVw9qLILEjH+o9SIjsSqB+nThZ0vjH3t9LaVzpLsERSmsI20AMKYsdjGLbcFtIs7HEMKzBtdeoP5GYwdVtsDJsxTuot08E5TeRuLiC1YUAa6T9PlfMcoGifpwKxWaN5IKIlwIkD+YwzJipDdC+umZ8LYCSwWJ/n4fKEJBTiQEAFZ+ZRKV3BhFhBgs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(396003)(376002)(451199024)(1800799009)(186009)(6512007)(38100700002)(316002)(41300700001)(4326008)(7416002)(2906002)(83380400001)(2616005)(6916009)(4744005)(86362001)(8676002)(5660300002)(26005)(36756003)(8936002)(6666004)(66556008)(6506007)(6486002)(66476007)(54906003)(66946007)(478600001)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RqVTOuB2F1TMQEG+FRPAPPCloaUlxi8xpdEHssnFyarKswc0vsOEAoroO9bH?=
 =?us-ascii?Q?P4p9AjxEmPXIa5JFgFtVZF/9iXr4zW0Iw+mMLy4UU46YeXvYze3a6l1+9v2p?=
 =?us-ascii?Q?b1SfUE8HXfKUwVCRU2YO0u92Czy1uf4hn2EE4/I5x2vnov93pnZdPyZnhic7?=
 =?us-ascii?Q?OTfhNSVCzMWxzmvtq5e4383wqWbVORiYhRsXrgUxM9fbdgnhSXlYMfoIWMD+?=
 =?us-ascii?Q?hVDrhIo1OvCw8B0rIjVZaStbPMSJCLTjXa2oyMa/eGa9Cz1OaePULxXTL8Ro?=
 =?us-ascii?Q?qzjEcec6ZwLus8e+hwJF1uEegg+kiidr6vErxVL+J6m3++1uhXzjv3Z6ly/P?=
 =?us-ascii?Q?rCAbVVutkabT52X+KeDdO4kFgSHS3/F6mpmM14Es1DFqFIBUgnc96neTujyO?=
 =?us-ascii?Q?e46n5oARxp1VIa0Y4D7BiYTMDkabHoR7oFHn2gMoK2RT5BuoTj9/018Fyawa?=
 =?us-ascii?Q?a/TwETE84a9Dzh+g2V+FIK2id49xSOVlNuUGWvYzEtUW9Xxaj9FhtmfIq+hL?=
 =?us-ascii?Q?BDCzH/fsAwaAOWnAiI6cfcjoUPs2e5TCFY5k5NKRLWwzfYSZimtkRaoeRO0k?=
 =?us-ascii?Q?9jNX7U0dYeV9ACdLw6WkD7pKVtVUEJBtFACRJR0xSyLOl96G1RyZHiaFTQv6?=
 =?us-ascii?Q?yHCpXKdapkM2oI0HJWr302tRk2+gogz/5zFHeGkovqOd2+YBNhL8asc8Tyot?=
 =?us-ascii?Q?jDHdtLbIiTcNqliGteNaKAJNC76dgfvTSDOVJjzUy+oLqJtsXHlsYcy+oG9n?=
 =?us-ascii?Q?KlC00NWqiRYsBvFZZ8Q4kIRKG0KG1U2pi5lK3KMqYCT6Fs88RF+fOLf3lOEh?=
 =?us-ascii?Q?Ep7YhaQ7QG408WMLO+J3XFuGNBzaRUMIh+ePJ+SHhVDH24+SbNshYAZz4yLD?=
 =?us-ascii?Q?KGuJZGobL1tHjotCwDIFWuh5JSRtI+iB87Auzf02RLygYEckOZF3NLCTH3j8?=
 =?us-ascii?Q?7yN/wohsdAD7shvqs44YSHY+fMpFviMCjGPlfXZ8XRHKBSJ/RUx1AbQyAGHL?=
 =?us-ascii?Q?RjUCpfjZvaWSlk5DnKObljObmuikszZncf0tTLFFVRI6hsr18lwSEQ7a8cuc?=
 =?us-ascii?Q?mgrLiFqsKMOv5BIBv16gGVImPnqVmvyfjEV7YTm6fzwO4P/3efIWGSWhWSJ/?=
 =?us-ascii?Q?WlFYyHtMoGxk9XHUXLwf6Nf3iE3rJJeGEmsm29OXESSaOxo4xVFI3OcfehV9?=
 =?us-ascii?Q?4djubXnosbOzoImQac2/vlPaNt5p0Rxq0iIdW9HbMgUnarZJZNoIkP2MTljF?=
 =?us-ascii?Q?QfbsjHRcOgOALX+t7FOk5l00xi7MkC7+X53DRObekSu3khdT1aDMr93hmZsN?=
 =?us-ascii?Q?fYUhTpz4y4rDoEGl/HEKHMo7AO0D7PvsOCznf+5uD1IMPZSg2h6kZpSf1Bd9?=
 =?us-ascii?Q?XFM993rF8RDNabvu0P0DHBKut6Xt6JiuO2nzRo7LXtjqwiVtodu/04w7vkVs?=
 =?us-ascii?Q?PzY9gYyHqw9Irb1K7aI0Y1TonBxXHRfzYd0kZ1PgpvcBsxNwoBDaLgSKeY6J?=
 =?us-ascii?Q?G9XDy04r1IlX1LxhLCmteCrZ6lwSuge0V/8KGK0XxISjlq/flcEuo7uYxu4u?=
 =?us-ascii?Q?zSsRHHVRUprlW7KFb2ctfy25t5+Onq9rSdAKb6Mt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf003fc-1022-42b9-0d7e-08dba9727dc3
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 16:02:20.6601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kV2EV0EQlTA1MlMpLIJrePJrVEjRbl0Bt4GjDyHoeDnjrFLXnYfgPpflXjX8c2Ub
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8124
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
 Gerd Hoffmann <kraxel@redhat.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 28, 2023 at 04:38:01AM +0000, Kasireddy, Vivek wrote:

> Turns out, calling hmm_range_fault() from the invalidate callback was indeed
> a problem and the reason why new pages were not faulted-in. In other words,
> it looks like the invalidate callback is not the right place to invoke hmm_range_fault()
> as the PTEs may not have been cleared.

Yes, that is correct, you can't even do the locking properly if you
invoke things like this. mmu_interval_read_retry() should continually
fail while you are within the invalidate callback.

Jason
