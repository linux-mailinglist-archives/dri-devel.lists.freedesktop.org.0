Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314F299839A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 12:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D89510E8C9;
	Thu, 10 Oct 2024 10:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Im//7s9Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865EA10E8C6;
 Thu, 10 Oct 2024 10:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728556343; x=1760092343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EnFCLTRhaSlbiiAj9WkS562z1cdHDnijHo6AeVHAiTw=;
 b=Im//7s9Y4ke/0xxJNt9tvAYSus2CRWoOGMNS7qTFXEFIiwmKJRb7h4pd
 WKtVE5XMNt4iuIsO0aS+pmK/bP2Z4eRbtjft/rJKODxAkNraCK7p450hZ
 kcxp+dc6Ajcp7qBnvVOd461UIzIYdcaYrb1m6Q/JWebpNOFSr6MlJFQ5W
 OeW3gLPBnSWQLtJE8SEGTcxYU+8ChznNmn8TtsFHyPmEkA0Ty4fO218lM
 X+MTzfA99DUIZJoD2L5kbiTArb3XqW1n6IDmDF+H2EbUoeCbYqJbn1V+K
 YyXxGtwsbkx5b8YSF6THBf3IdFCYLh6FrBZmf9LoiRCsjZ1tWPF8/DOC9 A==;
X-CSE-ConnectionGUID: 6DcB/IR2SfOw21LLqLDILg==
X-CSE-MsgGUID: 4Ne6yp2ISmiPDn9xM5DqCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="15528438"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="15528438"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 03:32:22 -0700
X-CSE-ConnectionGUID: GzonanFNRG+dmbLgm142ZQ==
X-CSE-MsgGUID: cWaq87CCR16gnhX8GEWmfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="76464938"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 03:32:22 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 03:32:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 03:32:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 03:32:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 03:32:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTkKE+CM+SPD7StpZ8YKVCYqf42P6fpETw3uH8utQZaEWqDNHzVVvr9rcqDx/lmymaYgD/BIwi3Uz3YfddCbkwcp2HckAqiFW2F9ikDfFfKe+vK0/bSXMFU9D8Gmcgnr57rkNAaeL7mE+GbviYMAVMwAdLznXKgEwy/hr7BegJn9MIXyCrG174sv+/00z1vp8jLJlO/7gxUNkcTa08MCB4iXKu29yGxOLRVfep+zlE843GGOjCgF6WLTpCg0p+8W4el6CznCp45bSfqBMZ9raaGDHpvUh6+GwpiK5gHTa8loL2dgYmu86KtCboKZTzOrZpCxguRJddJ4ypog8uOXiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHNZiwbsESwo2PZik+oXAQ+zuQFZTsGm7BehrubSLZc=;
 b=pxC0cIks/3P+pal+/Xzmnqg3+ViuD8zkqT590ciNHXDDMndoII907CwX9MBisyY1/6E5PTwpxR61VilIaxEUglZaIBIPt1hKXRfYuLaxGhexaOsGYbi4GYocdp4OOYWEhoUiXhQ80lobeyGL7U3RPzEONU8dG/kuPfl9W0+kIUwWpaZxBNMNDdjHtqinsGq/4UFlS7InnP3gGj93ZhMb2HgfvprgdB+kiKHJPFmzkOwC/uNLB6iaBmCqm9eTB6DeukvcUqfkdl8lbGvNdtNOvKpdTVa/KgRAX3EQSotKtN+4HpD69/EO3FZ8NJtmjAFF2aQ9PUeD6yjp6s4UpCSAwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Thu, 10 Oct
 2024 10:32:19 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 10:32:19 +0000
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
Subject: [PATCH v3 2/5] PCI: Add a helper to identify IOV resources
Date: Thu, 10 Oct 2024 12:32:00 +0200
Message-ID: <20241010103203.382898-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241010103203.382898-1-michal.winiarski@intel.com>
References: <20241010103203.382898-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN6PR11MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 6031fa4b-da8e-48cd-dc63-08dce916d134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUVzSWxXQ2pMRjBobHIxdVU2OGhEdi9FU0EzS1gwV1BaMllQTm5DNWZPYXpB?=
 =?utf-8?B?QlBXK0VJOFc3U1VDQmN5blVmMzRCT0M0azhlR2FDYlVHUkVEM3FVNHpjbzcz?=
 =?utf-8?B?K0VtQWVORUlzM2ZaaENTZ2phY3hsTk9vUUN6Q21SZkE4eUFDQXBEa3BBWmJu?=
 =?utf-8?B?TDhOdUdaa1dRbll2dTdocXptOFA2UEp5QndLVzNtYzRqVU4xYXpPMUduZytO?=
 =?utf-8?B?ZkM4U0NkT1ptODVQY0tPOEEvaGFYVU9IYmhUZlltWENaeVNUOHVYK1lyY3Y5?=
 =?utf-8?B?MFprTXB5aGVjNkU3NW9kUHNjQ2FFV0hwQnZ0dXVJdUVyc3pDdUM5MjdvQmh6?=
 =?utf-8?B?RUMrTFFzVVJGdDlSR3hyTXhKdzVLVDAyT1l4dGp2cVpFb3ppWUV1VUk2b3RE?=
 =?utf-8?B?TEUzN3dORE16UUhyTkFzNVpJQkNKaW1sUDI4TTFhUDhvLzMxb2ZSSWhqTHFE?=
 =?utf-8?B?MzUzWkhXdlE5Wml2QldjRVBtdTJJY3FKY3dQeHBPVFBxZkNZZzVaZGhXUnVs?=
 =?utf-8?B?amM3SElHKzBjUmcrcUhScWlQRzlPckpoUFZCR04yMVBHL1BzQ0JhZkZ3OTQ3?=
 =?utf-8?B?VkpCdHhtRzVFazVrWTRBQnhvMEVlU2N5eThyUVhCQUJVSFdEbHBaelA0d0VB?=
 =?utf-8?B?N1Y5VHNqWEgwTTZXckN5V0wxdjc0cDR3OHJnS01zZ3RBRUJrTnVDc1BPNS9E?=
 =?utf-8?B?ZWlod1NkZW9vck5HQkJjYjN6cW41Z250YkZzcHgrd2NSTE5ncEJ2d28zQWh4?=
 =?utf-8?B?R1c2cjZyOVhlMXp0S3Y4QjhuQUJOaVhPMkxzOUsrbS9xZExiSXkyTXh1WEFj?=
 =?utf-8?B?YndmK29MRUtySjZsY29jRGN4alppYUFUSGhiSWx5SSsvQzB2eW1GYVZJUGVT?=
 =?utf-8?B?bXRqQnp5aUJHNWt4K1NKczB6clJXYzYvMEpvT1FCTnFCelZyTHhxSmQyUGY0?=
 =?utf-8?B?cklmc0k5ZHRYOTBwSFU1blFKSTF5bnVjZ2tjdWM5d2EzTTJaSDdzWFN1QVhv?=
 =?utf-8?B?eTNCb1BaQy9IeG5LOXpvZ3lVbXlJdkpHMEJEMDRmQ21LdWh0NGgvb3F6Rk1i?=
 =?utf-8?B?SmNnUUVIR2lrMStDc0gwWjQxODIxeXFyaVQxODQxbGloZVV5bEVSRzB0L0dn?=
 =?utf-8?B?VlNpaVJHcCtIY0RPRG93TmFLZmNUV1AxY29WayszZWFaQnJQUVE1aDVGYUQ2?=
 =?utf-8?B?Qm5sYkFSdmx4SUhycTdIcWlkbFg3N0svanZiV2p2VUlBU0hkMjdxMFJ5bXNE?=
 =?utf-8?B?UFVqLzQzMkRQYnFla1M3d0pjRFBBekc4eU16bmRmaUNtMEptMVRsT3YrNmpW?=
 =?utf-8?B?RS90RXJGSStHUkIvK2hpQjlySmU0d0VrVWF6dVFLdUgwcktXbFRxNFpYNnQ5?=
 =?utf-8?B?QllQVWRQVGFzamR3RWtkVFNMUWRqOVVLT0V6NDJhRU1ab29ZTTNWS1Q0bEN3?=
 =?utf-8?B?V0FUQUV5TTZlVkgzalBDWmcxanFkVFM4VlpmeHExRnpzdWxKQlpIMDE2dy9x?=
 =?utf-8?B?ZE1nc2gweWdhVjErWjhDOEIwMmVBODlpVzUyY3MrRWMwVmpzUWNyNXJkQXhj?=
 =?utf-8?B?Q3JRSkJoZ01KZjJXVWRHdlRJcHdpaXhqMmVUWjJBNTR3K0gyNk50SGtXeWxY?=
 =?utf-8?B?aTNnbWVIKzIxWC96bHI1aXBWRFRqaUFBMlpXM1l4UDRvSE12ZkFVWEUvUGw5?=
 =?utf-8?B?WVRnUXlxM3ovKzVhL1RucUVsTi9aY0dFSFltRVNyMUdxaFA4RmNObHVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NyttRzkweVNQTG1CaWVSbXgrbGNiTGtMVVgxTmM3Yml2ekhaS29BeTV3RGZE?=
 =?utf-8?B?bkloVXBHTmRSaWtQWDhrb0h2blRHeFZQdlV3T2xLMmZoUjRmeEhrSjBENnFL?=
 =?utf-8?B?M2pkbXduN09tSU8va1NTYzZLRDM3VGo5SjRxWUwvak1EakpzS01tVE9qK3Q2?=
 =?utf-8?B?MWpteXpLRDV2SHBkOFdDYjBiVEJpMUp5dW1kTWtBdkFKOUwrK21aUGxRcnBp?=
 =?utf-8?B?cTFObW9aTERwQWVhL3JvMEZ0MHgxRnNGVHFnczh1MGsxZHpkeDRKRWE4K1d5?=
 =?utf-8?B?cFZRNXduZ0owc2RSU3haajZoNjVKSjJtT25wdWxiQUFXakp5ZlNyaURQVGEy?=
 =?utf-8?B?eEtCTVB3dy9OYWF2Yk5YOFEzNmxGelhBSmpXVDhrYnRuY2FsSThWRGRSMVRQ?=
 =?utf-8?B?T0hLNGJ3RXdDTmRDNnl4QUFZQm9rR0Y4clJhb09INzJ3T2x0TzV6cVlmbGE4?=
 =?utf-8?B?aHpMOSsvYlZyS3RDMG85SHBwRnRoTStPcjB1MERIYWZ1VDFjSGgzUTR4a0Rr?=
 =?utf-8?B?b0oybXR6Umo4Z3ovNHlXa1Q4VjlvRlZoWlMxWFNZUGVpcU92dWF0VlNQQTll?=
 =?utf-8?B?MzFVTEZxNDI2bm5oT25RRXFrQUNJY3BRMjZ2eEpvNVFuNjlrSzZzL0E0SE03?=
 =?utf-8?B?NkRJWnA0R3JlNlp6SGM5M3hPMWxXaDQ3anFNYlJPUmMwUEx4OW1sdHlTZ1k0?=
 =?utf-8?B?TU5mNWJuWWdnSGNZNi96eFp2SEtSbVBWamwvSTNCVHN3MUpyNEZuUDJ3N2Mx?=
 =?utf-8?B?aXVVb3hobFZSc0thYUZsczNETGpGOHlBOStCaUtpWTZHenJjU3hTZXFRYlg0?=
 =?utf-8?B?RXBNRnF1S1MyL3IyU0JYVUM4Y3RCYk1Yek1PdFBLOGJhNENtZzRaTkQ2OSth?=
 =?utf-8?B?bW9IV3Q5elFEcmdVNTYzd2k5WnJBd3o2akRCRVU2VmNxOThxd1RCVXNvOC9j?=
 =?utf-8?B?OWhJT1Juc2t0cGxMMzQ4a05wa293cmFudE1CeXBVQlVSVmtYZm4xVGlCelY3?=
 =?utf-8?B?K1JrWnJMMjdTSWcvWEo1cDV3WlpQUTJ1M2loK1lYRnZ4Y1o4Rmp2OWFSUXZC?=
 =?utf-8?B?NEdPaTR4ZHJmdU8vSDNtMEpNU2FseGx1V3hLSVpRelNRZEF4NVpNUXN1NlVQ?=
 =?utf-8?B?UGRhOW1mT0YwWCtuOW13MWxqRkFTZWJuTU82YW5lMHVxZFpJb3dNeXd0YzJU?=
 =?utf-8?B?azJMWGE0RGluMjA0NzR2ZkhSVS92L3BGSWN1L1dtZklQMHVHNGV1WHplU0tz?=
 =?utf-8?B?L2FhakgxdnptRGNoZm1hbjE5YzBnVy9Ybnl2R0JoSm81THhJdGxSOTdEMmp1?=
 =?utf-8?B?Q2FyQzRKdDF4R0RBZGVKY0F1VFVaSVZkSnhOSFRjSDg2MEYzbFlqS25Oam9H?=
 =?utf-8?B?ekViV0FOY1lEWk9lbVg4TGU5RS9rRDY4MHlaNzlvZWpNRk5jSHh5RFRKRXFN?=
 =?utf-8?B?QVNwclllckR5SHU4T2dCWGxuMm54RktBaGhtQ3VrbUdUY1dwVklKRDk2NDhm?=
 =?utf-8?B?aVNvMmgyM3Z4ejVwanNFeUpRYkVRWXh2b1puV2Z1OFFaSWM4ZHlGbkwva0o0?=
 =?utf-8?B?RE1LQ0hPM1ZlcG5IS09xTmNWaVZMRHBwa0l0MXhtZUhDR3dqVjBsYXVIcEJl?=
 =?utf-8?B?bGJlNHc0OGlEU0F5eEFBVU1GWFFjYmNkUzlyWEZyNno5bWo3emFyR3diME1k?=
 =?utf-8?B?ODI5a2lmQ2gvRE5aQzdjek9GZFNNZnR6V2h6TTRzTWF2YWxLamxIU1pZMnk5?=
 =?utf-8?B?dXFUZ1hDYjExVGJyTWVOYWxYQmV0VU1aVVViT2lWcjRvWURBZ3AwSnRRSFUy?=
 =?utf-8?B?bURHQWJGdHNEMmkwVnQ5bDlYd3poT1JuZ09mRGRvVWtrdG1GekZZTzR2d3lL?=
 =?utf-8?B?UTNBZk1NUWkvRmFnMUw4VExvQm1qRnFFcldFQy82b1g5cmtUU1RDSGFQSlUv?=
 =?utf-8?B?MW1LU2svWmR6N2lkelN4aVNEYzJqT2pDOVUwVzRGTSt5cmszVDc2U3BCNmxj?=
 =?utf-8?B?eDd0Ym9XVTVvWklwbDc1dFVxTi94bUZGLzQ3ZUpseGpHcE9hRy9wUGhPZFFZ?=
 =?utf-8?B?M2F0ME40SUZ2NkNwZVJZZStLNjNIMlBIQkdlLzVxVlVhNE14NVZGRUVwVjlC?=
 =?utf-8?B?elZmbDBMc3RmbmxnUmNETTdEOVpYeUQ0WmFnTEJWWnFtTzhCRXBkbjQxcG9G?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6031fa4b-da8e-48cd-dc63-08dce916d134
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 10:32:18.9403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1CMItMzJCuZTf5+fWMsnu2+z76wkLe8L05/aM7wRue+n9U12dztUBQsFOrO2kEjpGv0Y4AHxxby6qc6Gw5MjE3b7/WU/e542s+8AYdEs3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
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

There are multiple places where special handling is required for IOV
resources.
Extract it to a helper and drop a few ifdefs.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/pci/pci.h       | 18 ++++++++++++++----
 drivers/pci/setup-bus.c |  5 +----
 drivers/pci/setup-res.c |  4 +---
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 14d00ce45bfa9..c55f2d7a4f37e 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -580,6 +580,10 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno);
 resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno);
 void pci_restore_iov_state(struct pci_dev *dev);
 int pci_iov_bus_range(struct pci_bus *bus);
+static inline bool pci_resource_is_iov(int resno)
+{
+	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
+}
 extern const struct attribute_group sriov_pf_dev_attr_group;
 extern const struct attribute_group sriov_vf_dev_attr_group;
 #else
@@ -589,12 +593,20 @@ static inline int pci_iov_init(struct pci_dev *dev)
 }
 static inline void pci_iov_release(struct pci_dev *dev) { }
 static inline void pci_iov_remove(struct pci_dev *dev) { }
+static inline void pci_iov_update_resource(struct pci_dev *dev, int resno) { }
+static inline resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno)
+{
+	return 0;
+}
 static inline void pci_restore_iov_state(struct pci_dev *dev) { }
 static inline int pci_iov_bus_range(struct pci_bus *bus)
 {
 	return 0;
 }
-
+static inline bool pci_resource_is_iov(int resno)
+{
+	return false;
+}
 #endif /* CONFIG_PCI_IOV */
 
 #ifdef CONFIG_PCIE_PTM
@@ -616,12 +628,10 @@ unsigned long pci_cardbus_resource_alignment(struct resource *);
 static inline resource_size_t pci_resource_alignment(struct pci_dev *dev,
 						     struct resource *res)
 {
-#ifdef CONFIG_PCI_IOV
 	int resno = res - dev->resource;
 
-	if (resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END)
+	if (pci_resource_is_iov(resno))
 		return pci_sriov_resource_alignment(dev, resno);
-#endif
 	if (dev->class >> 8 == PCI_CLASS_BRIDGE_CARDBUS)
 		return pci_cardbus_resource_alignment(res);
 	return resource_alignment(res);
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 23082bc0ca37a..8909948bc9a9f 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1093,17 +1093,14 @@ static int pbus_size_mem(struct pci_bus *bus, unsigned long mask,
 			     (r->flags & mask) != type3))
 				continue;
 			r_size = resource_size(r);
-#ifdef CONFIG_PCI_IOV
 			/* Put SRIOV requested res to the optional list */
-			if (realloc_head && i >= PCI_IOV_RESOURCES &&
-					i <= PCI_IOV_RESOURCE_END) {
+			if (realloc_head && pci_resource_is_iov(i)) {
 				add_align = max(pci_resource_alignment(dev, r), add_align);
 				r->end = r->start - 1;
 				add_to_list(realloc_head, dev, r, r_size, 0 /* Don't care */);
 				children_add_size += r_size;
 				continue;
 			}
-#endif
 			/*
 			 * aligns[0] is for 1MB (since bridge memory
 			 * windows are always at least 1MB aligned), so
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index c6d933ddfd464..e2cf79253ebda 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -127,10 +127,8 @@ void pci_update_resource(struct pci_dev *dev, int resno)
 {
 	if (resno <= PCI_ROM_RESOURCE)
 		pci_std_update_resource(dev, resno);
-#ifdef CONFIG_PCI_IOV
-	else if (resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END)
+	else if (pci_resource_is_iov(resno))
 		pci_iov_update_resource(dev, resno);
-#endif
 }
 
 int pci_claim_resource(struct pci_dev *dev, int resource)
-- 
2.47.0

