Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15471C363C6
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629A110E787;
	Wed,  5 Nov 2025 15:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ja7tJGAN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC7210E783;
 Wed,  5 Nov 2025 15:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355469; x=1793891469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OEz4I1kY9hayeVPj5nR830x7hOsbU+y68eOFejL/64Y=;
 b=ja7tJGANLC/B5HO5KN0WObs9CnqGCFLZFFBSd8TPeHeLXP0LRvfphlnV
 68Y6s/fhy9j17HI4q/or1Kq8IyqUy9g2La41I83sAIZjunDQDoLAtm764
 P7Z6VaqhW84IR5UXoY+RSNfuAsC/0q+wXudZXzjf7DGZy2B2Ik/2JO1Yt
 nj0Bo9Eh1HGrmL2aIZm32Mamj6PsR9sKL78I7SfJqBwcR9Y+RWoDuECRz
 04R5Wa/kAQA70SZwGaYajvHi624U3RcH/YHtcwtyJ/kSbIZ05buLhh2F+
 dUcnJLN4bUiHOycHb2U7PvjmZtxBOWvjpTw6ZbvoTUw0+L/hitlxHO3dd A==;
X-CSE-ConnectionGUID: InTOSM82SJmketrviXPOZw==
X-CSE-MsgGUID: +sskDMWoSfKrp2ioccYO7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74764093"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="74764093"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:11:07 -0800
X-CSE-ConnectionGUID: +B0GzmNwTYWG4mQ87hXx3A==
X-CSE-MsgGUID: s43XTvxXSPORo4mNgqLszQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="192649331"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:11:07 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:11:06 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:11:06 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.23)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:11:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PURKxgd/p7Fa6sxx/5MrsmcKIyo20IfKMJnUQBhzXHn+4wkWzGjwmJIX2mSr0Hk9c207nfM9zLGvGPfJR4kpz0klgjqSHE58iy1OCvIP3l9aIv3r76+wFWIe3+RjH6h5tDnPIjJlJO5ppV5ZM1WghTBkv8HSGTYxvEdTyRfXg+jTEcMOqFvVw6nM8Z+IW9lSTzXLJf2cbta2KJ2i1WPzOOFGBK724S/ZRORI3AcB+mzLjT5tPYqvWFd82LKQeza6JiJFe3AOmfoWwmALfWrL9JR2fEbHIRd5bGKgu/qdl2otMSvg2Ps1zJCEW3c4JqO02lnX+xMvarBks/wfUuK6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2P5II2UBd9xQeSNqCW8ktN5I1ZSK5ldkFSI1j5haeU=;
 b=nje8WERHWzIc23hzez0OHKG8wsT4k//YDHjo7i0MrLEzzWNm6EETG/gCokbCTVFQruAyaphWxKqSN7F84n+BJ5OgyBVXWmJ3Pib1EqbnbYCk9IWSZm8pIGT1GrtCurC7KK51MuGJK0ZsnDL3C8QtL9r/UmJ4k77qRQ6JdzU3sTMv5Gy7AffkcnU9NqkLbpVOPbxqRz247c0AUZ+8OKhY9F8mP+xXEH3T6ssyLN5UNjsf6rdUa9iyZxmF/oeuZwkxFTPizvtPs1i6KnoqWaWhFofs+VbllvANzAwZnFlCVRN85I2d8tK7YDbva1ooQzsX0KsivOLA3VJZhMTBaPzZRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB8123.namprd11.prod.outlook.com (2603:10b6:510:236::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.8; Wed, 5 Nov 2025 15:11:04 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:11:03 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v4 04/28] drm/xe/pf: Add save/restore control state stubs and
 connect to debugfs
Date: Wed, 5 Nov 2025 16:10:02 +0100
Message-ID: <20251105151027.540712-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0385.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::21) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c9d2d1-3285-4d57-3a8e-08de1c7d8979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEZsempGbXdDV2M4bk95NDhiT3NLRDA4NHJiNWZDQVRZRmN4UGV6dWdPV3JX?=
 =?utf-8?B?NUQzWWdNdkIvbFB6NFR4cFA3QUp1aEhmYmtUeGNCcjZQdUVsTVVpR1BNcDhL?=
 =?utf-8?B?Sm5LZzdiUmJWbEEyZlhNZWxLUG5VdzZUazJTUEJxQklKV2s2bjE2Wk9XTXpJ?=
 =?utf-8?B?YmtXZVV4NlFTZ0VKOW50aFlzVGdaKzJqRDlKcGo3djMrR3ZpZHdacnhQdE5r?=
 =?utf-8?B?UklVOU9HZGo1c01vejhILzE1M3R3TjgyUGxwQVRkZ0FDdnJjMEY4Vks0U2NR?=
 =?utf-8?B?eWI5U1NoSWJ5NkNrL2xrbkxnQjNZY0JQNXJUM0NZUDZCYWFFRWlxSGdrM3o1?=
 =?utf-8?B?N1hMWTNKYzRaWXhkMktoMW1sZmhtVVZZU0RsSk1TYmt1UndXc095WDRPWnJm?=
 =?utf-8?B?T1hGaEV4RkhLbjk5Tlc1MmRyMElwdlRBUUdCcVdDZHhzancxeUZHNzYzalJs?=
 =?utf-8?B?djdMQlorZTZIZjNxdUhSVDNydXRKb3RhaVdpa0N2MldSN09FanNjcmdFRzE4?=
 =?utf-8?B?WWZvaGhSa20xYXlDUjRjT1Job0lhY3cxZUVQcWFidnAvOW9qcVpwK3NTOU1z?=
 =?utf-8?B?RFVuMWh2cTJWdTMweEZMcXhjTGRiZCtoaHZTRzMrMlg4VHJMYTEwT0xHYThm?=
 =?utf-8?B?NmE0dVNyV2llR25zOFNSN2FoN0ZRWTE1SGdudFZZN3BySVAxb0g3c2VtdHlw?=
 =?utf-8?B?UFZjR2pDbnZ6U2IybklFYnAyaWlscmpLY2lGVVc2a0lEWitYckFzRWxGb08v?=
 =?utf-8?B?STlzeEJpTmVzR2ltK1hLem1NeFRqWFQ4cG5xSjlyaStuY3h3TTROSjV3K3Rq?=
 =?utf-8?B?Q1NiSmV1dDZlK3M3QWduTU5YenZ2YUc2Y0VUaERhdHpEVllxNS9hQ2pkb25Q?=
 =?utf-8?B?RDlaSVF0M1FrZjhaZDlWZUZkQTVIOGRISEpGOFcwUW1USkFEdXhPZUR5eHZP?=
 =?utf-8?B?blRsMGgxSE5nQkI3TGlNSXBCM0M5c2srSHNlTUJHWUozbXFhK3hBOTNJTFhs?=
 =?utf-8?B?Yk90WHRTSzVqMXRZOWtHQ0l5RWNRRnZNYTFZR2g5UUd3dUY4b1BONTVQWG9h?=
 =?utf-8?B?ZWRFdzQ1MFBmMHBjcWdDcFAxTXRJSy81UmtUeWRkM0pPWHJ1N25MZFZxcTl4?=
 =?utf-8?B?dFV1eDVnSjJ3blp2KzRUVEVOZmtSNVprRFphSW95MzN5WXptQVNhWUZZcnpl?=
 =?utf-8?B?NHhVWHJlTTh2VW44T1ZaVUJ4NzZhMjJKU2pUbWJWTjg4MGIvMXFPekRDRnhR?=
 =?utf-8?B?aDc1Q0ZpK3hYZDBFWVlPcjZYQXdNVXIxQ0dTZWZIT2l0YzBTYWJnVUFlOGxv?=
 =?utf-8?B?cnAycVlVTlNoZzNRbEtaeHpvTGdabDd3dG4yS2k4Y3ZIQUtLaEpLNzd6RGxQ?=
 =?utf-8?B?Y2VzU3k4SmFNMUJabXB3Yit2UU9HY3NuRTR2eURSSkxlVXJyNDZtazdsQzZx?=
 =?utf-8?B?WTlJNXlMR3Bsc0U5VFZHUUIzRERIemdVZE80bkV6Y1lpWm9Hbi9WTlZ1aitF?=
 =?utf-8?B?TXFZL0ZwNzVwOS9wd25DNlJla0dQQk5kNmExdlpZVlBlUXNyM3ExS1ZEajdn?=
 =?utf-8?B?NnJQY1VKeXFObFFCeHB5eUVHaFhXaEtudFZsUm01djNrYi9ZNzI2WWlqOGZ3?=
 =?utf-8?B?eExZUXh1OEhEZm43T01QbHE2bE55NFRzOTQ2WTVHbjdvUDNtNUhYbHVOREVi?=
 =?utf-8?B?SVhyOW9iK0lLMXh5alBUVWw5NWdHTm5VRHBNRHNyNkRxRU1YSUQ2Y0ZIUlB2?=
 =?utf-8?B?dDdTbHlMdVNGKytLNlFLZHU3d3VBdEhSNm5sbkxTS2FVM05HbFpGT3Q2T0Mv?=
 =?utf-8?B?b3VIcTZLcGpwS1ZUbElpb1JEbmp3cXNuVlRrZ2dHQmhyMllNY3NySVBLN2I4?=
 =?utf-8?B?VGY5bS9pUTZDenU2V2xKT05JMUcvakFPb3lRNW5YbmhETE5sSmpSdThuaFNT?=
 =?utf-8?B?bWFJVkNzcUJncEwvdHZRbFJlOU5uS0U4ZGdZQ0dtb3ZaZEV6d1lreTBXMnc3?=
 =?utf-8?Q?XFv06Qq+haLLu0DAYC/F5IPCipFND4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SW9Ca2VKcVdyczBvMXo2OEQ5Z1dnSWRCbUJSd3R2dmNvYS9ORlpIdWk5Nmgx?=
 =?utf-8?B?QVhZOFFmVUw4OXRKci9aTlY1aHhIaTdoTFN0QzlpN0IyS252ODNvL2EyTjhq?=
 =?utf-8?B?R0k5T2NHVTlON0hXTUdMRU1RYzlFOFFOQ1R4TkExNVpWL2FTU2NaN0QxSkly?=
 =?utf-8?B?MVdQakp4cm5VWHl1S3ZBbTI3QjkyNmp0VTg4VWxJbFhHRHVLd3M3eEZ3TDhQ?=
 =?utf-8?B?SUV0cHRmNk1Md3FBSVJ3TWxhRTBLYW1SMmxPMlo0SFVCdDdXQlVkTDVXNitv?=
 =?utf-8?B?YjIySlFkSW0ydyt1Y0Zia3FBVUlGcENkVjhTQS94U1R6dDQrTTEwUGZoK2wy?=
 =?utf-8?B?S25kYUVTOFJLMGM3dmtoZ1NRTGNCNGZuWng4a0RjQlk0RnU3czFkMHZkUG44?=
 =?utf-8?B?eXJVeUd1dU5mV0tkK1cxazMyRUI2ZXBrczRMbiszeGtvcnRrbHZRRnMrRitp?=
 =?utf-8?B?YUxJNW5QUUpTUzdIdUl2d0FrVmF2bzZ6NXd1dDJLMTdvKytVSzdQdDNlQXB0?=
 =?utf-8?B?eSt2WmV2SFlSdDR0L3YzYng1a2tNOVhTKzA2R2ZKYTVITUdaQnVvbG9iRFlE?=
 =?utf-8?B?Yk1SdUFwSW9mUzlZZnpJeXNmZytUYjhjL2ZFTEZOdFpMMnVMc3FwdG5mT2cz?=
 =?utf-8?B?b2ttRm1RS1MzZ1QzK0pacUZzR0RIUzRjVXBWRkhuWkxzOWpoRS9pdGlBKzRa?=
 =?utf-8?B?QkN0a0hrSmV2eG1vVElHY3V0d256ZHo5aTNwbVB0bDVvTDNOZllGK2lGeGJU?=
 =?utf-8?B?ZlJlTGNPbTVnQmRLa21rUnY5cW5DYkVaTnpCNVVZdHppUkZxa2VvbWVUc1pS?=
 =?utf-8?B?em5LWmNHN0U1R1ZXMFZnSTg1TFZoV3QzYzBiZ2JSM1NFdTdGN0VXSXRGWkFN?=
 =?utf-8?B?anE3aGRPODNUbFk3RW9TTFA2RjRPVVFscmZJTDN1TWs0Z05VT0JMUGxLWTky?=
 =?utf-8?B?eFRzVnlDRENlckI1Ym5aS3Vud1Y1cFpiS2xZa3dqWG5RRTdZZzV5T2JWejN4?=
 =?utf-8?B?MnJ3RXZwMU4vZGJDZzBPdnlsZUZDd3l1dkRZcHRqMldhNXdvSzA5RjUzUWpy?=
 =?utf-8?B?VFhkYWYvTW4xV3JpR0RDOXBOOTN1Wm1OcTd3TUpmdUM0REgycjNCYmMyNXgw?=
 =?utf-8?B?bjZHZ1BhVlhueUkvYXQxaFVQYVN6UkIzTXhpQlg0WGJJTG44VkE4K0pURFQ3?=
 =?utf-8?B?c0o0M3VFaXRpSndVSDIrdTBuSGJNV0EwcUNTTWV4YWM2MDVHVUdlazF1RzVJ?=
 =?utf-8?B?cCtVM1FPTGttZzRJY1IrbFREK0ZBMXVGb2lrWlVvT1BLQU1nOVhLTnNTekdN?=
 =?utf-8?B?akFTMXpKY0x0Tjkwc2xxMW5Ra0NpQVBkdUlGQXhPejhhMURUNnlCbUVtcm96?=
 =?utf-8?B?RW13N1B6bmUwdm8ybjZiOGJGeWV2cXNjWXhaN3llMkdodm1GRDByazhiNlYx?=
 =?utf-8?B?a2haWjQ2MkxtamZseitURFk2dUhsSmdwSXNlc1M5cHlhS2VVQ0pnaE54ZGxo?=
 =?utf-8?B?c1BkMGR5R3hsTm16SmN4bFM2NW55NW53QWREUHFEQWYvV1c0allReTl3Umx1?=
 =?utf-8?B?MDNwdzlxZFRDd2FNOVY4RE5KOXhKOGVTSmFpL0ttWGFYcklwK0grYnJYMnhk?=
 =?utf-8?B?WjVxUlVXY0I0NkpQalpESkIzNEpPeitJR0c4YlAzeVQrcVp1SjgrelprQis4?=
 =?utf-8?B?TlhzMlV0S2dKZG8rOE1zRkVjU3NmQmNuZzJhWmV1MjdQNTFOMGJwY3hYczQw?=
 =?utf-8?B?VUJvNG1FQnJkRjhSWUJiTGdybk56dGpibTk3S3JCM0l6UGNJUkJxYXhneGRR?=
 =?utf-8?B?WjdMdWhxS2JJNXhGSmhJSUw3ckZRd285czIwaE1xTWhBT3pRaVNmaTA0ek8v?=
 =?utf-8?B?NzE0aTRCUnhLWmYzek1uNTZQekY2Mklkb1BJdmdTWUcyVFBFUzl3OXFpVity?=
 =?utf-8?B?ekRXWjZTejM2YTZnbWdMMytPUG1adExpNEl2eDV5WmROTTBPWnFHdk1iRnAr?=
 =?utf-8?B?VkNqeVVrSS8rbng3NElia2d6ellGT3phYWxSenVvM1VzdGh5TUUrb3gvWDB5?=
 =?utf-8?B?ejFpOEVUMnJQUHhpZHdGZXVsNHB0NTlqZWhHcS9IL1BnMFNra21WY0t2RENv?=
 =?utf-8?B?aGlMRXd3NndGTjEwelNud1ZJQTUyRFVLOHdmdEczZXdYMURTVU1sY2c0dWt2?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c9d2d1-3285-4d57-3a8e-08de1c7d8979
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:11:03.8879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8qfpI4pUX1uJ5SoCtIi3/Euoix+NjIBshEnBjKbLRypr9+Hb9/w6hUDSPjZVfqmMMO+MKHJ5SGvAkwPcnhpdml8xfHULWV3TQxiS1/vbtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8123
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

The states will be used by upcoming changes to produce (in case of save)
or consume (in case of resume) the VF migration data.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 248 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   4 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  14 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |  96 +++++++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h      |   4 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  38 +++
 6 files changed, 404 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 8a2577fda4198..a571e1c02a3b4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -184,6 +184,12 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(PAUSE_SAVE_GUC);
 	CASE2STR(PAUSE_FAILED);
 	CASE2STR(PAUSED);
+	CASE2STR(SAVE_WIP);
+	CASE2STR(SAVE_FAILED);
+	CASE2STR(SAVED);
+	CASE2STR(RESTORE_WIP);
+	CASE2STR(RESTORE_FAILED);
+	CASE2STR(RESTORED);
 	CASE2STR(RESUME_WIP);
 	CASE2STR(RESUME_SEND_RESUME);
 	CASE2STR(RESUME_FAILED);
@@ -208,6 +214,8 @@ static unsigned long pf_get_default_timeout(enum xe_gt_sriov_control_bits bit)
 	case XE_GT_SRIOV_STATE_FLR_WIP:
 	case XE_GT_SRIOV_STATE_FLR_RESET_CONFIG:
 		return 5 * HZ;
+	case XE_GT_SRIOV_STATE_RESTORE_WIP:
+		return 20 * HZ;
 	default:
 		return HZ;
 	}
@@ -329,6 +337,8 @@ static void pf_exit_vf_mismatch(struct xe_gt *gt, unsigned int vfid)
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_FAILED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_FAILED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
 }
 
 #define pf_enter_vf_state_machine_bug(gt, vfid) ({	\
@@ -359,6 +369,8 @@ static void pf_queue_vf(struct xe_gt *gt, unsigned int vfid)
 
 static void pf_exit_vf_flr_wip(struct xe_gt *gt, unsigned int vfid);
 static void pf_exit_vf_stop_wip(struct xe_gt *gt, unsigned int vfid);
+static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid);
+static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid);
 static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid);
 static void pf_exit_vf_resume_wip(struct xe_gt *gt, unsigned int vfid);
 
@@ -380,6 +392,8 @@ static void pf_exit_vf_wip(struct xe_gt *gt, unsigned int vfid)
 
 		pf_exit_vf_flr_wip(gt, vfid);
 		pf_exit_vf_stop_wip(gt, vfid);
+		pf_exit_vf_save_wip(gt, vfid);
+		pf_exit_vf_restore_wip(gt, vfid);
 		pf_exit_vf_pause_wip(gt, vfid);
 		pf_exit_vf_resume_wip(gt, vfid);
 
@@ -399,6 +413,8 @@ static void pf_enter_vf_ready(struct xe_gt *gt, unsigned int vfid)
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
 	pf_exit_vf_mismatch(gt, vfid);
 	pf_exit_vf_wip(gt, vfid);
 }
@@ -675,6 +691,8 @@ static void pf_enter_vf_resumed(struct xe_gt *gt, unsigned int vfid)
 {
 	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
 	pf_exit_vf_mismatch(gt, vfid);
 	pf_exit_vf_wip(gt, vfid);
 }
@@ -753,6 +771,16 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
 		return -EPERM;
 	}
 
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u save is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u restore is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
 	if (!pf_enter_vf_resume_wip(gt, vfid)) {
 		xe_gt_sriov_dbg(gt, "VF%u resume already in progress!\n", vfid);
 		return -EALREADY;
@@ -776,6 +804,218 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
 	return -ECANCELED;
 }
 
+static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
+}
+
+static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+
+	xe_gt_sriov_dbg(gt, "VF%u saved!\n", vfid);
+
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_mismatch(gt, vfid);
+	pf_exit_vf_wip(gt, vfid);
+}
+
+static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
+		return false;
+
+	pf_enter_vf_saved(gt, vfid);
+
+	return true;
+}
+
+static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		pf_enter_vf_wip(gt, vfid);
+		pf_queue_vf(gt, vfid);
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * xe_gt_sriov_pf_control_trigger_save_vf() - Start an SR-IOV VF migration data save sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
+		return -EPERM;
+	}
+
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
+		return -EPERM;
+	}
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u restore is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
+	if (!pf_enter_vf_save_wip(gt, vfid)) {
+		xe_gt_sriov_dbg(gt, "VF%u save already in progress!\n", vfid);
+		return -EALREADY;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_control_finish_save_vf() - Complete a VF migration data save sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED)) {
+		pf_enter_vf_mismatch(gt, vfid);
+		return -EIO;
+	}
+
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+
+	return 0;
+}
+
+static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP);
+}
+
+static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+
+	xe_gt_sriov_dbg(gt, "VF%u restored!\n", vfid);
+
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_mismatch(gt, vfid);
+	pf_exit_vf_wip(gt, vfid);
+}
+
+static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
+		return false;
+
+	pf_enter_vf_restored(gt, vfid);
+
+	return true;
+}
+
+static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		pf_enter_vf_wip(gt, vfid);
+		pf_queue_vf(gt, vfid);
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
+		return -EPERM;
+	}
+
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
+		return -EPERM;
+	}
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u save is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
+	if (!pf_enter_vf_restore_wip(gt, vfid)) {
+		xe_gt_sriov_dbg(gt, "VF%u restore already in progress!\n", vfid);
+		return -EALREADY;
+	}
+
+	return 0;
+}
+
+static int pf_wait_vf_restore_done(struct xe_gt *gt, unsigned int vfid)
+{
+	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_RESTORE_WIP);
+	int err;
+
+	err = pf_wait_vf_wip_done(gt, vfid, timeout);
+	if (err) {
+		xe_gt_sriov_notice(gt, "VF%u RESTORE didn't finish in %u ms (%pe)\n",
+				   vfid, jiffies_to_msecs(timeout), ERR_PTR(err));
+		return err;
+	}
+
+	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
+		return -EIO;
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_control_finish_restore_vf() - Complete a VF migration data restore sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	int ret;
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		ret = pf_wait_vf_restore_done(gt, vfid);
+		if (ret)
+			return ret;
+	}
+
+	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED)) {
+		pf_enter_vf_mismatch(gt, vfid);
+		return -EIO;
+	}
+
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+
+	return 0;
+}
+
 /**
  * DOC: The VF STOP state machine
  *
@@ -817,6 +1057,8 @@ static void pf_enter_vf_stopped(struct xe_gt *gt, unsigned int vfid)
 
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
 	pf_exit_vf_mismatch(gt, vfid);
 	pf_exit_vf_wip(gt, vfid);
 }
@@ -1463,6 +1705,12 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
 	if (pf_exit_vf_pause_save_guc(gt, vfid))
 		return true;
 
+	if (pf_handle_vf_save(gt, vfid))
+		return true;
+
+	if (pf_handle_vf_restore(gt, vfid))
+		return true;
+
 	if (pf_exit_vf_resume_send_resume(gt, vfid))
 		return true;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
index 8a72ef3778d47..0286536375d17 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
@@ -16,6 +16,10 @@ void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
 
 int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_sync_flr(struct xe_gt *gt, unsigned int vfid, bool sync);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index d9282eb259727..c0ce05818e24f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -31,6 +31,12 @@
  * @XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC: indicates that the PF needs to save the VF GuC state.
  * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
  * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
+ * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
+ * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
+ * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
+ * @XE_GT_SRIOV_STATE_RESTORE_WIP: indicates that VF restore operation is in progress.
+ * @XE_GT_SRIOV_STATE_RESTORE_FAILED: indicates that VF restore operation has failed.
+ * @XE_GT_SRIOV_STATE_RESTORED: indicates that VF data is restored.
  * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
  * @XE_GT_SRIOV_STATE_RESUME_SEND_RESUME: indicates that the PF is about to send RESUME command.
  * @XE_GT_SRIOV_STATE_RESUME_FAILED: indicates that a VF resume operation has failed.
@@ -63,6 +69,14 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_PAUSE_FAILED,
 	XE_GT_SRIOV_STATE_PAUSED,
 
+	XE_GT_SRIOV_STATE_SAVE_WIP,
+	XE_GT_SRIOV_STATE_SAVE_FAILED,
+	XE_GT_SRIOV_STATE_SAVED,
+
+	XE_GT_SRIOV_STATE_RESTORE_WIP,
+	XE_GT_SRIOV_STATE_RESTORE_FAILED,
+	XE_GT_SRIOV_STATE_RESTORED,
+
 	XE_GT_SRIOV_STATE_RESUME_WIP,
 	XE_GT_SRIOV_STATE_RESUME_SEND_RESUME,
 	XE_GT_SRIOV_STATE_RESUME_FAILED,
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index 416d00a03fbb7..8d8a01faf5291 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -149,3 +149,99 @@ int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid)
 
 	return 0;
 }
+
+/**
+ * xe_sriov_pf_control_trigger_save_vf - Start a VF migration data SAVE sequence on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_sriov_pf_control_finish_save_vf - Complete a VF migration data SAVE sequence on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_finish_save_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_finish_save_vf(gt, vfid);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+/**
+ * xe_sriov_pf_control_trigger_restore_vf - Start a VF migration data RESTORE sequence on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_trigger_restore_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_trigger_restore_vf(gt, vfid);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * xe_sriov_pf_control_wait_restore_vf - Complete a VF migration data RESTORE sequence in all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_finish_restore_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_finish_restore_vf(gt, vfid);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
index 2d52d0ac1b28f..30318c1fba34e 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
@@ -13,5 +13,9 @@ int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_finish_save_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_trigger_restore_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_finish_restore_vf(struct xe_device *xe, unsigned int vfid);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index a81aa05c55326..e0e6340c49106 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -136,11 +136,31 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
  *      │   │   ├── reset
  *      │   │   ├── resume
  *      │   │   ├── stop
+ *      │   │   ├── save
+ *      │   │   ├── restore
  *      │   │   :
  *      │   ├── vf2
  *      │   │   ├── ...
  */
 
+static int from_file_read_to_vf_call(struct seq_file *s,
+				     int (*call)(struct xe_device *, unsigned int))
+{
+	struct dentry *dent = file_dentry(s->file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+	int ret;
+
+	xe_pm_runtime_get(xe);
+	ret = call(xe, vfid);
+	xe_pm_runtime_put(xe);
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static ssize_t from_file_write_to_vf_call(struct file *file, const char __user *userbuf,
 					  size_t count, loff_t *ppos,
 					  int (*call)(struct xe_device *, unsigned int))
@@ -179,10 +199,26 @@ static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
 }										\
 DEFINE_SHOW_STORE_ATTRIBUTE(OP)
 
+#define DEFINE_VF_CONTROL_ATTRIBUTE_RW(OP)					\
+static int OP##_show(struct seq_file *s, void *unused)				\
+{										\
+	return from_file_read_to_vf_call(s,					\
+					 xe_sriov_pf_control_finish_##OP);	\
+}										\
+static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
+			  size_t count, loff_t *ppos)				\
+{										\
+	return from_file_write_to_vf_call(file, userbuf, count, ppos,		\
+					  xe_sriov_pf_control_trigger_##OP);	\
+}										\
+DEFINE_SHOW_STORE_ATTRIBUTE(OP)
+
 DEFINE_VF_CONTROL_ATTRIBUTE(pause_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE(resume_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE(stop_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
+DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
+DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
 
 static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 {
@@ -190,6 +226,8 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 	debugfs_create_file("resume", 0200, vfdent, xe, &resume_vf_fops);
 	debugfs_create_file("stop", 0200, vfdent, xe, &stop_vf_fops);
 	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
+	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
+	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
 }
 
 static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
-- 
2.51.2

