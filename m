Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F673880B3
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 21:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7A06E0CA;
	Tue, 18 May 2021 19:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C0F6E0CA;
 Tue, 18 May 2021 19:45:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKQTzvvq0Jr42AObikhwhwbSltkrsz8l6q8RZsZZIANOXlFv76dZK+FfFGYFf+vFA1WyRW0DUXHQpklG4GN4hfpEQSjsAHeya/ngxfYNy9DF4WPnHlTCMML/x+X8Qoddybk+hLkSw0zXvJQRwtMZG6gkOrYu/Q8eBvAgjE7cBiMHVcevasBNVPV4+COm2T58Qyk+xeWPOKPiN8LbXwJ3wJ7JTPD4UOJzjSEi//fvF4CNVircUi6NgFULYUGxP5YPXPw7AIPfP0HGvzBXkRLEC1rgFk2IHhS48ibKz7+4S3Zhe9Fk/0gzNcTH/2AMLlv9ovQjcSBT97XW/mZGI+umAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y05Y2Y1aMidJ5Ltn3J+VAAK8hHnG8kOEs8oVJwOVdCc=;
 b=VSd/NnQVf2GGjFiYmoT0J/Z/DOZ8AwDTfk2e+2NNI4MXzAZkDs5uCwTGo+PQB06VY2EadE1LPYAgcC/amG3bH6owXfCps/lAlpU/OkoJX2GrkbPb2LpvZDc95BtlBzKoN59RO7HLZ1Sd9+bpaH4d7clKeez3rz2FGHjMcxH3IJLrwba0ggxqPnTqGTvTzaqrBCIm+4uonhtpgXTLMfpxO6/93RE7aBrdOAATNDYNI/d2ia1USRgLBxAyDXCg45J4seMSzX/8TwMbQcqLjBm0DwANJqHA6FcAQ4BFLh37x5MxZ8k15qC/P0yhHwYSbsgA98+9BLCoGx853AylBjUK9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y05Y2Y1aMidJ5Ltn3J+VAAK8hHnG8kOEs8oVJwOVdCc=;
 b=jhvgOTmcQJlfUPi3rY+h0kodsvjUxx0UsU6gjmo/zVw2xd5uX56ZczITiNJeMzmpWXn3hVuHrCuHyRHTRUCLFUBchE371nDTGX5cXHOB0pEgKRgjLZYi464hhLjHvM01+iAHBrdecluZH6nIrkyuj2DE0xgIeUo27BXD3dpyZNA9LTg7RJ+XumvdvywJUJnkXDZ2VdsZGvydr8D9KykN5A5ENS4p4tOiyI+QxFPrRHP49L+9O348P2b4nVkCLVsYiukIefNT2kJeDFKRhOX6MML4CKUEjEzYlmA3u8PQHAcUD9deFfXx4HGJQ/ME1yydHWTdEyJY+tbyaM01bG7XmA==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3212.namprd12.prod.outlook.com (2603:10b6:5:186::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Tue, 18 May
 2021 19:45:10 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::ddb4:2cbb:4589:f039]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::ddb4:2cbb:4589:f039%4]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 19:45:10 +0000
Date: Tue, 18 May 2021 16:45:09 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <20210518194509.GF1002214@nvidia.com>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-6-apopple@nvidia.com>
 <YKMhorngO2DVrxac@t490s> <47694715.suB6H4Uo8R@nvdebian>
 <YKP5Dj4Q/riGGc43@t490s> <20210518173334.GE1002214@nvidia.com>
 <YKQBACJCjsxeM3ro@t490s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKQBACJCjsxeM3ro@t490s>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: BL0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:208:2d::31) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 BL0PR03CA0018.namprd03.prod.outlook.com (2603:10b6:208:2d::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 19:45:10 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lj5eP-00AQvg-Cm; Tue, 18 May 2021 16:45:09 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 405f46c4-5a36-4831-4ba2-08d91a35727c
X-MS-TrafficTypeDiagnostic: DM6PR12MB3212:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB32126AEF37B53092CB8F8F60C22C9@DM6PR12MB3212.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sP5dH1Bgoe5O6IYwIaxZlsMa6XLjUY6V168FUDZbowbVcxnHv2tLUO6GGsq+nvrX3KL4MHmvzOXc9hPgi722GtXEPCbg3cKEqnkDh6FCrJooC7R5IPRVWnlU7oaK7HXT27meRogibp5C2klhFmRL6cSur6ThT9buPB3SKsAx6jIH2HZ+71e0QQU6A7BSKxhm25ytZdJiJtb8QTNxSjhh+4RfWnOqe56zRj06TNBDz4O7ezuwRBBFRW8LkCTOlbgRtwkfNt36NmhaBjLpeSnuQFyUEJGbEHQPshogamrP9TvK5rBRQw45mDrMMi9NjpkrM2BA+ADaov5ss8zmn3cWx3bfdQ6XEG92NQEI3ssb53cwc6Ohbjwr5cJvjJ54m+RsMzMROyC4kGLstpTLrR/qqddUYbt2wK6bE6xnVUQNY1k3nPEngXZfKCFrHBEDu7CThOUPCFP8hljLwGmReRPPoLOuADd54fAoYkid+7UupnVUXKo0POJs/HZSSKT8jHTenXpTQsgKjhc4xYYz8CrQ0ugTn8wr7Mr2EjHWaB5Iw8Q8XmX7XHMujGDUfS4Y2Ewu+b/qNFNRBt6czQHjaUfPG1xMe0pv5VMv0CeFwEqHeMo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(5660300002)(86362001)(426003)(2616005)(4326008)(4744005)(33656002)(38100700002)(1076003)(186003)(8676002)(9786002)(8936002)(9746002)(66476007)(66946007)(316002)(54906003)(2906002)(478600001)(7416002)(66556008)(36756003)(6916009)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 6O8c0vK5EqMqyHeHg21A2VYBi4Sw9rTfO4COLh3TTeVWcGAUXgz6JNLFuWhghYQbqF+eX65Fip9fZgAbU6PX/6Ddl0GtB1sz2nOD5dlBMWTzRpO6Nc8yD57wwSQInjASIZFpLb7n6KZkE5vrFD0jQR3p1fnfkm/5+Hrqb2mXq913skFAkJncTCoBV7TcU8E8y+MICXtT3rQOISRV28qSAkeCxlXyZSej1qC658yXPMQbtWS+pjhnY6hRwzJJiSnEZGmBDG7AZInSd3gGW8RkMkuc4lgLXUF/dY4+FceSwsGOf/75ITP+YKCasbNp1WFhCftDeg9uiqht4dr+ZH/ARKwhiN4gLnGf1uhlWNCMIS7+fngxnUJuhSt6dJ+X1lVwOKr4qyVBOmbP59rDUSQnGwhZBMpXbV5BNbg4Aru8AhVknQcBq8nzzZGz2u12JK2UAkD3W7SQ6lQfKzirMZweTKP4EHr8dNJ5O1ZR02tAJd9Kml1A/dGdWhOe0DCHZAu9MVarCTDe+w49U3n+uAMaDhMYPhrgJjukOILBXa8t027CLdVpAVtGcFKyp0u1eJvCVk1Cp4UEUxf/fSBOauXbKFSEaNAihJ7lXthzesdlsqEw7yMCViEcRQJUJ5jhlKbDQidvcsIxIsxyJaup+wlJUe4XOjmq5OszHnATpwCgo8Ya7N6WXpIxoKp5L35sN6pCQiCdGtkYN9dySwbnyP03a0uwbitFAwUTnbNxZAVbbvFEiaMLDLxdyiBKVQ05N2ic
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 405f46c4-5a36-4831-4ba2-08d91a35727c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 19:45:10.8541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PlKj/0ol5HPuVdPinr9uw+4RrA+jlPJ/GU4TYo/OSuWrUqTK53QZM9mP5Ceahvqz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3212
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

On Tue, May 18, 2021 at 02:01:36PM -0400, Peter Xu wrote:
> > > Indeed it'll be odd for a COW page since for COW page then it means after
> > > parent/child writting to the page it'll clone into two, then it's a mistery on
> > > which one will be the one that "exclusived owned" by the device..
> > 
> > For COW pages it is like every other fork case.. We can't reliably
> > write-protect the device_exclusive page during fork so we must copy it
> > at fork time.
> > 
> > Thus three reasonable choices:
> >  - Copy to a new CPU page
> >  - Migrate back to a CPU page and write protect it
> >  - Copy to a new device exclusive page
> 
> IMHO the ownership question would really help us to answer this one..

I'm confused about what device ownership you are talking about

It is just a page and it is tied to some specific pgmap?

If the thing providing the migration stuff goes away then all
device_exclusive pages should revert back to CPU pages and destroy the
pgmap?

Jason
