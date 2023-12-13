Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 585EE811A69
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 18:07:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD8210E15B;
	Wed, 13 Dec 2023 17:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8148910E15B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 17:07:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSMpoWKsuihEzxjnigjYifz5+h311BMHtEA2xSdXPuyoCOoGWAAIWjBSam3aAnrzQb1p0WzUU9rLXXH/sAjj8UtRQASZEu2jweyFyEsEMDAWa8HksRxRS4SwowrwEePtdpVuJuJK8prcvAPnbqbEKY9YDnVv/qsBlCSQZOQxTjCRD3bv30D8vZCXJt0SaEO8KnERZaz366Kh2RtJArJEDo3nbRZ7fUK3CobQaXWRB8I7kkthw0hC/G4mEcOSvbFSD38uwJ6Y7G4b5jlIydf2vGANMk2LPGzjWxnG36LJg5LW51oq5sCgYYr2nVBZbk0Y2LGwzUY3I5T6QASptiN60Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25iEUzYEI4YWiTT6idI7x4iS2K42IYUcoJE0o+DuDkQ=;
 b=l562M4YNtEWh4qrZ5M0AzIvbgrWtu6QaYne3mQs9KOfwiJkSgEapQCKTjXmir+xUFrD4ukBJfKi2urZqqIDc9kndgju1FAyq7uCEPxLqCuR6yB5fZcj5DBKYEpxkYvhICJxDuHpEyiz3aRNA2GVkxQORdXXx6/h6qOwLiGJWoiM23CAbCnFSAJ0meSO5eos3sFDqGFJ61sVRi7uK+o8eVuGwUARHvjjo/8iJ8CipztQweWMxb94egZWFVzzgSmQjk2/0hE29aRG+4JxxN4Q//PFtL2RPiJ9NIzlFCQQOBCi14t5LT4xAMUGncOh35oRkC+u1jXXYEZjvoLe1jkF/ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25iEUzYEI4YWiTT6idI7x4iS2K42IYUcoJE0o+DuDkQ=;
 b=dA6ldQq+XxpcGJG7VG7kqHaqDEQgDVwhOQECCxdo7/0XorydFI2roL+c33qAzracS6Z0B84p6QTIMYK1mKS4En8VXiFezdcvhISmNP+qfn2MZP8dTQGkpEPwkFAwy9/Pta0n/7IqvhZOL9DZUETLS291pjxbQuh1pCzc4dqp2XRoyJqC1jleQRPwP7fEN8SgsFYOmWGnhrchEvIxZ4VY0OnbisRdAli7SkfKgPwGiZIzGUUg0Gr+r2uziMKVz5VxcsUoFSILX1xQE2RDbpesc0AvmnkD0ilC2pY5QuBe57fHLdhZbujVkg+FYEfSc9u4yt/ywfSJtEKwjs1dWh3+vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS0PR12MB7630.namprd12.prod.outlook.com (2603:10b6:8:11d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 17:07:01 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 17:07:01 +0000
Date: Wed, 13 Dec 2023 13:06:59 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v7 3/6] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios (v7)
Message-ID: <20231213170659.GB3261327@nvidia.com>
References: <20231212073803.3233055-1-vivek.kasireddy@intel.com>
 <20231212073803.3233055-4-vivek.kasireddy@intel.com>
 <00c84f06-66b9-484c-8a2c-e820c7d21c9d@redhat.com>
 <IA0PR11MB718554F149A09AD0E64B4F0AF88DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20231213123155.GQ3014157@nvidia.com>
 <20231213153634.GA7301@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213153634.GA7301@lst.de>
X-ClientProxiedBy: MN2PR16CA0005.namprd16.prod.outlook.com
 (2603:10b6:208:134::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS0PR12MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: e89a275d-0dd7-4a93-9539-08dbfbfdec03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YeTjTvr/NJEfLoZ5X7+ug8O/dQpN3c8bx2EmP8m6MZV7L3nsaxzTAyio5NcKEFu2PxCKyGchv+6Z1RlpnpZgH5U9mCXa0I3uzJpZDu9Pxuscu/QMJfMDyy/8oP5niAsRkPlj+kg4kaYUCQVbVCup7DZF0ktyaq8M+73YOj86eyfnurU87NDPS3aauuOo0FW8XjOXOTU9lY6OMg7DnIrm8tXiWblOfpMeG+B5ip1cNf2+greWYB3uqh6umx08BV+lYed6qj/1JOxFhBWtfGQtBucAlqBQDGasrRRalY9jSDcCpD6Yy2BSxl/7bYZY417HybjELNn/TucChC+9Ts7WqEzyRjb1H8fjqxEZDuk1MKuS9TO5Qmtl5hk2wsMIP3mpw26+5CPwY4UcSqTNKQEeVgK2mxZA4C+VEZ+cmONydDDjh0gnPiT87I4HTvRtkb6RNBoXFpditovyf4DZKwSkGcjS/2kdO2G7jtpVHbyzE4X881Y+acdd+zqYVTyi1hnR10nBuO2A+SI9KMly7NylXvN3N+T4spK9FcdmPd4qAfZ1lSQ6TkRuyWq8ejvtmk3Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(396003)(366004)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(1076003)(6506007)(2616005)(6512007)(26005)(38100700002)(4326008)(8936002)(5660300002)(7416002)(8676002)(41300700001)(2906002)(6486002)(478600001)(316002)(54906003)(66476007)(6916009)(66946007)(66556008)(33656002)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PQuqhPiY2gm8QTQPKpdH1YFi30hdVNdAbgCYxPTBbC4QdsOSr5dwRfac8CEG?=
 =?us-ascii?Q?j6GVrHpKM8nB+xAReTe3kLcJ4fRy+ICf4Qk1B00TelnbhglZmaP/BAyOXapU?=
 =?us-ascii?Q?un4IZujMy7Adh0tDoFWShOIjov7J0LbAuNarmFTl6RcmmfSz6kdAQumOAknY?=
 =?us-ascii?Q?w51fwpCugZ1vanpQtpamDwb6DtoSz4TxDXjQ8VWOMg13uG8W9M2IwjSI0olV?=
 =?us-ascii?Q?9EiMVG5TmXrQAcLRDG4WMXLE+5dqXle0B8wvBf8BRcd9GWmXy8EWD01SBSaO?=
 =?us-ascii?Q?VOqJsiryQF18hXjvoJxTwkeY8UJ8vopKMty8p/ugBzoL8nEBGz8WQSmVZKmP?=
 =?us-ascii?Q?3rTQfFj8yVIxv558dwRiMhHTVNNQJcUTNqQsyHS8dG2sIAVliMbvrJkfcm4H?=
 =?us-ascii?Q?mQFK0jNEcnepPSGp4xnMbQqoLzN9OeIkuVghoS7mSFte/zvDDi+JabBzQdGk?=
 =?us-ascii?Q?n8TfW9LLXc3bz4UL4s6FTGMDtUM7zIT8K5Vha2G5RMloMvxuyZzwMeQIxMrr?=
 =?us-ascii?Q?D1M6qdwgkqCwLFATXfFdXo/SlQqPyl+RXk0Vf8R6C/JSbvW7ahGd9d1PHXVZ?=
 =?us-ascii?Q?CZcH1m2y/35WjvGYPkCWebocNud9u80MdoP/AdcF5J6i75UDoLa3pFTw38tk?=
 =?us-ascii?Q?+ZXavnMHWeup0KpByb6los6DddEIyHjf7FghBxTvzkyRkSBzNw+Z0+3AtkUh?=
 =?us-ascii?Q?ThSITxTIEx3VEqPgQLUxF/kKGwV0EDjcPsRHwIl7o6H28GgDHTb44oOwmDAy?=
 =?us-ascii?Q?NoS0zidjZKu6F/M20KpAV3HtNDiXljzRpSvKEiSUWOG533nqB54qdvR+8Ny5?=
 =?us-ascii?Q?603psDBDjbF4MbfpbVeh5QWITukPXke4/WzPmCipJ75ndJ3qoGGplAfEGkkF?=
 =?us-ascii?Q?snRIsYf4hEgZAFvVtCMU534LA+WjuxLCK/FkNwtyN07TCj1nBb/yuIEo984o?=
 =?us-ascii?Q?rvaW3PZPV7GGIv9i/0lTF2AzpXWyov8nYSbLx1zZdHPaFG0WEIKdvVDGEeIr?=
 =?us-ascii?Q?NKbCQ2yb1Whwsk+PVyOGexTg14lrxtImQC9O4JkeiJJTM35whKroxfe1A7Em?=
 =?us-ascii?Q?eYmXxWBwPjaV2gtMCoIWOAtfriDXHVtdUQGVB8TApnPCGb8ZXsH25dybpPzM?=
 =?us-ascii?Q?YX4TK9QjI5cVvmsQRGNAFMHXiSjxRMxtPQYA2Sx45IR232IcLNYghhGT63lI?=
 =?us-ascii?Q?4MiqJw2Ms4soigdJ7xQ3aSCzy74eHFfs1MHk5lSO2haZ1uc3JhRCEzppW+kX?=
 =?us-ascii?Q?zRc7gG1H0TG/ePuYf4uoCdGbza10iOgTReuPhE8HQ+Qzmp/GVSWvhesZP9Q+?=
 =?us-ascii?Q?FNzsB3xX5B8BSMpskHCfculGCSqKDgCbodUYaqC14igItyUqjg6iXTcMe0bA?=
 =?us-ascii?Q?3vVfeclKI34VJnJRrtADUePLMvyl1JsubFItleVHkHZRWWhIo2ypMTIz35fu?=
 =?us-ascii?Q?dQJ3rnl5jHMSw9JqWfaoJUVXGHNZcr8Ic7usAs85s2ZCCfWps7L62PZcEzYM?=
 =?us-ascii?Q?bDEzRlS9wD5rh+CgOd3Z1uYFmrmuU3gYSeGhnRLbB3rRi8PzngX2S6ckBd0E?=
 =?us-ascii?Q?6ZcuPT/tZWhMRZneRHAJYKmRkEM4weC22R0rpbLv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e89a275d-0dd7-4a93-9539-08dbfbfdec03
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 17:07:00.9779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Le8RQi8UgfrNpqFmnX0hDjsojEIYxT9/OIYmaZ5S0sciYIfRUOcjbJFROzimlXI+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7630
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
 Hugh Dickins <hughd@google.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 "Chang, Junxiao" <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 13, 2023 at 04:36:34PM +0100, Christoph Hellwig wrote:
> On Wed, Dec 13, 2023 at 08:31:55AM -0400, Jason Gunthorpe wrote:
> > > That is, populate a scatterlist with ubuf->pagecount number of entries,
> > > where each segment if of size PAGE_SIZE, in order to be consistent and
> > > support a wide variety of DMA importers that may not probably handle
> > > segments that are larger than PAGE_SIZE.
> > 
> > No! This is totally wrong, sg lists must aggregate up to the limits
> > specified in the struct device. We have importer helpers that do this
> > aggregation.
> > 
> > If some driver is working with a sglist and can't handle this it is
> > simply broken. Do not mess up core code to accomodate such things.
> 
> Well.. There's no single driver that is broken, it's more the whole
> dmabuf philosophy that wants things to be mappable by multiple devices
> without knowing their limits beforehand.  So you'll get this cargo
> culting.

It is not so bad, the API has the importer pass a struct device to the
exporter that can be used in the usual way to shape the sg list.

But really, I think in most cases importers don't strictly need the sg
list to be a certain configuration, it is just a combination of lazy
driver writers and a lack of common helpers to iterate over the sg
list in the way they need.

RDMA has done this right, but for it to work efficiently the exporter
*must* aggregate all contiguous memory into a single sg element
otherwise you loose the HW's large page support.

Jason
