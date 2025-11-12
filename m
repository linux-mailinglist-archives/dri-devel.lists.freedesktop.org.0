Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E627C54E4C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 01:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95ACD10E091;
	Thu, 13 Nov 2025 00:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="ff2O0KeH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010031.outbound.protection.outlook.com [52.101.56.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E79010E6FA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 12:12:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNhykh/K31scJr0Xeo2uQwBIJMZav23Sw+HDiiHPoQF5dexiYqUFqxsGFfaKTkND0oCi0W7lboc6NwYBxY09lXGR12/+UKuBcHw4Fgoa9UqkukosNAIHXkze7fb7siN1RawwQWYyYFoPu9Yg6lJOWHbCljje0Hq9QdN9HXL04aX6df1hZmJO7stM9B1/MqeaX63qinFMQN9DP1OkXCizOSGDLS+8RJQTZiD5+ohlvcYOUlvvsVhZEWDnBeUdzCqyvhtbMka9zfR5ipkpnlewboog+QkSaAHtibHqanPiQxnavIFuj9YAxMzfPvo7rlSLh8b6KrssitDXLiFvAb7sCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roz4TLf//9hbY+fQ0h5ew8qbVt1wKQ6zi7dge/IokNQ=;
 b=j/r/eIzA7fGi38UF7vd/pJRlSq9QDvf5UVxKi3UwWZKKubq77sakYUB93l04AH7qlJ118reCMNrJN65qlOLDESCCHzdi1kSsj4RKqkN23Qpsf8YvOLa2eQCD7lPZPrz7ukzKzo1yANzNeYfs871zLU3LD0pGO8R9oXdlVppCLWLkkytDg6L6PrsQesQIY22nQc0Z5GqBaFkZwVrJ6mCFwJWgga1r80MhrgaPWLU2n4pGaQ09IxDI6faY4lzy4GZk5vrLKBf/bY5Di01bO+mYgh1Tqv91MBe3RikDVJAGBixqzqB/ADArzwRxxbX03OO45+l0b00EtDxwwUa+azguig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roz4TLf//9hbY+fQ0h5ew8qbVt1wKQ6zi7dge/IokNQ=;
 b=ff2O0KeHOZ4k52cpw7UtMYKM9seEh1/aaxn+AtFKqhYKcE7n6O6M4r1JFjJ69I8BR1hyu5rupHKKoVKpk3JoxK2bsEYTGMy98Y9mssXfvbawmPH9L5Qf173uQopg12TdPxhOTsRy8okN+anbgRvU1CQNNUR3Kf6Kx0J6u2fuydQ=
Received: from SN6PR08CA0029.namprd08.prod.outlook.com (2603:10b6:805:66::42)
 by CO1PR10MB4724.namprd10.prod.outlook.com (2603:10b6:303:96::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 12:12:52 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:805:66:cafe::6f) by SN6PR08CA0029.outlook.office365.com
 (2603:10b6:805:66::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 12:12:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 12:12:51 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 06:12:45 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 06:12:44 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 06:12:44 -0600
Received: from [172.24.231.164] (chintan-thinkstation-p360-tower.dhcp.ti.com
 [172.24.231.164])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACCCc4v2661507;
 Wed, 12 Nov 2025 06:12:39 -0600
Message-ID: <6eb4e9c0-debe-4643-a5b6-bd5ef0f72070@ti.com>
Date: Wed, 12 Nov 2025 17:42:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/7] net: ethernet: ti: am65-cpsw: add AF_XDP
 zero copy support
To: Jakub Kicinski <kuba@kernel.org>, Roger Quadros <rogerq@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 "Jesper Dangaard Brouer" <hawk@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Stanislav
 Fomichev <sdf@fomichev.me>, "Simon Horman" <horms@kernel.org>, <srk@ti.com>,
 Meghana Malladi <m-malladi@ti.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>
References: <20251109-am65-cpsw-xdp-zc-v2-0-858f60a09d12@kernel.org>
 <20251111171848.1a4c8c03@kernel.org>
Content-Language: en-US
From: Chintan Vankar <c-vankar@ti.com>
In-Reply-To: <20251111171848.1a4c8c03@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|CO1PR10MB4724:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b88ebc5-613f-45a6-a1c5-08de21e4cd3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzVrTmNxeFlKOXZXS0dvaDhpYXBCZklXWXhiblEvSEpieHpkakVoNUVZYW5X?=
 =?utf-8?B?a25mM1JUbWptNHEzOTI5bytqMnhGMjMyamlUTVd3VmJWc2RYUjNIbU1GaTcv?=
 =?utf-8?B?MVNyb2c2YkRzeDN4NUxMK1VJK0lsWlVhVWNvd09iNXQzV3Y3NUVtL1Fxdy9R?=
 =?utf-8?B?enVocEJjZ1NmY0Z6TmpMZithb3paN1dRTlNKWlErL1pKWFpWUDFuU25tdlVw?=
 =?utf-8?B?enZRUU9DdkFoVCtvblZFOTlkLzZ6cUVsODFwQUpmR1RUazZodjF1b29GTm8y?=
 =?utf-8?B?VElnaTN2UXFrNkxia3RFZXZIQXljdmVBT0FhalhwdUZEZDdBMm1USDFpZkth?=
 =?utf-8?B?NU5GMkN0QWhiNm5kSVhpOGdsZloybmRac2ttZldGWnBWUjZNZ3NsRVRNc1hJ?=
 =?utf-8?B?eGZBNEVsRGJqM3gydll4UWRNYlNnbWJqcnl1UHQ2aXhBVzJtL29ST3RYUUtE?=
 =?utf-8?B?dXdWSzQyaXNGTWNIMkdQWExDL2xtWmxtVEVQWUFmSVdUbEk5amhWUmcxd2Mw?=
 =?utf-8?B?SHN5dDNoWUY3SzNlV1ZDaUU2OUIwQ3RyeC8yeXUrQ3haczRHc1ljaXNtb1F0?=
 =?utf-8?B?dE8xTytOSStlVWdqRG1VQm9OOUFGakUwclV1Y3pGcGF1OU9ZS0dvQlEzdWZG?=
 =?utf-8?B?SWsvaXZnK2NKaUVZM21HMjJ3VEFRS0dWd2pRMEltMTcwT1FnNmVhMkRKbDNy?=
 =?utf-8?B?NW5HYitLQm9sWlQ4VTdubCtTYm5EVllMYVlMYURGaEVLT3hXN1dnTTBuS3Zi?=
 =?utf-8?B?TVJQYUhHQnhWWGdwTHovSFJTUmNTWTRBN2NjTkdwWSt5ZXBiUDJ2NkNFRUtG?=
 =?utf-8?B?aDhYZnZkQjFIazdXeVpqZEE0U1ZXMUZLWE5rd2xiSzE3MmtOciswNG9nSVFZ?=
 =?utf-8?B?N0hvdGlsTll5M0tGL1BxamVTYU5YTUdoNWhxaE0yS1NUUG94b2hzZytrVmxw?=
 =?utf-8?B?NE5YZ29JZkphRjJlUnFQQUxxZkNSZWphTUY3djF3VmgyTTR0OGEvRHl4VzRw?=
 =?utf-8?B?T1lybTgvcTB0Vmd4RmZGZUdXSjZXZ2ZFdHBTZis2clZCOXBhekxVMnV1a1V0?=
 =?utf-8?B?a3pKTmJLNS9aallqK1hIYmdBNUFGN3l6dEM4Nkl4aTBzZTdWSDNNeVl1amlF?=
 =?utf-8?B?Rm9mbFFpMlpOdU9xc3BEWlB5ZjJEUlZQUVBaY0E5K2t3bGFIM0xqTm9KbEp6?=
 =?utf-8?B?cS9vWGdTcVJ1OVdCZGRrSFNyZm9uSW92NmNkTGthcXcvWDZoRXI0dFJlZmZ0?=
 =?utf-8?B?WjhqRWZjL2hhTTcrcUkwT2E3UlNYTk5WMzAycGc1cG9Qcy9ndDdLQkJpZWFE?=
 =?utf-8?B?UnZuOW40aEZIeHRMa3RzUWMxR1N1c1lqTFZobU5tdFE1WGpkdU05WFN5TmpV?=
 =?utf-8?B?KzdXcStLdm9BZ3FmVGZ4UTlNa3BWanBvVjVIUVZqN3JRVkRSbkRFNm1aRFM3?=
 =?utf-8?B?TDZsODc5TW9CSnVlNTY0ZkVNdEVrWjVPY1BDbGRoRjlPQ2xOcW1aMFpOYTZG?=
 =?utf-8?B?SmVpMVdWNzBqeUpZWUd0bVVtb2FOanRmcjVoOXZnRjRaSkRJdXduQnpwYTM2?=
 =?utf-8?B?VVRCWTdsKzIwSHYyM1JTZXZWZ0NxZFpjT1ZFK1h0azlpVTRSbkI2ZWc3T3hG?=
 =?utf-8?B?bVZHc1lQY2JoeEFWUXgraEFMcU1SOE9SUldOMmI3NXlRclBiYWxZbC91anpz?=
 =?utf-8?B?WmFXaUh6SzlWdnNwT1dMT3dNSXN3b21FdGNoK2lrYlN0RmRYTU9uZ2xOK0ZR?=
 =?utf-8?B?Z0cxMWxKdFFqTmN2eFVVN1lQdWhDRk9hWnZMUFlSNitOcXU2TmJSWEVpbE9O?=
 =?utf-8?B?cXp6TVFPc2ZKclhpYmcveXFRWnU5c2FJcVhWVWtQRjhtTnlndlBSa3cyN05Y?=
 =?utf-8?B?RHZIQ292VWhhaElGeHM5UG5LSWxKTmlMTDJDZUgxeFlFZTV1OFZ2RC9GYlZx?=
 =?utf-8?B?YVZmaHkrU2ovZEI3SXlwbWJuK0FKVWI1emgxOGd4YjhMMEdVdmtLNTQ2Vzla?=
 =?utf-8?B?Uk5JQkVHYWNlL1RlaTVYcTZ0MDlHT1FxRldZRVR2N0M5Ukx1dzVqR0VZTEp5?=
 =?utf-8?B?U1FYelNaN0FGSnRjMlVnSGdXMCtQc293NmlCYi80NTRYVHJ3Zkx6Y2ZKYUdo?=
 =?utf-8?Q?oPGY=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 12:12:51.2090 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b88ebc5-613f-45a6-a1c5-08de21e4cd3a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4724
X-Mailman-Approved-At: Thu, 13 Nov 2025 00:28:26 +0000
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

Hello Jakub,

On 12/11/25 06:48, Jakub Kicinski wrote:
> On Sun, 09 Nov 2025 23:37:50 +0200 Roger Quadros wrote:
>> This series adds AF_XDP zero coppy support to am65-cpsw driver.
>>
>> Tests were performed on AM62x-sk with xdpsock application [1].
>>
>> A clear improvement is seen in 64 byte packets on Transmit (txonly)
>> and receive (rxdrop).
>> 1500 byte test seems to be limited by line rate (1G link) so no
>> improvement seen there in packet rate. A test on higher speed link
>> (or PHY-less setup) might be worthwile.
>>
>> There is some issue during l2fwd with 64 byte packets and benchmark
>> results show 0. This issue needs to be debugged further.
>> A 512 byte l2fwd test result has been added to compare instead.
> 
> It appears that the drivers/net/ethernet/ti/am65-* files do not fall
> under any MAINTAINERS entry. Please add one or extend the existing CPSW
> entry as the first patch of the series.
> 

I am mainly working on am65-cpsw-nuss.c driver and volunteering myself
to be the MAINTAINER of am65-cpsw-nuss.c and other CPSW drivers.

Regards,
Chintan.
