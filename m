Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A86443291
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A343273183;
	Tue,  2 Nov 2021 16:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D96F73181;
 Tue,  2 Nov 2021 16:18:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=no1TTg0JbDYmNzctNt7eCSPmd69eYUZ43wBUJK7q5RBIK1K3BSiVfl26HOd6SShI1jApClefZOjDqh8Y5Ljk6PSeyVg65VqZypi9u/YEGsz7HDIlXJEYjKB/c3pMU8EYZt8icoRdPBlMt8vb9XC4wJMzrBFYGhMuvqIUSUR4pCR1MewU7BR5lSJ1GS4zZKzYT2Nby3FrNOBEwAMIpRsI/QwJbIPXgOwNPUxEKwbL+zWNvGegFlcmIkRW4SYBWLlW9JdTFr4VUolAQQEav+mq3hy9u33lNOmnInMwmqGoeisTf25HFXzrSCW5688cKfglP+YG6MXYx1SbE6KNm1joUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LFDZiRhi3Rv1asTi6F0aE7ornzsAX+tq/1TfCFvmZo=;
 b=hg80Jvtm6NEb3Vr6CegPhx/njmDLTZxCkdvb6/o/H/0aJer1ZR6K3lx3uTOcZ0cJT4VRTn0KvN8dA01zggX/LFZArzRXRrDSWr4hbB6kCrYN2CK6h/NbL8/7ZW5YXRMJEzBMDU92QqQr1KKHc21aCE+EzUDTTo4GwvVfzw4rGOV/ksG+savRjP7nuiX5p/1CwOT6R19Yq+eS743wZw1PG+JN8mmpBScEKRyC5FGF6ipJfvpTeQQ2/7wmuWsPumRYID4heZat52+Mogr3Oq5TtpG4aLnpu2fjQzATXTELzM6Le6cQFXxfhk7mwHb9EMArDMWinSYvOLgowxLEubcXGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LFDZiRhi3Rv1asTi6F0aE7ornzsAX+tq/1TfCFvmZo=;
 b=E9p/5p+LofjXVLtSKSIUPkW3Sg4OM/wYnMDcnZsm1VBlAdlvYtL/l32gmvRzniDeGaPhELfKrjt05YqgBhMLfhGobI+pF21vLdbGzvfKcNGFirtPo8Ux8Pm6KRF6CXv9+XJQay6V6RywhMZro8ebBo18XylsNhfU+XD9cU76QAsrlPJ8vOgOVPQIHgf2GUnCZAJ/8QispJYvvZkvDV655mAUtBGMEzTLD5R1yFS61TYgGbesYrKVRJ4mkHTIj99ioYqPJ7HLmUs6b+PmtASyCojF8hpYPfGfTle28HySIChsuM9VLvmGbiju1xILtqDCiZPOtNBwDvSJeIsc/9WPDA==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5363.namprd12.prod.outlook.com (2603:10b6:208:317::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 16:17:59 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:17:59 +0000
Date: Tue, 2 Nov 2021 13:17:58 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 22/29] drm/i915/gvt: devirtualize dma_pin_guest_page
Message-ID: <20211102161758.GB2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-23-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-23-hch@lst.de>
X-ClientProxiedBy: MN2PR22CA0014.namprd22.prod.outlook.com
 (2603:10b6:208:238::19) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR22CA0014.namprd22.prod.outlook.com (2603:10b6:208:238::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend
 Transport; Tue, 2 Nov 2021 16:17:58 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwU2-005AZy-2d; Tue, 02 Nov 2021 13:17:58 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f439278c-6388-4de0-8c69-08d99e1c560e
X-MS-TrafficTypeDiagnostic: BL1PR12MB5363:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5363A53BF21635C5C20DB2C9C28B9@BL1PR12MB5363.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:269;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: csVYjqLZ2HXoWQujzAYMN5GiKFWw5pUCKJBTy9Z/eknzbbQkEGzQPFjEDRaNt1DYiOICRC9AYUuTtJMYv/7fr9jDQFr4Y3lii13RPrCbE2PkOFdMNTb000t7FCbE2ESENfy2yXdzgk6klrhKvmJhSrq06W/Jvri10q2V2/ucy66JPrklTyKs2BmLk09oMCWYlqI7DfKOhZp6DWqTDVjMkWFBK9dPP4gTXRajRXjrvQh325jzR73X6/NBf7ld1HFtWAqm9BZ+ixEMmiorRX+/Kz+Mfzcs1/4k5mCzYyNh8OT6fpWu7qUyNCp2D0ahDlCKfQE560RmYM54DPyGmUmDAJY45NxuN9Dba2154BsaGrRRj9sAWvL/5BHM8UYGHstLtPMRv56aD6yv6pnnZOQ5kjhKrvBjI7K+fcJy4z8n1c0DFqZPVqgmkAuZmEgjV4U/Y72meXKSdb2vYj+nWkB7WhuNUw5+7fj2NsOn0dz/1V8U7CDjLml9Ua7r6YpgIFyl4jyIPkeNi+zjuQOS3e89vRBsEITcTRGncVvvUsLuTVJksitb9Raay5B+0MdATTHrPcGPS7sRCjyG65uy205OCMqhAUALL3GCvgcEcAV9SQ6ef1wLmgY145PYcfWJkMZG34hGSQ+glHwZYFGFB4kdsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(2906002)(4326008)(26005)(54906003)(38100700002)(66476007)(66556008)(66946007)(508600001)(316002)(5660300002)(86362001)(33656002)(8676002)(6916009)(83380400001)(186003)(36756003)(8936002)(9746002)(4744005)(426003)(2616005)(7416002)(9786002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y8hLW32wVZ9p/lJ/hQaO29egDAtGab2N+UgFsy/qWyuVSu1Oxd/eyMv9ch30?=
 =?us-ascii?Q?x61qPxnGeh8MlcW/x1k6skjlOpuQgRZgzVMR8cDcSpGxTqtCkcF+krxZLIfJ?=
 =?us-ascii?Q?7y1lL6m77fAdRkEOJ5RAJMG5Yx6tUDJa0p5depfoASpI6hV/9FemGhqWlMpd?=
 =?us-ascii?Q?VfuoMU8DmLUpSLKVxqls+7SKew67AJmMgOCQl6a3kWloNE3kMeYPO/XsCfFE?=
 =?us-ascii?Q?anMemzlDxkakpA1dg7NMcc8OrJ7lDW2QuremQ22qQHkzsN42nNStSJTS92fm?=
 =?us-ascii?Q?sp8DM0YqADUVQQtZWGvE1P8bIxII2flDy/gpNe04m6jiEpMWpAXPiCx/UV7Y?=
 =?us-ascii?Q?PVG2CKTqAHHCcuc1nuedcLg1JPmfvKuX4mvfyI/tdIMwUgj6lQb7ZmtNpIqQ?=
 =?us-ascii?Q?G2hsmXw0hAJGZglUzeIXk1W+k/VR+iZnM5ltKwsobHcmHLyTFYBUUxiDTK6i?=
 =?us-ascii?Q?FTGeDQ/n0IPX8RYFdk+QC1aLNPL/2ZOENYv9sQIt7yzdIpSl1PYeD9BQld+A?=
 =?us-ascii?Q?aT7/YPrxiO5X9j8LfxqeqidGzyG+NfD6LSKN8w//knGyHtVQUY9JyUiVJEDf?=
 =?us-ascii?Q?TawFDN/IZ3z5WmuMcM7DZOkqdJ+Cj+zi8IVurb0Aq+mSwn/IU+NiZWLa7ATr?=
 =?us-ascii?Q?QfzvbHtV+ws8LPd13Sxai7oW+t6VKCeu+RryCeHnkroKz9egbncEnL9raDQE?=
 =?us-ascii?Q?wrgRFzg/sfazSgdwC4filGmO0POrmxpggTOZXiCzJ/XJAJLEmvAE4O4URw9R?=
 =?us-ascii?Q?p8yo4e8HK+3kfzrNk83vSjVp7+9vjVkgmwvO0JNix1Ge1Sx45ODmdS4FddtZ?=
 =?us-ascii?Q?9vmT/4B1S5+o55gUOpcIcrBw20E0wUrON9E1MbFCaFmMSWpIMCEDZQ1qiNL/?=
 =?us-ascii?Q?C0Hq7R32VT6SuU0c1Z2TVQfsxyMkRm7N57hj/PvANW4FgB4C3eNh3hfJRl/z?=
 =?us-ascii?Q?IQjxhd6Gq+45RAvEjujqqEn01Bu+T9xMo0VrWXayHQzSaAY7A3x1bLxAUeiL?=
 =?us-ascii?Q?9GICcLUhYh5YkOxXDWBMWYXMvpF6FqKC/3vRx/cUNYdEHEewCzJXcwxwojWn?=
 =?us-ascii?Q?8uHk89BCUrTxq9elC5C8kDRn6JTUiaNHScm6gR3S6prb1umhs5mqilruE4Gj?=
 =?us-ascii?Q?QwWB6rCQxgyFqueSURDGg1x76mmcThcyu1VuzStce/lN4wZPCziN0fWG1Bvf?=
 =?us-ascii?Q?aJXRcOJ7/TK/LZDLcfnmfv9jSmJ8EoNaTngF6d16lQisY7B/vdPSRelEWl10?=
 =?us-ascii?Q?gSbWB2b6XWx1yns1Cvz6N0R2ECJHH5WRfUt7pPQdXaPNnTZpa7Eq4DNC44th?=
 =?us-ascii?Q?TU5W27vMUEWpRxkwhdOgUOSTjSoCYEQki8C/aFWnU+8S5Mkrjhy8BrsloFjw?=
 =?us-ascii?Q?lGdQ0Ov7rnFV9dHLIEkEqvmeiMXzscznmkBMqIyBZVj1mZrMjVCde7hslpDc?=
 =?us-ascii?Q?0aFoPywKsNBFAw4yCmYfcgnnzj/tYR1NaHQFWOJlQzlpj95Fz8w7+8o3cpRK?=
 =?us-ascii?Q?Qp+ncK9/rPNlvrGp9leEgCmGJgaTtPbPX5JiA/rUnk5LworZjQKFJANdnOsB?=
 =?us-ascii?Q?1ZzJr8z3hZicQop32IY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f439278c-6388-4de0-8c69-08d99e1c560e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:17:59.3316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: meA9YXUqZbKu57EVZ2qkMFYWECsAojf0dVqk3OGpfVrjolhwO9suQA7t58cpBLXP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5363
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 02, 2021 at 08:05:54AM +0100, Christoph Hellwig wrote:
> Just call the function directly and remove a pointless wrapper.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/dmabuf.c    | 14 +-------------
>  drivers/gpu/drm/i915/gvt/gvt.h       |  1 +
>  drivers/gpu/drm/i915/gvt/hypercall.h |  2 --
>  drivers/gpu/drm/i915/gvt/kvmgt.c     |  4 +---
>  drivers/gpu/drm/i915/gvt/mpt.h       | 15 ---------------
>  5 files changed, 3 insertions(+), 33 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
