Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C52AC4E41
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 14:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA53610E4B4;
	Tue, 27 May 2025 12:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHhTXGl0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C1510E479;
 Tue, 27 May 2025 12:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748347707; x=1779883707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YKHHH+gAMghGPHCQOzrfHPlG2tkH+t8Tq5IHVxezQh4=;
 b=mHhTXGl0i1Wg6QWqn+RysC2rGaKeY+l+6KTD/um5VAaWHrPSt068/LqV
 WXVBg2RbWiSjI9xebDbaGe3IWUNpu7e19H489YTsXjujfGBWSYa7MskVU
 YSou1Y0wM2UxOiZL5H1EqGNs4EDXo+zCb/rACHx+kwYHTiniXny8OpBQY
 r2km8QB7gxtMxqlDcMcU/T0FkIVJyne3PXne1VBUjh/wgjq6Y8Ul3v9Uu
 ML+Ru6YsDKjHuaRXq/eOMgKfGOBJdx6ooIAThMOdT4OyGez0b73NxRRlp
 EgWMVyBDXqe4+KMPkHLotxPBk9+AzH8AMGAqFGA0mAR8pnU9ZaMGi5sBA A==;
X-CSE-ConnectionGUID: U2gf+mZHQgu7Wfnyj9fagg==
X-CSE-MsgGUID: vbZWR+KwQtqEi1AI5Fc4KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="49443641"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="49443641"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:08:27 -0700
X-CSE-ConnectionGUID: 4MNXlOGfSPqowL4Ej8vhyA==
X-CSE-MsgGUID: fjHjf71mSQ+TtKHwSywpYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="142792268"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:08:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 05:08:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 05:08:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.85)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 05:08:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZfQFQJciLss+LJw8xEORd7ZkaaBMAPzdu6PHlv8aJ7YkMDsh+wnxQIq7fzBXQadHbRddRTRgWzlk6gemO1WW2K2I/sV9+Tu5liQvrZVS5WurpBwg28VNq7HPMqgSkfASFyTo0bpPAmiddYMwNNaWUOD0fRkoOVqsT7CRGgomEF5eyyrJnjbknj0vzg6/3+GbKKWpyh31Fbd133hFThklUxIbNmj14l2+GwkBGBVKKBITzDpwcfm2oidG5IVok+R7ZE6f/7yfSsczL1qUTJOIArrTPRn2Cu28fRR/9SAJ4mw7zFhM+We/eTLkOuqoPXIRVD1PcOZBz5kKzIw9RUpjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXOHdvYkFN09550Z4gQVbpQ1g3LigYYaHhxYVTomzyU=;
 b=PO1CazcmEY87hBLi+Qbd50FTtvj1EiqjNUk2qXcVH7QbYiEdObSMGLM1Dqqe1PVX30Au+wgZj0x1eQWc1t4gHNrL3vEaKADx5FQsNisR4dr9NYG1WbYaSy4iBZ5PvbdDXnEzJtj/0FL5Ud6KQ41vYnp9HhS/39vLH2DL5TPwksBrLa62S9uLynHRxPkJ5NU6jHUjlvE8B7FWyLDpRrF1LKPtqPJTHIUdQKFGO6y2/wUDPksJv8bpi1egVfvumnMcZZSSdYePKsCRaWO1eXCFfM3G0/QOYhKGffXQjInXGyaSpisHHqeh7Ew7GgV65djxFgD7U+cOVDcEyOZoAC2i4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5918.namprd11.prod.outlook.com (2603:10b6:a03:42c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Tue, 27 May
 2025 12:08:24 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 12:08:23 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v9 5/6] PCI: Allow drivers to control VF BAR size
Date: Tue, 27 May 2025 14:06:36 +0200
Message-ID: <20250527120637.665506-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527120637.665506-1-michal.winiarski@intel.com>
References: <20250527120637.665506-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0218.eurprd08.prod.outlook.com
 (2603:10a6:802:15::27) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cdc7eb4-a540-4a79-c637-08dd9d172dfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rys3LzFTbjNncjRWTmJuYkxXQXhZOU12TnB2OU9HelRZaHRtd1loNVRkcVh5?=
 =?utf-8?B?MWFOODJZTGJ6STJqa1ZXYTVDcFFnVSt0WnlaNUF1a0FYYnBSTWxrM3NKTHVQ?=
 =?utf-8?B?YmtSQm9DRHloRHFrWUMyVnVTYVZjL1JVQ2F5K1drdkkrZkhzbDU3cFpoMUNy?=
 =?utf-8?B?NW5LQkw0N1luMnRSd1I2ZmthVEdlTC9WQ3RHUkFkQnRaTFJZZWZtZC9VT3A4?=
 =?utf-8?B?emcycC9nVFJ4SXd1NWFxckRtN21yUEJpdGQrZDV6d25MWisvMUMyT2VSbjNQ?=
 =?utf-8?B?QTV3UHRwWEVWT0xCbGVSVVV3OW1SV2ZjNzV4M29wYzVuWTVidkdaNDhDY0x4?=
 =?utf-8?B?Y1JHR1NSK1VRREpyK0RXNnRIbSszL3REZnF6TjV4L090djZxVERUREFKVjN5?=
 =?utf-8?B?ZEhZdlR4dzBmbCtKc2ZhdXgwUEI0ZmtUYkdTMEc1M3VNdXc4YTR4QWNqKzFC?=
 =?utf-8?B?Q2ZzWFhHRjlkRmlScWpCbHovbW00T1NuWVBHbUpxL1hHUGpxWU1kMmp4QjQv?=
 =?utf-8?B?V1dPeXd5SUtYTUlYcGpmeUxFcmJNVkkzS01vVjVwL1BleXdqaXU4Q0xnMzZS?=
 =?utf-8?B?OS82Z0dLOGJ0MUFpTWZ3bTRIZ0labVM1dldRcHY4cTJRSkhIVHM0UmtEbTVn?=
 =?utf-8?B?UVMrdGVhLzRUYm9Mc1EzUW8yWDFyQStadE9oUGtMbWdNUWFtdmtwenZnbU80?=
 =?utf-8?B?elRTVVJ1MkdoeVVrL1RLN3B3eDh5a1BSVGo2S0JLSExIZTU3bDgxUktIVFZx?=
 =?utf-8?B?TGFqMVJ3Tkc4M1BTblRGQmVLRG1zQ0F6SFlVTUJMNUR1ZCtTS01GakhlM1Zk?=
 =?utf-8?B?UlV1SUxxU3FIaW91K1dka1E4emY2V0c1NitnZjFYQ01mcCtxak1XZmVwbGdJ?=
 =?utf-8?B?TDZ1SzdqeEE3M3ZZYUZpZjVWbVJVOEZWVDQ2eksrOWFQbHNmQk5ZVG85OGNY?=
 =?utf-8?B?ajBJcVlaTXluVk1OTnJ5SzNZc2IwSEE4UElyNVJROFZBUWhZc1hkQ0xQT0U0?=
 =?utf-8?B?Q29NZXg5d2lvQU0yYWlkSE1YVGVNV3dvZktVRndvMUlpaFhhQWppclV2SGd0?=
 =?utf-8?B?eGM1ZUxHTVNnQU81ekU1UFFxeUQ0bDJJUnZnanVkeCs3VStzUytxME1Uc1Z0?=
 =?utf-8?B?YlVCdVlOMEs1c2ZsTm80RTJnWEpBRXpEeTdFTjNHZjl4Y3oyUk03Nkc0Y3Jr?=
 =?utf-8?B?MjZjTnpvYUs4ZlozZGpET29wRWxIMDJFRHNhQ2Q3N3dUalJ0MitKSVlRaklG?=
 =?utf-8?B?RkwrM3pBaDJ1VlE3RStOR2Y3THhPY1czZHkxL3V6bTc0WkR5Qkg3Z1V2dzJ2?=
 =?utf-8?B?aitLTXgrKzluby9CTVY4OHozeitTZldCUjM5UDRRb1duNTZBS0NhOGRCRTlH?=
 =?utf-8?B?elJadkdKalhqZlZPOUdnVDJUMlRQRzNRcHIyK2tOcXBEWFc3Qk0rWmhMQThr?=
 =?utf-8?B?SEtLbW9aaHZMdWY5S1NBcjlTN0oxbmIxUjhaNzRqenExL1gvTG1JODJHZVY1?=
 =?utf-8?B?cWFKMGcrWXZ6T25FYlh4M0RRS296L2tTT2R2TC9KWGxWZGF1bzEzVFV4Y3J3?=
 =?utf-8?B?ZFFITmNPQ2lNZFY3ek9GS3gwc1l1WWdaWEpGMzJxYWpKN0NkQ2xmNUlMWmhE?=
 =?utf-8?B?Um1NZFNoWkMraHdPcmJOclRVUVFXVWUxdlZHL1ZRTkxRejZaRklTR3BFbU8z?=
 =?utf-8?B?azh3SkdWQkJWQ1Rjc2dOSGVjSDMwbmxSSGxUZW00ZWQzSU5WYnhrazFwdWZW?=
 =?utf-8?B?akU0bWtlN01oN1lVYVpaRmxQRGgxOGQ2dnFLZTR1UHl0WjJvMXF5RjRFNWQ0?=
 =?utf-8?B?dFNXTFJCTm5XZDNvNlNGWWVmb1RMSEpFdUFwQWZRRi9BdzlGazdNcFZLTER0?=
 =?utf-8?B?RllZb3RIbzhyd0FpREd0RVhUbUtxODdLYUF5QWcyMkJ6Yi9RSU14TVFtcXda?=
 =?utf-8?Q?+h7PnECT+gg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTM0L24wNnVDcjZLTGhMQ0hMWWsrM252REF1UjQ2Z1ArbkpoQ1ltUWRDQVVH?=
 =?utf-8?B?TEwxTHd5c0VKdUhYeVNFbElFajR5N3JocWsxOWJHcm44OEZLNWlNak00ODl4?=
 =?utf-8?B?cVJBSTBRUWlqRGlNWnR2cC9udTlaQVlxOHFJR0FvNkFsMEdXTEgwOXYvTFNl?=
 =?utf-8?B?R2ZwaklyMnJYSFBUQXczMFFhOGlEV2ltY2FvV0FqRzFRNDArOGlKeHhOanpu?=
 =?utf-8?B?Z3hqOTM0NzV2S3pHTG9ERkxhTUZjY2VOYzdsd0MyQ29tWlRSa21tVlFYa005?=
 =?utf-8?B?cEtkSkV4YzFtcEYyWmJLZXhyQ0s2OU8wZVlTNitUUWx4WmNWY0JJNVNuczFp?=
 =?utf-8?B?dG1JT3VRa29WZzI5OHdjSlZ4SDgvYkYwYzhTdnkveDNZVGNwMVNhL0hUU3pQ?=
 =?utf-8?B?azJUTkc2OUVaTzZQL2FqWTEwSko3a0g2ejM1WVFobjN6ejFqVzBaYlFrUEpR?=
 =?utf-8?B?NDVuQjZ3NXZqcEFQTWRRY0lGeUtKMUx0S1NQWFJEczJlM2pwNE9xcGNVbkx4?=
 =?utf-8?B?R3V3M2gybXQ2M3c3by9qUUhqMDNZZ3dnY25saE90RVlqSnlPZFR5QW0xNzho?=
 =?utf-8?B?bDBJYyt5R2pQQUdTQW1Xa2o1bWZGaVE2ejQ1dnRLbzRNN2tYZForTHd4MXV2?=
 =?utf-8?B?cGNIQXZyTXBENXZkNWNXK0NNKzN6c3RUeUgxYk5kcG9VblozN1hCdGJQNWJ1?=
 =?utf-8?B?UFV4aVVuL2pDczNSam5CTnRCVzFFby9VYVRFRXRkSUxvY3czWTRzb1FXY1lv?=
 =?utf-8?B?Lzk3cVNveldRSUtIT1FQMlBqYXJRclJoK05DSmFPSzg4N2NuV0x4dkJQQnVv?=
 =?utf-8?B?WUN2c1BiRFI5VGxVc3dscDZNbkszOS9BTG13VzNuK3psM01KRTNEQ3FvNytO?=
 =?utf-8?B?akd6TmxZRTk4UUYzem5lSk0vbWs3UGw3SWdZbTVLNFBkd3pRL1J3eUxEazZq?=
 =?utf-8?B?bUJPTFBLSndqYkFGZkxPc3p6cTdnRTcxQjJjTnVSdzlrYjZyZkIwSWJaTUJy?=
 =?utf-8?B?eGxNdTVJMkhVS0tWaXJPYURyMWI3VEN3SkdFS093NTlkQTAzaUV2cTM0ZlJT?=
 =?utf-8?B?bzVEMkREdkwwQkdIU1FhRjhEK3E3RmJoVm9FckY3SThvanpjWFlQTktoWHZr?=
 =?utf-8?B?eTVKZmFHcGVDeWFOS1Y5LzB5aVpuVWV1eXJaVVJFeGYwWEgvU0lNL1VwVlZn?=
 =?utf-8?B?MGQ4cnVGUllGY1pVeWlIeStZRmxQSmdaK3puWTRkRnc2Q1I1RmR5U3E3Zmwx?=
 =?utf-8?B?K0NuVDdvSVBNM3o0L2psV2hXOGdwWVhlU05CWkpaTUw1UWM1bnBSZmVhZ29a?=
 =?utf-8?B?OElha0pMOFJOeXdpb2lvQU1XZStvREtsU3dvb0VvaHc3NFovbUtEbERqSllZ?=
 =?utf-8?B?SDc2ekQ5bytpcndnZzI3NERQd3NWRUxEWjZhMVlvY1VJcVJjT084aUs0cEFE?=
 =?utf-8?B?eWphNS9oZW1mak1NU2JWQmJ3bUdpSDRZVnBlNk92bmk4aTVxWG1nNmtMTHlR?=
 =?utf-8?B?QkticE1QcjlLb1lWcEc4L2Jqay9MMzNPbnczTlYxMlBxNEJCL29JeVFqNlU5?=
 =?utf-8?B?bUlSV3E3WFZDMS8zeDlnckxjT2t2TjloM3JTdEc5ODZ5WDNLVkFRMjZCU2h1?=
 =?utf-8?B?UVlXcVJwNTVHTXIwbDVwUmtHT092d25aZFhHT2xLSG1VcTZ1Q255RTc3ZGdS?=
 =?utf-8?B?VEdvL2pieGs3bDd6Sm9pYTFETU1kUmFvbk1oUnU2c01uUzBFd3lmcHlqZy9I?=
 =?utf-8?B?VVorZWJHQlNCTEZHVXNYTjBrSGluRytkdWlNT3ZBLzBGQWk4bXRVd2hxTHFk?=
 =?utf-8?B?anBldUdTT0tYTFBuYmxlMzVqV1RsYkFUTGxXNmhERDRWQnFDdElBckhqNldX?=
 =?utf-8?B?VU80ZlprRXVka3JPNW1NN3B0ZEVIZGlhMnFHM2ZaZ0JTZlBhQ2t0ekpoN3JW?=
 =?utf-8?B?WE13eFlWS004am5XbGtaYmhhUUg4Rm13cXBiekZaZDVHWlBPMzZ0cFgzMzVL?=
 =?utf-8?B?Z0xiMlluZXBJTWxwN294b3BmdEFvRjYyVHV1NklmNC9iZEFCNnIxWGQ2ZTFx?=
 =?utf-8?B?SXgwa293YktxMzVCdXJ3c1AvVEYwaDlnQnJvNXRwMG9LbUZxd3NLSWZIVkNO?=
 =?utf-8?B?U1VleEZMN3NiN3dXV3FPeU1kNkxwazkybi9VSlZDcTJET2JFSnpFT2M0MVlE?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cdc7eb4-a540-4a79-c637-08dd9d172dfc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 12:08:23.9062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rP55cJ2oX5VQ+vWY/DWsyWSQ9Hj/l3ML81IPVg1AK1lcsSHn0z6MJJCjIh7Pq4+j6ErLSdx7GRoo6LrEh/09YBpNStcw7FfhsIz2glpA75g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5918
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

Drivers could leverage the fact that the VF BAR MMIO reservation is
created for total number of VFs supported by the device by resizing the
BAR to larger size when smaller number of VFs is enabled.

Add a pci_iov_vf_bar_set_size() function to control the size and a
pci_iov_vf_bar_get_sizes() helper to get the VF BAR sizes that will
allow up to num_vfs to be successfully enabled with the current
underlying reservation size.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/pci/iov.c   | 73 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pci.h |  6 ++++
 2 files changed, 79 insertions(+)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index f34173c70b32a..ac4375954c947 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -8,11 +8,15 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/log2.h>
 #include <linux/pci.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <linux/string.h>
 #include <linux/delay.h>
+#include <asm/div64.h>
 #include "pci.h"
 
 #define VIRTFN_ID_LEN	17	/* "virtfn%u\0" for 2^32 - 1 */
@@ -1313,3 +1317,72 @@ int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn)
 	return nr_virtfn;
 }
 EXPORT_SYMBOL_GPL(pci_sriov_configure_simple);
+
+/**
+ * pci_iov_vf_bar_set_size - set a new size for a VF BAR
+ * @dev: the PCI device
+ * @resno: the resource number
+ * @size: new size as defined in the spec (0=1MB, 31=128TB)
+ *
+ * Set the new size of a VF BAR that supports VF resizable BAR capability.
+ * Unlike pci_resize_resource(), this does not cause the resource that
+ * reserves the MMIO space (originally up to total_VFs) to be resized, which
+ * means that following calls to pci_enable_sriov() can fail if the resources
+ * no longer fit.
+ *
+ * Return: 0 on success, or negative on failure.
+ */
+int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
+{
+	u32 sizes;
+	int ret;
+
+	if (!pci_resource_is_iov(resno))
+		return -EINVAL;
+
+	if (pci_iov_is_memory_decoding_enabled(dev))
+		return -EBUSY;
+
+	sizes = pci_rebar_get_possible_sizes(dev, resno);
+	if (!sizes)
+		return -ENOTSUPP;
+
+	if (!(sizes & BIT(size)))
+		return -EINVAL;
+
+	ret = pci_rebar_set_size(dev, resno, size);
+	if (ret)
+		return ret;
+
+	pci_iov_resource_set_size(dev, resno, pci_rebar_size_to_bytes(size));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pci_iov_vf_bar_set_size);
+
+/**
+ * pci_iov_vf_bar_get_sizes - get VF BAR sizes allowing to create up to num_vfs
+ * @dev: the PCI device
+ * @resno: the resource number
+ * @num_vfs: number of VFs
+ *
+ * Get the sizes of a VF resizable BAR that can accommodate @num_vfs within
+ * the currently assigned size of the resource @resno.
+ *
+ * Return: A bitmask of sizes in format defined in the spec (bit 0=1MB,
+ * bit 31=128TB).
+ */
+u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
+{
+	u64 vf_len = pci_resource_len(dev, resno);
+	u32 sizes;
+
+	if (!num_vfs)
+		return 0;
+
+	do_div(vf_len, num_vfs);
+	sizes = (roundup_pow_of_two(vf_len + 1) - 1) >> ilog2(SZ_1M);
+
+	return sizes & pci_rebar_get_possible_sizes(dev, resno);
+}
+EXPORT_SYMBOL_GPL(pci_iov_vf_bar_get_sizes);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index ab62bcb5f99c6..cc633b1a13d51 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2437,6 +2437,8 @@ int pci_sriov_set_totalvfs(struct pci_dev *dev, u16 numvfs);
 int pci_sriov_get_totalvfs(struct pci_dev *dev);
 int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn);
 resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno);
+int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size);
+u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs);
 void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe);
 
 /* Arch may override these (weak) */
@@ -2489,6 +2491,10 @@ static inline int pci_sriov_get_totalvfs(struct pci_dev *dev)
 #define pci_sriov_configure_simple	NULL
 static inline resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 { return 0; }
+static inline int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
+{ return -ENODEV; }
+static inline u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
+{ return 0; }
 static inline void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe) { }
 #endif
 
-- 
2.49.0

