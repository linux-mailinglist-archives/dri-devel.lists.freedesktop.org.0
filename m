Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E56095A01F3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96B2C3649;
	Wed, 24 Aug 2022 19:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0FC10ED32
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 13:11:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHaVe1BeOsGddif1jYbqsx5VIBIv9YsNWwtn2kL/gpYKXh55PEFlLbnjSWCAGssSKVhIp/zASLFfSHjUDJjZ6i/08YSX9KuBQMK8rnAOMlmCZ7qQnAC4XXAblv4rDo8H6fgDEcHlhe7t4G2wtxTjxNZZYVZ7ObAnqpZpqMLsN8WcrM2aOMsOeyYmV8ITfNK0XjxjYm/hKSPrFFhS/6TicpPYRGN97/LM97PnZOC1V8URrCT06tVS5wsF6n9ucZZRihc8C6PMK+7InICWlDYrpVE38DrennjBX8dZxvV+ZZDGYeeVWY9lGXezYVgZ9mO7+k9ajA6Ml66Fm9SkU59y5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mm6haemPaeQXoj6x7SfwnKk1lPYJPeZJqGZnLQ6xNEg=;
 b=NKRjMOE6ZctQ0y8MT14nno1vPrHpD4DToGfiU4Ll7z7TXXJ2rGMbqKQezPVT8P9EHq5lMePfQ2AewSTMcDzd/ZMccahHz9BsmDziz4JGnuFaVMOmB3f3RUACjvwQ1bhpradZa1UE17GXjzm6heyTTEeQFDiUWHKDy9wmn3Qv9VfbcV5NoD1tQXA9+OXVfPWgDIFUO83yjo/ehqTT02KKXpClNxhS1/dZEuZ7170wT9PMR2C/wKI6+o9nl4ysdlOtt+rP5cGxjJk9KpENtIsOKanSZCVBkdSTKLIxrt+Yn45JL6XYcJiVA4PrxvWWo0VimDAq016ZXcvYFBPcVaEEqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mm6haemPaeQXoj6x7SfwnKk1lPYJPeZJqGZnLQ6xNEg=;
 b=R5Q5xOH2tPe7v+Tzj43DvxlHtA5SzxVEryNdhxeoUiKdo9zz8BqvN8wAtW09mpJq7rWZtNuworhyIrkp6zHmdEID+aNuxIGsCT9CIto6LzA8ig7U1DfRqOC/wQS6Icuow3Hf+R+58eNPKCGEY8urRfsHfrpXVVji9dUoYc1cXO8EBGfZL5NcwkHNYN6bKCLC55Em1Ck5eepLLranvAohREss2ADkZ/sEg2RCOnS6zKJYx7HyJxImt60jmJFqN6PRT6ckPz1mqKSzBNcvCq4aXyVMChx56M+faUlms3qX62c+avCtfwdJbmy0FMW9SHWhSgEOnHxEatr3MKVawDGY0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM4PR12MB5937.namprd12.prod.outlook.com (2603:10b6:8:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 13:11:45 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%6]) with mapi id 15.20.5525.019; Fri, 19 Aug 2022
 13:11:45 +0000
Date: Fri, 19 Aug 2022 10:11:43 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 0/4] Allow MMIO regions to be exported through dma-buf
Message-ID: <Yv+MD44ET211LMIl@nvidia.com>
References: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
 <921de79a-9cb3-4217-f079-4b23958a16aa@amd.com>
 <Yv4qlOp9n78B8TFb@nvidia.com>
 <d12fdf94-fbef-b981-2eff-660470ceca22@amd.com>
 <Yv47lkz7FG8vhqA5@nvidia.com>
 <23cb08e4-6de8-8ff4-b569-c93533bf0e19@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23cb08e4-6de8-8ff4-b569-c93533bf0e19@amd.com>
X-ClientProxiedBy: MN2PR19CA0001.namprd19.prod.outlook.com
 (2603:10b6:208:178::14) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d67048c-581c-47ae-1575-08da81e45d7e
X-MS-TrafficTypeDiagnostic: DM4PR12MB5937:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z0P9BGtKtkrAyn6HBZso/mVCa4j6ytlB9C4BNT/b1YBLi+ClifYleQaRqjqlgotc3J//T8A9COlUCW76kEp1I5onZ7dP3VgYhVl2ZzgluOBHpio5O6kYx3bJOzwIxnBhKzVC8yhJKSwb4O84M91hW2xWCe5YLx9btIUOp4TXnVJqvYLeesNd9E4FehS1j3krulvyrBIe5DkGx2N2Cf8+avbvwZsR674nlIQnFzeIJKyFpwEUf0l6qOGD4G3xSPZpe8ap83RBnYDj3rlk9ZnsrDkXgo/JCKKuJyWlEh7DTZk2WNTpAXKwU8U0IaWLnj6VUAeU0hUwJQY/PQu2fom8geAmaCGXmI7acVi7rnM+R1vhErG4JQN3dw0aF9sja2axx6sOuDZCrrhZdhHPJq++A1oWLXOWQH2s5V4KvnMNkyFF15uubcuWSTW5qSz4nVVa8wYkaQDUSogcwINj/3Rf/0b5B8mBbOZQZD0S4ak61BdK+cMgPf2DI3mKXWO9l/FcMVAV8o2Aox87ElDurZvqmZp/15rw2ovpGgumShhDaqhDd/iGj7ynmMfSLoqyJkKSkR5w+JcdLQ5JtOGphU9+f6o9Swn0aBCGwmobG2JRW/t+ABdpvFxCji3X5jOdEaLWWKod61as79dftaoljT+9dm263ZHGfSCXd7Iar8h+jT+rSiWRfygDhFg1/F2ToLbWYi2Sb4YyoRwdGWCt3+12Xe4rN0g6Kw1QAmcuO7iA2fHdI8MxYLEk+Lg+ahKf1CgU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(41300700001)(6486002)(66574015)(478600001)(2616005)(186003)(83380400001)(7416002)(6512007)(26005)(6506007)(5660300002)(66476007)(8936002)(4326008)(8676002)(2906002)(38100700002)(36756003)(6916009)(54906003)(66556008)(66946007)(86362001)(316002)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm9GUW5Ma3NHenJnbUI0Ni8vMDlnN1haUG84c0NMN0lSVzRYdWVXcE4vRkdz?=
 =?utf-8?B?M3FNQVJvOG9oLzZaZkc0LzEvWlNTV0U2T2ZaUUhLU3NKczhIaFFTTVhkWGxG?=
 =?utf-8?B?K1ljaFJNTW9vNnNUaEFiNHpvQlpnV0NTcTFNR3dyWXdhSmdRVWhUQ0pCSVFB?=
 =?utf-8?B?clVrTFZTOG1lZzBod1EwWHpZVkk3dG5UaWExZlpCSWlmNzRaUEg5bDZMSGpS?=
 =?utf-8?B?ZWtOeXl4UFVrS2J4aml0eCtIOEYwV1F2enl2R0VWUW44eFNycFdEUVk0a1Bo?=
 =?utf-8?B?NkFLUVdWM1JKb0dVSUp4NktFRUtpMHNUWm1wa3ZtM2daSTBwN1VlMzA3NWtv?=
 =?utf-8?B?VWRiUGI1OHVrVXhvYlFCZTJ3Tys0Y3c3ZDc3OTQyZWE2Q1FwRzAvQ1A1MUV6?=
 =?utf-8?B?NllMcWtCMStkNDNWdHhxUzVER2VGK1pnUzdiS0dUQkZYbFlNcjA0Z1pxTkd4?=
 =?utf-8?B?RU4yeEwxdmUxZnoyaWpVaWZzckt6aUhQTUlwQnR3d0xWS3kzMmlLcVZ3UStY?=
 =?utf-8?B?czAxUkhjQzR4MHNnc0h1emp1Z1RGZ3k3TDlTUzU0RHF6TE95Z2s3d04zQkZr?=
 =?utf-8?B?MjZTOGlXUDJ5bUJ5cm5XOUpwMEY0aWVuOEtLVWRvK1BRZk1hRzl5N0F3bk1H?=
 =?utf-8?B?UU9kYUVYTmJJcElPeVN6M0FqNnc1QVJoYzAxOUVLOHZDZFBwNmdYZWRSMG80?=
 =?utf-8?B?NldESUM3cWd2YWE4RGNxTUtEcC90K3pWYXUySkpMdUo5MC9VU3Ywdm55UWdk?=
 =?utf-8?B?S3JublUrYlBwK2hGekNNQXg2ZFpURnFhY1ZiVlVWVTliWFh3ZmF4UjE4UkRC?=
 =?utf-8?B?N1VjM29VeWZ0OGltcW8wdVJwSDdQMEhidnBRT3lGZjI5N083K0VpQUkzVVdI?=
 =?utf-8?B?RlNVK2had2ZrOWMrQWIyTzhwSHhPN1FBM2NzOUhBb1daL3dGTkYweGIvL0RP?=
 =?utf-8?B?UzI2aWYvcXJYWnhObTkyVTk0VFhTSVZTWE5RSGdzamxGZXRoQW9MeW5lVFla?=
 =?utf-8?B?eloxdExXWnBpZXRyQ3g2VjN5akRCdFFiRmZYU2lVdGdLQUllY1ZzOEs5SktB?=
 =?utf-8?B?bXZlcm02TDhwYnlxYjduU1RsZ2E0NTVDL0ZDZlRHRlBhdzJwN3JydDMvcGNT?=
 =?utf-8?B?STlnWGt4NFFwUTZpRUJYQ2Q2UDFqZkdFYTVidmxyTHcrWElvNW9EbjYvK2xS?=
 =?utf-8?B?SHhNZW8wZFRqZy9LY25rMWJHOHFnSmx1a1VBckpjM1gvNXFZZnFydGtETDc2?=
 =?utf-8?B?ZXYxclRLRlJTTGE3Zm9aV3Jacks4STRsTlBFNGFtRnJzak4yQkRSb0dBQmtB?=
 =?utf-8?B?blNwTVpVUmkvekdxQllmN3VyWnY0LzRQNVRMR3diajJqaGRoRnhwcVJta0RQ?=
 =?utf-8?B?MDl1NktQR2JrMGdFT2xiRjBGVlMybG91aWMyYWJONlFmNkYvVHZZa0R4YWZB?=
 =?utf-8?B?RFNVcmZVb2dRVC9sT0dYUWYzaTM5TVZpcjVXdzNXRkxaL2dCQlBKY09UVlRB?=
 =?utf-8?B?YWJjMkdndXpFNG5rM3EzRkFNclRYUnNFUWFHdWtDcXN0Vm9MU29XaWprdEMy?=
 =?utf-8?B?L3NvSWtlOWNldXJTV25jZW9JS3p1WnYrRFZ0c2pab1kxMHVVTmxhL2pPYnBJ?=
 =?utf-8?B?NzBXOFhTeE8vS29SZXFBUjhSSU5hNmFLSDVxb2M0ZXVVVjFLQnllT01GdGNs?=
 =?utf-8?B?bDFUYTNmaXZrV0I4OCtHTkhmZng2QXFVclQ2RTNZV2YrVHBtMFlFempWM2Q1?=
 =?utf-8?B?MXNkUUMvTkdOR2FNTHN1UW9jRHl3ZkQrK25WL21CbS9VQ28yRnl5enhCU2pU?=
 =?utf-8?B?Y2x5UG4yNlN2Yy8rVFIwSGVIMisvakFRQ2F5RUlKTVFsWi9sUFEyVnJUNlBS?=
 =?utf-8?B?OTFzZGIwUm1XVWVYcWF4UDNpWHVnVVMvRWFQdEJXUjlDUWd5OWdsZlIrd244?=
 =?utf-8?B?NDhZbGJtQXFJNDVPTW0vb0RXMkZueGxXM1JTL1VUK3FXd25FNXVUUi9sb21i?=
 =?utf-8?B?TGF6Q2NXL0x6RytzOTgxTXNLakJoU0hOZmwyN0d1SFdpNjZNVERlKzB2YWJh?=
 =?utf-8?B?ZUw0VWY3NEtHOXRwSGRqd1d6TnFBeE9oS0l2TGZDQTdtVkt6QlZyZW82blFW?=
 =?utf-8?Q?OFihAYhKcvWf9nDWXtBnAbTYD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d67048c-581c-47ae-1575-08da81e45d7e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 13:11:44.9609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /DaQ1rrQYUBesKqiUZf+SUS2tq97XzGev/lUcqJLbOB4Et8V3h12J7DU3hpMpg0n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5937
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
Cc: Leon Romanovsky <leon@kernel.org>, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Alex Williamson <alex.williamson@redhat.com>, Maor Gottlieb <maorg@nvidia.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 18, 2022 at 03:37:01PM +0200, Christian König wrote:
> Am 18.08.22 um 15:16 schrieb Jason Gunthorpe:
> > On Thu, Aug 18, 2022 at 02:58:10PM +0200, Christian König wrote:
> > 
> > > > > The only thing I'm not 100% convinced of is dma_buf_try_get(), I've seen
> > > > > this incorrectly used so many times that I can't count them any more.
> > > > > 
> > > > > Would that be somehow avoidable? Or could you at least explain the use case
> > > > > a bit better.
> > > > I didn't see a way, maybe you know of one
> > > For GEM objects we usually don't use the reference count of the DMA-buf, but
> > > rather that of the GEM object for this. But that's not an ideal solution
> > > either.
> > You can't really ignore the dmabuf refcount. At some point you have to
> > deal with the dmabuf being asynchronously released by userspace.
> 
> Yeah, but in this case the dma-buf is just a reference to the real/private
> object which holds the backing store.

The gem approach is backwards to what I did here.

GEM holds a singleton pointer to the dmabuf and holds a reference on
it as long as it has the pointer. This means the dmabuf can not be
freed until the GEM object is freed.

For this I held a "weak reference" on the dmabuf in a list, and we
convert the weak reference to a strong reference in the usual way
using a try_get.

The reason it is different is because the VFIO interface allows
creating a DMABUF with unique parameters on every user request. Eg the
user can select a BAR index and a slice of the MMIO space unique to
each each request and this results in a unique DMABUF.

Due to this we have to store a list of DMABUFs and we need the
DMABUF's to clean up their memory when the user closes the file.

> > So we could delete the try_buf and just rely on move being safe on
> > partially destroyed dma_buf's as part of the API design.
> 
> I think that might be the more defensive approach. A comment on the
> dma_buf_move_notify() function should probably be a good idea.

IMHO, it is an anti-pattern. The caller should hold a strong reference
on an object before invoking any API surface. Upgrading a weak
reference to a strong reference requires the standard "try get" API.

But if you feel strongly I don't mind dropping the try_get around move.

Jason
