Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B737C4A2BF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD2E10E49B;
	Tue, 11 Nov 2025 01:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h71eGIMt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A8410E49F;
 Tue, 11 Nov 2025 01:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823123; x=1794359123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=iLI8JrHHVQ2cYjhscbGAx5Lh+VTaODeQh/bwkTRrP8o=;
 b=h71eGIMtP3zmvapDOjvRVZOOlO/n9rWCyaVGM2t4KlGAArUNXJx12rUt
 O2/9C0zsCQ4tiYmqRhkYK0Xt2JsxtxUdCC3jee8c2dlo1z94ap8ZeXBCo
 Crbb9GyudpYAKEoQ+hN2qM4PETj5dHI/tNv0ty0V8ioYB2qSATF5jW7xn
 lUxSAoUKlRrtbHTHf+gm687ERHmzGCFWG53FA3sFkzz7qN5WaFNTbhk41
 1up9eF4XVXQsC+GScDvbWx8jMftTCGO7cqasPdxM4CkzS8Ry3OkRfpUF/
 yOonF3LU+d+M7aZbp/ZC6cITvcQUvThG4kC28uk3aeXPAS/1MpK/7Gmxm w==;
X-CSE-ConnectionGUID: /L+VTH+CSUK9lhkgt9pqEQ==
X-CSE-MsgGUID: dBcLxpkSTNGslmwrEj5mlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="63883546"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="63883546"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:23 -0800
X-CSE-ConnectionGUID: Ra9qjXKwSoGdgxWnWmnT0A==
X-CSE-MsgGUID: iv/Dmm0pSxeBJK3reAMfQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188081747"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:22 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:21 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:05:21 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8WKtnOBXALEGqmTOVcUBqdgB2NMwPncux7b73Eo0yxiugeI42B4mrEASFulYO6FR2CkK2LisxGVf0ixGBVh02W9Yh86FMwONf9cq8iLC08/N6Xe4FEDb4CmF98PVyOgkNAvzAI1Ew6NUk1lclmlB7VbfunmKZpbqRdKOnFitdET6c6T79ay+CyasOZzlYHs2obaYJ7UmlxurmjhfYjF8zvQEgqETbOD9ELzFIKLoEXrrgdfqScwpUUw7rF5FSMtb8SbZl4+6pkLt85dNcQgbI+Qe0fob+opbpbHtYr6zy22AoQfwOr+f1EKQFE11cq18/34A5pcdrqyv8J941a0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1uqQJQhkv31wXmqP5UoOVV2fWguWHzqPsmRB5Q2ru+w=;
 b=wUYi35aAJjuZ6JweEvnDQ6qyibavpx6FyzWnMRcdRl8C5lTLVCKOpdKAPZezA8YFl4RMrzSTFSzfQnWwSUaHpepC2jrgFfPd9j53U+sjQTysHmD8dIv1LvH3Rb1pEfliXTvBLvT/KWsd4h4rE98vqvefNr79QMvdzlc8KvNnlcckpMZ1K2QT2i8tcvmqP0AG0C5jFVcqjqdc4a9X9DZQubwXED45O2xN+VHSIwn8MaAQn7lYHpYxlsuWFKXLeFZfe0I6IgOCnIxbjx3spQObZBczpQIcrrCLrnKbakgJ3zIO+hY9Sc5uIhWrxJP5Pqe9FNq5NkspL+WpmAXt2VrDOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:05:18 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:05:18 +0000
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
Subject: [PATCH v5 02/28] drm/xe: Move migration support to device-level struct
Date: Tue, 11 Nov 2025 02:04:13 +0100
Message-ID: <20251111010439.347045-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: a6070a6a-4299-49b1-1a1b-08de20be6194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTZxNWwrNzZwN08yZ0cyUVhKU2VGM3dRcm9xck4xMjFJTmY5Nm1LTlFPSHEw?=
 =?utf-8?B?d0d3Q0tncHhrK2NTKzlQeTcxcFhVL1Z3QTFhT0craXR5TXVjQnYxWENRU0s4?=
 =?utf-8?B?VTFOVzRwOThrZ0w1ODBGWGRsa1ZtcXlGOVo0TEh1eWMyZCsvNUpJcmV4Z29U?=
 =?utf-8?B?WjBkbTlZVktPeGpYU095NGNzUE5Kd055Vk5aaXphLzdTbWZQakhFYzdxaVJU?=
 =?utf-8?B?L1RiU2pUeGNFVzA5bXgvalQyemNtYmtEUTAvR2ZEUFBLa2tqMjhEYzFlUTlR?=
 =?utf-8?B?YldWSWovd2o2L2YrQVRPd0JFVEU3ZjNEak9DaUpsUHNoN1oyTDc5TEJlY2Rj?=
 =?utf-8?B?bURBTlNiOUx3Q2hleVdINzFFRGNVT3IzYmFESjI3cU5hbCt4MTBZRm15UHls?=
 =?utf-8?B?OGFYaXhISmcyU0lTWkszVGQ0Z3Vyd29uMmZkdjhmM2kwalQyZ2dlQzJ6MmRo?=
 =?utf-8?B?TTlxWTE1ZWFrbmR3ZlVyeldMYmxjMGNuSGp3WDB4dDNHemZWakkyOFpBcnRD?=
 =?utf-8?B?cGtZN2sxUkxvaDZ1Zlp6Q3V2SnZXK1AzOGJiSjFjS3lNakZBcW92RFYyc3Z1?=
 =?utf-8?B?RElpYWVhTGk3bHFCSzZDczFhL0NCUzQ1cFZxRVRxa0hMRGljV244bm1WeW5y?=
 =?utf-8?B?ZVd6YVBqeUkvRTNUMVlWZE4yOUhKZW5kM0VqeVhVMSs1dXN3a2JuekpFWDY1?=
 =?utf-8?B?UDJrd05kMDdGb05UYjY5YmlMZWtPQXpkMndYdzU1RXdQVFRRYzhlbi85dVJP?=
 =?utf-8?B?d2N6WFpmNzA0amZIVXlGclg1eHZiN040OHRXc1FBRmllQS9lVE1tK1VabmND?=
 =?utf-8?B?bHo5RGg5WW9JNEVZMkVNODFFL0FZM0E4VWxkdnpabG9IUnl5MWg5RE9QWWtB?=
 =?utf-8?B?YUtjV1J1NDBCTEhrREticTk2eXQ4RnFhNWFRMXo4UFFwRHVZS0FycDlSQ1E2?=
 =?utf-8?B?K0FUalRqQWdwazR2ZVdxNmhkWFZzbWl2NUYrMXFsSkxaQXduM1VEZEJtSlhF?=
 =?utf-8?B?dGppYXVqSERBaWw5azcrZlZrNHQxNVpjTmhqb1gzbVNBdldhNTZWN2dpdDJ6?=
 =?utf-8?B?QjRSNm80WFRvbVdiMTBhc0FSNWpXN1pFaEFwdk9CQ3lLaTFrVmtrV3JYdkUr?=
 =?utf-8?B?aVVMZ3pieDM4blZTQ0wrc1B3TWRoN2tsUzk0bEF0UW9DbWJuOGpBeURaYXNr?=
 =?utf-8?B?akExYXRmSmNlejI1RGRuL3REOWJuSi9sallNYTgzdy80NFlKbnA5VHJtZ1lz?=
 =?utf-8?B?QjFla0FsRmRrNStoRGwwdVBwZEVZMTdRYlR2eXlMZDY3VHRteHZhSVdYdUFP?=
 =?utf-8?B?WndvVmpzNStlTDdRMTBZZDRvMFV3LzFKaTJMdm5uWG1zWXp0azdXRDFEWW9r?=
 =?utf-8?B?YUZkZllhTjhUN3ljdVJUVWYzMnhsSzh3NDFtdWNLSHN0QTlQNVpXYlY3K1RH?=
 =?utf-8?B?dUpLM2NoNTJGaEtEQ1BFamdWWWhMa3UxdVNIVWtXWVBuVStudmlZMS9jZXY4?=
 =?utf-8?B?OFRxK3U3ZnlYcGRWZmREUEcwNVVIaHVURWNQUnhtU1VMM05iMWJjZGlabXlo?=
 =?utf-8?B?eWNtcmw4empjemxlL3BrY3NaaUpiVG80M1pDenBiZlhRRjROMWJMQmFVOEVI?=
 =?utf-8?B?OHVDdndESkVLRlpza0pHWXh4RnNWWk82NzR1T1NscEhjTVBuRTJZeENsNUNz?=
 =?utf-8?B?VTlRQjJNUi9NQm1tSE0xOWQwejVEcVRFVEFXYktvRVlmZzQ0b2ozVVpCVVRv?=
 =?utf-8?B?M3NFZmFKZWhEWS9Ba2ttdTdhMmZJcFdGRWdUaGFMSGhiNXRpOFc1SlY4VE1R?=
 =?utf-8?B?L1RraXc3RjAyUnJYaWVkVWtDL1BiZGRRNjhST0VrNy9WbmNjcEl1UWcxbWpD?=
 =?utf-8?B?WjBTMmU2WVJwQnFIMWRtK2J4dU1IM1hPdW1OSzBNWi9lcHh3aVBod25XMFlS?=
 =?utf-8?B?YkhwWUZhckRKT2F1UHRQYTZmKzhsaWVYcEFsU2dOZHNBM0pnZEFDN3NzUm11?=
 =?utf-8?Q?uJqwedXMK91XZOk7Yq2S9MqmEd82f8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk5hdjdrMktXcVRSL2RTY1h5NHZ4OVJnakhRVGlSSER5ZnVQUkdnM0tPbkVQ?=
 =?utf-8?B?WWNuWnRjNWpGVUZyd0xQMzVjVDRJM3FwQzZUOFB3SFZpdnRicXo1R1RCenZs?=
 =?utf-8?B?K2s3NC9wWFpqc0g4eXJNNXhyT1FVRWRaTDFzQ1l1ZFlEclJxMTd1WXVxaW05?=
 =?utf-8?B?d29TV29lNjNzUDkwRDBocm0yQ0dWWW1rWTJFMDBQR3RVeCtVdlhiTkxRbWdS?=
 =?utf-8?B?SHBvL2VyQXd3aFk4eHZlSThTM1RWN3htYU91TktEc2c4TzMwV05XYTVyVWhM?=
 =?utf-8?B?dGdWdEdZTVdzNVNpNFl5U0VHTGZiOXZwYU1ReUJUZU5qUmphRDQyK054ZTNE?=
 =?utf-8?B?M1A1eGVvbHdVUklkd3A4cFBJR2llTW13ZmVpaVN4RUswckFOV1E3aTdDeHRR?=
 =?utf-8?B?dkJQczhwVXpFeTdFOG00TEE4WHpaWDQyYlJsUHhPQkNoeGdvcjdLZ1pjRmc5?=
 =?utf-8?B?NUF3U3dReXhRQ2lUMjdjdE1zU0h2ZjB0MXdhWmNqNnJYVG9Ub2V1U0htQmNX?=
 =?utf-8?B?MVQwSEFWUXFsTVQrZk1VRU1FZkF2SjFtcjNqaFBKcURHR055ekRuR0hqbjNH?=
 =?utf-8?B?dFZ0ZUFaaGJaalFobGY2U2EwUTFTbU8zZVA3MXlVVnB5RkJvZThtWmVsejJw?=
 =?utf-8?B?WmlmaGtJNnljUk5sMzg1OHRmdWN4UytyYVdQcUdPTlFEQ29LdTBTc0VHcUww?=
 =?utf-8?B?UG9wYU1Lc1I2dWNoOTE1YXYvQ2IwSDkrUzIzRy9iN01FTUZ2ekYzZzVRSmtn?=
 =?utf-8?B?VGRWZUJSWFE5bGxlTnVISXlPNXZwSzJkM2p1M2xFL1Jkd3BQSVZCeFFVd085?=
 =?utf-8?B?c3NIMDgyZ1FHbWg0Mm0ya3RtWVVid0VPajFVTDdVNlFDZklKeFN6dExJVmNm?=
 =?utf-8?B?ekpoa21PVEFCNHY2UjJHOU8rRXVIaGZVR1lYZkhVV2poRWJtVGQvaTBHN0Uv?=
 =?utf-8?B?cnZKK3RhbHE2NkNRRFdob1BIdnlTQ0pHTnBTZWJIaDlXYUlwR2dUWE5sdjdB?=
 =?utf-8?B?ZWVkU0FiMldiZy8zRXk1QmxLZW9MUFpueldwemlKMFc5amNmU1BBZysvTmxk?=
 =?utf-8?B?dHNyVDJOaCtTVTJYR0p2bVU2QURydGUvRFFXTkJNakcvVHBQakVMVTRFWGIr?=
 =?utf-8?B?RnozYmJIWndTSDdTTjhzNndwdVg0YnRzUDdWRjZrbE1tUFZ6ZDJNazBrSEVC?=
 =?utf-8?B?Yng3NW1mdGVJdDNRdndUdUtydHpaTnRocTkxOFdaZmFtZ1dkb1dIM0JrYXhk?=
 =?utf-8?B?Y0Ryd0c4Nm94RHFoaDdHTTkyWEdMOEtXaVBmS1ljdGZZRG1zVGdhN3ZiZE9O?=
 =?utf-8?B?QVprRnkxZktudkZzcXBmQzY5UkhyeFlEQ0ZxZ0FHVUoyYWYyQmVCSWVFU0l2?=
 =?utf-8?B?TEN1ZExEZUJXZDRtSDZHTHZ0Y0owbGg0ZXlKOFhibXozRHVSUWVpN3NKdkI1?=
 =?utf-8?B?L2sydXpxOHd0SFhEaE0rcWErbWl0Z00rY0pTemJBNEh3aXcwTXF0bzVmVWQ5?=
 =?utf-8?B?anZDWTlUL3FZeHJ5eDByZ2dCbkc2UlZuNkxkQ0NIWHphdy9kRUh3alZjRHVV?=
 =?utf-8?B?OWorbU1PbmZGM2tsdkl3NktzOXVtM2Zzeks5S2VRMnB5YTBCcDBoejFTNDZS?=
 =?utf-8?B?OFFkVWM2N2N2N1JkVWcyekN2Y0ZOL2JFZzg3U24wckNiRHJlYWkyVFgzcEli?=
 =?utf-8?B?RkdwQm45U3pMOC9KQS9nazBoaGxjWUpSZXRKTDRxNi9IRjlyR2k1VHdDQk1W?=
 =?utf-8?B?TklqTTBsWHJHOStWMS9FeGsrQ3JnQ2FjdVgvRUpOODFjT0c5aHNwQlh2MXRY?=
 =?utf-8?B?SzVIMG9lY1dqMmFnSVlVT0J3NlREYW5HVmNld2ZiSVlpSFp4QUJXdFQrbHc3?=
 =?utf-8?B?NVBJNUxpekwvMEIvT0E3UDlsL1dKZHhVMDh5b1BtU1E3TllhRVNuRkg5bGlY?=
 =?utf-8?B?QWtLelh6VmFVV2JoQnNsZnhYeWZCRVVIMkFkWjFBV2ZpZDZIa2lQMFJRWEFU?=
 =?utf-8?B?bXFBZTIyY21MT2t3VFptcWV5WUptR2V5dkNpZDI3REdmc1p3ZjJzZVBLUWg2?=
 =?utf-8?B?QW4zYUpINzhBZUFiMTRQTGxVTHJIRzMyVVhpYUhXWFUyQ005dWJLc0V0Yysy?=
 =?utf-8?B?czZhbzA5ZWMvcW1TemJzWDdxU3NxeE9lZmZQSW1ob0hQaXR1ZmJJeWdqdnNE?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6070a6a-4299-49b1-1a1b-08de20be6194
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:05:18.7326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZGEzDufts4tppBZlR09nsTbsgEjASxM+Ef5InBXioHKu5wPJw8clOqEPA9PwYQ+9j8mM8N/WoU2OI9H+rMXtPLcU8VcjzlzLLxNvsWevU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
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

Upcoming changes will allow users to control VF state and obtain its
migration data with a device-level granularity (not tile/gt).
Change the data structures to reflect that and move the GT-level
migration init to happen after device-level init.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 12 +-----
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  3 --
 drivers/gpu/drm/xe/xe_sriov_pf.c              |  5 +++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 41 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    | 16 ++++++++
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  | 19 +++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |  4 ++
 8 files changed, 88 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 7b4ca591a4ae3..cb6b30fd8c2d8 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -177,6 +177,7 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_sriov_pf.o \
 	xe_sriov_pf_control.o \
 	xe_sriov_pf_debugfs.o \
+	xe_sriov_pf_migration.o \
 	xe_sriov_pf_provision.o \
 	xe_sriov_pf_service.o \
 	xe_sriov_pf_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index a5bf327ef8889..ca28f45aaf481 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -13,6 +13,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf_migration.h"
 
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
@@ -115,8 +116,7 @@ static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
 
 static bool pf_migration_supported(struct xe_gt *gt)
 {
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	return gt->sriov.pf.migration.supported;
+	return xe_sriov_pf_migration_supported(gt_to_xe(gt));
 }
 
 static struct mutex *pf_migration_mutex(struct xe_gt *gt)
@@ -382,12 +382,6 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 }
 #endif /* CONFIG_DEBUG_FS */
 
-static bool pf_check_migration_support(struct xe_gt *gt)
-{
-	/* XXX: for now this is for feature enabling only */
-	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
-}
-
 /**
  * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
  * @gt: the &xe_gt
@@ -403,8 +397,6 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_PF(xe));
 
-	gt->sriov.pf.migration.supported = pf_check_migration_support(gt);
-
 	if (!pf_migration_supported(gt))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 1f3110b6d44fa..9d672feac5f04 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -30,9 +30,6 @@ struct xe_gt_sriov_state_snapshot {
  * Used by the PF driver to maintain non-VF specific per-GT data.
  */
 struct xe_gt_sriov_pf_migration {
-	/** @supported: indicates whether the feature is supported */
-	bool supported;
-
 	/** @snapshot_lock: protects all VFs snapshots */
 	struct mutex snapshot_lock;
 };
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index b8af93eb5b5f5..a6023c2e4b12d 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -15,6 +15,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
 #include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_sriov_pf_sysfs.h"
 #include "xe_sriov_printk.h"
@@ -102,6 +103,10 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_sriov_pf_migration_init(xe);
+	if (err)
+		return err;
+
 	xe_sriov_pf_service_init(xe);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
new file mode 100644
index 0000000000000..8c523c392f98b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_sriov.h"
+#include "xe_sriov_pf_migration.h"
+
+/**
+ * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
+ * @xe: the &xe_device
+ *
+ * Return: true if migration is supported, false otherwise
+ */
+bool xe_sriov_pf_migration_supported(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	return xe->sriov.pf.migration.supported;
+}
+
+static bool pf_check_migration_support(struct xe_device *xe)
+{
+	/* XXX: for now this is for feature enabling only */
+	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
+}
+
+/**
+ * xe_sriov_pf_migration_init() - Initialize support for SR-IOV VF migration.
+ * @xe: the &xe_device
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_migration_init(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
new file mode 100644
index 0000000000000..d2b4a24165438
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PF_MIGRATION_H_
+#define _XE_SRIOV_PF_MIGRATION_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+
+int xe_sriov_pf_migration_init(struct xe_device *xe);
+bool xe_sriov_pf_migration_supported(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
new file mode 100644
index 0000000000000..43ca60b8982c7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PF_MIGRATION_TYPES_H_
+#define _XE_SRIOV_PF_MIGRATION_TYPES_H_
+
+#include <linux/types.h>
+
+/**
+ * struct xe_sriov_pf_migration - Xe device level VF migration data
+ */
+struct xe_sriov_pf_migration {
+	/** @supported: indicates whether VF migration feature is supported */
+	bool supported;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
index b3cd9797194b0..b15d8ca2894c2 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -9,6 +9,7 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 
+#include "xe_sriov_pf_migration_types.h"
 #include "xe_sriov_pf_provision_types.h"
 #include "xe_sriov_pf_service_types.h"
 
@@ -44,6 +45,9 @@ struct xe_device_pf {
 	/** @provision: device level provisioning data. */
 	struct xe_sriov_pf_provision provision;
 
+	/** @migration: device level migration data. */
+	struct xe_sriov_pf_migration migration;
+
 	/** @service: device level service data. */
 	struct xe_sriov_pf_service service;
 
-- 
2.51.2

