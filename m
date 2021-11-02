Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E90E44327A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FC87314A;
	Tue,  2 Nov 2021 16:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA007314A;
 Tue,  2 Nov 2021 16:14:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUw+IlrfsBocnoeB+Ao7jDg+pbSjd7nCHFMmKyq4X+CpRKu4TLTT6hpWdu9Jf2xIut3P1lJUndKicHSBJbXl1MgHWhB0mtIYg6d4XJOkARS+8aguaer8yqT/iiDHoWswh5fkZa2+c03p+PLy+QtDcTVwtwAyGr0Bw8wfWOgWs8pbpkq0AcLa844l4lQG7UipoOqueBfCPQnH7uWJf1tpb8AGbfQUtAAjhyPx/JosTzm36hLgYLJ0rpquOehC0QNIxcNvBfnLucUt1Kcwugc+bn2tfW8vXOJ3sYGMQVjJDkB6rBxFesDle/D34ytzaBJOrWuwkFCfcC/vGjLl9LG0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fV1VdAKnpk5YbEKhj3TlqiZT0dJTQh6gnc2ChazEXwo=;
 b=V1WxNQilpV7kG9rX05qGKyacRWRpoHaUmBNChAWc+WUVwKiDOTK6SvIz3Ui4140IQ7ChqnMyqeQXDvAlpIj9pGqT5zEsdTlwc01Fj0cLztupgdCgEf12mewdE6XqdOuIuz37V1dra4nB6ueQcnKyVuNtIY/v9vIVX/AJvfqhkkmOMlvITApl/1QZZrObNTnRETBZm2pqvn/Bx9kOFJlrlXYi5rUJY4NG4CPUafLmrn2TtQnNvSlMt5UsMjROGgeeA1yn5ZqyiT2sPc3akxg0Ocz6ayIgS/FPYdDBwA4wyZHGKOeLjM2/WvscEfFWFQyAUcFlr2kjDFrbmh8bZfVqmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fV1VdAKnpk5YbEKhj3TlqiZT0dJTQh6gnc2ChazEXwo=;
 b=bLgHgvCODzK+Or+AqpbqJovLLoghNM27rH/RAHB4GzEQqBSp83MyWTKEhNgwooigQUy7/4+jWNKTZr2LVtEXV7XCKYtUgqn2IqKOccMKjEiPN2Z6vJ/HhxBl6OdL+aMWsY/Jltmp0jDbu+Mub6YzEGATqHNWeeGHX+TKF3h/Vm1SpebxkJ8N2zlyJwAdcnTmHWKHYZGYNhg3sKczOtnahmusI/zsU9uwFaRgqEqeJViPGXTGktnDyl3gqmMEhbLrdXCFFzfL9OihU3B6WUzdSjvZgiVZ5TPaEHGTUqHZsXbh3lDLFLWh0HPUbpPmfwBDRP8FD3j7MIELW6/FzLKDyA==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5319.namprd12.prod.outlook.com (2603:10b6:208:317::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 2 Nov
 2021 16:14:20 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:14:20 +0000
Date: Tue, 2 Nov 2021 13:14:19 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 18/29] drm/i915/gvt: devirtualize ->is_valid_gfn
Message-ID: <20211102161419.GX2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-19-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-19-hch@lst.de>
X-ClientProxiedBy: BL1P223CA0021.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::26) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1P223CA0021.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Tue, 2 Nov 2021 16:14:20 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwQV-005AU5-Tb; Tue, 02 Nov 2021 13:14:19 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1813625-4d44-487e-4f17-08d99e1bd3ed
X-MS-TrafficTypeDiagnostic: BL1PR12MB5319:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5319585411E243F808627283C28B9@BL1PR12MB5319.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:366;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P75JIcOS4QmldfmypbS0a7CeZqLqs1LPxMD8y7/KwJP4bseLpXEK5t/DPcfB1rm4i0Q2U/GD64XbhHZ6YNS1gvmixx1IfWftjDMkd2rIDWAasKTOcGTa0xdAZNvfv5smxlueKfzADvusOZc6NWqR44chc2UOlB+2IxSKlJZ1e+ol49Q3RS7gQwxsnXUjONJZeMHMBFAqp9/nrM6oeRXryOyn9hX+M3pVXDIAq55kX6sMSL56LUczfunk0Xi3CikAIkWkEp/X3TyJo5vns8C439UyjyoSSf9dApLVrOo70OGTRqaYB90y62MKYRgS3lLRGzdFOeVAgSqwRR6+xZjEAzF2L8ZYW2iWWhZQlNdsdfKhQvPT3co+S7jzP6JzN2Ve2kcCO6e0tnuwGDjX56Wa0/BpopMDx/pi8K3rJ6ctc9LUlW+3Jb3yO+7C42lQ9W3xEEZi5ExEQi8NzX5+Yzuo/0v6Xg4dFnX+3ZU2inKyHuJXjaWfY/8/akHPEwaq+dpZfavouMR1ZwxTMZBauLY4IJ59irGmCay+jt4p4TVZuDthKAi5Zp2xk74Mhh3quGlMi6RS5aVF+DM2yKQtnI7Q3e2gmjPiHZo9WPNN02cQk67WyyQBVShzW6EJDmxVc9goyA0RYtI3ST3nRq5YCHw9fA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4744005)(508600001)(83380400001)(2616005)(5660300002)(2906002)(9746002)(26005)(9786002)(186003)(36756003)(66476007)(66556008)(66946007)(426003)(54906003)(6916009)(38100700002)(33656002)(8676002)(7416002)(316002)(4326008)(8936002)(1076003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pzZrQSnJMlIxle3PBsEPoB6d9+183cXEaHClDdwxmwY+L4CyHHeXfFJqVrEN?=
 =?us-ascii?Q?W1ycF2qVwg2h/MVL1r1mIGg6+46S+eEvuyJBAOgdStXBMp04uGsDXjPXrCwU?=
 =?us-ascii?Q?n+RjeImxjv8XTe6hxOIsQBxbWKHHMld1TQEWKtTNagjWd5ELD57DdSlO2eW3?=
 =?us-ascii?Q?hGAhUmIxfoz5xsebAT0Zpai0wqhNGC6JACX1v7Z9KlR8VTYNyKpckLvPpFeC?=
 =?us-ascii?Q?3xWkam7gQOM1i0tYunKbwfTPpp5xXlMZLXh/9bkG5z43QBj3d0lYLxC+cQqY?=
 =?us-ascii?Q?yC0ABkoDntuaW13qmwH25ERYMa/0MzQHM0XcwIu0BfFuxisfyrhFdcWlqOUH?=
 =?us-ascii?Q?vPGQfTNtCBKrlBmbcSAGvKqFI7x7ALgRjS/36Le24uiWqxf+jGDPJlh1JQtT?=
 =?us-ascii?Q?88X2vO+LB8GJ67POIhUsAYkAdJ44xmkHhvzVUoXY1E4Nq9iLE8xVli/KoV2G?=
 =?us-ascii?Q?PkDafd1zqTNDqDx27u3DCAEMuQ0S0h3cjHCA0NR1+0XxUIvrbTR+BUAyJ34P?=
 =?us-ascii?Q?UnJ3SPRjGXsXRxXVzR+gtHsWN422Lh2opQfpLF2Dp+xqDGYUvW3PiLFFO3B5?=
 =?us-ascii?Q?7Lv4Uky62PHEHMd2sAGHlMd7BC4yeQTMmgGgfexsLcN4fJNCx5oOMh2BMF6M?=
 =?us-ascii?Q?uTP/jzwXwSO62ysytYd1ribom9vvxXW73j3TjB/fl8+aSm0Sne/bWe8+XLsV?=
 =?us-ascii?Q?lBV9Cm1hrWWW5UpbdaeFLnkQY8xbB+9//EfDhBO6B10MQbYupdKe1ck1+gM5?=
 =?us-ascii?Q?BNsFe38O7LG+YaiS/9x7vhUDGeKMAIKw4aY2RHi7jfR6GKgKtV/luT4sQgFe?=
 =?us-ascii?Q?aPRIsB+91Bir7IczTPukvXTLiiaBbnc5O8LOyrt5U6T33lPYafNvE3t+XrKm?=
 =?us-ascii?Q?xSRu9kGtySddz2ZpisJEJpoGNHi77twbpASipFnytzo9kGxdkzUScezIexuu?=
 =?us-ascii?Q?ulkNxfjmPH4u2N3/JeE3fmtGrPFVxVVXScGOIeucax7+8Ta14OFhGQuf2cQG?=
 =?us-ascii?Q?gy5ZGHPkWhXZvddNnDbRUcVibwf1MKqxyGz7VSFc1R3Snw7jWGQJdOxX8NpF?=
 =?us-ascii?Q?F71TBlgENpHIqZNzZ5CXLIWzFD8y0H2sVgc89UEjJEo0Tb6KU6ZK/5KVgGax?=
 =?us-ascii?Q?w+0+OtgXKYVdcIxDaUkvb4cEkVuvudkmBphSy3cvsFzVFJo44Vknhu939aAT?=
 =?us-ascii?Q?AiWnmUPyV/NbGb0Q4enP4pl8wYYTqffL+cDpK9MMhKwG/KHW39EGWLoWdhMQ?=
 =?us-ascii?Q?Z1q383i6b+TdglTvSgpv5Yw8mZPlIERoFAU0o6AYk2/GALaoUQTslkuLAOMz?=
 =?us-ascii?Q?0RwTNCjjCUyPKircxYVT8eAakx5wPhiYBWeJfcHsZOxmZna2CWpM5aTLstkw?=
 =?us-ascii?Q?dKCFLbHspHsbSIVB3m1niRnsb5pWOtAZUH9oM7tgAlqUkaoQQAO5/QN8wej7?=
 =?us-ascii?Q?PLRwrqr7UFTte5ac7pkDuGdUZuQTP55SNwbFN9Mm2f4qlTEslUwzWNz2svHq?=
 =?us-ascii?Q?6YNLRAPe5EGNrqQ3CA+Ld1KQphvPLEJ7kutoUNxnyIH35zwGdamlHtdA61pJ?=
 =?us-ascii?Q?X+Y9UPt6fPMD2ZVbVow=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1813625-4d44-487e-4f17-08d99e1bd3ed
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:14:20.7820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtiDYdzGISIEar/UQmrdcWZsDWuPx4+DCK8EFHMR48j/DHevxeuO5chP4K0YM1tB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5319
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

On Tue, Nov 02, 2021 at 08:05:50AM +0100, Christoph Hellwig wrote:
> Just call the code directly and move towards the callers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c       | 20 ++++++++++++++++++--
>  drivers/gpu/drm/i915/gvt/hypercall.h |  1 -
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 17 -----------------
>  drivers/gpu/drm/i915/gvt/mpt.h       | 17 -----------------
>  4 files changed, 18 insertions(+), 37 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
