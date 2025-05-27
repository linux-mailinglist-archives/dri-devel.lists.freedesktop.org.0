Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EB0AC4E45
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 14:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7F510E4BB;
	Tue, 27 May 2025 12:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZTMU+zr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6C610E4C1;
 Tue, 27 May 2025 12:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748347716; x=1779883716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yQvZm0Ga/hRwG31Kw3v5uaPPK1j+cEzIWVk6JP2lqn0=;
 b=SZTMU+zry/Rlf5ueP6/hw1S8+Gsq3VwDjTI0lecvZr6Dl4/RFZVZlsAb
 26iTpQZVObRQeYWy5tpd9cHXlTJPXXyE4WSbkbBOT3r/HBxo1Zlog8Tfs
 +uDJ/pNcgIiciXWDoC0tSSgEJZEwF7I9424e1GBg1rUlSTiiGcgkINqpY
 CADCejVpoY6OggfYJ0cIyvzDcbvK3B5EzUpf3bqcpIDtfY16biU8jJpbV
 g0qFXO1OdtlOWkT9sSmkelBKRe82QrSM4JUphxunaqWeNVf+sAx6JRorX
 h/WMBBjTQUpxlV4oRaDlwfz3DGxJsHM8pGTcXZKgfTTsYZYbXBFYBV8k5 Q==;
X-CSE-ConnectionGUID: H1VkYHk2QrqrLg/0a0UA7g==
X-CSE-MsgGUID: SDwoJ/PtQ+OZlwB91Pwg1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60965516"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="60965516"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:08:35 -0700
X-CSE-ConnectionGUID: DxpkVr/gTci9mOmfgBuWFQ==
X-CSE-MsgGUID: AyllnkXNSBKuYYI0sIMVwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147660740"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:08:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 05:08:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 05:08:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.48)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 05:08:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AX4E2SYWem9KTj3mavhDTgmSVzr7mq8MkE3UKu4tpl9an5Dks9ycsTJm8qyo7KYv5usfmE2mGeruwOO0ipN8ImQIsmxdKe2E+zKqpp1CjtjXwpdiQA4gukwjxohVHkToxW7Mlhs0G806Msw/ZOSvMnEiki4Rczi+J+gLpaocs9nfKBYHQydRuLyFx5cDMKa7p4VQSU4t3Ue/+M7LE2+12goKeHMN7zEpuSrjln9wvAADWsMhh0VVrsJ6wtd+8MfOnTlkXMBqHshEsDrTfZj1fG6mTEFnNlBcQltFnAij5MorRrmjGYFnrUlnNXldRq9dNGHmkYhQW4hFjIstgkA9kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1plmEqMqpV8IgipC6AnDhVqIl4Yt7pMfRz3yMnlU1nM=;
 b=EBG6uDHSPvfmgNb5VObtP0/aF2v2EqmqCM/axyjNMCnrU2ZV+DXqJJ0sr3ON0sn0yk1pjv9j+tAYERvxkp3t6p99giZPixVXkQ4i2FvKhZxvvytzOroy7E4Kb43Ink2SV0hrlxJPenEwmGX6S3U08jTk9V8mwCQ4j1v+pV+FpAZ8vWZXEcVsDgkGA4VvusubMYXk7O846JnIgDKdsYb7sDNvnj4SllnOYJJmWo8KMuGnMC0m147MAf8JXgTVDhpXy4WMN5iHLWqEPEtsVe7p0wp3146/Lx1X64sb6San2ZBWWB7Ca4YrqKT0X/+mzAGKoymNgGyxyeJTEFqmDGgFNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5918.namprd11.prod.outlook.com (2603:10b6:a03:42c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Tue, 27 May
 2025 12:08:28 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 12:08:28 +0000
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
Subject: [PATCH v9 6/6] drm/xe/pf: Set VF LMEM BAR size
Date: Tue, 27 May 2025 14:06:37 +0200
Message-ID: <20250527120637.665506-7-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527120637.665506-1-michal.winiarski@intel.com>
References: <20250527120637.665506-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0037.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: 0601f2a2-35c7-4cdf-d8a3-08dd9d1730b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkpGQVZ4VExWV2l5RmhwWjVGc1lRVUhXSDhVNmxnY3JVVmpJMnVXUFFRWHgx?=
 =?utf-8?B?N2krcVg0bnpNRkZsQVI3TDBrakRrTk0yTmFOaTZpVmt3TkJVbFBWUU1ZUWR2?=
 =?utf-8?B?M2JscHMwMi9HNm1iUXNrYkpXSHRHOXNLcVdiMWhOWFFvbEJ2NW5xekJCNFJI?=
 =?utf-8?B?akZZQi9IQVJ0WWRhUDd4OHh5MHh5bkFxbzkzVXJVT2I0bDBYeGlMNGpGalp4?=
 =?utf-8?B?eVVJZ0QrVXpMNFFvbnZMSjA1SHZhZ0EvMTZBRTBkK1lTbllBN1owOXNZaTJ4?=
 =?utf-8?B?Wi9ZNWZNVmFIZXBGajlQZ3BLcEVlRWNOc083UzBVdHg3SFYyS21iLzJmNFBJ?=
 =?utf-8?B?MEFGL1ZLamxBd251T24yWTlIRmZuU0UzSnlpMTdQWmFMMUw2OEt0NWxxWGNC?=
 =?utf-8?B?dVhKWmVlLzYwN29PMSt2eEtadXQvTUVmYWIvT25rMmlJQVVnSUZTSGl3RVV5?=
 =?utf-8?B?bGRpbVpvZ3UyQUI1MHkwYWRaNys2TXFzempGYjFrMExnTXJJektycXh6M0dV?=
 =?utf-8?B?YldyWXFINUM2STYzby9iRWJFYlEvcHordlNJRWkxQVhNRmRzVW5LaUNhMEpI?=
 =?utf-8?B?dkNCV2EyT3RTS21zeWRHM3FoWEFqNFdFK2pQWjQ4U2xiTGlrRVk0QUd3NXpH?=
 =?utf-8?B?R3Q3RVF1SGZTUDBZUWVHcnZIeWZ5NDZCTDNkNDhXZzFtY0dwNytoTGU0aFB0?=
 =?utf-8?B?NE9rdWczUXNpekFMV0pBRyt2WE8xcTV0cFV0L2FFb0dGYU9oTmlyZVZOaGli?=
 =?utf-8?B?R2ZzYU51SWExelIwaTZ5RmJzR25jMVpFRFVQSEtydE9ZWmplM3VhbVFIYWR6?=
 =?utf-8?B?S1RYbGVuWlRkc3QzN0xvS3BEcFgzS0ZpV0xOL3U2bi9sa1BVNndhWEZjL1J3?=
 =?utf-8?B?RUo3bVRYMENCOXpib1Y3dnBIQmREc0NpdGs3TmpYSlkvOGVmek5MeHJGM0VD?=
 =?utf-8?B?ekJUWXFTd25rVmJabzdXYUs1Ulk1RGJXK1F6Q1Vxcm41Vk1jZ3dROTBxSUth?=
 =?utf-8?B?czV5ajBRQmE1eXpCNDVNNlJvd0EyWUFlYi9KYmNvVmQreHpNZ0sxUHlkb0lP?=
 =?utf-8?B?OTZGWDZDUGdIUG5CTEt2MDZrS3hMOWZGeHNoTDZWd0VDUk5FeWZGS3JldlJq?=
 =?utf-8?B?WjhheXV0QXNRNUhGZ1hkOWJxaVNSRnZ2cm9ObVk4UHh6bFpScTVFNXB4ZTVS?=
 =?utf-8?B?dWVYMDhnRGEvbThybFN0QWsxUFd3WGJBQ1F1ZkpqL2FzV2t2elI4azRsVWFN?=
 =?utf-8?B?OW9SWnhOcFpmVFV0TXJVanFBODIwbDJXaGRkRm5OWmhzRmszM0xwcG1RY3lP?=
 =?utf-8?B?ckE1MFNRWmVNV1JVK3A2YTI1WGJUWmttYS9jWjB6ZmVUR3o0QjNyYTczWUxL?=
 =?utf-8?B?Z2d5ZVdyNlRmL2JuMTNRYURmWTQ2MHlNRWhGNFNlK1ZRa1UyTDFPbUdxcVB0?=
 =?utf-8?B?TzJRc2lGazZOeW14SHhMdmd0TUt3cUZ5dGoyQkFURW1YSTUxSi92cSthVXZF?=
 =?utf-8?B?Z0VJZ1VyaUQ2NFJKekNoc1prV0ZJRjFLSjZvdC9lU0NmL3ZHeGNndmU4VEpW?=
 =?utf-8?B?cFlPSkFuczBjTktwZll2RURObjN5Uk5vdEhHTkpMemZ4MTJUc0drY1Vtclo1?=
 =?utf-8?B?ZXM3Y24rc2gxTytVdHpBa3hTcnJqVW9xTm9yekZZaFFDWUFJUUtTL2JEUFNC?=
 =?utf-8?B?VUhiRzIrb0x2V2tZUmZnVmlRcE9CNFQvNlRxN2Ixb3RwdXp1eHBKTnloa3pO?=
 =?utf-8?B?WFJOM2VPYjJZdFdrMnZrdGJiRENrOXd6WE82cTBUdm9nMWRhWDQxOUZIR2tw?=
 =?utf-8?B?OWd0SEpYaFVMajlHNkhyR01RVXQrNm1ud1RiWVJIMTlHMUVRODVtVU0wWWFx?=
 =?utf-8?B?SEc2L0xERy9zcDl1QkFwanlqb2NiUzZJcXlqdUxnQVJSOVpWcGJnSDh5SG1Z?=
 =?utf-8?Q?ermOYEyPQOw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDZhUmMwUnFCYUh2TFhrbzZsMGRRNGRSTlJ6bzRKVzBmaVJFUnljbE94WmFj?=
 =?utf-8?B?R1d6WFBCZCtJVHA2b0VFWkdGcWpydldSTXN2SUJUbE8xSGNNcG84OHorSHdK?=
 =?utf-8?B?aklIcHZYenQzZWtFTlZsbWxoQ1FDVndIUXpKSXhXZU5hRDdoVWdXbjhabVk5?=
 =?utf-8?B?TUE2N2VBVlh4aHdxMTd1S2czSzZITXBBWDFVNXliUHFKYndIRDM5anJQeWxa?=
 =?utf-8?B?UEJVMHZ4M0lTRGhocUN6MkxtVE05Rm9tYUVqR1RybklJOS9NRmpYd1lLWnBB?=
 =?utf-8?B?S1RoRUp3ekdpbXB5SHhrY0VzbXZWSkc2d2dOTjM5bzkvbS8reDRBY3k2Ykxw?=
 =?utf-8?B?WUI3dXI3ZnoreTVvV0pKNjZUV1JHSjR3MVlGdzJ4U2hVOEZ1a25MUWpraUdh?=
 =?utf-8?B?dktrbnpZMTg3MWNKeDdCUnUyMTBEMXJldG5lNEJ2R1FsT29yY2ZhQmZYcDZk?=
 =?utf-8?B?T2FPbGl2Q09RWmh4SVNoWHZDUncrVld1blBReDNjaE12cUdFT255RXZGTC95?=
 =?utf-8?B?YU03STZjQXNBeVhEaU85UzRyUXlwbFU2ck9CLy9ab3U0ZHZiT1BQWkZlTGJs?=
 =?utf-8?B?ZGRKOERmS0Q1c2UrejJocWZMcFd6WXJ1ZzJDYjh5YVdIRlM4ZEVSalRRcXIz?=
 =?utf-8?B?LzNtcXJVTG81TW1MdTluUjY1aE5obkgzYVYwZWxlMmw3VUZpWU5qRlhDTnVk?=
 =?utf-8?B?L0UxdTV3bWRhQXN6SDBDNFI0eW5HMzc5WnZOMmNQRzByT0tnQlZrKzZqK2Yw?=
 =?utf-8?B?SkF2LzQvNm1EZDNDR3gxSFZ5RVY4dCtBbk05SVhTMUd5REhTVFVZQkk1Y0RI?=
 =?utf-8?B?a3RMUjRjT0t2Q0VNQXgvRHQrdUoxRXExSkFCYW9aV1ZQcCtxT09GalU2eVkr?=
 =?utf-8?B?S2h1S3BoZFREeGRkR1RVRERyYjA1NTBTNWN6STZhVDVEcHBIWFpqUEh5VG5Z?=
 =?utf-8?B?aUV6QnIvajZkUjRxSkpqZTAycUlzNXhuaDZLWVFndFNnS21aeXZ4VzVIWmRO?=
 =?utf-8?B?SWs5TlNTd0g5SU9yNmdoQkd1MUUyQjJ4ZEJOVW1PMEpJNERqQ0VleUZpbXlX?=
 =?utf-8?B?SXdoSzJrdi81cHM5cVp1d3FKajRCSVFIeWE2dHhMeFdHUjYzcmV4RVA4c2U4?=
 =?utf-8?B?bDQwVFROT21nbE1PTXdkV3pMYi9YNnl5RGhDaE9TR01NTmpSM2FxT2xHNnVz?=
 =?utf-8?B?L0RGMjNEWDJBVlpGajEyVzB0TjE2TWlHUlgrWXBzUklENUs3TGltSjlaL1Rw?=
 =?utf-8?B?amkvOUlBSE5hL1Y4VlY1RmpteXZiMHVPdWF4THE3S2lpWnJoRFJvN2FCV0hM?=
 =?utf-8?B?d3R1eWdpZDdUZnJOcWduVnBIcUJzcUhhNXVHNmFzcXZGZGpkYXVBS3BhS1dW?=
 =?utf-8?B?TVp5SG1GK21JSE1OZ1Q2dllBQ1EvVS9CK2NkWUcrMEFlR210dkNvZUtwOFZQ?=
 =?utf-8?B?N3ZJRG1MYXRpWmR2RGhGYUxPMjRUcHFKVnhHcSt0dVMwZDZaNTJtTmt0ZXp2?=
 =?utf-8?B?dStFM3AwRWJRM0dSYVJWalVxeG5Na2I2NGwwQTlhaW1wRjJOczJ4eVU2UkN4?=
 =?utf-8?B?cXhRYVhXTDcxTlZmcVVpVmVzaS9kajlkUUtLNjdCNzRCeXFaUndRdzJuRVhR?=
 =?utf-8?B?Ung5dmI5eWJnSm5Rcm5iemlrTWZuRUltbGU5T2pvai95Y2JpY2hidEZBVlho?=
 =?utf-8?B?amlJVlVzRFQyNGMvS21vNnlYK0g4QWd2eHVuWEs1ZUh2TmM4UVpRMnpnZFEx?=
 =?utf-8?B?bVY0cFZnb0V0ZWpZMkllUkh1Tjd6YXF6NHE2NW5PRlVPWFhwdlN2VGoxbWFa?=
 =?utf-8?B?dXlRc2Jqb1phNHh5RnR4MGcyRGZYV3BvMjlOQ08zeHJkRHpoWGMxeEtMWE9J?=
 =?utf-8?B?TDErN1llYm1kb1E1a3o2QWR3TjlwdzlienA1R0NRWFN1MFE0OWlPR1lLazdQ?=
 =?utf-8?B?em1PZlFDd1V6K0dWQ3RxZTFmTEliVGJMRDFyRG1Wd1VVaWJTRzhvWkVhb2c5?=
 =?utf-8?B?OE1EVW5waGR6Q2Zvemo3Q1dERmExV1FPSUhWeVlPYnpYZThRRzlVUXJDeEhk?=
 =?utf-8?B?TXdBZThuNTVPcmVHeEUxd0s3c3hxK0dEMXZubXJwdGExZjZpNDgwZ3JyU0J3?=
 =?utf-8?B?L2FOMDd3YmdkaXdJam9XcFIzQ0UvS0EzMTlTS1ZDaStmRlZZbm5qb09WeVI3?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0601f2a2-35c7-4cdf-d8a3-08dd9d1730b3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 12:08:28.5841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04xr1WaP02meiKTomvyJFqrV2D0YW2jui6j8ZR8vTM2Ilheu1FwVOb0Sbvi77dFUYbZng0R5IfL5egDVEq0ks7LK4BH+HRcw2R/ZxNOy3tw=
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

LMEM is partitioned between multiple VFs and we expect that the more
VFs we have, the less LMEM is assigned to each VF.
This means that we can achieve full LMEM BAR access without the need to
attempt full VF LMEM BAR resize via pci_resize_resource().

Always try to set the largest possible BAR size that allows to fit the
number of enabled VFs and inform the user in case the resize attempt is
not successful.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/gpu/drm/xe/regs/xe_bars.h |  1 +
 drivers/gpu/drm/xe/xe_pci_sriov.c | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_bars.h b/drivers/gpu/drm/xe/regs/xe_bars.h
index ce05b6ae832f1..880140d6ccdca 100644
--- a/drivers/gpu/drm/xe/regs/xe_bars.h
+++ b/drivers/gpu/drm/xe/regs/xe_bars.h
@@ -7,5 +7,6 @@
 
 #define GTTMMADR_BAR			0 /* MMIO + GTT */
 #define LMEM_BAR			2 /* VRAM */
+#define VF_LMEM_BAR			9 /* VF VRAM */
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 09ee8a06fe2ed..4be566331ee15 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -3,6 +3,10 @@
  * Copyright © 2023-2024 Intel Corporation
  */
 
+#include <linux/bitops.h>
+#include <linux/pci.h>
+
+#include "regs/xe_bars.h"
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_config.h"
@@ -111,6 +115,18 @@ static void pf_link_vfs(struct xe_device *xe, int num_vfs)
 	}
 }
 
+static int resize_vf_vram_bar(struct xe_device *xe, int num_vfs)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	u32 sizes;
+
+	sizes = pci_iov_vf_bar_get_sizes(pdev, VF_LMEM_BAR, num_vfs);
+	if (!sizes)
+		return 0;
+
+	return pci_iov_vf_bar_set_size(pdev, VF_LMEM_BAR, __fls(sizes));
+}
+
 static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -137,6 +153,12 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	if (err < 0)
 		goto failed;
 
+	if (IS_DGFX(xe)) {
+		err = resize_vf_vram_bar(xe, num_vfs);
+		if (err)
+			xe_sriov_info(xe, "Failed to set VF LMEM BAR size: %d\n", err);
+	}
+
 	err = pci_enable_sriov(pdev, num_vfs);
 	if (err < 0)
 		goto failed;
-- 
2.49.0

