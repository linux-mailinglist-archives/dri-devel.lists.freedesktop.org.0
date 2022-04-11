Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C294FC25D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E287C10EA8D;
	Mon, 11 Apr 2022 16:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EA010EA8B;
 Mon, 11 Apr 2022 16:29:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6DwDdTFFcUZQ0Zf7O8f3pByr4uqpWhlGLdizyYZudN0n3KpIOepkJxTbBPbnvxAIGnCFPToaIujIihN9sg1uIMWJuUCgfENoLD93h9RsV1bCPmdM1WOhMmgIy5qUfvRvLrYL59US4XpxtJ1+YUpNRVqBxXD9DmNAn300wLEvwcCxbaf1htg1tV2TeWHtnUHJpzax78BuAFnHQLURI2cozjYMyxho8JJsNJDxwGBEXaYmVMb5n2ZpW2E7287nYQz9z3VKn3LSQfdkWYKuKEcWFRHK8Z2QkZigMHGAv3BlNE9wEv8IQlhJ5ix+9jqZzxDlKBiyOXcGn7BzElIGKGxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdK0edxn/8XBxYQu5eozXbovxOwAEAvZjc5dpZ/W+hU=;
 b=Dh1O+SBVYqzktPryyi3OF0/jkhwcsPqphnyPgUYYFHrlwu7JTAINlXgSKXX5wAmTuSVdWc8RIcN72rGocR5QaDNIBxF07knwoWaX0ZaWwZUOxtV98iAtBhSEKaWtvUdeNqf8tGQkXUoFlaYcRb9lPpAzKILrKAtrEEHABoZ9I+4/NQFjdVoBPowLggWJPmaTxknHq0iEWa8MFiK9CilDjJhhFnXQvxzZFnZjb6+x1vqeh3yhw0wSI62TXa25gu9XpSa5W2MhxxYFBrtFx66oMWEyMISTTBNFP1HB+wG3e4N/RVEE2moe5hxwG0bu0XeADkeCf3/s+uBQWINXyi1q0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdK0edxn/8XBxYQu5eozXbovxOwAEAvZjc5dpZ/W+hU=;
 b=cZTWNL6M+OK6B2qjrHph3GKcJhLX/D2r5oTtlbqVY9p/oic1j3ocZ9Uc3IZyIKIBs8GYfqTX1x2XKyOCpfPWyMNRQfTZQvdh/HUc51ZRZ7JNEgw+2h7Zu8EtSayKKOUka8MsLLj5juIaXcx1f3mmKjLOnT3fOkbLdoR6XRSLR3YpktS6O6jaOatTZHFId76fYt4HrdZHPRhMybSTmJ7QIwXw8hd/IrhXlFxdIKqs4+fBsIBv+dOfp49OEf9EVReDdGHXk62LDha3g4cexfImOjegxUxzA/684YzD/8q15ki9Nz8fZzo+FzvKKnflzAP+9iN2e/J65CEgxdAT/Smwfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY4PR12MB1654.namprd12.prod.outlook.com (2603:10b6:910:3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 16:29:36 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 16:29:36 +0000
Date: Mon, 11 Apr 2022 13:29:34 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 19/34] drm/i915/gvt: devirtualize ->gfn_to_mfn
Message-ID: <20220411162934.GU2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-20-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-20-hch@lst.de>
X-ClientProxiedBy: BL1PR13CA0446.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::31) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cff95eab-0503-4797-b245-08da1bd877dc
X-MS-TrafficTypeDiagnostic: CY4PR12MB1654:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1654BC70F96297B95BDDAEB6C2EA9@CY4PR12MB1654.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8j2qcV6X+LVmb4UhAyUvB1J9TvuS1A/Q1iTqYk+N8sZDeKDEdpxOFqPS92QQS9pTLpWUgnsvHIZTvVPoSgQimAOnCRVaiBc1gTxpWORjkYN/EBYZ2JFfaCUpdD2T/dVjr+YFQiYaGkUqIIpzwZOjlD0PytO4pAGl7Hz+t7ncyATEE2x8JxEzp/9GFMCUYzV3QL88MZDPJuSKQdUdkDe8W+kip55RWI5q3YQ5DTFXIv/cG9wxkELYjQsBfSIPTJrP/yzxQbyWs7RR4C8IRUvUFXpMzOX4TW3+FK7DdPFILodMnCDqm+iUcQ1+dbBfA1CLSk3YvafOxrMm7OEf4ZUbea3zzUzyiWr8Ecihnb+bpTVHvkP8xRqTwEhqKq6gRF+8ReBVVEJ3o6PAOSFNSEKov9ikSSKpgA9vI1sp4a19ZwBurT7XdPXbH5Ug4jI4BZhfqWxPY63TKoNPiILAzLIVmgbXtZExEwKE3+fUHg9vIyutz3P33H+0/QRwHj/2wjRkQ4Us7YfB6vQ9swFl5M+vGEhdxDfr3C7nzGqOq9mt5pdf8ebf8XcdwLh8UtgP6B+GHK/d+1+j1WBIAltbmJbtpLumFI9Mj2/bMw10dVH60yJeq8PYvq3Z9O8AF9zXfspC2arsaPkuEw5nx44z4ZxQ7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(8676002)(54906003)(6916009)(2616005)(5660300002)(36756003)(508600001)(316002)(83380400001)(6486002)(26005)(8936002)(6506007)(4326008)(186003)(2906002)(66476007)(66556008)(1076003)(4744005)(66946007)(6512007)(33656002)(38100700002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Db7/cz3+p7oxtX45H3Mt+o2Lbpo4xiTUINcyiUwd5HKsGotO5j8HEJ1CPMy8?=
 =?us-ascii?Q?giznzBCYQKAqrUQuUYghjS8+iudeovhBhDaAjMlOkCjgdqxdzUNxhF9ysXoJ?=
 =?us-ascii?Q?/QdOgv5YvdkAUugNL8cXg1oMGJ/SNvY4aP1HjugGmBdkDXin0xeHFTUIRkqK?=
 =?us-ascii?Q?dH2XJRg2EcltcLIh7nWWrF09NeKj8pVeUJw3k9+SIVK0XBncfx4ANdy3lKPw?=
 =?us-ascii?Q?WDfA58PWPFN9JnQQ6wpuVDCjixttwnPihFlfcE0V/bbhVDvPdHmMFt0PApKx?=
 =?us-ascii?Q?WZCcMly/4CYCeWmPqxAFxU0UXWsKcjt4qoR3m2L/hpoKEwZ0eK4FbUY8/5ja?=
 =?us-ascii?Q?Ei38drqn6jhbKWKyIuAtHDZ1ofjgjM/tSdICuHuIxCV74aQ3BKPLmzCMS2lF?=
 =?us-ascii?Q?SCzgv+0s7fo2H7HFtKAbbPw7Jt0EH8if/lcW3fQyUbohLmOILM9j5HBiKqql?=
 =?us-ascii?Q?V10O6PiiXGkc4eQsyNgAWFe5K1mld4+/cfJounRzcZMOGcjJSu8vIEF+EeIB?=
 =?us-ascii?Q?5vqtb6Be4cTOako4qUh2f41+hF1HzV4UQJn/Vj5ke0bq3xFT9D4ZE/9eKQk4?=
 =?us-ascii?Q?i9phXilxATS9HvaTNTQsbgHYQ3IvdXe9WvvNERXkMicIXzn4sxLEEyodHtyB?=
 =?us-ascii?Q?T8CPuk4p+RPzuyO4RsNIeC1Ss5EAe14IXhZ56jYfs9fvlqJXfKl9lJXd/JpJ?=
 =?us-ascii?Q?EbFmtbdlBwuWAuOma3B4SrCJzDXDlfMZ8u88a4spNDVHmXzRbXjBViXulCLD?=
 =?us-ascii?Q?kj/OXoaQ5wxLbQCUeH7hFiu69Uq2w9D2z91yU78p+qjSmsAKmeBm6uZzAoYr?=
 =?us-ascii?Q?UWuvXV7mehULJYBwZ7NbilzxwSywag7F6gdiMtXlPhy68muMTD2iMyUlJIoD?=
 =?us-ascii?Q?lDG91TBv27rnN1eny5+Doy63THkjn6yENstUgErF9cyH4Fd/UaEwd/4xT51U?=
 =?us-ascii?Q?sboJHrBSV5DfjEHufBhLkjFRjLV6rCc0AEk7nwR4guTJ+uc4svPVquALQeii?=
 =?us-ascii?Q?Da2xSS3iPlJMRVBsBM6QlHSeTc/Fl4WXxBuE86RS1xhPgQnZJzBDFKFcrylt?=
 =?us-ascii?Q?NiGIpXEsNCYz2aVNdA7EEVV5Hz/fvrrhCw3t49WOQe4U2eiTM9K/jvD5MXQu?=
 =?us-ascii?Q?vmOEF2lqHCifCWMHpGnOrGF4ID2QDSQ4MMFKg29xhmB3iOYnHWE0M5wbuq2e?=
 =?us-ascii?Q?b+V6S2LNPdyOdxRg8iYWzXdZ2ffbTJ7YdMRiTVjQzDX2R6em/OWt+KtHnxYG?=
 =?us-ascii?Q?S16UiIZVjv4gpc/F1RjnrOcAZwzobHF84a51xHgu3yHy19qcO8nx+qaaHLhN?=
 =?us-ascii?Q?7wmWJADlwhiseh/oCQzRuGnQdM3nMLiFLn1bDiaSkoxOI05yTOP6bQmHgAGL?=
 =?us-ascii?Q?smQfCag7XTDXFrXbJKVhfs0opbzzIqeQ8TovwFTiDrICVkfbO/3Z+Yny7615?=
 =?us-ascii?Q?YXntyw/chNQnZFTS+78z1gY/TGs7mSW66uxYIdi0t9p0rGfcEnOfOgf2p6GV?=
 =?us-ascii?Q?yiHSebzRCeiyJVrxDaUicMFab2g0PafgZ0Sp3Sz/gQOVnQbvFgtmT6DdnexU?=
 =?us-ascii?Q?vBXGH5ZINndf0wbJNu3eSr/7Uu5zF0cJtceU2Q/GxKzkqYenOfcf80khgPar?=
 =?us-ascii?Q?JGsh52hzovOfQf8qbkCzUl/1cBBa3ioGx67BiDmD5DPnacVFrxRSRb0yyH0x?=
 =?us-ascii?Q?hrZI8HV/IIe8NAlP7FTCZ6nThnNg/CkoP8sY1P25qHnDTjnXu9fBjE/fTOxq?=
 =?us-ascii?Q?/+JHRM5Tcg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cff95eab-0503-4797-b245-08da1bd877dc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 16:29:36.5278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJTAtzQEZqKqyK3bmQk8qnGriHREj1HOM65efpdLwdV+5u9VwMjejdBFOkh1kfUt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1654
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

On Mon, Apr 11, 2022 at 04:13:48PM +0200, Christoph Hellwig wrote:
> Just open code it in the only caller.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c       |  9 +++++----
>  drivers/gpu/drm/i915/gvt/hypercall.h |  1 -
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 16 ----------------
>  drivers/gpu/drm/i915/gvt/mpt.h       | 14 --------------
>  4 files changed, 5 insertions(+), 35 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
