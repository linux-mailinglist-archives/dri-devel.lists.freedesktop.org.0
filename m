Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4125AE6DA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 13:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5B310E623;
	Tue,  6 Sep 2022 11:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A29B10E09E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 11:48:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqleM8Mo/w8HkWYjURRFvaS5lAoMIRSGzXeD9QIhhvR25G/X+yT0RfJ/xAXRbiwREGW1rEZsAgCeVVcgOk3EEdDS5s3mo5P3HCRozrJSB0NBFerWKMdK75opu0qeZ6YTtZBjy4GoBvd/+fxsYYL5Udbhyuk5a/Is9Y/yUDeYJ6JOn+QEwoQ1ubKeioGNeACqOrgV8G9cU1xksM++2LsBTQS/H4LFM61Qzu3bWqocJF7qUtWfRZmDRGPI94SNbUGClUY8afkKrMXGcvXVUH6J42jswBrvDa3J6Tl6SromH9TMS6Aa1FEM9KMP1i1cw7qlL1TlEdirsoYIYI0qX2J8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Kaab+IU4zR/2FW3e4OHfcOsvDM6daHjs+EeIqoEeWI=;
 b=BaOzeg+DWkoFFcDJrurJUy+mD4OVFEDe2US/vOdY01+wOlo3tEcUzimXcVgF0/IjJHXbB7HCt1lQgW9kqV2lAxw6EKM4wAJwA5soV/iZJe1kLW7DeA+lbLJqw1fWGIci9H/k9IalPF4POAe7J9fHg2m156+ETOvYL4TGJXx6f0URFnOahME0wZ/i5wIgH03Bd2jIIr+8Taqzi41UYsItMv31dpeb6QlNqdJqDhvQUwpUdd9XRLvObrqES7RKH0toosaKZcNnv2ixDbSnCqTspHOsv7q46TsRzgwtrEPqCNSiQF/xDWpFsw8w7CgAPEekEXIr7r1hkY4gXKNhoIiPnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Kaab+IU4zR/2FW3e4OHfcOsvDM6daHjs+EeIqoEeWI=;
 b=iOGoRIPZG2Gkh7/MCZBvI4O8YAA0ZUk/GKPaS8Aot+xyV5+e6Fjn4/0MLxHkInYuk8c5j4m2yZL36wAxvENT+goWS7bfVeZm0vgfbyXL8Btl0ZS7Crxjufdk2mddXuBr2Wd4DspGKUQVnxcfJADCF1NnMiYjsLayunU4abNnac4CX+7fO6cHCR0Bqc7IZiuUfCHJkxNDCCmUpUJyhexVx8UAk1f9VDeclmCKepp9LszmwqpX3df+jnT27aJxw4NzuyDORsAJz9ahbcWlsmYM8ElPsgs9Hp1BxK5q8PZ8pb9bT6Hiebm1ud7PDuqKupWxKpkQg+yByaoJlDPC3nAuww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DS7PR12MB6238.namprd12.prod.outlook.com (2603:10b6:8:96::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 11:48:29 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%7]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 11:48:29 +0000
Date: Tue, 6 Sep 2022 08:48:28 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2 4/4] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <YxczjNIloP7TWcf2@nvidia.com>
References: <0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <4-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <YxcYGzPv022G2vLm@infradead.org>
 <b6b5d236-c089-7428-4cc9-a08fe4f6b4a3@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6b5d236-c089-7428-4cc9-a08fe4f6b4a3@amd.com>
X-ClientProxiedBy: MN2PR11CA0010.namprd11.prod.outlook.com
 (2603:10b6:208:23b::15) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5ed7a3d-a94f-4658-cd83-08da8ffdb75c
X-MS-TrafficTypeDiagnostic: DS7PR12MB6238:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AO+QR0/XPbH4nPUZj0bFetOeSDA50FWFEnCy2ipKGW6VCf9cGfCFh/hecuoKwvrFACO0oUBtN/rp01H02+1g+M7JGi7BdiwDZAFDOqC3etPdS85PBllSlQ/ipiY0N/jE24HImC1gQOS1DW/xlD38TKQOu56snn+zJkXo8OkhUr1Wfok58/0XVg5+MFPcY54+CVCitNKe95uny6keHv0uRnkqEwU0URSddcKEIc3ySrlAfuHlEKO0P4BIELN7qwxQQek1jyWRF2294qxv/f+cwTPbO0uQ+bEmmXkx/EzeZYMYZjk50MTOsAjEm0pJD+jL/gYJD4zxNdu+bZiT3FsClOa9OoD20uHJYfhxLh7//MQCB7dUmQYX6RHW6Doh+zdK/1sc+Tp47VMONFzHHqakU9yy19FQpIR5DwNiWghmgGluv7PJhBEcefhPWosYGTSBIVWf3gbNFzwedLtrEi6EHGafLgX4X/f/sx4/vUFIk/p4kdyzUDeeNHJAtru3FrsDt7IDVADb+gV3OERCP+cdQugjWCyEWKHGJ+pWar3JAkOrie5AhJJDns/0KOrlM/M9QMc1HxC1/tTNprWG4ln9kadsAuqGZbr6T17Sd5OekrmQwnKWdhhpODh17ZndXgASox9hX83OIYVtPU2KtwhXjQzYyQsDJNOpL3VQnfFXq7P3eWkBFhv/ohAtQ9Aj+6gAavIjQKTtHtv2MBDWIGisQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(186003)(5660300002)(7416002)(36756003)(66574015)(2616005)(6512007)(66946007)(66556008)(4326008)(2906002)(8936002)(66476007)(8676002)(316002)(54906003)(478600001)(6916009)(41300700001)(26005)(6506007)(86362001)(38100700002)(6486002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3M2ZjlEN1FjZ3M5Q21DcHg1VDNWa3lXSS9idXIzUGNFM01OL1Jnb2pyMnRn?=
 =?utf-8?B?b1FJazAwOEV1bEloemFVL1gwc2swVmNKajlDK2xycUs4YTBQNHVuZW1UTFVQ?=
 =?utf-8?B?djArS2k5cmwvNndjakhwcHRqeHhjazdRL1B2eFZwMjJvT2kyWWFTN21rV2FW?=
 =?utf-8?B?dW5LSTJsS3d5Z1RydkVPMUEvVzErVFhYa3V6MDJvaVdpWDEwYlJtd05pdmZx?=
 =?utf-8?B?UzNNU2p4QnV1SmNQWUdDa1d3ZTFrM092SVBtVUFOYWxVeDE3VnZkTGVOMnhJ?=
 =?utf-8?B?WHVHQVYzU0VyRU5iYU5ld1BZMFB6RWVHbUQrR0J6d3l6Ny9MWUY2ZkRHak5y?=
 =?utf-8?B?UFhoNEVmNTFmb1c0Z3VGckN4WXV6UkZFRENmeGtKQys4aG9ZMy83NENwSXdt?=
 =?utf-8?B?S1c2TVViYkVmbGVTSGp6U1dWNkVmU2pzTWUvWUxRNFVINGg5YjhpZ2lZMHlk?=
 =?utf-8?B?c0szOWJXeGNsa0xSUytNUVNyZGd4eUdyVllhbjVBd1NLUW5QcnFWcGVyWmtr?=
 =?utf-8?B?VGhhS01icEdCWWxZMjl3TWorNzg1ZFQ5czZWeVFyNkM1UXJuZkNJMGpJc1ht?=
 =?utf-8?B?TGkxOUM4SHdTWHN1WFBpa1AveHA5MGdmUjNxc2ZTNmQwMXQ4dzZlOW03alhm?=
 =?utf-8?B?bUgrQkJLVkMrOXQ5YXhyazdidHhNRm41UEFWMXR1Vm1vZkMyZTFrTDBaNUZ6?=
 =?utf-8?B?bGQ2ZnRUUUZRbG5ybFYrQzdjZk95NnhvbG93L29qQ3l4YXE1SlJPaUJMUk93?=
 =?utf-8?B?NXdwUzFqdHJvVGI1bEFxVUovRVBJc0llTHAvdDNtejlHbXFudDhBTEE1c2lL?=
 =?utf-8?B?WERTZkdNSTB3SzZGNlNEaDI5Q0V3Yi9pMkxQUkJhZG1JU1g4eTBuTytqNmR2?=
 =?utf-8?B?MTNXTlpXM3ZkdEJabGZVNXBQK0VBTC80RVpUNjEyUE1pdHBCbythVkl3bTIr?=
 =?utf-8?B?ajI5MzVybXg5YlVTWEtJbHZwUnpRVjR4bzdoL2w3NXFQdlI1U0NWOHRxOUlp?=
 =?utf-8?B?RU5OUVVMdHoyQVIvNEY4YWRwWXE2a1NIcFdXN3NwOTJCMktkaWROakxPOVFa?=
 =?utf-8?B?Q2RiNTVHcStORS9oVWloc0lqa2NyeUttVVRIQzU3V2pZaTAyUWFWZmtrUnNJ?=
 =?utf-8?B?dXp1SWtiZEV1VHUzbWRmR001akI4TGVOMUxxWldFeXErRUdIOGtob2kvY0w5?=
 =?utf-8?B?UTZMOENmY0Y3dHc4QlV1Qm0vRG1rRzRUSkpsZld5dVRQaC9EZHl4TS9kelFL?=
 =?utf-8?B?Q0xTZFBqUG5hYnN3TU5SSEc3V2NNbmRjZzNMRnZUelB1VU12bGtZaGdKZncv?=
 =?utf-8?B?Nk5zU1NsQTNYcmlISjlhOUhVRU51WWZad1RLOTZhOVl3OWo1d0llY2dMQmov?=
 =?utf-8?B?QTk3UE1RUnVNblNtMHBWTnVla0Fxd0c2amswZ29qQnY1Q1pJbUkya09wb1Rn?=
 =?utf-8?B?OEw2QWdWNWdLMTRJdEp4UytzRzhIdjNwWndUR2tVb1B1MmdscjZGbmdsMGFG?=
 =?utf-8?B?b3ZJNHNsVXdJQVhBeTNtRGpYZWlpOHFNNFRLN2l4R3I2WTE5SGNNYit0RzRL?=
 =?utf-8?B?SkViNEc5bmtKYXlvMitsOVJnd01ycmdaZWFVeEpHNDJrcGllR3BpMGp0cE9v?=
 =?utf-8?B?YkVMUThwVlZHK0pQNUVjRThWckk2eFlETzN4b0VYbzZTeVhNb1VZZ0drMGM2?=
 =?utf-8?B?UHlxMXhEVW51azJURDJZQ0VGSXZUSTIrQmNCdlVMazFaR3lSSTJZUC9ndmZ1?=
 =?utf-8?B?TnJhdjR2cUtIUmRkaW5rSWtZa3NsYlRhM0pZc21WYVZJeWJnZmZ2QzM2ZUdC?=
 =?utf-8?B?U0FoRWZzeU5tQUxOcnV2anU4dWRGa3pVL1lUNzM0WUdtdUcxRWhXTFZVVEkr?=
 =?utf-8?B?WkNieHR5ZHFaNWFYSHdrTHg1dE1paUFvbzZ3aVZqKzUyVGs4cUNiQzFKTWZH?=
 =?utf-8?B?V0ZScWxERnYvNlB4ZjNhaHhMYXpMQlZlYUwzZjZSdGhhNGJnbmJNVS9nWEF3?=
 =?utf-8?B?ZUZLMjlHeFQ2TTFPa1hYUVZpN1U5eUZONlVDY0tSSEpxWUZTbUtkTlJqdDJL?=
 =?utf-8?B?MnpVSjQ1MXFFU1JWT3RuQ3JOc3JrU2hKYTRFQ1Z2d1JKMzNJcWtmV2FlTW9S?=
 =?utf-8?Q?SM2NPBplj57c0LBsZvNYCz2Xa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ed7a3d-a94f-4658-cd83-08da8ffdb75c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 11:48:29.3562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GRbX6Xa36RBlaeOutU8NjhD0pUrWwQ23XHiq854LHGmYnk5wANvHImlJJOD6ZZuo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6238
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
Cc: linaro-mm-sig@lists.linaro.org, Leon Romanovsky <leon@kernel.org>,
 kvm@vger.kernel.org, linux-rdma@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>, Maor Gottlieb <maorg@nvidia.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 06, 2022 at 12:38:44PM +0200, Christian König wrote:
> Am 06.09.22 um 11:51 schrieb Christoph Hellwig:
> > > +{
> > > +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> > > +	int rc;
> > > +
> > > +	rc = pci_p2pdma_distance_many(priv->vdev->pdev, &attachment->dev, 1,
> > > +				      true);
> > This should just use pci_p2pdma_distance.

OK

> > > +	/*
> > > +	 * Since the memory being mapped is a device memory it could never be in
> > > +	 * CPU caches.
> > > +	 */
> > DMA_ATTR_SKIP_CPU_SYNC doesn't even apply to dma_map_resource, not sure
> > where this wisdom comes from.

Habana driver

> > > +	dma_addr = dma_map_resource(
> > > +		attachment->dev,
> > > +		pci_resource_start(priv->vdev->pdev, priv->index) +
> > > +			priv->offset,
> > > +		priv->dmabuf->size, dir, DMA_ATTR_SKIP_CPU_SYNC);
> > This is not how P2P addresses are mapped.  You need to use
> > dma_map_sgtable and have the proper pgmap for it.
> 
> The problem is once more that this is MMIO space, in other words register
> BARs which needs to be exported/imported.
> 
> Adding struct pages for it generally sounds like the wrong approach here.
> You can't even access this with the CPU or would trigger potentially
> unwanted hardware actions.

Right, this whole thing is the "standard" that dmabuf has adopted
instead of the struct pages. Once the AMD GPU driver started doing
this some time ago other drivers followed.

Now we have struct pages, almost, but I'm not sure if their limits are
compatible with VFIO? This has to work for small bars as well.

Jason
