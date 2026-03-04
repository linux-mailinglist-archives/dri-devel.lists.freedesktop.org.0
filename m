Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKvSI0qdp2nTigAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 03:47:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F27B1F9FDD
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 03:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E704210E0D3;
	Wed,  4 Mar 2026 02:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YAXR8UQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010060.outbound.protection.outlook.com [52.101.56.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C3F10E0D3;
 Wed,  4 Mar 2026 02:47:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPvHXPidilzGAxYKBSPDO2YLA1vRtCY6A7Q931dMVLAI7AyxxkDqCI1HGLV8uqkbkN906rW47hoHIB6qySbhOKX6Pb38pTLk8jNWpZNlyT9bc9buiwW0Y3mtO0gEbs9rBgyXHYMKswhsgUIf5Vs+aSqAIOdprTpEnmFLRxpvuIQrGYpEU1IIhZNs1FSSAG5TEr7VsVv3HM+tyx/J7b2CQx4nUQ0U443dz8cIP0+UOQipLBPnoNg3vm5G1XqDPnIWiFNXjwVX6gbes+Myt45ALYTHrC3ehAdMqAoa8ynMrMGZ8/GrB6LrsO/TJQqJW43lKRXSwBL6iuD1ybF/h4Dz5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2p9EjnIDnSpXEsffBntrWLbKuw34ihyG6D+7/TtmhhM=;
 b=tTZwaXbJ+dpLV3iocF6v5KmaFh6tKm0VEX3EzABy/KAVn3FARu5HFGBUtCDhE8lbodkG3AbZnIH3qmGWWZ01+rBTnXLQxeY5fIXmX29d+Ucgkd1J3y/Gv9DLo5lVY0miLPo8Gq1uBQPZhAk7WcpKipwLW450XQXRfYVEd9ccC2sFDjVEChR596Y0HiCRIlCB6cwzW9uGQ9l0pKsKRt5zDopJaXbMU7XnoiWuaoEBJ7j6nJI42ywW+cp0gtofsB2z7oeoA6Jn8dxWsPJoI7XzMxJJq7M4X80irecP+LioRRXoo2iipLF5MOC2UQRKyBZvb0Zrv7UUmuLY2bBkLAGaew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2p9EjnIDnSpXEsffBntrWLbKuw34ihyG6D+7/TtmhhM=;
 b=YAXR8UQV9yLrucqhyHWIaZLXyFLTbMajH2XZ4hZbwE2Pa/DqTCuTAGLMMgt/9Xw2HzGtplDnokntMcIiZLz2ZwJmhLKDPvO7VB1KZCzPDlVy72pz1vvNzps/Q1dkJXKoUk96vaoh1k+LRsEJ8SirYC47owVtth20C51anzYu7uSxDfgV8lW1zlmK9qSayCDp1QvSP21AGERjrJNKoHIF3MXdP7URy7bExEfaJ0N7BYK1EqGzTgIm+PQVIToKJVSCHuneyoABE/K10upZBHzPuaQtwIaoneqbJLsM9dRB7y74yl3uRDMKvmdmybBVni/02eDSblJqUGfIhKinaPeiIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH1PR12MB9574.namprd12.prod.outlook.com (2603:10b6:610:2ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Wed, 4 Mar
 2026 02:47:13 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 02:47:13 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH v3 0/5] gpu: nova-core: gsp: add locking to Cmdq
Date: Wed, 04 Mar 2026 11:46:35 +0900
Message-Id: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22PzU7EIBRGX6VhLQYuP4XGGN/DuKBwO0O01Ckdo
 pn03WWYzWhcfiTncO6FZFwjZjJ0F7JiiTkuqQ7x0BF/dOmANIa6CTDQDEBRP4cT/Vj8e0wHGgR
 YMA48+IlU5HPFKX413evbba94Olfrdnsko8tI/TLPcRs66aSdEAQK1Y/SGKlQ8Amtr07DwDMll
 eHWXNUz5uxaztA9tRrB5K3GL2mL6ey22k6LooyKidvQK4vBipdUYojusX76TK5Rx5i3Zf1uJxf
 eqv6/rvCqGsdJj5Ir3TN9p2qmAve0/kNDpX2PXDsdlDHqF73v+w8Hj9QVfAEAAA==
X-Change-ID: 20260225-cmdq-locking-d32928a2c2cf
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0089.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::10) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH1PR12MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: 0216249e-cc99-4c58-a758-08de799856c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: 4Db9UM76R+iRAxy/SxQujhNz4dYKfHf2MSRhfRDcCxpxuLA79ALDelOxOX9t0zYXn4Z7Bvn3AeKkiH0YXWol9lZE9e/JzWQVhqlQT1p71j5EPmxCgYS3KWOM9WPRyA+Q8EBEt8TqdvUxSrjQAmPfB4lN6DdMOhrYNDmC/6OWr0cpiqRMV+M2HkuwpwG/PW7DAGspW0m7UWxFVMLdq+R3o4jgxXP0SP0E7XUTFvRtF5NVDJwn2tNgWPfWqQKV7lVjg551YMXLEctdMOWMRVzck9GgFwtDHzn12ar1QZe5gbhCzNWHXKBRJUIYOy+34kLddlhN+dLN1OCcz+XQSoGATbINfMB0ZH+jGDSJoX5/vOgcgCOt+YSGJZm1C8/z9Md0gPn8/HoJ7EsJOReSzT1DCymnDzp7yPSjj5Sezcx262v3ygPQRs0TvtVq03M2PghfEuKUCGxC37gViM8AANBmbyhg1VHsq09vS+BkDLENPU//tHoY+nGNINJxFgkumoj13E7NM3+WK1zrnFPDxcfpz0GMrnXybJac5zz2KMNS65rz+GevmG31dKpbPbuwQq/ozlopZpobSaXLR60WoBJl9Y+7/o0i6DZ4YYCNTlcjAPyvrMXohsXpbBbK2J7hwBeT0YDdddAH5YdPmvUww9AiPXygLSmuNP8ozOIGZ3EbqS9fJZoGvuJOajf5Ot+Q0eEUhd6YCiqPmxiuMNfOIVib3FIZvcVacTINgvBf5b8vgCc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzNUU3phS0FLTFRSenJhVkN3a0dXVk9XM0o1cGt1OGIzVHVmNy81aTZySEpr?=
 =?utf-8?B?ODJkOFk0aXptNnkyYlZRU3NKTUgxMEUvdmNYY1AwSURpM2VsSkI5VlRBYUhY?=
 =?utf-8?B?SHdsNFhJQmVsN2Zub1gxYllrZjVYVUFTcjNGa2ZySkZZdXNvR001SFdiQi9s?=
 =?utf-8?B?S0l3RmtERUxqeVNuZ0lMVWNqUFl6T2QzUzRhSTZBbGd0VHpEbWxZNGpta1V5?=
 =?utf-8?B?cC90amRzRFN5OURtWXNJamdTdklqNTMzQzZydnM4VzlxTlhkUUZFU3F4aUMz?=
 =?utf-8?B?cklGMi9aenZydlEzbkNHTzl2V21jWkxiajlSNU5yRkpSSDduSjcrM3JPZ1Vv?=
 =?utf-8?B?VHMvWTczaUpibjF3MGpqVFJ0LzA2NnJ6a2RjSHY2SFI2bFYyKzk2S2NtWStp?=
 =?utf-8?B?WlNnSFNoME12VTBmM1YzSnM4a2lGalNEOG4zZVQzTTZjV0JJRmFCY21jTXA2?=
 =?utf-8?B?K1grODNRVDk1Zk4vaVhZWGw2ZmkwMG9DM0RyWGZxRkh0LzBhNzljeXR6Q1lq?=
 =?utf-8?B?STlJRkdObXMrSGNnR0F5L2MvVFN3M1pRbGVnamJqNFpwb2JhQ1RvMWUvb1Ir?=
 =?utf-8?B?dWt4UHZwbUEzOENza0ZyRFdzNkVkcWg0RW5pdzJsZ1NiU1NBVUpuZjhPbkxU?=
 =?utf-8?B?bnJjbmhYNmYvdkpKVy9RcTFrK0dhOGk4aEJjYm5LQk9vQzIyU1pKYUIvZklG?=
 =?utf-8?B?citzaGxrbGRNMitWdnhZSG1GZEM1azVyQnFXdHY1SndSci9hZURyOEdCYTRT?=
 =?utf-8?B?QzMwSHRya2sxMnkrTVJyRXllMmdvaHhoaTh2dml1MC9VVDJpR1drZExiRzdS?=
 =?utf-8?B?ekEwdEFFQ1BQcmhFZUd5QTZ6Sk1OSGhrMmUyNlJZS2JETzJQN1ZnQTFhL3di?=
 =?utf-8?B?RFpOemhhM1N3QjN4ZUc4ZFdnbndVd2oxVHZkNWxDbzcwQU5nMVFqNkozekU5?=
 =?utf-8?B?cEt1QUdnUEpkbGJNNVRQa1NLL2xaaE4raEVQeXh4VnliRnhtSFI4Q3R6WS9v?=
 =?utf-8?B?WU9PajluZ1NnOHB4eEZCb2Z2VmR5ZFlqNTZ6NTBobmwvazEwZnpQeWZXYWUz?=
 =?utf-8?B?NGtUaWU3NzhWNWluWlczRXprc3k3V2RpR1piM3hBcHovTnI2NStPNXJHS2N5?=
 =?utf-8?B?QmQ0UWIweVBHR0JGcjdEZ2ZUNjNhWlEydnl0WVNHMktETDJWNWxpSEJMTVVQ?=
 =?utf-8?B?eVJMSGRvRUptd3lSeDh2RzFvSjliazIwYmtwZ1JjK1dRSVYza1E4TFJGcERR?=
 =?utf-8?B?cCtrcHZVLzUyd3h1NkNRTUpsS0MzTlh2N0ZuaTZpaWJRWXFCWkYrdGk5eUEv?=
 =?utf-8?B?WGxCTUxTTms2R1VrNGJFc25ORnVKNW5kSEVERWF1cGZmTWI4YzhzR0VUSUFX?=
 =?utf-8?B?QjVTSnR1ZkFndDdYb3UzbGxjSU1FbFFkVitRNlcwbEMyRjV1Y3k5c0w3L2c4?=
 =?utf-8?B?R0FhRWxwN0YzUGEwN013bFk0WFBiN2JOTGZUdVIxdzhRemVSSCtZUG9tWWJO?=
 =?utf-8?B?eG5mMmtsTUNyT3krTlA0M0V6ek01YjkrZTZMKytreDVjZ0VzaGY2czBlMWZD?=
 =?utf-8?B?TkRwUkZXQVI0TVluRXI3andqRzA1eHhHQ0NDRGV2L0k3a2dTVXRvTllRR0Ur?=
 =?utf-8?B?aHhESG95elFxR205OStVOFd3TGpLK3RDS3hXYW5jaHkvc1B2WHRFU3dCbURa?=
 =?utf-8?B?SXRHcUh3UWdaVHQrb1lJNUROQmxvaXpYSXh6SlVyWit2SHdUVTRrbm1Tb3Jn?=
 =?utf-8?B?RWQreCtRVVJOdGRBamJJNTl5eUJFYlBVZkg5VWRwZ2ZkWkhiMUdvZ3hyOHhx?=
 =?utf-8?B?eFlDTkF3bEx4UjdldE1oSU9vb0Y1dzh4WGhTMzU0dks5ZlhwakJtNVFoQTF0?=
 =?utf-8?B?aWZUczExVm5KNUdoSW8yaEVzZmU2cm9UeWdmS3VpMG0xZFhHVzBXUEhXY3U0?=
 =?utf-8?B?K1ozT2RheXJCYjRHdFh5UC9yYURYMXFuMXl3bkFuc2NodWNxeXlvcjhmTUlV?=
 =?utf-8?B?UG5xZjdNcE9LZ2ZjNGNxWFJpcldvck9McXJ4Mnp5NGM1YlhOeExtMXJiUUFs?=
 =?utf-8?B?TFAwc051c3FXZXRWYVJQU0xWemdUeFkwWHBDRzRzby82cFFLME1IcC9MZTRW?=
 =?utf-8?B?RjdYK0xSL25IVlNxaER0Tzhsa1dMM0wzV0hPaDJWZ2t2UkVXd3MybXVjNitm?=
 =?utf-8?B?eXg5QXNJRVBKTmNTamV1cUVQS2l4c3paUUtuWXM3WThlcmNDVFVGTTZsaFpU?=
 =?utf-8?B?L2E5VVFZdCtmYkpxczBuM3RBbzdaSUxIQ2ZrZnJ5OEFQcUZFNS9MNUo3THhn?=
 =?utf-8?B?YlFGOFIwYmhhODVSQ3pQN25NYmRPNUZ4MEFOdkVNOHMybXB0TWN3ZWhPMUha?=
 =?utf-8?Q?UWRNfxLF7XjE+F2vTahn2kg9zZ8mizvMxUCmm5bEkgH52?=
X-MS-Exchange-AntiSpam-MessageData-1: ZX/mFDGB04e0Zg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0216249e-cc99-4c58-a758-08de799856c1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 02:47:13.3435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4lTj369B/xmcGOdf2QxDY6rqesKtdSLd6CFCkW1j9b56LGpCK1zrulJWd0DVw0SwLBo1jqZctM0BtHiIWcZJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9574
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
X-Rspamd-Queue-Id: 3F27B1F9FDD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Action: no action

Add locking to Cmdq. This is required e.g. for unloading the driver,
which needs to send the UnloadingGuestDriver via the command queue
on unbind which may be on a different thread.

We have commands that need a reply and commands that don't. For
commands with a reply we want to make sure that they don't get
the reply of a different command back. The approach this patch series
takes is by making those commands block until they get a response. For
now this should be ok, and we expect GSP to be fast anyway.

To do this, we need to know which commands expect a reply and which
don't. John's existing series[1] adds IS_ASYNC which solves part of the
problem, but we need to know a bit more. So instead, add an
associated type called Reply which tells us what the reply is.

An alternative would be to define traits inheriting CommandToGsp, e.g.
CommandWithReply and CommandWithoutReply, instead of using the
associated type. I implemented the associated type version because it
feels more compositional rather than inherity so seemed a bit better
to me. But both of these approaches work and are fine, IMO.

In summary, this patch series has three steps:
1. Add the type infrastructure to know what replies are expected for a
   command and update each caller to explicitly wait for the reply or
   not.
2. Make Cmdq pinned so we can use Mutex
3. Add a Mutex to protect Cmdq by moving the relevant state to an
   inner struct.

[1]: https://lore.kernel.org/all/20260211000451.192109-1-jhubbard@nvidia.com/

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
Changes in v3:
- Rename send_sync_command/send_async_command to
  send_command/send_command_no_wait.
- Move `dev` field into `CmdqInner` to avoid passing it through method
  parameters.
- Add `RECEIVE_TIMEOUT` constant for the 10s receive timeout.
- Link to v2: https://lore.kernel.org/r/20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com

Changes in v2:
- Rebase on drm-rust-next
- Link to v1: https://lore.kernel.org/r/20260225-cmdq-locking-v1-0-bbf6b4156706@nvidia.com

---
Eliot Courtney (5):
      gpu: nova-core: gsp: fix stale doc comments on command queue methods
      gpu: nova-core: gsp: add `RECEIVE_TIMEOUT` constant for command queue
      gpu: nova-core: gsp: add reply/no-reply info to `CommandToGsp`
      gpu: nova-core: gsp: make `Cmdq` a pinned type
      gpu: nova-core: gsp: add mutex locking to Cmdq

 drivers/gpu/nova-core/gsp.rs                   |   5 +-
 drivers/gpu/nova-core/gsp/boot.rs              |  13 +-
 drivers/gpu/nova-core/gsp/cmdq.rs              | 225 +++++++++++++++++--------
 drivers/gpu/nova-core/gsp/cmdq/continuation.rs |   5 +-
 drivers/gpu/nova-core/gsp/commands.rs          |  23 +--
 drivers/gpu/nova-core/gsp/sequencer.rs         |   4 +-
 6 files changed, 180 insertions(+), 95 deletions(-)
---
base-commit: 4a49fe23e357b48845e31fe9c28a802c05458198
change-id: 20260225-cmdq-locking-d32928a2c2cf
prerequisite-message-id: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
prerequisite-patch-id: fd45bc5b8eda5e2b54a052dddb1a1c363107f0a7
prerequisite-patch-id: 06fe65f900206c44b5ba52286ca4ce1ca42b55d5
prerequisite-patch-id: 8844970d0e387488c70979a73732579ba174b46c
prerequisite-patch-id: e138a94ed48fa8d50d5ed1eb36524f98923ed478
prerequisite-patch-id: dccf2b12b176947e89b44baafda9c5a0aa0a93bc
prerequisite-patch-id: 30ed64c398e541d6efbcb2e46ed9a9e6cf953f4f
prerequisite-patch-id: ba1c8da0cbdb4682b879633a94a172d1b2b6bc8e
prerequisite-patch-id: 081d4a4198a0bf09f3480cb8baf296db585decce
prerequisite-patch-id: 56c8c25e7362178cd019c8f03954a6bcdb72b1b5

Best regards,
-- 
Eliot Courtney <ecourtney@nvidia.com>

