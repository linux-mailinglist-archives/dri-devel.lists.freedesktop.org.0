Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101D443E90E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 21:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807CB6E0EE;
	Thu, 28 Oct 2021 19:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153026E0EE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 19:43:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlLEqCe5BF2jyKjEbeSsjJObEBla+24PidIa/TG16h4zjfQmBlSQl/Kdq6Haq7H9PsYOLp6sGBr8ZCuUP7azx7k9ja7qaeSOorrOx7QfghhOR7xqgkC0VC12Iwvj9cLEL/k4w8wbATr7eCREN0cjmNIPGNJE1Ql1Oms/Mi80lBe1WuIf9jaV3NezPv+09a4IhcLa7PPg3SKKeaBFYgl3R+TSclHypTiXauOPZCXIvzjBSDRos3BoqRlO/RH7ZBYrZefZCwsR5GgUxjxqmw21Zpsi56yT6xd9jWGkAU7X+5A6iIbwZmUFkFRMFtpwzGZTjU/+NEjC1qdSU6n+CmHaxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJpR0VoHrjzQjpt5Tba/YzRw4asV+8SQ/2KKN1NkgAc=;
 b=WKPejzE39C/7dbJTGUlt68Jqw3kU8sGABCzRq3DA4ZuIOUcQ7jSqFeuL4KYUyDMsXv6pflkqfSmGPljbcFbJ5Md6DZT1qE7K/KflVr9/r0EM+KoMzWzDEGUTUqKzDO1wc03DaDp7Fg6FGmxlx+10FsmdKPIOpvadCY1k0vz1MrF63Spd2X6o7nY1/fzE3UN2PFnJinJUF89uRYODB6E7DNPmAfc562ltwig2bjHRqzwxAeS12Ni9lvexTJRmaqJk+i2hXGH7iv+Ih94j8s8e3fdAFmEFcnypisVjhNDMiDKggo811kVhaLBDi2Y+zpzJbC1DEthuSmGsjFjwZkXtIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJpR0VoHrjzQjpt5Tba/YzRw4asV+8SQ/2KKN1NkgAc=;
 b=k8Rq+XG1Kbb1QOQCEFuBcrp/vrvTbQL6/7Wm8/kdQM2rH1AHmCKFOlZr1+9G9tdejihZ0JSOTBepDAPy6gvI9rgwzqS7rmCmgQhUp9Sgumyxs+xJpAOpZlkfNUt2FtjFyZ7To/lB1xZIsyV6JrND+fP3e2vQcw4uyXa2pa7Z8AlXiKQYYCgQOA8XXZr13NFMzu9ETxV+IZG+EIy57JDSLbchDG3G0YUdPejOSH+/N7onaabJxVtqBdbGhVN7vZlw8e9AJZwfw41IcuZIHvYDHO1VJBjdJtAO9if6ueTrhe7XgQto+8YIXLq2ZcTfnavNbM7VDEXx5jZjbQx9m1OaKw==
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 28 Oct
 2021 19:42:59 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 19:42:59 +0000
Date: Thu, 28 Oct 2021 16:42:56 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Dan Williams <dan.j.williams@intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>
Subject: Re: [PATCH v2] drm/ttm: Do not put non-struct page memory into
 PUD/PMDs
Message-ID: <20211028194256.GN2744544@nvidia.com>
References: <0-v2-a44694790652+4ac-ttm_pmd_jgg@nvidia.com>
 <47182e81-39f2-1143-7654-fb31d171e4f3@linux.intel.com>
 <e88f42a3-7f04-25d9-5274-24a700df689f@amd.com>
 <20211020193702.GJ2744544@nvidia.com>
 <YXFR85joqUODJyy/@phenom.ffwll.local>
 <20211022185742.GO2744544@nvidia.com>
 <YXq+bELDrDiB2VPm@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXq+bELDrDiB2VPm@phenom.ffwll.local>
X-ClientProxiedBy: BYAPR11CA0074.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::15) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (206.223.160.26) by
 BYAPR11CA0074.namprd11.prod.outlook.com (2603:10b6:a03:f4::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.22 via Frontend Transport; Thu, 28 Oct 2021 19:42:59 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mgBIe-0038UK-R5; Thu, 28 Oct 2021 16:42:56 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86ece10e-e7c7-4806-1b5b-08d99a4b2574
X-MS-TrafficTypeDiagnostic: BL1PR12MB5112:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5112469C3B40B757B346584DC2869@BL1PR12MB5112.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8uW6VRnpNs1ZN+uKvgNYzP1f8WddkYk+C3k5gd6zkCoN2ooVrASzYnagILo17wxADdYluYowINCx8sSlC9qRdeWwEGh7VA938QPDwVMsEnCCVXDxAhhOkglMa7d3udOWibWn0XRayM9TD1Hv5c/UjeAIL76O9+DTu2GINl5DFZ03YxjcIsrDDn3g5ZKUz74z4sUIn3mQSjJjmGsVq/T38bR0C2XYyPcxsI32/02E+Qk3eZnvUEz4fB+8ESLgqC5jcvdfd+JraNeZrqQQYEGNZB53AfQQqmcPlp2pU88CI36Zs5erHLqBTU9Yapi73nTwK4vqwySVFGucVJOplh+l4Q1Wmw8odVJUzdC4uEfh9NGezxwUn5nNxflnZPgh7h9wwpEsbj6bDdu7gj14sxldRTa/4iFPPlqqpubdD0YUdb/nNjyjpcUMTWNQTY61vCisqEwfyS84OgqXVvVJ+yd6H+xnDTWW7k6eCUFxzSM51n0utTw2QAb+dESzXAWQVg+naKHT/ObFPvI/MRwVLh3I8bcP87quKUICEju7vM31y6MawpsI78ieVT1uYxsrMqv+ReAoH03V3M94IjUbwwXRbLaqVtvfvWGBELnzTO32bQm8c3ogencAHVQdDRvgWuOz8L1Pd8nfGq11iKgg/GJwgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(66946007)(508600001)(186003)(8676002)(26005)(4326008)(9746002)(54906003)(426003)(66476007)(6916009)(36756003)(66556008)(558084003)(38100700002)(5660300002)(83380400001)(1076003)(316002)(9786002)(33656002)(8936002)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tkR0xmy9oQSTzWNL7Hlqq4iAwaTgL32A5QjK37UJPPBEpzRt7h6sxv6nuz0o?=
 =?us-ascii?Q?6yOEEIRtx8+WonvEzlFYewAUi5hDKxaYd8QkXCj9EhkADgKqopDplgPrJuWE?=
 =?us-ascii?Q?ykAFZvMqz3x+FIJF9LGC6lj9WmQyk5LUnP+YwM91obupbm/bn6N25loki14d?=
 =?us-ascii?Q?RabaD/tFhwTbCRKVtSX6pXFZ58EiJDXmnSv6IN5Z+W0hVGzfHeXAVGDEfh80?=
 =?us-ascii?Q?5x6GHMlCqGNQogjXXuQUlQlk5Bj04nsoO1tN5yMUOYjZdTR3RFeu9rFUSwh1?=
 =?us-ascii?Q?gST1B6rR48vPYOorzbfI4mkxmchDCSZdLifV/Yv5gSybokQyvpRoERl8fDom?=
 =?us-ascii?Q?zWmk5++FvRaZHAfey+UmXexFrANzo6TFUlwvU3d8Rl9tuy/KW6w+kZqI9rsQ?=
 =?us-ascii?Q?1dskNxxwwAihlvIQgMQJNpX8fCNwbZTmRCyyJOGgsUNuM5znH1quDsSzwSOz?=
 =?us-ascii?Q?xwZxU5Po46/4sNIt/BlI2k9siqQeLaWMMTmD7aV8lwER096rGYDMAjvz1Hz+?=
 =?us-ascii?Q?d7HbWQ3IfTb7YAUeDwVIjvdpWElnad0OVIP9vH0Hnl0qzgukasxHIn0aryvm?=
 =?us-ascii?Q?PdQ4WfW206SoyEJUiC73+/Y6s08YWFobvtkpf2zxSM9hJ2yFRCW3OJuhZKlG?=
 =?us-ascii?Q?C1gNHuwIMtzjb7/GAgHXfYQukU9r/1R+vaC9s+JUPX5td68ryK4xohaRMnEj?=
 =?us-ascii?Q?6/bt1I6JnGFBbg+px9UAzR/mVmDMhfaDLUXQphdE8udPQEEGoWObTGuds0M0?=
 =?us-ascii?Q?ZvRT/6b8Hgvi+LpJU9F8Nrx2l9EJ8l4vyuoeneTLRoSLhf7OWT/xcPLpEVAk?=
 =?us-ascii?Q?wBhwIx9LJ9Jm7vuTzAo9EpWFPV9SeX5grBHaZORD6GTPSaoukwMPg7yuMC6D?=
 =?us-ascii?Q?DElAIsthlJE5LEtoMdRYB9U/iKE7PV4ltLJMh5p7SdwYMXAWDkWsAEGyc/dy?=
 =?us-ascii?Q?JxyOr34Fdla/LKlSI/YIjj3+7H+uiUFthiHy/JreujEi2jzzEsYzlvGS4Zm6?=
 =?us-ascii?Q?1H+tRzc+yf20e9EUqg/3HEqQsfUEcaSMh4HdUw5TdpSTV3EE67TJpi7HUecl?=
 =?us-ascii?Q?oDB+5inHQdfrUyJC0YEB5QaQg4jxQxCzxQjgdxpV+Her1IW3BFKadYDA6Huy?=
 =?us-ascii?Q?tE5u+QoCs5ol8FKugGCcj2qF7Gipi938mnmBQcW3l606e+7Nl9jRLcB9hU5a?=
 =?us-ascii?Q?cG2AfEHywfwr86M0R6nOqXiRYcl4TOtXfVQCapXJniFdlaaq16V4iDYD3/tn?=
 =?us-ascii?Q?V2Y3mQxGNbIG6fWp2DXiLDpqIpi5mnp3jbmVgBrR3o3t6Zqzxw970OY7qTNB?=
 =?us-ascii?Q?5HQCEVuZ/3C86Y8X3ojiAaQfExrKww8Sv+mewtHqablyF26VBkmF9zX3fB9g?=
 =?us-ascii?Q?AnUQMFrbgvAauNjJdg6+PY6SGskYVd8ersBgloLrLf98PUdVSAIm8ZtCdR2J?=
 =?us-ascii?Q?X9r3HrWcuCH9iu1yjKvmy5+pjgXCZe1TC8UMjXLQ0RDzGD+Xf+kThqcInFgN?=
 =?us-ascii?Q?V4rhiy4l1d4BKnx2jTiDRAc9g2gnHdYdBtBNca0o0sw3rJj8rbutxnET5Jf1?=
 =?us-ascii?Q?gVfbwHNrF22y4lrKAlA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ece10e-e7c7-4806-1b5b-08d99a4b2574
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 19:42:59.2570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCmxq3GVh75fGVgWoNOQNgRt+eCC5DGujykloh/g78iiRBSaTr84cj9XYWGY4E8+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5112
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 28, 2021 at 05:14:52PM +0200, Daniel Vetter wrote:
> Hm totally lost this, I'm trying to not be too responsible for mm changes
> since it scares me :-) Plus dropping this very late in the release feels a
> bit risky.
> 
> Ok if I stuff this into drm-next instead?

Sure

Jason
