Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UErmH/8mnGlzAAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:07:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A8A1748D3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7024B10E2D2;
	Mon, 23 Feb 2026 10:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GsLjLcR9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B7210E2D2;
 Mon, 23 Feb 2026 10:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771841274; x=1803377274;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VI2lFIg4a5REbZXeZfQASS61KEFFlMIur+77mabSiso=;
 b=GsLjLcR9RqVmAqjXudp2snxVzl4G9RxnOrjBqWvj/GHMD+OS/dUjKJv4
 KrAnHMVfuw+HDYI/UhlvnXqO3uifVL8/Ac+gRtmwBLC23QIKLVidi442O
 meVvm9uPMjCsLpTkOnGSkAIUj7rnCDtqkzOr+u9xC3KrqZhVUfmnqEZuw
 zOQfDNMBLahPbE37IQyPGoTPkD5cOVzZl2Dvr/jf17a0giFJcb1sAgKCu
 g6vMwgDGT8FHr6b0jbiruSAhTHYsOhn0u2qZ6u45OEHAcRTs5c02i+7Wb
 izdv7CTSv8AcxDrcjS2JkLvwtZYca7pr/xGvNgUAAKUlUdNGFCg+mUxuv w==;
X-CSE-ConnectionGUID: joWenFqwSuuVkiqQVmKLoQ==
X-CSE-MsgGUID: 21ijnO84SJuM3KWvWraR1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76663235"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76663235"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 02:07:53 -0800
X-CSE-ConnectionGUID: QgZg7C4GRHCV6D+UET30mw==
X-CSE-MsgGUID: mzHsYJVhSQ+CW+UdmLZ3Lw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 02:07:53 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 02:07:53 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 02:07:53 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 02:07:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIS8StBB8XZAJ+eXBEnyAnF0mVX5xMcBYLhQmfOLtjHTCoSVGNF5YCUCeBT/Ewide2Ulo1LcucVnUqDGxE2QaTuRU8fC+7OFXaOcRG5fc1ZTVkHK0xhm1HlwSuPXr/bcM8j1C1Bw+9nUNOx6qBa+sOkyt7fqFfNrJ/pRV/hnzyVp7NVjpJR/Ear3JC+B/cKaBm/ZwbsSd6F4xxEi/yLe90u5ROP9J5dIwA5OyP1gyZMSryXiJAeQddm0khBl/y1fGCl61dL2qGQmEw/rx/XVOFvahtoHvKwLnzhytpZWGhNl7v7q32csdnTEdd7KiV+VmJLIPnBGcx2Jg0mkFYoBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjZ2Kf4ldDaXevGUjopsQWNR8ZKHsFe7uDTMl4wp3FI=;
 b=coTAWsQ5Pz0L5Zv7quhlcIJ2eROA2th/vVON50L9GfQgQRdjfEn3ceG9JmhVtl4nIAmOrhPgZHJf5kJPszwNnUweSEe6BTDrt5y82VxFBVwFw35sI6Bm1gIC2/DzVkOXE0ZFiJdJPv6d9A+7vATTKbsLJW900oQkkCpdcqsOtNI/lkY6HkTeJcXTPOOHS8fEe6ttRbtDVMRDhv5idZRlAib4QNpYTzQbyP+Do7vl+7c3ue1CaUuMOqBjiq9uwJaJIjohj2Sjr7L++G7U82TNw2SdPMNL2lR1fc1HXB0siTxTanpyt73IPSooLBmc/jWtWi4Qss6Y4IqMrUl36dYjtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SAWPR11MB9548.namprd11.prod.outlook.com (2603:10b6:806:4e2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 10:07:51 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 10:07:51 +0000
Message-ID: <1a4462b8-def9-4474-8382-6e99b7c8276d@intel.com>
Date: Mon, 23 Feb 2026 15:37:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/7] User readable error codes on atomic_ioctl failure
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, <xaver.hugl@kde.org>, <harry.wentland@amd.com>,
 <uma.shankar@intel.com>, <louis.chauvet@bootlin.com>,
 <naveen1.kumar@intel.com>, <ramya.krishna.yella@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, Suraj Kandpal <suraj.kandpal@intel.com>
References: <20260223-atomic-v10-0-f59c8def2e70@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20260223-atomic-v10-0-f59c8def2e70@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::9) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SAWPR11MB9548:EE_
X-MS-Office365-Filtering-Correlation-Id: d008f7ea-c9d3-47e4-51be-08de72c366f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDU3NzJWSE94a21JR1Y3YmRwcWJGNDE1WFRXTUVMV0tPNU5vNmQ4b0NnY3ly?=
 =?utf-8?B?K05RQ2kyU3hoYkh5Y0hneHNpdTFRdThJcHVhczN5bmxvekxYRjRIb2sveTFN?=
 =?utf-8?B?ZFVTVVpMaHl3NHYzWmhDYnZ5NzZ1bG5QclZJeGFZMzh6SHJtWkN3djVDWVVC?=
 =?utf-8?B?U1BtTkU2Y2ZyNEhMUXZ3OGFKRTVJYSsvK29aR25la2VOZTFBVjlhMnpCNlR3?=
 =?utf-8?B?Vm83SmJqRHk2ckpydGQ0SVdMNnZQQkduUXFrQXNoTlkzQzdWUU1lZnN0WEMy?=
 =?utf-8?B?bXlFVnQxbnhvOUdWaWs4cGp1Y0dDUXdQQzZkMDlsY1FwK016Q0MvQStWVjM4?=
 =?utf-8?B?RnN6eVd1cWdlRi9uRDdMOTF5ZTFDVDA4NElwTzJaNFN4VFJ1RkVpRDhtQ1ZW?=
 =?utf-8?B?eGk0QlFzalNBYmdNL2hlR2crNkd0Z1JFODRybVNhRVFNVjh4Q1Bick4zTUFU?=
 =?utf-8?B?QTY3NU1JWXU1MU94dC93dm10bkluODlUajNDWmZIOVJSZktwOS9hQ3c5TnJK?=
 =?utf-8?B?NmpkNG1ybXc3WjJrK2FLbVhiMXVuNlpqV2RibW8xeDJWSTNSRmNiYVhodWIx?=
 =?utf-8?B?cHVuQkcxbUU5eUhNRG5hZGc3dGdjcVlodHk3UlZuWnArQU4vRHVhVWxpeDRM?=
 =?utf-8?B?dlVVVzlKdnhzdmNhcUZCZk9Jamp0eWdqZVM3cVluOWNubDN0eUxPZGlXRVYv?=
 =?utf-8?B?YWIzZGZ6MFp0TEUzNWFTVWRxTWdXMzl3OE1BT3FGOGdBZFhIdmhFNFgweG9U?=
 =?utf-8?B?UUtiZjFBT1grVUZFVDdFdmtSV2xuczA5eGlrWGVSYzhWZ1dxUEw3UU5PR0hG?=
 =?utf-8?B?NUYwTXB3M1llQm5tMlBUWjBCTEpUTGVudWxvTW10VitBNDVydGtDWjBCS1hM?=
 =?utf-8?B?dmpsUlhYRFdDcmtDN1hWV0l3QVpNU3F6TTlETW5HYjdCdEJFREdhUDZHYlB5?=
 =?utf-8?B?bE1iUlo2TWd3SkZkZGs4T1Q0anV0ais3dkJmUVFsenJUMEl6QlZ6NDNJWjgz?=
 =?utf-8?B?UHNmTHNQQkhmdldZNXR2YWVZV01HZFU5dkU1cWU3R0FvYUorWnl5Z1pGMUl6?=
 =?utf-8?B?WnErNXkxbExacmR5M29TdDJCclhiMENsS29qVEZmcUF0aUVCR3lhQ2FvZ1lp?=
 =?utf-8?B?d2NlcFZ2R1B5dDJIVlVlSkszWVMvSkxQaTdQRWl3d3cwQlZUNzhWQml1U0lW?=
 =?utf-8?B?TUEzZmZCSnk2NGIrRWdNeXFhMmNlOEYxT0V3VnpwYnZuc0d6dkFvakJRaVFh?=
 =?utf-8?B?QWpDZDBYbGZ6d0djVUIyU2k5Q0RzVHhJZzhjcmxZenZGcjFoTXdqd2FsWThm?=
 =?utf-8?B?aXduc1JWbTZZVTlaMEpVVmNTNHBhZ3BkdjFmMnd5bWh0Z2gwY1JzNzVlNGow?=
 =?utf-8?B?ZGQ3WGtwSFd6bURQU0g2cXVzR2cwZ3RjREYxU3RMSU5FeC9yWUxDQVJiMmtJ?=
 =?utf-8?B?TC84ZGtmRWpSWnBGQnloYVVYK0NqbithWVBIVlc2eHJ6QjNLejRrUEFUQmRz?=
 =?utf-8?B?SUF0ZGJWTWVHdGdrNDRFNDF0Znk1ak0zRlY2bFBUZm9MSEJFRk9FYXZGam5M?=
 =?utf-8?B?QjhTNkJEbGhhM0JIbHpWeTQrWlRpV0toaGpUZWFyNFl5NnpJeVh2VjVLV2tQ?=
 =?utf-8?B?Q2lUNjkwUm80ZGZqRWRaSVAvMDFsM0RsM2hQTkk5Q0FFbG1YT09lNjBDa2Vt?=
 =?utf-8?B?czdvZDZVK3J2Smh4bjdpR1Bibk1XL01CM2xlYkdlQzZpcHdMeW54UUlJYTNk?=
 =?utf-8?B?TER1Q3VYZlJ4ZTdHbXdORENiMlhFL0xYYW80b0ZiempOanJsdXNvRlpzL0Qx?=
 =?utf-8?B?SWVGTHdHU3lNNmJURVJsVEZ4Zy9sdFNOSUppQVVLS0x4dURBSEIwcGRYYk9Z?=
 =?utf-8?B?YTBDdDRUcE9RTDlTVkVsZGIwVU85Qks1MGtvN09FYU0vS3oyZU5hWjdBMHlT?=
 =?utf-8?B?L1hOMTZHTVI3YmNiVlVmVHdUcEdsaUxBWWVuWHFaSDg3ejYzUVhvMFBwZEJZ?=
 =?utf-8?B?SzArczUxOS81dllaSXlhbU5qT2xJL2JUUUE0UG1ZeGh5L0UxWldpaG1MNWdH?=
 =?utf-8?B?c3FqaThCcHRDTDBLRnpMbzlEeG5zQnhGUzVHUUhZKzQ4QUU0WG5aMzNMMGZs?=
 =?utf-8?Q?qpDg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnYxSnZPSnFheGVtN3hhTVRtRFV1VjZodXdwdE1GUWVIb2xWTjFtZ2VyM0Zq?=
 =?utf-8?B?dGFwUUR4UU1ka1J5OWFxdHkyR0t3WTFlYUpvMzNHbHpVeGhKeTBESzNLbU90?=
 =?utf-8?B?aGcrYVZmK1pEeGhpajhmR2xaSEpwMGtyR25DZWxLS2lEOUVwV0c2NzcyVlVM?=
 =?utf-8?B?bkxmZ29uWFA0SFU0Qk9FOThIV1pOKzF6bFlTQVRXeHQvZFlIQ2RBN1Z0L1py?=
 =?utf-8?B?VU1zTWhUNmY4UGIvOFZiM1BKYk1YQ2wzdVFtRHVhck1VYUlOZEh3anl1UWFP?=
 =?utf-8?B?UFQySnBYYnltTzFOU3NqWFV0UmFpN05TbUMrQjdYUVlaaTd1U1RoV1d0amR5?=
 =?utf-8?B?b2lrSFM0UUl2NDBSZ1NtdTRHSVEwaGJFN2FDKzJrQkgyb1g3c2pxMHgxUjVZ?=
 =?utf-8?B?MmgreFVzS1kzb1E4OG9SbXZ5LzdFUEg5aWwxZ25uYmtxNUZ6OWpMQVpmdEx5?=
 =?utf-8?B?cmEzVEZFdkZpMWxlN0FCaTJFTGhmSHRSYzdUUU0rSlg2SFRRZHFycElFL3lJ?=
 =?utf-8?B?K0NxSmI4WVlCYWRPSmNaeXFhTUF2TTlrd3hFa1lOUW9WYmZFb3lMSGVNb2pZ?=
 =?utf-8?B?RjBsbGdlcmQ4REJEYmNiNW1MWXdHaXJFUngvQlZNcHRrTTdzOHVBQnk4M2xn?=
 =?utf-8?B?T2d6MHJLcEw1eXUvZzlPMWg0eUMzL0NUUjFYUEF4Z0hRQi9JdjB4SFpCTUJ2?=
 =?utf-8?B?cytMTTNPOVh3Nk1SMmRwd0xGa21BcFNpTHZkRmRkY045ODZjektqa1FYSVVD?=
 =?utf-8?B?aDVLc3ZSWXF2ZjVyVXNtNGMrNFFick13MEthYTUxNDRVUi9xdlYxUlNqa3NF?=
 =?utf-8?B?VlUyVzgvS052T2paNi9hdlRuNkI3ejRjT2RPR0tIOVpjemk0eVFSUVlwWWl5?=
 =?utf-8?B?UDd3RWg4aGhiSHlpQlVDWVorQXBlQXl0Z1hFY2VzVnlLNStLOHNWYkw5NTZl?=
 =?utf-8?B?NTYvV3dReExpQTNjWXhXWkdxN1RWL21HTFZBMXJEcVZ0T29YVThETFFNUGlM?=
 =?utf-8?B?ZVF6ekg5U0FRWDJlR3hmWkxmWWJ5OUhWUDZFYVV1S3YzNTFlTG5lR2pxZk9J?=
 =?utf-8?B?eEZyYmVsanBRMmhqZXZxeUlBRkFkby83UW1JWXVpVGphNVFRUFNpYnJSU3dU?=
 =?utf-8?B?bDVJL2hMM3RiWE9heENkcTBFWkpkOFpTK2RVdzJSbHpmSUhXUHBqVG1nQ0c1?=
 =?utf-8?B?L2ZuOWRJSzI1RWRIZnJDUGl0ZmxZN2QrSjZaWXl3YWV2ckZPSjhpNUdIUmtI?=
 =?utf-8?B?WG9zOHB1Z3hWVW5sa2hYM3luNUMrd0twVUFZdml3Q0lHWUgwYkVSVC9pTi95?=
 =?utf-8?B?aGVpU2NOM0l0NC9pZ2h4UlhYQmFkaTg4dHJSeC9sQWJnZGt1VzZpd2Jrd3lN?=
 =?utf-8?B?L3lXbFpWU3NVL1RyWkdFZEhNdSsydndKcjl6QVRLQmdSZ3JIelVra2t4b3Zu?=
 =?utf-8?B?dlFmZmwrb1VmM1BCRlN6UmJzR1pUN3lwdkFhVWlSZGNUeHNiUVlaZ0ZONDBC?=
 =?utf-8?B?WHYrMWM1SytFaTBUckxDVis0Y0ttaEpHcGhGZ3hkNm5PdnVwekxDeTllK3Vr?=
 =?utf-8?B?WTJQczZQajdoTVpUVXcySVFJRzFkc0VrWmVIYkVxWkpMb1R0T3FYclpZVXV2?=
 =?utf-8?B?SEdsZW5MakwzWG1oVUN2MDQ3TGgwd3dmaGFWT21VcTBCekY3WFM0SzNHdUNM?=
 =?utf-8?B?Zm9ZT0tGT3pRbldacElxdFh0OWNuNHJ5L2JPRk1GU1VQTVdZbGxKemhWcHZW?=
 =?utf-8?B?UEpNbFNkWGVHTWpwcFVaZk9lQlNMWWx1UjVrZUJGck5GY3FKMlY0VHBQU05t?=
 =?utf-8?B?MEFGb25pVGZ3djE2UlVUbjE5dyt4Zy9xbXdvdFBpTTRoZXY1Sm1JUlRCdHhW?=
 =?utf-8?B?OTQ5Tlp4c2c5Q1dTSm5sNXA3UlR0Ym5EUG12K3ZoQmNnYzVyNEM0M0VvRTNj?=
 =?utf-8?B?aWFscCtoS2hRTVZBUWh0blRzVUhtWFhyVEM3UkNKOXRrOVVMZ3pKaDZscmpn?=
 =?utf-8?B?SGRHb0VLVHRqRzZmZzA2RTZ3RHpYZTM0SkZYQ0lwN2VjZHhKUWdXSlltem93?=
 =?utf-8?B?ek9HcTJvOXlJQmRYN2ZDMDlOVWdBUGlaZ1htaXZtY3RQckRsTlVlbDhTQ1lY?=
 =?utf-8?B?M0pyN3A3TG16VWxXY2JFVFNyd0FvM1p5VU1aaU9lU200clVWeTYzcFc4YUY4?=
 =?utf-8?B?ei9QSCtFWnJsYmh0cVRwTXRRdFRPMHZOZ3dFNmxoMm05ejlHZUJVNkh3V1ZD?=
 =?utf-8?B?L3ZlbUJaK2N2Zm1FUzF4Rzg3RHpBZW9kaTh6a2wvaFFvWlJXcDZzTFIyYVpu?=
 =?utf-8?B?ZlVIdEltaUpCSEpDbEtEMVBJQ3RkZERVRkdJdHdMK2xSQ0praEpGdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d008f7ea-c9d3-47e4-51be-08de72c366f9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 10:07:50.8894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uFuGzCIl4c6/9btepAWEqDqp053MGsuYdCp3QGD5oqqttLEMJItJ7fzRUyOWQulBMT7HlRRruOBYThDoMaTXJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9548
X-OriginatorOrg: intel.com
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,kde.org,amd.com,bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 31A8A1748D3
X-Rspamd-Action: no action

Any other comments/feedback on this?

Thanks and Regards,
Arun R Murthy
-------------------

On 23-02-2026 14:45, Arun R Murthy wrote:
> EDITME: Imported from f20260210-atomic-v9-5-525c88fd2402@intel.com
>          Please review before sending.
>
> The series focuses on providing a user readable error value on a failure
> in drm_atomic_ioctl(). Usually -EINVAL is returned in most of the error
> cases and it is difficult for the user to decode the error and get to
> know the real cause for the error. If user gets to know the reason for
> the error then corrective measurements can be taken up.
>
> User will have to check for the capability
> DRM_CAP_ATOMIC_ERROR_REPORTING before using this feature so as to ensure
> that the driver supports failure reporting.
>
> TODO: driver specific error codes are to be added and will be done in
> the follow-up patches.
>
> TODO: Once the series is merged the element 'reserved' used for sending
> the failure code in struct drm_mode_atomic is to changed to err_code.
>
> The IGT related changes are pushed for review @
> https://patchwork.freedesktop.org/series/153330/
>
> [RFC] changes for libdrm pushed for review @
> https://gitlab.freedesktop.org/mesa/libdrm/-/merge_requests/450
>
>      To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>      To: suraj.kandpal@intel.com>
>      To: Maxime Ripard <mripard@kernel.org>
>      To: Thomas Zimmermann <tzimmermann@suse.de>
>      To: David Airlie <airlied@gmail.com>
>      To: Simona Vetter <simona@ffwll.ch>
>      To: Jani Nikula <jani.nikula@linux.intel.com>
>      To: Rodrigo Vivi <rodrigo.vivi@intel.com>
>      To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>      To: Tvrtko Ursulin <tursulin@ursulin.net>
>      To: xaver.hugl@kde.org
>      To: harry.wentland@amd.com
>      To: uma.shankar@intel.com
>      To: louis.chauvet@bootlin.com
>      To: naveen1.kumar@intel.com
>      To: ramya.krishna.yella@intel.com
>      Cc: dri-devel@lists.freedesktop.org
>      Cc: intel-gfx@lists.freedesktop.org
>      Cc: intel-xe@lists.freedesktop.org
>      Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
> Changes in v9:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v8: https://lore.kernel.org/r/20260129-atomic-v8-0-4cb7b0faa051@intel.com
>
> ---
> Arun R Murthy (7):
>        drm: Define user readable error codes for atomic ioctl
>        drm/atomic: Add error_code element in atomic_state
>        drm/atomic: Call complete_signaling only if prepare_signaling is done
>        drm/atomic: Allocate atomic_state at the beginning of atomic_ioctl
>        drm/atomic: Return user readable error in atomic_ioctl
>        drm/i915/display: Error codes for async flip failures
>        drm: Introduce DRM_CAP_ATOMIC_ERROR_REPORTING
>
>   drivers/gpu/drm/drm_atomic.c                 | 31 ++++++++++
>   drivers/gpu/drm/drm_atomic_uapi.c            | 89 ++++++++++++++++++++--------
>   drivers/gpu/drm/drm_ioctl.c                  |  3 +
>   drivers/gpu/drm/i915/display/intel_display.c | 25 ++++----
>   include/drm/drm_atomic.h                     | 10 ++++
>   include/uapi/drm/drm.h                       |  7 +++
>   include/uapi/drm/drm_mode.h                  | 37 ++++++++++++
>   7 files changed, 165 insertions(+), 37 deletions(-)
> ---
> base-commit: cec43d5c2696af219fc2ef71dd7e93db48c80f66
> change-id: 20250728-atomic-c9713fd357e4
>
> Best regards,
