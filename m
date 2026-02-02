Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMCUMI8EgWnZDgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 21:09:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7B8D0F4F
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 21:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9857C10E193;
	Mon,  2 Feb 2026 20:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="ooSN9MEG";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ooSN9MEG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C01E10E193
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 20:09:46 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BM7OBguu+IN7yggJq8aHX36RQ/cl3Tk+Be7LD8pkgzsByknBiCk6TT2WGak9J0Uq/nYCseStIOP6pqox3Q7hn0Lfi/4EQRO2DZFtJEyEO5cISReergo9+gA/lT/yXKQVSr7g85U7yh+sS8wlCyoTyjPB4meGG/iIIJNecGLmkkUxy5fmFPsre+331bHN3Xp7y0k4a561m7rkcKGeeLAjtCcwQeW+X9b1xal05mU6+C8MddjeC1VSU3IMFauQ+jPxdO8udubQBhbIETbzWj1P8DgD0j+xD5bnY9KT1xDZQt816OdhlSeADDSV/vvNQBC26SdLCheum4GoJbVuGIVwtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ocbbFHZVgMFsL0AE4eE0vsxoe2MgpGPOBnMfgkXDQQ=;
 b=TJqrWO+VdjtKbgL5UUbmMK7f/+VB7/7PMFVPe8IN1wQ523rlOugoLldcTLedNVT0kWiILddZQbrZ9Hhs8HgB2hmn8dw8HaWUf9phLwYB1fsa4guyV0FSE5Du5lnRkVppMDCCCTV+RaOxif+PD4cWXTpxhtIg2rYO4dYVHi5xrF2jfGgayDaOwBE1ZJaHRIAx1/WQV/SQg/v5MG8GEzllUbyzroXhPeAFFAh3yfP/8W8nGCNhoHC51f2lRFjIkAsmh0WOKV6mSJWpV/wr/dMDsqNUHwaQzJa0GPjntUkGeZn4WW6YRbHtNttL+H86UPKn5ckyXD9X133LSNMOVSwH3w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ocbbFHZVgMFsL0AE4eE0vsxoe2MgpGPOBnMfgkXDQQ=;
 b=ooSN9MEGBqGn5cxwzYaQV1GXkGv4c7Y+3/l3dlfQwOVx1+I32Q6H/TXeewgBLpVnQMZKzIgDeEaeCjUL4HlZSPqp1uH3hVMLoJBV3XHAOU/tWeG1BgtZ4GQYWG8zXdZTyMJ9XTYJDDES0j3ORwu1BZpb8bNRlCWH6iurgwUdMDc=
Received: from DU7P190CA0001.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::27)
 by VI0PR08MB11041.eurprd08.prod.outlook.com (2603:10a6:800:256::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 20:09:37 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::39) by DU7P190CA0001.outlook.office365.com
 (2603:10a6:10:550::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 20:09:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 2 Feb 2026 20:09:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUsI8qT3cuWf+UwENG4FTQ1VwhSJEDV3OPCYVtglwrYknyMGKn7fxlLShceT2LXG1fj41y1yVD7MzqKmvY/uvE//nrvZbrPwSagjB+Q9CC8KtDqSx6Vwr4Sx5ZO3+GGxzACwAulTzhqYChDljLBSg5WPuA4d3koUTt2vWnsttqIRPAU3Cj9P2dvnrC7cqqWej6ieeZCUxuQPL4BEKwp0cKCeY9RyhSadBBdEc7yQwDiqp/kEUQeQ4Ph0PR4Ngn9/UE45WpVdYxzMkoQSHCfHGbNnq3kU9C9uJ/tBH8JvQk00bfAxJgvXUgUUHz81fKOsWLxT31DvrlP1BtrfFNKM8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ocbbFHZVgMFsL0AE4eE0vsxoe2MgpGPOBnMfgkXDQQ=;
 b=W+FMJ6cVjqmpczYCoCVDIhUO6fIav4MG68tAlKCyqJSZbFp8+ux9/m+mCjGFv/20kuNqzFWXuG1u0PhPJACq56F3HbzwIE1vFwUpQ4kNUbBFQY0/gNT8u1Py8wmmezO5GR+mXcXwheN5QULiBl2r1RyXvyRjwFuA0MAmK8lL5dCIRwnyTsf6HcwgTEqM/qJogCl6u21ZeKfWAuIwjQYVnxeXPCNzvDPSRk6//o+CiFe0Nl30kPgIWWBvjhaevB4aRUy8IK/1Ry7MQzira0itKjfptMSs2YFnK1AMGZKESs+XFbHhafl97IaY8BlvFcyDiltQPbMALba8mUMDkf99/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ocbbFHZVgMFsL0AE4eE0vsxoe2MgpGPOBnMfgkXDQQ=;
 b=ooSN9MEGBqGn5cxwzYaQV1GXkGv4c7Y+3/l3dlfQwOVx1+I32Q6H/TXeewgBLpVnQMZKzIgDeEaeCjUL4HlZSPqp1uH3hVMLoJBV3XHAOU/tWeG1BgtZ4GQYWG8zXdZTyMJ9XTYJDDES0j3ORwu1BZpb8bNRlCWH6iurgwUdMDc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by AS8PR08MB10142.eurprd08.prod.outlook.com (2603:10a6:20b:633::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Mon, 2 Feb
 2026 20:08:33 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499%4]) with mapi id 15.20.9564.014; Mon, 2 Feb 2026
 20:08:33 +0000
Message-ID: <e44be9f6-b7d8-4586-a72f-21e704b8579e@arm.com>
Date: Mon, 2 Feb 2026 20:08:30 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] drm/panthor: Add a GEM shrinker
To: Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com, nd@arm.com
References: <20260202113607.1745667-1-boris.brezillon@collabora.com>
 <20260202113607.1745667-9-boris.brezillon@collabora.com>
 <31c3f2bf-e530-45ae-900e-4e25db54f367@arm.com>
Content-Language: en-US
From: Akash Goel <akash.goel@arm.com>
In-Reply-To: <31c3f2bf-e530-45ae-900e-4e25db54f367@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0158.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::19) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|AS8PR08MB10142:EE_|DB5PEPF00014B9E:EE_|VI0PR08MB11041:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d63afbf-4deb-4a56-e9cf-08de6296fd03
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Lzlhcm9vR1c5MVFmemRFS0g1L01RaFR4Y0JPdG5WUnNna2tPcW1TdWlLSHM1?=
 =?utf-8?B?TVpkZWdGT3lTcklod1FodXllbm9nT0w4TXhLWlE0azFYbExaNEZodVVBemNM?=
 =?utf-8?B?c3RBdjYvKzF3TnlvT1lBcVJHZ2RiWkhSZ0N5NnVEZmFDNnhlQ3k3c0ZhVTIx?=
 =?utf-8?B?OEdsY1dLUFRlMGFvdmlPYTFMZDNhSWtaZjNwKzl2eEtMSkJVQllWTTF5S0Z4?=
 =?utf-8?B?ZmozS0F1Q29KakdFNjFXOVUzd0ZzVXg3WkRnWnZpbnY1YWYvK2Z2UkJRbTBV?=
 =?utf-8?B?dk1SSHlySUhFakgrcGU0YzRiVVNibDFSelVaT3h3OGVEYzdQR2doQityN3M4?=
 =?utf-8?B?aFRDeHZjRVdqKzZxeEZvV0FCcjA3NDRON1JtUUNJQ1hlMkEzRlNXS08yQ3Q2?=
 =?utf-8?B?a0Q0OS9wWDVINlNtcjN1Ni95ZkZCaC9pV0dvWjRrT1hLRCtXMHY0Um9PMTlS?=
 =?utf-8?B?bytjLzFGenZmTjE4ZUlaSURPSlk3TUFOeWFZcHpaWW1YUEorRzBuRmR0aG8x?=
 =?utf-8?B?SkJxa3lXM3EvSnRySXRFb1dyTGlTTGpDZ25TOGU5RFVhSGtmaWZxekFPYjN3?=
 =?utf-8?B?ZGhpR2gvbjA1SVd6a1U2cUtkTDZ1UGEwQ3R3cGg4Z2IvUWRpR0ZyMTd3OUlF?=
 =?utf-8?B?bXN6aEE1UEtxY0VESndub2lZRDdXZC96YUlVVHZpVmNvbWhCcWFCYjF4QWIw?=
 =?utf-8?B?WnlxYnRDYzNrQzg0eElkNjVtTldVUGpZMER3eCttRWN5WjNQUTNsaERsYzdW?=
 =?utf-8?B?aEpReUtPWTJEZ1cwYUcxdHN3c08xUVpvODJ4WmFXSWR3WUFyL0FsamtOcDhF?=
 =?utf-8?B?RkxQZ21SN0dhU292WWpRVExrL0FaeVBIS3M1SExNN2V5eEgvbHhXd3U1VC94?=
 =?utf-8?B?NlpXcDk4SlpHWnkrNTh5MUhTSmtDY3FCSUkwbWM4ZnRPeE03VVNRRFR6ZEl6?=
 =?utf-8?B?aG4rMFNCaEEvNW1RcnZyclFGUUdQWFdMQ3VVcjdhVDBldnpzQldUaloyS1hZ?=
 =?utf-8?B?N1NZdVlqdXRtNUQzUkJuVjlIekxYUFEwdUdBSzkwY0xxbCtzWWFNcmZ3NzF6?=
 =?utf-8?B?ZDFaZjVDWXJYemdtUXVVRCtESGVTZzV3dmdTdnhCRUlUb0tyU3ptVS9CZ2lS?=
 =?utf-8?B?MFdNSTZUcEpnaUZtTklWMGRSZ1VOTGNJcUZGWnJReFlzYkVGR0RvQnFRV3Nu?=
 =?utf-8?B?Rk9qOVhrVi83Ry9nRkFzWXdHRnExaEpWOU5IOHVUeWpGb09JK2d4ZzdCUGdS?=
 =?utf-8?B?ajN2WGlWRjhZTXFHRVl6RkViL09GczZaWDVkSUhFZ1dLNk9uT01Kay9PK0l3?=
 =?utf-8?B?S29BV0hNS2JjSWJjUG1XbUVoWjE4TjJCSkxnK3hxTGRsckVFSEdFKzRITHVQ?=
 =?utf-8?B?Z054dWRtMVk0SWJleFB2UVE1aEY5bWJaM2FVd3ZvQTdqWWwwUXd1cXRGWFhI?=
 =?utf-8?B?RzFCU2JDNEFSZXNtY0piN1VOSjRKMGZjMVRkRUs3MHNBbUZNallaZU94R3p2?=
 =?utf-8?B?eHJ5YTBydkw1K21NOFhpb1pPdkNJSjZ6L0tWQkQrRUl1OXpWdEFPVWxoOUxn?=
 =?utf-8?B?dktFbUdoVkJEMXU1S0h6L3NmWlFjWGluVElPTVJiOWdJc0FsZkp3NDBGREJu?=
 =?utf-8?B?QXoxdjE5Y3NNWk5VQzcyanRGT29SYU5PUGc4eHJqbTRkdzdxUmtaVTlobkRF?=
 =?utf-8?B?MFJxQVV2ZFpXQUVZOHBLVzNQdGJiL2VMYVhpd0NCOW1ORG83dkdjR1A1eDM0?=
 =?utf-8?B?WlJZUVhNdnJwbFRjeXFGZDZXbngvcnkzWXVXei82dEFEWWJDZUZpTWM5SHox?=
 =?utf-8?B?VFpCYndNUEE4d0srWWpMdUJyUEw2K01ZZkg0NGcwWHdrZWFaa2hJWFAvMGNG?=
 =?utf-8?B?NFY3ZXlzaE9qSWlaMDUzN0FqYndocCtFZndMbWxidjV3THhDeXBjbVd1MHBB?=
 =?utf-8?B?MWkvMWVpNFg1NGZDWVdCUGpBYkRlYXhzandhOUZQbXZmanFkVDVJckh4MW90?=
 =?utf-8?B?ODhWNlNUU3Q4ZnJ3ZmFyWlpjRzhpQXFtSFpyNHhBNnN2QkFiVXRSaUpuZXha?=
 =?utf-8?B?NnRSbTNjOWVFYjNoc0Z5S2NtVGVmWFFkejRPeFpsSHhPS08wdHpqN0pJcXdE?=
 =?utf-8?Q?8Aac=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10142
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2e5553ea-3d1d-4950-d7db-08de6296d730
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|35042699022|376014|7416014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXFENXFFMHY4VEgxRjdyV2lqWXJUTUJzeWlUbklkOTNxaFRTYWhDUUJpc3B1?=
 =?utf-8?B?cGlJenlzMEJYRmltQjIrNERqRUxqaFVaVGZZL2tOeE10SlMzSzBwcGliVkpX?=
 =?utf-8?B?TE1NL0NXTnIyZ3VlTVBPaDZ5dFlnZ3R4dkdKL2MrNHg3MGVUbjhscU1LR001?=
 =?utf-8?B?YVp3TUhEbDBZbnlyaFFpa2t4QjhNanJCTkdTVnhpMXBWbHcwZllwTDdJcHVL?=
 =?utf-8?B?d0tLQVo3aDVRRENHaTBSRUppOEY5UE1pZHhQSW9Xam16bXphamQ2bEo4SkhF?=
 =?utf-8?B?WFlaeGhQZ3J1VTNJb2V3UDdlNG16ZEMrTWpmYWttTmZKaUg5NDhrTmQ0VUJU?=
 =?utf-8?B?TGlQaXlRMGV1MFEzZHBaQnBqejAyWi9jVk1CbUQvTXJiZEoxbi80NzlTK255?=
 =?utf-8?B?NFFsbUNUUXZEWlAyNHgzZDUwNUFoN2kwN25PS3IyWHlpUU1ZbHVYUWphUjJZ?=
 =?utf-8?B?L1hIelNvcVg4T2gwRk9xdit2UGRtcWhZTGQwRitaRzF3dm11UGNmWkVUZndS?=
 =?utf-8?B?N3Y4VkdBUmYrUkdVMUM1N3dFOG5jYmpzNlRDTVJDZkpVNU1vT0RBSER5WUND?=
 =?utf-8?B?UmQ5UE9CRXRON3lvSkhMRGE4SDk0MDFQcWlzTWh1amxqTFo3RGFuZGtTR0xF?=
 =?utf-8?B?b0ZzQWJISWVMcU5KZmhJTVZCUENXQmJrU0pVTXRaNkxpOUl6M29KNFh1OWpE?=
 =?utf-8?B?S3dySVM3Y09qajc4dmsxNmR4SDBSaEc4Z2hVOUx0a3FiazRtWTM3dG52THN5?=
 =?utf-8?B?T3VhdmtUWTVoNmNnSzN2MHBNZElicnhodUNkVUxiLzFFekc3RzJvRkFiWFBu?=
 =?utf-8?B?N0Z1ZUF6NmJyTHhvYWt6YkpHZklZbjNSOUVTZlM0WTNqRFN4WnBaSk84TWM5?=
 =?utf-8?B?OWp5dVhhdC9kbVRzSVZ0WGpuVzFkMnZBb2h2ajRXU04ra3dIRFd5WHdFY01m?=
 =?utf-8?B?VnloNFFhdkFvcGVlckp4aHM3NVpOSXBWSUVFdHVWemVsWVBKNVZOb3NoY1R5?=
 =?utf-8?B?SG95aXZlYlFFQnRHYkhYUTEyZnF4ODIyWGQ2TVRPMytWb1ovdW1zWEdibDJv?=
 =?utf-8?B?S1grTkZsdmxlbnZkYmdCY1ZrMGE3QVNTdEZNUmdwRG1YRytmRDdDUWRYakZi?=
 =?utf-8?B?VTBlNXhYV2dTSG90V0ZxaTl5dmNJTS9BYzAwVmpBRzliNEVPdWFzcDJ5cmFM?=
 =?utf-8?B?VWQyWXdVNVlZZTVMeTI0V2JKTDNVL2VZNmVmRjgxWDJhZ3NXSlRuZlRBMTRa?=
 =?utf-8?B?WjBrQjZLSTZlYXJIeXY0aXFqMWtORjh1NjU0M0t0UzVQelArV3M3dHhEMTN3?=
 =?utf-8?B?ZXBXVkl3KzFIckFCb0FQdUhZbUQrRnB6NDJJakVzSHVQTFJ2UndhcEJhc3VS?=
 =?utf-8?B?SCtwSWF0L25nMVp4bE1uYzFDL3B4Uk1RVTg4dFdHT29zSTNEaFBHS01Pay8v?=
 =?utf-8?B?WTZscW1OOE5WYndQR2g1cjBJV1NuTkhBeloycHJTOEdKYVZlVG91eU1YaDFS?=
 =?utf-8?B?M1J3a3g4akZUWGp3VkVZRUdqYTBid0syUm5YSjdTVEJBdCsyTkRzVFpnNjNn?=
 =?utf-8?B?RmY0UEhOSVhTZThmTXdQSS94cWNUTUVPbW5yTmVETXB0T2Yyc0ZmNU81Uk1I?=
 =?utf-8?B?cHlUWERaRTAwMEk5elFzeEFFS3BUVWpRNUJacVZDOXpRNGhGTmxZS2tXa0E2?=
 =?utf-8?B?STgvbU9qY3FaZUpIencvcDZ5OGNTTmZXMkI1eWRaUzIrMUJTaHdTWUVxS3U2?=
 =?utf-8?B?YWkzNHpFWExhbHU5cmlyOERHdmdqWXczMTd0UTNTemtObnBrRStYblRqWXRN?=
 =?utf-8?B?VkJ6ek41TjJ4T0R3QkVUK3M4N0gyRUlXZ3ZFZ2tOajgwdThtVEFxQXAzLy93?=
 =?utf-8?B?Wlp1V3ZzRVhCRFpTVHRTTi9GdE1XRTh1UHMyOWN4dzQ5MjQ4ZnpvU3pFbnJy?=
 =?utf-8?B?N3p0L2o2OVZ0aVFtMUlTVjhaUFd5TFF1SHBJWDM3V0NIbEgzZVdTUDlmT0w5?=
 =?utf-8?B?cFFNS1Y0WXFQQ2pLZ2d5Vkk4TlhRM1EzcE42QXpwRWlQNTIvT3N5dDZJelJD?=
 =?utf-8?B?d3dPVGhGYnlSSVc5V2treGppZ3BuYitxeUVkcDVFMlV6WTIxWHF1ekZkcnV0?=
 =?utf-8?B?NjlYTGdCZy9Md2p5SzFMZ2MySThLY0E5TTNyY3BXWXFWY1dOeVNCZFlpb3dR?=
 =?utf-8?B?SnVSOTU5YTNLdEFpYmtuN1hhNmpxZEpETC9ERy9JTGF2eDhBNGlhTnJwVXBW?=
 =?utf-8?B?Y2hYY0xUdnp3Tnpxbm9TbCszY2xnPT0=?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(35042699022)(376014)(7416014)(82310400026)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mgf8DSfC0KJ+e70PLerBMRclVm4UKqOrWqAXK6LOTty3MFvhP1fLn1N3/+flC4nKlDB4iofsqE8QBjVVno2HfzkUcN4ZVa7AVrrksRaz6sNeCTyflzEwLXuA0DNXbtVUlqlT8T/x7dFiNd9iwn6VE2tQNOqfdjsqisaU0iRQGR6ZuWY3NCiPJ+pqHK+luIQzwEIK0lCEOx12KU2BP41toeF5yG08PLbk2n1vxFGU03MQT0KqyO0Z5Uaw2vSFiFqkr5kOpgwFQeevKaaV/f5mPRv/BV65kmWURuKwlODudlfNcLPl7Z0nNrsvt/0lYCkQXcbZxvEka2tortUg/S+6q+lvJ6wUPepCvK8NG2K5ooIB4OB5ezZq1cUEDduArOyBWpmMjWJNJlTSFaqZJ7XPps9qBqHv07Mku1DJ3tlrtnZywUKLRnrDfEzlyrSMAmpS
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 20:09:36.1621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d63afbf-4deb-4a56-e9cf-08de6296fd03
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11041
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:steven.price@arm.com,m:boris.brezillon@collabora.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,m:nd@arm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[akash.goel@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,collabora.com,arm.com,intel.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[akash.goel@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C7B8D0F4F
X-Rspamd-Action: no action

Hi Steve,


On 2/2/26 17:09, Steven Price wrote:
> On 02/02/2026 11:36, Boris Brezillon wrote:
>> From: Akash Goel <akash.goel@arm.com>
>>
>> This implementation is losely based on the MSM shrinker, and it's
>> relying on the drm_gpuvm eviction/validation infrastructure.
>>
>> Right now we only support swapout/eviction, but we could add an extra
>> flag to specify when buffer content doesn't need to be preserved to
>> avoid the swapout/swapin dance.
>>
>> Locking is a bit of a nightmare, but using _trylock() all the way in
>> the reclaim path seems to make lockdep happy. And yes, we might be
>> missing opportunities to reclaim when the system is under heavy GPU
>> load/heavy memory pressure/heavy GPU VM activity, but that's better
>> than no reclaim at all.
>>
>> v2:
>> - Move gpu_mapped_shared next to the mmapped LRU
>> - Add a bunch of missing is_[vm_bo,vma]_evicted() tests
>> - Only test mmap_count to check if a BO is mmaped
>> - Remove stale comment about shrinker not being a thing
>> - Allow pin_count to be non-zero in panthor_gem_swapin_locked()
>> - Fix panthor_gem_sync() to check for BO residency before doing the CPU sync
>> - Fix the value returned by panthor_gem_shrinker_count() in case some
>>    memory has been released
>> - Check drmm_mutex_init() ret code
>> - Explicitly mention that PANTHOR_GEM_UNRECLAIMABLE is the initial state
>>    of all BOs
>>
>> Signed-off-by: Akash Goel <akash.goel@arm.com>
>> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> ---
>>   drivers/gpu/drm/panthor/panthor_device.c |  11 +-
>>   drivers/gpu/drm/panthor/panthor_device.h |  73 ++++
>>   drivers/gpu/drm/panthor/panthor_gem.c    | 460 ++++++++++++++++++++++-
>>   drivers/gpu/drm/panthor/panthor_gem.h    |  70 ++++
>>   drivers/gpu/drm/panthor/panthor_mmu.c    | 345 ++++++++++++++++-
>>   drivers/gpu/drm/panthor/panthor_mmu.h    |   8 +
>>   6 files changed, 938 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
>> index 54fbb1aa07c5..bc62a498a8a8 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.c
>> +++ b/drivers/gpu/drm/panthor/panthor_device.c
>> @@ -2,6 +2,7 @@
>>   /* Copyright 2018 Marty E. Plummer <hanetzer@startmail.com> */
>>   /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>>   /* Copyright 2023 Collabora ltd. */
>> +/* Copyright 2025 ARM Limited. All rights reserved. */
>>   
>>   #include <linux/clk.h>
>>   #include <linux/mm.h>
>> @@ -122,6 +123,7 @@ void panthor_device_unplug(struct panthor_device *ptdev)
>>   	panthor_sched_unplug(ptdev);
>>   	panthor_fw_unplug(ptdev);
>>   	panthor_mmu_unplug(ptdev);
>> +	panthor_gem_shrinker_unplug(ptdev);
>>   	panthor_gpu_unplug(ptdev);
>>   	panthor_pwr_unplug(ptdev);
>>   
>> @@ -291,10 +293,14 @@ int panthor_device_init(struct panthor_device *ptdev)
>>   	if (ret)
>>   		goto err_unplug_gpu;
>>   
>> -	ret = panthor_mmu_init(ptdev);
>> +	ret = panthor_gem_shrinker_init(ptdev);
>>   	if (ret)
>>   		goto err_unplug_gpu;
>>   
>> +	ret = panthor_mmu_init(ptdev);
>> +	if (ret)
>> +		goto err_unplug_shrinker;
>> +
>>   	ret = panthor_fw_init(ptdev);
>>   	if (ret)
>>   		goto err_unplug_mmu;
>> @@ -326,6 +332,9 @@ int panthor_device_init(struct panthor_device *ptdev)
>>   err_unplug_mmu:
>>   	panthor_mmu_unplug(ptdev);
>>   
>> +err_unplug_shrinker:
>> +	panthor_gem_shrinker_unplug(ptdev);
>> +
>>   err_unplug_gpu:
>>   	panthor_gpu_unplug(ptdev);
>>   
>> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
>> index b6696f73a536..5cba272f9b4d 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.h
>> +++ b/drivers/gpu/drm/panthor/panthor_device.h
>> @@ -14,6 +14,7 @@
>>   #include <linux/spinlock.h>
>>   
>>   #include <drm/drm_device.h>
>> +#include <drm/drm_gem.h>
>>   #include <drm/drm_mm.h>
>>   #include <drm/gpu_scheduler.h>
>>   #include <drm/panthor_drm.h>
>> @@ -178,6 +179,78 @@ struct panthor_device {
>>   	/** @devfreq: Device frequency scaling management data. */
>>   	struct panthor_devfreq *devfreq;
>>   
>> +	/** @reclaim: Reclaim related stuff */
>> +	struct {
>> +		/** @reclaim.shrinker: Shrinker instance */
>> +		struct shrinker *shrinker;
>> +
>> +		/** @reclaim.lock: Lock protecting all LRUs */
>> +		struct mutex lock;
>> +
>> +		/**
>> +		 * @reclaim.unused: BOs with unused pages
>> +		 *
>> +		 * Basically all buffers that got mmapped, vmapped or GPU mapped and
>> +		 * then unmapped. There should be no contention on these buffers,
>> +		 * making them ideal to reclaim.
>> +		 */
>> +		struct drm_gem_lru unused;
>> +
>> +		/**
>> +		 * @reclaim.mmapped: mmap()-ed buffers
>> +		 *
>> +		 * Those are relatively easy to reclaim since we don't need user
>> +		 * agreement, we can simply teardown the mapping and let it fault on
>> +		 * the next access.
>> +		 */
>> +		struct drm_gem_lru mmapped;
>> +
>> +		/**
>> +		 * @reclaim.gpu_mapped_shared: shared BO LRU list
>> +		 *
>> +		 * That's the most tricky BO type to reclaim, because it involves
>> +		 * tearing down all mappings in all VMs where this BO is mapped,
>> +		 * which increases the risk of contention and thus decreases the
>> +		 * likeliness of success.
>> +		 */
>> +		struct drm_gem_lru gpu_mapped_shared;
>> +
>> +		/**
>> +		 * @reclaim.vms: VM LRU list
>> +		 *
>> +		 * VMs that have reclaimable BOs only mapped to a single VM are placed
>> +		 * in this LRU. Reclaiming such BOs implies waiting for VM idleness
>> +		 * (no in-flight GPU jobs targeting this VM), meaning we can't reclaim
>> +		 * those if we're in a context where we can't block/sleep.
>> +		 */
>> +		struct list_head vms;
>> +
>> +		/**
>> +		 * @reclaim.gpu_mapped_count: Global counter of pages that are GPU mapped
>> +		 *
>> +		 * Allows us to get the number of reclaimable pages without walking
>> +		 * the vms and gpu_mapped_shared LRUs.
>> +		 */
>> +		long gpu_mapped_count;
>> +
>> +		/**
>> +		 * @reclaim.retry_count: Number of times we ran the shrinker without being
>> +		 * able to reclaim stuff
>> +		 *
>> +		 * Used to stop scanning GEMs when too many attempts were made
>> +		 * without progress.
>> +		 */
>> +		atomic_t retry_count;
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +		/**
>> +		 * @reclaim.nr_pages_reclaimed_on_last_scan: Number of pages reclaimed on the last
>> +		 * shrinker scan
>> +		 */
>> +		unsigned long nr_pages_reclaimed_on_last_scan;
>> +#endif
>> +	} reclaim;
>> +
>>   	/** @unplug: Device unplug related fields. */
>>   	struct {
>>   		/** @lock: Lock used to serialize unplug operations. */
>> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
>> index 26fe4be10a86..7af9285447c3 100644
>> --- a/drivers/gpu/drm/panthor/panthor_gem.c
>> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
>> @@ -2,8 +2,10 @@
>>   /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>>   /* Copyright 2023 Collabora ltd. */
>>   /* Copyright 2025 Amazon.com, Inc. or its affiliates */
>> +/* Copyright 2025 ARM Limited. All rights reserved. */
>>   
>>   #include <linux/cleanup.h>
>> +#include <linux/debugfs.h>
>>   #include <linux/dma-buf.h>
>>   #include <linux/dma-mapping.h>
>>   #include <linux/err.h>
>> @@ -12,6 +14,8 @@
>>   
>>   #include <drm/drm_debugfs.h>
>>   #include <drm/drm_file.h>
>> +#include <drm/drm_gpuvm.h>
>> +#include <drm/drm_managed.h>
>>   #include <drm/drm_prime.h>
>>   #include <drm/drm_print.h>
>>   #include <drm/panthor_drm.h>
>> @@ -114,6 +118,103 @@ should_map_wc(struct panthor_gem_object *bo)
>>   	return true;
>>   }
>>   
>> +static bool is_gpu_mapped(struct panthor_gem_object *bo,
>> +			  enum panthor_gem_reclaim_state *state)
>> +{
>> +	struct drm_gpuvm *vm = NULL;
>> +	struct drm_gpuvm_bo *vm_bo;
>> +
>> +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
>> +		/* Skip evicted GPU mappings. */
>> +		if (vm_bo->evicted)
>> +			continue;
>> +
>> +		if (!vm) {
>> +			*state = PANTHOR_GEM_GPU_MAPPED_PRIVATE;
>> +			vm = vm_bo->vm;
>> +		} else if (vm != vm_bo->vm) {
>> +			*state = PANTHOR_GEM_GPU_MAPPED_SHARED;
>> +			break;
>> +		}
>> +	}
>> +
>> +	return !!vm;
>> +}
>> +
>> +static enum panthor_gem_reclaim_state
>> +panthor_gem_evaluate_reclaim_state_locked(struct panthor_gem_object *bo)
>> +{
>> +	enum panthor_gem_reclaim_state gpu_mapped_state;
>> +
>> +	dma_resv_assert_held(bo->base.resv);
>> +	lockdep_assert_held(&bo->base.gpuva.lock);
>> +
>> +	/* If pages have not been allocated, there's nothing to reclaim. */
>> +	if (!bo->backing.pages)
>> +		return PANTHOR_GEM_UNRECLAIMABLE;
>> +
>> +	/* If memory is pinned, we prevent reclaim. */
>> +	if (refcount_read(&bo->backing.pin_count))
>> +		return PANTHOR_GEM_UNRECLAIMABLE;
>> +
>> +	if (is_gpu_mapped(bo, &gpu_mapped_state))
>> +		return gpu_mapped_state;
>> +
>> +	if (refcount_read(&bo->cmap.mmap_count))
>> +		return PANTHOR_GEM_MMAPPED;
>> +
>> +	return PANTHOR_GEM_UNUSED;
>> +}
>> +
>> +void panthor_gem_update_reclaim_state_locked(struct panthor_gem_object *bo,
>> +					     enum panthor_gem_reclaim_state *old_statep)
>> +{
>> +	struct panthor_device *ptdev = container_of(bo->base.dev, struct panthor_device, base);
>> +	enum panthor_gem_reclaim_state old_state = bo->reclaim_state;
>> +	enum panthor_gem_reclaim_state new_state;
>> +	bool was_gpu_mapped, is_gpu_mapped;
>> +
>> +	if (old_statep)
>> +		*old_statep = old_state;
>> +
>> +	new_state = panthor_gem_evaluate_reclaim_state_locked(bo);
>> +	if (new_state == old_state)
>> +		return;
>> +
>> +	was_gpu_mapped = old_state == PANTHOR_GEM_GPU_MAPPED_SHARED ||
>> +			 old_state == PANTHOR_GEM_GPU_MAPPED_PRIVATE;
>> +	is_gpu_mapped = new_state == PANTHOR_GEM_GPU_MAPPED_SHARED ||
>> +			new_state == PANTHOR_GEM_GPU_MAPPED_PRIVATE;
>> +
>> +	if (is_gpu_mapped && !was_gpu_mapped)
>> +		ptdev->reclaim.gpu_mapped_count += bo->base.size >> PAGE_SHIFT;
>> +	else if (!is_gpu_mapped && was_gpu_mapped)
>> +		ptdev->reclaim.gpu_mapped_count -= bo->base.size >> PAGE_SHIFT;
>> +
>> +	switch (new_state) {
>> +	case PANTHOR_GEM_UNUSED:
>> +		drm_gem_lru_move_tail(&ptdev->reclaim.unused, &bo->base);
>> +		break;
>> +	case PANTHOR_GEM_MMAPPED:
>> +		drm_gem_lru_move_tail(&ptdev->reclaim.mmapped, &bo->base);
>> +		break;
>> +	case PANTHOR_GEM_GPU_MAPPED_PRIVATE:
>> +		panthor_vm_update_bo_reclaim_lru_locked(bo);
>> +		break;
>> +	case PANTHOR_GEM_GPU_MAPPED_SHARED:
>> +		drm_gem_lru_move_tail(&ptdev->reclaim.gpu_mapped_shared, &bo->base);
>> +		break;
>> +	case PANTHOR_GEM_UNRECLAIMABLE:
>> +		drm_gem_lru_remove(&bo->base);
>> +		break;
>> +	default:
>> +		drm_WARN(&ptdev->base, true, "invalid GEM reclaim state (%d)\n", new_state);
>> +		break;
>> +	}
>> +
>> +	bo->reclaim_state = new_state;
>> +}
>> +
>>   static void
>>   panthor_gem_backing_cleanup_locked(struct panthor_gem_object *bo)
>>   {
>> @@ -157,8 +258,12 @@ static int panthor_gem_backing_pin_locked(struct panthor_gem_object *bo)
>>   		return 0;
>>   
>>   	ret = panthor_gem_backing_get_pages_locked(bo);
>> -	if (!ret)
>> +	if (!ret) {
>>   		refcount_set(&bo->backing.pin_count, 1);
>> +		mutex_lock(&bo->base.gpuva.lock);
>> +		panthor_gem_update_reclaim_state_locked(bo, NULL);
>> +		mutex_unlock(&bo->base.gpuva.lock);
>> +	}
>>   
>>   	return ret;
>>   }
>> @@ -172,6 +277,9 @@ static void panthor_gem_backing_unpin_locked(struct panthor_gem_object *bo)
>>   		/* We don't release anything when pin_count drops to zero.
>>   		 * Pages stay there until an explicit cleanup is requested.
>>   		 */
>> +		mutex_lock(&bo->base.gpuva.lock);
>> +		panthor_gem_update_reclaim_state_locked(bo, NULL);
>> +		mutex_unlock(&bo->base.gpuva.lock);
>>   	}
>>   }
>>   
>> @@ -203,9 +311,6 @@ panthor_gem_dev_map_get_sgt_locked(struct panthor_gem_object *bo)
>>   	if (drm_WARN_ON_ONCE(bo->base.dev, !bo->backing.pages))
>>   		return ERR_PTR(-EINVAL);
>>   
>> -	/* Pages stay around after they've been allocated. At least that stands
>> -	 * until we add a shrinker.
>> -	 */
>>   	ret = panthor_gem_backing_get_pages_locked(bo);
>>   	if (ret)
>>   		return ERR_PTR(ret);
>> @@ -534,6 +639,46 @@ void panthor_gem_unpin(struct panthor_gem_object *bo)
>>   		panthor_gem_backing_unpin_locked(bo);
>>   }
>>   
>> +int panthor_gem_swapin_locked(struct panthor_gem_object *bo)
>> +{
>> +	struct sg_table *sgt;
>> +	int ret;
>> +
>> +	dma_resv_assert_held(bo->base.resv);
>> +
>> +	if (drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base)))
>> +		return -EINVAL;
>> +
>> +	ret = panthor_gem_backing_get_pages_locked(bo);
>> +	if (ret)
>> +		return ret;
>> +
>> +	sgt = panthor_gem_dev_map_get_sgt_locked(bo);
>> +	if (IS_ERR(sgt))
>> +		return PTR_ERR(sgt);
>> +
>> +	return 0;
>> +}
>> +
>> +static void panthor_gem_evict_locked(struct panthor_gem_object *bo)
>> +{
>> +	dma_resv_assert_held(bo->base.resv);
>> +	lockdep_assert_held(&bo->base.gpuva.lock);
>> +
>> +	if (drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base)))
>> +		return;
>> +
>> +	if (drm_WARN_ON_ONCE(bo->base.dev, refcount_read(&bo->backing.pin_count)))
>> +		return;
>> +
>> +	if (drm_WARN_ON_ONCE(bo->base.dev, !bo->backing.pages))
>> +		return;
>> +
>> +	panthor_gem_dev_map_cleanup_locked(bo);
>> +	panthor_gem_backing_cleanup_locked(bo);
>> +	panthor_gem_update_reclaim_state_locked(bo, NULL);
>> +}
>> +
>>   static struct sg_table *panthor_gem_get_sg_table(struct drm_gem_object *obj)
>>   {
>>   	struct panthor_gem_object *bo = to_panthor_bo(obj);
>> @@ -688,6 +833,10 @@ static vm_fault_t blocking_page_setup(struct vm_fault *vmf,
>>   	} else {
>>   		struct page *page = bo->backing.pages[page_offset];
>>   
>> +		mutex_lock(&bo->base.gpuva.lock);
>> +		panthor_gem_update_reclaim_state_locked(bo, NULL);
>> +		mutex_unlock(&bo->base.gpuva.lock);
>> +
>>   		if (mmap_lock_held)
>>   			ret = insert_page(vmf, page);
>>   		else
>> @@ -761,7 +910,9 @@ static void panthor_gem_vm_close(struct vm_area_struct *vma)
>>   
>>   	dma_resv_lock(bo->base.resv, NULL);
>>   	if (refcount_dec_and_test(&bo->cmap.mmap_count)) {
>> -		/* Nothing to do, pages are reclaimed lazily. */
>> +		mutex_lock(&bo->base.gpuva.lock);
>> +		panthor_gem_update_reclaim_state_locked(bo, NULL);
>> +		mutex_unlock(&bo->base.gpuva.lock);
>>   	}
>>   	dma_resv_unlock(bo->base.resv);
>>   
>> @@ -798,6 +949,7 @@ panthor_gem_alloc_object(uint32_t flags)
>>   	if (!bo)
>>   		return ERR_PTR(-ENOMEM);
>>   
>> +	bo->reclaim_state = PANTHOR_GEM_UNRECLAIMABLE;
>>   	bo->base.funcs = &panthor_gem_funcs;
>>   	bo->flags = flags;
>>   	mutex_init(&bo->label.lock);
>> @@ -956,6 +1108,7 @@ panthor_gem_sync(struct drm_gem_object *obj, u32 type,
>>   	struct sg_table *sgt;
>>   	struct scatterlist *sgl;
>>   	unsigned int count;
>> +	int ret;
>>   
>>   	/* Make sure the range is in bounds. */
>>   	if (offset + size < offset || offset + size > bo->base.size)
>> @@ -982,9 +1135,21 @@ panthor_gem_sync(struct drm_gem_object *obj, u32 type,
>>   	if (size == 0)
>>   		return 0;
>>   
>> -	sgt = panthor_gem_get_dev_sgt(bo);
>> -	if (IS_ERR(sgt))
>> -		return PTR_ERR(sgt);
>> +	ret = dma_resv_lock_interruptible(bo->base.resv, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* If there's no pages, there's no point pulling those back, bail out early. */
>> +	if (!bo->backing.pages) {
>> +		ret = 0;
>> +		goto out_unlock;
>> +	}
>> +
>> +	sgt = panthor_gem_dev_map_get_sgt_locked(bo);
>> +	if (IS_ERR(sgt)) {
>> +		ret = PTR_ERR(sgt);
>> +		goto out_unlock;
>> +	}
>>   
>>   	for_each_sgtable_dma_sg(sgt, sgl, count) {
>>   		if (size == 0)
>> @@ -1028,7 +1193,11 @@ panthor_gem_sync(struct drm_gem_object *obj, u32 type,
>>   			dma_sync_single_for_cpu(dma_dev, paddr, len, DMA_FROM_DEVICE);
>>   	}
>>   
>> -	return 0;
>> +	ret = 0;
>> +
>> +out_unlock:
>> +	dma_resv_unlock(bo->base.resv);
>> +	return ret;
>>   }
>>   
>>   /**
>> @@ -1038,11 +1207,13 @@ panthor_gem_sync(struct drm_gem_object *obj, u32 type,
>>    */
>>   void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
>>   {
>> +	struct panthor_device *ptdev;
>>   	struct panthor_vm *vm;
>>   
>>   	if (IS_ERR_OR_NULL(bo))
>>   		return;
>>   
>> +	ptdev = container_of(bo->obj->dev, struct panthor_device, base);
>>   	vm = bo->vm;
>>   	panthor_kernel_bo_vunmap(bo);
>>   
>> @@ -1050,6 +1221,8 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo)
>>   		    to_panthor_bo(bo->obj)->exclusive_vm_root_gem != panthor_vm_root_gem(vm));
>>   	panthor_vm_unmap_range(vm, bo->va_node.start, bo->va_node.size);
>>   	panthor_vm_free_va(vm, &bo->va_node);
>> +	if (vm == panthor_fw_vm(ptdev))
>> +		panthor_gem_unpin(to_panthor_bo(bo->obj));
>>   	drm_gem_object_put(bo->obj);
>>   	panthor_vm_put(vm);
>>   	kfree(bo);
>> @@ -1098,6 +1271,12 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>>   
>>   	kbo->obj = &bo->base;
>>   
>> +	if (vm == panthor_fw_vm(ptdev)) {
>> +		ret = panthor_gem_pin(bo);
>> +		if (ret)
>> +			goto err_put_obj;
>> +	}
>> +
>>   	panthor_gem_kernel_bo_set_label(kbo, name);
>>   
>>   	/* The system and GPU MMU page size might differ, which becomes a
>> @@ -1109,7 +1288,7 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>>   	size = ALIGN(size, panthor_vm_page_size(vm));
>>   	ret = panthor_vm_alloc_va(vm, gpu_va, size, &kbo->va_node);
>>   	if (ret)
>> -		goto err_put_obj;
>> +		goto err_unpin;
>>   
>>   	ret = panthor_vm_map_bo_range(vm, bo, 0, size, kbo->va_node.start, vm_map_flags);
>>   	if (ret)
>> @@ -1121,6 +1300,10 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>>   err_free_va:
>>   	panthor_vm_free_va(vm, &kbo->va_node);
>>   
>> +err_unpin:
>> +	if (vm == panthor_fw_vm(ptdev))
>> +		panthor_gem_unpin(bo);
>> +
>>   err_put_obj:
>>   	drm_gem_object_put(&bo->base);
>>   
>> @@ -1129,6 +1312,231 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>>   	return ERR_PTR(ret);
>>   }
>>   
>> +static bool can_swap(void)
>> +{
>> +	return get_nr_swap_pages() > 0;
>> +}
>> +
>> +static bool can_block(struct shrink_control *sc)
>> +{
>> +	if (!(sc->gfp_mask & __GFP_DIRECT_RECLAIM))
>> +		return false;
>> +	return current_is_kswapd() || (sc->gfp_mask & __GFP_RECLAIM);
>> +}
>> +
>> +static unsigned long
>> +panthor_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
>> +{
>> +	struct panthor_device *ptdev = shrinker->private_data;
>> +	unsigned long count;
>> +
>> +	/* We currently don't have a flag to tell when the content of a
>> +	 * BO can be discarded.
>> +	 */
>> +	if (!can_swap())
>> +		return 0;
>> +
>> +	count = ptdev->reclaim.unused.count;
>> +	count += ptdev->reclaim.mmapped.count;
>> +
>> +	if (can_block(sc))
>> +		count += ptdev->reclaim.gpu_mapped_count;
>> +
>> +	return count ? count : SHRINK_EMPTY;
>> +}
>> +
>> +static bool should_wait(enum panthor_gem_reclaim_state reclaim_state)
>> +{
>> +	return reclaim_state == PANTHOR_GEM_GPU_MAPPED_PRIVATE ||
>> +	       reclaim_state == PANTHOR_GEM_GPU_MAPPED_SHARED;
>> +}
>> +
>> +bool panthor_gem_try_evict(struct drm_gem_object *obj,
>> +			   struct ww_acquire_ctx *ticket)
> 
> I think this could be static - I don't see any reference outside this
> file (other than the header).
> 
>> +{
>> +	/*
>> +	 * Track last locked entry for unwinding locks in error and
>> +	 * success paths
>> +	 */
>> +	struct panthor_gem_object *bo = to_panthor_bo(obj);
>> +	struct drm_gpuvm_bo *vm_bo, *last_locked = NULL;
>> +	enum panthor_gem_reclaim_state old_state;
>> +	int ret = 0;
>> +
>> +	/* To avoid potential lock ordering issue between bo_gpuva and
>> +	 * mapping->i_mmap_rwsem, unmap the pages from CPU side before
>> +	 * acquring the bo_gpuva lock. As the bo_resv lock is held, CPU
>> +	 * page fault handler won't be able to map in the pages whilst
>> +	 * eviction is in progress.
>> +	 */
>> +	drm_vma_node_unmap(&bo->base.vma_node, bo->base.dev->anon_inode->i_mapping);
> 
> There might be an issue here - drm_gem_lru_scan() will have taken the
> resv lock. drm_vma_node_unmap() could cause a callback to
> panthor_vm_close(). If that ends up being the last reference to
> bo->cmap.mmap_count then we'll deadlock attempting to aquire the resv
> lock again.

Actually drm_vma_node_unmap() would just invalidate the CPU PTEs.
The CPU mapping won't be removed and so panthor_vm_close() won't get called.

> 
> I not 100% on that, and sadly it seems my test setup has died so I can't
> test that out today.
>

We have tests that tries to trigger an evicition for a CPU mapped BO and 
so far we didn't see a deadlock problem.


Best regards
Akash


> Thanks,
> Steve
> 
>> +
>> +	/* We take this lock when walking the list to prevent
