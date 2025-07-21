Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EC6B0BF5C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 10:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E0510E4A3;
	Mon, 21 Jul 2025 08:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="UrClerNH";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UrClerNH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013024.outbound.protection.outlook.com [40.107.159.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7211110E4A6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 08:47:16 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ppNqeFJV1cUOFegjymdokScXrpTMDHHfMyhyLMiEhdjWIbO/xyOKfo8uYQD6iI4rErs+S3s4jdXdn0M45l3C0AU+8jrIlCbdgt1nPF7kj25ig/gewqRC39XYG332KfOC6nnvE5wUImfwYY9BYuhiKB3UINeROAfQY8pEmK6VyziYapgmCimyWcVO6ijhBtuZ2HV+j+idTHHcyjfs0Mrz3ePvMiuovKW4h4ZiquvV+csZPlW7lOPcQ+2/1xtUQGfaq98wK8zB9l0devIygZgz/5KmRSYoUYJfZWr19vlg2d605khV1L41nodwtZadF6ykY0WcimKli5XPlMNTAIQVPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gT970ZOYFQT/xyfFx4MUIDmWCumuP9PWfwIP/eVcHY=;
 b=vrhBOWZhvARQhHpbBjGsdwxYi+G62R58n4iB7T1DMDigabxBsgwwcgnRGC5KRXCh/SThZtdBwe7yHEdPI6KNVpvcN4BBzrB/Wd5Ci5SlXKenWHOq0zv43Bpl+iWod77aAjoHhxnRNJCRh4sa14BWJh9iZ8bifBb15Z6WfgQeKUF0hD1W6UnHUZX+QkfnnYTm/g8m2JcpwdlaYMMNsfQ8w2rc1jefoF6a/gkRtNnIYuH35FAv9kwhsHIqwCYXmzk8PvyLIxA0wztk7ikaA4pZ4iryJLRIB4hje7fJ2243WrqaHM7XVqES8pi4jNOsztn7cVpqSHBF47mdGVbVyjHGzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gT970ZOYFQT/xyfFx4MUIDmWCumuP9PWfwIP/eVcHY=;
 b=UrClerNH74oyyLPBe1GXS3zhPdo4G1Hprhht9MJQIpjxkI9XluVRVdWAezC8en/5IRGnMn+noY3cCoLQqbKJ1Z1uSmbFYHIhO/J8hMFXM9cvFz7BmUOxliXDwvPajgyB+V/zdKdIhUiB7E/ZeuxcP8RqwJbec4sA7u+rrHfzGqY=
Received: from CWLP123CA0206.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19d::8)
 by AS8PR08MB7910.eurprd08.prod.outlook.com (2603:10a6:20b:50b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 08:47:12 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:400:19d:cafe::9f) by CWLP123CA0206.outlook.office365.com
 (2603:10a6:400:19d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Mon,
 21 Jul 2025 08:47:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 08:47:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HuxaCyROYQNH8FHuELeqKJPTGmOeBT485E58hEa70C6ADeKqavG1mqu4lqlpgHJtbn4dTBvXTF8kwr4GdIxjbVfHBqIojqoYvBpTpMbZj/B7mk7UE1WTyoQA7NHItM8xlINY4rgI02SQn7Gk4F+OOPjA3Xy/g99GllntozcVQVTP6adKq2jLnwXIs8403lvyQvf3rrE/lCIn+qfB1LpUZD/cK9+DPfquNYeRcuAw1twRkE61rXGX/mJLidZ6t8t1fW/lurnPmkDARgsJ2oe491w+l+vU2QGTJm839OjyQSI04oD1cF0k7NLuU5aFGxqif3x3x3b8aUy5LwDIGAUevA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gT970ZOYFQT/xyfFx4MUIDmWCumuP9PWfwIP/eVcHY=;
 b=X8RdkJkJaIuqWEQZW6iftWsXtByBAw01g06BKmF40URbqH2XTiiOmUt/fZvssk0tXCmYdH62LY2LJemIsIZx1jZL+Bj2PNXdJ+fkR4331lu4YlQmwJPIXzo+JilhiP/BKjADkBxma0jv1vF3CXnc5j8P2nL9NhE/pd87BYy0j9zAaXyVfDvB1+JTPOxwAVaa2a7M1W38j7kFae2Guk01DdeRFy5TFAaU4HOgcz2PNbMfPDLtUxdtnNvPhxcOf5+uDhbKUaHxuJ8NO8aYly5ZqJG4GZZobxqItl0qxeTBpkSHkUALnJFBsPhFCmTDzXWkg3PktNBcvWGXNKl9urb5vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gT970ZOYFQT/xyfFx4MUIDmWCumuP9PWfwIP/eVcHY=;
 b=UrClerNH74oyyLPBe1GXS3zhPdo4G1Hprhht9MJQIpjxkI9XluVRVdWAezC8en/5IRGnMn+noY3cCoLQqbKJ1Z1uSmbFYHIhO/J8hMFXM9cvFz7BmUOxliXDwvPajgyB+V/zdKdIhUiB7E/ZeuxcP8RqwJbec4sA7u+rrHfzGqY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by PR3PR08MB5674.eurprd08.prod.outlook.com (2603:10a6:102:81::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Mon, 21 Jul
 2025 08:46:38 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0%4]) with mapi id 15.20.8943.024; Mon, 21 Jul 2025
 08:46:38 +0000
Message-ID: <e2c2e52c-942f-46c0-b937-a02daafdb798@arm.com>
Date: Mon, 21 Jul 2025 09:46:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/panthor: Add performance counter uAPI
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>
References: <cover.1747148172.git.lukas.zapolskas@arm.com>
 <654f9c0b60ff6af813b901538b74b67685ce99a5.1747148172.git.lukas.zapolskas@arm.com>
 <ntqrmozyndcn5t3zt2yxji527svd46onjxjghfnriece42ehwr@43vemmmtnvql>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <ntqrmozyndcn5t3zt2yxji527svd46onjxjghfnriece42ehwr@43vemmmtnvql>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0215.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::15) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|PR3PR08MB5674:EE_|AMS1EPF00000044:EE_|AS8PR08MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 32bcae00-a06f-4adc-f3aa-08ddc8332eb0
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?YlE3b0tVU3JvRkNhazV2UlNwN05HZ0dMa3lVdnNxd0Y0WU1BS2FEcFo4Z1pp?=
 =?utf-8?B?cFhBWTFqb0wvL0JJNXFPMzcvS09YdHhheWZUdFhtUU1zeDV1akpxQzNDRG9M?=
 =?utf-8?B?RnkrbmFZVUx1RTJNbmRPZHdZT055cml2dFhGZE1vV1lMK2pxeHZUZE1QWFVU?=
 =?utf-8?B?Q1IzMHRqcjUxdENsS2M5QWl6WmJaYnBRL3dzenEzYURMZURrWWVxY3hXME1B?=
 =?utf-8?B?dHJUdFBKNWtnZHFEeUpSaUhKbjlrbEdRNHQzNkhURWlJYldUYndSWVBVRTNT?=
 =?utf-8?B?ajRUK2VYdVlhYWRib2lOVUNLQXczZGRqRytWMUdaa2hvN05iRzNVbHV5SHh3?=
 =?utf-8?B?UEJyUEV5S3VJZEdURmx3RTh0eGdlc09FMWhtU1h3a2xCNC9XZVk2eDd3T0lS?=
 =?utf-8?B?RnoyVnlCelNQWVcrdU82N3pyczJmeUxMcXZiQ0QzQTl2QkZIMEtUSUxYRVRq?=
 =?utf-8?B?WkVuTkRVeVlYK0NkaXNIa2RKak9lSFkvVDljK3dpOXdPRHBrRCs4dGErY2Uv?=
 =?utf-8?B?YzhBZHBwVDFhaW5XK0tVNC9qRjJrSXlXWFpCM0t0b3Y4VGE1RUNUVW16MU54?=
 =?utf-8?B?VWg2d1pDdFFjR1dieGttSTNnRlNiMDR0SFZrU2xKVGhEaUF5UzBkZXRPYkhI?=
 =?utf-8?B?eCt0MUg3TTdmMWZLVHJLcjNPQ1pIU095QzBvZ3NVZW90cFBCLytXejZMZ09N?=
 =?utf-8?B?OXU3VXFwakxYQ0RlRlRwSENHeDNYcG12LzB4S2d5RlVtcmJ4Tkl5aWh5UjRn?=
 =?utf-8?B?MkpFSlZZNGVrRzNKRnhzYUgyUWhEZDhSOUZpL0FJc0ZTMHdWdUlQNHY1QjUr?=
 =?utf-8?B?b00yWkl2OGE5U294TTFJWUtCWWtzaW96YVcrSTIyNm1JMEVnelVjNUxiRlcy?=
 =?utf-8?B?NTNOaE1Ub2xlUkg1UFlmVXk5RjdaaGpCeUR1U1VuazVQNHRHdG5tTVFZZVc1?=
 =?utf-8?B?eDBwNVdZUWdHaUEwem5nK3V1anNlMjBISWVXRkVmekFOZnRXalZPUFBnN2lp?=
 =?utf-8?B?WnFVSGZNbWpOa29LcStTbmVqWnU1cXlJK09XTzlnVVNwZjRKYWREYVhoaXN5?=
 =?utf-8?B?RHRTNFJpVEQ5MFRaeWdSSnQzcUdleDY1SWxSa2RGYllkOWtibE9SQlJMQ1Er?=
 =?utf-8?B?OVgyOExzY1BDaWc5bC9CdzNRbnZLY2dZN2twZDZPcXBBV09ldGhyd3VMeFdn?=
 =?utf-8?B?aW5xZ3ZibVdBMGR4a00zWjlRdUc0U3F6RWNLaE11S1ltTDhoeTVmOW9UZ0hD?=
 =?utf-8?B?ckJSOFc0bUM5WnRySkZrYXdkakU1TEFEYThCNWg4MzI1N2RIM0hHaS9oUUdw?=
 =?utf-8?B?SWg4dkxyaCtBcmZ6dDh5Y2t2Q3hSZEtmVGRDNVg0M0Q0NDNsSUJnbXhwMDY2?=
 =?utf-8?B?bDZnYXpmWDhBMzFxR280ckhvMmE0RU9pYlBLL29DUFArQVN2eGR3S3I3Lzk3?=
 =?utf-8?B?QVlyN1JURi83S2g1TzdBbHF3SWJBVURNR2VhSHhmN2U5SlVYSWNDaUJVcTY2?=
 =?utf-8?B?TG1jVlFma0VxUmtNZUVyMVp3VElJbnVrMitVVytPUm1kUVhIY1NLL280bkdD?=
 =?utf-8?B?Y0dBWHc3RXh6TzhHVHZUc0tkWHdNYU1FNWdBb21ZTTJvUWs4M0lDRHJ3VUx6?=
 =?utf-8?B?NDg5ZVVwU3dFSm5ZVnhkTGtOMFlZbkVjZFd3UUlSSlpobWdaMW9xWThEUmxB?=
 =?utf-8?B?Ly9xVG9qQ0QrZWl6VDhDS2Rhc3kxVjIvMmlIUXNOUmNYbnlQTFJ4ZUhFaUhO?=
 =?utf-8?B?d2pBc0RrNlJPb0tVMkgyamQ0aC8xd1o0b0dmY002bjEzdWwvYWJkWmJYbXY5?=
 =?utf-8?B?cVdJMDIrRUNFVTQvZEpXTVVGWVVablUyZkdMVjRBSmY4RFhvUmFZVXZlQzhR?=
 =?utf-8?B?b0tLUi95UEtjc3ErejJZR25nZmVOUUJtRzhyOGI5amlub2pIYng5S0oxMkRK?=
 =?utf-8?Q?iSiaC1wNC8I=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5674
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1d79294d-2ba4-4732-6f48-08ddc8331b62
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|14060799003|36860700013|35042699022|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzdReFJ2RktjcEtRTTVaZmp3S2pJVDhmVXpmdERZUDloODRaRGNJMjRTVmVk?=
 =?utf-8?B?cnh0NXRSbUxzTVg1eHhZaWNaU1VBa3JRTys3SzRzVW5KQjFLMWw5cFBsSVhN?=
 =?utf-8?B?aGRTNDhNL1VWbjFmRDNLWU1YMkdQTFdFS0NRTU9UZDdicnlMZ2FxUFpwaHR4?=
 =?utf-8?B?NWg0MzBrZU5RQ2hCYWFNODhZUmwzWENqZWl5ZkZIRzdzei9uMCs5YmV5L1NU?=
 =?utf-8?B?dHA5MTZwRWlFTWcyZXYvWG9ueVFURlpCa2Nna201bUhINU43UjQxbC85M1dw?=
 =?utf-8?B?RXdoSjROL3JVZXZWQmswQUZHNjZ0TXkvU3pCTUpFTlJNVG56bXIrbkh3ZjBC?=
 =?utf-8?B?ckZVTWVtUkc4Z3hKTUV1alFDMkFPLzUrWit3QWxSVXMxTzYrdko5c3ZsbzlC?=
 =?utf-8?B?VFdBMUNCYkdIekc3dDZRWDgzc0hDSmJ1Qk5LZmJJRTZRSEc0U1UzR2NEc2RJ?=
 =?utf-8?B?ajVqakNDN3UxZEtETkI2TExqNmhyWkdXQXh0Vm5ac1FNbnZ5NHRwbTN4L0hY?=
 =?utf-8?B?Vi9mSERyeDZFWmhZOGNqZm0vbmtuUnBPZEtYSmU2cTRySnNrYitvZWJqdFdH?=
 =?utf-8?B?MXZXK3U3YjZVNndVVXphOU5FcjNERGZwQ0NMa09aM3UrLytyZ09RUWo3ZS82?=
 =?utf-8?B?T2tFSjcxNHZvTXlzZ09rK2JSVVRNQ3lLa1N1cDg4b3lYYkpmYjRLbkRSSkEy?=
 =?utf-8?B?aEdYMnFPc3FseEZ6MVhESk1uSkx3eDJWRm1TM1N5aEJabFI2Z1RybExVVUQr?=
 =?utf-8?B?bU1teVFjalU4VVcweko4MUIxb1dqNmpVU1VGaWFjVjhlUWpreFZ4MEpCU3RR?=
 =?utf-8?B?OGJ3UmdKMGR2azY2akhPc1lDTldKeFZldVdJdzc4bExpNEc3UVJzUHhQa25V?=
 =?utf-8?B?R1hPUFFuekpyVDd6UjR1MEpIWFVOZDFmNGdSWGZXZm50dzRRZmJKTkY2Y3lN?=
 =?utf-8?B?MFEvTGd4N1ZtSFl3VEJZRFRmWFFIa05Mb3hKU2RINVNxOGlrN2JGeFFKZVox?=
 =?utf-8?B?T0RCVnBTcmJoRXVOdlAzMjRWNHZHaXVidlJDczhocGtIYVhmWlA2UG96Y05p?=
 =?utf-8?B?ZkdJYUp2THBNMGN1c3NBSlJGQklNTE0wMXMvRkZpdC8ydlk0K2pUdW03MmZ3?=
 =?utf-8?B?S1owWERyRXE2NktheGhXMk5Sa2MrVHRqUzJCVWxoVmtjdE0wamwzaXlWVVNZ?=
 =?utf-8?B?b0FHdC9tZ205T1E5YVQ4UVVPaWJOUFFoeVo2dE03ZUdIVThFQlNmRHJRNk1N?=
 =?utf-8?B?V0xUWktuSWljWjArYy96V082SVBTVUZTT3A0NWhrN2J6Y0NsbHNVaXp4elFa?=
 =?utf-8?B?UVcyd2JUUmQyY2UrLzMrMTFtbXBBdk8rSXJFdW9vVloyWUpZWUZQb3NQNnMv?=
 =?utf-8?B?L1BsMjdWbkdTTUxwbXVKT3N1cjJtYUxKdjFTMU11YlpwKzdjUjc5cDdvdEhX?=
 =?utf-8?B?VGlmaFArRUNZNkloZ1pIM2w5cjBCR3F1b0xjbk5aYlRUckZIcDVla1VhT04z?=
 =?utf-8?B?Y3VHUWxHbWtFdy9CZlc0NC8wZFNrNFBBSkgzUVYrQk5sZTFzMEwwRisrZGxD?=
 =?utf-8?B?SE9lMFdRZXYvdmRxZXJQSHlibG1xb3hKUWp2SG80ZEhxZFVkZ0JpcjF6Um9R?=
 =?utf-8?B?L2ZNaDhqTW5iZmxadjdZQ2k2N3VtOENVcFoxRWVwZzNYbDFLeDZMOExVWklZ?=
 =?utf-8?B?SktIU2dUL2xFelk3U1Y0Q0Q5VVRFSE1aSVpOUjF2dHFBS1dNU3F1MFBUeDBW?=
 =?utf-8?B?YThZd1ZDeXRnYldRZkJqWFFxaWJQdFpPajlkZWwreVN0MUNRak1vTWlDdEVx?=
 =?utf-8?B?a0Y1WjRSa01Fa0R6Z0czdG1CeGhXT3NCRnlTN25wS1JXUFdDbldGRG5YOFhj?=
 =?utf-8?B?VlJyUVdqNVdxSzV2bEpTU2FscWhGcmFLUXNMa1lFSXhmU2hWR3UxNzNJSSsr?=
 =?utf-8?B?RmJSdUJ0OXNJc2ZqbGR3QTBQM01IUmpWTVVCcCtSUVNrc1lFZDlXUFNMVGRC?=
 =?utf-8?B?WUVQRVpUUmtzaWR4dHJVN0sySVFva2wzZGRZbVVvd0JSZThvSWhCTStORUlK?=
 =?utf-8?B?WTZvUS9idFAxNjdMQkNZTEU5OTlqWXlLbHVYZz09?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(14060799003)(36860700013)(35042699022)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 08:47:10.7606 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32bcae00-a06f-4adc-f3aa-08ddc8332eb0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7910
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

Hello Adrián,

Thanks for taking a look! 


On 18/07/2025 03:43, Adrián Larumbe wrote:
> Hi Lucas,
> 
> On 16.05.2025 16:49, Lukas Zapolskas wrote:
>> This patch extends the DEV_QUERY ioctl to return information about the
>> performance counter setup for userspace, and introduces the new
>> ioctl DRM_PANTHOR_PERF_CONTROL in order to allow for the sampling of
>> performance counters.
>>
>> The new design is inspired by the perf aux ringbuffer, with the insert
>> and extract indices being mapped to userspace, allowing multiple samples
>> to be exposed at any given time. To avoid pointer chasing, the sample
>> metadata and block metadata are inline with the elements they
>> describe.
> 
> Is the perf aux ringbuffer something internal to ARM's DDK?
> 

I'm referring to the in-tree perf tool, which has its ring buffer
design documented here [0].

>> Userspace is responsible for passing in resources for samples to be
>> exposed, including the event file descriptor for notification of new
>> sample availability, the ringbuffer BO to store samples, and the
>> control BO along with the offset for mapping the insert and extract
>> indices. Though these indices are only a total of 8 bytes, userspace
>> can then reuse the same physical page for tracking the state of
>> multiple buffers by giving different offsets from the BO start to
>> map them.
>>
>> Co-developed-by: Mihail Atanassov <mihail.atanassov@arm.com>
>> Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
>> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
>> ---
>>  include/uapi/drm/panthor_drm.h | 565 +++++++++++++++++++++++++++++++++
>>  1 file changed, 565 insertions(+)
>>
>> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
>> index 97e2c4510e69..a74eabcabbcb 100644
>> --- a/include/uapi/drm/panthor_drm.h
>> +++ b/include/uapi/drm/panthor_drm.h
>> @@ -127,6 +127,9 @@ enum drm_panthor_ioctl_id {
>>
>>  	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
>>  	DRM_PANTHOR_TILER_HEAP_DESTROY,
>> +
>> +	/** @DRM_PANTHOR_PERF_CONTROL: Control a performance counter session. */
>> +	DRM_PANTHOR_PERF_CONTROL,
>>  };
>>
>>  /**
>> @@ -226,6 +229,9 @@ enum drm_panthor_dev_query_type {
>>  	 * @DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO: Query allowed group priorities information.
>>  	 */
>>  	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
>> +
>> +	/** @DRM_PANTHOR_DEV_QUERY_PERF_INFO: Query performance counter interface information. */
>> +	DRM_PANTHOR_DEV_QUERY_PERF_INFO,
>>  };
>>
>>  /**
>> @@ -379,6 +385,135 @@ struct drm_panthor_group_priorities_info {
>>  	__u8 pad[3];
>>  };
>>
>> +/**
>> + * enum drm_panthor_perf_feat_flags - Performance counter configuration feature flags.
>> + */
>> +enum drm_panthor_perf_feat_flags {
>> +	/** @DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT: Coarse-grained block states are supported. */
>> +	DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT = 1 << 0,
>> +};
>> +
>> +/**
>> + * enum drm_panthor_perf_block_type - Performance counter supported block types.
>> + */
>> +enum drm_panthor_perf_block_type {
>> +	/** @DRM_PANTHOR_PERF_BLOCK_METADATA: Internal use only. */
>> +	DRM_PANTHOR_PERF_BLOCK_METADATA = 0,
>> +
>> +	/** @DRM_PANTHOR_PERF_BLOCK_FW: The FW counter block. */
>> +	DRM_PANTHOR_PERF_BLOCK_FW,
>> +
>> +	/** @DRM_PANTHOR_PERF_BLOCK_CSHW: The CSHW counter block. */
>> +	DRM_PANTHOR_PERF_BLOCK_CSHW,
>> +
>> +	/** @DRM_PANTHOR_PERF_BLOCK_TILER: The tiler counter block. */
>> +	DRM_PANTHOR_PERF_BLOCK_TILER,
>> +
>> +	/** @DRM_PANTHOR_PERF_BLOCK_MEMSYS: A memsys counter block. */
>> +	DRM_PANTHOR_PERF_BLOCK_MEMSYS,
>> +
>> +	/** @DRM_PANTHOR_PERF_BLOCK_SHADER: A shader core counter block. */
>> +	DRM_PANTHOR_PERF_BLOCK_SHADER,
>> +
>> +	/** @DRM_PANTHOR_PERF_BLOCK_FIRST: Internal use only. */
>> +	DRM_PANTHOR_PERF_BLOCK_FIRST = DRM_PANTHOR_PERF_BLOCK_FW,
>> +
>> +	/** @DRM_PANTHOR_PERF_BLOCK_LAST: Internal use only. */
>> +	DRM_PANTHOR_PERF_BLOCK_LAST = DRM_PANTHOR_PERF_BLOCK_SHADER,
>> +
>> +	/** @DRM_PANTHOR_PERF_BLOCK_MAX: Internal use only. */
>> +	DRM_PANTHOR_PERF_BLOCK_MAX = DRM_PANTHOR_PERF_BLOCK_LAST + 1,
>> +};
>> +
>> +/**
>> + * enum drm_panthor_perf_clock - Identifier of the clock used to produce the cycle count values
>> + * in a given block.
>> + *
>> + * Since the integrator has the choice of using one or more clocks, there may be some confusion
>> + * as to which blocks are counted by which clock values unless this information is explicitly
>> + * provided as part of every block sample. Not every single clock here can be used: in the simplest
>> + * case, all cycle counts will be associated with the top-level clock.
>> + */
>> +enum drm_panthor_perf_clock {
>> +	/** @DRM_PANTHOR_PERF_CLOCK_TOPLEVEL: Top-level CSF clock. */
>> +	DRM_PANTHOR_PERF_CLOCK_TOPLEVEL,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_CLOCK_COREGROUP: Core group clock, responsible for the MMU, L2
>> +	 * caches and the tiler.
>> +	 */
>> +	DRM_PANTHOR_PERF_CLOCK_COREGROUP,
>> +
>> +	/** @DRM_PANTHOR_PERF_CLOCK_SHADER: Clock for the shader cores. */
>> +	DRM_PANTHOR_PERF_CLOCK_SHADER,
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_info - Performance counter interface information
>> + *
>> + * Structure grouping all queryable information relating to the performance counter
>> + * interfaces.
>> + */
>> +struct drm_panthor_perf_info {
>> +	/**
>> +	 * @counters_per_block: The number of 8-byte counters available in a block.
>> +	 */
>> +	__u32 counters_per_block;
>> +
>> +	/**
>> +	 * @sample_header_size: The size of the header struct available at the beginning
>> +	 * of every sample.
>> +	 */
>> +	__u32 sample_header_size;
>> +
>> +	/**
>> +	 * @block_header_size: The size of the header struct inline with the counters for a
>> +	 * single block.
>> +	 */
>> +	__u32 block_header_size;
>> +
>> +	/**
>> +	 * @sample_size: The size of a fully annotated sample, starting with a sample header
>> +	 *               of size @sample_header_size bytes, and all available blocks for the current
>> +	 *               configuration, each comprised of @counters_per_block 64-bit counters and
>> +	 *               a block header of @block_header_size bytes.
>> +	 *
>> +	 *               The user must use this field to allocate size for the ring buffer. In
>> +	 *               the case of new blocks being added, an old userspace can always use
>> +	 *               this field and ignore any blocks it does not know about.
>> +	 */
>> +	__u32 sample_size;
> 
> I might've asked this question in a previous review, but couldn't user space easily calculate
> the sample size with sample_header_size + block_header_size*(?_blocks) + (?_blocks)*counters_per_block ?
> 

It can if the versions of the userspace and the kernel are in lockstep. In the case of an old userspace 
and a newer kernel, we can have a new field added to the end of this struct, and the user would not 
know how to interpret this. In that case, the user could not successfully create a new session.

>> +	/** @flags: Combination of drm_panthor_perf_feat_flags flags. */
>> +	__u32 flags;
>> +
>> +	/**
>> +	 * @supported_clocks: Bitmask of the clocks supported by the GPU.
>> +	 *
>> +	 * Each bit represents a variant of the enum drm_panthor_perf_clock.
>> +	 *
>> +	 * For the same GPU, different implementers may have different clocks for the same hardware
>> +	 * block. At the moment, up to four clocks are supported, and any clocks that are present
>> +	 * will be reported here.
> 
> However, there seems to be just three clocks in in the drm_panthor_perf_clock enum definition.
> 

Thanks for pointing that out! Need to clean this up.

> t> +	 */
>> +	__u32 supported_clocks;
>> +
>> +	/** @fw_blocks: Number of FW blocks available. */
>> +	__u32 fw_blocks;
>> +
>> +	/** @cshw_blocks: Number of CSHW blocks available. */
>> +	__u32 cshw_blocks;
>> +
>> +	/** @tiler_blocks: Number of tiler blocks available. */
>> +	__u32 tiler_blocks;
>> +
>> +	/** @memsys_blocks: Number of memsys blocks available. */
>> +	__u32 memsys_blocks;
>> +
>> +	/** @shader_blocks: Number of shader core blocks available. */
>> +	__u32 shader_blocks;
>> +};
>> +
>>  /**
>>   * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
>>   */
>> @@ -977,6 +1112,434 @@ struct drm_panthor_tiler_heap_destroy {
>>  	__u32 pad;
>>  };
>>
>> +/**
>> + * DOC: Performance counter decoding in userspace.
>> + *
>> + * Each sample will be exposed to userspace in the following manner:
>> + *
>> + * +--------+--------+------------------------+--------+-------------------------+-----+
>> + * | Sample | Block  |        Block           | Block  |         Block           | ... |
>> + * | header | header |        counters        | header |         counters        |     |
>> + * +--------+--------+------------------------+--------+-------------------------+-----+
>> + *
>> + * Each sample will start with a sample header of type @struct drm_panthor_perf_sample header,
>> + * providing sample-wide information like the start and end timestamps, the counter set currently
>> + * configured, and any errors that may have occurred during sampling.
>> + *
>> + * After the fixed size header, the sample will consist of blocks of
>> + * 64-bit @drm_panthor_dev_query_perf_info::counters_per_block counters, each prefaced with a
>> + * header of its own, indicating source block type, as well as the cycle count needed to normalize
>> + * cycle values within that block, and a clock source identifier.
>> + */
>> +
>> +/**
>> + * enum drm_panthor_perf_block_state - Bitmask of the power and execution states that an individual
>> + * hardware block went through in a sampling period.
>> + *
>> + * Because the sampling period is controlled from userspace, the block may undergo multiple
>> + * state transitions, so this must be interpreted as one or more such transitions occurring.
>> + */
>> +enum drm_panthor_perf_block_state {
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN: The state of this block was unknown during
>> +	 * the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN = 0,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_ON: This block was powered on for some or all of
>> +	 * the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_ON = 1 << 0,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_OFF: This block was powered off for some or all of the
>> +	 * sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_OFF = 1 << 1,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE: This block was available for execution for
>> +	 * some or all of the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE = 1 << 2,
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE: This block was unavailable for execution for
>> +	 * some or all of the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE = 1 << 3,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL: This block was executing in normal mode
>> +	 * for some or all of the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL = 1 << 4,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED: This block was executing in protected mode
>> +	 * for some or all of the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED = 1 << 5,
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_block_header - Header present before every block in the
>> + * sample ringbuffer.
>> + */
>> +struct drm_panthor_perf_block_header {
>> +	/** @block_type: Type of the block. */
>> +	__u8 block_type;
>> +
>> +	/** @block_idx: Block index. */
>> +	__u8 block_idx;
>> +
>> +	/**
>> +	 * @block_states: Coarse-grained block transitions, bitmask of enum
>> +	 * drm_panthor_perf_block_states.
>> +	 */
>> +	__u8 block_states;
>> +
>> +	/**
>> +	 * @clock: Clock used to produce the cycle count for this block, taken from
>> +	 * enum drm_panthor_perf_clock. The cycle counts are stored in the sample header.
>> +	 */
>> +	__u8 clock;
>> +
>> +	/** @pad: MBZ. */
>> +	__u8 pad[4];
>> +
>> +	/** @enable_mask: Bitmask of counters requested during the session setup. */
>> +	__u64 enable_mask[2];
>> +};
>> +
>> +/**
>> + * enum drm_panthor_perf_sample_flags - Sample-wide events that occurred over the sampling
>> + * period.
>> + */
>> +enum drm_panthor_perf_sample_flags {
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_SAMPLE_OVERFLOW: This sample contains overflows due to the duration
>> +	 * of the sampling period.
>> +	 */
>> +	DRM_PANTHOR_PERF_SAMPLE_OVERFLOW = 1 << 0,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_SAMPLE_ERROR: This sample encountered an error condition during
>> +	 * the sample duration.
>> +	 */
>> +	DRM_PANTHOR_PERF_SAMPLE_ERROR = 1 << 1,
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_sample_header - Header present before every sample.
>> + */
>> +struct drm_panthor_perf_sample_header {
>> +	/**
>> +	 * @timestamp_start_ns: Earliest timestamp that values in this sample represent, in
>> +	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
>> +	 */
>> +	__u64 timestamp_start_ns;
>> +
>> +	/**
>> +	 * @timestamp_end_ns: Latest timestamp that values in this sample represent, in
>> +	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
>> +	 */
>> +	__u64 timestamp_end_ns;
>> +
>> +	/** @block_set: Set of performance counter blocks. */
>> +	__u8 block_set;
>> +
>> +	/** @pad: MBZ. */
>> +	__u8 pad[3];
>> +
>> +	/** @flags: Current sample flags, combination of drm_panthor_perf_sample_flags. */
>> +	__u32 flags;
>> +
>> +	/**
>> +	 * @user_data: User data provided as part of the command that triggered this sample.
>> +	 *
>> +	 * - Automatic samples (periodic ones or those around non-counting periods or power state
>> +	 * transitions) will be tagged with the user_data provided as part of the
>> +	 * DRM_PANTHOR_PERF_COMMAND_START call.
>> +	 * - Manual samples will be tagged with the user_data provided with the
>> +	 * DRM_PANTHOR_PERF_COMMAND_SAMPLE call.
>> +	 * - A session's final automatic sample will be tagged with the user_data provided with the
>> +	 * DRM_PANTHOR_PERF_COMMAND_STOP call.
>> +	 */
>> +	__u64 user_data;
>> +
>> +	/**
>> +	 * @toplevel_clock_cycles: The number of cycles elapsed between
>> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
>> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the top-level clock if the
>> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
>> +	 */
>> +	__u64 toplevel_clock_cycles;
>> +
>> +	/**
>> +	 * @coregroup_clock_cycles: The number of cycles elapsed between
>> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
>> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the coregroup clock if the
>> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
>> +	 */
>> +	__u64 coregroup_clock_cycles;
>> +
>> +	/**
>> +	 * @shader_clock_cycles: The number of cycles elapsed between
>> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
>> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the shader core clock if the
>> +	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
>> +	 */
>> +	__u64 shader_clock_cycles;
>> +};
>> +
>> +/**
>> + * enum drm_panthor_perf_command - Command type passed to the DRM_PANTHOR_PERF_CONTROL
>> + * IOCTL.
>> + */
>> +enum drm_panthor_perf_command {
>> +	/** @DRM_PANTHOR_PERF_COMMAND_SETUP: Create a new performance counter sampling context. */
>> +	DRM_PANTHOR_PERF_COMMAND_SETUP,
>> +
>> +	/** @DRM_PANTHOR_PERF_COMMAND_TEARDOWN: Teardown a performance counter sampling context. */
>> +	DRM_PANTHOR_PERF_COMMAND_TEARDOWN,
>> +
>> +	/** @DRM_PANTHOR_PERF_COMMAND_START: Start a sampling session on the indicated context. */
>> +	DRM_PANTHOR_PERF_COMMAND_START,
>> +
>> +	/** @DRM_PANTHOR_PERF_COMMAND_STOP: Stop the sampling session on the indicated context. */
>> +	DRM_PANTHOR_PERF_COMMAND_STOP,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_COMMAND_SAMPLE: Request a manual sample on the indicated context.
>> +	 *
>> +	 * When the sampling session is configured with a non-zero sampling frequency, any
>> +	 * DRM_PANTHOR_PERF_CONTROL calls with this command will be ignored and return an
>> +	 * -EINVAL.
>> +	 */
>> +	DRM_PANTHOR_PERF_COMMAND_SAMPLE,
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_control - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL.
>> + */
>> +struct drm_panthor_perf_control {
>> +	/** @cmd: Command from enum drm_panthor_perf_command. */
>> +	__u32 cmd;
>> +
>> +	/**
>> +	 * @handle: session handle.
>> +	 *
>> +	 * Returned by the DRM_PANTHOR_PERF_COMMAND_SETUP call.
>> +	 * It must be used in subsequent commands for the same context.
>> +	 */
>> +	__u32 handle;
>> +
>> +	/**
>> +	 * @size: size of the command structure.
>> +	 *
>> +	 * If the pointer is NULL, the size is updated by the driver to provide the size of the
>> +	 * output structure. If the pointer is not NULL, the driver will only copy min(size,
>> +	 * struct_size) to the pointer and update the size accordingly.
>> +	 */
>> +	__u64 size;
>> +
>> +	/**
>> +	 * @pointer: user pointer to a command type struct, such as
>> +	 *            @struct drm_panthor_perf_cmd_start.
>> +	 */
>> +	__u64 pointer;
>> +};
>> +
>> +/**
>> + * enum drm_panthor_perf_counter_set - The counter set to be requested from the hardware.
>> + *
>> + * The hardware supports a single performance counter set at a time, so requesting any set other
>> + * than the primary may fail if another process is sampling at the same time.
>> + *
>> + * If in doubt, the primary counter set has the most commonly used counters and requires no
>> + * additional permissions to open.
>> + */
>> +enum drm_panthor_perf_counter_set {
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_SET_PRIMARY: The default set configured on the hardware.
>> +	 *
>> +	 * This is the only set for which all counters in all blocks are defined.
>> +	 */
>> +	DRM_PANTHOR_PERF_SET_PRIMARY,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_SET_SECONDARY: The secondary performance counter set.
>> +	 *
>> +	 * Some blocks may not have any defined counters for this set, and the block will
>> +	 * have the UNAVAILABLE block state permanently set in the block header.
>> +	 *
>> +	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
>> +	 */
>> +	DRM_PANTHOR_PERF_SET_SECONDARY,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_SET_TERTIARY: The tertiary performance counter set.
>> +	 *
>> +	 * Some blocks may not have any defined counters for this set, and the block will have
>> +	 * the UNAVAILABLE block state permanently set in the block header. Note that the
>> +	 * tertiary set has the fewest defined counter blocks.
>> +	 *
>> +	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
>> +	 */
>> +	DRM_PANTHOR_PERF_SET_TERTIARY,
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_ringbuf_control - Struct used to map in the ring buffer control indices
>> + *                                           into memory shared between user and kernel.
>> + *
>> + */
>> +struct drm_panthor_perf_ringbuf_control {
>> +	/**
>> +	 * @extract_idx: The index of the latest sample that was processed by userspace. Only
>> +	 *               modifiable by userspace.
>> +	 */
>> +	__u64 extract_idx;
>> +
>> +	/**
>> +	 * @insert_idx: The index of the latest sample emitted by the kernel. Only modiable by
>> +	 *               modifiable by the kernel.
>> +	 */
>> +	__u64 insert_idx;
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_cmd_setup - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
>> + * when the DRM_PANTHOR_PERF_COMMAND_SETUP command is specified.
>> + */
>> +struct drm_panthor_perf_cmd_setup {
>> +	/**
>> +	 * @block_set: Set of performance counter blocks, member of
>> +	 *             enum drm_panthor_perf_block_set.
>> +	 *
>> +	 * This is a global configuration and only one set can be active at a time. If
>> +	 * another client has already requested a counter set, any further requests
>> +	 * for a different counter set will fail and return an -EBUSY.
>> +	 *
>> +	 * If the requested set does not exist, the request will fail and return an -EINVAL.
>> +	 *
>> +	 * Some sets have additional requirements to be enabled, and the setup request will
>> +	 * fail with an -EACCES if these requirements are not satisfied.
>> +	 */
>> +	__u8 block_set;
>> +
>> +	/** @pad: MBZ. */
>> +	__u8 pad[7];
>> +
>> +	/** @fd: eventfd for signalling the availability of a new sample. */
>> +	__u32 fd;
>> +
>> +	/** @ringbuf_handle: Handle to the BO to write perf counter sample to. */
>> +	__u32 ringbuf_handle;
>> +
>> +	/**
>> +	 * @control_handle: Handle to the BO containing a contiguous 16 byte range, used for the
>> +	 * insert and extract indices for the ringbuffer.
>> +	 */
>> +	__u32 control_handle;
>> +
>> +	/**
>> +	 * @sample_slots: The number of slots available in the userspace-provided BO. Must be
>> +	 * a power of 2.
>> +	 *
>> +	 * If sample_slots * sample_size does not match the BO size, the setup request will fail.
>> +	 */
>> +	__u32 sample_slots;
>> +
>> +	/**
>> +	 * @control_offset: Offset into the control BO where the insert and extract indices are
>> +	 * located.
>> +	 */
>> +	__u64 control_offset;
>> +
>> +	/**
>> +	 * @sample_freq_ns: Period between automatic counter sample collection in nanoseconds. Zero
>> +	 * disables automatic collection and all collection must be done through explicit calls
>> +	 * to DRM_PANTHOR_PERF_CONTROL.SAMPLE. Non-zero values will disable manual counter sampling
>> +	 * via the DRM_PANTHOR_PERF_COMMAND_SAMPLE command.
>> +	 *
>> +	 * This disables software-triggered periodic sampling, but hardware will still trigger
>> +	 * automatic samples on certain events, including shader core power transitions, and
>> +	 * entries to and exits from non-counting periods. The final stop command will also
>> +	 * trigger a sample to ensure no data is lost.
>> +	 */
>> +	__u64 sample_freq_ns;
>> +
>> +	/**
>> +	 * @fw_enable_mask: Bitmask of counters to request from the FW counter block. Any bits
>> +	 * past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit 0
>> +	 * corresponds to counter 0.
>> +	 */
>> +	__u64 fw_enable_mask[2];
>> +
>> +	/**
>> +	 * @cshw_enable_mask: Bitmask of counters to request from the CSHW counter block. Any bits
>> +	 * past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit 0
>> +	 * corresponds to counter 0.
>> +	 */
>> +	__u64 cshw_enable_mask[2];
>> +
>> +	/**
>> +	 * @tiler_enable_mask: Bitmask of counters to request from the tiler counter block. Any
>> +	 * bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit
>> +	 * 0 corresponds to counter 0.
>> +	 */
>> +	__u64 tiler_enable_mask[2];
>> +
>> +	/**
>> +	 * @memsys_enable_mask: Bitmask of counters to request from the memsys counter blocks. Any
>> +	 * bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit 0
>> +	 * corresponds to counter 0.
>> +	 */
>> +	__u64 memsys_enable_mask[2];
>> +
>> +	/**
>> +	 * @shader_enable_mask: Bitmask of counters to request from the shader core counter blocks.
>> +	 * Any bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
>> +	 * Bit 0 corresponds to counter 0.
>> +	 */
>> +	__u64 shader_enable_mask[2];
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_cmd_start - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
>> + * when the DRM_PANTHOR_PERF_COMMAND_START command is specified.
>> + */
>> +struct drm_panthor_perf_cmd_start {
>> +	/**
>> +	 * @user_data: User provided data that will be attached to automatic samples collected
>> +	 * until the next DRM_PANTHOR_PERF_COMMAND_STOP.
>> +	 */
>> +	__u64 user_data;
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_cmd_stop - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
>> + * when the DRM_PANTHOR_PERF_COMMAND_STOP command is specified.
>> + */
>> +struct drm_panthor_perf_cmd_stop {
>> +	/**
>> +	 * @user_data: User provided data that will be attached to the automatic sample collected
>> +	 * at the end of this sampling session.
>> +	 */
>> +	__u64 user_data;
>> +};
>> +
>> +/**
>> + * struct drm_panthor_perf_cmd_sample - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
>> + * when the DRM_PANTHOR_PERF_COMMAND_SAMPLE command is specified.
>> + */
>> +struct drm_panthor_perf_cmd_sample {
>> +	/** @user_data: User provided data that will be attached to the sample.*/
>> +	__u64 user_data;
>> +};
>> +
>>  /**
>>   * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
>>   * @__access: Access type. Must be R, W or RW.
>> @@ -1019,6 +1582,8 @@ enum {
>>  		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
>>  	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =
>>  		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
>> +	DRM_IOCTL_PANTHOR_PERF_CONTROL =
>> +		DRM_IOCTL_PANTHOR(WR, PERF_CONTROL, perf_control)
>>  };
>>
>>  #if defined(__cplusplus)
>> --
>> 2.33.0.dirty
> 
> 
> 
> Adrian Larumbe

Kind regards,
Lukas Zapolskas

[0]: https://docs.kernel.org/next/userspace-api/perf_ring_buffer.html

