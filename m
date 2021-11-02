Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6782344330A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE8D731B9;
	Tue,  2 Nov 2021 16:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2066.outbound.protection.outlook.com [40.107.100.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C69731B7;
 Tue,  2 Nov 2021 16:37:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLvaIjgYe4dhSI67yxYjQBVK6YK22UPYHEA6I8SuaZI5XIg0c9IS17kRK3EpwGxdaPCvRAX7+GykGqz3V4+xqYeylcgDbpWDjtnau5qnwPxKjWu0F/BpEkNj6eODe+MP56RXR4NQsmmkuCaRd2Vg2cx8HIFpueLbHDa0hSUDjJm/qKqrrRZyOe0u/We+9dOttMQcGzCgxkMG3Tt4NbkpaonGqvfbpknIkVlkjycF3ct/o4WRzYZ+fYJGzRAkEjATddZEvCVx6Frl5qEparWaRkiQCvroZLSPLFiNfP5BbsdTwMbrGL4/9Dv+mbcNtVEaK7GQA+TXdMCIqVLut1+HdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tf8Jhv1zDs8aaHpgyxt08mFpbdvgZwMVr0yHV8ae7GI=;
 b=lofiXhu3ifgeZqeTQJtf/aYUy6Qx5jg78ldq8RICj0c3vsUwAsT7Xg9qhWXqLMVuv3BHoe7TdELD8ho0ej7pZUzfmspDRQbw0+ccxLONIaAQAKu5QswMT11qNQ2vGs4aMh5VZC1V/NpNFMUQwm+IbZcb+GLTxaZD40SnYptk30bNuz011Z+4xxqPJPB+r4dO5f8ECxxdaY/pgO8hFV7Muug/ibf/EP9+lQ+3ZQMDrEYWPXtqYMiTFaOXsX0Ul1u8V41QYvFuWRd9HVvxlYBffxOTImS028s+9Q4bphhAbcMS8XadsxARAP9xKJVhrdENJ45P4fTd+7scqNTcLHulxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf8Jhv1zDs8aaHpgyxt08mFpbdvgZwMVr0yHV8ae7GI=;
 b=Iqg3Ei0XF0vtws2bFQC80luHUtjpDvRwIWokSsdxam9cYvREoDjvgNjYADdG3WW8Ty6XYYuCQCSW+KQU0KpgmNtjmxsjOEDeJq18l993Ivz7BItCF2CDOgd7ENYiazEWCxWH3ho0rMP6VclKBmNRd+dgPeMLcrTs8GUznJE/p4ujo4qUjtVdjNaNKDuHQ0Y/zia8D6WW0e3ekjfP8ew2EHzYNeHaqLPlD1zvN+xUIHxV97GnTVR53WzmE0jmL+qRVXXbCW4dwoZZMtg8eyqJ6zGw+oyilz7jd8t4Pdsqoc6Qun6OdinMUkz79M+VDqJbxu0VceQKc3ne59tTEFNyEQ==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5175.namprd12.prod.outlook.com (2603:10b6:208:318::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 16:36:59 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:36:59 +0000
Date: Tue, 2 Nov 2021 13:36:57 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 27/29] drm/i915/gvt: remove kvmgt_guest_{init,exit}
Message-ID: <20211102163657.GH2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-28-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-28-hch@lst.de>
X-ClientProxiedBy: MN2PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:208:120::41) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR10CA0028.namprd10.prod.outlook.com (2603:10b6:208:120::41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 16:36:59 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwmP-005Arh-T6; Tue, 02 Nov 2021 13:36:57 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44c79e02-f53e-459f-089a-08d99e1efdb8
X-MS-TrafficTypeDiagnostic: BL1PR12MB5175:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5175C08BC738481975FF630DC28B9@BL1PR12MB5175.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:260;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zH/pD9GCt3rlKIcq/EdZZjElpRa/v46wTWRLNyO5liH+yhaIJHDA1w4Ue1lE1Jn+D6RuVTTjVuP72D/gcSr/uFgoM9g0uqFHi6MKs1dWwqZqZkfLp7uPRur5koRlpCf5CpXa5BscQ6BuF+S8iMtSm9MvHFqOK3CMrwX9Zgk6BOmP0UNKHXy3NloLxtXWXKThqkcO6nLj++d4SGjYQgHS0yX96B+vgthxjKqKfH9vRvAVAg1yt9mWfP6eIb/YRWpsdJKRXl3b+QvUZa2oGZXCNKv5XEeIjyGdasSRKKCrPkH4w0h4LhJbhry/hmUUTjFgcFl3SlJ5e+YCHGuxjx47Y/4bwTZdHUGaxuy9egHaGrVgGbA48q7jHnAUyZnk8URKs2RgyzyfZvWkcrFxrYrdM4n0QvpqdGs6QuMdR+FaPm5wN1RmB3p2tnLRDtug72Z3C/43n699180H8wk2GZltjpxve0WJTH1CCserKjXhZahx8/jjX+yPY/7PhW0RMXvTzWLY+jWMcLlmOgGnqpY+ODNuNzxhJIv6+wkPuc7j/b58eg77vBaw0Cyc4zksjJecT6AkQx51CyXSpuMWFLvYmQMg4vDjWkub+mxhs8f0CKL7xcKVYtfKUWMaI7wSMEmP8i30wSRzPhmkjdR1hxuFFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(2616005)(26005)(38100700002)(66556008)(6916009)(66476007)(54906003)(8936002)(8676002)(83380400001)(66946007)(5660300002)(33656002)(1076003)(508600001)(426003)(9786002)(9746002)(4326008)(36756003)(4744005)(186003)(86362001)(7416002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2s6qJJjOP7FBTRcQG0o1Vj6d0O3rIon4lIvI6M4e47bzAnWKaq621fNewggB?=
 =?us-ascii?Q?Abx6MnP5/GEnd9v7Vl4DbY/6FktxcxDBvoXBniRk9LvzMT1M9e0yWGNBUkCK?=
 =?us-ascii?Q?hemP5Mhz3yJl9M3VkJSdIGea6Q5a8Y1eA4ESkxiWOF83OYcnDPCOFhDNGjnU?=
 =?us-ascii?Q?6fpV3XV4BY82L6uP2QGq2AufFl60xOutAY1WlaiV1vUBM0vYAjnOcpURcWJq?=
 =?us-ascii?Q?U9xQcgI1rNfTkwYW7EcBIaFF66GleWW9OReBmTcNhF92a+b6WJjvw0nn/apv?=
 =?us-ascii?Q?xs5GYc57Do7fU1t8AXmGJSLjSf6h8QWiN+iPjzlJV2u4N7Q73z+omXHmCm1L?=
 =?us-ascii?Q?ZE/Kx2Ba449t1OvsrNsSETZwZLUyXdATTdqAIvHNH7LTQfWb9KgEir18895u?=
 =?us-ascii?Q?F0gXdthQKcQMoPa5A5RtB5RtpWuz6f4w2IhowAuU5NBJjehAiol6xhMlXmJG?=
 =?us-ascii?Q?DX1mD7oCsgQzxc/2HnNFrRc7p7XChjaVfUkAJD4zRDhAJZMn8z13M899PHpX?=
 =?us-ascii?Q?munUuzaMbd2hpwlDngsP+y2L3z8mTPW9VSr2HJPwV4pVRIJRqutnNLgdx/FZ?=
 =?us-ascii?Q?ippZAQXKAiSW4Qt3Fwq5OKVD1vNX2m8ZmHo4qHt6BhGZKDLlfJrjLzMPLhhl?=
 =?us-ascii?Q?RH0AnPxct8s1XZcP+TX/URZqUd1LSuZKUGNoIBIrsdWpjYq55Q/L0p5kOH4Z?=
 =?us-ascii?Q?ice2C2+CloJg2CBHrUVXCjktwwzULgzhB9iu2/+Y3N6osOUm+eNrxrmTD5i6?=
 =?us-ascii?Q?bdZ0qOK+cl5vtNeA7XMEGp9X5jL9sgaOlOwMlqjiL7dkJDSPsGtwYPMyVRlG?=
 =?us-ascii?Q?C+8L+2PLCFBAxdudqz4X/QiEWmt5UT3VoEiFj6ixUgwDFe0AHvJfFBkJ1+1z?=
 =?us-ascii?Q?7gO+sRzfKDyPRiMVoamOIzmyr7pChPskx75ic94KL/OXE7O3CPP8Xcp/KZPL?=
 =?us-ascii?Q?/IVBSrrbLRc5dOi6FEYKUUgBkQO8B5Eh3qdCNH3obaUqHmhbcdtW0dkIAnDP?=
 =?us-ascii?Q?YeRFGr0mTIpMHwC1TZXc0LqwiQE0xhrkIAcflVRKPr90jepXqOCNGs09dRuh?=
 =?us-ascii?Q?O3NSK/LwvXKQBOdIGmNNIsSwhHze02ornHgQXmj4wEdOsep/jxJtl1Ncojp+?=
 =?us-ascii?Q?GXv1dCPsZpZgCN1ybFRNlAg72JPuMd9jZUJ2HQP/zaAQ7GeEeBQsQ0atNmlg?=
 =?us-ascii?Q?/bxrng7xVfci9zrpfKr/ISWRUKk7N7u+6Yq+sDDYXjDRwkSXR7VxPOaUwwUX?=
 =?us-ascii?Q?odUXGaada0W3wbzVgJDdYK6FjflP7vI03FbMqqAE2L75i8OhiPyt4L9MBW5m?=
 =?us-ascii?Q?chX04SimiTBpqZEjMLpVPPR+L8eYFywfvufJPYzXLMcNnv8oAvT7L71To1cy?=
 =?us-ascii?Q?q6WYvJcAOHqEUW4zdBuMF3NdUohW+LBNaV+j0LsNnSVZ+yoJuAyVUgmEa89d?=
 =?us-ascii?Q?KmEKkuR/mcqQEFZS44JkZ4C0oYEYA18t1kigBpEjvabxbsCseVeVMjt7P4m+?=
 =?us-ascii?Q?ufmiTqj/w2I1ut9ru/qJCQRh4DZ72/rdqN9OwgEbqwVRD+kchP9wwl7NHFAz?=
 =?us-ascii?Q?4uCADu0UH4OIKcTfSEA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c79e02-f53e-459f-089a-08d99e1efdb8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:36:59.3993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h94dWPYsCLrLBHoJW0nt1V8Tk/WL1gnhu97oeDQ8bcnfdIHkTYvvoiyDgm9fo7uj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5175
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

On Tue, Nov 02, 2021 at 08:05:59AM +0100, Christoph Hellwig wrote:
> Merge these into their only callers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 129 ++++++++++++++-----------------
>  1 file changed, 60 insertions(+), 69 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
