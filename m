Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0436811124
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 13:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C2E10E29D;
	Wed, 13 Dec 2023 12:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE69A10E04B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 12:31:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oP7nf6t9LHp08W2MpdHVryF8S3a7KMrW/mcOqdb1V6o8IkovcdDyL3/MJtErtvNfXMLbtZntH9j0tdG+m9oxpP+MPbrcjTJHB7UfFAq7fPVvbsK46wGkR1uXS9wGRSfVpNlCCNYKG3wmpjkxSGddLE1PNj9wdFFQ8GBEzHyhWShfxYEmMrkvBM7lyvEhQ6eMCYKMgYQszMJE92D6me2SdJmLH9StpD8Vy5YjUhPfPiDuMHvwwYcIFZ4ZXRVpN24pCOQMCZzUeNQNOTAMamUZzl+Zdui2sTHDY8wVVcFIEZYYOlx8s2Wv5SGTrnoGYq5xshGcO4vMPRFmqgn/SE+Hgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8u8VvUnGPsH/1vyZ3/3xkWT5SrQGRXvEJ70DJGiMTk4=;
 b=cIVHUt2EnQ52Mc8w/phZHXU6RdFA6BhB7j+L+pZz/F6GZ/WqeTFQyWfDBF8lmNJYtNYiR3TENp/pFaCcfyxJZ9RXtcMYHgbYUNzWHD5sT/s3iqOEMOGuqy8QgsXsxic7r8vLcX7f28TBPxyyZq9rYoQvJjKpuOEwzd3tWRCl8MJr4GIkX+DNBOT/u9zwVc/wk5Y2tgeSnvPWN/yj6WUVmdx8PdfKuqC4xnWsbVjuuj7I3ZxvnmkcSO+JSgsSIusiy+MFIhppjaPxuTKewhMMc0kQfR5olXGAmH4DDG0WoK+6S6+PvpOwSL+5+OZw9Yn1XBxvpohb+YCK3qnZID7Q3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8u8VvUnGPsH/1vyZ3/3xkWT5SrQGRXvEJ70DJGiMTk4=;
 b=OGQ5Ajw7jORkZl3CXbBRWeeeeDhZrx3mkpnS9ZO04w7MHxi+oKiO2fiCGaOiQYQLGbw8Ru7A4HsQsY2VY9NM9oERA8YXZqMK4ZL1KaQ0iEGDNOFyfpaAf5WjhXgOsoNjK0iYSvNPHajur7EKaC7I+oArJ7k8gpqC9TIj57GwJ28JqIKHZdHJtE8UNcyXeFCsaTO05v1tIzumEnjWahkuXl/LPOF8JkIKNLGelYZ04umryA9LaKkELWN3dcIV9sk7/dAX3vSoIi/8QBc/WTwL0j8ln9WWmf9Tu0FwVPZoLijsmDAGqKCWNXWLbiKTwJJctjOic5nBiDFeetKWXHBX1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5315.namprd12.prod.outlook.com (2603:10b6:610:d6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 12:31:56 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 12:31:56 +0000
Date: Wed, 13 Dec 2023 08:31:55 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v7 3/6] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios (v7)
Message-ID: <20231213123155.GQ3014157@nvidia.com>
References: <20231212073803.3233055-1-vivek.kasireddy@intel.com>
 <20231212073803.3233055-4-vivek.kasireddy@intel.com>
 <00c84f06-66b9-484c-8a2c-e820c7d21c9d@redhat.com>
 <IA0PR11MB718554F149A09AD0E64B4F0AF88DA@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB718554F149A09AD0E64B4F0AF88DA@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: BL1PR13CA0383.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::28) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5315:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fcac27c-eba8-4da3-00b1-08dbfbd77eb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wSjtckiHhF99hKRKElQzBtztSKA8djnTmTsnl5vWlgZWSqUC5kDMkPgllwLXKAgpF+haGrzAC31hnHU4tjgUnCIr0XoMH9AyL1k2KljRxS9e6wXrcYw9qtd/jCi0Q1fl+Cv4NaCrdeCB6gQeibWwQVHFVjYNMIFMJLmv2Ur5uKaZhckzFjjtxAnvL3QpjC1LLOqzvXocXeKL3Qhie6Esm/aBLDT919UPc8JP1doGGc3omMlamScOzrPHqzD25Y/M9/11l1FiewoIn0poTWAY8xrMq4KRQHQCS1z2s489Syid+GUqFIqjXOwPMWbhIR4lyl3Rsimy1/PFU8pPLO0xBC7XcLJBpzcHR9xznLxSb0IR1fYKIf8/bcn0XvqKbCBVWIqSRgq/V0ptxx7MSe0NCJKzV7/2iastmumAqSjzr1qcpd5dL4mCA5c2h+Ocf1KVPM4kSk0M1ke3YgRdteKBNKsObA4POSd0J8ifNCPVraA73fKt2pEm6EXRbONLkWNOmj1Ab+2ZOOwhSEz8tJy9ZGAblUxNE5A5wOaJx+0N/Li80qF1pWwWhkKN+iMZml++
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(346002)(376002)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(66946007)(66556008)(54906003)(66476007)(6916009)(33656002)(36756003)(86362001)(38100700002)(26005)(83380400001)(1076003)(6512007)(2616005)(6506007)(4326008)(6486002)(2906002)(4744005)(316002)(478600001)(5660300002)(7416002)(8936002)(41300700001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uMNm7C/2FaHpi+NXHdA61Zb3gJGBe2BXR/1q8ASvjRiBf0ALF1crJbfbH9NC?=
 =?us-ascii?Q?ZOVFhNDaGl7SE2tLpDSfd5Kz54ajnjBW0uR4heqIN9IzWxGwvlaRzWsBWJWB?=
 =?us-ascii?Q?bzycQYJwHjz4CbonY8Uwpue+3DjptFzb4/J5uNLl5llA4lk1FVUnlpaerhkf?=
 =?us-ascii?Q?dIJZc5QfWWmOJOn0oSYp2gyfK3p0h+s9SZPV8MGBSl1gAyQbTFdNPzvcPxxC?=
 =?us-ascii?Q?qV191ubezL3Scj2ltH88pVUtsKtiBHnzGmIe/NCCiwqnQTp6WOBsDnIyw4pv?=
 =?us-ascii?Q?9PraL6ykzd/jbPxCIAOEzcT2C6dmDmyQEVdlqAnKJoDQCJjNx1L1zgpSjurW?=
 =?us-ascii?Q?onizc1ejSOkq97yNmCnNZxxyRq3zTIgt8FIgrpprLJyS6emVLN9OJ3r7r3Hq?=
 =?us-ascii?Q?gy/XZdCOz7c8cuasr89qoJ3BM98twixN9pJbehU5FWmBfp/S2qGuGNf2HZfv?=
 =?us-ascii?Q?cyzTx6vihGRJIVsvLfYPmblsa9qUXwYJiJiiKHAhMwPrWi7Z5RLwRCe9D9PN?=
 =?us-ascii?Q?VWHQRBrmDkrzTsJldkGLQUqhf05N8WoJmXlvR8HCzrYHKWGIAzXxTkxEKjbl?=
 =?us-ascii?Q?S0YK5VTrnVB8N7eiU5Ey9O+O/PeDchRvjU8AiNph3dgjPgJSJMlaGYnK8yrb?=
 =?us-ascii?Q?B1nmpb/qof5/AzvC/fVXTtaOZChEQ11ue+dBsZNsDt1od+NGDPCnqoFNEOnQ?=
 =?us-ascii?Q?hFKjCj1CwOi04842ddosl0B+OVmbgCfSDPm+5nH248PqgsNDV1ktyl3u033P?=
 =?us-ascii?Q?C63GcGcNP8erhRcPn1s84UNFRcaWB5URbEOIMlEv3F2hyutAmSUyTXnHDP/C?=
 =?us-ascii?Q?ZP9VIV17LGflRT/9niSnUkWrM4mc772vI5GccJa8lXOs+BsOHHQqkHgX+F1W?=
 =?us-ascii?Q?dj7hg0WcGYoX7DfkqB6J9FmzJ87ZUgpNcyvkCmCsMPYiAdZ3JlLGjkf7yOkt?=
 =?us-ascii?Q?0BOaccuhi4iXL27gIpPVjmTWHWw/pbXcSbeJcdccTRe8IMpzW9yK2CQk3R8R?=
 =?us-ascii?Q?iHDPZZDwHb+Q0/M+T1GwU4glO92RQ14hUVXyrAlg8ikD7jOn77g0ND2Lw5FB?=
 =?us-ascii?Q?fsJYiE8uKrnVf1FF/l9FHOrHb66v9ihe+zLWwhKkuOOq7W+vP0TNMfp6oWQX?=
 =?us-ascii?Q?PxWnydaU090PEL1oFaPZS9p5bnmig1bO5Gqz4EPX3ZrNY6ZQ8xUYGoEkwRmq?=
 =?us-ascii?Q?5fIQG8sC+wIzvLVAHnGTmwhNCF5EN2NvjvTO6MpOlKCcVXwbDnSKdn8SHzj7?=
 =?us-ascii?Q?jGr5bFJI4R/YNNkWWwZ8jrf5iXkUgeuax5Mp2/3Q77SiUsS4Gr5F/oNm1tLf?=
 =?us-ascii?Q?KhnO6zXTRLNr82e2SQ5iUGAudPdWWZgSY6SHCMvRR8/vvOZ5jTtxC15Qd3Io?=
 =?us-ascii?Q?bXk0doeBVeo0XgWqgahvlBSu/4wF2XMGrxyZNwZlveOWSqc0Qbvu05bwcSYM?=
 =?us-ascii?Q?ouTH9QWOTk6/QKjQYHyVz9YwXxwElfevbHjlJycFE7UqOA3HI3T6BXpmiieG?=
 =?us-ascii?Q?KmzJAq/3N6OzjOfJiDXu9chDnB7a1f0FkRr4/CPGDsnpDfeIGlkhdJ2w1Vgl?=
 =?us-ascii?Q?xp6CbeRP3eoz3PuPJ0wGF0uOiPCy0Z1TiT09pKVN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fcac27c-eba8-4da3-00b1-08dbfbd77eb1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 12:31:56.6632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjIkIT+R68DY0ISfZ7M4AoYL4j9EehGVwTt5gDj5mKcOdgGJCw/2oK4w4hwiwf14
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5315
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 "Chang, Junxiao" <junxiao.chang@intel.com>, Christoph Hellwig <hch@lst.de>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 13, 2023 at 08:44:51AM +0000, Kasireddy, Vivek wrote:

> That is, populate a scatterlist with ubuf->pagecount number of entries,
> where each segment if of size PAGE_SIZE, in order to be consistent and
> support a wide variety of DMA importers that may not probably handle
> segments that are larger than PAGE_SIZE.

No! This is totally wrong, sg lists must aggregate up to the limits
specified in the struct device. We have importer helpers that do this
aggregation.

If some driver is working with a sglist and can't handle this it is
simply broken. Do not mess up core code to accomodate such things.

Jason
