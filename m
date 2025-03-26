Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA15A7189B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 15:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062F710E13A;
	Wed, 26 Mar 2025 14:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="RLgpivZE";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RLgpivZE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013052.outbound.protection.outlook.com
 [40.107.162.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A8210E13A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 14:36:24 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Skz3hMNyeOhvGIWy25f3EIG9VhsIZt11fjIve8fPMzEV8tMMVjSNIyliFPfW5EunizhJ1ga7MBMx39N5HSl5ZQ3Sj6xOaarJX+5WeE+aSoNXTXFtotvC0S0QONm5jgdI5yqhaYpl3jZV09YXKhrvJNPsqpZwCVTz2sFm7khuUP3gnOH8uxVkcdsvLmOi+HaZKO5HdQhBFhbMei0WuSqt7xa6SOLKQT6Kky6WwXTprRseM3b+wXp0tfSUFa/adgG0M55oP0AjrUMfshY3qo8JnTUL53D889nwjKj5FI5ui06XD/+hcRjD2xK4mFfWSx1NK8D++Jdf4klukgTqP5KCtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7Hqa+XH9OrYmp5gWR3fLRz+2TuIaIwPM3ofpp3q2Lc=;
 b=i1U7L4Q7EXWadEXtj2j8YGapLUYXXb9VV+BFAGHtS7TR8U8w2r86rrGmRrEiNlneAMLvg4dVtU8KyQfleRhCWXJR+0mQyGT3n7LQNaWTJ5KIYeHfAvG9Idwi8Xru2OWANI7rbHhFFXCPcgAmuDmheKpDXGYp5pf4p5oZh6QC24MImlJarA2HQ5L2nNl4u7OniZDsJoJp0BFHKuUuVMt8Wadmtvpkohs6qgcqWB6wlrss3KB71CqcpNCuJJEQ2cdVxzG8MA4ls2MC9/YjDa0utcCmjbmwE8Pwj8/GK3oKy7zmUopC3C68ZWBzo6YU/3/0/v+/K9ngZmCZF1vAr9Jh9g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7Hqa+XH9OrYmp5gWR3fLRz+2TuIaIwPM3ofpp3q2Lc=;
 b=RLgpivZEQtnD5ngjQuY6Ffd6jEy7K3vHEiPGooqEREsBQVpbugQkREzSdjoBIs4cKZMDUJy8yq3IOgiS+UlWoHmbJ9q8IA7JDwPXlqSDTVNGjyVhnFVMGCcuou4PhTLdEa/ArZFzvb9UpYHM7tSOmJ7Vk3aNNG+dRSI2K9/N9jM=
Received: from DUZP191CA0036.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::28)
 by PAWPR08MB10059.eurprd08.prod.outlook.com (2603:10a6:102:35d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 14:36:18 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::a9) by DUZP191CA0036.outlook.office365.com
 (2603:10a6:10:4f8::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 14:36:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Wed, 26 Mar 2025 14:36:17 +0000
Received: ("Tessian outbound 93207444acda:v604");
 Wed, 26 Mar 2025 14:36:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e35a4b72b9370164
X-TessianGatewayMetadata: pM4DY1aZ10gomDuuY6qUhfXiPN0JuG8+AEfZiMEUulm65dnW9TQjWMRUbmbwJxuaTq5n64VW8Zj0qHBZPu8BNS1Zb/l+CTuT3ZJiFD7vF4jLrQ/Va6SIumOjh3s6z+g6YNoTMGw4oCcyHwsPcnoEeTzJ+GgeQxQSoM3MMIX0FA4=
X-CR-MTA-TID: 64aa7808
Received: from L634c22fcda5f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 609D3804-C2E8-4D84-ADA5-4FD0BFDAA1CC.1; 
 Wed, 26 Mar 2025 14:36:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L634c22fcda5f.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 26 Mar 2025 14:36:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWuc6ZQMLEP5f3wpV5yhZsoFojro9Bmvl0sbnCuEVhLTaeZciDyPkgFndULVMGa5JOl8npBH3jJOrfkZcSHqAQeO35+rEhxGRrUk7ladzIeZkYCOBnKWJbiAM/UWSAoeUS6N3NmwHl//riWDa6q/O0quzpv8CrPFfV97CGq/jBD8j3z0Fn+RmRtWgQxjF+Fef9z5GQTYa138OYbLYyMOsEPB5alfg3GTEttt004JtZVXzvg/1H+HJ5GVzW5wcwzncwaRCsnZ/+ugPkIQjSK/RRiwtf6E8OxxHgnz10j7U3Tz/gWoYtzpkEVlP8QFoQKMylCVJ7Otw6Ipuw+tHxaSVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7Hqa+XH9OrYmp5gWR3fLRz+2TuIaIwPM3ofpp3q2Lc=;
 b=yV5NiXj6AS0TMCBHIPwer8gAzJsItJRqr6lGr8ZhH70AoiaTnCHDFmbg3DegjT21TzGwUOHmuC5qvQUB7W49LU9rCPSF6IxuuXOw+3EueJbqEUH3k6YbvKH/oWW8CVv8qq65kP5C0bDBwgVbaE2i/UrftSsw4wnC00epNhNEKBY0I2hQzIgrTGTFpx+jbIt65CrfoTs2Fif7Q95q3wE+/4pUCpkHvr1/u38ZHBUzP6MbkwyspaFVsC/LwTgF3+8qnZxea2YlV5pL099Mvd+RLFuzGiUql/yEXIDs6XPrV2qTyLWKEbJt1U8tEVXPo3nFqEjP+j0stT377vQB9NcIYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7Hqa+XH9OrYmp5gWR3fLRz+2TuIaIwPM3ofpp3q2Lc=;
 b=RLgpivZEQtnD5ngjQuY6Ffd6jEy7K3vHEiPGooqEREsBQVpbugQkREzSdjoBIs4cKZMDUJy8yq3IOgiS+UlWoHmbJ9q8IA7JDwPXlqSDTVNGjyVhnFVMGCcuou4PhTLdEa/ArZFzvb9UpYHM7tSOmJ7Vk3aNNG+dRSI2K9/N9jM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by DB9PR08MB6425.eurprd08.prod.outlook.com (2603:10a6:10:261::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 14:36:04 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%6]) with mapi id 15.20.8534.042; Wed, 26 Mar 2025
 14:36:04 +0000
Message-ID: <a6791291-e40f-4a41-a84a-74afeaecf0e5@arm.com>
Date: Wed, 26 Mar 2025 14:36:03 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 3/8] drm/panthor: Add panthor_perf_init and
 panthor_perf_unplug
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
 <20241211165024.490748-4-lukas.zapolskas@arm.com>
 <lgdrzylx2pf3t3ive7tcmuqlqu2vpjuvf5ztnyuoyrb6onecgh@6vieyyz5jzoj>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <lgdrzylx2pf3t3ive7tcmuqlqu2vpjuvf5ztnyuoyrb6onecgh@6vieyyz5jzoj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0256.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::16) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|DB9PR08MB6425:EE_|DB1PEPF000509ED:EE_|PAWPR08MB10059:EE_
X-MS-Office365-Filtering-Correlation-Id: a4a75cb3-27c2-4037-040c-08dd6c7391b5
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?SUpRdWdiNTVscG5JWGJPNEFMYnF0RTR1RitTN2UyRXdRd0xmRHZpNVJvNmpW?=
 =?utf-8?B?b0Z6WXppRFQ2a2VYR2RWQlkvTEdnZVJJUkhlQ1Y4K2o3RjdDOXo1bDE5b3hS?=
 =?utf-8?B?NEFVTjdJUHovWXoyaW9HVk9jd3grQ1JHcVpjQnlIV3h6L3lHTVlhYXppMGZh?=
 =?utf-8?B?cXE4b2R2UlpMN3hIZ3dBWnh2dTBmMVAyNlliM2JYeUd4VnhWLzc2aFNONFFT?=
 =?utf-8?B?MmlJZEVEOW9WcUtic1J5K3ZwbUc5V0lEVkpvN0M0dW14VllvV094aVozZ2JI?=
 =?utf-8?B?R3BKeVB4SlQxZFBIakJWZUdKQWVCVjh1RTFCZlRnWHVMZmJQY25xd0R0cm5y?=
 =?utf-8?B?RFBodGdKYXNmN2lQdFRvWCtmMmRzTjYxbEdqQ3J5SjJ6Um8zbmxKbk1kSHBT?=
 =?utf-8?B?c3RnNVZGTml6dk1QTmpiUFdrczJLaUJ3Nkw1OEFRdE1VVVlaMXdDY210TTFZ?=
 =?utf-8?B?VGJaWGdXSDhsWE13c3hGdU4xRk9DczAxVzkvS3IrdStIaXY3TTJNU1NEenZN?=
 =?utf-8?B?QjNpRTBCbkt3VUZhOTdJQUpIMHFpVy9Id0UxZFh2bmt3Ump4dGh4a0F5T21k?=
 =?utf-8?B?byswRHN1MEJ5SzN3WlpCVkJFTm9hTTF1b3JxcjVqSFdkRWhJalQrRFlsVkgy?=
 =?utf-8?B?cHY5ay9EU2MwRnF3eXVpeURUR2F5SHh1OXFrdHh3aE13MTVsbzZTS09ReE55?=
 =?utf-8?B?RnhBVkt3aDF3VUlIcDNpc3A1bHZVOUdmSlpaUVVVKzYxNUEwcXhvSldXVVNn?=
 =?utf-8?B?aHpPenhKRzdxVktHd2JlNURxalZIcThFWGZna05TQVdnUXZCcmpzNmE1VTJK?=
 =?utf-8?B?bm9ueWdFSzUvb3ZjSWZSOVV2OXZYRktPdDB6TFhKaDVyZ1FoZ0RHZ0p6ejFq?=
 =?utf-8?B?RnZCbmpjRUhqSkNzOGV3ZlliSTdMM3Q1Slh6c1F5TW9MZEcyRUZ4NkE0bDdK?=
 =?utf-8?B?UHJlbUk2QXlDVU5vZy85bEtlM2ZvdFI2SFIwMWNtdVI3MlZGbjgxeENIeE9Q?=
 =?utf-8?B?ZVVibHUvNUE2T2k4TnREQ0ZSRVh6SFcxWmdiVlE0Y09TUWlqdit3eXlxdEVz?=
 =?utf-8?B?cnVoaWdZbmhNQWpGYmpTTWNaWEdUd1RnUkZUOFV5L1NrdVAwbVM2QmRPQTg4?=
 =?utf-8?B?aHlMeDAyZXdkcVlOQnlaVGU4SnNxYTFCNE80NURueW9CTmtnWmVFTHcrR2FQ?=
 =?utf-8?B?RnNJQVQ1RWVBRUJER0FoZHBRZG9nVGlRNTV2TzlncjB6NW9YQzZidng1djg4?=
 =?utf-8?B?NG5KR043ckVhYU1ObWZ6VWg5Q2JpZWVsNXdPWnhWSmxuK3NlcTlTeUsweUE5?=
 =?utf-8?B?WjV5aVdkbFpINGlrNXlvUFNzUXQ4bG5rd3Y2RjduNDhMMDJjcndLSVF2WFY4?=
 =?utf-8?B?Qyt4UENMTVRxb0FXL1BKUng5cmF1UnZNQzRsa29wV0liRjRzUkI3bnIxbkFy?=
 =?utf-8?B?QnJSU2JlaXlYVFExMkhhTUhaTkxVbEhOVnNTNFJkQUFHSmd0RHJPdjR2QTFp?=
 =?utf-8?B?ZGlSMmZGdWFzaDJWMUxDVnlrbnlWbEsrd2FvUUtKUWw2dzJacTV1ME1zZXlh?=
 =?utf-8?B?Z2NtclZrZTlZdUZkMDh4Mk9wZWFYZG9tc1J0TTlxOE9sSTFMMEVvVVZWTUtw?=
 =?utf-8?B?T1U2NVJtaDZseW5kR0dUZGFLUnlyaEN6dVhYQXA4ejRNaE1oT0NrSlZkajRm?=
 =?utf-8?B?MTJrTGhZYVFyVjdRU3I5bjNEeEtXbS9sd0lCcStNUHZDNldzclVKa2U5eXFo?=
 =?utf-8?B?bms2dXBvd21udENhT3UyRXVlTndBWThEUzNYNkEvK1o1d2QrUTN5YXZJS2Yx?=
 =?utf-8?B?YnVRdTZENjlNdXdxdGxLRDUyTVNJYXB1QSt3L2FsVngybE5NSDdUTjU4L0o1?=
 =?utf-8?Q?OR8q92nvsr0YH?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6425
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:208:5c::16];
 domain=AM0PR08MB3315.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 51c6776d-4dfc-4742-86d8-08dd6c7389a9
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|14060799003|35042699022|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXlqUU5Rc2Y2cS9DNHpya3c2eVF4T3MwWmphekhPUkdnRFFZVnBkbDhPR1Yz?=
 =?utf-8?B?ZmhOU0ZhdWlMMVozWWV3eDNCS0ZuL08yRjk5NHd6bWduby9rRGpSTldxMXdz?=
 =?utf-8?B?VEJaNFhKaW9Ub3hhNHdZUzhKSjdpcUl3dFBOM2Y3bHVia3A0Z2dNREV0ZnYx?=
 =?utf-8?B?SkNpRVo2VlpqUkY1TE1PU0Z5dlhtOWYwWDNvMlJBdGZ4emFLVWR6cm5HbzVF?=
 =?utf-8?B?WUtYL0NLT1M1c1VtVzgzZk5mVlk3SEZsNTdYcGdJYUk2RzlMc1I3TjBBU1Rm?=
 =?utf-8?B?ODFlN2hQdEx3Z0ExaElBQVJkRlhhdk5QcU1rUFZyNlZwclFjT292VlMvSW5K?=
 =?utf-8?B?NjR5bjBDSnNOYUw4YVFHbFI1bExwdUhHR1NRUmY1dGdHWWtzOVRvY0JZQ2tl?=
 =?utf-8?B?RVlEYWo3Qk5Yd3J5UmtoVDhnNU1hYnBzanQzV2F6ZWk1NWNiOTdpTUMxVE9j?=
 =?utf-8?B?RFFjWEI1ZFFhREdZeHJQUEs5UVk1VXIvQ3doMng1L3FPV3hBZ0ZSYS9LMTdy?=
 =?utf-8?B?Y0pTL25SS1RMTXdGSTl1a2ZxM3RhOU8zK0duVEllYkVnRTU5TldJUkVyZlU4?=
 =?utf-8?B?cWNtbytFWnNNdGsvNE5QMXMxNzdUMkYxeXNuZnZUMlR3MUJDL0d3MWVFeUlz?=
 =?utf-8?B?ajgzR1FEWGc1VGZBL3luSjMxZ3BhaStOSkFxVnM5amVoMWVOU2x0d3F2UFhD?=
 =?utf-8?B?ZVg3QVp5NURoWnNsZTA1MDhNVi9aakJhZ1Q1bVV4YzJYWjlRNm5EWWFrRXVt?=
 =?utf-8?B?S0lrZDFsYjY2UlRzYzJ4L0VWajhSODM4RzhBZ2Fldis1UlFaa1RURlFHQ2dh?=
 =?utf-8?B?R2EveUlFOEFjQ1lMRXMvUEV1QzlsNmxqY212N3NGNmYwejFjdzVkdEtJdHZP?=
 =?utf-8?B?TXZqMHpwL0RHODhLb0ZRUHBPOUZuUnR1cE9oN2V4TjNjM3hyYytYL3ZzOW8x?=
 =?utf-8?B?K2c3VXZueHNKZHRad3RUZ0FIdFRLREllZWttR1J5ZVg5MGRlS1hRQ1JOYmpu?=
 =?utf-8?B?dXdCODAzbFM0SVBtRHliakJrdmh2RWNUbzRlZlRycE1Dendqc0xkK0sxTW9r?=
 =?utf-8?B?b3V5TXI3dXFaNFNjYktkeGJhV0NudW56Vm0vcDhBSWkwNCtnZnYzaVhxOHh0?=
 =?utf-8?B?V2NuRXUzUTlWOW1VL3JkSTJDdnVwTVd6bitlcWRWRno3Qko2eUdnL0NlVWor?=
 =?utf-8?B?YjZEZ3phQzVjQmkzRlo3WllkQjhQZmcrOHZVVjJkdkRBM2gxWjNQQ0VodGVp?=
 =?utf-8?B?bitvdmlPZ3J4bEFKMjBTWGREQnZ2TFVjMWtMVzFFS2lScXhDbEFnQzJ5TFlk?=
 =?utf-8?B?UVVJdmlaNTc3RUdXdUptbm9ZeXFCdHhvaTl4KzllQXBtRkdzQU1xZlgzTHNW?=
 =?utf-8?B?Zyt5M1hocDZEdjVCZlk0QjBNVlBnWVVxQWJGNXZacGZRbXAzZnk5ZEdjWFBQ?=
 =?utf-8?B?UlNqUDlPdGUvZ0o4VS9jTlVBV1VLUm1KUW92a2d1M1ByTTN4RmlNSFpTNTRB?=
 =?utf-8?B?ZWkwNUl5eEtheEEreVM1cGhVZW1JdGFiU2RaenZJVnk3UTRLRlVsSk5JZ3JE?=
 =?utf-8?B?SWJzWWxlVFUzUzRZR2x4NjVYMExrSS9YT2lieEcyclF2Ym1VUWQ0K01KM2tu?=
 =?utf-8?B?MmU3eE5wU1Avd1FHN1UzU1Y4UHRvd2pSVlZlQkZRVmJ5QnhnTzZ6LzkyNmxM?=
 =?utf-8?B?MUZSeGZZSGwyamJveFpBV09GT3VKNy9iZklMN0VMUHd3dlJwb0FuYjZRNzFV?=
 =?utf-8?B?L0U5aHBYOVd2NWJzdkhNdXNQN0had2lmUGx3TVVsdEJJU3NlS0wyYzZlcWp1?=
 =?utf-8?B?cFRSRnNYeTZvOVdyNTJSVitYUXVoall6UjNGMWl6cTR1aG5UNFQ5MnROVE5q?=
 =?utf-8?B?SWFsRVVDM09kbnFHam9EUCtNRlJmUXliYS8rcjA4ODJkT1N4eTU1MFl1SnZV?=
 =?utf-8?B?aWYySStzMm53YzRCNWZ0TEpZYUtGNHI2cTBjaU4xb00ybUdzVVhsNFA1SHZa?=
 =?utf-8?Q?RMS/CvvhXf/mpVaSphnQw/V15KNMcE=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(14060799003)(35042699022)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 14:36:17.8076 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a75cb3-27c2-4037-040c-08dd6c7391b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10059
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


(please excuse the line-wrapping on the previous email,
it seems that it was soft-wrapped).

On 27/01/2025 12:46, Adrián Larumbe wrote:
> On 11.12.2024 16:50, Lukas Zapolskas wrote:
>> Added the panthor_perf system initialization and unplug code to allow
>> for the handling of userspace sessions to be added in follow-up patches.
>>
>> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
>> ---
>>   drivers/gpu/drm/panthor/panthor_device.c |  7 +++
>>   drivers/gpu/drm/panthor/panthor_device.h |  5 +-
>>   drivers/gpu/drm/panthor/panthor_perf.c   | 77 ++++++++++++++++++++++++
>>   drivers/gpu/drm/panthor/panthor_perf.h   |  3 +
>>   4 files changed, 91 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
>> index 00f7b8ce935a..1a81a436143b 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.c
>> +++ b/drivers/gpu/drm/panthor/panthor_device.c
>> @@ -19,6 +19,7 @@
>>   #include "panthor_fw.h"
>>   #include "panthor_gpu.h"
>>   #include "panthor_mmu.h"
>> +#include "panthor_perf.h"
>>   #include "panthor_regs.h"
>>   #include "panthor_sched.h"
>>   
>> @@ -97,6 +98,7 @@ void panthor_device_unplug(struct panthor_device *ptdev)
>>   	/* Now, try to cleanly shutdown the GPU before the device resources
>>   	 * get reclaimed.
>>   	 */
>> +	panthor_perf_unplug(ptdev);
>>   	panthor_sched_unplug(ptdev);
>>   	panthor_fw_unplug(ptdev);
>>   	panthor_mmu_unplug(ptdev);
>> @@ -262,6 +264,10 @@ int panthor_device_init(struct panthor_device *ptdev)
>>   	if (ret)
>>   		goto err_unplug_fw;
>>   
>> +	ret = panthor_perf_init(ptdev);
>> +	if (ret)
>> +		goto err_unplug_fw;
>> +
>>   	/* ~3 frames */
>>   	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
>>   	pm_runtime_use_autosuspend(ptdev->base.dev);
>> @@ -275,6 +281,7 @@ int panthor_device_init(struct panthor_device *ptdev)
>>   
>>   err_disable_autosuspend:
>>   	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
>> +	panthor_perf_unplug(ptdev);
>>   	panthor_sched_unplug(ptdev);
>>   
>>   err_unplug_fw:
>> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
>> index 636542c1dcbd..aca33d03036c 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.h
>> +++ b/drivers/gpu/drm/panthor/panthor_device.h
>> @@ -26,7 +26,7 @@ struct panthor_heap_pool;
>>   struct panthor_job;
>>   struct panthor_mmu;
>>   struct panthor_fw;
>> -struct panthor_perfcnt;
>> +struct panthor_perf;
>>   struct panthor_vm;
>>   struct panthor_vm_pool;
>>   
>> @@ -137,6 +137,9 @@ struct panthor_device {
>>   	/** @devfreq: Device frequency scaling management data. */
>>   	struct panthor_devfreq *devfreq;
>>   
>> +	/** @perf: Performance counter management data. */
>> +	struct panthor_perf *perf;
>> +
>>   	/** @unplug: Device unplug related fields. */
>>   	struct {
>>   		/** @lock: Lock used to serialize unplug operations. */
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
>> index 0e3d769c1805..e0dc6c4b0cf1 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.c
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
>> @@ -13,6 +13,24 @@
>>   #include "panthor_perf.h"
>>   #include "panthor_regs.h"
>>   
>> +struct panthor_perf {
>> +	/**
>> +	 * @block_set: The global counter set configured onto the HW.
>> +	 */
>> +	u8 block_set;
> 
> I think this field is not used in any further patches. Only in the sampler
> struct definition later on you include the same field and assign it from
> the ioctl setup arguments.

Will have to correct that, it should be used for the FW programming and
checking whether a session creation request can be satisfied.

> 
>> +	/** @next_session: The ID of the next session. */
>> +	u32 next_session;
>> +
>> +	/** @session_range: The number of sessions supported at a time. */
>> +	struct xa_limit session_range;
>> +
>> +	/**
>> +	 * @sessions: Global map of sessions, accessed by their ID.
>> +	 */
>> +	struct xarray sessions;
>> +};
>> +
>>   /**
>>    * PANTHOR_PERF_COUNTERS_PER_BLOCK - On CSF architectures pre-11.x, the number of counters
>>    * per block was hardcoded to be 64. Arch 11.0 onwards supports the PRFCNT_FEATURES GPU register,
>> @@ -45,3 +63,62 @@ void panthor_perf_info_init(struct panthor_device *ptdev)
>>   	perf_info->shader_blocks = hweight64(ptdev->gpu_info.shader_present);
>>   }
>>   
>> +/**
>> + * panthor_perf_init - Initialize the performance counter subsystem.
>> + * @ptdev: Panthor device
>> + *
>> + * The performance counters require the FW interface to be available to setup the
>> + * sampling ringbuffers, so this must be called only after FW is initialized.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_init(struct panthor_device *ptdev)
>> +{
>> +	struct panthor_perf *perf;
>> +
>> +	if (!ptdev)
>> +		return -EINVAL;
>> +
>> +	perf = devm_kzalloc(ptdev->base.dev, sizeof(*perf), GFP_KERNEL);
>> +	if (ZERO_OR_NULL_PTR(perf))
>> +		return -ENOMEM;
>> +
>> +	xa_init_flags(&perf->sessions, XA_FLAGS_ALLOC);
>> +
>> +	/* Currently, we only support a single session at a time. */
>> +	perf->session_range = (struct xa_limit) {
>> +		.min = 0,
>> +		.max = 1,
>> +	};
> 
> I guess at the moment we only allow a single session because periodic sampling
> isn't yet implemented. Does that mean multisession support will not be made
> available for manual samplers in the future?

The RFC was intended to purely give a functional implementation without
periodic or multi-client sampling. Multi-client will be available for
both periodic and manual sessions, once periodic is implemented.

>> +
>> +	drm_info(&ptdev->base, "Performance counter subsystem initialized");
>> +
>> +	ptdev->perf = perf;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * panthor_perf_unplug - Terminate the performance counter subsystem.
>> + * @ptdev: Panthor device.
>> + *
>> + * This function will terminate the performance counter control structures and any remaining
>> + * sessions, after waiting for any pending interrupts.
>> + */
>> +void panthor_perf_unplug(struct panthor_device *ptdev)
>> +{
>> +	struct panthor_perf *perf = ptdev->perf;
>> +
>> +	if (!perf)
>> +		return;
>> +
>> +	if (!xa_empty(&perf->sessions))
>> +		drm_err(&ptdev->base,
>> +				"Performance counter sessions active when unplugging the driver!");
>> +
>> +	xa_destroy(&perf->sessions);
>> +
>> +	devm_kfree(ptdev->base.dev, ptdev->perf);
> 
> If we always call devm_kfree, then what is the point of allocating ptdev->perf
> with devm_kzalloc?

You're right, it's not necessary. The panthor_perf object could in
theory be allocated with devm, since the lifetime matches that of the
panthor_device, but it's simpler to drop the devm allocations.

> 
>> +	ptdev->perf = NULL;
>> +}
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
>> index cff537a370c9..90af8b18358c 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.h
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
>> @@ -9,4 +9,7 @@ struct panthor_device;
>>   
>>   void panthor_perf_info_init(struct panthor_device *ptdev);
>>   
>> +int panthor_perf_init(struct panthor_device *ptdev);
>> +void panthor_perf_unplug(struct panthor_device *ptdev);
>> +
>>   #endif /* __PANTHOR_PERF_H__ */
>> -- 
>> 2.25.1
> 
> 
> Adrian Larumbe

