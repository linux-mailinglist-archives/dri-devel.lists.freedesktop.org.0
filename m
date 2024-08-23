Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8999195D376
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 18:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B98610EC75;
	Fri, 23 Aug 2024 16:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZotNIXC7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E1110EC72;
 Fri, 23 Aug 2024 16:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724430693; x=1755966693;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=bE/kFYTWfFPMwK3f9LVPcQZ+tImJmKOD9tHs7SqQ/iY=;
 b=ZotNIXC7w4oQZkyGmMDGdaEosQdAnzKYG2m0JzuVjczRO3APg3NsJ+1T
 yMmMVJ4KxLGjea5dABmVkBnA2nX7hUBV7zfR+nt2ePJ1w8tdLidS/2V6Y
 ofgj7SHxBWWjZxCj1tbXVZxUjEors8ROyh2tRciK5hLmkgsyN32+HTTid
 d0gFTUWd1Zzyefs3Cv+gJPuFV9Yy4vnhAd/AWzTb4HrZMuQzvr3x1RiYU
 /mHGp9Vwdh5CCPgJLvMFdcCvLY63HM874l6ayDpDQKAARUJqxwmhN4vzz
 30BOTcB4LGmd9sw4HGTeylsQEoydf+hNRskhnk+T+JDk1HpY25rjLbJ7Q A==;
X-CSE-ConnectionGUID: XpjiyiJURK6MnaFkj1ENAA==
X-CSE-MsgGUID: F82Fh2uiTQC9sdCgYQhbGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40369168"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="40369168"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 09:31:33 -0700
X-CSE-ConnectionGUID: kN/xGp0WTKKPJjmJJj/sbA==
X-CSE-MsgGUID: X4eNGtfgQb+0xrALyvISNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="66539133"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 09:31:31 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 09:31:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 09:31:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 09:31:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6eCrWZrLdOhioDyaUFouGWJukgYFjaSP7waTtAqMrkDFP8FihJkKC1vnv3XvEyVnJxYjaESJuCixcrCWvPUq0n2jtTt7zBXA1e+hBwWCcG8m20Iqn/ajEVfMS/cOAD+/OtWZNN66Bg2kfZaEOkiOjHMrsF5ttugxlaI80B604U6jLUVA4qmzX77JI1v/3a+I5+37P5w/NPQhSJVb0+EivY33q/vuo1m1S7GuT/VqFY3IW+VK/nGCogPbXtT8Tz+VsD6zcFQtAYms42j89i38R+or7JSyIYMl0xGnML+0Z5p9jBNNxaM+3yXgMLijHPdWHplIllqebn7QOO/yAREog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsu21nW0iUIq97WpCwj+PVZTtvIeamfdG6YzTjC0VR0=;
 b=qhWwUWNMmtJv6gIJHxg/H+aCihE/vmI7JTeQ4pKbUYbdgK9SiWl/CaMkXlUyPN0O0XJSLiZuD0wHqURJlrI6L3x5P5xe2jt3IZkDr8L7Yyr9ydjKjsg0eHK4xrD5fNfTlZ3LfyDYoFTUihqDuteKEZvX7Wv8VrHAczzZPI736PPW5SKnhjWeZMB1znTmIRuXiOutcggpmolqe8W1Y4cVW0f2zXj2rbYBfwXeNxqYTkOMtMdElqrJCf+jy4tXs3HJs3lIhxtdI+wsLIU5nv/HtP+cqgNCEMHhJa7QjA//n4bXkyDPE+HNbs4ggCTd9ajNxYjHG0NQNolzEKoXZNhY2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.19; Fri, 23 Aug 2024 16:31:28 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 16:31:28 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Simon Ser
 <contact@emersion.fr>, Matthew Wilcox <willy@infradead.org>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, James Zhu <James.Zhu@amd.com>, Pekka Paalanen
 <pekka.paalanen@collabora.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 "Alex Deucher" <alexdeucher@gmail.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v7 0/3] drm: Use full allocated minor range for DRM
Date: Fri, 23 Aug 2024 18:30:45 +0200
Message-ID: <20240823163048.2676257-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.46.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0162.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|BL1PR11MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e585e1-5ba6-45d3-15cc-08dcc39109dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHRxTVIzVjNGRkU0dVZWN2o2Sjg2RVRrU0hwNEF6Uy9UZlBaWkVkSHhFY0VF?=
 =?utf-8?B?WXF5UTl6MmRoVmt3YUxDT2x0V1piMTMrdWw2TnAwOXN6ZnpLWlI1TGQxTlUr?=
 =?utf-8?B?S1IzRm9FTjQwa3hjbGdHWmNiMlBKTGd4TGtWM1pkdWVEMzdhS1R6WjVFWnlB?=
 =?utf-8?B?VUJYTndvNlUyZG15MERnd3d5SG95cUdBMmZxYWlYSXdqSXNSN2plYmM2cklT?=
 =?utf-8?B?bWFNOHltamN4N3hSL01jajNkQ1pia2c4S05YRlpKUDVIbmc1dE1kT0hpZUwv?=
 =?utf-8?B?UlBtM09ya3FDaElMSms5akNOTm5DenNpQzI0NThvWFN2bGhjU2Y0ZUlkb2kv?=
 =?utf-8?B?RmpWUDltZmVHMEg3TEF5K1BSZVJZak9wNVhiTFJyeFB2VFowaGl6cFYyQU1M?=
 =?utf-8?B?T1BUN0xlVS9hT1ovY1BWdzJVcjJWVTBEYitjT3RPa2k4L3RYYnQ3cDZpd1Ba?=
 =?utf-8?B?MW41VEtobS9QSHk3NTVQM1Vua0JsakJVRjVWNXRGdjdwZzF2TmJ3QXVVK2Zt?=
 =?utf-8?B?S1lkcGZWTnQ5QWVlMU9aYXJZUUlEcU5wV2RJMlhhUEhheGpKOVVKUHZRSE1j?=
 =?utf-8?B?dUEyUEJ5L3poQnZURzdkTUNqYmt0ZFlvNXpJMCtxOWZrbUpIeGhRU1U1OXZS?=
 =?utf-8?B?N3NwQmZ2bUN1Kyt5S2ZsYVZtcDNNUy8xMmYybU5KbDJyRTRzWGFpT0ZaUkl5?=
 =?utf-8?B?UlYrUVBEamcyd0Z2TmZmMDArWFNUWThILzUyMmxYTE0xdjdzellYeDFQYlAy?=
 =?utf-8?B?TjJIT1dBTjNkRFhUSWFYVWhCMEJrUTJZVy9qbVBLcjk1M0RXbXdPTGlTQkVx?=
 =?utf-8?B?NGRzRnBYSDBHdDNPc1Urai8ydEtkNEdRQkNZS3ZFdnpJSWkwOEhSOFFyMFI5?=
 =?utf-8?B?UUx6bFFMbzdPN1NReXVicHVoWm5QWU5RYmxOREJYU1NOQ3lnb0FNQ1IvN0FZ?=
 =?utf-8?B?MVp3cHg0MHd6SVdmVzNjV0xKSGo1QUZ0ZDZ1SmFmYkRTY0puREJuRWJyQTFq?=
 =?utf-8?B?SWdOM0xyQzBPVHhOM0ZxV0hMakNlUjYrUHhlTTl0dUJSNmZFRFZaOG1GVHdZ?=
 =?utf-8?B?SytsbURFNGRjWFNBM0szZElWcGJQd2kxM3NzSFFLTnJvM1VGd3ZuS3BLYUlj?=
 =?utf-8?B?V3JpUXROd3F4VVRPL3BsZVR3T0Z1S0F1TXBnN3VzWGFRMGYrYVUvSHdqenJT?=
 =?utf-8?B?Qm1XWm9kd0R2THlncWwzWGVhS2x4K2ZRK0ZyVGFQS1JSREhDRWNRMEtaU0pm?=
 =?utf-8?B?UHJQWld2eWdjVEZhQWx6L2Z6ZHVFUmVpSjFlbnFLWWlHVm00dkloQWllOXQ5?=
 =?utf-8?B?WURYS0xzZEtJbSs4a0YvQTc0aEhFT2luQ3U5dVQ1OTBZdUxXRFNndjE3bDZp?=
 =?utf-8?B?SG55OFYyTEtkNS9SVUpLUUMwc3dWeGthKzAwTjFOeUMvd2R2UEo1aXBqSzBZ?=
 =?utf-8?B?NURIL1Bvd05nSXpzSzk2bDZEV216VGlrOUlDYnQ4aEhQbG5EaXlHMFlzZnFY?=
 =?utf-8?B?OFFCSWxrNk54QjFQbVNvdm1jdDcrcjlMbHlhRG9uYTZYa3N2Z3FmWWFSTEYz?=
 =?utf-8?B?UlIxYWJwYko3R1NEd20wNVAxZThyTzlmZ2FSbldKSlpucC9KRWxQNVczc2FP?=
 =?utf-8?B?NWRWM1BuMUE0VG9nd1VpVVBHN3FGZmdGb3g5YWkySkgzSktsNFlCYUY0ZUhS?=
 =?utf-8?B?SnZrU2JmZVM5bjNZSWNqMUczTVQ2M1dzd01tY0pUV04yOHRjN0o5MFpURWFH?=
 =?utf-8?Q?nki6vAJCuR3zBtq+Q8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2xRY3l0YXVpNnQ0bmY5Z1NucEV5QU9PY3NjRnBpZzErSGtwUU44RWwrR2Fv?=
 =?utf-8?B?aGZzeEJWenUwNERYdmhYK3QvaUUyL1hFajZMOVc5blNScFNBR1NES3pCeWhM?=
 =?utf-8?B?V3pZRFRhMi8zT1ZTRTNKL004cXFTdEEzbzRpWTNqZ2g0VlR2dTVCQ0p6Nllx?=
 =?utf-8?B?VXRDcHhjT2ZRRGxCYmg5OXR1dzBmSVVHZ3FaZjBGSWkwNWVJYkFvdjEvR1ds?=
 =?utf-8?B?a1RCemROOUwzTTJCdXE1NlQ1TjhZZE5pNGJVWmhxMGpCdkRIK0ZNZlpySks5?=
 =?utf-8?B?bWxTUU9DVlZEb2t2bjA4NVZUSTVUL0hmcElHOGZHMEZYOWlUaXF4QVF0bEgy?=
 =?utf-8?B?WHN6azQxU1puNm5iODV5Q05WVGJZOXQ1TUpDUzExUnlJWkJRTTIzdGtoWEsy?=
 =?utf-8?B?d2lodWhKMVhnVEpvTGc2MURWdWZINlVXZzFlejV6eU5maXpnS245RnVXT0s2?=
 =?utf-8?B?NHFLVkNlbEJJMFprOENLbzFYRkZqb2tHcEtCOWJLa3hpOFB6NHBIa1NaSTRv?=
 =?utf-8?B?UTlWcVhXVWhXUDR3bm9mdzNMZ1lMZ0VmUHdCZXdNZi85NndwSVVJRDFDNWdn?=
 =?utf-8?B?czV1T2hIN2tMM2xGRnVSWldCUkd5MlV1Z2NyMnJNWW10b0dSNkp0MDdoVE8y?=
 =?utf-8?B?L3FDa3UzQ3Z6YXAva29HVjRKT0RzdzMzVEhEbHk4Y280VWt6OHVsNStMOXVV?=
 =?utf-8?B?TSsrOGtpN0kwTERTT0xvOHhPWDVYdXNGWGd4RUNPRG8xTDBESWUyckJYMmU3?=
 =?utf-8?B?WXFkZGNPOWFPOVFLcTQ4T0dNSkF0MEg1SThuM1gzWTVoc3JzeThWZG1rRGRo?=
 =?utf-8?B?bktlWXJ5Kyt5RjBkVWJBaW9LdnAxWTlqME1YZXgrMkltWk9QUmJ5K3VaZnJZ?=
 =?utf-8?B?UFozUUZUby94NmdQRGc3MEZJU0tFQlh2WWFyVVlKQWhubThzK1VGUWdnZzhr?=
 =?utf-8?B?S1FpMk4yTEgva0R3OVFyNlFlSzdUMnBlMVJxMjMzN2RnTlB2OWoxcjh0djBk?=
 =?utf-8?B?NW9mOWlLS2xLNzloRWswKyswVEcxZjBGMktUWWFaelhkSWJXbTVVK1JCM0E5?=
 =?utf-8?B?NThtNWczTjQ5UFRKYXlwMkZaZTRUMloxVTlXR3gyVnhKYTd3N2dNQnpjeita?=
 =?utf-8?B?RE4veHh5SXRjWFArM2RCY1ZyemxMTThadnZkWHVLUm5jNGtBaDlGb2F2UHdI?=
 =?utf-8?B?SEEvQURvMm1sdVg2bUJieE1YOTNxN3M4amVQWk1zTE9vZ0NDOVNVRmFVL3RV?=
 =?utf-8?B?d0J3U1hJcjN5VHJ2OXlYMzllUTJ6c3NDWFZKdCs1MXlKcXJtVWhUS2x3Uy9V?=
 =?utf-8?B?VHpSSloxM2dlbHI4U1hvUVBnUWZUZS82M1VSckhyRHFDUmI4ZUp4OHFxdVA3?=
 =?utf-8?B?UXZrV211MDFjYU5zd2NBOEYwVzh4VFNXOEpBcnFROXU0U2U2emUwMEhiNkxY?=
 =?utf-8?B?TUVZV0JUeWJnMDRDZHdIVERIWVQ3bkJQaVdlaXdZSzZoNFhaWXF0T21oSXBn?=
 =?utf-8?B?clltOVMyWG9SZUxtaFc4MnJJam00R213MlEzQmgwSkxVTDIrMG9Xc0I0REFQ?=
 =?utf-8?B?YmdnZVd3eVZhc2dYclBOKzFmcStqTm9nMU9sZE10MlNYWWRHQkRLWURabjZh?=
 =?utf-8?B?M2RCT2xBZUNiSGJPM3I4Mm1FV2JCUTJueGd5dUhpZHd2cGtLR0NPYXJOeVZW?=
 =?utf-8?B?eldxUmx6MnpuZlRiWlQ1ZTA2MDh2NXpaTUJSZzIrSWRlS0pHczNicUhIdk5N?=
 =?utf-8?B?Wm1seGNxSnNsR3ltZzJpd29NWnVUT2VtbjdJZkVTNytobnpZN0o5WUVHMFdq?=
 =?utf-8?B?dG84am5XM0pkempkT2x0QW5VUnRnYXNrbGVZbGZoaXdvVTFHNWtWRlljQjZ3?=
 =?utf-8?B?RFNjWEtaVGlxbEw1UlhHeU9lMWx3U0FPQUZ3enBucDdxdlNtT0p3QjRIWElL?=
 =?utf-8?B?QXZEUFdpa01HSWJBNmRWeXJSMGNFaEJwWkYvL0lIUStTaHY1Z3Z1VEg0dktK?=
 =?utf-8?B?eWlBR1RGZnRXOTd4Y0lDSWozeUZzRGVSS2lFSjMrRTdLa0d2RlpNNGZ2OHpC?=
 =?utf-8?B?a0VvNUJuRHhtYnluK1l3SnpiclZkWVYyVHdWTEY4UmtxSEFkOGdYOGRyU0lS?=
 =?utf-8?B?cGVOMjZTOTZBd0s1Y0t4SDZzeUt3anI2amZoOVlsUEwyVTlBWG1QVlI2ZWdn?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e585e1-5ba6-45d3-15cc-08dcc39109dc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 16:31:28.5328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2OhMc355dA/Pjlu/tk1t1vrsMHgG2L+d4dg1TODqKfhacLXv7/tkWku2nZRdQ2i3Nh5WJk/y8G0gnp4pnt+1HPk1xdYWjtLYDcLgW/AMCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
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

64 DRM device nodes is not enough for everyone.
Upgrade it to ~512K (which definitely is more than enough).

Additionally, convert minors to use XArray instead of IDR to simplify
the locking.

Corresponding libdrm changes were merged in:
https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/305

v1 -> v2:
Don't touch DRM_MINOR_CONTROL and its range (Simon Ser)

v2 -> v3:
Don't use legacy scheme for >=192 minor range (Dave Airlie)
Add modparam for testing (Dave Airlie)
Add lockdep annotation for IDR (Daniel Vetter)

v3 -> v4:
Convert from IDR to XArray (Matthew Wilcox)

v4 -> v5:
Fixup IDR to XArray conversion (Matthew Wilcox)

v5 -> v6:
Also convert Accel to XArray
Rename skip_legacy_minors to force_extended_minors

v6 -> v7:
Drop the force_extended_minors patch intended for debug
Rebase on latest drm-tip
Update the cover letter, pointing out libdrm changes

Michał Winiarski (3):
  drm: Use XArray instead of IDR for minors
  accel: Use XArray instead of IDR for minors
  drm: Expand max DRM device number to full MINORBITS

 drivers/accel/drm_accel.c      | 110 +++------------------------------
 drivers/gpu/drm/drm_drv.c      |  97 ++++++++++++++---------------
 drivers/gpu/drm/drm_file.c     |   2 +-
 drivers/gpu/drm/drm_internal.h |   4 --
 include/drm/drm_accel.h        |  18 +-----
 include/drm/drm_file.h         |   5 ++
 6 files changed, 62 insertions(+), 174 deletions(-)

-- 
2.46.0

