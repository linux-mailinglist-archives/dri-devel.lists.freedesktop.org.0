Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A20F3F75D7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 15:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FC16E20E;
	Wed, 25 Aug 2021 13:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (unknown
 [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4846E20E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 13:24:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmOMDSWmoMqCsCq7tnKk4fcZXAiRO8fVKxodc8U8muWZzF5FKTMFSC6HGn0pAnj9ZtxuYCp/kkh5ByKqsqhGK7yEugA6Og7aPcsg6xkXaIObEj/5IyfFxwQK8Ag8KUv9m96v+uhfK/vSq1enApD6GtVkyQMlLjdYtyPMYEWx9+2PmUZPOOK8fMWPtBow9JCkIgOEjKDZ984DLXUBva/7YQ6P/6cq9s2K2lQttME8fygBv5kibK6LeO8bHgtVSnfqz/mKE0xR1gc2lE6nNWCxfMAsQdMeUJnxJk3gMO1XaEZkvi5ZDmnc1XDUCvOnRCwnxQroXVJOfnHxitGvQdr3SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7cCNzajqyc1EZVk7UtTuWNkQ+kKdIo5ieq2E5WTAl8=;
 b=WAu+ua6sn6c3wfWqPOvY8vCdBGaCgfoMqVFVDBIH0ZkEkXrbrz4wTqEfJGn6/TNtjwzIG7i+5L5akvtfk8OnwkGGf90RHY+uxar6HpLdOShIcTmNyQsxLVRegDubZaOdZvCM3uftN1wtPzycxk6aObosH2Ns+KGaYi/AD+v0otWI7rgTFbExOiKqi4gJDpQ5G1UjHR57mPF7n3GatR0GkPcvKe2hNPEmZC7ZZPDVhUrYs+JdnhQV9dUnXvGXHnoVdQLNP5Nb4F3GflXzzzv0O+LE6lKUhvQrDUNZZtxsFFbsnNcUC34nPLj45ZBQU4M2dyr9MyDbAPcjX77AIdzVNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7cCNzajqyc1EZVk7UtTuWNkQ+kKdIo5ieq2E5WTAl8=;
 b=ONyPm9zzOOdfX4MgyeRJvVEutve46UjAss17e5x7PuLsFMsreToypkhxQojOcdh4YGpfjEAK9lt4h852gOYzWA3G2M4CCAEssMyv1WUwygRBvUPEX/3ENw/cTpfZdqB8VgEIG3sErsc2abiW6mSuwzA4kNNJNbVQeaXy0wbvhvseG3t5Eq+H+8jU9P5+BV7ABoz99E1VjGdcvwySAGpdnEWMT18j1akigx6CMM/VHGOkmzRQP4oeMtkHRirz52h24J3dqI6IPCjZzH5kxmVKbYKYx9NjECJU4eXAwdy4p9q9icOdd2Z2Mc6XdG1/BEStFU43agvzbMPEfAdmFGXdeQ==
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5127.namprd12.prod.outlook.com (2603:10b6:208:31b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Wed, 25 Aug
 2021 13:09:26 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%8]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 13:09:26 +0000
Date: Wed, 25 Aug 2021 10:09:23 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Maor Gottlieb <maorg@nvidia.com>
Cc: dledford@redhat.com, hch@infradead.org, leonro@nvidia.com,
 aelior@marvell.com, daniel@ffwll.ch, airlied@linux.ie,
 dennis.dalessandro@cornelisnetworks.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 mkalderon@marvell.com, mike.marciniszyn@cornelisnetworks.com,
 mustafa.ismail@intel.com, rodrigo.vivi@intel.com,
 sroland@vmware.com, shiraz.saleem@intel.com, tzimmermann@suse.de,
 linux-graphics-maintainer@vmware.com, liweihang@huawei.com,
 liangwenpeng@huawei.com, yishaih@nvidia.com, zackr@vmware.com,
 zyjzyj2000@gmail.com
Subject: Re: [PATCH rdma-next v4 2/3] lib/scatterlist: Fix wrong update of
 orig_nents
Message-ID: <20210825130923.GF1721383@nvidia.com>
References: <20210824142531.3877007-1-maorg@nvidia.com>
 <20210824142531.3877007-3-maorg@nvidia.com>
 <20210824191248.GY1721383@nvidia.com>
 <4f4a712a-71d4-ebac-48f2-766bfda61f1e@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f4a712a-71d4-ebac-48f2-766bfda61f1e@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0159.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::14) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0159.namprd13.prod.outlook.com (2603:10b6:208:2bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.6 via Frontend
 Transport; Wed, 25 Aug 2021 13:09:25 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mIseh-004tWi-Tm; Wed, 25 Aug 2021 10:09:23 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55eb86c5-7a5f-43a7-6dea-08d967c99025
X-MS-TrafficTypeDiagnostic: BL1PR12MB5127:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB512773DF61803FBD7211467FC2C69@BL1PR12MB5127.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jKXRPtHghVdMrXDbNWWaUIe3y5MLcRgMWTgmJY1N74pyNGRy5SqB1Jbt0be4IWNiyTHhj28Onk3PhfS1ZFUlr6fTwbYEXXETw5eOE3LROVRzLu3VCoy+AE/Gg92euRoa9ExORXW62hYNK+HuPcOBT20a9PaMExswXeMsHxXm2voDEsATV/9YJo5+ZumgfWA1z5o50SKfXVxGxSCnklisMHtJ9LGxNaIAxjI70WyN3x4qt0fFnCONJ3g14oWt3X+JyPK6uovmpE1xdpNfveJf2peX66H5/jAhYwOHYfjDP2fBXghCO7ZMp+20/DQ0EmVNEnZ+QoAm6zb+4ncSw53D8sI8sj/B8GSG6qqpM/ZhcaYBXSO0Wq43RBQRE9xrKIYk8Rz5OLokN5Oahwg5n89TUjXA/LY5OUhQMF9V135Ddd9EeBdI1wKgmEkuk1aYDHrDvZYLUdls6cxOs0Z7oLDQcDdyXzweyjUPaH9TZdJ7HDUsdVvDFHQbh0e6kQZvZVPHVhznwdM9Ca7c/DMBtpsza0zkOPfYJ1iaWI5TUxPhGQ7MQ/r7pc7iOKQopnfpcQraP/ugNNfQBQgdg8dIg1MZyWZDbJ7035bo4+0S1ECAeiKVBP2CdWm13wd+m6dYvdx7/Ysa7ei2EwSrF5KISaEOSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(66556008)(66946007)(1076003)(426003)(6636002)(37006003)(66476007)(316002)(5660300002)(2906002)(9786002)(9746002)(38100700002)(86362001)(4326008)(6862004)(8936002)(7416002)(478600001)(8676002)(53546011)(186003)(26005)(83380400001)(36756003)(33656002)(2616005)(15650500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QC2HKcf36c/s+oibZmTNtcA78lnYhG+ixkUirhDXmpwQTtH/KN1r6NH6U+aG?=
 =?us-ascii?Q?fzC5XRHvUdwsrxnRu9l0I8Oyf+0u+rulS2Kyixg+ca2opPrQvkTe0EEpJy6P?=
 =?us-ascii?Q?DGMZD0fWZO0eBNUEuVFuRlOoz4bcyO/9frir2EN/1uOyuu9F5V5NYW4rkbk/?=
 =?us-ascii?Q?2rj0ekGqFUHcd04+TvvYEZLgJV+2RwWa5VDiuk+N+epclIR9mI3B5ySVjG0a?=
 =?us-ascii?Q?c2LsJPbLqEPVOYUULYjs/AcNQXzaVSxAEj2Xe3U8AaGZm8ZkQNavwx0TliVH?=
 =?us-ascii?Q?6ujccgdYzYttUZOag/r/h3RdUZiBSMPlI2baQ1cNk1uKc6R21DvlPNpaGm+6?=
 =?us-ascii?Q?dz/BrBw1Re2aBWdpX6u0zqDI4eU3Klsc3Fs5dez2ou1A3dooqe3ZllEnyCjr?=
 =?us-ascii?Q?f0y0zL55vRMq2i/fZCB2A/NCQ6PdBtFjnAJQrC1KYt9ywgVOqJLRMjny00y7?=
 =?us-ascii?Q?hSskqmKpgwVCWLUO5KrsLGkUq+z3GVMkwhcmb5/Nk89Zlqz/N/nb24d7UeDH?=
 =?us-ascii?Q?GpUqlH/Cb36sPsfnOuilB+k8Ac11/IgP1xcvM7qvd8NdfVzT9sVGg7aFBhTu?=
 =?us-ascii?Q?OLTzVFiY/nJrPgYu+m5zKgvBd4G47lHzJNT2VMOwZ1ChsSWjXBiV1cJcvZBa?=
 =?us-ascii?Q?7pW2jtThGQq4tE7sEN4pvv/sdaZNcTm6gohK9bHQ1Qdffx7KwoMKCrgiePtp?=
 =?us-ascii?Q?SY5206Ui+f7ioobxrI6v/91tRBwOVVkMggDwxJIxv1lYEG171jxmIw4GD1mM?=
 =?us-ascii?Q?WuEVcsMzkTAREwqHrGeN2z7lPwP6Gdd42t35JCsqv4eodkbKiY5XcFADmJ+J?=
 =?us-ascii?Q?/j1weMIijyZXYhn8hfmGUPOdDP/wqADfkKCbyljj7Lk7HrDSonsAippQmtWw?=
 =?us-ascii?Q?UH8qBrd4O7v1evspt6vjy9BEMoj3Gj12WslnrrHHWn8R5bqrK5R0iwjiA0uU?=
 =?us-ascii?Q?MZg/k7m6di5jcVWjJe2+i2lPIjm/Lz3xjCgp4nCJzBGbbF0J5Bjr9OZOF1dR?=
 =?us-ascii?Q?m2iFx6NErYuxZaLMLOa8L/Qx219eCnEhnw98BPxw4tmRGzXkW/yb0tWoSmdm?=
 =?us-ascii?Q?y7qXa385YBEMqsXvTXdG/6xk2C7yB+U9hpboHdQ+E+PNa/lBQYJ9QBP9e9Cl?=
 =?us-ascii?Q?txsipn2Z9LEPXgcBDmTPRY9Rt7mlRBnBEVVopFKrThmGeBOnix1PagSEkevZ?=
 =?us-ascii?Q?wxRMTOSVQFnj+4UAc2PvueN1KKMW6SWP6x/onVx4gqlquxlsD8Yhf20wIDFR?=
 =?us-ascii?Q?H8uf+HiiPMz9qy8g7LqH8qDgsN2I5PGVWHHXtWfOGyzUsmru3Dpo9RS7z/fW?=
 =?us-ascii?Q?/RubLX9LjBwrpTQebIffZxPa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55eb86c5-7a5f-43a7-6dea-08d967c99025
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:09:26.0776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fz3iXxxhA4MEAMAQUOoJSB5rK9bKG/Y6lGyZoDVOD3uwWD6ldZlS3LwmSUCos9yX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5127
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

On Wed, Aug 25, 2021 at 07:59:27AM +0300, Maor Gottlieb wrote:
> 
> On 8/24/2021 10:12 PM, Jason Gunthorpe wrote:
> > On Tue, Aug 24, 2021 at 05:25:30PM +0300, Maor Gottlieb wrote:
> > > @@ -514,11 +531,13 @@ struct scatterlist *sg_alloc_append_table_from_pages(struct sg_table *sgt,
> > >   		offset = 0;
> > >   		cur_page = j;
> > >   	}
> > > -	sgt->nents += added_nents;
> > > +	sgt_append->sgt.nents += added_nents;
> > > +	sgt_append->sgt.orig_nents = sgt_append->sgt.nents;
> > > +	sgt_append->prv = s;
> > Why is nents being touched here?
> > 
> > Shouldn't it just be
> > 
> >      sgt_append->sgt.orig_nents += added_nents;
> >      sgt_append->prv = s;
> > 
> > ?
> 
> In general yes, but all the sg_alloc_* functions update both
> orig_nents and nents (to same value). May be drivers that pass nents
> instead of orig_nents to dma_map_sg* (like umem did before this
> patch set). So I prefer to set it here as well, also not to break
> sg_alloc_table_from_pages_segment which use the same path. This kind
> of change could be done very carefully next cycle for all
> sg_alloc_*.

Ok, interesting

Jason
