Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEJ7Khxmc2mivQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 13:14:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8B5759E1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 13:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC8B10EAEC;
	Fri, 23 Jan 2026 12:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JIaKs9CD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012058.outbound.protection.outlook.com
 [40.93.195.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2CF410EACC;
 Fri, 23 Jan 2026 12:14:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qb+svM5GeAuapWm1T1qd7N6ixPj8P6sgHDHhoLMuQUq+jis8A5Z93s2iqZNp2ZMHptQOi2nJv13j+fowCEx9z4nv0NyL17j8O7fJi+dd/MS0toFWZXr13O9q9nl2npWZWx/K9u7hkhE87NB+9gyKxvLDzsMZWbps3uW42m+T9xMNWK/oT5BSCVlL1KCjq6YyYssgt4EY98V49ZEoeOLZgRbCrG7pKy6iHoboiUmrqU40EiD3cQD/mwXM65ZuuJupTS5bZGRQlg8RQEtjyxAH2QEIjnFHOff7ecxAMXmZhKJEnRcU9uXm1Cd5QJ2bjrncNKczlHMtFtCKY/PKHvqGTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/WIoWfhMGULQRunvxzSETiykHYQtWxFPrdackzDuWg=;
 b=fCw6c6Cu09syNylToaZQ3PnZGrP3UyMGmagCPFQVqcuH+trF2skRJmVybAatUP3IRRVJdjCW2wIoFCdbI3w87azv46xeDnZtTJIm2JDQXNbEesLVVyBBF5NYUO044D6/ifNwAEIL6l++xURUKeAtpV6VjxKgDRaucVSNZxAlCXPHqqx/B1nPHOeY2SngVIAvJ/zy6DE66wPA6z/8hrpoe8lrCo757WwNUj0ivNV8MocCata/wZkcEwKpApfmi2vC+LbbB1ygI4V3dLRGCmqN/M0IC1bhOg9/IM0/jYK6mYC8zuV1p4KHEELxj1wrKVPWsap4t1h0JeVh1G8oaOe+IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/WIoWfhMGULQRunvxzSETiykHYQtWxFPrdackzDuWg=;
 b=JIaKs9CDDy7W3A1+EQLDms8o57MCfabiHzn1lZCT96blbj6uIiYXApL+PlE07xQeNGFDDAgckaEbGOGYg7V3nXhSOEu4jOdzoBK7F+zjRXIGegCMvX61fu0ty7yJE4FEOFp0QTyf4OyZbiYiReG/EVOP0QcmM52D0MaXJVG2AXYqJIooIMGIKqPmgn8QRzxLUiyV2gD/FLy3Dzjeiaqw2s/zaCK2y+psQCHRjzmlNIdIkP4rNk0VK5mqS8tu85J2xhpOytyrZ3o47BvRKJ/WOKjk7CQSd0SOS0y7Qe7YY6SBlgRAjK8klT6E8vAKlstb0HtgxOiXXofIY4BlyMo+ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA1PR12MB8162.namprd12.prod.outlook.com (2603:10b6:806:33a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 12:14:12 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 12:14:12 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 23 Jan 2026 21:12:41 +0900
Subject: [PATCH v2 4/4] gpu: nova-core: gsp: fix improper indexing in
 driver_read_area
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-nova-core-cmdq1-v2-4-e797ec1b714c@nvidia.com>
References: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
In-Reply-To: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alistair Popple <apopple@nvidia.com>
Cc: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0365.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::12) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA1PR12MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: f5174ead-a297-4926-45ce-08de5a78eb31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bm44aS9UanExZ3ZCQS9WbXF2R0hIaGpuZGVqL1dYVzY4UlRFN2JBZGNRZjd6?=
 =?utf-8?B?WnBLWm5JbmlNT096Sy9Hdzh3UWtSckdhVGRwWDEvL085WXc3U1VpZVE5R3BK?=
 =?utf-8?B?Q2NUQ0ZBTWVOOUNuQ3JsZnZ0V1lmZGZ2aG8reVBOL2h3NU1aWTZGZzQzTlRa?=
 =?utf-8?B?VWFJclZHRVFFQlJRQnVKMzJQcWtMUklLRG80UVNyUk0yL2k4RXlLSERQaEZV?=
 =?utf-8?B?NjVabXpMaVZXZk44TnVZcGxHSk9YWXUwcGx6U1hZdms2ak90MFRSdUR1QXBa?=
 =?utf-8?B?aHhzMGFmdExMVnZjZEZTczIvYUNBaVk4NmNCOURzaVptb3hxZFIzSjM0TWNt?=
 =?utf-8?B?bGJJUFhIQUNwM1dFd1F4ZDdqaENIMmVQdnJNM25hS0Jocy9xaXNMSXk5RmNQ?=
 =?utf-8?B?dVBlbEsvSU9JWlc1MWFJNkk5cHhjWDhkZEVMK25RbEV4SWJOYVQ4cE84Y2lM?=
 =?utf-8?B?V0JwOXpyZktKRHVZeldhSWREZXhnMFdwdEg0eUV0VnpXOEhsbEJCSHNjMldK?=
 =?utf-8?B?c1lheHovQkdoeEVqZzUwNy9DQ2Y5T3IxaUtUYUtkekxHc0VLTEk5dC9VTzRF?=
 =?utf-8?B?WStINUMrcEtkRmlrQVFld0FubkhaNlNzY2lndDBXWWwweVJvWFdOQnhwVDlO?=
 =?utf-8?B?d3pIaC9aTnRpTnlibldnTVVLQnRmcmhNQU9MSU9wc2pnVjhYQUdVbnp5YW1a?=
 =?utf-8?B?WGd1M09wRmdzNVc1K3dtRVIyc0x0SnpKTHBHcm1BQ2h2SkptZGV0MndtUHRW?=
 =?utf-8?B?SDY1RnpUR2FSZDBhMHFwQ2IyZlBrdUlpaVc4aGRzTDdSMUoyU1BxcTJIWjU4?=
 =?utf-8?B?RFh5Vis3Mi96UnBCU0o3RnNseU8zbzdsNWFYOUdwMU5tZEhuYUlCVi9CcCsw?=
 =?utf-8?B?OGwzNUsxL2NjdjM3VUoySVJEZEIwY3NtdlIxN0ZueWVoMFhlNjNXTWQ4SWVY?=
 =?utf-8?B?dzZ1REl3OVhJR01uL3VSaEVzbjBwdzZRM1lJUkExTVorbEpwRzV4Z290ZUhQ?=
 =?utf-8?B?RTN0ZEZsWGx5N3N4Y2h5dkFVRDBZak9TVmpVSW5ERFB0eFg2OGpueE80NFZB?=
 =?utf-8?B?UU1Zd2JWelNzNlJuYVVROHVJcDRGU3ZFcGJ0dHRMUjl5QytjME5YU3l3RU5n?=
 =?utf-8?B?bFdUWXBkQUI4UVhmWDhId1hNTzZpNXE2eWo2dGpGMHpqak5mcXZEQThmMkp5?=
 =?utf-8?B?LzR3VHg4TTh1ZC9Pd0pJQVlBQ0dUMkpSSk5XWXFzZ2pzT1FkbFZDRmRULytY?=
 =?utf-8?B?RXNZdS96N0N5NHRUVnAycjdlbzJzYjdoZnV3WEEyTU9sNVVZdUdXMUR6QjFS?=
 =?utf-8?B?SDhBb1JNMDMybUdxRG9kTHhGYnh3eUZRbVR1TW1wQXNvWHluQ3hRVDRkd296?=
 =?utf-8?B?T0NybzdLRjNMQ09zMVBzUWc1U0VWdUxuSzdJc2JUVFVXU0s1aUVTRVExUDRE?=
 =?utf-8?B?SkU0dHl2MDZEKzgzWnBKM3lUMWYvQXhrYzdnMHVZbWtoeGpoRGNqRG5OZEJY?=
 =?utf-8?B?ZURXWldJMDEyLzg1QVoycFVQdTlwT3BWTnZObFNUbEN2bHZSM1BNN2w5UUJp?=
 =?utf-8?B?dkR6aEtiZ0xyZXNhUTNiazU1andObmRQTjh6djZzY2xBZVl0K2tqQzNKVWNV?=
 =?utf-8?B?d3dNTWtycHJVdnUwUXc4Mm52K1YvclNVWGtSUERIdmJTOXpldGdvU0xId1RD?=
 =?utf-8?B?YWJnUHZWdlUxeEUyVVdRanJDVDJjNlVhc1A2ejc1NDROem9lVmNMaFNYamc0?=
 =?utf-8?B?SjZtdzAzNjFTZm5JTXpDb3FjT0FUSElNYnNVTy9qSFcrNGRySGpPOGd4cjVS?=
 =?utf-8?B?S1VYNWZrMjd1dG1JS1hmdXJCVForUzlQK3hEZzVUS21pc08zdFIxTGlyVjla?=
 =?utf-8?B?Yi95dXIvN1Z3VmptZlJMb1dpN2VTM2ZDdWh4VVI2b3pLek9Wa3gzTHRQcFdW?=
 =?utf-8?B?V3NTNGY2N3RDZHlRNkROQ056ZHlkT0hINkdoZVV4aWNNUnJXd1A4bVBBcjdJ?=
 =?utf-8?B?czZweDF3bFdqSnpVM0F5aGxZR3EzaHVxcU1LbjVjdTNWalpkMFhPcUpNOHAz?=
 =?utf-8?B?MDdFd3pNOWVGc2t4VmdDZVcxWWlIMWJkdGFMcEJXS2l1NE1YVHF5ZUowR1By?=
 =?utf-8?Q?IK5A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3JPcnFxM1l5THZXRzkyTElBajI4VFloWGNPNW8xckp1MHEvVGl6KytCa2tS?=
 =?utf-8?B?Y1pudmJ4bzhRRE51R1NVTCszaGQrRWJpOVdBMmJPOThTU0NOblcvU21ZaHIv?=
 =?utf-8?B?bldkWWMwY1FIMmVRTm5zTTJVZGJlMzRONzFyYjFrRVVYTFZhdkV1UzZpY3hn?=
 =?utf-8?B?b2k1YXFsdkFGV1ZPaSszYjZST1RoWC9ORWtWZ2ZXUTdHSG00ZkppSFhqRzZX?=
 =?utf-8?B?UnhBYVV3aFNSTkFZaGU2OWZVYnRudUh0TUJHWnlSckdhSnRMTG83WHNtQWE4?=
 =?utf-8?B?dGdpOVFaV1RyUnc0bXJhYjBBa2Q2VzNKMWluWUkvbkpHMTVBZTN5ZGpveHhm?=
 =?utf-8?B?M1dqelhlYk9jai9XS0JmSUhWVWVhdHYrKzcrTG1PNUVpUWxUcUcyaytqZXg4?=
 =?utf-8?B?dHlOVGpiUDUvWWhXVjRUL1BIc1BvSkJRQmRWZTdlclM4a0tJSTdMbGRVbzZn?=
 =?utf-8?B?MUFsQm9zZlNhbWNTUnlXNFoyaXRYU3FwNGFraHBsRGF2R2lpRncrc3JoMVo4?=
 =?utf-8?B?R3IyVExxc3QxRnpPWkhZRXVIaExQUXUxYkFiaWo3OG1tZkQ4SjhDd0hIcEN6?=
 =?utf-8?B?RjRnaFBGdVZUcUtmQ1dRcUNYY0o2czVaenR4SjM4elEwTm1RZzJQa0lrOTNW?=
 =?utf-8?B?bERuWUpFWWx1SzRvVmsvbGdxVy9Cb2UvWTFUR25FbVJTT0hhbENiRTBMR2or?=
 =?utf-8?B?Mkh6c2hlbUJtamVDcnh1RlArK3poMVhNR3BCb2JWTHN3SFRBMTFwUEJvbjJw?=
 =?utf-8?B?ZzZINmpaSDZlaFZYcWVHeGJZd1hJWEwyZVZncXhNeFk0ak1YZU5jYktwTk00?=
 =?utf-8?B?QW15QTNFbGdhYnkzZjEyTXJWcEZTaEhBVSthSVFPZkZ2cGVPWnpRT2xUM1hS?=
 =?utf-8?B?MnlGaEZtaFRYNVZNT2J4Z1BmQWsvLy96TTdhVEpYcUZkSjF4bVBkVjFwTDJY?=
 =?utf-8?B?OUJWaFdjMGRPRk1zbWw2UEMzYnBJQWVhdmJMd1dwNUR1OWxFNnN5Zi85NHJI?=
 =?utf-8?B?cGptRjRqZElvNTBiajFXY3RiZ1B1QWhDQTVBZUIveTZPNmNHYndHT0NXSHQ3?=
 =?utf-8?B?N0UxZDV0RjJDbloySERra0ZJV0IvUGFWOFFGbE5hK05xSkF2UGc5UXdZWlRy?=
 =?utf-8?B?cEsxcEV1T1k5ZE1EZkVYRGVURXh5a0tuZnk3bWc5YkFsUytITXltbDJpNjNI?=
 =?utf-8?B?RWJiOGgvWHczZHlOam5BeWhNKy8vMzcwcHZEOG92eTlkL25SR2hWdUFhd0xQ?=
 =?utf-8?B?cGx0QjNocnFqNlEyeXhYYTBsOVdMUEJibjR2YXZFdENmdGIycjhqOWVUSXd0?=
 =?utf-8?B?c2RZc280MGJycUhRUGRBMHZBVVkzeG81bU5WZkhtY0pkM1JCTGF3eHgvZll5?=
 =?utf-8?B?QUF6dWd2VlE3eHBDUWZFUHBwemxTUDEyeXJyV29ac0ZhdVQ0UUoranZWeXVR?=
 =?utf-8?B?d3FDcEdzSUo1bSs5cTZzemtXcmxtcFA5Vm5uUWUvNE1PVlVXY1BCT0d1WFVn?=
 =?utf-8?B?MjQ3Myt6ek9vN2ZOaW15WitUY1FETHpNNWF1ZVZkQzR3Zldwa3M3TG4zT3Zq?=
 =?utf-8?B?ZXhSRmlEdjlKeFJxV0QxTTE0U0FjUjREbEdhdC9DTDM1RVpMblRIRllZbG4z?=
 =?utf-8?B?cE5KZG9ZdEhQYlFJZ21Gc1NsVVhFVDRZSFFHWitHQU1HVHpSWDczcWxTT1pJ?=
 =?utf-8?B?bzFjMEw2SVJjSzRLQ1p2c21NbjAvVW83TXdlVDNycSthR2FaRmVkWUVVcnpP?=
 =?utf-8?B?OXdGUTRuM0d6YzVkWXFMaFNrOGhHZ09HTkY4a3g5Vmd2NDVUeXUyK0QwSnZD?=
 =?utf-8?B?SmVPdXpuQ05mNGxJTE9sZzBQVlpYeTVmM21mTGxGWGxmeVpZVjNFYXBUanhn?=
 =?utf-8?B?V1dpZE1aUDhaU2ROcGdMY25kYnBSd0RUZkxYR0pXbWhQRENiV2wxMjAyZVM1?=
 =?utf-8?B?SVNvU3VWblpYMkoxOVJmZ3lHYVh0M2k2UnRzM0EwbkUrajIraHluUEZuTEFx?=
 =?utf-8?B?SGpvU3dweVV2Y1ZaNXhuYXM2U1MxWnhTSG1VMEVFVUVLOXR2QUl2NlYwTERK?=
 =?utf-8?B?OWRPdnFZYmxDMmV4RmFVNk1xZ2U1eUNlRFc3WHFUV1A1RlBrVDVkR0IvNzZM?=
 =?utf-8?B?c0ErMVlKSkpOSUc1Qm9tSUJyL2xTcE1saVRleEZWV2hsRzJPeXpuSlZSYk1W?=
 =?utf-8?B?cTc5NE1XMmJweUFjT1QwZnp0QXJzUFdMSGN0eEY3NWtab3NKVm8ya09seUky?=
 =?utf-8?B?ZFlZVG9wL0Qvak5NQ2NYNER3Lzh0ditGTFNISTJDMnUyT3IrNlNMbHNXaGdU?=
 =?utf-8?B?RGd5LzA3VkRLMWFPUS9XZGd4V0tqY09kREZMWVlWNTI1MjIyQUlPUDRXWlRo?=
 =?utf-8?Q?8L9yAi/PJS7Kz7fsL8ORMOqXHIV+9rHcLxqZnKf23W5xL?=
X-MS-Exchange-AntiSpam-MessageData-1: 3arunWagkIMNyQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5174ead-a297-4926-45ce-08de5a78eb31
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 12:14:12.3915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W+DbZDl5RBRoHX+y3iS6ZgVoSTEVFNaiMbS6mSgx0FxfJrq5099craYFdd9Jw4kG2ECZ0vx/uHEznxLqH+5UAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8162
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 5D8B5759E1
X-Rspamd-Action: no action

The current code indexes into `after_rx` using `tx` which is an index
for the whole buffer, not the split buffer `after_rx`.

Also add more rigorous no-panic proofs.

Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and handling")
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index aa8758fc7723..c26396fda29c 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use core::{
-    cmp,
     mem,
     sync::atomic::{
         fence,
@@ -267,10 +266,20 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         // PANIC: per the invariant of `cpu_read_ptr`, `rx` is `< MSGQ_NUM_PAGES`.
         let (before_rx, after_rx) = gsp_mem.gspq.msgq.data.split_at(rx);
 
-        match tx.cmp(&rx) {
-            cmp::Ordering::Equal => (&after_rx[0..0], &after_rx[0..0]),
-            cmp::Ordering::Greater => (&after_rx[..tx], &before_rx[0..0]),
-            cmp::Ordering::Less => (after_rx, &before_rx[..tx]),
+        // The area starting at `rx` and ending at `tx - 1` modulo MSGQ_NUM_PAGES, inclusive,
+        // belongs to the driver for reading.
+        if rx <= tx {
+            // The area is contiguous.
+            // PANIC:
+            // - The index `tx - rx` is non-negative because `rx <= tx` in this branch.
+            // - The index does not exceed `after_rx.len()` (which is `MSGQ_NUM_PAGES - rx`)
+            //   because `tx < MSGQ_NUM_PAGES` by the `gsp_write_ptr` invariant.
+            (&after_rx[..(tx - rx)], &after_rx[0..0])
+        } else {
+            // The area is discontiguous.
+            // PANIC: `tx` does not exceed `before_rx.len()` (which equals `rx`) because
+            //   `tx < rx` in this branch.
+            (after_rx, &before_rx[..tx])
         }
     }
 

-- 
2.52.0

