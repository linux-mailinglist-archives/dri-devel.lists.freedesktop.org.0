Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F17B4C4A35E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8C710E4BC;
	Tue, 11 Nov 2025 01:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C0i7fX+l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC48710E4A4;
 Tue, 11 Nov 2025 01:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823213; x=1794359213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fhGtB5XpFOgmfjkvPMh9nALbiVDqV0gW3xHOEqtXowg=;
 b=C0i7fX+l/Bh5xh6kxHaTjR0+HyLfEySxE3W04aohd1Y9bUnm0mKFREte
 l29vLI1JRkDhsV/Gf9CjSOEwSCNXCUOWSQPNzyMKQsIwW4DWfFn8IAZzB
 N3OSn45hKzI3+tJSU7WS6SWr7lIT/0dzyOT4QrqLZDkTGk4qsljahFCu8
 CCGSDKBE9md8k6MaYxQOOtqE98qRozJ+LS3+r+T3ivCrDYAFYyuAc4Twv
 CG7B8t2DJb/yNz0SoNq6T8bIMiRePjt+KWvyLQJb5QZH9YJq7un1hZikc
 evSy2CPQSz2/5ZXkjXLpfGAFTrtx1ZvhKUDxX+UMWSVrPxxAyouKrdMVG A==;
X-CSE-ConnectionGUID: 8qsqMBMHQvqEVxmEUGNc1Q==
X-CSE-MsgGUID: HBF5+SVxSJqlNxOJsZSESQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64812623"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64812623"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:53 -0800
X-CSE-ConnectionGUID: b00MR/imTzKzBPYgelnz0g==
X-CSE-MsgGUID: uhZ94G0VS/6NdkcI9CzJtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188082055"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:53 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:52 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:06:52 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/XauOoIklJQ5hA6NR2BY72SHsIY1e+/vdc7hPaw8OvzRvKdQvMFF+Ev5fPXIDIJRQ/RoS5sKNMOUIUrzh4h42LyEpSSFtqQrjvN0vBSpuP+KwtBsXavqsWqLFCeOfhkC+jQNfgc9bb7woILbJ264hVX7a7Epj6UBfrnV7a+jD947XZz8/ppxOKJRKZPmgHWzUR78SruLEhxhd4tNX38tovmWazl8ZEOSL6vgCsqBmMqds8GmzPt1USzlhdqaHK+kS9L+YGEpoOzakZ/cwF8xsYn5cSm3KyfuzmlqmSZ0zMG9aGVK5FkTJNAbl0nh4QqtSSXhlhZ8FbKuBXoV4g7dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTqdmUih/l1ar1TilmhuCagvZD5maq/3kaAOxyRBZ7k=;
 b=xHbxTclZwpckvkp3gvkvkEjMJ38+9FVVTvpVMjyVMdu0+Swip8d0bMUtisvKSuIYWJECEkUeJp2EeV+haMIvDTS6cV3a19NqrzPO9Wa87o0H0vYMtMhS/bHUOPv7Aj+RTdkeguYo4OD8BEFo5nnoDixdeUbSBzkOf6+MtldLL2jIp7iNDNy159fnGpRLfGSZi3t9pjByT3cxttqIrMuwViVmDJAQR4yLNTzm8kJcwj83229rxhilT79GWgUSAPMZojDX4ag/R7p5W1+Cz4Pm5fQV02BMC97QoK2ZSGqPcs32hDxX4T+grQAXPlYaf/DaUhgVxi/vjYOdZiz5D7nFTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 01:06:46 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:06:46 +0000
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
Subject: [PATCH v5 24/28] drm/xe/pf: Enable SR-IOV VF migration
Date: Tue, 11 Nov 2025 02:04:35 +0100
Message-ID: <20251111010439.347045-25-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::22) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: ef104826-c169-4c77-fc83-08de20be9613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0RLcHNyTFBwTFdPb0tabDdseWxLNUpHNE5rTHhheVNETzZUSEplcndBVEpM?=
 =?utf-8?B?cmovTzBvNlE1L2tqWFIwR2hQbVY0cmVHc0lqc08vS3piYWFpTWM0eHoxcy9M?=
 =?utf-8?B?bFQ2QkdFUDdVMzVyeUY1T0dDRHNRR0ZvcFhKRTZXRUhxdHJMN1prdXhoWVMy?=
 =?utf-8?B?Y2RRdUwrTDc2Rkp0VXRveVl1cEt5VmV1NkF6N3R3dWtQcCt6dC9VRnN1U25W?=
 =?utf-8?B?eTB5OFcrU3o0NEVBYlI4c1dVUXo2TVlmZGVlUzVIdmxBS2EyYWVVTFJ0Vjhs?=
 =?utf-8?B?WHlnVitxN3I1T1k4TUhZTW9kSG9hclhQYkNxRXR0ZWVLYTZ1V2NNZ0trTWJH?=
 =?utf-8?B?d3FYN0xEMVdvVHprcHBZR3U4Z0J5S3pyazhyKzN6aDJtbTlraFpaM3R3QUp1?=
 =?utf-8?B?aU1FSGtEeHhFSXdnenhwZU1rWjk4cXZKbDE3RnVEOUdadStrbm5IWDZRY01Q?=
 =?utf-8?B?Y3MvZlJmazJnMW9SMjNQdmNyWjZEOWs2T0xGUVQvZWN0TDlVdGtobnQ4RW5r?=
 =?utf-8?B?anUxSHZMWkRpQjBIcFd4N2w3c2JrZnZIdnlTRy9nRHdwWWZ1OTBwSGNMNGtE?=
 =?utf-8?B?ZHhMV2hmVWVVZDNZakErRXlIV2daMm9KWUoybHpqallwbDFjZjJkWmVlT0RC?=
 =?utf-8?B?ZE1uM3ZUb0tKU2FIYkhZcDVwSzAwWmFTMk1Cb2ZuMU5RZ1B3elNMWXNLRUQr?=
 =?utf-8?B?dFQ0c0ZreCtZZUVPMndvaE1nQmtWL1ptR2FPTng3RFBjdjVpZ2IzbTJVWVov?=
 =?utf-8?B?dU5rWGV2bEhxWXYyMHJ2VE5aUlZKQlB2TkdmaVBSd0F1aGNZNisvcmdlYlFJ?=
 =?utf-8?B?U1JuSHV5djAvbEc0WjVmcm9obVF6MStMbExENHZXYml3emVUUXRTSXV1bk01?=
 =?utf-8?B?ZEN2VHNFekVsM01EbERFNXRiNTZXOXlTNHRjcWpPU1NzM2krQ1diNjVORnBR?=
 =?utf-8?B?VUhkTStXL0x5WHZLQ0Zzd3BJZGdDOEo5QmNtNHg4eXloai85ckZGOFR2Yk4x?=
 =?utf-8?B?T2xEK2Q5OW1RQlg5aUNYc0JUd1FhSlIvLzlKVStOZWxKbmVQZTlvYnZ0Nm1O?=
 =?utf-8?B?OHZlSlVieTZWSitkQS9pVVFiWkxSK3RRTURoQmpSUFBWMjNkMTZqTDNlTHh5?=
 =?utf-8?B?cGJKR3BqblBLZTltWVp3MU5NVkxpNnFVTnV1NVNva1UyN2hGRjFJUStiYmow?=
 =?utf-8?B?dFRuV1RSUy82VFFMYko1ZmFvSUU4dTUrY1hQVVY5ekZZeEVNUDJ2RldvWFJh?=
 =?utf-8?B?SFovQmgvOXNvQmhxc3A2alNjeGQrc0RQTk9EUUxpSTd1L3p3NytxOVRmMndZ?=
 =?utf-8?B?N3lOdGJuMkhIRVJ6cWdGUVpxZC9zYU5ma21HakRmdGZYY3VzSkJpeWNoNzQr?=
 =?utf-8?B?NnBzcFNKWFdqbUxtc1RLcm1na2FkU1I3TFM0SnU5cS85SllMWkpHRlpMblp5?=
 =?utf-8?B?YVhIekQvYVF6ZHd2OExJaE5TZkNnQWpKLzlZV1lIMnVINVM3bTJmVmNuTktH?=
 =?utf-8?B?ekZ5QVc2Vk94N2RNUi8xSThYZHQ0cVVXUEMwRFUxRDg2N1FmUFZvYXZhditZ?=
 =?utf-8?B?L2hLNVVEd3NMUFFoS3ZtbGU3VW1iLzhhRUNCRHh1ZHVtWDVSUnp0di9xRElV?=
 =?utf-8?B?MlUycENMMk9mWkF1ekpsNU9wSkRxdmttSGFoK2tnTDNkSUszckdKbHJEV240?=
 =?utf-8?B?V0NEN1lqUzZ5RFMwTFM4ME5LV1JIRDdLN05MWnBaT1dFQmI0eHA2enhPaHlt?=
 =?utf-8?B?TUVXTkJTaCtncXpvZVNQbHEyNXJ3RDB0VUI1cUtFQnNNZExxSENpNzhFbnNZ?=
 =?utf-8?B?SnZTekpZelNpREZRNWpQZXJxd21QeFBZZERONGhRQXNzUS9LdFJDdTdaaDJr?=
 =?utf-8?B?Q1NXSlV6QllrS1A1WnZOSnFmamNmaEsxTk55ZlA3dndEYlVpZklRN3RvVlkz?=
 =?utf-8?B?Z25GT29ENkZRd0tQQmRlWFhQWjZmeklmc25mWVMrbk1PTjFzck1Ocld6L09w?=
 =?utf-8?Q?dcKykxnMm9NDdZssHTl/LAAdLXsJuU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVlFSHpTWFZPcTdZdzR6QXZLMWVBbnJUcVB5OXQ1RWdiaW9sTUozY1BxUFhD?=
 =?utf-8?B?UGpMUzhjMy9oU05wUUFxcFB2TXBXUEc4d1Q0VWRwUlJyUGg4UXIzM0NNcEQw?=
 =?utf-8?B?Y0JaMDlCRlpZWG5na1FyaEN2Q0FPdS9QbFF0YjBGZlJZMzFrcCtPWWhDbkNP?=
 =?utf-8?B?S2hCVGt5U1Z1NXhPakZ0SWtXNDFUTkZvYlpjMlN5aXBxcmttZC9IckIxRmZ0?=
 =?utf-8?B?c0VyU0FkaGF1QjlFRnZuYVdITUU2bVNreVFZTW1waCtoaXQxUE5CQVE4VzZo?=
 =?utf-8?B?Q1BFNVl1R2M0WGxwN01Ddjc1MnZvSzdnY25kT2tVd3A5b2FtbTc1bkI3bkdU?=
 =?utf-8?B?M25FVGdEcDdOQ0VZcXhNdWRTTGVJL1JRNFYzcWc4SkFkMHBqZ2ljMUtPd2hE?=
 =?utf-8?B?U09MVGVpbW5QK21wdnFZaE14NDViakc5OTAzay9SZ3dpc1lPSXgwTVk4aFNy?=
 =?utf-8?B?amt4VHFGeFRLQm5obW5jSm9vR2YvdDI2R0ZUMmVzY1ZJQkpwR1Ywek0wcjZC?=
 =?utf-8?B?Rnd6SGxFVUdyaTJ6TEFSNmtrZmNibnRlRUg4UDBhUmwvNzUzSXpBQU1Ubzlx?=
 =?utf-8?B?UmovRHFXN1ZhMm91V3JqWEVuaU1wbGdKckpKUW92U0ExVnBwSVRWenMvVWFU?=
 =?utf-8?B?MFFXdVVEbWl0bzNNM0pBbFRnWDFKWU5QOWpVQkFVRzdGKytnMGtOUHllU2tu?=
 =?utf-8?B?WFBQb1NVbzBNRk5BNVVIMGxXV0xiVGljR1NNR1pyRnA1OU1od1E2SnhMYTNE?=
 =?utf-8?B?ZTN4UzNpdzBJTko3U0N3TFA0SGZVd1pFRXNvdXEwRnoyMmtaVUpIb1VpaVUx?=
 =?utf-8?B?bFZKN3ZEdzhOeE4xdFM2U1NuSUI3M0NVSk4yRTkwdjNReE1iak1DZFUzVFBo?=
 =?utf-8?B?Q2V3c2szRjBkZ2VyWU80L2ZoaS9rOTNUeDRBWXd2aTBFdlJYanRldnJxdkxC?=
 =?utf-8?B?THlwODBHTjYwTHg1S2NEU2NmalMxVW1rbGpXdDlzWUo4WFlEdkEva1I1dTBK?=
 =?utf-8?B?aGZiYjlaRXRIZTViRnFoMUtBS0ZwTERRU0JheWZKU3B4UCtKbGFxOUFUaVNQ?=
 =?utf-8?B?SWNmeFRaYzJZMW8vNDdDQU9VNDRjTHc5Z0FiemtHQXBEa2FCS0tmNTJFTVVC?=
 =?utf-8?B?K0IwMnY0Qnl2dk1TVkxMcUJKTzdFa1VoSStjQitXVWdORW1IN2pMRlBrVVlK?=
 =?utf-8?B?d0xQK1g5RjluMVBEbFQ0alk1S09KQUxkRm8zNHhpRElDYTVlcUZORllJS3Vi?=
 =?utf-8?B?MmJJY2svL3ZQenk4MlI1c2NlZzBNbXBOdGd5UGdvd1grYm90T0w3UTQwUkRN?=
 =?utf-8?B?ZnBIbjdoaTZHY2tRcDdiQkxydWZNaVVFeSt4VXlhUVdiWmIzNFcweHE1bE91?=
 =?utf-8?B?VWJUbHdTRVU5Y0hqNDhvYmJnZ2NmTDEyWk9iVE9zTHh1ZkRzb1NGZ2RIMXk0?=
 =?utf-8?B?V0NackthYjdNYVU4NXp1aENWWkRGKzQ1N2I2RmVoSEQ0SEpQcWUxbGRUeStD?=
 =?utf-8?B?SHVrNEpVK0FtV2krTlZMSTh4NSsrZmk1c3g3TjkyVW4ycHFMRmE5QThETHly?=
 =?utf-8?B?NmhyUFR0bzJWVTRWZ1ZvMWZGbWVDV2dkcXBLT1h4SkFaMmFDRnh6ZFVrNnFp?=
 =?utf-8?B?SkxVWWxMRllQRmdUMEhld1JsN1dZMm9PRVEzekhpdUhCd3ZiSTJnenFkMTBC?=
 =?utf-8?B?bFFBUG5UTkxlbUd0OVBqZ1JoOENuZktES01EZERDZHN6bDR6NVdmK0tRVVkr?=
 =?utf-8?B?em1PMHhrTFNYY2crRkhOV0pnNGE4dGpZYVk2NlJ1V21oSUgwVmR6SGtDdndI?=
 =?utf-8?B?VTBsT3VPc1p5YjV2NTVEOGgwanJETXpPVi9wSUdycGF3bnhBZkdaVk0zRWNZ?=
 =?utf-8?B?YXIvaWZjSmdhVlV0dGIwMldCcUw0UlhrWjVaMjZzUXk5amczY3Boajk3R216?=
 =?utf-8?B?VWlQYXpyelpJL24ycjhjS1BZUTJhOGpqYmlzQ25aVXRWQVp3d0IrZWpTVXk4?=
 =?utf-8?B?WVFwdGp5VE16Sjh1YnZKQ3RqTnVpM29BS2RRL3dsVFh1dDU2TVlWVU9Sa0E5?=
 =?utf-8?B?MXhZcmU2S3V1RWdJRlhBZmxwVjlmem1mdGtlTldhMk1VZ2lRVWQ2MVZkQ1F1?=
 =?utf-8?B?ajQ4MTVtN1cvNWJlTHM5ZTJuN1FzZXcreG9zcTErV1RmV2F1dmNSaWdiM1Jw?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef104826-c169-4c77-fc83-08de20be9613
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:06:46.8047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 344YFIAoIlJ5lomUnSkVmWrqK8jmFR0fZNwVNiBlW/ZoVo2rRKWHfeurHgWEBueVLhs2gSQFKeFN5u5BiZ8P6/WpVoT7Mp4CsM89UWDjMDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
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

All of the necessary building blocks are now in place to support SR-IOV
VF migration.
Flip the enable/disable logic to match VF code and disable the feature
only for platforms that don't meet the necessary pre-requisites.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 12 +++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 32 ++++++++++++++++---
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  1 +
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  4 +--
 4 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 6ad948e96fd45..0a0c3145e1274 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -17,6 +17,7 @@
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_gt_sriov_printk.h"
+#include "xe_guc.h"
 #include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
 #include "xe_migrate.h"
@@ -1008,6 +1009,15 @@ static void action_ring_cleanup(void *arg)
 	ptr_ring_cleanup(r, destroy_pf_packet);
 }
 
+static void pf_gt_migration_check_support(struct xe_gt *gt)
+{
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
+		return;
+
+	if (GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(70, 54, 0))
+		xe_sriov_pf_migration_disable(gt_to_xe(gt), "requires GuC version >= 70.54.0");
+}
+
 /**
  * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
  * @gt: the &xe_gt
@@ -1024,6 +1034,8 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_PF(xe));
 
+	pf_gt_migration_check_support(gt);
+
 	if (!pf_migration_supported(gt))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index d6c24bea759af..7dd7625e5aeed 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -46,13 +46,34 @@ bool xe_sriov_pf_migration_supported(struct xe_device *xe)
 {
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
-	return xe->sriov.pf.migration.supported;
+	return !xe->sriov.pf.migration.disabled;
 }
 
-static bool pf_check_migration_support(struct xe_device *xe)
+/**
+ * xe_sriov_pf_migration_disable - Turn off SR-IOV VF migration support on PF.
+ * @xe: the &xe_device instance.
+ * @fmt: format string for the log message, to be combined with following VAs.
+ */
+void xe_sriov_pf_migration_disable(struct xe_device *xe, const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list va_args;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	va_start(va_args, fmt);
+	vaf.fmt = fmt;
+	vaf.va  = &va_args;
+	xe_sriov_notice(xe, "migration disabled: %pV\n", &vaf);
+	va_end(va_args);
+
+	xe->sriov.pf.migration.disabled = true;
+}
+
+static void pf_migration_check_support(struct xe_device *xe)
 {
-	/* XXX: for now this is for feature enabling only */
-	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
+	if (!xe_device_has_memirq(xe))
+		xe_sriov_pf_migration_disable(xe, "requires memory-based IRQ support");
 }
 
 static void pf_migration_cleanup(void *arg)
@@ -77,7 +98,8 @@ int xe_sriov_pf_migration_init(struct xe_device *xe)
 
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
-	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
+	pf_migration_check_support(xe);
+
 	if (!xe_sriov_pf_migration_supported(xe))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
index b806298a0bb62..f8f408df84813 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -14,6 +14,7 @@ struct xe_sriov_packet;
 
 int xe_sriov_pf_migration_init(struct xe_device *xe);
 bool xe_sriov_pf_migration_supported(struct xe_device *xe);
+void xe_sriov_pf_migration_disable(struct xe_device *xe, const char *fmt, ...);
 int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
 					  struct xe_sriov_packet *data);
 struct xe_sriov_packet *
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
index 363d673ee1dd5..7d9a8a278d915 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
@@ -14,8 +14,8 @@
  * struct xe_sriov_pf_migration - Xe device level VF migration data
  */
 struct xe_sriov_pf_migration {
-	/** @supported: indicates whether VF migration feature is supported */
-	bool supported;
+	/** @disabled: indicates whether VF migration feature is disabled */
+	bool disabled;
 };
 
 /**
-- 
2.51.2

