Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4DAB0C323
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD5A10E060;
	Mon, 21 Jul 2025 11:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="HH1vjTXj";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HH1vjTXj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011069.outbound.protection.outlook.com
 [40.107.130.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3013410E060
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:35:52 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QISCMS4FJ7N1Z0Zc3YWXP74hoIyCsfEItCT9oEgynowizGOK4rG+llZp3aKjRpiykL/Ou0x8ro6CxfC/UkNaN40UvBg22LX/dMpXmc2mKXppB//CAOvI7m2jRUOKRQdX7h4yMbC3FWlPqYGILz3nA4QZM1ZFsWl4Zose1dBHu8QBEzpyCr6hh5KBPq/D336EeHmkoCT0OM1+f/PZjDPzZMsB7MRmeUptlmxmrZZtbEMlkVXyOiY0pLfi5IidMNA4o/uDfH5n0tt1/YlVfmcxfnrYqGY4EPtGoSdDCm8YJOFqwPpBQ8n0fugGhltKxGANs5rrmjNfM9fiUi+/j61Kdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32aOl5/VhCVKR2wstZx8jF4OPUgCKsdLZJt/gK2W0JM=;
 b=TWyKz+1gKiYry/GmjVxKhAYofcPhUB9mRRfBBEMr9fUXbgmJEizMA5g1zXm8tg0POUPKAMDO45BOkPGt1EgNFPkp9DiMjgHNuIHCCEYuHA4AbNJNJim5AqgkHgZd0pA408yJPFKhz1CXjarOrwQCkwuPoeQJ9nqLwAkC3EX3JX23KekxzHC4po6MiGWag0XO0Tbx00LaWOxqMa7PbZ8lFkWJZWWu0xBeC0N8DtZ7BDeYlyZbC61yUMmW92VNT6FnpuHXxMTnnnTQrkBOtnUaBJPb3D1yl1oDU5ofj/SlPGNy/BU92BcHyFQqOmlpNzAiRXWKsNVGhJPUZk2M7kGOzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32aOl5/VhCVKR2wstZx8jF4OPUgCKsdLZJt/gK2W0JM=;
 b=HH1vjTXjjUAoh9BK5wuCmBqlMmJEgP5vuzmYO8WXb6ZvV6M0KkZGUsPb07OaX/t5nAqri048VjC3AdAlc+yYKKQrZQcwMGjJdFzOYjKqNbyG0plnOs7gQDUVzsWIgXwOX5FZDkAO1ndtNJlkePfgqh+aVpL6X205Ka2fS2pK8ic=
Received: from AM4PR07CA0005.eurprd07.prod.outlook.com (2603:10a6:205:1::18)
 by PAWPR08MB9967.eurprd08.prod.outlook.com (2603:10a6:102:358::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Mon, 21 Jul
 2025 11:35:48 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:205:1:cafe::97) by AM4PR07CA0005.outlook.office365.com
 (2603:10a6:205:1::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20 via Frontend Transport; Mon,
 21 Jul 2025 11:35:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 11:35:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/EhjCk0Or+0n1I5N/ojpE0hG370YM0ldJ9wWp4rBI2NDOXjtkfrP6uoHMYNn5vnfIVtnKNvmwacWelHGeAHzt2t9Y/PJMlaW35Y9qsvmIXUFdiAN9TL0e4/P2DBJ2vvPFFzxSlOFmMLkwc/yahgSzSDH0I2CuO2heKBenqiCKXU0ZHj7Yxxr0Oo47VXxUWa3ZObjZQa6WmGSHGtT0e9VxyYMbDnka2TdlPgrx2p8TxHxPKaARqAEHfBrjdGQUdT5uiwRvoQ6OzBwSF1s5fnamnR5wXdRjx+Ebs1xK4BB7gMYFEA1IOj+AcQlpe/Rf6LZQLo/r5OeNkG6x2huz6p8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32aOl5/VhCVKR2wstZx8jF4OPUgCKsdLZJt/gK2W0JM=;
 b=lTaIIBPqM+omq5/KxjwE+728RgYifTI1g7VJiH7PdUwR8GDc+GfXzxz3K1KTYzYPjKc8nILIfGngWOUDa18tO2bRJqahdhejpsVRwC+NP7irZUM9jehfHU2yJcbBGwAsPzPVScabO8mQHfAmhl/dJeLB6q89LbfKB/dyQkOSWfmnW523YaapUlAbWGpfFHuVrRRPF3/Q18ovMff6ikmQRS2ccOt676Q1TX85Kbq1nrohoCuGxqx9hxz5/HFT5euA8u/yp9l2Sg2kQsWUMaOIKy0dbo4hDugxkBDcB98ZdIn8VWjI7zho0tk7Rm5sUyTrW33pcLi/ndJDk7pBBc8OJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32aOl5/VhCVKR2wstZx8jF4OPUgCKsdLZJt/gK2W0JM=;
 b=HH1vjTXjjUAoh9BK5wuCmBqlMmJEgP5vuzmYO8WXb6ZvV6M0KkZGUsPb07OaX/t5nAqri048VjC3AdAlc+yYKKQrZQcwMGjJdFzOYjKqNbyG0plnOs7gQDUVzsWIgXwOX5FZDkAO1ndtNJlkePfgqh+aVpL6X205Ka2fS2pK8ic=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB6135.eurprd08.prod.outlook.com
 (2603:10a6:20b:29f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Mon, 21 Jul
 2025 11:35:15 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:35:15 +0000
Message-ID: <03504c08-b84a-4b6f-babb-e9909743b5fd@arm.com>
Date: Mon, 21 Jul 2025 12:35:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] drm/panthor: Support GPU_CONTROL cache flush based
 on feature bit
Content-Language: en-GB
To: Chia-I Wu <olvaffe@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20250602143216.2621881-1-karunika.choo@arm.com>
 <20250602143216.2621881-7-karunika.choo@arm.com>
 <CAPaKu7TN33c71bQPWMApXQjLOO0gFsC=5rKnuKb0+jfcGPGgFg@mail.gmail.com>
From: Karunika Choo <karunika.choo@arm.com>
In-Reply-To: <CAPaKu7TN33c71bQPWMApXQjLOO0gFsC=5rKnuKb0+jfcGPGgFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0103.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::6) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB6135:EE_|AM3PEPF00009B9C:EE_|PAWPR08MB9967:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea8f8a9-3fdf-4ee6-b797-08ddc84abc92
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?UUxremZ5SnF6NlE4akxwUWE5NTl3K1ZSbUY4V25UOVc4RytYNEJwdy9JdDZW?=
 =?utf-8?B?cWo1dUc3Q0gzdjZtZzRJQUNBbUxGWVhZNUM0ZWVSb1RXOU1DbkxMZUJzVnU4?=
 =?utf-8?B?ZitZNGdMK3BBVm4ycWRSR013ZjVRQk12cEgrdzhxS2RCKzRKRkJpaUtoczBZ?=
 =?utf-8?B?VFk3SS9ad1RYZUEvS1lhQ3VsRGJja2FvSGxSWis1bnlWV3lKWUdsaDNpazJW?=
 =?utf-8?B?YkJyNHpFc1FTSkR0eFl0TkxtUm5BU3dwczhpV2lZVmYrbllRNFlnaWdwek5x?=
 =?utf-8?B?eTY0WDlvS1FZUXNKb0F3WVFOQ2k1TkZ4ZmhNaGp0cDViaUNGQm1ac25ZREg0?=
 =?utf-8?B?Z1Npc0VCUm5OMHJZa0N1SmZTYVh3WFFMUDE0TmZubkYwdldPK3dIZXZjK3g5?=
 =?utf-8?B?ZUNHaGMwMjdmRVZlSHp0V3ZSenlKaTY3QUdsVU9DdndUekFMTU9nZi9KdTFj?=
 =?utf-8?B?d2FUNEJzakpQYzZaQWhsWGlBYm1tVWYvZ3lDSlgrTnlmQkpsT3VndDJvc254?=
 =?utf-8?B?SHZyN0JvM1NEa2txMkJrRXo3U1RBNkdUNWRwMUhpL3FDUUZ3dkRvVGVsWFc5?=
 =?utf-8?B?K0ZGMldOcTlob2lUUWl1cVFCbGt6ZUZoaThTS2F0N0xydXVwWVplOWNiWlRN?=
 =?utf-8?B?OGFiT1BhUy9sc3pLLy9wVEcvMTlXMkRKZGFEWmxwSHNjV0QzdUVtb013SDhP?=
 =?utf-8?B?bTlkSVJDN0F4M0pDZDl1LzlCaERpWmZYWXNpTHVoeU83MUU5ZUZCL0U1cWQx?=
 =?utf-8?B?a0dCcW5WYmpBKzJhQUJYUnJLMFJoRVVOM3puek5YZzg2am53Lzh6eE1BbTUw?=
 =?utf-8?B?STR3UTJlWnhXN3d5aG5jUG81SWsrdEdhdEVUT0ppbkdKdXNQT0g2M1BZdmxM?=
 =?utf-8?B?TnRiSlByNTl5SEJtMXY4STRLdE5lblo2V3ZOcU0zakY1LzczVW1pWkY4N3dQ?=
 =?utf-8?B?R2RNS2pEQVE3eFJQYXIyY3dlajJwemxSYmpGZ2hETFVDQURnVWZNbkwwWHUx?=
 =?utf-8?B?WVd6ejYxaWhaNEYyU2x1eGdvcUR4L281bDFVNnRGbXVEbWE2S0VCK2NXRXNo?=
 =?utf-8?B?b05kU015UC9CQ3JiQXNoNGhYbStLbnpSTDNtKzM0K3VkWW9ETGs2MnVkVmZF?=
 =?utf-8?B?T253elNsbGVFc0Y3N3hFSDV2V3N4WS9TWHB3QSt5aGxrRVRtbjZjbzZGdVFU?=
 =?utf-8?B?c0t1ZU8vWk0ydGNJY3MxNU8vUlRYVTFxUmpTNmJFYzdnUUtZaDZFbS9uQzNQ?=
 =?utf-8?B?V2VQWXFuWEtjbUNVakU4S1JJZ0lkNklPWkV2UldSMU83L3AxbVl3eHhVaG12?=
 =?utf-8?B?aXZuUWwzR0NyRmF6aEMwOVBXUmtpYjQyRHYxOGhBT0ZGejk5YW5HRzgvVGN4?=
 =?utf-8?B?aVhRMWhTSWN0c3JpY3gzS2s0M2c2cTRmVHdkVzJMWDRSVktpNXJxdUhtaUpt?=
 =?utf-8?B?c3ZLZXBsQlJYajU3dTl4VytPb1hiM1U0UnREN0l4RUhDMGtJeSt4TGZFVXNr?=
 =?utf-8?B?dWQyRjR3VGMxT3I5VjVJR3h3QWhFMEdYMnZ5Y1VzaTJMNlV0ZUdZaWs1Nnpa?=
 =?utf-8?B?TmNqcEFPWnVPRUl6bkt1WTRHWExVR1ZqR0J5WmVWWXpBMnFWMVlrSzFXM3Qv?=
 =?utf-8?B?WmdxVTczZ0ZMSkozMGQxbDFEc2s3MEtFdm1OeFFHTnNDZ1RwSmtZbVJ4T3NQ?=
 =?utf-8?B?RjB6cWR2dGdCRVAwZFZGd3ZQYis0M2RBd3JUMVYvM2R1dVF0UndaSzg5L2M1?=
 =?utf-8?B?UXUwNGZBR3pVckdZeXBCa0hudFVqT01obFF1dUNBOFl1M1dHeVlOc1dsbGpt?=
 =?utf-8?B?dTVMTE9iZERKb1JpWjFCWVMzc00wU1YwNHdRL2hReEd3eFovTG1nKzFMOEpn?=
 =?utf-8?B?eFNQU3VVTWNETFQzd3Y2YytGakZZUE9OcXpDdWM4WGp4cXJKQ1VIdlF0RzNl?=
 =?utf-8?Q?rkyX/8++vws=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6135
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 717acfbb-5627-42f3-2f09-08ddc84aa963
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b01IYVlvREU0K0lXVVV5Vk00ekpzMWRYenFCM0NLQnBQK3lSK3VRMXc4dGsy?=
 =?utf-8?B?TU9VaURMckViSDlOamEzZTNNbWRpMCswVUtqVkNiRllhMVlndldEMnNyVmtD?=
 =?utf-8?B?bmxMRVJpeGNZeGphQWlZWXpVSjdLdWcrdDdlYnE1Mi84REVWUjJzRmtJSERy?=
 =?utf-8?B?NkJWbnViVmV5MlJuakovV1RyRUYwZG0vc1gxRjFkVENZb0ZQbzhXTmo3MmdV?=
 =?utf-8?B?eXdMUDg3RWowQXlqVlppbE1rTlV4Ni9ESkE1cjJ6VGRBVnV1RUdHL2JOSVhr?=
 =?utf-8?B?bXZFR2RRUG1BOXR4QUs3V3YvRml4QXFqSWRxbzNubU1ROW90TnBpblFWYkd0?=
 =?utf-8?B?eUdyWGV2a1Bhc1I0ZHpWVHgvTGxCZFkrd1dORXYraWdFSVBWU0FnUS8zT3VL?=
 =?utf-8?B?K0tiTFdaTHJ3Ym9EbHZIT0xjK3k1TWprWlIyV2g3bnBZNWxMaFM1Y3VJVmVL?=
 =?utf-8?B?VEZrVzFVU3RxbGR1ZTVYWDBFR0J3Wmw4OFpSTjUrQmN0eHovbEF3WHFSTUhu?=
 =?utf-8?B?MnVROTBLQXM4NXZRMzVlQTNGS3lDVmRKTGtzWnNyZENTc0x4Z3JwK0hCQUF3?=
 =?utf-8?B?bGFIY3dXWWl6a2hlc3N5SjNFbHZrUHQxdVFzRDM5azkrS2ZmUlMrajBXSEVk?=
 =?utf-8?B?NmZKVjNhR1BmVDlsZThJc044L2w0WkExdVZIR1hRT0prR0RtWG0xMy9vYUl0?=
 =?utf-8?B?dktSQnorcWFwcE1zcHdUK0YwNzByVEtocmc2aHd1ZVNlQzk3SDZFT29sUkp1?=
 =?utf-8?B?TlpVd3BBN3NFNWxlKytJWVNOdXJ1QjIxRzl3cENYZzd2WGtZZzMvVnoxKzFa?=
 =?utf-8?B?QXJHeHBpRGpLamZhN1lMNFFReXg4bXVGS01YNXJuWlVqb1Nva3lVc1gyZUxz?=
 =?utf-8?B?R2NkQUdwcG0rdmx1dXRScEZ3VWJNK1dpRWtCTjE4d0NMWldGNkZvcTd2bG9D?=
 =?utf-8?B?SmkzNjlua3pCeW4vdnJDUGZwc0d4SVBxVzFMSDkvQXRIVE9nM2pRUjkxRlJG?=
 =?utf-8?B?QkRiRkFlVEVQM1liTDlVZVpGS1FKc3ZTMjQxVm9CU2JKVklBbktRQ0ZhU0lq?=
 =?utf-8?B?bmltbjUwZEtCYkpLMWQ0VnMrTXFHcHpHQnFpMXBKeEd0WndKemNpRWJ6Vmp1?=
 =?utf-8?B?OWlCQXVFRkpMbEpZR1FNWWxTUE1VeUNiTU03R1lKYng5ekJQTmczSSs2OFRR?=
 =?utf-8?B?NGdXMWhWQjZSVFZwS0swdkZvejczdGVYWUIvWHhVWE53UzhTNUhvTGh1Znd5?=
 =?utf-8?B?c2FsSW9VOHJYejF1RGplM2NVMURwTGg0aW50aEZvRnhQVVhUdHN4MEE5b3JX?=
 =?utf-8?B?RU9KWlhLTmpaUDJXdTZmUDVrQUZFRlNYMDFIcVc2bEIyWmo3MWtUaVFSNnRR?=
 =?utf-8?B?OFgzZDFaVXFOeDE2YmdUM21Yd3RxbENSYlNCVDNTKyt3S1JDcVU0N1dJQ0U3?=
 =?utf-8?B?OFpKKzFaeFhJck5kUFNGdTZMQzk5N205eTc0WDAxeGFkWWc5Y0hMVHBCZUlF?=
 =?utf-8?B?clBGMDVXOTZzQllFM1B5S1dIWitnenlyQ0FSb2czOWtqMEhJTzNnY0R2RU9T?=
 =?utf-8?B?UWFINEFzSmR6SkVsWWpsRmNlZUVoK01yNGIyV2tKK2ZsRlp4NStITTdzL2tF?=
 =?utf-8?B?TThtMHRYWC81SmwveUJTcUpUaVBZVWVJVWdLWWpETHduQkk1ZzRQT1RHTEhW?=
 =?utf-8?B?WjNLMGNSQ1B2U2l4QkVtclY5T09QbG5icWpOODNqaHVtdDh0U0oxRnZZb2dp?=
 =?utf-8?B?V3ZPQlB4WU1SK3hpVmh0bmZDUEROanV4YVhHQ2hwakh3L1dGbENBa1dYKzNO?=
 =?utf-8?B?NEZKbjYwUXpaOEFyQWR5cDkweDBOUysrVEFhbzl4OS94Z0dsMzJnSERrWVFK?=
 =?utf-8?B?d0IxM1ZCMURNaElTdFhKMGwzMmdMTjFVcWR2TzNmeS9CVXB6Y0JBOFJ1RFhT?=
 =?utf-8?B?S2c2dk5qaFRuUVgxZ3IzTC8rWVFEaFJZajcyOVN6YnNGdXhGVC9FM0RyV2Ja?=
 =?utf-8?B?TVd0S0ErelJjajh5dFJHVkZWR09JMEgyeDAyTzkyZStHRUZvVUVqcHFHNzV2?=
 =?utf-8?B?czRrZTJ5UXp2b2JiUUx1STUwcFpuZVB1ZHdaQT09?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(14060799003)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:35:47.2344 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea8f8a9-3fdf-4ee6-b797-08ddc84abc92
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9967
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

On 11/06/2025 00:42, Chia-I Wu wrote:
> On Mon, Jun 2, 2025 at 7:42 AM Karunika Choo <karunika.choo@arm.com> wrote:
>>
>> As the FLUSH_MEM and FLUSH_PT commands are deprecated in GPUs from
>> Mali-Gx20 onwards, this patch adds support for performing cache
>> maintenance via the FLUSH_CACHES command in GPU_CONTROL, in place of
>> FLUSH_MEM and FLUSH_PT based on PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH
>> feature bit.
>>
>> This patch also enables cache maintenance via GPU_CONTROL for Mali-Gx10
>> and Mali-Gx15 GPUs for consistency.
>>
>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_hw.c  |  6 +++++
>>  drivers/gpu/drm/panthor/panthor_hw.h  |  6 +++++
>>  drivers/gpu/drm/panthor/panthor_mmu.c | 35 +++++++++++++++++++++++++++
>>  3 files changed, 47 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
>> index f5127a4b02dc..5ec9d7f28368 100644
>> --- a/drivers/gpu/drm/panthor/panthor_hw.c
>> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
>> @@ -99,9 +99,15 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
>>  static struct panthor_hw panthor_hw_devices[] = {
>>         {
>>                 .arch_major = 10,
>> +               .features = {
>> +                       BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
>> +               },
>>         },
>>         {
>>                 .arch_major = 11,
>> +               .features = {
>> +                       BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
>> +               },
>>         },
>>  };
> Are there going to be major archs which do not support
> PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH?  If not, we don't need the
> feature bit.
I have removed the feature bits and applied the change to all CSF GPUs
in v5.
- https://lore.kernel.org/all/20250721111344.1610250-6-karunika.choo@arm.com/
