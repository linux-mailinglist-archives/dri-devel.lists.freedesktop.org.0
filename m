Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E9BBF9190
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8ABB10E66B;
	Tue, 21 Oct 2025 22:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gcyOBAI0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575A710E65F;
 Tue, 21 Oct 2025 22:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086669; x=1792622669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7ziXZ5jQipiMs75AbmhEV//3Po2ExXx7nYQzcSvFEmQ=;
 b=gcyOBAI08akpWy9sLHEA2kM8Vktp6FHusKRK4tna8P9s8gJUaPpVJhy3
 sqACxhB0vxs0LZaLpXlJPWq9j51jaC1Bf9LlCC7g8tbPTvRuXXwuo4/V4
 CeKbsfk/5aVGTbrxXKfkZoF30pd04KKvUZKV/1U9IvQ5Jk8sCcRF/qNvP
 k6E3Vb6UEvnNb+46KUshzFLLf9oRBsS6i5hX2w4Po0Hdb2W/o4Bodge64
 1blaMxj4saftfRea3cLDgE800MKt5tyBsmBwDDu70+EWPMsHmi15fl0xg
 Fqq4MZPpT+QvQmRCa/nhL+IRIxhPbHdN+sTSUUtWh0SHLJ1aKC/Xnj3aZ w==;
X-CSE-ConnectionGUID: hZPFXJT3QDizsU1TAoRNyw==
X-CSE-MsgGUID: JhORhaHGQ+ueuNluB1fV8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62926759"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="62926759"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:44:28 -0700
X-CSE-ConnectionGUID: 7z2zTJrCQyK+4VvZiJD59A==
X-CSE-MsgGUID: rWD2Sx9YSoCl9G/ZYRWheg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="214345854"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:44:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:44:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:44:24 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:44:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9BZt+FGjp2/Jtd8Y5TLYpMcsiZQQsBu7KJY04W9+kKk0txtaH6W2d/ru3a+3w6DZXTvjxyqp/ijsxvclbxXfyHyd7bpdfUz9cGMTAFLd7CkpPFQC/qcK7PDGTt3lWwzfQQLDTGD1D3tkeCr0KbgEzcOLJPLHRDo9ogwlL9I3a8KIFqiZvh0TDrfSGSj4HDZc7FVHRXL2lcxKW7Bwsl6bJUjo4lOFxtQ9WLeoSq3vusoJpdjXUJzNxiqy6OURaecO7Xw+1zJyE1HT9Zq1V7SHvCK9l8id6cgFoMwnl/Zg2OBDxgRKBDf0hVSnPs1m39F0zaXD9m5q0xXSr1o09wi1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIcjW54xHAdWPHRQsH/IXcmDtPbJKZWbTFeWgAZLd4Q=;
 b=AcWggVFfVeCgT0VBVuh/wqoTGCe+mtqLG5C9ul5yOIfdo5jpCmvui3bvVUq6Z0EBD3onIJ8bfGe0ZA/wFmYSje0GjvaokIQr/4upWMrCwArBknG4hBU8G3/2VeuZ+E9Kp/e61Jv9/o5LA4Z/hcR3QAC0PH+gyUftJn4SF3s8vqUa0tSPUbjY4lfGBdw7QGMXYZVyaGPZW2Z6y5+2rA7jqUSKtqSSTXNmqrE89ZAHGixznSQHOjY5WhHSzuClMwgl/leeIomlH3Jf8e6FdYoNNCMV+Mt3rwi+r1dlSesw5JCGCTkLtg9JbtflVB5tRTKXOzwlHujUKxw4Rj93FF9PDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF28037229.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 22:44:22 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:44:22 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 22/26] drm/xe/pf: Handle VRAM migration data as part of PF
 control
Date: Wed, 22 Oct 2025 00:41:29 +0200
Message-ID: <20251021224133.577765-23-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::22) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF28037229:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ab3818-199c-466c-947c-08de10f360b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmtlcGNxMTB6SDlpaW52Sm8xeFFVRnJJMlVnS2h5aHN3RXJRdHlkNWNoMktN?=
 =?utf-8?B?YzVlMm53U1gzeTlsSlZ5YXMwS25LUXNNUTduZmwwblI5Z2FURU9iWDcweElh?=
 =?utf-8?B?MUc1VWxKLytyVWJSMUYrVkkzQVBHekFhQVpycCtWRTZuMEo0Y1o5NTU2YWx6?=
 =?utf-8?B?N2xVdXlXSld2ZDRseWo3dFdWc3cxaURpemN1RHNDWmpQWnpGUWdVMHQrTU1L?=
 =?utf-8?B?ZGdJcXdaa09vV0IrUTNhbGEvemx6bUFBdVpVZ1V3TGV3ai94Z3Blcnl6RGEr?=
 =?utf-8?B?bU5VbTRJOFhPd2VpSkVvcURPcyt0Rno4STQyZlMyUHVPS3I1SkFmc1hxNk9s?=
 =?utf-8?B?TFdBbVMrR2lXYXZhTVVIcVJuNjBobWlmbXJqTEorM0hXUERTVjdGYXdDWmVN?=
 =?utf-8?B?M0JObVdpTVNlS0F3WklDdkxYWUMzeDBENXNkQk5HeElreU5Zc3QwVFBRcEFw?=
 =?utf-8?B?YUZveXlaTHpwOG9vVTlmdTFXMFdLUXpVWUs1aWRCdnhPK1ZUR0duamxKUXUy?=
 =?utf-8?B?WUxJaWVLYjFUZjdPcFZUS0dveEVPdzdHeVVtVjRGQW8wK3A5OEhlNGNiby9a?=
 =?utf-8?B?TjY5YkROR2pZVmg4OUh6djU0QkNUa2FETkJ1SmJ3ZGFFQ2dlVFdOYWpzOTd0?=
 =?utf-8?B?ckdhSXhVeVBuWEtEa3ZuT21icENUTmw3TlcxYjhzMHRHbzBJMDZJUVJ1Sk5h?=
 =?utf-8?B?VE9vbFVUVXcrSTVkcGtYUmtwUC9ObUNZSXVleW5HSTFXNFBhbDlvWmhCYytx?=
 =?utf-8?B?OVVFRzF3SHdnSWRhd2xNdkllcU5ncExCRTRQcy9WUU5CaHRVaXBYZERnOVRS?=
 =?utf-8?B?U1RiQnRWcC8wWFdDMzg3YWd3WVNXQTJReHpNSDlYcEQ1ZFk1ZXJWUHRsY2Ra?=
 =?utf-8?B?NitISDlsSEF6dUlwVGZDNCtEOWd6bWZ5VEZmd0dVdDRNR1pWcDlUZ3RtY1g1?=
 =?utf-8?B?dWlkMUQrZ1JUU2NsU0J2UmNZMW1JOVloWGF6eG13azk4d1E2cXpWOEZQb3Zp?=
 =?utf-8?B?bnVFUTJRUlVvUFZCTlNYK0RBTHRraStnQ3V1YW9ZVXRvVHdUVlI2blQ3Qnc0?=
 =?utf-8?B?amN4QTM5TlpzVVpQSlpQdDhDaU9Sck1rUDBxSEUyYmhjS2dvdlpwZ3FuZCt5?=
 =?utf-8?B?b096OVdodkZSK00yTVpzTUVDMEMrWWJLRzlHN2tHeHBZQVExZmVJZk40V2JO?=
 =?utf-8?B?RWJYRERMRzBHTHFPQmo2OG5JbE42SGI1VHNNYVZoZm1vUmtVVUcvc0c0OXpx?=
 =?utf-8?B?dlZxTlcrcG5wRnB6NE45QUdYcmhNZHN2bG1UZFVFWk1VUzNvOTNTclJlWWJV?=
 =?utf-8?B?eVZndUo2aHRRbll3bDJENTFqNDM2OXJjZ0llaDlXY0tNaE05RS9KNFdRRkNS?=
 =?utf-8?B?Zms5QWQ0ZkxNVWFlbEk3ZGxkZlBFVVZqSnRMZ3F0cEE0d1ZvdXphM0NEQm5z?=
 =?utf-8?B?Nys4VlA5aXE3dXBWZi85cytpVGVnVHhhMCtydjY3eDJML2h5eUMxYkw3SUdU?=
 =?utf-8?B?K3JOelNCUXNDQmJVZ3dPaDhRem9RRVMraEZrK2xPTDJEd1VKZW12V0NYWWlr?=
 =?utf-8?B?TGFjRW1PNXpzUU1BYU85Z1dNTkcvaFpTNnFnTGxXMkI4MkkxTDNMV001cWVC?=
 =?utf-8?B?dnNseVp4azY3VW02aHE2ajBweWpMNUY4YjRvN0xzVVBSdTZDN0xhbEVwU1VE?=
 =?utf-8?B?ZEQ0N1Q0WXVFVCtQRVhGakdQb0wzVERCWUdKb2VOSTFTRzRHdjJ5MWhROUU5?=
 =?utf-8?B?VUV0WmRsMlJ0MFByQk4reVVnWmFZRnJ1L2dOclhvUjcyTk1ESGJOYVJXTEhy?=
 =?utf-8?B?S2tPcDIvOVhBVXJYZEk5RmN4Wm8xcEJLQUR0R0JJMFJGdWFRalpFTFE5L0F1?=
 =?utf-8?B?RXU1NW9ic09JdjBKcXZMS2k5dndQdXdhTFZPc25hUnZtTUhXZDRMaDNrT0Jp?=
 =?utf-8?B?NWR6eW03OUZocnpISzNNU3JQSkJqNnlVNGpJcFJVcFlPd2xFNXNIZHRsenFS?=
 =?utf-8?Q?ZmE+mFe0w4LLgxa6cRbGu80vdma5iY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlFjVXM5YUlZQW9VR2E3dFRYYzg5MVE1ZGNxOXpSV3VPWVh1QXYxZVc4SWdl?=
 =?utf-8?B?VGtLakJGVjNWdkF1SEN1VFBuNVJkb0ZnejZoODZBV2V3dnFYUllKYWNBdlRz?=
 =?utf-8?B?R2tiZDVqaHdWbTUyTmtrdUNjcjgwMU9NNnE4YmFBeTlUSmxubkFuRFNjMitw?=
 =?utf-8?B?ZE10aTNLcGY1Rnd0QWpycUxISW9MNHZzZ0s0dUFhTjJQcGlCeEh5cnRPYW9G?=
 =?utf-8?B?YXJ5dDV4RDFNYjl6T0ZObThEMVRzS1BoOGJUdnNUVnJOVE1hMTIzMjVweXJS?=
 =?utf-8?B?R3ZEaEpoYmRDUExzNTlMNFdqdEhyUzQ1VGFpaUMwS2ZYcVBvWU1yL1didkxP?=
 =?utf-8?B?d3N2RTFwWGJnSmJXTnBoaXlGa0RrZ25FNlcyNU45ZzFzR2xZaFM4ZXBDYzN0?=
 =?utf-8?B?UGVxcncrV3NPelcvQUovZUVyQWpQTVBEU05FUjNzc2RDOWZhMnlnMmlsVGx0?=
 =?utf-8?B?eEJobEJBUTdEVXJvRjFrUUsrL2o0ODBnNlkyS2U5TnNpSWpveUg1NFY1WHBw?=
 =?utf-8?B?VHdGV2ZEZW1RNlArZ3gwOU5wM2RWeXEwL00xd010OXJCRWpsUVp3S2tQcjR1?=
 =?utf-8?B?N0kxL2ZneWZvbnlzZ2MwQzVYaFZMZWkrZnZnZmRsam5CUURaWGNDVEFta2RO?=
 =?utf-8?B?TDJ0SnNiZFZMakhPdzVsMjkwLzg4djAvL0NOTVlldk9JV0wxWTdWa2hBN0s0?=
 =?utf-8?B?VS83S3I1OUZPdkVBYUMwUnF4R256TTdKN1N6S2ZnL21oRzNIY0MwVTdKUDJO?=
 =?utf-8?B?clFROVR1a3RIM3h6V05ldXU5V2Q3cTRnWDRjaVBramkyMmxCUGFIREpEU2pa?=
 =?utf-8?B?RlBXengxYTZudmU5UFZaUzl6VXZDVGsvek9IRnc3QWVCZ1VYS3JiSEFteWFL?=
 =?utf-8?B?OHBBT3lGaWt0YzRLVmwwUG9DNmJoU0ZLa29Qd2puL1NjZE9vUjRSeXZhQWJW?=
 =?utf-8?B?WTFtTzM5R2c0cEtHRUx3alRCeFdEUTZmcmpmQ2w2ZUZWdm5VSURrSnNOQ3pu?=
 =?utf-8?B?b3dKd0FkZG5QeEN4TTk4KzRGRlJ6WG1JYUxUSUtoaVY0VUlEMDZJRkFKZVNj?=
 =?utf-8?B?Ym5JTmYzT3VDVi83bjd2UWhPemN4K3ZFQWIvM1poVm9oeWpvTFp0YnhuK1VB?=
 =?utf-8?B?L1J6bGt3OHA3RG01ejlRY0V0U2NQMFVtT0lQTGhpUnE1WW45M3FCMTJqNTRZ?=
 =?utf-8?B?THdxSENjbDRndXNzNjJoYmJZeGN6cVlSNDAwbjdBSW1SQzJSb2Z4UTVKWlV4?=
 =?utf-8?B?dTFyOVhjeUlVY3prTGlDcnVkQktmbGprODNNNzhhRlliVDdtL01xMkZDREI4?=
 =?utf-8?B?QTRxL2kvdmZjOGJ4elFUemowbVlVNmZpWVdrQ0lKUFAwQWcxSFdrZVlHN1pV?=
 =?utf-8?B?UWZPK3NoanlRWWhoZUdYY1lHdGwxWGZGYjgxMWVETnV5UVZSbXF6WXo1VmY4?=
 =?utf-8?B?OThIUTFZVDRmeWxFTTV4bm1GL1NReHRFU2dyclNmdDF0SDQ5ejRkM1JtbTdC?=
 =?utf-8?B?K3JrczRpdUY3bXpZQmRoU3piV2JhQ0QrMlg2Mmc0MVh3dW5xcFB6SU1yaFNo?=
 =?utf-8?B?RzhSWG8vZXRqK0toNlBTeXdUTW1pbWswa3JmcC91SXFic3BGdlNuQUY5UU1W?=
 =?utf-8?B?SnA4NjBuQWlPSHdpeUhzWXlsYk9saHhvWC9hNzJvL1dkZ2JtNG5kelJYTExF?=
 =?utf-8?B?ZFZtQlBXMXlHaWt5WkhuSEtWcHRiNWhpMW5raG82YUdPcDFMTUN5RFFqclla?=
 =?utf-8?B?K0Fwc3FLNnUrRkFwWFpIekJSU29rbnV4VTVveFh0RkdWWk1SNlRDVVNORU5N?=
 =?utf-8?B?YnI5cE5YMHBUUVhtank3RVRQNlFRUzdQMnBoWWFhRnhKSWMvTXZiVitiWnZv?=
 =?utf-8?B?U1Jodk1PbFdoWlVKdWJoWXlEL2JPbjliMGxyNnQrcDZweVlXWXhWbE92bjNr?=
 =?utf-8?B?b2JCWG9oOGR2KzRYTE8vU0lkVTg1Zjd5eTdVZVVFQ3hJK2dyQW9zY3BoaEsy?=
 =?utf-8?B?NkFuRjI4aFkrenUzRmd6dW4ra0RIM3JTaFMvMWhHRVdmckNwSkgveDF2Wnlh?=
 =?utf-8?B?dXFQMG52UndpUmlaN09EZTVtRXhmeWNNQzZOTlFaOGw3RmlYRU0yUzlZbTg1?=
 =?utf-8?B?MlBBcGd3Wlh0RTdveTlWMUt1QWZpVG1oa2s3aUxHekVzQU03QUQ0V2ZDZmsw?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ab3818-199c-466c-947c-08de10f360b3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:44:21.9950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXRlsAicdTHVqjHRuU39HVT63WRFqOCiyXhXWv/p7TdBoWdQK7BkCPWjTu9B96Lz+Gt2hSyIbimRdoqkXTvTBWGE9EABn2cOVdG0NCS1SM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF28037229
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

Connect the helpers to allow save and restore of VRAM migration data in
stop_copy / resume device state.

Co-developed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  18 ++
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 222 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   6 +
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |   3 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   3 +
 6 files changed, 254 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index e7156ad3d1839..680f2de44144b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -191,6 +191,7 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(SAVE_DATA_GUC);
 	CASE2STR(SAVE_DATA_GGTT);
 	CASE2STR(SAVE_DATA_MMIO);
+	CASE2STR(SAVE_DATA_VRAM);
 	CASE2STR(SAVE_DATA_DONE);
 	CASE2STR(SAVE_FAILED);
 	CASE2STR(SAVED);
@@ -832,6 +833,7 @@ static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GGTT);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_MMIO);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_VRAM);
 	}
 }
 
@@ -885,6 +887,19 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
 		ret = xe_gt_sriov_pf_migration_mmio_save(gt, vfid);
 		if (ret)
 			return ret;
+
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_VRAM);
+		return -EAGAIN;
+	}
+
+	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_VRAM)) {
+		if (xe_gt_sriov_pf_migration_vram_size(gt, vfid) > 0) {
+			ret = xe_gt_sriov_pf_migration_vram_save(gt, vfid);
+			if (ret == -EAGAIN)
+				pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_VRAM);
+			if (ret)
+				return ret;
+		}
 	}
 
 	return 0;
@@ -1100,6 +1115,9 @@ pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 	case XE_SRIOV_MIGRATION_DATA_TYPE_GUC:
 		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
 		break;
+	case XE_SRIOV_MIGRATION_DATA_TYPE_VRAM:
+		ret = xe_gt_sriov_pf_migration_vram_restore(gt, vfid, data);
+		break;
 	default:
 		xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index 9dfcebd5078ac..fba10136f7cc7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -36,6 +36,7 @@
  * @XE_GT_SRIOV_STATE_SAVE_DATA_GUC: indicates PF needs to save VF GuC migration data.
  * @XE_GT_SRIOV_STATE_SAVE_DATA_GGTT: indicates PF needs to save VF GGTT migration data.
  * @XE_GT_SRIOV_STATE_SAVE_DATA_MMIO: indicates PF needs to save VF MMIO migration data.
+ * @XE_GT_SRIOV_STATE_SAVE_DATA_VRAM: indicates PF needs to save VF VRAM migration data.
  * @XE_GT_SRIOV_STATE_SAVE_DATA_DONE: indicates that all migration data was produced by Xe.
  * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
  * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
@@ -82,6 +83,7 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_SAVE_DATA_GUC,
 	XE_GT_SRIOV_STATE_SAVE_DATA_GGTT,
 	XE_GT_SRIOV_STATE_SAVE_DATA_MMIO,
+	XE_GT_SRIOV_STATE_SAVE_DATA_VRAM,
 	XE_GT_SRIOV_STATE_SAVE_DATA_DONE,
 	XE_GT_SRIOV_STATE_SAVE_FAILED,
 	XE_GT_SRIOV_STATE_SAVED,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 41335b15ffdbe..2c6a86d98ee31 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -17,6 +17,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
+#include "xe_migrate.h"
 #include "xe_sriov.h"
 #include "xe_sriov_migration_data.h"
 #include "xe_sriov_pf_migration.h"
@@ -485,6 +486,220 @@ int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
 	return pf_restore_vf_mmio_mig_data(gt, vfid, data);
 }
 
+/**
+ * xe_gt_sriov_pf_migration_vram_size() - Get the size of VF VRAM migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: size in bytes or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_migration_vram_size(struct xe_gt *gt, unsigned int vfid)
+{
+	if (gt != xe_root_mmio_gt(gt_to_xe(gt)))
+		return 0;
+
+	return xe_gt_sriov_pf_config_get_lmem(gt, vfid);
+}
+
+static struct dma_fence *__pf_save_restore_vram(struct xe_gt *gt, unsigned int vfid,
+						struct xe_bo *vram, u64 vram_offset,
+						struct xe_bo *sysmem, u64 sysmem_offset,
+						size_t size, bool save)
+{
+	struct dma_fence *ret = NULL;
+	struct drm_exec exec;
+	int err;
+
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
+	drm_exec_until_all_locked(&exec) {
+		err = drm_exec_lock_obj(&exec, &vram->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (err) {
+			ret = ERR_PTR(err);
+			goto err;
+		}
+
+		err = drm_exec_lock_obj(&exec, &sysmem->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (err) {
+			ret = ERR_PTR(err);
+			goto err;
+		}
+	}
+
+	ret = xe_migrate_vram_copy_chunk(vram, vram_offset, sysmem, sysmem_offset, size,
+					 save ? XE_MIGRATE_COPY_TO_SRAM : XE_MIGRATE_COPY_TO_VRAM);
+
+err:
+	drm_exec_fini(&exec);
+
+	return ret;
+}
+
+static int pf_save_vram_chunk(struct xe_gt *gt, unsigned int vfid,
+			      struct xe_bo *src_vram, u64 src_vram_offset,
+			      size_t size)
+{
+	struct xe_sriov_migration_data *data;
+	struct dma_fence *fence;
+	int ret;
+
+	data = xe_sriov_migration_data_alloc(gt_to_xe(gt));
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_migration_data_init(data, gt->tile->id, gt->info.id,
+					   XE_SRIOV_MIGRATION_DATA_TYPE_VRAM,
+					   src_vram_offset, size);
+	if (ret)
+		goto fail;
+
+	fence = __pf_save_restore_vram(gt, vfid,
+				       src_vram, src_vram_offset,
+				       data->bo, 0, size, true);
+
+	ret = dma_fence_wait_timeout(fence, false, 5 * HZ);
+	dma_fence_put(fence);
+	if (!ret) {
+		ret = -ETIME;
+		goto fail;
+	}
+
+	pf_dump_mig_data(gt, vfid, data);
+
+	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	xe_sriov_migration_data_free(data);
+	return ret;
+}
+
+#define VF_VRAM_STATE_CHUNK_MAX_SIZE SZ_512M
+static int pf_save_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
+	loff_t *offset = &migration->vram_save_offset;
+	struct xe_bo *vram;
+	size_t vram_size, chunk_size;
+	int ret;
+
+	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
+	if (!vram)
+		return -ENXIO;
+
+	vram_size = xe_bo_size(vram);
+	chunk_size = min(vram_size - *offset, VF_VRAM_STATE_CHUNK_MAX_SIZE);
+
+	ret = pf_save_vram_chunk(gt, vfid, vram, *offset, chunk_size);
+	if (ret)
+		goto fail;
+
+	*offset += chunk_size;
+
+	xe_bo_put(vram);
+
+	if (*offset < vram_size)
+		return -EAGAIN;
+
+	return 0;
+
+fail:
+	xe_bo_put(vram);
+	xe_gt_sriov_err(gt, "Failed to save VF%u VRAM data (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+static int pf_restore_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid,
+				       struct xe_sriov_migration_data *data)
+{
+	u64 end = data->hdr.offset + data->hdr.size;
+	struct dma_fence *fence;
+	struct xe_bo *vram;
+	size_t size;
+	int ret = 0;
+
+	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
+	if (!vram)
+		return -ENXIO;
+
+	size = xe_bo_size(vram);
+
+	if (end > size || end < data->hdr.size) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	pf_dump_mig_data(gt, vfid, data);
+
+	fence = __pf_save_restore_vram(gt, vfid, vram, data->hdr.offset,
+				       data->bo, 0, data->hdr.size, false);
+	ret = dma_fence_wait_timeout(fence, false, 5 * HZ);
+	dma_fence_put(fence);
+	if (!ret) {
+		ret = -ETIME;
+		goto err;
+	}
+
+	return 0;
+err:
+	xe_bo_put(vram);
+	xe_gt_sriov_err(gt, "Failed to restore VF%u VRAM data (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_vram_save() - Save VF VRAM migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_save_vf_vram_mig_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_vram_restore() - Restore VF VRAM migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_migration_data *data)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_restore_vf_vram_mig_data(gt, vfid, data);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_init() - Initialize per-GT migration related data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ */
+void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_pick_gt_migration(gt, vfid)->vram_save_offset = 0;
+}
+
 /**
  * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
  * @gt: the &xe_gt
@@ -522,6 +737,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 		size += sizeof(struct xe_sriov_pf_migration_hdr);
 	total += size;
 
+	size = xe_gt_sriov_pf_migration_vram_size(gt, vfid);
+	if (size < 0)
+		return size;
+	else if (size > 0)
+		size += sizeof(struct xe_sriov_pf_migration_hdr);
+	total += size;
+
 	return total;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 24a233c4cd0bb..ca518eda5429f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -27,6 +27,12 @@ ssize_t xe_gt_sriov_pf_migration_mmio_size(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_migration_data *data);
+ssize_t xe_gt_sriov_pf_migration_vram_size(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_migration_data *data);
+
+void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 75d8b94cbbefb..39a940c9b0a4b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -16,6 +16,9 @@
 struct xe_gt_sriov_migration_data {
 	/** @ring: queue containing VF save / restore migration data */
 	struct ptr_ring ring;
+
+	/** @vram_save_offset: offset within VRAM, used for chunked VRAM save */
+	loff_t vram_save_offset;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index c2768848daba1..aac8ecb861545 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -5,6 +5,7 @@
 
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_control.h"
+#include "xe_gt_sriov_pf_migration.h"
 #include "xe_sriov_migration_data.h"
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_printk.h"
@@ -171,6 +172,8 @@ int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
 		return ret;
 
 	for_each_gt(gt, xe, id) {
+		xe_gt_sriov_pf_migration_save_init(gt, vfid);
+
 		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
 		if (ret)
 			return ret;
-- 
2.50.1

