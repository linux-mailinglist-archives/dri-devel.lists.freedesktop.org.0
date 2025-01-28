Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA49A20273
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 01:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D725B10E5DA;
	Tue, 28 Jan 2025 00:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="P4HhRzlW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667D810E095;
 Tue, 28 Jan 2025 00:13:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+CKS/QoRTgKRRwMbU6Pu7HUCeVav3vPQ5W3oqTd0P+BhaBMHkJ9wYbqY+VNpjOOzlJrGzY0xgv0WnJ7sgELzf8Sg94vcn2Y8iF7EpY/5MddDJ64IumSkG45zz6R1M9R89xWQtb7XcYW7hdWEfk4LzOI6nVCJzlTr26MmOoCPKB1uQWJ0s9V5HD2lXRpsjCZj7UHugrh8w0WBKvcnWDkBayeNZw+SfxjLWgXSfb8zT0C8Ze5bWK1tu4lvlvQANvFFVTMLmcCShMFHoHEtu9ao4bo1m78yFKQ0pQWH34FvlC+ON9LnGCV5g3hNH8CW5Wtw18un/r+bidRej5XTB/ohA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzgsqihxoh+/6ryP4RQNybx0hBTm68O0L5ehyFyBsm8=;
 b=mAYFt9NdgX47qfxlioFYQf1MpWSgbXTLxeLJ5q+ukdCOuaUme4CNVQtQJU32OHR1W7WnEA0gXH2+8C+9gZhemPmDHNdo0yD7lLjqSH4hvLvq0+3Rkh6Q1O4jybQVYARATbLxHRfedBu0yeuIyxAxuOOhODwGB3lnJH6snrlnpUwf6L89SGzKrOPDwF0TqcWQRoAh353OiEv7EjD3Y5hGfJUWjff83BSIlDEVMdHP2bLq2sAmFcpgzA7iHplyi5HofTLtt2O1YQayxKQo9WcOxuN/UiFERV9UlYbHeXJmHWpG/Mp54aHGQQSGeA8zyuwIVfFV50R3XyaGLNbh+eHQ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzgsqihxoh+/6ryP4RQNybx0hBTm68O0L5ehyFyBsm8=;
 b=P4HhRzlWToBcunfbioHUKUao4nOhKhv5dDeS/uyZFNaErEcinVfgZbre2CyQjhKqt4QXaHLItRPls563q9OseS0vvyw5kEB7LXdPUhwiJi1BYiZJ96pHN9SgcYxzhtXCZPeunV7gXENtbApoE+Jku+CWC+m2aGp2a0KSOx1zNMsaZ6Va4zErkSifxrZufM00VosDDBrF0+XPgNSq5qgKoJwNbipkCDLuM9sOsbT2VyOwf/3GhSVcnXHVNiIEgyjLCcnzDUmlynsSSxdIz9NHpzsRnbiWcBdV6yZvpMrSLSWEI0uWCOhcJ6bML/r9K3HUoxWhu9RJi9FL5fxRVzL5WQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB8221.namprd12.prod.outlook.com (2603:10b6:208:3f0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 00:13:14 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8377.009; Tue, 28 Jan 2025
 00:13:14 +0000
Date: Tue, 28 Jan 2025 11:13:03 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v1 0/2] nouveau/svm: fix + cleanup for
 nouveau_atomic_range_fault()
Message-ID: <76jkxgubetbevbwbgq6onjwl4pu32bq3nrqmtj5zt23kkdculn@ez6bpprj2uan>
References: <20250124181524.3584236-1-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124181524.3584236-1-david@redhat.com>
X-ClientProxiedBy: SY0PR01CA0005.ausprd01.prod.outlook.com
 (2603:10c6:10:1bb::16) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB8221:EE_
X-MS-Office365-Filtering-Correlation-Id: f06f87c1-052f-4fd3-d050-08dd3f308e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+cly44Ov01smhERDeWaT0QQPSczAJ5fHwON5+2GwpYAIyTsmQap53RukEi9g?=
 =?us-ascii?Q?9oUE6XKVC/5jDuRAxzsd0Ofiez7QNtB8s8UHDETXrwhwV09MrK79TCks3UcQ?=
 =?us-ascii?Q?GAGKcXLmuwcL0lgGG58tOWYxj6Ndoo64vIJaFIBlLuhClFYDLrVvOReZMbm+?=
 =?us-ascii?Q?+EyfAxTSQmgZUA7/3z6L71lWxjCN/Tg0VklYADOhrRIRmbyO8Cy7oHaPJAnm?=
 =?us-ascii?Q?T+qhq0o9RDW5MwybnyKzvZ9irquxu8hBv/WoNxYvQFWxOpIx2496k2V3RLVb?=
 =?us-ascii?Q?/02L04IAOOkaGbJdH9imRe5RR2NtgXSHKoOctpT49RP59wLFNiHb/mSnDaGs?=
 =?us-ascii?Q?pRyXAjwLqS/WKYZPjILBcT8MkfWQTUDkvE5rCtiOJCXUENIKCIZEgKhSD27w?=
 =?us-ascii?Q?d2kz9o/VPLcA4ufhEetHShsESQhZpjgPGJHLDn+fCB4L2wUUJIgcwlO6O72X?=
 =?us-ascii?Q?7YfSL7a8oSjPnuNp1oxya/BDwMbdZPmZMW5fBjLsn4ThQdX1/OJdCywtXSzc?=
 =?us-ascii?Q?4ju51Sy5RmjPzID1JiMzNuBxYvt7GRibiqGV/YeGhUf5IccyIbeIKEmxkq+T?=
 =?us-ascii?Q?1rsaCKKAgUU1mVqw0rWZ566cXV1YOZRqU11UUKm9dwq32A/OgVkkb8SHVy/G?=
 =?us-ascii?Q?Q6c2HaB5phUZQx5It9sFvxsXFuzPQhUMj6TvodMUtpaAdvq4MQjOmu3EkwCP?=
 =?us-ascii?Q?E1Ud3VuGhGNWAUG58Z+SQjTTf0iNSyGh3F889VfYEhfJz0pyC/IyaZ2sF20h?=
 =?us-ascii?Q?9arTYS6YsBkbiVuE7nvhTVaDM8hyC+91TCASXX8D/uXHQKZO2VQZPa2QM9Aj?=
 =?us-ascii?Q?appqoNH/UlsYuBWL7suarJyQMPUIRvLsX3+X/4UDkjRPOR/6LWoBLvUWUMn2?=
 =?us-ascii?Q?JDxqCnrbqYOlxWo1s4BQitnRo7JsHx5SgjdtoryhOmdu++fl6KF3qcmECbKA?=
 =?us-ascii?Q?e5MsLcp4XAXojTkX399D/ex7VJRTddwB3YtRSWSy7kfubzjqJbO/691MxI0d?=
 =?us-ascii?Q?5JrS6MG0/A1iD3uOJHQBK0rC6tnuqzhJ3owNmYOODshUxrJINZ5SjxNI6l/Q?=
 =?us-ascii?Q?CEm6lth5IaEJ315ZA41OQfT1ozQhdJZziq1ZRMqDWavO6IOY83U6zd9tQNV6?=
 =?us-ascii?Q?fz99d2BchC7Oby8CdrpC03UUhBhpIba1CcdOWgqHPN5I9thr/iCFenOAELsV?=
 =?us-ascii?Q?68aH1HTEdkLqdlRe7N3OFGloOX4Cgf+nsjaCYjC7D5nhHfMXUS37yBkoiUsn?=
 =?us-ascii?Q?xNr69eOz3B17kkvlW3FQxw6p0rnWMf42LedsRlBA/FQGiil0V+CRBLIVibZC?=
 =?us-ascii?Q?mNx4f13erHQY7lWN4ZCZ2QOpaHek4O5Lze2w7jOwXDFqDRe0DvFRr3vzPCr9?=
 =?us-ascii?Q?IKyluTlhFLoygCuV7zYCEicuoPT/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2sk7WsKIw93cV/mAARTqVeB9N8zAK/m6ezlbgc9zYdoulfHjOVnqiPIMr58H?=
 =?us-ascii?Q?kyaL+0f1kUGwRXW0UhpUqwwI3+QhRB70xvyZDeKctV9IMCvjxv4gZqd6Ywdi?=
 =?us-ascii?Q?BAMWdrvFWpFm5LzT/yvDgnaZIgejcAgow5fH+C6vWF+PvF3PECTry79wv/9Q?=
 =?us-ascii?Q?ZuzK2SN9xA0jBTIqUYi4jP93CwWxLBNiIbyCaZV2XY0HFi1X+yqCBtw60n9Q?=
 =?us-ascii?Q?+QSoXt91ZdxZDjPap+s6NriLZ9T+Zrw6ACcQCVja+CvaztUmIDiaRc+xJvPb?=
 =?us-ascii?Q?8P2w5ncF1NEW3YUGOo569xjX1UJLlMbHc13e7WmaFxNF3nygOSH13++MNeQN?=
 =?us-ascii?Q?VcKiQEXe1Wb7Oao+jppgt1s5LctMO0MN9Y4JBeILyTMZM5jRumvDOCy6XrUQ?=
 =?us-ascii?Q?qZ46ecY+YZIm01rSOAsaBxJPAhG1AEPbMPymCNU7eWj2GcYwvv++2JT8nQoU?=
 =?us-ascii?Q?FhcFb91vOiKKOxOHIoMOjQXaSpJkGXDLGvKVo69ocRMN4BIgNTygUHAkrivh?=
 =?us-ascii?Q?F00DaO4mpli2I+jl4TDq9nlJ1eCNQ5bO1NpAk2wgLPImPFbqv9RoGqj8T6S7?=
 =?us-ascii?Q?yRcI/S9FwxgzP43TAnM5nckCJ7OuxnyWuJiGkdsIGvi7NWNMlivE431tzNNf?=
 =?us-ascii?Q?p8ksPkvy/aChG582bu6z1OkjN36NMN1zSApSKA8UkbNxDiHvtX7wfNCWSKhk?=
 =?us-ascii?Q?zKGHXF93w38XIQB/Z/FLSfDx+v49vl6oK7xm2RlmMHixnuc/V7CxNDT+ULWp?=
 =?us-ascii?Q?9uqkQCqRytG53QxmSSw9vY8uc9TpHM/1cOOtchqINoFJJYA1mTn9G7iZd7C/?=
 =?us-ascii?Q?lafH1uSXMR/g/00O6cXpMRTS3nsdBzEtuZ2mrqmSPgEzswZxgnxxOltDLUbv?=
 =?us-ascii?Q?F5bAhoSTEfOJaa3Y1WriifwUBkyNmlBGfs0dY2HxiXN7/Wqjg8tVlEwFP2mP?=
 =?us-ascii?Q?Bo0s5hFl0nm0Mg6tVpnv3B6W7+hwGZJGEo8IyA24uB/p6YJRdvg3DkZAfWCm?=
 =?us-ascii?Q?/k6Jik9i8lgNzY8CkQAbV3S1TwPlupKdf3vmC1uGK/frV3TMkCEYrLvKECj+?=
 =?us-ascii?Q?24D44agqBin/Vw62yfz/NJAIuMMCYr6BhqcyjxgMg0k0M21KuoQfCSzxUW8v?=
 =?us-ascii?Q?xPxm63C53AbC7RlntCUYyLP9UDycZi9fry9Ff0hVHqhryv+Pj3SZNennVfPV?=
 =?us-ascii?Q?kiXIffjxJ9s5bMCuJTkjetNqs0xbCwum37EeJ9AAW4MljL0imJGoX2nDfCQC?=
 =?us-ascii?Q?zFU+bPkGGmQ7QcTRSJp+Bmwv/OobcpkVI0XcBOelwe3D1WqTwKKd3vHMLzic?=
 =?us-ascii?Q?OXYC9ioZV/lK2RM6QYlJnV1OTPtsfYKJ4jDyTpvpJkIy+JF2cOcK1qQWdMu9?=
 =?us-ascii?Q?VIY7agB9Jlh+jpOpQAuOagBixT6SD6i5xLffgKV0tx/WPeDueFNh6ZNHy0W4?=
 =?us-ascii?Q?xsZWrVAoEOLiuvARZ9F2gLbm35P1fGXSg7j7eFDzG7U8PY98SuK9f8bx+FMk?=
 =?us-ascii?Q?PjHux2AtjlSBh+/Kqr3ymHB3vrk0G6TfSGJTu63xRQIvT1SChvpc3+2BUazl?=
 =?us-ascii?Q?kHFONBKXrgcz+5oUqtysIANZKV3fQjdAzkbUAUlH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f06f87c1-052f-4fd3-d050-08dd3f308e93
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 00:13:14.1022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/UacTUU5IUQY/ov8F6IAxQNWhlgSX2L9iMbvy+4OVda9rajUVz6+QBOYY9BdV4MesaLq9e1zgCo1uXK5hoFhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8221
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

On Fri, Jan 24, 2025 at 07:15:22PM +0100, David Hildenbrand wrote:
> One fix and a minor cleanup.
> 
> Only compile-tested due to lack of HW, so I'd be happy if someone with
> access to HW could test. But not sure how easy this is to trigger. Likely
> some concurrent MADV_DONTNEED on the PTE we just converted might be able
> to trigger it.

I have this setup so will certainly test it and see if I can trigger the bug
as well. Thanks for the fixes.
 
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Alistair Popple <apopple@nvidia.com>
> 
> David Hildenbrand (2):
>   nouveau/svm: fix missing folio unlock + put after
>     make_device_exclusive_range()
>   nouveau/svm: don't initialize ret in nouveau_atomic_range_fault()
> 
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> -- 
> 2.47.1
> 
