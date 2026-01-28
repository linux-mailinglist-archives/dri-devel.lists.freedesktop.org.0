Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKiMKYP1eWnT1AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:39:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1418A0A0F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B6A10E2A0;
	Wed, 28 Jan 2026 11:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="avEzv+uv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010046.outbound.protection.outlook.com [52.101.46.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E4A10E2A0;
 Wed, 28 Jan 2026 11:39:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmbOHeeNboxR4AmG3UEzHGfVjx5sn1E5xiGCD0XNMbadgya2MtbI86I3kfUxW6PCvdVkWX30SD4zVEfjtJoJ997OQTGYiMO2B/gn5R5ZgrqRN3GRiD7gg5aIT5tBZwF0ke0oHOrdx3ckluvWF/h3cN0keT6+2GNcsX/WEoJsVrUZoUkeuO4Khe8Knk3WjjudykcKGr5/icdHbt0HWwa5b0LJojWjeJZKGt6AwkMn6OmWbu5kRMrFP2s091JZ9jJu/fLV+nPncFHeTxoRVaKC3R89jrtYkWOtOmGoOd9Xyeb1xxZhJefSoAm5Mh4aCOSUOgzt0kKG1ebVl1VzZlKqBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5/sKBKGaBl2cZQQtop/qjqumAYrkYiCd5wCc3fMyQo=;
 b=xqLd4rrBLF9LNiqPYEj4kBBeQ6ybmTSZ1ovPraWtUgAPbt9Nb1G1FhMDpFXvRKpOyCrwBT7Uo5+0EmheQBNVagP/iUnBq/+07WMkjmydTF8JgxTF8IJuKv9zAnsJXJp7yngKvQJKgZZAjxivgOnDHeYfTGa0+F+I/yve1DI0quJzXPWe1qSXEs3FrZaCvaF9prbFIu4EsiwS4aKUkM7zyG0uHqEca4QNKjSBepip7dICKK+dHv8e2/IYOeEMLBepCQj71J+NSetML03uJKm/QCLbWC+kwHhIdgvz2TFJc7O4/JpgT3CAJjDbhDkcnesK3Ki1PAkXI1dvOagtuNNInQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5/sKBKGaBl2cZQQtop/qjqumAYrkYiCd5wCc3fMyQo=;
 b=avEzv+uvpfhUDbVhJYshOwxiji/jJFNLr+bQ1dY3gP13fsh70x+Xub8C4QG3cEUNqMRd7TqBX+OZmFSt4HGG8HwIptF7ryS/H1HkJ44z4IYjiBm4pZRK094pGawalHfvIOEM1ghnpUj+3WIKJGUrKccGboeTfRa0H3mvFjAsLx4ixM93UpuTKQs54wO+X/DXcfLbo+unQJHdgdcrQEY5n+FKvH6x+moTZPX2XV/j6pxcsBaSK+ApUMK/Ox8QimNhkdYYxUwNCqehdAZx1t1xix00dYWu6UtRdAG1MkaO+Hadujf+xKOuFloRFyyKpFvD7dMvptb8qbB4EAe3QLzVdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7563.namprd12.prod.outlook.com (2603:10b6:930:96::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 11:39:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 11:39:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 20:39:35 +0900
Message-Id: <DG06Z9TJYYWD.1NAOGF6GCNFZS@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] gpu: nova-core: gsp: fix improper handling of
 empty slot in cmdq
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
 <20260123-nova-core-cmdq1-v2-3-e797ec1b714c@nvidia.com>
In-Reply-To: <20260123-nova-core-cmdq1-v2-3-e797ec1b714c@nvidia.com>
X-ClientProxiedBy: TYCP286CA0068.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: 02336e5c-1a5c-460e-c209-08de5e61eba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkw1dDdrT0VzTkppTXNieFV3U25TOHJ0SU85bEZBamNxVFR4VExYUjJWTlYz?=
 =?utf-8?B?UVBJNnhZQTVjejNjWXYwQ0pwR3ZDUzcxK3c0dk1yOGRJdUVWcUprQkVPYTlW?=
 =?utf-8?B?NWVFV0poS1Y0WG5wUXVMZ0tvcHBzelZWWmxFZHRVNFJwY3hHbDFWUzk0UmpS?=
 =?utf-8?B?VjBCUzZCS0l1bkI5RFZNMHo2eTh2THdPMkdjM21rYU91ZmR5bFVUcTNQZEFj?=
 =?utf-8?B?TDB1Ym5uSm5nOTVlMU8rRm9XSGRJb2RsOSszRmVEL2hreWVZN0J2anpwc1JT?=
 =?utf-8?B?Mm4xcDFIcDlPNGZpTk05RWVTTnROSnVqZGcyOUdpZWJuM3Vkbk5GRUNscjIr?=
 =?utf-8?B?TE5OSkxpT3c0SjhGRzVITVQ3bEJzYkw2ZGd3VEJPRmNxRjRCRmVHSnlNcVJV?=
 =?utf-8?B?ZDNJWDdyaGx0VUk2UVl4dDVjMG1aUStCSkVmZXhITEg5WVEzbVRlcVVwZCtj?=
 =?utf-8?B?YlBKV2JCMkFaTFp0bW94VFNyUUllQmdvWHk4cVNGUWkzK2RkUXIySit4dzZn?=
 =?utf-8?B?Z01ENnNjajU5ZFJhQ2dSV1dhbWRUWDgzSXo5VEpqTEhJRm0xZlJRakJGWnl4?=
 =?utf-8?B?d1FtYUJPUEIxWWpDUXQ3TnBwVjVqczZHdCtJc21aYjlTTFpiQktTbzVZZVdU?=
 =?utf-8?B?RXFmMGdFWFAxNzdkdGd1c3FEbnJnQVBMTGN6QVFJazlxWnNpMXRsNHA4Zmlp?=
 =?utf-8?B?dnQ5YjVUcmVFOFBzaVpFajROMHRuYXNwWWtKTFQ4dVI3SVpqK0g2bVFvVkVy?=
 =?utf-8?B?Um5XbjAzNzJlQmxKa1J3VXFha24yTFQwWERBQ2JSRGlQTVlCeGNJaGJreSto?=
 =?utf-8?B?R0ZnZmpzMWMzcDR0WkgyNkJBOGlzdmZIWmVLRmtvWW5LalZHTFlJRTUwdlIv?=
 =?utf-8?B?Q3k0OGpyMTMrL3VoV1h0SUJkNHQ3M1dTVkpLQlRBVXM4cUZRUHgrS0VRRFJP?=
 =?utf-8?B?YXB0NFd6NFZCdm5PUHRKL0JBSVBLeE42T2o0OHQ1VGI3YjA0OXRZWkNVWlg1?=
 =?utf-8?B?eS81dHRvOHpzSE5vTE0zK2FHS3ZsUktTZXo0SHdTUXpKcWFKZXo0cDdIMytq?=
 =?utf-8?B?VUhZbnhrRkZDOGxUSkoxVzVaano0dVRkNmErRTJDcVRQSGFnUEY5aEV4bG1T?=
 =?utf-8?B?Z2VlbTFkZzQ1SDRPaWt0Si9RQTYvR2w3L3BZaXBNN0NTRTlvQUZ3bWlvRUFp?=
 =?utf-8?B?UWw2VWxUZGNmMjhUS1pmc2h6WXVyeGsyejFtMWdDUjNDYlNXaE40SFVkS2U3?=
 =?utf-8?B?Mkdudk14Y283VGJVakhjcUU1NFRZRnBvZGRTdXlDL0RxOXpYd2RjbFdqR0tm?=
 =?utf-8?B?SkgvZEpVaFdZU2RyeCs2bHB4RWxpdzUwTG4zOUU1dXlqVUlzd1drTDlSUzBa?=
 =?utf-8?B?R3FVcGVFTFUrQzcwYm81R0dXcU1UT2hSS05rUE5SeW1SV3hmQXBLeWc0dVhC?=
 =?utf-8?B?R3hFTzBxdmJ3cDFxRWFIUHJyaDcyWWJ0TEtKajc3djUzZTRxS0xISGpqem5W?=
 =?utf-8?B?Q0swVzNEdzVyd3p6UjEwUExDMjBibzQ5a0JENnVBVFJSZ1k4NVdmTG80cEc1?=
 =?utf-8?B?OFNBL05MQlhuTjI4aE01RmtyU3VHRlU3bFd4ektFNGpjMGhieUVIRTBkdjB6?=
 =?utf-8?B?Slc2NXUyd3VvVkJyNEI0OXA5K3lXMytrRXdaOHdBSGV2N04xVkV0Wjd1TXpP?=
 =?utf-8?B?bXg5cXFVZWxYdFNQUXplTk80bXBBOWdhOTZZWENZQ1pSdTk2WG11S1AzKzU0?=
 =?utf-8?B?WW51QkRZamd3cFowSUdjeTNwSnNPZFp3TW92Yk5DbDhmb2ZrQWpPQW14elVo?=
 =?utf-8?B?UnZqVTRXb3dKNFZtb29RWEtoVE1LUVU4MHQzWEF1QjNIcFhiR2hoYXhDOVkv?=
 =?utf-8?B?L2dpdkd1eExzeFUrWUlma2ZYMFIwak1jU1ZVNUZZWm9iWk0xdlo4KytEcHF1?=
 =?utf-8?B?WEl1N3hhYU5MMENiTGdsRExhSDA4SzY5SHBzemptYndrT3ZBNnNLQ3ovTm52?=
 =?utf-8?B?cWtpbEYvT0JmYUlxYnpZbVE5QXdTUE94VC8wdHN4Sys0cU13a1c3OUovOHhm?=
 =?utf-8?B?OGxvUXZDK2VTODhHREs2VzE4dmNIVDFzU1JhaURFQm15RlVsdTZVQVVLNjcw?=
 =?utf-8?Q?kaHg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekJTS3VVNEFrMlBUT28yMmdzcWxocVN6S3JXMG03TndIMFFFUzJSeDlKK0Vv?=
 =?utf-8?B?NzZBT2N6dlJwZlFyQXB5VmgxbWFkdC95QlpzSVFpMEV3K05zNFNNK2RnWFJL?=
 =?utf-8?B?UlE2M3BTSVprUWpObFhRVkg4dlJ5akw5M1hrWi9JV1BwSEZ5YnJzUEVVSXV3?=
 =?utf-8?B?VGFsV29WN2FYb3UrRVJsVGdWQWZEWG85dE1kRlNRYTRiMkZlaCtyUC9EUXZW?=
 =?utf-8?B?T00wdnIrN0ZFQ2xpYnN0Q2tQb0NTVkdSRm91eGxORUIrY0ladWRpTFVzL2p6?=
 =?utf-8?B?ZE9rSWx1dmhZNFlxcUhzWnAwSEZ5QkczNGhkT3hEc2c2ajdFWUhyRjJySTRk?=
 =?utf-8?B?VllpeGhja1FpeGpNZjBLckVURFZsVVRXc2podkN5UXZ3Rk52VzJpdGFaRGxG?=
 =?utf-8?B?UVRFakRESm9pK3JtSUNWbmQvM0hjWmMybjBDY2xLeHdWVk1EME0xRGd2bGxU?=
 =?utf-8?B?OHNxYlZJUmhPYmRxaTlvU3FNTTJhWjBxelpWcDZEaU1tMmxRVUwvYVNha3p1?=
 =?utf-8?B?QTdlbkltRzh6S3dyZEt5TCtrWk1JbnJUVFdmbjMxYlVHS3M4Z0sxVTRtOGFj?=
 =?utf-8?B?ZG9KbzFmNXRvUHNVTzlBc29lYUt6TmduQkxocE1QNlZvWkpqUDNhZHo5VnJL?=
 =?utf-8?B?TVhMbHFoU1dXR2R1Q3BJTHZsVklSSlRtV3UxN3g1Rml6TXpXdGF2dUNuVVJ3?=
 =?utf-8?B?N2ZERHRReldBTjZoamMvbGJBeDZnNlQ0OS9oVDM1OWRUQ1NMUEZpcXJlTUtN?=
 =?utf-8?B?UkZ5YnozY1hHbStvL2xDMnBnWEw4bjFic1NmSytWdUlkQzNzODRTR29SM3hj?=
 =?utf-8?B?MFRXY2VyNXNrOUduME96V0lnbjBNL0wwOEx3QTJzV3dTUHVYZm9VNCtoamxq?=
 =?utf-8?B?T0hkS3N4ZzliWis2bGFJS2N5aFNrZGE3V1R2SzNPbGd3Q290MUpwanR2TnNX?=
 =?utf-8?B?cFZ1clVEVFJST0JYVGI5Y01PTTlwRENhaGpIWUgxbTFkNWdTeUx1Y24zM3dZ?=
 =?utf-8?B?Y0xXQkd2d2l2V1BIaWMzYXh2L04yNkRZdjZkWk1kQVF1bXBrQzgyQ1pUZDg2?=
 =?utf-8?B?NWVqL3dxQmlFbDlJVExWS0lTbHhmbUFsNFY4SElPU0FlUWxmUm9hMFN4Q3VL?=
 =?utf-8?B?Mm4rUVdZQzZjTHVIMGxNT0d6dXIrak51b0VVN1BXMi9WR3VkbExKTnZVTjJv?=
 =?utf-8?B?MEpWY3BsSWlJWTJ4Yy9xdlFJSytaVWlWRnNoQTc4T2pjTmFvOG9OZXRVTjRE?=
 =?utf-8?B?c01aVmRsVmVENzVoMTcwUVNMK2NqRUZQZWVFdVlPeTZpY3YvYWFnYlNYK0Nt?=
 =?utf-8?B?Qk5jM1JsQXJVdlhlbnRPeHZHRkhudWZaZlNBNFBveXg1TjBDN0s4aDI2cVRl?=
 =?utf-8?B?dVhnbUhkREQyOGc4SUs1ZS9HdXRzOFJhYWg4aUVadUNrWC9NZlBFTjVpcU5I?=
 =?utf-8?B?TGpaSGtMSm1kZVZOZ0h5WUgybG1mY2swZmpFdVY2alJxSGdwZWpTR2dPM2ls?=
 =?utf-8?B?NnJYMnlHb3NxOXFrdkF6aU1qK25sNFJjMnVCTytHR3BQWEJndVZXbTU1YTdq?=
 =?utf-8?B?VUVnbjhWdXlEV3g2OU5GOGpvci9ZTm0xODRGcEMrRnVHb1gzU3Z4OVhXdWlF?=
 =?utf-8?B?QkRhaStQdnBZMEhBeVhlcnZOMFFYRmRVUFQ5bHFzVUVyOWw5K1JqY053cU1F?=
 =?utf-8?B?d1VWOWtIMDg1Y1h3QWZuL29ieVQ0R0xhWUVzbEFmVWFKUVkvSkdKQzFOZCsv?=
 =?utf-8?B?RSsxU1FCWFFWV2hsTHVCVXJTcC9xRGdwZFBFY3JBREhya2ptR1h1ZVJ4U0JM?=
 =?utf-8?B?Q09BcUZtQk5mb0NWNmQxK1dvd3FEMnpxZzBFbEpKa2hTV0RadXN1eE1YN0hO?=
 =?utf-8?B?QlpEdWtvRGhaQW5GQkxEbG1ZUEd2bk1jdDRqUWN3YjFud2hQbzc4NWJLQTZL?=
 =?utf-8?B?VnllTVUvNlRtK3B0dmVPRWFHQ1l3NGZTaUsyTWVtMllRRUQvN1kyZmFqQk0x?=
 =?utf-8?B?VDBTSVpBZDJHUXZGbXcrdTdhSzVTYmRWUHViaXNjQm1wVnhsT2NZSEVnbzRz?=
 =?utf-8?B?aW9XQ0dPNFU0L1FnOXpLZlJyRHBneFRPV0hFL3EvVDVEY1ZveEJZVmJtQ1FB?=
 =?utf-8?B?djBYZ2d6U2o3YXV2Qnc4SW5nK1F5MXhacHgrOFFkRTkydFhtUnpJTnQ0VTgv?=
 =?utf-8?B?d3lTZWVKcDR4SDFRN1Y2ckhJWWpPMW1TT0k0cE5GaythWUY5N3ZMVC9kTmwz?=
 =?utf-8?B?anN3SVlCR0RycTJUbHhoT2JUU3k1ZGJQbDl1ekl0MHl6MnNobG5WbzdRcSt3?=
 =?utf-8?B?SXRONEM3SmFjenYzRVNHdmdtWlRmdGlHYlNBdG1jbGhHNFZwSElUb1dIZzNx?=
 =?utf-8?Q?So6/sO7qITLMw+yZFMjRXDao4UhTH90PURNuuc6ZPnCeB?=
X-MS-Exchange-AntiSpam-MessageData-1: 7SOSvGPK/3bi5A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02336e5c-1a5c-460e-c209-08de5e61eba2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 11:39:39.2966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGD5RGTB/vyMImhurjX3CbvpQLRkTiFZt4BF/Hx/oZd2TMOAvmtdWy7GyQw+vJL5R4rrD1n9rG4AWiSZC9baUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7563
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: F1418A0A0F
X-Rspamd-Action: no action

On Fri Jan 23, 2026 at 9:12 PM JST, Eliot Courtney wrote:
> The current code hands out buffers that go all the way up to and
> including `rx - 1`, but we need to maintain an empty slot to prevent the
> ring buffer from wrapping around into having 'tx =3D=3D rx', which means
> empty.
>
> Also add more rigorous no-panic proofs.
>
> Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings=
 and handling")
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 33 +++++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 09c28eeb6f12..aa8758fc7723 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -227,21 +227,26 @@ fn new(dev: &device::Device<device::Bound>) -> Resu=
lt<Self> {
>          // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `< MSGQ_=
NUM_PAGES`.
>          let (before_tx, after_tx) =3D gsp_mem.cpuq.msgq.data.split_at_mu=
t(tx);
> =20
> -        if rx <=3D tx {
> -            // The area from `tx` up to the end of the ring, and from th=
e beginning of the ring up
> -            // to `rx`, minus one unit, belongs to the driver.
> -            if rx =3D=3D 0 {
> -                let last =3D after_tx.len() - 1;
> -                (&mut after_tx[..last], &mut before_tx[0..0])
> -            } else {
> -                (after_tx, &mut before_tx[..rx])

Indeed, the comment clearly states "minus one unit" but the second
branch (and the one below) ignores that. >_<

> -            }
> +        // The area starting at `tx` and ending at `rx - 2` modulo MSGQ_=
NUM_PAGES, inclusive,
> +        // belongs to the driver for writing.

I have trouble parsing this comment - it says `rx - 2` but nowhere does
that expression appear in the code. It's particularly confusing because
it apparently applies to all 3 blocks, but the position suggests it is
only the first.  I'd add a blank line after it to signal that it is
relevant to the rest of the method.

> +        if rx =3D=3D 0 {
> +            // Since `rx` is zero, leave an empty slot at end of the buf=
fer.
> +            let last =3D after_tx.len() - 1;
> +            (&mut after_tx[..last], &mut before_tx[0..0])
> +        } else if rx > tx {

In the original code, the `rx < tx` case appears first. Can we preserve
this order so the corresponding diffs also appear next to one another?

> +            // The area is contiguous and we leave an empty slot before =
`rx`.
> +            // PANIC:
> +            // - The index `rx - tx - 1` is non-negative because `rx > t=
x` in this branch.
> +            // - The index does not exceed `after_tx.len()` (which is `M=
SGQ_NUM_PAGES - tx`)
> +            //   because `rx < MSGQ_NUM_PAGES` by the `gsp_read_ptr` inv=
ariant.
> +            (&mut after_tx[..(rx - tx - 1)], &mut before_tx[0..0])
>          } else {
> -            // The area from `tx` to `rx`, minus one unit, belongs to th=
e driver.
> -            //
> -            // PANIC: per the invariants of `cpu_write_ptr` and `gsp_rea=
d_ptr`, `rx` and `tx` are
> -            // `<=3D MSGQ_NUM_PAGES`, and the test above ensured that `r=
x > tx`.
> -            (after_tx.split_at_mut(rx - tx).0, &mut before_tx[0..0])
> +            // The area is discontiguous and we leave an empty slot befo=
re `rx`.
> +            // PANIC:
> +            // - The index `rx - 1` is non-negative because `rx !=3D 0` =
in this branch.
> +            // - The index does not exceed `before_tx.len()` (which equa=
ls `tx`) because
> +            //   `rx <=3D tx` in this branch.
> +            (after_tx, &mut before_tx[..(rx - 1)])

In any case, nice catch! This would have bitten us sooner or later.
