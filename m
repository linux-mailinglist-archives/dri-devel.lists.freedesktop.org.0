Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A494ABF916C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FFF10E65C;
	Tue, 21 Oct 2025 22:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgnInIAq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448B710E65D;
 Tue, 21 Oct 2025 22:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086604; x=1792622604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=I/VX4Iq+1VSWoIzFFP11bU7GByiPpEbZGRl57Lz4fjw=;
 b=UgnInIAqREU3Ij3sNRK+nUu2WuWy75/g2B10ZdHHvfxdjVq1Tle5usSI
 kd0VD/4bt2UBTOS18J8uEgjfqLTECaDm3eK/c8I6PlfoNsNHQojjDSg2T
 q+f8tk/2PKJ3NnLSN8iMyxfahMXGDaBzWZuRIW61YBXi1Cx0Ugj8O4YNq
 usgNgkH7+dSaOygwpqFWQQZBJTvSTzjZktiRdq3l7uYClYFhr1gP8pfOv
 g579mZfXnzjKOIH6N4IHdgvwovupJ0AB8zgNh1YCu8uN0Hxr6gBSVVD2L
 OYub3g8wcpBjgQk1/iD0GGSfzMVbd0kVVHrt0myxY20vFAc/YHEnxPiWZ A==;
X-CSE-ConnectionGUID: 3TdI1BFdSp2ENe6q76Qqdg==
X-CSE-MsgGUID: XKKtcAkXSN+SaJ3eKDcq5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67061035"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67061035"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:43:24 -0700
X-CSE-ConnectionGUID: b5OY9vz7SZuTb6bGd5792g==
X-CSE-MsgGUID: 3ldWmELxTSiNzDaI0bpumA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="188988669"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:43:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:43:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:43:23 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:43:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azX957XMVpk/n5jmWrqW49ZRzIb/fSL7DGLNTD7FPIcb4X0EXkATB/c/9Wt/EygXfTgfrEvkr3WW7ZgmWiQMeuBYeSAv8S61AfL9cxmzmp+Obp01jF/wgICSlJVT/lANoqqL0kDqek8DHd0dQDE/OHrf2bZnbxVu4pBRYG7SAHOgeskQUW7jG6MgQSCeQlTFWv0x4AXTTHgPGn+ApDiAybrnoE4LMXfsHFQf7umIdBIjXMvU+/KG33/WmrW6KDsVVbM/Z649Minbeo3Dt6QHkIgiC8RVTKk43OAciAuSYp1JOja6JvNvYPCkNmvg1vZBDXEQzTTQjKJEHhac6uXXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYQzSDSBTchyJHhhuuvYplRRF+pFvFNO01WLE6sxyRA=;
 b=jFrn2esvnT5Rw/FminCmYnLZ5z1clS9xXu+UYMXeueUDMcqHJP/SfTevxXe6OPGWclv6AnrSdmKprlDI02n2PCxA1YbgEiEak517Q/sdlc2Mf/6CvQTr9Nz6o9olT3lIkVe09xFP5cf3ar7fLkKA5JuuLgXWyPfqXOLdKRTx0RWCZvXqaRtuINBxc1FPxXFKRC3zds2ed60rmDOB0C049/dtrfGd9oeeqDE4f1sosgbk56gBEpcO7IZg3eJfw8u2YjeCyc2prdLb4DIYAy9hWuu/aN+OROIKXYutqWCEinHaL4Dj84fkEKU3DiA+eZMmSOsv7nMcyalEHUrF5xdheg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 22:43:21 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:43:21 +0000
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
Subject: [PATCH v2 15/26] drm/xe/pf: Handle GuC migration data as part of PF
 control
Date: Wed, 22 Oct 2025 00:41:22 +0200
Message-ID: <20251021224133.577765-16-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0397.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: e3a21f87-d9f3-425e-f89d-08de10f33c6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUhhdCtRbCtWMCtiZzM4aFlkVEJDRjRMYmFkc3RZM0FUL1RxSjBxUGo1azZJ?=
 =?utf-8?B?eXRFbi9keHVjWm5lZmpJbXVjd0JwYXE4dUluVVc3djJFYlA3QU5IdEVxOWVV?=
 =?utf-8?B?S1pyUXg0S2dLakVQWVlyV29Fb1FVaGVoVGUzZVNyV3NPTTFCYUNVd2srU3Yr?=
 =?utf-8?B?VkgwVVhTSFJkczlwWm0wOFkzazBxT0ZubWlIb2FqSHlMdXhMVkpqeFdYYWJp?=
 =?utf-8?B?ZmlnR1RyMVpIQlFZWnpaV1c4cDU2OTVLVCtpdjBMSExWNDdBa3RxWVgyd2k3?=
 =?utf-8?B?cVRuNDBBMjFXa2lYOEFCZnhRaTlzcEJoREtWcnZ3NGhrYUlEbm9BanlScnY0?=
 =?utf-8?B?cFJ4eTZNU1FpZFM2NlREeG1MTkIwSnU2ZStNZVlwTlBFbmVxZ3NUTWxyWWhW?=
 =?utf-8?B?L2taZXJPMlJ2NnBuM0xDNks0OWEyRHRQNWFZQ2xBUFlhRGtBZG9GMC91MWpz?=
 =?utf-8?B?U2NNdnRxS1JBek03Q3V3dExGbS84dUZvcWN5WjE3b0xJRWZtanpTUEptWmJp?=
 =?utf-8?B?UWZ6cVZ1QmI0MlJrbnlvS1VnWEVyK3NDMlZ2L0JyQzh1Y1kxNzF0M1ZCQjhK?=
 =?utf-8?B?d2o4NTFCQk51QkFjSDBFeXNYY1F4dVF4bFUxR2doVDdqMEdUeEViKzNzclds?=
 =?utf-8?B?KzcvQ21KM2p3LzViSFRvMnRxa3ZtWlpWa1YvUkZmTFZKeGdzNm5FNXlvbkJv?=
 =?utf-8?B?MVN3OHIzMjNyQmpaZm5GeG5RUkNFUmxrRTV1WEUxSEdPc0lzWjlmT1hKTVg1?=
 =?utf-8?B?aTJlNjY3d2J6UnpoSDlFZ1cxRXdKeVBNRTZxekZxRk50dWxHcXZiUTJZU3dh?=
 =?utf-8?B?UzFEbDQvTmlVcGdvbnlVaEJTUHp5dSt2cnZUS0lmVExBTXNWZlFRbEJDUUow?=
 =?utf-8?B?djVGWTVIdHhHYndnRE1hRmhBRVZkblh2RHZMOC8vb1RtQVJHWW91a0ZrVVo0?=
 =?utf-8?B?cVNwQ0dnZ2F0Mm1DUFJXQlRiSVJidnlNV1JITXh4dEc5eEdkaHYvbWRZZndW?=
 =?utf-8?B?SWtGQmNKNEhFZUowUG1ZSDkyMWIwS210aW9YbjJZZlVQMlVwTnVzeWtXU01F?=
 =?utf-8?B?T1FWZXptekJEVlI4TDh2eU9LZytUUHc1amZPWDNDV3FOa3ZWV21OZDJJckE4?=
 =?utf-8?B?Q2E2YkdiODZWK2JQOVhPK202U1o3ZmEzbVpaUzZ3L2tyZHpob01HL293S0Vh?=
 =?utf-8?B?a2hTYjhLdlN0WU52Tm8xNVBhQS9RUXUzSms1bUlpZnk1WmJiL01pNGg5V0F5?=
 =?utf-8?B?SVlPUXU1UTJ0L2lVaDFJZ3lJUGxuSU9qWDBObU1DNEtKajYvNUEzV3lOaFk0?=
 =?utf-8?B?TUQyVXB6WlBnaTB5Q2cvZU1ha0lVenZ6R1NPOElST3VBT1ZYd0k3V014c1Zj?=
 =?utf-8?B?TjBtVTdXcmdYN3YzcHhFRFU2ZVN3WEdRaWx0TGpGK08rZ0NYc3kwVktYc1Vn?=
 =?utf-8?B?Y1NXQy9sN01oVDF1SEdHY2hTWERndVFHOXVPcUVrbGk1dExaWnE3a3lyRThX?=
 =?utf-8?B?c2JHTGNRNTRDb0JyaDVmMDE1VGp0NWJrY0g3cklRSzFZTDlhWUlRelh0VEZs?=
 =?utf-8?B?OVdhTWlFLzRlK2trWk5LbUJJaWYzMHJTeW9HQWlYSE9UeHo0a1l2V1FMVGly?=
 =?utf-8?B?VEVlZUNLeUdLTzR6dlBJWFBBcVlwbTcwYXFZVjIraVdvZEkzbGNQZEFvVUR4?=
 =?utf-8?B?Z2c2TUdrcXJ4dW5xSS9WRGd6aVJHWDVVNDlpdG9xVnhoTUk4N0JxZDgrWmFU?=
 =?utf-8?B?WWpYVGlPZXFtUmR2TUlVSFl5NHcrdnFzZVBoUlZUbTB2UnlrT2tzdlg3QUdI?=
 =?utf-8?B?bWdidCtsa3lPRWF5UlFIUDhqNzNpRnpFK1pOWk9XenhYK0YwQy9OeG1QNXl0?=
 =?utf-8?B?UnF2QkhmRW0rS09sNzZTME9HRWhtb2Ezbi9wNFV6c2FuUlRzaWg4TUx0aUZR?=
 =?utf-8?B?VjFjNWlod1I0L3FvMk5KS1JWWmNIU0tMM0hkYVlrOFZJWHUzMk9sVFdxalpq?=
 =?utf-8?Q?m11oLuUhIx2XufIBF5CIsKMnVfoVLo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZC96MkdCeCtFTC9id0hmTk94UjJQT0g2SWV0N1J4U1FwMm1TeVljdTIySTZP?=
 =?utf-8?B?eTV6YUFpYmtOa2xiL09IclkzM1luTllMTkZXMHBjektVWTc5Zi9JTFFBc042?=
 =?utf-8?B?Tjh3MStZaW42bkpneSs3RjJ5cHZRclYwQmRJMld3Uk0xNmtQVnh3Qkk4bHhH?=
 =?utf-8?B?blAyS3FtclJqeEVWN29raXMyaENHMlQwRExOUDNUekk1dm94d1ZqSHJUay9n?=
 =?utf-8?B?TEs4RjYrcUlrcmhScHJIYzA1M0E2NzJXbXpqb3hNMDJxL1Q3Q09EWDU5R3ps?=
 =?utf-8?B?TTNHVzJualZtalMyYkVJVlh6cUsyeWRWRmRCb3Vsc21ReUlYQ2o1YnpRVWNB?=
 =?utf-8?B?VmpNd3p1VlVTSmNTUTR1RVFSQlprdXpvQWlnU21LbFpuQnJVSThXL0lDaFl5?=
 =?utf-8?B?YjRicHBLSWhMMkVrTWtYTDQ3akMvcDRJRnR0bk5RYlppbmN5dlA4RVErUksy?=
 =?utf-8?B?ektZdzlwUWwzTjRZQmxkVVhtZm92R3RQcVFYcmg1MFdiQk13QS8rNmIrZjhw?=
 =?utf-8?B?aXZXdVN3T0Eya2JQalR4YTlyb2ZsWURYRUp5WGcxaXVHTXlsQnROQ2FoOXc1?=
 =?utf-8?B?clJEdHhlaWF2eERDZVlRM3ZvVjBYMS9CNUkwaUpDMWpaWEVxQXZ5VmpZSFBq?=
 =?utf-8?B?VjVMRVZiN2p1M3ZrN2duOGtpSHFKeUtwZTJVNytKREd6M0lBLzRKcDNkM1Ro?=
 =?utf-8?B?M0VINXJDNzFFNlRpdXV6Ykt5YTVnbHVrVzlFYU9TMmNCZmdmeTlIMkZJUExP?=
 =?utf-8?B?YXZwQ2ViMnRPRkJEdWZya1RRdzRQWGN4M2MxZTlhcnRBbjVQRlRuMTNRTmhQ?=
 =?utf-8?B?cnB6SzhweFBxS2R1eUtjZkhlclVHcDViTEFORDlxeUprQlJ6OFBXQmVUdEZr?=
 =?utf-8?B?aFhOMDEwbG1HdklvVFplaXBESEI3VUxIQXRpZWthY01ZWlhTbkZmM2ZSb3ph?=
 =?utf-8?B?RlJlNUE5RlZWdk1hQVBoMVFSbGc2M0xEMGZTVmFNK1VLcUcxZlQxY0gvRmts?=
 =?utf-8?B?V3NtZ3BBU3dQTzhZbEFzOStxbzRGOE9vYkN2NndxL2ljcWRFU3B4N25zOXFo?=
 =?utf-8?B?YldRWS9EZG81cVEvTEM4S1VQWXoydGwwZWlHOGsxZkllc0lGVElrNWJVQkor?=
 =?utf-8?B?MU81TExOVEY3YlB3Mlp0OXlFSVEwaTFPSjZZWXhMUXhGbWZVd2tlZ2xuOHpV?=
 =?utf-8?B?WjAzcm55SXVPdVc0dmpPNGVOWEZxL1VkM01jNys0RjBENm9GWXpvcEc3ZlNB?=
 =?utf-8?B?eDhLMVVjZEdJL0pDRXZQY1RJQnE5ZWo3Y1pXNnZmQkp2M3NweWpKMnhjZ0ht?=
 =?utf-8?B?WDZqZngwdHdPdE45NGpVQW1tU1hUYk5JZW02UHIxZ2JsaWNKUmsxTXpiYjVW?=
 =?utf-8?B?NGE4MmJ0RmtNT1RQSW9NbFlUaUFsNlZLN1lkVmppbDVhVUwzVThWVDNBVXpt?=
 =?utf-8?B?blR6TXJTSFNXZWs2NDNiRHNra3BjKysxYTE2cHVZbjZnZzhzdzNqSEtZVEtt?=
 =?utf-8?B?alZYN3NCTVpxMzV5OHUvWXR4S05UaWlCcDg0K2NDZTJCeVRPOEx4bWNoV2do?=
 =?utf-8?B?WUxOSEw3ZVdqRTIxUzB1aVhEemNweVEzVHVzdXZqSjJQbllzWlZmQWRGZzNO?=
 =?utf-8?B?Y2VFVDNneFA1WWU3LzYxbzBJS3BOVEVkbUF0UWdOeEp3VXh5L29ESTFJNERl?=
 =?utf-8?B?K25QeGJDM0ZyT2VhR3FxakZJc3FmcWdrWHMxWm41OC9vd2dpZlVjRHlNaW5F?=
 =?utf-8?B?cEtQWU15TTQyajd5R2NNK1NOWk5ONmpQMm5NVzByZDJXVEM4UFNYT0NqM2RK?=
 =?utf-8?B?MGpRVmMyczU0TVpQVi9qYXlEMDJOazkvcE04a1BjUHlDcWgxdTUreDA5d0VP?=
 =?utf-8?B?RzJrWjNNK1V1Vk5OcHN3em94NHpqYkJxSVJodkZ5RjhLQnlYa3pXaEVCbnpU?=
 =?utf-8?B?UkZ0MWkwekxWN3pZVi9NLzdLaUd2QjlXVitLMGN4VmVFc3p4aWhNeFBLQ1F2?=
 =?utf-8?B?ODVTTThTL2xTNXJYV3p0NnlsV3VsWDNMWWhTcDJ6N0ZQS1BaYVNnT0FPSnNv?=
 =?utf-8?B?SGFYNFFDdjlQZ1h6LytURGxkQ25wOWRBWGNFZ01lVGw1T3crUWlCZDN6ckFB?=
 =?utf-8?B?VW1UNXFKWS9wSlJtbzZWSFdLZ2ZISG5NUjdJUkp4ZzFHbjRJaVhHaHRrRCsz?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a21f87-d9f3-425e-f89d-08de10f33c6a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:43:21.1612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p4uFu88YlD9a0KaZEPBJCnxOfX7bcYJ6FZa0Hecf6eIHiEeWHNiWOTrwux0C9DZ9k40SyK8bHgjs0WsocWLu20q3s8Dib+o8l7earO2OC74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
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

Connect the helpers to allow save and restore of GuC migration data in
stop_copy / resume device state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 26 +++++++++++++++++--
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  2 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  9 ++++++-
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index c159f35adcbe7..18f6e3028d4f0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -188,6 +188,7 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(SAVE_WIP);
 	CASE2STR(SAVE_PROCESS_DATA);
 	CASE2STR(SAVE_WAIT_DATA);
+	CASE2STR(SAVE_DATA_GUC);
 	CASE2STR(SAVE_DATA_DONE);
 	CASE2STR(SAVE_FAILED);
 	CASE2STR(SAVED);
@@ -343,6 +344,7 @@ static void pf_exit_vf_mismatch(struct xe_gt *gt, unsigned int vfid)
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_FAILED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_FAILED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_FAILED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
@@ -824,6 +826,7 @@ static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
 	}
 }
@@ -848,6 +851,16 @@ static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
 
 static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
 {
+	int ret;
+
+	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC)) {
+		xe_gt_assert(gt, xe_gt_sriov_pf_migration_guc_size(gt, vfid) > 0);
+
+		ret = xe_gt_sriov_pf_migration_guc_save(gt, vfid);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -881,6 +894,7 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
 		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
+		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
 		pf_enter_vf_wip(gt, vfid);
 		pf_queue_vf(gt, vfid);
 		return true;
@@ -1046,14 +1060,22 @@ static int
 pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_sriov_migration_data *data = xe_gt_sriov_pf_migration_restore_consume(gt, vfid);
+	int ret = 0;
 
 	xe_gt_assert(gt, data);
 
-	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
+	switch (data->type) {
+	case XE_SRIOV_MIGRATION_DATA_TYPE_GUC:
+		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
+		break;
+	default:
+		xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
+		break;
+	}
 
 	xe_sriov_migration_data_free(data);
 
-	return 0;
+	return ret;
 }
 
 static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index 35ceb2ff62110..8b951ee8a24fe 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -33,6 +33,7 @@
  * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
  * @XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA: indicates that VF migration data is being produced.
  * @XE_GT_SRIOV_STATE_SAVE_WAIT_DATA: indicates that PF awaits for space in migration data ring.
+ * @XE_GT_SRIOV_STATE_SAVE_DATA_GUC: indicates PF needs to save VF GuC migration data.
  * @XE_GT_SRIOV_STATE_SAVE_DATA_DONE: indicates that all migration data was produced by Xe.
  * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
  * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
@@ -76,6 +77,7 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_SAVE_WIP,
 	XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA,
 	XE_GT_SRIOV_STATE_SAVE_WAIT_DATA,
+	XE_GT_SRIOV_STATE_SAVE_DATA_GUC,
 	XE_GT_SRIOV_STATE_SAVE_DATA_DONE,
 	XE_GT_SRIOV_STATE_SAVE_FAILED,
 	XE_GT_SRIOV_STATE_SAVED,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 127162e8c66e8..594178fbe36d0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -279,10 +279,17 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 {
 	ssize_t total = 0;
+	ssize_t size;
 
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 
-	/* Nothing to query yet - will be updated once per-GT migration data types are added */
+	size = xe_gt_sriov_pf_migration_guc_size(gt, vfid);
+	if (size < 0)
+		return size;
+	else if (size > 0)
+		size += sizeof(struct xe_sriov_pf_migration_hdr);
+	total += size;
+
 	return total;
 }
 
-- 
2.50.1

