Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887319C5B04
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 15:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3520F10E5FE;
	Tue, 12 Nov 2024 14:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEPwMg/w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A17D10E5FE;
 Tue, 12 Nov 2024 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731423367; x=1762959367;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sUrJeMH9RscmyIieJNOH6Omo5lJdOJV4tlT3b4TiGrc=;
 b=LEPwMg/wH/5MZ4LZ4U0OasHA12crZu/bf7jPlz9+xjhc81nddfBqzXWY
 0VCqVfx1d6msOFemKW08ZkyDjEF93M3DgE8B8MOUX4qVQNCMjbIWsTZbV
 KZxcRK1zjrV0g/tMO+2pHerLODx3jUg3JZTPALjykT65wU3Y8N1fEuhL2
 XYX6rM67MdjFMALTNpD4E0fGGQOMlRPuKK9RNVcwBFuRBh5rEIXzbOhrC
 cDym3xFAVpUWvb549SzBBTrQK41VmxBKYwoPSsXU1klLvPBhDb0SX8vx7
 +eYo6eeju02yhySLSBeRf4TV9YkE71zt8JNnKJLJ+MKY/n1VGFAh7qEPx w==;
X-CSE-ConnectionGUID: MOrvj6TORZWSv5imlQ5CbQ==
X-CSE-MsgGUID: w5LvraFCRpWF5u9ExQw/RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48716512"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="48716512"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 06:56:06 -0800
X-CSE-ConnectionGUID: bNqtTzAbRcut60SVq6Wz/Q==
X-CSE-MsgGUID: 4wSLQJGKQOirDEbRZ69xaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="87463399"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 06:56:05 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 06:56:04 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 06:56:04 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 06:56:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZ71tGxRWxR3/uMCtsH8sywfgPxVP9l+jDIPOciQTrLcrvFrqYVzb+fQKQfDVsfM9bdC1vuaRXns4tdu564jDjhMJyOIVxC8r17CSOhyl1HuSzCVm2T60AaeeQDz20N61T9GCVDHcvV5IeA1mM/Y/Pms9lqfaJYpl47CvaASnfKJm7PGJNM6UkuWx/agut5RPYpIlwOCxi/Vj8TRh+QtwTj4Qz39kGu5gx6JPrUP8WNN7r8dhAx/NhvWLJ2pa9y2WT+28EXcWQqD1LBpD1Nx1yKIVRfDOl0AD23yQxk63p8xGehLo2A0uxgOum25HHcakLGTmjtBDfPyLbJb23lwtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHaile56eIyKDdZjcDQ7sJmNP90rL+qy7dQ0CRaFFYI=;
 b=dqIX91u/T/gpUpXLEy5g6aiSD2mr+xnAzuCVt970Bn4EAFDBsXynO9e8faHg8aez8Ycr/GldOhaZ1m8Ce4Fnd2rHvTdbL+cYFJIW20oqKXB+ivt9shuFUsiVZwHFrEhv94yHhO7CMkz0ose89dv8njh1zBw9Z3j/agcNps2cBJUQQji7KHhN8EOHgWvzndq/Nabp5o2RG17BdJAZXSGsQLnYu79uLSS/M9XbaOJAm7GiJcQNcgrGIXLMFPVTV4dZ3FeO2Ql5/R8ZQsPUOhhUHrXbcYxC4sRivOX7qykKrwANMX8pkoZ+Cun7IqNPcJI+ZWltnWROdTjwDa5wCdNDEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN2PR11MB4535.namprd11.prod.outlook.com (2603:10b6:208:24e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Tue, 12 Nov
 2024 14:56:01 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 14:56:01 +0000
Date: Tue, 12 Nov 2024 15:55:58 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 6/7] PCI: Allow drivers to control VF BAR size
Message-ID: <f5z3pmw7jdxfeej56imz3i5s7upakjj2m6hyadtgpasvrvzciq@76cfywmwqkt5>
References: <20241025215038.3125626-7-michal.winiarski@intel.com>
 <20241028165031.GA1106195@bhelgaas>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241028165031.GA1106195@bhelgaas>
X-ClientProxiedBy: BEXP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::21)
 To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN2PR11MB4535:EE_
X-MS-Office365-Filtering-Correlation-Id: c019af95-76e5-40ee-714e-08dd032a1fda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHZmMlZXa1NpMnFuMW15cjIvaERka2xVMWJycUJKVHhJOVJHSjArOVd3TGY3?=
 =?utf-8?B?TldVSXNZM0t1Tnd2QnFlWWlFR0pyTG5xR2pCQzRiTnJYMHpGS1lPVUlYc0xL?=
 =?utf-8?B?eGtMZ2hEQnJWcE9sVkk0aFVwZGJoWWd3dVhIL0xTVFRqMTRDRndCN000aFh4?=
 =?utf-8?B?clFTN3dhMDk5aUNoWEhGNVE4Q1NBREtGZ1ArTERBNEhBNHNHVzhHeklIek9i?=
 =?utf-8?B?Z0xvaXJEK2cwUVJqOFhBNCtMTDBTUWQxVm1BN1pwQkw0VEkzSTV6aXlGTDQv?=
 =?utf-8?B?RXErNDRLWnA0S2FsKzFGZE04WUJtZWZLSTdEd3dUT2VkQ2NWVHc4Rk1OTkxu?=
 =?utf-8?B?Vk1nVWZOK1ZwclRPZjZObGxnbVZFMHFiWmRCUnJvbDZHcWxOaWltOWFkUlli?=
 =?utf-8?B?YnlYdWJ0N1B5SE13WHUrem5KUEkzdmo4eU5uMFQ5cTBhcThuQUNscE1nUmJM?=
 =?utf-8?B?L245ZEZ5S21JVkcxY3c0UG1lcHpCU21PUGNBV2V0bjJpWTJOTS84bkRXVy95?=
 =?utf-8?B?MS9NVHBoMGtZcVFpbFZVQnYyeEM3T2hZUEJUYlVZaEtqTFNmemdscUw2Vy92?=
 =?utf-8?B?V3VlbWRQUC9KcVFCeXVvdExTN2JNeVJ5TVBidG96QUNNUG16bHNmRS9PL1Ru?=
 =?utf-8?B?NEphT0Q4YWQreTVTaVNiNEh4SkgwTlZNMnpTc1FzN2w5UFowa1BpdklFY29v?=
 =?utf-8?B?S3pnbm4wVEhKVUFkamtQOU5IVjdyU1Mva0hCQ0poQVo1dmxPbVJhd0RDY0t6?=
 =?utf-8?B?cnBpVkdEbllsSEdtR21RWDExS1d5UCtMZEZWMDVtZHlYSG82Q29XWXBtVSti?=
 =?utf-8?B?bmpCZzN3WHE3UXU0RUNKZzlLRmtwaWpWZkNFSEF0UHFCeWJLR3R5S1FRQjRk?=
 =?utf-8?B?c3VoNjZYTmV5blhsVTVJTXRoQ0IrYVc1UzNJaUljRnhHWHpQREdMblJvWlBn?=
 =?utf-8?B?KzRwMTBURlR3aVlmWGdoa2YwaS95WjFSRC8wK0R3Zmttc3crajM2UEdmakln?=
 =?utf-8?B?Zmd3bzNQMlJJeWU2eGx2YnZEWjFPSllnMUJLUXpkYXorcFhqOExrTXlSbzgr?=
 =?utf-8?B?SHZrd1g3UEY1ZUd5TEpYbktQOGNWR1J3OWRLVVoxTmsxWWxKVlVwR1hUbzk4?=
 =?utf-8?B?R0MxaUxTeXZNdjRkcVJxbWcvTkZWL1YwZWJMME1WMkorWTc4aCtNdkwyZ1Bu?=
 =?utf-8?B?SXZuL09vbXRPV2lPRkN1eXQvczgvR2UvUE1EK0t4U0NTN2lNMzB4WmdjdldD?=
 =?utf-8?B?bDFQcERpellRRVVHNUVoVHdYMkxXckRmdzJhclhmQ2UwNGp3WHVhMTFtKzdw?=
 =?utf-8?B?MHpQMmk4NTN2K09TY1FvbFNSelVoWkJxbVRWbDlzNUdmcVcrb1ROSU8rZ3hP?=
 =?utf-8?B?ZStBc3kzWDYvRzFBRmE1Wms0ZjVLbzVhOFZrR0VWNldQMFBhQXg2aDA5d2d0?=
 =?utf-8?B?WTduanFpRThzdWxjQllFMEgyS3RtcThkZkJ1bkEyUHJjUlgzRnlrcEEvMU1P?=
 =?utf-8?B?UndHVGU1STdqbktHM3A0d1ZWY1pkNkVtNXJEUm9IRU5qQ2ZPVHMrVXJtVEVH?=
 =?utf-8?B?NEpZV1Y2eUR0OG92MlJzbGc5VUR3YVkrSjFwNGxSUjlMbDFSQWRlNFZFL081?=
 =?utf-8?B?VFhmYWFQWS81QU9wRUMwMzhOaW9LT2Y2cmRuOFNXRkpESnF6V01OMmIrQXpp?=
 =?utf-8?B?dTExZjNQRkJvZVBLYnZ2NklEdlpqVmNPRENKNms3a2EvYTV0V3BrakxxQklU?=
 =?utf-8?Q?dArOnwNAPwwqfiP95f7NqPrqOMEe3/LEaknqdsB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0svbC9lR2NGT25xN3J2bllJYjNQU1FHaFNBcUU5OCtSWVdvV1ovQys3bVhy?=
 =?utf-8?B?Mk9Fd090ZXY5bjV2NmJ0S09STXluUzlJYXovUlFFYU44WkRTNGdaK3VOQkZh?=
 =?utf-8?B?L0RybFFWS2twOVZHb211eFBMRWVDamxFZzZjcGUrb3BLc2NzQ0QwbXBlQ092?=
 =?utf-8?B?YVRWQUhyTEpwTXlPb1ZlMXFhSVoxbmtCK2djNVFOVFhzY3MyMzZTK3VKdzF6?=
 =?utf-8?B?MldTUThLaC9vbTNMWkxJZksyclc5a1VKdHJzY3BrTTZMRy9mVE9YdWFBd2VY?=
 =?utf-8?B?ckJPMTYzc2VBMEszVTZkMUl5TFBLOWo2R0xUaHlybWQzZndGdWpTejVUK3VW?=
 =?utf-8?B?TVFCTVIwelBjYW1DWHZ4N1YvWGVKNmptTTRhSjhSMUppS2gvNmdZNUxrZDF1?=
 =?utf-8?B?OHJPQmxLRzcyWTR4VlNlVUtzRDd6WmxBNUxrcGhtM1lrQUlYeFFla1ZMOW16?=
 =?utf-8?B?MDVDUUVFOExQWTZQNGdzRmRGKzhpN0RTZ0tobXNNdnRpSkIvaHo1Ui9qN3lF?=
 =?utf-8?B?bG5Fbzh2YmNmeTNKLzBpSWw0NVBWVzUzNWI0dUpub0NvL29zSDlZVXR6RlVa?=
 =?utf-8?B?aDhZeGFlZlZhdys5TE9rUGR2YjAvUE1rd2tzUUEwaklJSHJlVlRhaTdqeDNx?=
 =?utf-8?B?RTc4aXFHOEt4VlQwdUh5M0pNM3NVcFV3YnlHNFZlR2tPcWRaSWVMWUlRZCtP?=
 =?utf-8?B?VG9ZL0dVZGtzOFZiZFRreGl2WlE1WUJyTWgxK3hNWUF0WUoyMW1VandESjNa?=
 =?utf-8?B?SGNVUldZN09Va05QT0k2M3ZSRWJuR25nMkFONSt1QnYrSXdWUkRyeUV4UUJI?=
 =?utf-8?B?OVZFaWxzRUZMaklnWnNRdTZuTlhoVVVXa00xOUsvREIwTHpYVEFoL1RlRmt1?=
 =?utf-8?B?TDl1MXgycFUwTTVrTjBvZnc1SVIycVRlTUZuMzBwNkp4aGNzMzhOQThkaHFY?=
 =?utf-8?B?ekRtYmlmL0dBV1JWelNWbHp5YmNCWVZSSUlYL3d4aGJlcVVZTkVCd2VDRlh6?=
 =?utf-8?B?YVgyazdyUEhNak91ckUrQWFVcDhxKy9BQXhQNElKNkhXYUV4SENmLzh6YWVh?=
 =?utf-8?B?Nit5eFBlN1loRFJVSVZSdklwTmtKcmVqWWwzSTlnaWdISWZsdVJWWnM0NjEz?=
 =?utf-8?B?Um8yS2JuZUVQbDY5bDF6TkFwTkdBSFMzVjlRZEEzOGd1STVmU1BkMmk1ZDZw?=
 =?utf-8?B?b281ZTQ1SkZSSUg3SW5reDg5S01Yb2JQRjZWd1lqNDQ1OFd4bVRRZDRreWZT?=
 =?utf-8?B?OFRoN1I0UHg3ZnVjZDU1UTJqTC9Tb1pxNXFtbXYxcW9ubVg3MWpBTHo5Tkph?=
 =?utf-8?B?OHpUb0FFbUlHZVkvZXhsUkpHSU5BcTV6TTdCbGt1UnlXRzYzeWhPYVh3NEht?=
 =?utf-8?B?S3FyRkZ2aWZWTUlDUTE5VlhJUmdkcVUzU2VCcHJqNTBLbzIzVnJFdkNuQ3A0?=
 =?utf-8?B?RVNVZVdGUHhDU0JDOWVza1NROE11WmVxUHpRVG52eE5GTzIwTUQxSHdOdy9Q?=
 =?utf-8?B?SnR6eVlrMHRtUkp4TjJTY3p6YzduaW9RME1NY2ZFWkdjK1VTS1NTM0tLTUNN?=
 =?utf-8?B?Z2g4dzRUQXRSYjRXWWUzdUFYK2Q2anpHME1tYzhDUGVQTktaZFl1WE10RVN5?=
 =?utf-8?B?cGo4VCt3bjAvOHI2MmdLVGtoM2JlWjBJYVRWdklxbnVVZVlkUWR0WUpmTDlP?=
 =?utf-8?B?M2MzT3NWeUVzRXA3OE9wb3BzMU84MnZCb0N5T0xnRThMQ0p2a2Fqb2JIRzZh?=
 =?utf-8?B?RDhXRjJ3QzJwdGMzN3VlMDBEL09leEJ5ZFpSakp2Y0hMTEs0bVlzNDNsTTNX?=
 =?utf-8?B?U05rM21LSG1NNURkdjlHbXVhUU1zcEZ6YmQ4SzBPakoxMGxBdkY4aE5MWkU1?=
 =?utf-8?B?YVpCbURiR3ZMdTdUVmRiVG1PTEduMXpmZklNdENwNDIySnVFQmxLTUZZZGhr?=
 =?utf-8?B?Yi9WVUMwMDRqUWJBTi9BVFNCL09FeE5mN1FtenB3SC9kMlIxZnJBb3g0Ykto?=
 =?utf-8?B?RW1CSzN3Q2N1OFZYbHFTSXphQy9vOUxIZmNYZkVYSXF4dGVPb0dBdGRzV3Jq?=
 =?utf-8?B?UjRmY2owZE15UDRkK21HQ2wrUVFsQjhRVnlTYkpoR01Ld1BvS3V2eWwxc0FH?=
 =?utf-8?B?b2NOQXlsZzlqNUhOS1krb0hqRkVsb0VmbnFWRlNHN3FuQ0dFaC9nRFNRamZr?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c019af95-76e5-40ee-714e-08dd032a1fda
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 14:56:01.6577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAXp+pyNzcoB4J3qlQa6XzEXte/4loEfz9UNi2r3zAsSdskmqbC/u+hBvmLwmSEsQn/iDN4cNo4vZiwNoyrRP8lL8QbVZEwI7Aoe0eudaBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4535
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

On Mon, Oct 28, 2024 at 11:50:31AM -0500, Bjorn Helgaas wrote:
> On Fri, Oct 25, 2024 at 11:50:37PM +0200, Michał Winiarski wrote:
> > Drivers could leverage the fact that the VF BAR MMIO reservation is
> > created for total number of VFs supported by the device by resizing the
> > BAR to larger size when smaller number of VFs is enabled.
> > 
> > Add a pci_iov_vf_bar_set_size() function to control the size and a
> > pci_iov_vf_bar_get_sizes() helper to get the VF BAR sizes that will
> > allow up to num_vfs to be successfully enabled with the current
> > underlying reservation size.
> > ...
> 
> > + * pci_iov_vf_bar_get_sizes - get VF BAR sizes that allow to create up to num_vfs
> > + * @dev: the PCI device
> > + * @resno: the resource number
> > + * @num_vfs: number of VFs
> > + *
> > + * Get the sizes of a VF resizable BAR that can fit up to num_vfs within the
> > + * resource that reserves the MMIO space (originally up to total_VFs) the as
> > + * bitmask defined in the spec (bit 0=1MB, bit 19=512GB).
> 
> This sentence doesn't quite parse; something is missing around "the as".

Yeah, typo, "the" should be removed.

> I'm guessing you mean to say something about the return value being a
> bitmask of VF BAR sizes that can be accommodated if num_vfs are
> enabled?  If so, maybe combine it with the following paragraph:

I'll change it to:

"Get the sizes of a VF resizable BAR that can be accomodated within the
resource that reserves the MMIO space if num_vfs are enabled.

Returns 0 if BAR isn't resizable, otherwise returns a bitmask in format
defined in the spec (bit 0=1MB, bit 19=512GB)."

-Michał

> 
> > + * Returns 0 if BAR isn't resizable.
> > + *
> > + */
> > +u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
> > +{
> > +	resource_size_t size;
> > +	u32 sizes;
> > +	int i;
> > +
> > +	sizes = pci_rebar_get_possible_sizes(dev, resno);
> > +	if (!sizes)
> > +		return 0;
> > +
> > +	while (sizes > 0) {
> > +		i = __fls(sizes);
> > +		size = pci_rebar_size_to_bytes(i);
> > +
> > +		if (size * num_vfs <= pci_resource_len(dev, resno))
> > +			break;
> > +
> > +		sizes &= ~BIT(i);
> > +	}
> > +
> > +	return sizes;
> > +}
> > +EXPORT_SYMBOL_GPL(pci_iov_vf_bar_get_sizes);
