Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5430B97D5E5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 14:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0E710E833;
	Fri, 20 Sep 2024 12:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="crb0Ewag";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="crb0Ewag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2087.outbound.protection.outlook.com [40.107.21.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6EA10E833
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 12:57:46 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=B6VxwXFWY9P0rlVemHYem7lbkjEZjnDr0VM1EatOgD2gkt/4IG5DZSqTCGKC/Nutt0BYBozof7+2oJA2MTF8C1hJaM6BXX5X5E4SSOF/6ffnd/qxCkkmIYuJmapGJml49WsTsD0iXkWSBZpw3iYfd4od94HC7yXmMqIL8C6t/yY8q4qF1ZKHaldgY8tBNEaK3SNjfdXylRvfo6BiMajUt0zxUolfx9yKvJBXlET9t0/ypqlDB70L9LOR24qcxU6IHMOfPA8JdzCE9fR+4DBspMNL9l6mzpkirHca3cDfdKUZETo0Td/hhz4NhDjz4Xt2v3WFPPYkLtfObx+v5uVHIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYO0QqocPJIzjWrKEgPLjGdjlh9i7BqdLlSIVfcEBeE=;
 b=sAVq0vCc7JX5ZmhJ5u464RBfh7pITvmoS6rXWRfmB8IdouPd8jduTqfnROrMYihhZzLaH8p/rEM5GJJZF4swMIXLDyrjXtewy0uIcqNoXC5YhqMmv23rJhIlahTt05UYF11JUSNOT1HpREL+IrFSc8EtAaw0F/ogTRxHhvDhQgEhXg1WFoLYZXAHhgrNn9MiLxqEHhN9WAJRqojBvWF09H/YpSb5lVnAjpW8tHEPUsEH4670I0VTEo4SZll1W6+QmYatWZZbcTbwnOelVDHbVqeoB/8FZlBP49ZBIYwbTW4Lwzu04WOmDSVuR0ztMDQoj1GcnfS8LMQJ1vohdlmscQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYO0QqocPJIzjWrKEgPLjGdjlh9i7BqdLlSIVfcEBeE=;
 b=crb0EwagPHP0zqQVvlRMOZ/LZjdHTxp9Z4R/XM3CHuFNgl6AjkRkWAFjJxXDVYW+WCRGYoJ8UP+CiGBvlzPG8m/A1xkFCI7Nn9mWoxK9J2idRwuvV9bPu5Kaqn9yGvvd13zlO7TRaTezbjsI/IrYiEtQHqANa0qumPm7BXcOVBU=
Received: from DUZPR01CA0154.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::24) by AS8PR08MB6727.eurprd08.prod.outlook.com
 (2603:10a6:20b:393::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.7; Fri, 20 Sep
 2024 12:57:38 +0000
Received: from DB1PEPF00039232.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::4e) by DUZPR01CA0154.outlook.office365.com
 (2603:10a6:10:4bd::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.29 via Frontend
 Transport; Fri, 20 Sep 2024 12:57:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039232.mail.protection.outlook.com (10.167.8.105) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Fri, 20 Sep 2024 12:57:38 +0000
Received: ("Tessian outbound 3e266b55d80f:v465");
 Fri, 20 Sep 2024 12:57:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aebbd4d71fed9037
X-TessianGatewayMetadata: +He0AW6+kpgm95nmalve7HhBzJE/RJsbzBTXPOnKxCInqK99mymKaPgL1RsWAehEfGMRt5KnCxF9J0lAyRFVbRZ9tBRusR2D4nXAFh6jvuDhi3LW4ftSx0esC4tF8Hm7Y8EQM0/mlY41SYKb6RP6Qlfky6k73XLoHg4q1CA+KuI=
X-CR-MTA-TID: 64aa7808
Received: from Le14fed95c0de.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B4ECF1E7-B40B-43E1-A70C-69159B970675.1; 
 Fri, 20 Sep 2024 12:57:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Le14fed95c0de.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Sep 2024 12:57:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mup8pOo+Gkbhz5+9qyBrBEOgGG2LUGU6U9DUVIm80YGVw8/biezm7ExSVYQRVlesuhLJKjvv80RlvFNk+oM3KCMR3pMOS6vH72L6WKuFk+YYzP/WLtI/b7GXsKbPwcz7V0Ggs5kb/ZVGTBKiawEJPMyLgpvTmAjup+Jc4apjP//w4jbaV52kq+CqiqTnCu7yJI8TNmbvQ4xDhxIFJch7ZNQQ0ZEwOW6pDCRxJEmRNVnIdIiGoM0jwhI5tV8F1sgI/jJBFfAHkeHP3m4drpzYbjLRAOrumrjHhR2Tlwl/mZYxq7NtMhl4MyxKvWzDpBSfVn/6xJx9GqgZqi37OoeHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYO0QqocPJIzjWrKEgPLjGdjlh9i7BqdLlSIVfcEBeE=;
 b=DPUDba5fmzSQdR6Ij9plkcF95eoXBfmC82oACJS839Kh+KqkFfH/xvd+GEd7L9WNmzMhuNEMaami06nxO9j9vQI0/RzmA11U1vmdiSTpRBE9LKbYyetcrHkPxZL/Xc6CLjzbBkaCEVKUIiEQMfRHMhdui8/5Rpa+ABuvldgsT/33yu3KCVaLmF03gj2PEBdOqI/cqaLY73wmAfYEz1nkZZ6TJEzRrm+jlaCjg2mBSiOFdncKuKJloMkLlRT7SiH7c6VVLsAVhtiAajDFGoIjU5Nubvw2gpQhm84p08ndKfmHtxcBvM9hWoVSZfBEuCbPlbH5+WZ7JU4oiMrolXQWtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYO0QqocPJIzjWrKEgPLjGdjlh9i7BqdLlSIVfcEBeE=;
 b=crb0EwagPHP0zqQVvlRMOZ/LZjdHTxp9Z4R/XM3CHuFNgl6AjkRkWAFjJxXDVYW+WCRGYoJ8UP+CiGBvlzPG8m/A1xkFCI7Nn9mWoxK9J2idRwuvV9bPu5Kaqn9yGvvd13zlO7TRaTezbjsI/IrYiEtQHqANa0qumPm7BXcOVBU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by PAWPR08MB10239.eurprd08.prod.outlook.com (2603:10a6:102:367::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Fri, 20 Sep
 2024 12:57:28 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%4]) with mapi id 15.20.8005.008; Fri, 20 Sep 2024
 12:57:28 +0000
Message-ID: <4cecd255-fb07-4ca8-8cfa-7d00b60b9fc9@arm.com>
Date: Fri, 20 Sep 2024 13:57:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND 1/5] drm: panthor: expose some fw information
 through the query ioctl
To: Daniel Almeida <daniel.almeida@collabora.com>, liviu.dudau@arm.com,
 steven.price@arm.com, carsten.haitzler@arm.com,
 boris.brezillon@collabora.com, robh@kernel.org, faith.ekstrand@collabora.com
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nd <nd@arm.com>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <20240821143826.3720-1-daniel.almeida@collabora.com>
 <20240821143826.3720-2-daniel.almeida@collabora.com>
Content-Language: en-US
From: Mihail Atanassov <mihail.atanassov@arm.com>
In-Reply-To: <20240821143826.3720-2-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0120.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::36) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|PAWPR08MB10239:EE_|DB1PEPF00039232:EE_|AS8PR08MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: 564e1424-8963-40e5-fa25-08dcd973ce1c
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?b3JNdk5qaDJvbEpPb3VlT1kxdm40M1BoOUtIdEdQRTF2eW1rYlk1L3BkVnFO?=
 =?utf-8?B?dDh4cEpwT0JNSFd2THhJeWhtTmZzUXFhWGJ0K3Nwa0tRdGZtU3UwUjlFa0Jv?=
 =?utf-8?B?dWcrSWoyb1k1Ly9FTFcvckRyczI1dFgvUXQ1UkNxektSajlqdjNsOE8zVTRm?=
 =?utf-8?B?MmpVMG1wR2VyUFF5QVIrNGNZVmorT1pRQnBQRDNaQ1JhZGxEY0dMajM2QUJS?=
 =?utf-8?B?RkhHWU9ONXU0cEVQV25ldEdrcVRiN0tlT081NUp5aHJJTFF2OG5oRHo1aEhR?=
 =?utf-8?B?alI4OFNzZkpXVTFFcXJLeCtPeEIvTmt3bHpXRVdybGM4WG0yRXZVdVBldUFz?=
 =?utf-8?B?QUFZZmNzYkxSeEFlR2NLNUtIWG1zZzE4eTN5ZnM5MTg4c3RWNEdHRUExcUtX?=
 =?utf-8?B?L3FyMnpnQ1VpbWxRWVR1R2M4NGFKVll0cEJ1bHVhZnoxYXRKN1p1d3duMDFI?=
 =?utf-8?B?SjJmekVocVc3NDl2M2s4bW5JUE1OUHV0bk5XUFlqZzVXbUxMR3BOSGZIYUNO?=
 =?utf-8?B?cFYwdHFmSXdKT0NSNlp4OFNoMVMvYk5UMEg4bStWTkc5aGRUMGlacWRqRHp4?=
 =?utf-8?B?S3NndkZGS1V1dzArbFo4cHhvTll1UEpyMzZaQzk0ajVObHVZclZ6TmxaZUFS?=
 =?utf-8?B?T3VucllnOUZETmtEYmxQVzBQRGFRWHZhVUJodDNUbXhXMWlJZnlXdVArUUxp?=
 =?utf-8?B?eHBFQXVTbUlMQlh1aW9XMEpsNTA4VW0ra20zU2dPVlNCSStDcVlrY0VSeWta?=
 =?utf-8?B?dE56NDJWajRFdGw1TTBpZDhlQmNNYVFHWk4yZ0plUlFUUHk5K3FjU2RZOFBY?=
 =?utf-8?B?TmgzaHJTOEtqdlhST1VaM0RyeENGVkYzYUl0ODFudFNOTXlhS1YydVJrQjZq?=
 =?utf-8?B?RUEwTjBYVXF5SDFEMWp3a2ZJdGxGeGFtekpYR3RIaVpwTVhsOHpZTDA4QkVY?=
 =?utf-8?B?SVR3SnhkVzI1dWZrQ1h1b2hsWm0vSjFwb3ptZ2ROMFptVGlYd2h0VnNOWXJ6?=
 =?utf-8?B?aHBFS1dGYnhUY2VKTkNacjF2VVE4c0FJcUM5ei9pN2ZLWDVUenlaTXlCblgz?=
 =?utf-8?B?cGt6Ky85QzlTOFQ0NUJiNktpZ0VSaDNaclFGN3Z1VFFiUGZJQlZFWEUrWWdl?=
 =?utf-8?B?LzlyVUJ4UHNBL281Z0hMWmJwRkcyeHM3VFlnT0gySUZkNTBmdGRPYXg4T0Nm?=
 =?utf-8?B?REloelNZYTJrNG5MS2kzcUlMMUJGa0lUaUI3VllvdXR0MWpZU3RmOW5BdHFz?=
 =?utf-8?B?UExUekl3bks4eFhUaXZmQ1Zxc0I5akt1NUJhWS9TM2ZuNC91bHhlVUZWK3Rx?=
 =?utf-8?B?VHB2T1BHMThMaU1BWW9WSk1abnlYTTZZcUZjQys2Q24wN3BMVFNtRkZsNDRH?=
 =?utf-8?B?THl1VFJoZVZtVUNhL0NnY3oyQ1VYQ0ltUDJHZzg5ZHdJQkJjVU1VN01iU29H?=
 =?utf-8?B?d0wwdFloTlhBNkkwSjZXZENVRUxtQXo5KzB5NnUwY3cvL05meW9QUGxnZkVD?=
 =?utf-8?B?dEpEbnV4WURBVnJ2SWx0YkhVZWUrTEVtL3JLTjFvK3FKU0h1L2cyWGdUdGJH?=
 =?utf-8?B?VnB4cUtHWU54Q0JHRlhrZFJ6QkgxMk9kMjZCeHZVdFViMFEwOWlRbUNxdW9R?=
 =?utf-8?B?eWI2elRqZVBrbTlKckwrb3Y4TVp0WFlDRVlaRk1NMDhVSUxzRUp0eE9CYVVY?=
 =?utf-8?B?Y1FJbVc4Q1h3bmFFZWtDeldtWFdtVWJqUk1wNmtMOUhLdXhlNnZWTVRWUDQ3?=
 =?utf-8?Q?xoXS5soziWKv2HnMNs=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10239
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2a98cbcc-b547-4ff9-e100-08dcd973c859
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|35042699022; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXFKdW1FN3l1T2FJVUxsdDFMMS94dkN4LzNzdGMxL01XY1hvWlNoWUdrS0Jw?=
 =?utf-8?B?REh1anVPWTFPWGFlMkRHcUtzQXZPb05BdTd3S3BvR2g4TEpJVzBTajJ5ZGsr?=
 =?utf-8?B?blZDc3BBWlJUVnZmTmdiTDBpcXZpa0ZBSjF6TFpOYU9MbmVubEJkS3dkQ1po?=
 =?utf-8?B?MFhCY1lBaVVoR3NxVURjdC8rejJFK2p5WHZVckZlZVlxanA2c2lvQ01jbHJy?=
 =?utf-8?B?MWphWXA1YlZ4dStSTGs4dTlINEJZY0lpUUdsMG5ySDZDaDBkcVpwVFZQeGRW?=
 =?utf-8?B?bVBCUnd2UkFaT0JBUGFKZFltZCtUVUp6UTZ6YSs4d0IxUUQrSW4vb296Uzdi?=
 =?utf-8?B?VUlGSlVGa0NYeS9qcGlGV0dncXpjS29iSGkwWVJqUXZoVkVrVFpZUmU5VHpO?=
 =?utf-8?B?SUpjUjg2YzRuajVBTFoxczZHUUxnN1o5eWErZHVqYytzMUMzam93dkRiV2RY?=
 =?utf-8?B?T0lPaEhBc0xHYWJITHFQT2lQZ2dLRW0xM0dYSXBaVmEvbUpKcWtuU1JMMjlQ?=
 =?utf-8?B?Mys5MHM4YkxnZXU4UWJkNUtRVVA0WTF6cDBhT2NzZG1qNjM1a0pQWWFWc1Zl?=
 =?utf-8?B?blk5OEh0YVdBTkZsOWNqOGcyZWEzMHhlQVNXaXA2emMrOXNCZnVDNHc5L3VY?=
 =?utf-8?B?N2dyUGQ2Ynl2N1pwbmNjYmFnTVlTRklzK2x5THBtMm9Vc3g4RmxiMk12TURY?=
 =?utf-8?B?SjRvUzlOYVY4WldFQ3FXZnJ6QmxLaWRuY3hGWlp1V3kzWlR4ZDJUOFFVWlBO?=
 =?utf-8?B?THVyREVOZDFBRGpvelJSS0drS1ZDNVdDamxsNm1DUk0rKzlUTXd3Tm0rTGNJ?=
 =?utf-8?B?NjlRc2gzYkc2KzRTWGVzWGFJdEVHM2MrVjVXY0NaVmxiU0hlbDJrZE1XYitM?=
 =?utf-8?B?bFliNFVuWjljbWxRdTl2MnZIek1NWHlrSE1TK1hRSDZFUHhDQ0V0ZlEwZDVh?=
 =?utf-8?B?alRFbmVtNWoxL2JCc2ZOdG9GS3dRZGoyOWxvOGRLaTEzUWlaZTQ0dnRLQ0Jm?=
 =?utf-8?B?R0toTG8xTjFRQUJsNFZ6YnB2Z1dkYUFXUytYYnRnN1hMWktEWFBMVWdsa25j?=
 =?utf-8?B?enl6VnFZbU1DRkM4WFI0ZnNDRk1kSjFaaTEvalNqaHZwZEdpaWEyRjZ2TzJs?=
 =?utf-8?B?Z3NMUC9DQzVnZC9wam9hNG1UQzhrSC9VNDNqWXNyRUsxTEVheDd3aHNNNnM4?=
 =?utf-8?B?YmZGeGRDT1dVdzYvblp4M2l6V094U2ppWEtaUXNnS3FZcUluMmJqaGNpeTlU?=
 =?utf-8?B?NkR6YzhxaVp5ekdBRDNESjdkMUZ5K253MWREdHJKeVNGRzBCMFBDTC9QNWtU?=
 =?utf-8?B?bTcvVGZpTXRySFJvVnN6d09PVVpxZmFaNzRGZWtPRm4weDBZYUp4cG5Jdmw2?=
 =?utf-8?B?RGNVRXV2NVZtL0Z5RzFnby9xOElSUHdnZWdVVmVqS0I5UzV0OUZaWkhYTnIv?=
 =?utf-8?B?aXZ5MmF0VnRHSkV2RmJZRjJYcEl3L1pzb3Mzd2xuK0pwYlhmUXY5cnRrV1R2?=
 =?utf-8?B?TU4yWWhoa1VEaGFCc2NHbHAxcFFhdzZ1cHhmWlo1M2tUako4a3hwbUxlWTdJ?=
 =?utf-8?B?MG1iNTF5dXBKbm9GZDU5YkxZemNNeTNxZHQ0cko4QmFBNldETHBRKzV0N1B2?=
 =?utf-8?B?VGNQUHBuSkNoNmhDSktPSmJ0SHBueS9BNUhJcGZ5b0cxVWdZR2QxS1R0WGxO?=
 =?utf-8?B?LzZGemRTQ20rK1ZoVERDMEJmWHY1dEZDbFdhRjg5NFRqUVRxT25WeTlLcDZM?=
 =?utf-8?B?aUE1bFh0MnZYNFoyUDlsUFNBSnFxdmpKVWt5TFlsMENHVVp5VExuWWdJWE1n?=
 =?utf-8?B?T0tHT1RVZkh0c3JLdk81YzAxS3hJRUVaaXNURCtMSVpBOGlRTCtVQjExTHRk?=
 =?utf-8?Q?DrXzKC/FhiX7N?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 12:57:38.2239 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 564e1424-8963-40e5-fa25-08dcd973ce1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6727
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

Hi Daniel,

On 21/08/2024 15:37, Daniel Almeida wrote:
> This is of interest to userspace, and similar in nature to the GPU
> and CSIF information we already return in the query ioctl.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>   drivers/gpu/drm/panthor/panthor_device.h |  3 +++
>   drivers/gpu/drm/panthor/panthor_drv.c    |  8 ++++++++
>   drivers/gpu/drm/panthor/panthor_sched.c  |  5 +++++
>   include/uapi/drm/panthor_drm.h           | 19 +++++++++++++++++++
>   4 files changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index e388c0472ba7..224c53dcfe6d 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -100,6 +100,9 @@ struct panthor_device {
>   	/** @csif_info: Command stream interface information. */
>   	struct drm_panthor_csif_info csif_info;
>   
> +	/** @fw_info: Firmware info for the global interface */
> +	struct drm_panthor_fw_info fw_info;
> +
>   	/** @gpu: GPU management data. */
>   	struct panthor_gpu *gpu;
>   
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index b8a84f26b3ef..fb30e119d9bf 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -164,6 +164,7 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>   	_Generic(_obj_name, \
>   		 PANTHOR_UOBJ_DECL(struct drm_panthor_gpu_info, tiler_present), \
>   		 PANTHOR_UOBJ_DECL(struct drm_panthor_csif_info, pad), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_fw_info, instr_features), \
>   		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
>   		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>   		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
> @@ -765,6 +766,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>   			args->size = sizeof(ptdev->csif_info);
>   			return 0;
>   
> +		case DRM_PANTHOR_DEV_QUERY_FW_INFO:
> +			args->size = sizeof(ptdev->fw_info);
> +			return 0;
> +
>   		default:
>   			return -EINVAL;
>   		}
> @@ -777,6 +782,9 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>   	case DRM_PANTHOR_DEV_QUERY_CSIF_INFO:
>   		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->csif_info);
>   
> +	case DRM_PANTHOR_DEV_QUERY_FW_INFO:
> +		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->fw_info);
> +
>   	default:
>   		return -EINVAL;
>   	}
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 79ffcbc41d78..e0ecc8bcfaae 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3495,6 +3495,11 @@ int panthor_sched_init(struct panthor_device *ptdev)
>   	ptdev->csif_info.cs_slot_count = sched->cs_slot_count;
>   	ptdev->csif_info.scoreboard_slot_count = sched->sb_slot_count;
>   
> +	ptdev->fw_info.version = glb_iface->control->version;
> +	ptdev->fw_info.features = glb_iface->control->features;
> +	ptdev->fw_info.group_num = glb_iface->control->group_num;
> +	ptdev->fw_info.instr_features = glb_iface->control->instr_features;
> +
>   	sched->last_tick = 0;
>   	sched->resched_target = U64_MAX;
>   	sched->tick_period = msecs_to_jiffies(10);
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index aaed8e12ad0b..e235cf452460 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -260,6 +260,9 @@ enum drm_panthor_dev_query_type {
>   
>   	/** @DRM_PANTHOR_DEV_QUERY_CSIF_INFO: Query command-stream interface information. */
>   	DRM_PANTHOR_DEV_QUERY_CSIF_INFO,
> +
> +	/** @DRM_PANTHOR_DEV_QUERY_FW_INFO: Query firmware information */
> +	DRM_PANTHOR_DEV_QUERY_FW_INFO,
>   };
>   
>   /**
> @@ -377,6 +380,22 @@ struct drm_panthor_csif_info {
>   	__u32 pad;
>   };
>   
> +/** struct drm_panthor_fw_info - FW information
> + *
> + * Structure grouping all queryable information relating to the global FW interface.
> + */
> +
> +struct drm_panthor_fw_info {
> +	/** @version: Global interface version */
> +	__u32 version;
> +	/** @features: Global interface features */
> +	__u32 features;
> +	/** @group_num: Number of CSG interfaces */
> +	__u32 group_num;
> +	/** @instr_features: Instrumentation features */
> +	__u32 instr_features;

This field doesn't appear to be used at all in this series or in the 
Mesa MR [1], besides decoding it. Can it be removed?

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30651

> +};
> +
>   /**
>    * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
>    */

-- 
Mihail Atanassov <mihail.atanassov@arm.com>

