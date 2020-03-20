Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 700D018DF8E
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 11:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9EF6E339;
	Sat, 21 Mar 2020 10:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10046.outbound.protection.outlook.com [40.107.1.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B316EB58;
 Fri, 20 Mar 2020 18:55:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yp1DbsReGQKyRXP/9PI4nfgyBjWWVmV3+Xs1OVV3dQ94jNNrvvuyYYQnS1D4MtRalxma/7UUO1K9m6G1SqR5Z+Z/maX0DRLDLgBMeuwFWN+/+zFTvbronWHIbiuWI95Vla9SkAbh+za+9XuQJLElN5PAgCGw+oZ2C1xFI5n8aier2gDyF3GVe5QpCcJtEZ4v2Q7H5UvkinhLqJWQFAJEI6bdvdySb4YweacKvPHRPs11l1/8s4PGdJsmK7ecEyN5OmzQ8lW+6X3H2uGdBjEaIzzKwZ0W5ZCgGs0vogWbxUxqEt3cwb63nMCidDNxLtf9u8zcMtmEi7hHhZ2Vo5MNIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iljs5PLfR/zwDLb4uGNINnowXyqZ0GWg5emQx5NfmrM=;
 b=f5nvTuuG4xhrefZXy441ra2HJtusSKVOH3Sne83BVLWOhhwj4G7kIZLA++X8O/T01PiXAbjtyGAGY/SYs60ezbyccNACicf8aLieRg8z/KEkGeddjLJxz31dYRIUs3Ro+PdfJrWpyBaYsoKF2/cxvKK+fHnxJNdt9YFr1gqN7E3zd6oMfetkXpdnyqbmIfmR6K0F5wHBdXTxNgonVmnyWTY23ziIu/aDi3H3tRZllkLh0sZ8ekerEJ0lHWTiZZXVAGhJFRqt3P+8DeooqK9z6yJ4oAqoAD0K8itxA3s+BAbv+mB4K4QxX1sUUWYWkMQ/FOOuJSVfwFkP73uqdrwgsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iljs5PLfR/zwDLb4uGNINnowXyqZ0GWg5emQx5NfmrM=;
 b=pDItW6ADQBcuwRydLEw7vQx/wFtlNmBfwcetzzmwSrchdReA/v6oDehoIVr7YaIks0rnyXatVWkme04K1Vl12MoSuvHNQd06UhJMGDqqa3MCQq5J8LBjA2LW0yZXiEDxMhqu5fixVMFf/0o42dLomJ5iH7avX79tD4gPPeTo4aM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB6077.eurprd05.prod.outlook.com (20.178.126.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Fri, 20 Mar 2020 18:55:36 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18d2:a9ea:519:add3%7]) with mapi id 15.20.2814.025; Fri, 20 Mar 2020
 18:55:36 +0000
Date: Fri, 20 Mar 2020 15:55:32 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH hmm 0/6] Small hmm_range_fault() cleanups
Message-ID: <20200320185532.GM13183@mellanox.com>
References: <20200320164905.21722-1-jgg@ziepe.ca>
 <030773be-3ea0-033e-051e-a3c0a13ef709@nvidia.com>
Content-Disposition: inline
In-Reply-To: <030773be-3ea0-033e-051e-a3c0a13ef709@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR19CA0060.namprd19.prod.outlook.com
 (2603:10b6:208:19b::37) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR19CA0060.namprd19.prod.outlook.com (2603:10b6:208:19b::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15 via Frontend
 Transport; Fri, 20 Mar 2020 18:55:36 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1jFMns-0006QJ-S8; Fri, 20 Mar 2020 15:55:32 -0300
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 34d375bf-5c1c-452f-5b78-08d7cd0046b0
X-MS-TrafficTypeDiagnostic: VI1PR05MB6077:
X-Microsoft-Antispam-PRVS: <VI1PR05MB6077B9FEC801E0A027A3F75FCFF50@VI1PR05MB6077.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 03484C0ABF
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(199004)(1076003)(9786002)(5660300002)(9746002)(2906002)(66556008)(66476007)(2616005)(86362001)(66946007)(8936002)(478600001)(26005)(33656002)(6916009)(54906003)(53546011)(186003)(8676002)(4326008)(52116002)(81156014)(81166006)(966005)(36756003)(4744005)(316002)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6077;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e6VIAJNEBb3OLJ2G8y4dnOz17ToQisnt04U0LNzQ0rLPZM3z1/dqshOJTV7/KGtaMIMwEHtEhPpJ4aZowVKaHryTArIJwapju8Ch5+XgTxfR8wQ8lO83dHecH5qwkPLHGzOjM2McQHByCv+MJaVaBBPvJifX3MvFNVjZAnGtq+nVvjsRjIrHBMlQ0sAFOLea2HOeg+STbsR4chZbff5lofJ17o+x//ycJK2EBFswRy9wKVShesd8FdVCWrqC7Lu+sTiW4fYU0NbJFCPFb4LAcY0H6nFzJoujnjW1Qr/59iZ/Bl8eJToKNVxBcdyizQhK01lVYWrgbjy6UTfHaeMjgB6nj7pec6QgeAzaL+VDhyQEOhVXmizx409AqS8IhTrWy7BL7oNsngVqo7EOjI0XNfxQAuKBtpZtY89oJqyLQkvGlTy78eEQZLzQY7OZKmMnNC9h6uG0VjUxiR8wPXsWZynPIdbI2ovidiSKPGvKE8SHnCRJ4FlKNTTApOSMMroyyiW18kl/fAC4ga29SmPYObPxswTl9tDjq2IEBNGDFMu1Xwp6yulfmeOF0w2cP5gyxxu1jNoOKBgRMaHMIR97gg==
X-MS-Exchange-AntiSpam-MessageData: MvVEWNc4WHnKQN0wDmWFKRqdFIJUQrWfzbBtgDMTiwOLZaQBJX42kPH7WdpQK2pQMo/C/3ve0TyvnbxURkOwvEFv5D/E32IKIqi7c01oqsF3ZnkrHR5xap2ZYIbwVpkLex/ueKnmbTO2o8rn7dY+Gw==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d375bf-5c1c-452f-5b78-08d7cd0046b0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2020 18:55:36.7700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CojhxnjGAz9YVvxZbtxgd11L+34c09e2be4CnJ9F8L308YjesTSxCP16Kc0ub1sX+NVq0/eE1bvFM4JLdSrSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6077
X-Mailman-Approved-At: Sat, 21 Mar 2020 10:44:31 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 20, 2020 at 11:51:47AM -0700, Ralph Campbell wrote:
> 
> On 3/20/20 9:48 AM, Jason Gunthorpe wrote:
> > From: Jason Gunthorpe <jgg@mellanox.com>
> > 
> > I've had these in my work queue for a bit, nothing profound here, just some
> > small edits for clarity.
> 
> The hmm tester changes are clear enough but I'm having a bit of trouble figuring out
> what this series applies cleanly to since I'm trying to apply it on top of the
> other patches you and Christoph have sent out.
> Is there a private git tree/branch where everything is applied?

I accumulate everything here:

https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git/log/?h=hmm

The patches should apply on top of that

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
