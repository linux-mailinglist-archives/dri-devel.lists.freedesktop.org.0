Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58818962EA3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 19:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9E110E59A;
	Wed, 28 Aug 2024 17:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="OW5mUQyO";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OW5mUQyO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446B610E5A0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 17:37:58 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KAOFwi9TX5zv3eCek5rBQgeAZtOcGKglWUvSybfDaWYEHDFIeQJ7OpvxUaniNIPQRglUtDytQtfntiXPMgHf3XiUgjg3LR3hJCN6rZGvmJuHlqbWQUV0X+QzmryM2DZMAaWO0P+igltohxjiW9m8fW4PHzta70LVACaiw5Ed7EAB0+8Jp6SQPkHHLVKu+vrHaPvu37+TusuMe5lWCVyajk2JHUa4I3DxJMauqII9yxktnL5R85eg6dJK6+w/ZEmV7JA1O2yVTTPSZtH4ZmaxvmzpfuuhofdKtQbKTqUBm2Ide4MtJoY2w7EsREabI81SHE7Aiwi3UNC0xfGf5JBD8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FP25UcaMDvmXnLlz7Q9wsswVXlOxVbdRDeQn/Ui1khM=;
 b=WHFcRqycNzao/nkwmvZx/n6InUJ473TabNrh02g8uODer331Xo5V9KyyEtNIaRGX6jiVwUvuvuEkBqH1MDjYzwAf/x+mXi4iuDhUxjGHJpn+NaUyIEMYhUFleaU4QGjhEWxZs05KEsdDEKAFlmmVA1nnBTxt2eEeOseX4LRVc1cye22Og/6blhIbQnMAB66qbxtgrTEky3V0dOGMsVJTEoE+92E07l1GAofijDhJyutjjjAeMMCc995sQQkHGy9mXwxkHYn9/GQQvTOFCimSKeeXtL8g9wYqRUh/4So75HXuiqPkn2+PhfWPGa/5oqE/vMS97odHrkNLmYwJuPA/3g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FP25UcaMDvmXnLlz7Q9wsswVXlOxVbdRDeQn/Ui1khM=;
 b=OW5mUQyOOLo1F/+kxp2RuU7OBMU7JNOBsJtfMahRuUb8m3p3aXv2/l9Lgg1jlW+4978RH432K90aowNq6GOVLTzWXgn8LpPIRzS3WwCnnGPWj7/MVwAC3fh/5aefhc1NECIrUSP9QX8g4Sy3cL3NFVlcUUtPgBXFJuUcJT4wNmA=
Received: from AM0PR01CA0096.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::37) by DBBPR08MB5978.eurprd08.prod.outlook.com
 (2603:10a6:10:1f5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Wed, 28 Aug
 2024 17:37:51 +0000
Received: from AM3PEPF0000A791.eurprd04.prod.outlook.com
 (2603:10a6:208:10e:cafe::ff) by AM0PR01CA0096.outlook.office365.com
 (2603:10a6:208:10e::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25 via Frontend
 Transport; Wed, 28 Aug 2024 17:37:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A791.mail.protection.outlook.com (10.167.16.120) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Wed, 28 Aug 2024 17:37:50 +0000
Received: ("Tessian outbound de2677e4ad72:v403");
 Wed, 28 Aug 2024 17:37:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 995ce8e2f973de11
X-CR-MTA-TID: 64aa7808
Received: from L3f941fdc1fa3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 49AC219A-5B3C-4E6D-B6F5-D97FEE331624.1; 
 Wed, 28 Aug 2024 17:37:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L3f941fdc1fa3.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Aug 2024 17:37:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTFit6+6h5rJqUc3+vAGvMe333QR8nptmpNNHGE38EnYCK8PbMi/rYEgChgvTO06JUHg6oaeRw+NJFHKF/zvaza0/ypHgz7Uacs25QjRAr7GzXv74PT2VGsbDsolnJ85DsRyXSvU1It6CQXNXt8BF7DqJMv/Y1fme2mkAiLa9ZC17K6aJ5atLTaaPlV+H5UTheqhf2rW76TJE20BF0uzYBZtRw2zkDiNg56nw0noXaDVCzd9BpKWUcm+xZcGGbZYUzir7Dj8zDH0vbfo+A5ReFJLpicWczUfRdM+h5cpDoFAsFTb/BBKb71YJbtsaQI3HgerP18gSwrfUU0q1YN9BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FP25UcaMDvmXnLlz7Q9wsswVXlOxVbdRDeQn/Ui1khM=;
 b=pJcvwsgA1P1ceqBSobadoKdbazKSUBs9sIdP2dmX2WfnJibEZ3GHKk+P7F0NaGSNUfivTbfR2Ezu0PuM9o9ePKxbp40ox/UiBr04B/8JY3d0PHWWcPOiDvpbIp2/wTW949SM7rP+kAnGO5Tt4m5XM/BKz45egw09CYTQUQWi2Jj9+bx2Ia8uOWaBlc22FU2rt6GqESFISBQjngDIG1i6pIEKQ4Xu3Ciox9XgeHt6X6623/XPu1tpipPIk+gqOoDXKlbM5MV+L9Luui96qoSekUXPq7nbOoprQRxkEme3LNK82gA3j6mqKO+x0/PPMp6T8knODE4IG7eOG5uzQuhruw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FP25UcaMDvmXnLlz7Q9wsswVXlOxVbdRDeQn/Ui1khM=;
 b=OW5mUQyOOLo1F/+kxp2RuU7OBMU7JNOBsJtfMahRuUb8m3p3aXv2/l9Lgg1jlW+4978RH432K90aowNq6GOVLTzWXgn8LpPIRzS3WwCnnGPWj7/MVwAC3fh/5aefhc1NECIrUSP9QX8g4Sy3cL3NFVlcUUtPgBXFJuUcJT4wNmA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by AS4PR08MB7577.eurprd08.prod.outlook.com (2603:10a6:20b:4fc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Wed, 28 Aug
 2024 17:37:41 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%7]) with mapi id 15.20.7918.012; Wed, 28 Aug 2024
 17:37:41 +0000
Message-ID: <da61aa7c-0cee-4d44-a0f3-4b7eed3a8b58@arm.com>
Date: Wed, 28 Aug 2024 18:37:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Mary Guillemard <mary.guillemard@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Christopher Healy <healych@amazon.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, nd@arm.com
References: <20240807153553.142325-2-mary.guillemard@collabora.com>
 <327a3440-8d01-4787-83be-a00fbbe0b593@arm.com>
 <20240828140929.5c602436@collabora.com>
 <c38324e4-055f-44b5-beb4-6b3e6b860e69@arm.com>
 <20240828180703.4510a4e2@collabora.com>
 <010201919a07868c-a8b90e57-0e61-4a05-8271-f4f4f86ca4cf-000000@eu-west-1.amazonses.com>
Content-Language: en-US
From: Mihail Atanassov <mihail.atanassov@arm.com>
In-Reply-To: <010201919a07868c-a8b90e57-0e61-4a05-8271-f4f4f86ca4cf-000000@eu-west-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0164.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::7) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|AS4PR08MB7577:EE_|AM3PEPF0000A791:EE_|DBBPR08MB5978:EE_
X-MS-Office365-Filtering-Correlation-Id: e8296343-c4b2-4771-3924-08dcc78823ca
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?aU5JT1RubEx1dzZaQnozOXpaZnRFNzlpVC9SL2J3K2NuM0VqL1ltZ3BjMUYw?=
 =?utf-8?B?VlVSdUVuMnFOTlArNmJ3U2NqKy9wc3BsWmVPMERUaTNPTkxXL0RqelJYZkNp?=
 =?utf-8?B?R2xkaVk2WVRpaHdYbmFwQmZCaFpwVmxUeGlMZnhvQm81UTBPSmNZaGRGcHFU?=
 =?utf-8?B?QmNneWVoWEhJM21nR1Q1Z1FyUGpzYjhlZVhIYzJud0g0d2VmREJXTHpUakh5?=
 =?utf-8?B?Ny9WWmZ6ejJOb1dtTGt3Skw2ak1EcjlFM3dXMmlybXdLMnBkUEhvOThjQTJQ?=
 =?utf-8?B?dm1FdFZRcGh4UVhYak5rWkV3WXpva2NxM0NmWUc0MHA0eTVHNUNkY1YxaWVy?=
 =?utf-8?B?ZThXamRVcE1PQVpXdmxmQ0lCeUtCcE1ONmRnT0RWaWgzMldKS3lzZXo4bEtl?=
 =?utf-8?B?MUZZT3FxUjNFZE1hakxhNHR0L1F4cEJOMWY0Z2ljeGNVWTBIMzFRRWVob1lk?=
 =?utf-8?B?VFNIQmx5QTdHSVAxeHByZjZlR2ZlVisrWlpoZHRLUVFNRVllcGIrT3BBSytR?=
 =?utf-8?B?d21rTGR4YzI3MjBCSjdueFdJalptT1lCSXBubUZqeTFHcnU4WkF5RS9TTkM3?=
 =?utf-8?B?a28vNFJmSVpPN2JOSWxZdDB6eExxTEFlMm45dzhjUEYwWWd5bmdjSGJJbU5P?=
 =?utf-8?B?RlE3UUNuUWtnSnZEdnFVbXJMYzNCRjdETE52Z3lMMXJzR2FwNzJrVFNqWEZW?=
 =?utf-8?B?S24vSHd3bVV0MlVTVFlEMGozbDVqZ0RkOExvb2czZWhpd0FqUlcraFhLeFNQ?=
 =?utf-8?B?cmpMaEpCa2pza0hoUGFLNXROeHlOQW5OSldtWjdPb2NDd3UxOVBVZXF2Z1Ns?=
 =?utf-8?B?ajlCclB4NUFCdm5pWnJRN2pWRmdyYnBuUHhRNUlxMVNuMjdIaHBzV0doamt6?=
 =?utf-8?B?SkUyRlFzSW9MM29MVFVlelcyVjgxWEFuWXNzMllHb1NlbGxRTC9UeVY3VXc3?=
 =?utf-8?B?Z0FVZTdiMytDMVVNR3lNb1VGTWw2WDlrRUV2T1ZyTmg4YkEycE9uUGM2MkUw?=
 =?utf-8?B?a2dMLzdhQUp0bHh2cEMzeDlhNDh0b3piN0xiVmZnK2h1NTRzZFJZc28zTTVF?=
 =?utf-8?B?cmRHYTg3YTc3SWJZeDJtTXVCdWdWR1ZvMEUyYWJhNlFDUkc2K3ZZdHBEZnMy?=
 =?utf-8?B?d0hvdHdnbXJjMExCRnB0UnJnbVF2bktoTkgySll6RzBnb3NjaGNjUWVwWUFv?=
 =?utf-8?B?dGszeUZmbk5TQzk2UzZwclRWTVEzemhnYmF6M0tiMTh1MGdCTFdjV3lPMVFN?=
 =?utf-8?B?bzFpQ01tdnZVWjBvNGdKVkpOK2YrdW1mM3VBWnBWTDVhTXcwdEs0OEtHL3Z1?=
 =?utf-8?B?UFl0M1dIckN4aHQxYWV0T2pienpVTEN5ZjQ3eGwzVWYvRjZTL3dON3ZTTmJW?=
 =?utf-8?B?eUdJRHZvdFdxRHFjMzMrWjNtUEhncXdIK1A1SHNHbHlZYVdJRlMyLzV5SWhU?=
 =?utf-8?B?ZDhPQkV4dDRaV1BSTDNkUFhnOW9LTjltbDR4MlVHVCtZNXZRVmlaQ3R0b1Z0?=
 =?utf-8?B?OGNRcWk1WmtGT1hkU20vaWlUMlpvOXVwY3BmSDhOYkQ3ZEdZL1NxcjIwOG5F?=
 =?utf-8?B?VnJZelhBdnJMYmlzeEVpdEJvNHdjbUNuRFZRZUkvSmVzRXV2NTZZbUpVU1RF?=
 =?utf-8?B?ajU4eEJGSUpzaGZYSUg1eVVsNk1EMmJFTlc1QTBTK0JFeHJ6UnJjbHYyOFVt?=
 =?utf-8?B?NXlBVS9Bc0FLUGFqNVVIZGU0d1A5UUVRWGNwbnBpV04zMzZNLzBha09wMlRr?=
 =?utf-8?Q?FIBQ6CiuucPcFMD5T4=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7577
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9b36eff8-125c-4055-dcd9-08dcc7881e46
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|35042699022|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3hvL0Exb091cUFGOG9wS3pzWE5EV1gvM0RxV0d2ZFRBR3kyM1NDWlJUTWEv?=
 =?utf-8?B?NXFaMXdpamxCOUROOHB6N0krOE4zdzdZMjd5UkJJaEowVTUvaS90U3pMRDJ0?=
 =?utf-8?B?T0cxZXhVRUl2R1g1TUpJWEhlQkVqSlpaZmpKaVp1NTZ2d3ZKeDk4bDFBSm1E?=
 =?utf-8?B?cmpuRU5EUm9MaFF4WWtVWlp4V3Q5azhkaEtqd2Z4Vlk3QjZmT3Z2ZDk3VEVR?=
 =?utf-8?B?YkZ3M01JSUZaaW9oREMrUzRWSlcxeWxWT20ya2orc0ZKTXRWUS9yYzlFT3Bv?=
 =?utf-8?B?K2RFZWdTKzU1bnJCRmN2QTZaVFQ5QmZpQWhyNjZVNStWdXVaUDY3cmw5VmZx?=
 =?utf-8?B?dlZGY1I3cmZVQmN4TDBLSElVYXFISTV2a2tieTZEUFJoblNoRjBRVHNXcWQ0?=
 =?utf-8?B?RHdNUWswZ3hMZVZUbWx4UGx3Zk9RclAxOGlFeXdvR0RSZUJmSkZsUWZ1VkFG?=
 =?utf-8?B?RFgrcDc2M0RCdGlzbzRKOUdpV0Q3ZzZSTXRxcFFZZ0ttWmhNOWxrUFNBZ1pI?=
 =?utf-8?B?RVdQN0lmMGVnVzhTNllHL3I5eU1QSkoxNmlNQkFNUmZ2QnpnK0cybFRnckFa?=
 =?utf-8?B?Ny8yaEVyd0szYjFsMFFVSktla2toOU94WEFJMUhBUzhFRzRBdHBOZy9pVkNT?=
 =?utf-8?B?N21QY1dPck5sdVRyVnllT1NTRUhTSUZhaklkcWFEQy9zWm1ZNmtnYkE4Q2lS?=
 =?utf-8?B?aGVkcjg2NjBwcTU0L3RlUnQrY1BDTnZIcC9HKzFxSUplaTdqaGlxMitmOVc5?=
 =?utf-8?B?Qk9SaDBQS2FwcWlFQVRNUTFJUWlwSHhkR3U1dzFXdDAzYW8wd0c3NGFvYk50?=
 =?utf-8?B?b1ZzUE1Ca0lDSEpPOWdmU2MzdUxtTVVoeWx5c1pqZFNkYWRkYW9VTUJCSGxT?=
 =?utf-8?B?N1pOQVErbGFaMFoyMXNyWTdBQm9aNlBuZklVcjcrcXZBNUViRHJDT0MvYk8r?=
 =?utf-8?B?ZWd5VlFONU1MYmF3Y09WazZFczJTSUpHeFlGUFcvaGw1OXRFYXBtMlR4Z2xU?=
 =?utf-8?B?a2tKWG1SeXlFVnJ2L3B4ZytQdTN4Rko1MFIza1haaHV4TmJoUHB5SmtnV0gv?=
 =?utf-8?B?UzlhaittbGUyMHJjVEp0OWE1YWk1UjJRZ0I2b1pocnhSS1RuSjZnbFhaNHhH?=
 =?utf-8?B?UnYxL1d2bmtHOUdsb0VROGJOU0Z5dUwwQWVCczVsNTcxY0ExZ201VmxjRkZn?=
 =?utf-8?B?blhmdTFLODFXQkNoUVkzMTh0a1BKOFBaZTEzOHFrN08rZFQvekpvbStzZ3VJ?=
 =?utf-8?B?UUZHUVFTTFFtTndiZWQyMDJrWWlyNHFFbjVYQ0ZZeXJZMnZxeG8vOGVaS3VB?=
 =?utf-8?B?ZDAwSExaWFJiWTNEM2d5YWh6aUtQcmxpaFArM0p5OXllenRGL00xUnJVS0U4?=
 =?utf-8?B?VUtYalBrTng0MnpJNUVEaVJ2UGh2WElWT3l5ZGxsWW9iSVQreVZ3a053SWJy?=
 =?utf-8?B?Si9RUGRMaytoenovVDFScmNMYnVqd0EvdVE1N2F3ME4vWGQ0S2VPNkMyUndE?=
 =?utf-8?B?S09nTEZyY1N0cTlwNkNCZGFlOXN0bUYycy9RR3FLc1I1a29lRDY1QTc4SmVw?=
 =?utf-8?B?a0I5VUJLZmxad2J4QzlLVTZoM3NXczB2YjlyYm1IK3R6c1dndDhiUEVBUE8w?=
 =?utf-8?B?VkRQQXF4YXNGYkZBZ3M5QXExcGYyd2N0WUNJNkk3ZTl3M2tCWHNnbnlSNjk1?=
 =?utf-8?B?aWwyRmpHTnRwSVZhU3dQN01pVm92K2FMYVd1WG05VlRDK0I0ZFJMWlRJdGJs?=
 =?utf-8?B?Ukh3aHVTMkRsRmVMODZxK2NtbnYvbktCckVFblFVUmdJS29sR2gxN1FhK3p3?=
 =?utf-8?B?VW0vcXk2aCtSWXhRWHZBZE40eXF1RDM0dURONGJrQ2NMWnl2V0FXOXlCNFRF?=
 =?utf-8?B?YjJ0bXJZdVhBUzkrclR4a05oK1YrTlExeU5RNjdUYUEzUGc9PQ==?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(35042699022)(82310400026)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 17:37:50.8921 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8296343-c4b2-4771-3924-08dcc78823ca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5978
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



On 28/08/2024 18:27, Boris Brezillon wrote:
> On Wed, 28 Aug 2024 18:07:03 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
>> On Wed, 28 Aug 2024 14:22:51 +0100
>> Mihail Atanassov <mihail.atanassov@arm.com> wrote:
>>
>>> Hi Boris,
>>>
>>> On 28/08/2024 13:09, Boris Brezillon wrote:
>>>> Hi Mihail,
>>>>
>>>> On Thu, 8 Aug 2024 12:41:05 +0300
>>>> Mihail Atanassov <mihail.atanassov@arm.com> wrote:
>>>>      
>>>>>>
>>>>>> +/** + * struct drm_panthor_timestamp_info - Timestamp information +
>>>>>> * + * Structure grouping all queryable information relating to the
>>>>>> GPU timestamp. + */ +struct drm_panthor_timestamp_info { +	/**
>>>>>> @timestamp_frequency: The frequency of the timestamp timer. */ +
>>>>>> __u64 timestamp_frequency; + +	/** @current_timestamp: The current
>>>>>> timestamp. */ +	__u64 current_timestamp;
>>>>>
>>>>> As it stands, this query has nothing to do with the actual GPU so
>>>>> doesn't really belong here.
>>>>>
>>>>> It'd be more valuable, and can maybe give better calibration results
>>>>> than querying the system timestamp separately in userspace, if you
>>>>> reported all of:
>>>>>     * the system timer value
>>>>>     * the system timer frequency
>>>>>     * the GPU timer value
>>>>>     * the GPU timer frequency (because it _could_ be different in some
>>>>> systems)
>>>>
>>>> Duh, I wish this wasn't the case and all SoC vendors went for the
>>>> arch-timer which guarantees the consistency of the timestamp on the GPU
>>>> and CPU. But let's say this is a case we need to support, wouldn't it
>>>> be more useful to do the CPU/GPU calibration kernel side (basically at
>>>> init/resume time) and then expose the formula describing the
>>>> relationship between those 2 things:
>>>>
>>>> CPU_time = GPU_time * GPU_to_CPU_mul / GPU_to_CPU_div +
>>>> 	   GPU_to_CPU_offset;
>>>>      
>>>
>>> TIMESTAMP_OFFSET should indeed be set by the kernel (on resume). But I
>>> don't think we need to post M/D+offset to userspace. The 2 Frequencies +
>>> the scalar offset are the raw sources, and userspace can work back from
>>> there.
>>
>> Sure. No matter how you express the relationship, my point was, if the
>> calibration is supposed to happen in the kernel at resume time,
>> returning both the CPU/GPU time in DEV_QUERY_TIMESTAMP to make sure the
>> sampling is close enough that they actually represent the same
>> timestamp might not be needed, because you can easily convert from one
>> domain to the other.
> 
> I think it makes more sense after reading [1] :-). This being said, the
> maxDeviation is here to account for any latency that might exists
> between each domain sampling, so I'd be tempted to read the CPU
> monotonic time through the regular syscalls rather than add it to the
> DEV_QUERY_TIMESTAMP ioctl.
> 

Wouldn't that defeat the point of getting low-latency consecutive reads 
of both time domains? If you leave it to a separate syscall, you're at 
the mercy of a lot of things, so it's not just a scalar time delta, 
you'll get much higher measurement variance. Doing it in-kernel with no 
sleeps in the middle gets you better confidence in your samples being 
consistently correlated in time. If you have that in-kernel low latency 
correlation pairwise for all time domains you're interested in (in this 
case CPU & GPU timestamps, but you could get CPU & display IP 
timestamps, etc), you can then correlate all of the clocks in userspace.

Fundamentally, though, if you don't report CPU timestamps in v1 of the 
ioctl, you can extend later if it becomes clear that the maxDeviation is 
not low enough with the samples being across a syscall.

> [1]https://docs.vulkan.org/features/latest/features/proposals/VK_EXT_calibrated_timestamps.html

-- 
Mihail Atanassov <mihail.atanassov@arm.com>

