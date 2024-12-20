Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD119F9152
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 12:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5802C10E0DF;
	Fri, 20 Dec 2024 11:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="k7pjikC+";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="k7pjikC+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2046.outbound.protection.outlook.com [40.107.103.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B227A10E14B;
 Fri, 20 Dec 2024 11:31:18 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Z7aQ47+h+vRUkPp/9CQChn4mPmjJU4EqC0RBg1exFMSH0I4PfeB/Ky6CxYEsuGtHwOs9JL/hZmTRAylC3PiPIJm9g3uwRtoD38T8dNZf8la4HEcIxlFlYVhKmAdoS0oKrIHl0RXsxM+knuvCniH9Jx8IU6ocUj1pDWD4IoksdiEjAWAEEtmyOUgqQe7RX1+4z2D6O7WbytVahxCbB+sPI6SJYs3EJnSMi5ewsI/FQHzS6k09+CaweBwIE+ig8FTaT1NLnPESEW/Ne7VjOR/qiJusokkeyuzsyWYK/oNP+N1wV+ZhgdKUXtVPt6LlrGspaTeo0xhaoZ08WEqH7ZoqLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qf74j4Qumu2VBzGvL7IgPv8PEwZyQcJhu+TtLwo+05s=;
 b=KelNTpgLdkfUF8XzcyPBNIYi1oOlroBVgh7QP+pPzk07ADyzzFErR85/vb8n/LmBveVSTpZr1xajP5C+6F0lLRIIOBx5d4Wf54Ub0QcbvCywq8T3f+kq9QQXa2Y4eksaKRKce38rtHQ0T7nC6I45YjHbHan/tkmSOSxCOOiCVHDHCpnV2Ghz/j6AshPn0h3FD9buJlGViRHFO1kg1wJalwgl3zsqcX4a8br38DiYAU1g9ptPxq0ZOMEUjWh+gEN6KOjPyStn349TIoA11zopZM2IOph8wsou65xZ+gSS/qmtwCEaeO3qA1Rqia7EccIKesKKSMldeoQ5hj0lY5kLvg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qf74j4Qumu2VBzGvL7IgPv8PEwZyQcJhu+TtLwo+05s=;
 b=k7pjikC+RBsMClINodnVFVgepTA4+DT3oORkxNzWwKstaUpU7P/re5+qm5jflxeXNg7sz1Vu4qjGI058tqWeUTDk1Duave85aagUHuDijlkDeSDbE0NDwSAv4fSM9iSg7MEeeKdV+JwXtPN+DgzoSewkYhhpbGXBiWycXm2a2N8=
Received: from PAZP264CA0127.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f8::18)
 by DB4PR08MB9238.eurprd08.prod.outlook.com (2603:10a6:10:3fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 11:31:08 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:102:1f8:cafe::ea) by PAZP264CA0127.outlook.office365.com
 (2603:10a6:102:1f8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.25 via Frontend Transport; Fri,
 20 Dec 2024 11:31:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.6
 via Frontend Transport; Fri, 20 Dec 2024 11:31:08 +0000
Received: ("Tessian outbound b519d6c64997:v528");
 Fri, 20 Dec 2024 11:31:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 955bcec4b41cf0b0
X-TessianGatewayMetadata: J+d5NJ49mrYUMER9RoMsDT//ENJ5j2N+Pc+Om8gbn2dHJoFB2jmRk33ww0jJrgk1D5o1FGAFKHq6Xk2mOMUQxJ0QvfVbqT3XWt2FV0jTD3o0zhkEdW4FdaeQ2Ylm9B5IrZ0XonwyPrahCvOg39GNgamYYv3mmzIUQ5vcvN1kfBNnQnGUNLhLBWvgDN47x+Ez
X-CR-MTA-TID: 64aa7808
Received: from L7bc83dacc6d3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 206CDB5E-AA2F-4844-AE01-8E34095A3596.1; 
 Fri, 20 Dec 2024 11:31:01 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L7bc83dacc6d3.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 20 Dec 2024 11:31:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mdw/eylD7o2vTuPy5Vzlmpj1IYVpZxcuiS7ZT71l32oTRa0/CeOlvMfTejKlAUMh2PdCrLgC2kMnM18p9vTQMrIpgMxE3/tMsyZAlsVkjuIWtTEUuL1UiPO3w4eWwQrWuU0QPReEOSu8ZKImDrxmTKk4+vwe3eq23WQ5qWSAOjI4Ln6HWTk2+3kfjAyiOwcjzWEDv3NeEQ9v9JAnzf5MKLP0Q2rwitYU67UyOFBEfxRBXVTcychHhw0ZAsK6AT/C7T9qAqSfc/FxFbNHLZXyj0Hm6W0jjH3VLPJZ/XmQ3I1+Qmpm1cmUTqpUGre9j4ErqVIDsHK/lzIVkaYbmaIxUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qf74j4Qumu2VBzGvL7IgPv8PEwZyQcJhu+TtLwo+05s=;
 b=mU5NTLJBxkVj/bz9b0HOm1TrY1oVWGYXkVI8xMmapdFWKuHQTdKgJJPPY0lMTxeGipgMZ3norOhUBVZ8KyIh3AwL/7LD6eo2Oj8KO5OwLoNYgBnIF2OcjmDNcSLRrqknpMGvQQfqETEsJL+5ACicTgetoiidEz1XbbWmiFh1l2F8D1liZ1We0u4k2RJbnR8ukMmgRqzmXWzcDclQtTSdoCrfyrRYmvPgTuCCum2ghgzS1b85jwac2ecCUjuKe2HQYZuBcg23kmvojAvG2wrq+XNB0aCEtof0I3EhMxNR1Zy76nzuLNkBOC6JV8ttjsjcPcUve20dOSNo0Tc/QtFQSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qf74j4Qumu2VBzGvL7IgPv8PEwZyQcJhu+TtLwo+05s=;
 b=k7pjikC+RBsMClINodnVFVgepTA4+DT3oORkxNzWwKstaUpU7P/re5+qm5jflxeXNg7sz1Vu4qjGI058tqWeUTDk1Duave85aagUHuDijlkDeSDbE0NDwSAv4fSM9iSg7MEeeKdV+JwXtPN+DgzoSewkYhhpbGXBiWycXm2a2N8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB8563.eurprd08.prod.outlook.com (2603:10a6:10:404::17)
 by FRZPR08MB10951.eurprd08.prod.outlook.com (2603:10a6:d10:136::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 11:30:59 +0000
Received: from DU0PR08MB8563.eurprd08.prod.outlook.com
 ([fe80::3f5f:95b1:c5ed:1895]) by DU0PR08MB8563.eurprd08.prod.outlook.com
 ([fe80::3f5f:95b1:c5ed:1895%2]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 11:30:59 +0000
Date: Fri, 20 Dec 2024 11:30:57 +0000
From: Brian Starkey <brian.starkey@arm.com>
To: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
Message-ID: <nlcq3xjef3mapwumuelnspinmgucersb5gazk2p7yxqv5aops7@t3p2e4sze75b>
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAAxE2A5+=QVAFXXCbe3qEgY-Mzb-5XW73CYdANEO+N_xA+ivaw@mail.gmail.com>
 <zfjnuz2pfg7j2g2zrbt5ryde223plzr4rdyk4f4ans5znicw3l@kbebotesmobf>
 <CAAxE2A6u4Ee=yBJHo9uKr0Be8Ta3MwSxvt79GcbF8D0R952_FQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAxE2A6u4Ee=yBJHo9uKr0Be8Ta3MwSxvt79GcbF8D0R952_FQ@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0381.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::33) To DU0PR08MB8563.eurprd08.prod.outlook.com
 (2603:10a6:10:404::17)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU0PR08MB8563:EE_|FRZPR08MB10951:EE_|AM4PEPF00025F9B:EE_|DB4PR08MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: b12de47a-1bb2-4c64-d624-08dd20e9cc40
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?UVM5Kzc1TGsvalhFcm5NVmx5SkYyYXhvUjBWSVNudGtOUUdIVkVrTWhtS3Jq?=
 =?utf-8?B?MDdZUHhJaWprR0o4SEZYeFBlUG1lL2luZFZvMGlSKzl3LzlNeVl6NUNhbGo3?=
 =?utf-8?B?ZXZsb3oxTXpjcDNJSU9XRHloNWd6dm03VnFYbmNYN2V4M0pGWFFqM2Zjb251?=
 =?utf-8?B?cHdtK2Fud2ZZSUswRkgvZjlqYlVqUm5hLzV6R0p0VWt4RXpFQjZPTWI3WXBY?=
 =?utf-8?B?dis4QUlYMXZIMTllUnd3NXhxVks0QzFtWUVrZEdObzdjdGNZQmRZZHcxK3Ay?=
 =?utf-8?B?bVhWNExVSlhEMkdpci9pb3NicGdiNWxDOWFWZWxEYkZnSi8vdTZva2d0OWts?=
 =?utf-8?B?SGNFaEhOVXYybFVCS3l4YStGSk1wVzUrREU5bmZRSU56WW8xb0VLRlMxZGxx?=
 =?utf-8?B?TlZZUHQxRGZHMi9PZ21Ga2ZMWDdJTDk3eXRLazEzeUdLYUpWMG5qaUo5RzRT?=
 =?utf-8?B?Sjl5UWJVWlVBR3ZpblBIOHdkMS9BQldIMmVvUDl5UnR1VkdkdlVLSU5uN2pk?=
 =?utf-8?B?QkJqZ1A4Y1Z3YytJUmZOekZqUmx0V3Q1cWpURzRPajlBZHR4allrMHRnNjlx?=
 =?utf-8?B?TmUrRnZCeHFIaFN0UVpPUENPYXpLTDNQeTlOcUUydlg3b0p1UGZqRjRpdHRZ?=
 =?utf-8?B?emtOMUx3SGtCbXZjZWlmYlR1T2FFeXljSHoxV01qVWIwekVpL2ZNelVjNDNG?=
 =?utf-8?B?VXZpcytxdEgrZ0Q1WkhNYlpMUlRVZkFoVWFNS2hUdU8zNTNUZGJoNDA2MGZr?=
 =?utf-8?B?RG5KQjNLRko1WHZNUndJZDh0ODVqTWNPdVpsUnRNdDJXWXJoVlhCVjRKWjB6?=
 =?utf-8?B?QVd6eS9pV1Qrd01QNGREQWxGQTR5RSsydkd2djFNUUJDdjM2cjZGc3RPREE5?=
 =?utf-8?B?OGNSQ052VzB4RkQzeEFYdlNPZks0UmRBV1R6U2hVQUZjNUxRcmNFbTFDWnBC?=
 =?utf-8?B?dVdvSWd3SUhvMTN3U2tYWE0yUDlKWXJrOTZ4bSs5S21OamRXMXNXU3lkMW84?=
 =?utf-8?B?amlzL3owVmY0L0lqaVpDdVBBa0k2SHpwM00zK29RNG1KOFBVYWdHT2NtZ3Br?=
 =?utf-8?B?SGRrNWpTbWFyVVdrdEZBcnlsemZtK3RZdGl5L3NmcWZ2S2RMeFdKbUZQaVVI?=
 =?utf-8?B?YmRmcXJkQ2UyOXFOaVMzNDBVczhNMXVZcjFDd2k3VmJTYzhMQUJlWXZ3UW43?=
 =?utf-8?B?V2hhSzYyeFp1MWtIWjhMeW9HUFFYRFFsYll1cVFSRVlLdGJFcVRuRThFQ0dv?=
 =?utf-8?B?c2xITFNob3hVUkR1bzVlRlQveEJ2cGVHa21mWWszdnlpL2tDdjRoc2hnMlJO?=
 =?utf-8?B?Vzk0ZGVES3FIV2JzRlJabEVyL2xWUkp6a3hMTExWQldjOEFMd0ltbFNoYWZ3?=
 =?utf-8?B?ZEs2N0NjY2U4bG1PUEV1YitINjVwbEgxYUVWVzgxcDlpWGw1YVhoTTBFNGtI?=
 =?utf-8?B?ZzhBRis1bXp3eUE5WUp6cXJrVnRLT2F0eThqMEVjWURnMHlmWjhyWVVGeUpr?=
 =?utf-8?B?WDhLdEVLdVNReTZUOTE3TDVFUGpMTWYxOW10YlRtOFNmbTBuVnlmT1o2Q0Nn?=
 =?utf-8?B?aVJXUTQwVEdUMGdKRy8rbDRCcWx0UGtTdTdFZWpGUWo3MUtDYkIrV3pFKzVy?=
 =?utf-8?B?bEtlL1NaNnBvRzltK0REQlhTb0tidnN2ZmtPRnlvWE9Vb3hsaWhkUFpndzBp?=
 =?utf-8?B?QjF0RHMrQWN0K1RjeTB5c09yUXREbENxMnNJbDFXbE44L3VqbGtLSXRmZTFl?=
 =?utf-8?B?L095TDBoMzRER250YlpUMy90R0ZBKzFWT05XU1ZRQ1pXNnAzTmJnMjAzQ0Q5?=
 =?utf-8?B?ZThpRE44bThwQnlxSTJIVUNNazNUcVZ6Q1FndFpnNm5PK0I3Uk1QUks5TE8r?=
 =?utf-8?Q?w1Y3B0g+Cu5CL?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DU0PR08MB8563.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10951
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:404::17];
 domain=DU0PR08MB8563.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 19bab84c-f532-4b6d-7048-08dd20e9c70c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|1800799024|82310400026|376014|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFJRK2FRbE42WkxkNFV6bmEyc2NvN0ZXOEJiVkZPSWIxeW5WVWJQaWpEZ240?=
 =?utf-8?B?MjYwTWxTVUdJUUdWZ3hUUVRrVEJBODgzczJyWTNkdjJ1VEV4clFPeTFyQzVs?=
 =?utf-8?B?aURTWDhzMEhaY0pZdS92YXhYMU5XbzYxazBlRUI3dm1vWGhuUEg5enp4dWVB?=
 =?utf-8?B?Mmo5bDRkbmNaTXEwajloblMzZktPSmFDQ0MraC9lZ0F3NDN4ZmhTK3hXRXBh?=
 =?utf-8?B?V0JsODN0cm1xME9RTzdWNWZxMHo2Y05kMXA3T0h6VGVwUURVVXQ2aW1TZzJI?=
 =?utf-8?B?alY4RzF4V2lMQWRtSm5YS092Rk44ODBwSVZFMjYvNXR4VlZsYXJDUS9PdFFp?=
 =?utf-8?B?WElQT0N4VENKaU1hMktMZ2RSYWVjZFFQbFFpcVVaVnVNU05qcnp0K3NFWkow?=
 =?utf-8?B?NENyREgwcWcydGpBRC9tbnlrU09CSnJvVVVUNHg4RktQSDdhK3U5YTlQQ0FO?=
 =?utf-8?B?V3V3cnR3dU9DN25reGxrdHNXT2ZJeG5ZR2l5NzJwVGRaTDFxalR4cS9CeW9L?=
 =?utf-8?B?TXRBZnNyVXJDMVFiSTNaSVNNUUt1c0JRN1NPN2JocVZ6ZkxwVlREcVJrb2o0?=
 =?utf-8?B?cFB4TG1yS2ZpUmtyaVRib2piK0pEL2Nidm9Demt3Mi9iempNU2lVUm9YOUJq?=
 =?utf-8?B?RVZmRHNlT3lyektXZ2MvT285RkFlcXVhWDJIOUNrQUpwNUxqb3plcmR4V3Y4?=
 =?utf-8?B?Zlh0bzA5d1dHWVZGMTA5ZUxPcXBoZVhJMG5QQXZpOUJIWlBXNUdVOXFJaCtF?=
 =?utf-8?B?Ym44dnVHQ1RJM0FGMlBBbmFGYWFXdWRkSkZzV0pSam0veU9uSWpRSXhybDZT?=
 =?utf-8?B?b1Z3dmxYc3k4K05TVjkwMmxneVVZaXYwekFrR2lSU3p5dVczWGcvSnk1cDhh?=
 =?utf-8?B?U0pFZU1OOEZuZVNDZmtNSEdNVEhGV0x0WExkdDdwVXUyRnpod0hIUVZkYjRL?=
 =?utf-8?B?WGVLMTZOUUc5TGh4elFIdFlKanhjVW02SkpWbUtSRjZ3TzVKSG9VNzdFcG5T?=
 =?utf-8?B?dTV5eUZxcnhFZVE1YWhER05ZQWNTTG5uQTJ0bFNLR1hTMU9wL2lBbGZyY1o0?=
 =?utf-8?B?RDZJdzNSUTQ3dGRNME9TSXVtWXVLSUZ0blhyNFBtRjNhZ3p4T2FQSkl5VlN5?=
 =?utf-8?B?SWpabVNVSWxSa0M0SWJFRWhET3NoOVA5ZE55NElUVkFXWW42bExraDlBa2Mr?=
 =?utf-8?B?V3J5RkZmNk94eFpPVGhEbVJOOU9OR2Z3cTk1cWU1VG9wYnJjTEphYktJdEFn?=
 =?utf-8?B?SDBuTnRoWkpiVjJGT05xUHRaZEJMejEvNTRuTGhMTEJ4S1hBNUZIQ3NBYmVU?=
 =?utf-8?B?NUdLVHFlbHlndzM5SWd6cWV2U3BjTjdDOGVHNlhPUWNQcGJpeXBJUXpDaEM3?=
 =?utf-8?B?WkhNNGFhTWhneGtwRmNVTU82c3hzZHgyK20xQkZUMEJoa3IwYjNTeGR3enZp?=
 =?utf-8?B?RGI1b0trQkJ1bmZPZnZ6dGN2Rk1XKzc3RU54elU4M3RlYW1BeDRYWEh0K243?=
 =?utf-8?B?MWU5RmNyV04xVFFmRGRqU0JYSW04Q0pxQlNkbU56anErVXY3VlN5VHhZRmkv?=
 =?utf-8?B?TWFvZ2FjQUxFUDZSdWxwOXNxMDVqY1FvRThVS2ZWeVIrK2pGU0VNcXJoeEJZ?=
 =?utf-8?B?Y1B1eHZpeGtJSFJsRjN2YkVCdHV5UlNZcmpGMXZ5U2ZIbXV6VUlTRXFtdzlQ?=
 =?utf-8?B?c21xOGZhMHg0a0ZrRVFPd1lteHhKTkl3TGY4eVliLzlWZUxBdjVMTHFuUmJK?=
 =?utf-8?B?V29makRRMXFOd0RLUkVqaUZiVTRRWmxOTmtReERpUEJwREE0eWFkc1EvUzlk?=
 =?utf-8?B?a29jTVZMSnJwc2NyWE9GSTJGaXNXNmo1cU13MEVVZ2c3U1lUQmRSbzRtaTJD?=
 =?utf-8?B?VVRDd0JwRUl3R2xlZWxTVURGdTdkdHFLNGlTMEIzeGdXQXBrb3g1OU4rejNL?=
 =?utf-8?B?aXp2UEQ0bmZ2bUJhMU8vNnRYelJ4KzQ5bjdUUTFLTllmaktaTnc3TFNuZ1BE?=
 =?utf-8?B?RFRXR3A5SDlWanh0MUlxVlFNQitHemRWYWQ0UHRtVHZhR3YxN01YcEFkMVJQ?=
 =?utf-8?Q?+PgKxJ?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(35042699022)(1800799024)(82310400026)(376014)(14060799003)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 11:31:08.1185 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b12de47a-1bb2-4c64-d624-08dd20e9cc40
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9238
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

This is getting long, so tl;dr:

 - Pitch alignment *by itself* is manageable.
 - Adding constraints in modifiers quickly leads to combinatorial
   explosion.
 - drm_fourcc.h explicitly says "it's incorrect to encode pitch
   alignment in a modifier", for all the reasons Daniel raised. That
   needs addressing.

On Thu, Dec 19, 2024 at 07:33:07PM +0000, Marek Olšák wrote:
> On Thu, Dec 19, 2024 at 5:32 AM Brian Starkey <brian.starkey@arm.com> wrote:
> 
> > On Wed, Dec 18, 2024 at 09:53:56PM +0000, Marek Olšák wrote:
> 
> The pitch doesn't always describe the layout. In practice, the pitch has no
> effect on any tiled layouts (on AMD), and it also has no effect on linear
> layouts if the pitch must be equal to a specifically rounded up width. In
> that case, the only function of the pitch is to reject importing a DMABUF
> if it's incorrect with respect to the width. In other cases, the pitch is a
> parameter of the modifier (i.e. the pitch augments the layout, so the
> layout is described by {modifier, width, height, bpp, pitch} instead of
> just {modifier, width, height, bpp}).

I'm only talking about LINEAR here.

The ALIGN modifier tells an allocator what values of pitch are
acceptable, but it doesn't add any information about the buffer layout
which isn't already communicated by {format, width, height, bpp,
pitch}.

The AMD driver doesn't need the ALIGN modifier to determine if a
buffer is valid, it can do it entirely based on {format, width,
height, bpp, pitch}.

These two buffers are identical, and a driver which accepts one should
accept both:

{
   .format = DRM_FORMAT_XRGB8888,
   .width = 64,
   .height = 64,
   .pitch = 256,
   .modifier = DRM_FORMAT_MOD_LINEAR,
}

{
   .format = DRM_FORMAT_XRGB8888,
   .width = 64,
   .height = 64,
   .pitch = 256,
   .modifier = DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_256B,
}

This new modifier is a clear and direct violation of the comment in
drm_fourcc.h:

 * Modifiers must uniquely encode buffer layout. In other words, a buffer must
 * match only a single modifier. A modifier must not be a subset of layouts of
 * another modifier. For instance, it's incorrect to encode pitch alignment in
 * a modifier: a buffer may match a 64-pixel aligned modifier and a 32-pixel
 * aligned modifier. That said, modifiers can have implicit minimal
 * requirements.

I assume the argument here is this doesn't apply in this case because
we're deprecating LINEAR / the current LINEAR definition is wrong; but
it smells bad - it implies that this isn't the right API.

> 
> >
> > There _is_ a problem with having a million modifiers. The opaque set
> > intersection means that all authors from all vendors need to expose
> > the correct sets. The harder that is to do, the less likely things are
> > to work.
> >
> 
> No, exposing the correct set is never required. You only expose your set,
> and then also expose those modifiers where you need interop. Interop
> between every pair of devices is generally unsupported (since LINEAR
> between devices is practically unsupported).
> 

How do I know where I need interop?

> 
> >
> > Look at GENERIC_16_16_TILE. We spotted that our layout was the same as
> > something already defined under SAMSUNG. If there were a million
> > modifiers, we wouldn't be able to spot that commonality, and you'd end
> > up with disjoint sets even when you have layouts in common.
> >
> 
> This is unrelated.

More modifiers makes maintenance of the list harder. That seems
entirely relevant in light of the combinatorial explosion I described
below.

> 
> >
> > For this specific case of pitch alignment it seems like the consensus
> > is we should add a modifier, but I still strongly disagree that
> > modifiers are the right place in-general for trying to describe device
> > buffer usage constraints.
> >
> > I'm worried that adding these alignment constraints without any
> > statement on future intention pushes us down the slippery slope, and
> > it's *very* slippery.
> >
> > Up-thread you mentioned offset alignment. If we start putting that in
> > modifiers then we have:
> >
> > * Pitch alignment
> >   * Arbitrary, 1 byte
> >   * At least 16 byte aligned, arbitrary padding (Arm needs this)
> >   * Exactly the next 64 bytes (AMD?)
> > * Offset alignment
> >   * Arbitrary, 1 byte
> >   * You mentioned 4096 bytes (AMD?)
> >   * Arm needs 16, 8, 4 or 2 bytes, depending on format. Oh and it's
> >     different for the chroma plane of planar YUV too, so it's more
> >     like 16, 8, 4, 2, 2Y_1CbCr
> >
> > We would need a new modifier value for each *combination* of
> > constraints, so 3 (pitch) * 7 (offset) gives 21 new LINEAR modifiers
> > which need defining, and a device with no pitch/offset constraints
> > needs to expose *all* of them to make sure it can interop with an
> > Arm/AMD device.
> >
> 
> No, it's not needed to expose all of them. Again, you just expose what you
> need to interop with.

How does a driver developer know what they need to interop with? I
want my display controller driver to work with any GPU.

It needs to expose PITCH_ALIGN_16B (the actual HW capability),
PITCH_ALIGN_256B (so it can interop with AMD) and any other values
which are >16B and aligned to 16B for interop with any other
producer. i.e. "all of them".

That's manageable for PITCH_ALIGN. It's not manageable if we start
adding other constraints to modifiers.

> 
> We know that the LINEAR modifier doesn't work with 1B pitch and offset
> alignment pretty much everywhere. What are you going to do about it?

Have an allocator use some "reasonable" pitch alignment (I think we
default to 64 bytes for RGB), and allocate well-aligned buffers. If
"reasonable" is 256B, use that. Better is to have userspace allocator
which knows the devices in the system, knows the buffer usage, and
allocates accordingly.

"How does it know?" --> The allocator just codes in what it needs to
interop with, obviously ;-)
I'd definitely rather bake that interop list in userspace than kernel
drivers.

I think it would be great to have a kernel interface to help
allocators "know". I don't think `IN_FORMATS` should be that
interface.

Cheers,
-Brian

> 
> Perhaps the solution is what Intel has done to interop with AMD: Intel's
> image allocator was changed to align the linear pitch to 256B. We can
> demand that all drivers must align the pitch to 256B in their allocators
> too. If they don't want to do it, they will likely be forced to do it by
> their management, which is likely why Intel did it. Is that the future we
> want? It's already happening.
> 
> Minimum alignment requirements (for AMD):
> * Offset: 256B
> * Pitch: 128B or 256B (only minimum or any multiple - different chips have
> different limits)
> * Slice size alignment: 256B
> * Contiguous pages (not visible to uAPI since the kernel can reallocate to
> enforce this constraint when needed)
> 
> Marek
