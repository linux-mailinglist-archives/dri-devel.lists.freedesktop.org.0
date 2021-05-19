Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE59388F19
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 15:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BD36EDAC;
	Wed, 19 May 2021 13:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB3D6EDA9;
 Wed, 19 May 2021 13:28:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQHQ39hWwBktipV7TcC2G2roVTSgoSTr4J+3iBSCCORKOoMlSNhYqKcnCH7rj6E3fdUmQLNbDMKtvOapSxSqm87npjh0j6is/dQSPVAJdXYnI/g7ofJwOMzCrquCHFQbpBFDIrZo305Fl8OfdjZr54hVptaFxOEQ8R/RIO1UdAL+qVTUVRS4y2ets+WvO/bD2GZ8m2Lr25wjQCq4ZVBbEdYbdLsTwcsdMqDijravjppf11DF/nh+eJe0E5tjAAoR6v2cUUcJYxmKm9h3zn/hLWuaKE4YcwMCT27BvvoGOz4tqIzDT4SWH4kzZHtUjDWfktOxz0QOOiMqSFbFZfqB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIXrrVoT7xnB18TlBrA+vGXv0bpN7Vl+C68QPq3kaAQ=;
 b=eul/VpfoyqXSKtGQR2KyVXNEsJQ+ypaO0B2HN9bwPY4JMAN2PmHbwhcxkuqbbyNqdVRvEZGX+Y5J2gb5fMRnJ6hI1czHcS0lxkW/rmg1phTP+ERcNptBzfipkdB6mKIiUe7BnK0tssQgkuj+gv73LR5qH48oktoowXZPC5nL1wak8GKdJq5vQfXUZU5K2N86mYJeIHuYYPaJ0fmmXnCfn7saf91cdRNJNb5/zYv2uM0Iujq5K7EqOMJ1d/T5UwGeXAVKG2jzvcG5kPFejzzNe0MV9e6I3NQO/xGHyZwSIVQIn4RohIVLplULjNxP1OJi7zC5Xhce5bQGYms+W02fgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIXrrVoT7xnB18TlBrA+vGXv0bpN7Vl+C68QPq3kaAQ=;
 b=leA8ktJqAzXf2X5uHXjVKr0Tm0dpzDoAYJ42LOE0fBpbiq5rPx6VUi3XC1acScygP6QVrzTwu1SU15evxRIiNuKUNcqEw4x3QeV3RRBh2pD9Lr0YrlK3JAC4JC/kZ3AEuyEwXJJdV3RSJIL6TIfSXsWVN1q9I2piWDVe53s6y85nQJ2mdjeF4ex7VFAl8fV//F+dSGkw8WIM6Uun1LOcwJZaXhLKkP2CRWlOOq23IES84EmA++Qx/gGWjPxjt7SDFoEZsbA3dYycqMC06WNeGHmQ4fY7YGvf2DijMo1DHcvmptR1rh+FfaCMu+1aXV/ZFVtdS7yJQ7usXFok0yXqBg==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4009.namprd12.prod.outlook.com (2603:10b6:5:1cd::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 13:28:44 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::ddb4:2cbb:4589:f039]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::ddb4:2cbb:4589:f039%4]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 13:28:44 +0000
Date: Wed, 19 May 2021 10:28:42 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <20210519132842.GJ1002214@nvidia.com>
References: <20210407084238.20443-6-apopple@nvidia.com>
 <YKMhorngO2DVrxac@t490s> <47694715.suB6H4Uo8R@nvdebian>
 <YKP5Dj4Q/riGGc43@t490s> <20210518173334.GE1002214@nvidia.com>
 <YKQBACJCjsxeM3ro@t490s> <20210518194509.GF1002214@nvidia.com>
 <YKQjmtMo+YQGx/wZ@t490s> <20210518230327.GG1002214@nvidia.com>
 <YKRRgZmRMdk1vH7A@t490s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKRRgZmRMdk1vH7A@t490s>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: MN2PR01CA0050.prod.exchangelabs.com (2603:10b6:208:23f::19)
 To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 MN2PR01CA0050.prod.exchangelabs.com (2603:10b6:208:23f::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.32 via Frontend Transport; Wed, 19 May 2021 13:28:43 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1ljMFe-00AiBe-GF; Wed, 19 May 2021 10:28:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51402c4a-818c-42d9-7ebc-08d91aca0614
X-MS-TrafficTypeDiagnostic: DM6PR12MB4009:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4009985A1F1C7C655D046DB3C22B9@DM6PR12MB4009.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uK7b7/gne5+gH8pDassTi/nGiPGU8vv5qjsEnFpCglKnSRmgdPF3Img6mQldQaI3kzkUgligeAV9gDW4ekG/IHYSpD8Oo1o+Dvw43EOa8Wlo8VyN6nCPw7Hkg0+nZZmBEZBqy08kwBpdvb/zl0MCW9OAhGRD/2NquQBoD7MpX1cxQWy7FoHdO3qxyCeaNzWO4Od3j82B7O7AaFkCxkvB/P8erGUoTGVKRHNiM9YGpOm0/p3Zd9r4GvquHs3LIfskI0WJ5/q/HW3tKPXxLwKL2Q5s2iSyWzxRMN5dHPe2oHNLJVrAZIaXYr2xKAQENFW/0dybaYFP0SkDT0xSFbyCL1B2doLVBkNMSDYl5D2jG3bOPt7Zzc/W2Be/bwlkpJLToMpG6NE7ODHdinHHhRa64F5F3M7/iVl//3ss88XqUnGARHsyzxgpNWQJUlNJogebK6jLGwWcOHLvQsQkquEsYOYeudkdqrhsQHDWI06SFJEYJgeUN5BAqvu1ak48My8XWEx77/Dnz4KRPpsnVULWDVkVaDgISqCtEsdFqqRJRyYN2pMEy3ZcMI3KJowg4y253OhmEWGb1OJp1Xdx99uloe2uR/xFAhV4MDgIEYkD3Fg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(7416002)(38100700002)(8676002)(9746002)(9786002)(478600001)(8936002)(2906002)(186003)(86362001)(26005)(54906003)(66946007)(66476007)(6916009)(316002)(1076003)(5660300002)(36756003)(33656002)(4744005)(426003)(2616005)(66556008)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ShX1+RtbSmyhnUT/Thz17PmmI5w2jnNyQ5gokaWj/tfM5uehd+vuKS5yDsSG?=
 =?us-ascii?Q?OiIj0j/oj0ojbSylpCyNWUcqDI5fAr9F3XxcVPD3pa9fXDlierKy5AwnDeUA?=
 =?us-ascii?Q?oRXtzqy+xRnAQplEBsm08yMmm9zAW7n3l6nDUsqeb4ongYaKN+O/6yPcrKvs?=
 =?us-ascii?Q?iDsTQjW9BnvpmiRBX5NPZLfrc/VWMOyXRQEMb8T/Mpw/+gdb1ECYOfl3dYw3?=
 =?us-ascii?Q?r7oSQzEmWSo/Zw4WszUaC0PaHFFhII/MZ9/FIeBwnanUfcec4pYDr60DpGHY?=
 =?us-ascii?Q?byVj5cbWKJpaXi1U5/rqP54Q7yQB9jyTC/1BTUOHFP1I2l4zoLP/dTuQk/pb?=
 =?us-ascii?Q?RBOEUiyEbin8Q6TsYR12lmclD2s6bhanj8UCXMsI9Ov+ZkYJDV+iNg30kQ9a?=
 =?us-ascii?Q?2MEl86RtH9jgWtcdhhuHA0TRUl7382Cn/XpYnMuvNRBW+vwBoriJRkmCjuQK?=
 =?us-ascii?Q?bNn2kgkG2WWTq94o/9bN8i2PiRjnbVKlGo+J5yEKEMXK8tYC8girSvCGWt3k?=
 =?us-ascii?Q?sf9qKSkigbj3ENnKJBKOK92tAOVB+8T/qeXSt2h1wycHLR3HvSj1KuHsKsN9?=
 =?us-ascii?Q?d+WC/hcs3udO85yaBOAHWYx5TfV7EDGXgFzoS9OVg2v98XpBks0s1C5uXMzC?=
 =?us-ascii?Q?amt0zVEgYpIBzczbo7Y5SCMhTQJsuJuaTIHqvV4eo4CTVOFCRidtKM4OvCJl?=
 =?us-ascii?Q?jweTSibwdypfdCHndNfYOcxt6oKQhaN/t96i3viFKgoUdx1YpyQITvWXfHhu?=
 =?us-ascii?Q?cR8NKpTxOHUhUUooZ1i0Q6Ck6QoG/AlWHW7HniJbrGBcn7aLB7updiTZi5UY?=
 =?us-ascii?Q?W+TKXwSSYJfw6ZGr6CfNs841K9Q90NHfXbuWVRGMc8em2AJhOUoM8e9txvQy?=
 =?us-ascii?Q?9kaaFf8RMgRO54XDt495wfPFxxfBFmuRzB8m1vRC4aVEoBJ3PLFp7nGWbMTQ?=
 =?us-ascii?Q?nn9VrW1p5TyIhepNPEvm8XCM2YR6vC4KaQIyEHVZpALufAGCJxROb8ddx+QO?=
 =?us-ascii?Q?yRe5g7oH2unlzWSxf0IlzsV/EveXs9/PbMkssfNhkLPuUie+qfiwMswKaFCy?=
 =?us-ascii?Q?CBXiQJqKIVuRYp6l5Mj3OImdldGAfpZ5X6/umTyj2EanB6S0fJLCxY1Mb17y?=
 =?us-ascii?Q?fVbyyCD0CGA8UBL4tbbY6bgf9DLW2PvF4veB7i8jPCU7Vs2NoQZKLNMWroYd?=
 =?us-ascii?Q?gogrgGz0wX4NlrLR2nGfpgoAeflfY9sMk5imzVK7Po4nsIcal26Z2tDD+VC2?=
 =?us-ascii?Q?GHV60/mAiei38bt24d8WH/Ml4umTm3v0CYW3MyXMnKfsUK4JHyRasPDd621N?=
 =?us-ascii?Q?Cl20lHabUfv/w05A06HZd//H?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51402c4a-818c-42d9-7ebc-08d91aca0614
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 13:28:43.9397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWUJnu65MOFz8vJg7aBCytyzxzKCp7KP1onUZ+J9OPS9POvPEpZ0CsErjHlafNVQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4009
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
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 18, 2021 at 07:45:05PM -0400, Peter Xu wrote:
> On Tue, May 18, 2021 at 08:03:27PM -0300, Jason Gunthorpe wrote:
> > Logically during fork all these device exclusive pages should be
> > reverted back to their CPU pages, write protected and the CPU page PTE
> > copied to the fork.
> > 
> > We should not copy the device exclusive page PTE to the fork. I think
> > I pointed to this on an earlier rev..
> 
> Agreed.  Though please see the question I posted in the other thread: now I am
> not very sure whether we'll be able to mark a page as device exclusive if that
> page has mapcount>1.

IMHO it is similar to write protect done by filesystems on shared
mappings - all VMAs with a copy of the CPU page have to get switched
to the device exclusive PTE. This is why the rmap stuff is involved in
the migration helpers

Jason
