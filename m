Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BBAC9BE70
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 16:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFC910E090;
	Tue,  2 Dec 2025 15:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="UTR2a42i";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UTR2a42i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011011.outbound.protection.outlook.com
 [40.107.130.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2A210E090
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 15:12:11 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dsZkRkcVxqLHzF8xc32XFC0TprTzY5QxU+0lcHgo7W0bhl/lqcC40zuf9slzFcKuyuGDmIOfTxuJikorkYYO2JtrrZEzV8/O4+B3k4OgI43oRSOWfLpbxg7TW2az+jKn3n2da0YeAUx3tEEx1swzeWkfgxdxmwQtYez0ENSgHwejOlXcmT2mgFW8ZgUhe7tgMwO+wiPp/Q7SW6JiJXX5qgxBhYkWS3rDqcINvmM1aOhSBhWyP0B3K8O3WlYqeGcYodquFT9byVDajaOkLvOomtSfzKc2xgR+L3UNRffCQ0cCGw8LS36PnPECCn8MJoRpMNnJwMtqcmmmcv4VmHk9RA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsEltyADmIDRVRTk9hFSxiUZf2NVgrjOnXSqbyHon+c=;
 b=qYfYGrzLErwiGCVU/r8JsW5OyWYrOnx+/rkHYGjuVAmmTnfH9mOVnKWiL1H61CyIq/7RtsRymfip3ak2Ftpm+l1VwcF8AJ6bc773wcZLFAosSoUzLC5WTghRnRlvrwuYup2Gfa4v3vCbgIM8Hk8hiCHqb/92vxcmkcQMNJRRlXJmTUuo3+mEuttpnLv4uz/eDQLqk+WEc/sZ6PBJRiEJ4m9zq+7YCZtE3JI+/ynCBn0z63mWAF/vw50m02uNAS9y3lrynDcdUw+LDvbLCCaVbhp1PvtNiOzzNQB/vmAs5oqhM2t0A+cRSruxIVIpAI7+mMBKXL6mRVZL9E5XQ6F1Mw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsEltyADmIDRVRTk9hFSxiUZf2NVgrjOnXSqbyHon+c=;
 b=UTR2a42iZ1ef9slTg3j81T4x8nC6VcclrRdtFOA1jgakpFb1UF4XTfDH7xQT4Iww0Ieo+cwN/OCFRQ8zTq58siiiXaWFdII5EJjcZD0yF2N3PmOo10wzzkBDekvd1kD2k2SYxekNsphrhKaApOt3v0ANiX0xyd21z9YtlxGklFQ=
Received: from AM0PR02CA0153.eurprd02.prod.outlook.com (2603:10a6:20b:28d::20)
 by GV2PR08MB9232.eurprd08.prod.outlook.com (2603:10a6:150:d9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 15:10:48 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:28d:cafe::c9) by AM0PR02CA0153.outlook.office365.com
 (2603:10a6:20b:28d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 15:10:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Tue, 2 Dec 2025 15:10:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMpKzElJgCQld8xXlXvN96UICDZQLd4zifEjFGIh2xZoI3ZSAZBKZYLLP9v/x+hVf3w67tdQjoT0LRP6yp4Km+5DMFEXKe6sSFKcij4S6HXtu/qLIcnmOJDzOP6bJwSxRnnI4OCqfuKc6Mf8FurzdWsq9pIUZaAOOfG+e5EES53N4bNP7Hz0fP3XBGTpzMg9ze6/GsnR4FJsRPchTOjqCJvAmIu8uWWd8C2A6Y4SvpNNBfdarKMnh+pDJNR1dm/sqArXq7JhcJTmAQEiMgI3jYuxjmzHBEYq7Wex0tfvYwb8L9fzxH50jHW7SpHz5+AuVXOYXC67Djxuqtabk75OSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsEltyADmIDRVRTk9hFSxiUZf2NVgrjOnXSqbyHon+c=;
 b=vL1QANI0Jmohw20lw29fR1lRxNerGkuf0uGhTgMDnsUN7V2mFUyprFWuo7gMVTKuk4Rd5F1tlJoQlYEZeY+yksD9ueaWEmMs7vh7JkkUI2rtW4V+KqROKd6yCpHZag18gO9QhAbz8AqbnNM56r0GWOW0L8nakTsw3L9xsmtS/R99HZIwObBoF5vKCYw7ejDLVcRyj7tRfjGRAJ6MSO5rtdEmoCnQhWfMccx0GDiEYeQZyvU6s5UkyA30eYgndg1LqwDLuUWRinCeCrYP+q2zQR4BMpmmxMQKBJItoEkdsjX+AD00i9SSAf7E9/o9pfnkbbXYQ1PohB3UdvVo0ZCmrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsEltyADmIDRVRTk9hFSxiUZf2NVgrjOnXSqbyHon+c=;
 b=UTR2a42iZ1ef9slTg3j81T4x8nC6VcclrRdtFOA1jgakpFb1UF4XTfDH7xQT4Iww0Ieo+cwN/OCFRQ8zTq58siiiXaWFdII5EJjcZD0yF2N3PmOo10wzzkBDekvd1kD2k2SYxekNsphrhKaApOt3v0ANiX0xyd21z9YtlxGklFQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by VI1PR08MB10029.eurprd08.prod.outlook.com (2603:10a6:800:1c6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 15:09:43 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 15:09:43 +0000
Message-ID: <1bf563a8-0670-4167-b909-310220e4b57a@arm.com>
Date: Tue, 2 Dec 2025 15:09:42 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] drm/panthor: Unlock the locked region before
 disabling an AS
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, nd@arm.com
References: <20251202133538.83078-1-boris.brezillon@collabora.com>
 <20251202133538.83078-4-boris.brezillon@collabora.com>
Content-Language: en-US
From: Akash Goel <akash.goel@arm.com>
In-Reply-To: <20251202133538.83078-4-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0048.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::15) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|VI1PR08MB10029:EE_|AMS0EPF000001A4:EE_|GV2PR08MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: ca59cbce-6f38-4750-e4d9-08de31b4f90e
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?bk9yNmxrZzlaZGRrRkFFcXpzMXhkM2RNOThoRzdpUERZekFPV3pYY0lnQ3VM?=
 =?utf-8?B?bUY2eFdGMHcxSFdiZ0JOUzQ4Nks0ZzVORm1OSFg4dXhzSU96ZnBhUEdLWjdn?=
 =?utf-8?B?L2VKcUlNWEV6ZkZGbjF3SzJ3aEdLNEc4d09ReDdwKzVLTy90cWRpdHNPYzhk?=
 =?utf-8?B?WS9DYk1hQ3l2Wk5XQlZLeWpyN2tVbEdKRWIrK0RHMlM1RE9sVVY5TGJGZWF1?=
 =?utf-8?B?VS9iYjVwZjZhdTQyZzB4eDhSODMyYXVwbkRJZkRETVd5SmkxVU5iTUxDdkY4?=
 =?utf-8?B?WDllMkZBMDdYNUxPS0xEejVFQzZrVHNJTHRaTXVoRW8zUjh5ME1pNXFyazVr?=
 =?utf-8?B?bGRqVHVvMmV5VUg5VXprclN6WkZxbVlTQ2pJeTNYQWVZSks3OHlyTVZ2QXJ1?=
 =?utf-8?B?T3VvWE9jT1BjY1BmcC9lcUQwR08zazBueWxRZjl1RVhLaFJtNVozQ2RHNHdJ?=
 =?utf-8?B?VUxvM3hqdisyYVR4R1pCNUxFN1AxN1VHNlRIS1NWUU1MZWhQMlc3TXR5M0VH?=
 =?utf-8?B?cjMyUWNrV05OYmlMb3BIN0gwcHkrT1hHcm9ZSkY0NXV3MjgyTWo1K1dHVWJO?=
 =?utf-8?B?bksydHdqZldkeEY2dW5IS0t1MVFaaXFsOHZzcW9CVkNFL2dtRFF3OUJYTmVh?=
 =?utf-8?B?bVF5TlNLOTdRQUFRdXlVTHRWZEdPSVFPcWpBbzdzREthZWRXZm8zVkdOUzUy?=
 =?utf-8?B?MlZLdVhoL1pmazNaOEhSbjJoWlovNFVYaWNGU29xVG4wL0pwQlVFeEpBUkJK?=
 =?utf-8?B?L3IwNm95dWZyditnNU5GN0tSY3hCVFYvR0I5cDlZZkRYM210MEtvb2tab3NL?=
 =?utf-8?B?U3c2ZVFjOHU5MkloTFM1WkRMbENJUnk3amxhM3dqOWlZUmdlUnU1ZmxVbHNV?=
 =?utf-8?B?N09jWkVOTjI0d24yMXFVQ1p3YnNWdE1xRERpL0ZNdEdWeE02d01qSjhmN3E1?=
 =?utf-8?B?RmsyZFFUcHp3bDJGYmN0WFhzT1J4RGhZbmQyK05vMzNUdHNhZW9Hb2xSVWt5?=
 =?utf-8?B?OEFDL25WZlZXd2pqcE4wcVI5eXdja2hlak4wSnQ0MzZXc21HSzNNS2ZnMjhK?=
 =?utf-8?B?TzFYMXhhTnpwcUY4Tk1WSHljK3IyenBtU0U2bnBCRXYzMXdERXFFY095andn?=
 =?utf-8?B?eDV5aldpVHpuRlJqcVo3TWM2ZXN2YWRrUjl0Q0tZby9UNHNueFY4S0NmK1o3?=
 =?utf-8?B?dnNHNDM4TVI4WWY2TW5Rbmh4VitBblhibGR4WjFVbzEvL2k5ZFhOdFJtNzdR?=
 =?utf-8?B?c25SbmlNRldrUXNka2pRRlIrSmhUQmM0bXFpdlZOL3RzRXJWRTNRSVlCMVAv?=
 =?utf-8?B?eFo1dUZLK2ozaTBRd3VWZ0FXWDZuZnJJR2dNRVZLRHRjc25zK1Z5VXNZMG1G?=
 =?utf-8?B?ektNMGZjMDRvS3BEUnV1azBicHVKZytwWmpyWjhEVm9ISEtUQzBVaTA4REJi?=
 =?utf-8?B?R1hPVml3OThCdkw3bHJqTzV5UzZ3VUovcmE2bitkTCs5WjlLNUxTNUw1Vk5j?=
 =?utf-8?B?bWlWRW1SWG1ESnhNTEhReDMycTBnam82VlBkcGtBbFNGNVNBajY2MlhqTDVt?=
 =?utf-8?B?a3FCcW4zZ013ZHpMNXNuM2t5NlQ5WVRaZFArck1oYlBpcENHWlM2eDVCdXRh?=
 =?utf-8?B?TG9NWEgzaE9KSUNFVnBnOGg3UER5eEhDRURFeXpWditOb01ZMjdpK3BXa3JN?=
 =?utf-8?B?c2NFcmVBblZlclRxLzJsVTFqZC9wQm85N3BUSUgzNE9FM3lSRkcwSVJzWTZR?=
 =?utf-8?B?TVRkNHVqcDhpdStQMlIwbTVtVHFITGZ4YUlJMWVYVDN4OE9WZW02RU1MVmcx?=
 =?utf-8?B?SDVqcENoQmdPZnI5QVJ1UUU2Nis2N2tPQXZVczBTcHc3Qms0N28wSkczenhw?=
 =?utf-8?B?ajlSNGJGNjJGWnRiMVJ4aXd5bDJHWWwxRXlzN01OcTgrUmZKb3o5TVlWR3pK?=
 =?utf-8?Q?PQOVPgwxR0jODb1EyqLX+XebYwbvOl36?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10029
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 60f8e2d0-c418-418a-69dc-08de31b4d2f1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|36860700013|35042699022|376014|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elFKLzNveUdnanFDNlcrSG9vR1B6eG91K2NjQ3VMbDE5cEkxMDk1VlY4M0hx?=
 =?utf-8?B?VGIzTnRKWUMyOE1RTG4wSkp0bnhudS9uZnU0d0Jrd2JyTnIya3pxTVdjaHRL?=
 =?utf-8?B?cTZmYWJNL1Y1d2tBNTJMdVhHbnJFWVVyNmFUb0NzY3NQN2ZPaGRHalA4RCtY?=
 =?utf-8?B?WGF2eEFFYmRRWVlWalJpTUlqcEFwbHgxMzdVdDZVWG8yaW4vNWdCNU5EV29s?=
 =?utf-8?B?QTA5UFNhYkhlMkJPWUUweGJzOEZheVRLNEdpMWZuWW8vd2k0bzZrTUdxbWlF?=
 =?utf-8?B?QUk5ekxMK0tnV2ZyeCt5Y2RFMTUxNGlITHUzNW45STBGNFBjUWNubkhLOHJ1?=
 =?utf-8?B?RGwya3hUV0tNb3ZDM3hseFZ3ZG91Y1JyQU1RTXRYTHhqeGtaNmNoZkZ3N0U4?=
 =?utf-8?B?bVkzc3FWY2VtbXdsODE3cXVzNnh4cm8zNklrQ3hONDFQajV3TENGNDJlbE1r?=
 =?utf-8?B?YStlZ1JzWTVJNVlYWHZqL0xPbTlCSGFwNEtFbVc5NDFXVmh6dElrRTRYcDVM?=
 =?utf-8?B?ZHlVRnpnZGk1dG5nZEtkakx2MHJLRzZoQXRsb040UVNCRWtDNll2bk8zTjgx?=
 =?utf-8?B?c0tLVXZFbUlLdjRNOUZVamYyWEUzZkNvT1piVFJhemI3RFkzdTNEcWtkWEd5?=
 =?utf-8?B?ZURRb2sya1A0RTV6S2FyVjQ5VHNhaHJZZXBYWG1VR0VSemZuSFB1VDNqWHBU?=
 =?utf-8?B?YTdiR056WDYrUDZzSVAzRGxBcSt2clk3Q1BGbzkxSmZLRVlVYUIxNTlQalcy?=
 =?utf-8?B?dkw2V0YyUVlwQm9JclZXdC81MXgrdzVWNkI1REkrVEowNkNzNU1YQkZ1K21Z?=
 =?utf-8?B?aHdvQTFvYmN4aksveUNwd0hmai9nTXZUc080QnpJc1B4SldhK0hMUUovQkwy?=
 =?utf-8?B?UHRjR3NzTG5VVjNiQ2hhK3lQZXczNDQ0YVpTa0pld3d2N2U5VmhoNE5YZ0Jn?=
 =?utf-8?B?SHUrVDE0dytGd3BLNlYzV2dJZ2VQNk9hUllWaVp4UUJsQ1J2Q1BLSUFWMUdD?=
 =?utf-8?B?amlrN0QyUVJUQ1VQdm0yeDhuQXU0empvbk5JVnJuMk91YXZOOVB6MS8zNzgy?=
 =?utf-8?B?RU1oRzE0OElnUFp1eSs3Z05YbzZEdlc1L2Vid1hqNjhPMFNHRm5iejIvUlBl?=
 =?utf-8?B?em9XYkVpUDg2VlpzNXc4SmQ2M3VmSTJlclYxK2ZnMkp2dlJCTGQ4aGE2NnJO?=
 =?utf-8?B?VWVNRXU1VHFaR3c4bmdiK0krWVVaSDZBVlpCMjB0ZGZiYWJZdVJWZmNkYnRK?=
 =?utf-8?B?S2YzcC8zYmFicXE2bG45d2VucG1za3pRWnRvWit1SmJSM0VMbG5reXUwTWNN?=
 =?utf-8?B?U0VHS2hjOEExL1dzbDZMc2E2dmVJWUxJYUFiTFAvVEhsc1gzRFdiM0thWFVk?=
 =?utf-8?B?WTdHUFpVZ3Y3bTBueFZHNyt4MEhvVjRuaG1OQjR4SldtNS9TNEE2am9qWEMz?=
 =?utf-8?B?YnZWbGhFQUx4bVlYdU80eGlsb0N5cnY4MWlpUXNZM0tMVHR0MXliZkYyVUpR?=
 =?utf-8?B?SGtpcGRVM01qOStJemNqOERVeUtSMkhRYkp6dlBIU3ZZZklicVVTQ2ZiajBE?=
 =?utf-8?B?aWJXN3ZZNFZJc3RGbmczT2U3Ri9NaVRncERCVmxMME1ic0JuWUx2N1VLL2FO?=
 =?utf-8?B?bHZvOThHQWdiSi9JeWhsM2FzQ0FrM055WkdEeFY4SEtOY2dUNktXb29PNVBp?=
 =?utf-8?B?YXpSSXZFZHZ0R09wTFR4c2d3RktNZ2F3RFUyRXU0Q0J5YWNtUjY2WjhlQ095?=
 =?utf-8?B?eVpuUmxLRWdNaUJjVUd1NXJOQnFTUkZuOVQ2dzRSYmcwV0dFTkFKcTd2Ukhp?=
 =?utf-8?B?TFVKN3Z6NCtIRUVxRHBCSitWQUZ6ajNueFhMOEdyZnRXSUEybkdGZ09peitX?=
 =?utf-8?B?a1V6NXluc0hyeFY0R005TGhIZ0lyRzVkMVp3WmQ3M3RGTEFYTmxibWphMEZi?=
 =?utf-8?B?Y2MvQkNYK1RHeVRGQ3ZxakgwWXdiWnA0K3FrTEFWekZ6QnNqbktKdnErWnJM?=
 =?utf-8?B?VXkxclJRY25nM1lCTnlFd3RDWTA2eHl6aW5QbGhqTDh2MmVjYUNLTVUwTE0r?=
 =?utf-8?B?dnhNdHMvbjVPUWdvRE1xWk9SZS9ZRzlxbUtWUmJVcURjT2RQRi9kRDV0dHAw?=
 =?utf-8?Q?q8fs=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(36860700013)(35042699022)(376014)(82310400026)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 15:10:47.4723 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca59cbce-6f38-4750-e4d9-08de31b4f90e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9232
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

Hi Boris,


On 12/2/25 13:35, Boris Brezillon wrote:
> An AS can be disabled in the middle of a VM operation (VM being
> evicted from an AS slot, for instance). In that case, we need the
> locked section to be unlocked before releasing the slot.
> 
> Fixes: 6e2d3b3e8589 ("drm/panthor: Add support for atomic page table updates")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>   drivers/gpu/drm/panthor/panthor_mmu.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 3644af1a8e56..4ed28bd1b8ec 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -588,6 +588,7 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
>   static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr,
>   				  bool recycle_slot)
>   {
> +	struct panthor_vm *vm = ptdev->mmu->as.slots[as_nr].vm;
>   	int ret;
>   

Thanks for the fix.

Please can you consider adding a lockdep_assert_held for 
mmu->as.slots_lock. That would in a way make it explicit that it is safe 
to de-reference vm pointer here.

Best regards
Akash


>   	/* Flush+invalidate RW caches, invalidate RO ones. */
> @@ -596,6 +597,16 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr,
>   	if (ret)
>   		return ret;
>   
> +	if (vm && vm->locked_region.size) {
> +		/* Unlock the region if there a lock pending. */
> +		ret = as_send_cmd_and_wait(ptdev, vm->as.id, AS_COMMAND_UNLOCK);
> +		if (ret)
> +			return ret;
> +
> +		vm->locked_region.start = 0;
> +		vm->locked_region.size = 0;
> +	}
> +
>   	/* If the slot is going to be used immediately, don't bother changing
>   	 * the config.
>   	 */
