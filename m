Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D15FAEEC47
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 04:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA1710E252;
	Tue,  1 Jul 2025 02:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ovn/Aqbz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B430010E252
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 02:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751335349; x=1782871349;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HdGyQjwvRjtgp1AIgwNV6dM5QRij0Y3P/2QiIBmD7S0=;
 b=Ovn/AqbzwoxT0YTEVIqswrS+9CCfI/IWaquQm08fBCRLCGbxnmntWGKW
 HoyvsOP4vkRBLYwdqpSATOUFinNOuoq2qI0IAPrleTn1a6ECNrIOmhQJq
 hKUagVJSgcMUv6ARk9JGqHHOte1et74zVUOQifALZ4LbWTPa8bPZh8Yzi
 YRt3dWvCUJdjCz53Dus7UXLBHWG7sqzNFxaqkJEHe9qndGBk5g2bH6BBA
 ALXSlQADuNVTRkz/txaDmaK0cS8g37OrvOLXIgK6WPWAvn1pp5cgkfVND
 nXdGefjPNkv+tpt3208evs8y8CIW01W1NXAaxOtzY4oWTAfz0lwb8g93+ g==;
X-CSE-ConnectionGUID: a2X+gQeXSv2JRiauBxrjbg==
X-CSE-MsgGUID: g+hopWzVQduMcBsf+v4Umg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53444517"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53444517"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 19:02:29 -0700
X-CSE-ConnectionGUID: aflwaaPJQeeAj70MHAyo4Q==
X-CSE-MsgGUID: 3rCDVwGBRCecFDCOKgeEHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="154108678"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 19:02:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 19:02:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 19:02:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.78)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 19:02:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVXwEtfhSFdzGsLeLnFlhDBc0FkxM+tr1unNsOYu1Fte3gkLX/YFsNk9s8uWx00mua9Qb8cy9/A2AAxr9UTth1CmnynwCtnbtweNcVu4unet9vWrJTFp59C6a8k4UzTN1g2y+iyblSypoja+VDa4THi81AkW9M/JYvugCVA8BQ5JeQ/DmXAvU52u0T4u2KUV67/GIplkQLZdE+Jv6ovYSqZ8GR0v+ZAJic9KhN3Wnio4QcHwpmeuCkzrBdqdDBmw4aZ/bpEhp0vL5azb3w+sORMA4vMcVmMvTNrLfnf+11QEw9MQjazPcnrBPidsIAa1ej5KK3hgdN4SE0PNBIXZjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdGyQjwvRjtgp1AIgwNV6dM5QRij0Y3P/2QiIBmD7S0=;
 b=MAUGUVGLCZilef82F+0i7H5GPUxSiPZuO65tHwXQDVVWGbOTCkGh8T/zN3KNpRfZORYt8Di/DhNqHm4BzidLO5Azbb2INJ4SQLeFTyjXqFgGqgI4sOo8463+fqgCtksylcHsW0MYdr2JHN5fDtO4vee9oargeRXmF/dXX90vxcyvr0Af3AjgbmExeh+EDu1FG5vMoJ5SFvkC9L/V6LRKGAVg+sESWUm3QFEryd5CY6f6urQaasnfJp8MCJzKgEFpxoHMRyWyhbC2MvPJ/LN0aNTYgDt5rNvWAZq8GlqeuDUHBAWrzIohXxZfZ30yB62jtfgmFbYeT/88GGqkYYXJJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Tue, 1 Jul
 2025 02:01:57 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::bd3d:59f2:9d29:346]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::bd3d:59f2:9d29:346%5]) with mapi id 15.20.8857.025; Tue, 1 Jul 2025
 02:01:57 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: RE: [RFC PATCH v2 0/2] Virtio-GPU suspend and resume
Thread-Topic: [RFC PATCH v2 0/2] Virtio-GPU suspend and resume
Thread-Index: AQHb3XtpnfRporDVBUu1lRYCf++0mbQH88JQgBSo+oCAAABqMA==
Date: Tue, 1 Jul 2025 02:01:56 +0000
Message-ID: <PH8PR11MB68790105AC2ED8E0BEA2FF26FA41A@PH8PR11MB6879.namprd11.prod.outlook.com>
References: <20250523220015.994716-1-dongwon.kim@intel.com>
 <23e2560e-276f-42d3-a525-0c0405c8641c@collabora.com>
 <PH8PR11MB68791BB9A9F720E820C57D14FA73A@PH8PR11MB6879.namprd11.prod.outlook.com>
 <f414f729-d485-4318-b5c9-c652ce388db0@collabora.com>
In-Reply-To: <f414f729-d485-4318-b5c9-c652ce388db0@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6879:EE_|DS0PR11MB8208:EE_
x-ms-office365-filtering-correlation-id: 2c9e4ee7-fea7-4338-cb8b-08ddb8434233
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VHVMdS8xdlZhMVlGQkd2a2dYUi96bHNYU1ZBQWx1dVlUREo0aUNnMWRhVHZq?=
 =?utf-8?B?cGlwSEdwWVA2WEJSVGl6Z2xKWTZOVWxPdEphY0xDOUIwY2dRU0JYK2tQdDVC?=
 =?utf-8?B?bnpwbXVoRlhFOEVoSENBK0kvTC9peTFYSXcycmwrbGI3ZGJMQkhIb1FOMFpu?=
 =?utf-8?B?ZDA2MWVEQTFnd1VDU3VKRjNhcGowMXF5Q0hscW0yeHdNNTJrNVB3VXlEL012?=
 =?utf-8?B?Q3V6bmVRZjRobGxPK0UwMWVLSjR3L0huMmR3S1o3enNSOU16empQcnpKUWt4?=
 =?utf-8?B?WEZRYnp1ckRXS3pCK3ovNnpCL2Zka3gxUmgyV3FhcExyTzdpZ1Vxd3VDajI3?=
 =?utf-8?B?d2laZXBQYzQxYmN0K1UzK09sUzBEbHRiMEV6YzZaSC9tRVltQjQ4aXN6RGVT?=
 =?utf-8?B?cGh5L2JQeWI0N2R3aE5lcURjVWlPZnlJNERpL2pnTm0xdW0yUmpNeXdVRkRH?=
 =?utf-8?B?M2FaeEN3bmhZeTN6Uk9yMzVIbDdRTHc1eXY0UXM5bG96L2tjYllxQTJJZy9S?=
 =?utf-8?B?bDVpbWJybXZWZU9udHlpY0lSSGJpYnpRRzJDc0w3NDNSNzlwUjVxeUtvamN2?=
 =?utf-8?B?dGpZOEVtZlVLSVJYcThUcVFnLzkzWVdtd1ZvbzB5VEVlMUhhOUFWbnh3Skpi?=
 =?utf-8?B?SnR1dWtEdC9wVHB1dVduT3d6Z3hBczRSTmJEdUs0V21YQTJLWWNjcVdOeC9v?=
 =?utf-8?B?WjNLZ3pOUTluWDZmdEFjWnRJSW5XREJtV2JhYUdJdE9YbjZyL05GMTNxdmpi?=
 =?utf-8?B?bjZvbGlQb3NJbzdQclJ0OVpUZHErNjdsaDRKd0xZanFQK0J4eVVBNkhMQVJm?=
 =?utf-8?B?WkdBUmZsUFBJK1lKVHlqWTRJNUZHcXMxeVhocGFocGE5NjZKbFFPc3IrT0NE?=
 =?utf-8?B?eFVWdm1STGpURnpkbGx6ZXFUaEpwaktadVM0MllEZG93TnBqdTRmbmt6OGp0?=
 =?utf-8?B?SXNnZmdub0tCYW5saGpZZCtCN25lbWZRSDk5ZkpSa2xMSHgveWFBczlaQzJk?=
 =?utf-8?B?SS9WOUYvKzJ2dlpFWEZ2WkNIaUVBWXRLMktWMlFMTjNXd1o4R3ZUY1Y4d1du?=
 =?utf-8?B?bE5iMTR1ejROZUxDZTBCMzcxN1VPWm10SFBFZlc0K3Vqc0RRUnRHYTBqSXRZ?=
 =?utf-8?B?clhCbXpOQ1E2bzFsckozcy8rNUs3OTI2TTQ0ajh4bnRMNTE4aHBoMk1vc3J3?=
 =?utf-8?B?b0c3VEpMM3NRWEUyNk9CT09wcXUxN1lOTitDWlFQUmg3NUFZUUxpbjNNdGVT?=
 =?utf-8?B?TXhLNHVhVkYzVjk5QXJVeGticHRPa2lZcHpqYTVsOGV2ZmNReCt0YS9pTEw1?=
 =?utf-8?B?WnhNWXpMVERkN0hTTU40Z3J4YmEzdmpIL204NDhVQXJSV05WRXhVR2N6UjAy?=
 =?utf-8?B?MEQxWnFnZFI3UzR5NWFCcDZUbVZjY0hxdEI2dG5IaUJBb2MyditobitVMnNW?=
 =?utf-8?B?MGFWNGlTUlY5ZWg3MlVKc3pFdDAzaEdXWm11NVZkcVp1dWhCU3BDeFM5eHBo?=
 =?utf-8?B?OEVSSTBTbGpFWXdlQmNSUmJtdldqcFZ1ZndtZ3VYSUZxUXllTVFMSlJEK0d0?=
 =?utf-8?B?Z2JtRXBFaHVnVFArcElPN0dqdVZIckhrSHpkYy9YYzV1N2dPZFIxSjFBQXh5?=
 =?utf-8?B?V3J5Q1haZnNsbkdxdXFyU3FQai9jOEZuMTlUMW5JTzJHSXhNRVZjSy9OSXJ1?=
 =?utf-8?B?aE50eGljREdrbmV1aHN1Y3VuR2k2d3RCQUJvVVFmQk1qUlJGTGRjaVR4L2pU?=
 =?utf-8?B?Q2Y5UGxoR3dBdmdrN0hhMEhTbnVXSVU0ZERnV2FhVmpNVjFYcmgycm1GaXpt?=
 =?utf-8?B?OTBrOUR6bFdRREVPTzF4VVNYRmtFMXhQLzh3MDBMcEU4dzVDTEZUN2laT1JN?=
 =?utf-8?B?K2IrMUsxSzFtaVBKcldGdTZaTWpkS29tWHd6Sm5sbHpjQU5VaGw5endRS1Ay?=
 =?utf-8?B?WFE1eG5CMUp0Sk5oQlpiU3krYUhhUWtOQXpKSks1SjdteEF2ZUJPUFJqZlFw?=
 =?utf-8?Q?bly/6+OXcEc18DDW+v1MBJ8PF+Va70=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6879.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFVnVE40UlIxckxvRmRpY0U5SllCYmVDQ0dSSGpqUlN2V0piTG04T1BZcUFB?=
 =?utf-8?B?M29tYjdUQ2lkQ1daanlqMzFyMFFSRUYyL0dRNE5sYkFiZzhpTzZXV3AvSldv?=
 =?utf-8?B?S0NlZ0JXL0FiVTBhSVlzUDNnK2ozbEh1OFQ0T2QwMTZWWVZ0S3NiWitoRzU1?=
 =?utf-8?B?N3NMMW9pL3RXMU94QmdIOFUyM0FTcGdKNGJaZERyMjdMb2gySGQ4eTJWb0dk?=
 =?utf-8?B?WDVnQlFkQkxwTUNvSTN2bWtmWFBhamRqdXJKUWxTRXZCRERncTk1eU1UU0Jr?=
 =?utf-8?B?dHRhMnh4eTcrZzFpRnhLRzFQYjZHd3N4aFlnbmU1d2RjU21SQ3JWOFZxTmZi?=
 =?utf-8?B?dnh4UENXWVZJZVZFck5veHl0c2JXcUlOS2t2VjFPQWFNQlBRZmhtMGsrb2or?=
 =?utf-8?B?WWJRcXNuYkdWMkhKSGlmbFVTU3BLUDk3M0FkVlhjQ01xUEx3K0lDTkMzYUxZ?=
 =?utf-8?B?Wi9vUkVWcjJPaS8xWmg4NTNXSjl3eFNORHg3UkZXd1FvYUdKQ1I1TnlHV2c2?=
 =?utf-8?B?aktRUXI1SGpKV2ZVSG53elF6MmQrVTgzUFBTcEI1Vk1SZFFtSEYzalVJcVJh?=
 =?utf-8?B?MC9nY0JBREIxRFcrM05oZjBmZkJ2VVpMTm9pTlZYSzFpUjZEV0k0N25YbVls?=
 =?utf-8?B?NXpsWWZldFhrQS9vZ2dMYXlRK2hjTy9DeFZqZm53SFU2V0tpMW9uN0xHanFV?=
 =?utf-8?B?WUd3ZVBPeHhuZkE2MWRFb2RXOStjRStFelpVdHRORHdlbUdydDA5QTNTeHNv?=
 =?utf-8?B?VzE3a08ybm9YWUFLWkFhdEFIYWxEUXo3THlnWTVWaXp0cW5RVjBBR054OFRS?=
 =?utf-8?B?bDRab29WVGIwbW13VTVGL3lrUktZc0hjcE5LTmpwYUNTVVBHRFh6MWNZNGl1?=
 =?utf-8?B?ZFpDZkFna3lyLy9wM1RCemdvWUlGYkV4Qjlaa3R6MzRIK1hlalplL3RMWTB4?=
 =?utf-8?B?WlFxRDBkN01OM2hxRkd5dVg4aklDeDI2bENsR3JZaWdmVnJQbEl5QU1JOVRa?=
 =?utf-8?B?SUhMSDhqTS9QaCtJcU1TakRwQ2RnVjM4UFh4R3lCbnliYjlBOEdlVGdEQ0Vl?=
 =?utf-8?B?NG90OWU5bndNY3IxWlBwSW5Sd1YwUUhEYUxsT2wxRkhqelNsdlVPYW9udzM4?=
 =?utf-8?B?WUIxZG55ejJPb3lUZkpoa0k4amVlcEp3bExGK0RuUVIwQXZ6T2k1NXpKaFRS?=
 =?utf-8?B?UlRCM3hMOG5ER1pPYWl4WlV0VFFPdld5d21WajlkdDQ2Z0xwVUdDVE16RHYy?=
 =?utf-8?B?cVZRK09DeGlQL2VsamprUXN3ekV3L0xCK1krU2RKcmxwSkZPcnF1c1R2ZWZK?=
 =?utf-8?B?blhqUGpBUjRGcEZqeDB0ZDl4SHVaV21rYjBHZGJaTUU5Y3Y3QU4zYm5McDl6?=
 =?utf-8?B?elRJaUtaeXVSbys5UDRveHZWVHplTE5uLzc3a05kNEptVHExWEFvNHRyLzB4?=
 =?utf-8?B?Qkw0ZkdjMHFIaEZTUXQ3RmJSUkJpSG5qTm1YWXJSTkVkeTVVUUJjb0tVOXVM?=
 =?utf-8?B?NU15Qlp5UHhvWWZvTlJ4V3ZIKzYzSkFDNjlxRHgyejkwblNTbUhWaGZSUS9v?=
 =?utf-8?B?dHZpZW5SUW51Qi80THFIUXlkK0RQKzNyMEtnYkFjaGZON0lDN25UUk8xNjVt?=
 =?utf-8?B?czBpVnpmZ05nR1pDemE3T2tuVy9GMHRwWkVVaDdPeVJHTldXRmttS2c0Vkhr?=
 =?utf-8?B?bThUc0YwVXR4MGhYclZGQmxnV0VIYWZPbFIzV3BIVlUrSDFnQUNGVnRkaGRn?=
 =?utf-8?B?Uk5hb2doOFlHMFdXWHFhcnFFOGFCVU0zLzdwYkIyRnd2VW8rQ3Y4aEpwZHlQ?=
 =?utf-8?B?bUJrMlM1V1pLb0JkQlA5cHZ0blZMa0IrTWJGVXdSME5XbDBlVk01cHVFLyt5?=
 =?utf-8?B?dk4wVS95Z0lOcUFTYm43cmlZNEtsc3J4M1Y1TDJaT2hnZmZKdXhTb1QreERk?=
 =?utf-8?B?QTRlY1ZLVXlmTnE4bTRmenk1VWQ5OThiMEp1cU1IcVFNenFaMHFnNVJpYkNy?=
 =?utf-8?B?L21VanpNRVpJS0gvMUdEL3REelpVenluNzdCSG5JTXpDek1mc1lVS2hDUVJJ?=
 =?utf-8?B?SDNpdHpWazRYN25kNWw2Y3hrZTBVVDZTY0NFaFhHSTdwQVNKakdVS0xRWHMw?=
 =?utf-8?Q?3Mw/Z6JnIvgRKr2Kmf+U5LShY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9e4ee7-fea7-4338-cb8b-08ddb8434233
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 02:01:56.8859 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V7aWuewKH/ZX1BhCbqo0e/EvjrBOwSc+BwgJ7qqK0HKSRf6qaOpoJdZ/zKvdRJ9geqaHTCIHkialFLQqhEgzHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8208
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

SGkgRG1pdHJ5LA0KDQpUaGlzIGlzIGdyZWF0LiBJIHdpbGwgdGVzdCB0aGlzIGFuZCBpbmNsdWRl
IHRoZSBmaXggaW4gdGhlIHBhdGNoLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IERtaXRyeSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20+DQo+
IFNlbnQ6IE1vbmRheSwgSnVuZSAzMCwgMjAyNSA3OjAwIFBNDQo+IFRvOiBLaW0sIERvbmd3b24g
PGRvbmd3b24ua2ltQGludGVsLmNvbT47IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IENjOiBLYXNpcmVkZHksIFZpdmVrIDx2aXZlay5rYXNpcmVkZHlAaW50ZWwuY29tPg0K
PiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCB2MiAwLzJdIFZpcnRpby1HUFUgc3VzcGVuZCBhbmQg
cmVzdW1lDQo+IA0KPiBPbiA2LzE4LzI1IDAxOjQxLCBLaW0sIERvbmd3b24gd3JvdGU6DQo+IC4u
Lg0KPiA+PiBIYXZlIHlvdSBmaWd1cmVkIG91dCB3aHkgMTBtcyB3b3JrYXJvdW5kIGlzIG5lZWRl
ZD8NCj4gPg0KPiA+IFtLaW0sIERvbmd3b25dIFVuZm9ydHVuYXRlbHksIEkgZG9uJ3Qga25vdyB3
aHkgaXQgZmFpbHMgd2l0aG91dCB0aGUNCj4gPiBkZWxheS4gSSB3YW50ZWQgdG8gbmFycm93IGRv
d24gZnVydGhlciBzbyBlbmFibGVkIHByaW50ayBkdXJpbmcNCj4gPiBzdXNwZW5kIGFuZCByZXN1
bWUgYnV0IGhhbmcgZGlkbid0IG9jY3VyIHdpdGggdGhlIHRpbWluZyBjaGFuZ2VzDQo+ID4gY2F1
c2VkIGJ5IHByaW50a3MuICBJJ3ZlIGFsc28gdHJpZWQgbW9yZSBkZXRlcm1pbmlzdGljIG1ldGhv
ZHMgdGhhdA0KPiA+IG1ha2UgaXQgd2FpdCBiYXNlZCBvbiBzb21lIGtpbmRzIG9mICJzdGF0dXMi
IGJ1dCBub25lIG9mIHRoZW0gaGF2ZQ0KPiB3b3JrZWQgc28gZmFyLiBJZiB5b3UgaGF2ZSBhbnkg
c3VnZ2VzdGlvbnMgb24gcG9zc2libGUgY29uZGl0aW9uIHdlIGNhbg0KPiBjaGVjayBpbnN0ZWFk
IG9mIGp1c3Qgc2xlZXBpbmcsIHBsZWFzZSBsZXQgbWUga25vdy4NCj4gPiAxMG1zIHNlZW1zIHRv
IGJlIGNsb3NlIHRvIG1pbmltdW0gdG8gbWFrZSBpdCB3b3JrIDEwMCUgZm9yIHNldmVyYWwNCj4g
PiBkYXlzIChydGN3YWtlIHNsZWVwIGFuZCB3YWtlIHVwIGV2ZXJ5IDUgc2VjKS4NCj4gDQo+IFdh
cyBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgaGFuZyBhbmQgZ290IGEgY3Jhc2ggYmFja3RyYWNlIHdp
dGgNCj4gbm9fY29uc29sZV9zdXNwZW5kOg0KPiANCj4gWyAgIDYzLjgyNDgyN10gUE06IHN1c3Bl
bmQgZW50cnkgKGRlZXApDQo+IFsgICA2My44MjUwNDFdIEZpbGVzeXN0ZW1zIHN5bmM6IDAuMDAw
IHNlY29uZHMNCj4gWyAgIDYzLjk5MDk1MV0gRnJlZXppbmcgdXNlciBzcGFjZSBwcm9jZXNzZXMN
Cj4gWyAgIDYzLjk5MjQ4OF0gRnJlZXppbmcgdXNlciBzcGFjZSBwcm9jZXNzZXMgY29tcGxldGVk
IChlbGFwc2VkIDAuMDAxDQo+IHNlY29uZHMpDQo+IFsgICA2My45OTI3NzVdIE9PTSBraWxsZXIg
ZGlzYWJsZWQuDQo+IFsgICA2My45OTI5MDJdIEZyZWV6aW5nIHJlbWFpbmluZyBmcmVlemFibGUg
dGFza3MNCj4gWyAgIDYzLjk5NDA5OV0gRnJlZXppbmcgcmVtYWluaW5nIGZyZWV6YWJsZSB0YXNr
cyBjb21wbGV0ZWQgKGVsYXBzZWQgMC4wMDENCj4gc2Vjb25kcykNCj4gWyAgIDY0LjAwMjE4M10g
T29wczogZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0LCBwcm9iYWJseSBmb3Igbm9uLWNhbm9uaWNh
bA0KPiBhZGRyZXNzIDB4MmFiZTBlYTI2ODQ3ZmIwODogMDAwMCBbIzFdIFNNUCBOT1BUSQ0KPiBb
ICAgNjQuMDAzMTcyXSBDUFU6IDkgVUlEOiAwIFBJRDogMTc4IENvbW06IGt3b3JrZXIvOToyIE5v
dCB0YWludGVkIDYuMTUuNC0NCj4gMDAwMDItZzAxMTE3YjQzNzNiMi1kaXJ0eSAjMTIzIFBSRUVN
UFQodm9sdW50YXJ5KQ0KPiBbICAgNjQuMDAzNjE0XSBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5k
YXJkIFBDIChRMzUgKyBJQ0g5LCAyMDA5KSwgQklPUw0KPiByZWwtMS4xNi4zLTAtZ2E2ZWQ2Yjcw
MWYwYS1wcmVidWlsdC5xZW11Lm9yZyAwNC8wMS8yMDE0DQo+IFsgICA2NC4wMDQwMzZdIFdvcmtx
dWV1ZTogZXZlbnRzIHZpcnRpb19ncHVfZGVxdWV1ZV9jdHJsX2Z1bmMNCj4gWyAgIDY0LjAwNDI4
MF0gUklQOiAwMDEwOnZpcnRxdWV1ZV9nZXRfYnVmX2N0eF9zcGxpdCsweDg2LzB4MTMwDQo+IFsg
ICA2NC4wMDQ1MTVdIENvZGU6IDAxIDY2IDIzIDQzIDUwIDBmIGI3IGMwIDhiIDc0IGMxIDA0IDhi
IDQ0IGMxIDA4IDQxIDg5IDQ1DQo+IDAwIDNiIDczIDU4IDBmIDgzIDk2IGQ3IDIwIGZmIDg5IGYw
IDQ4IGMxIGUwIDA0IDQ4IDAzIDgzIDgwIDAwIDAwIDAwIDw0Yz4gOGIgMjANCj4gNGQgODUgZTQg
MGYgODQgNWEgZDcgMjAgZmYgNDggODkgZGYgZTggNDYgZmMgZmYgZmYgMGYgYjcNCj4gWyAgIDY0
LjAwNTIyN10gUlNQOiAwMDE4OmZmZmZjOTAwMDBiNTNkOTAgRUZMQUdTOiAwMDAxMDIwMg0KPiBb
ICAgNjQuMDA1NDMwXSBSQVg6IDJhYmUwZWEyNjg0N2ZiMDggUkJYOiBmZmZmODg4MTAyZDU4YTAw
IFJDWDoNCj4gZmZmZjg4ODEyNTUzMTRjMA0KPiBbICAgNjQuMDA1Njk4XSBSRFg6IDAwMDAwMDAw
MDAwMDAwMDAgUlNJOiAwMDAwMDAwMDAwMDAwMDA4IFJESToNCj4gZmZmZjg4ODEwMmQ1OGEwMA0K
PiBbICAgNjQuMDA1OTc1XSBSQlA6IGZmZmZjOTAwMDBiNTNkYjAgUjA4OiA4MDgwODA4MDgwODA4
MDgwIFIwOToNCj4gZmZmZjg4ODg1YjQ3MGI0MA0KPiBbICAgNjQuMDA2MjczXSBSMTA6IGZmZmY4
ODgxMDAwNTA4YzggUjExOiBmZWZlZmVmZWZlZmVmZWZmIFIxMjoNCj4gMDAwMDAwMDAwMDAwMDAw
MQ0KPiBbICAgNjQuMDA2OTA3XSBSMTM6IGZmZmZjOTAwMDBiNTNkZmMgUjE0OiBmZmZmYzkwMDAw
YjUzZGZjIFIxNToNCj4gZmZmZjg4ODEwMzJkMDU2OA0KPiBbICAgNjQuMDA3MjA1XSBGUzogIDAw
MDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZmZjg4ODhkNjY1MDAwMCgwMDAwKQ0KPiBrbmxHUzow
MDAwMDAwMDAwMDAwMDAwDQo+IFsgICA2NC4wMDc1MTFdIENTOiAgMDAxMCBEUzogMDAwMCBFUzog
MDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMNCj4gWyAgIDY0LjAwNzczMl0gQ1IyOiAwMDAwN2Vm
ZWRjNGQzMDAwIENSMzogMDAwMDAwMDEwNTZlOTAwMCBDUjQ6DQo+IDAwMDAwMDAwMDA3NTBlZjAN
Cj4gWyAgIDY0LjAwODAxNF0gUEtSVTogNTU1NTU1NTQNCj4gWyAgIDY0LjAwODEyM10gQ2FsbCBU
cmFjZToNCj4gWyAgIDY0LjAwODIyM10gIDxUQVNLPg0KPiBbICAgNjQuMDA4MzE0XSAgdmlydHF1
ZXVlX2dldF9idWYrMHg0Ni8weDYwDQo+IFsgICA2NC4wMDg0NjVdICB2aXJ0aW9fZ3B1X2RlcXVl
dWVfY3RybF9mdW5jKzB4ODYvMHgyYTANCj4gWyAgIDY0LjAwODY1NV0gIHByb2Nlc3Nfb25lX3dv
cmsrMHgxOGEvMHgzNzANCj4gWyAgIDY0LjAwODgyM10gIHdvcmtlcl90aHJlYWQrMHgzMWEvMHg0
NjANCj4gWyAgIDY0LjAwODk3MV0gID8gX3Jhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKzB4Mjcv
MHg1MA0KPiBbICAgNjQuMDA5MTc2XSAgPyBzcnNvX2FsaWFzX3JldHVybl90aHVuaysweDUvMHhm
YmVmNQ0KPiBbICAgNjQuMDA5MzY5XSAgPyBfX3BmeF93b3JrZXJfdGhyZWFkKzB4MTAvMHgxMA0K
PiBbICAgNjQuMDA5NTMyXSAga3RocmVhZCsweDEyNi8weDIzMA0KPiBbICAgNjQuMDA5NjYyXSAg
PyBfcmF3X3NwaW5fdW5sb2NrX2lycSsweDFmLzB4NDANCj4gWyAgIDY0LjAwOTgzNl0gID8gX19w
Znhfa3RocmVhZCsweDEwLzB4MTANCj4gWyAgIDY0LjAwOTk4Nl0gIHJldF9mcm9tX2ZvcmsrMHgz
YS8weDYwDQo+IFsgICA2NC4wMTAxNTZdICA/IF9fcGZ4X2t0aHJlYWQrMHgxMC8weDEwDQo+IFsg
ICA2NC4wMTAzMThdICByZXRfZnJvbV9mb3JrX2FzbSsweDFhLzB4MzANCj4gWyAgIDY0LjAxMDUw
N10gIDwvVEFTSz4NCj4gWyAgIDY0LjAxMDYxNl0gTW9kdWxlcyBsaW5rZWQgaW46DQo+IFsgICA2
NC4wMTA3ODVdIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQ0KPiANCj4gPT0N
Cj4gDQo+IFRoZSB0cmFjZSB0ZWxscyB0aGF0IHZpcnRpbyBxdWV1ZSBpcyBhY3RpdmUgYWZ0ZXIg
aXQgaGFzIGJlZW4gcmVtb3ZlZC4gVGhpcw0KPiBjaGFuZ2UgZml4ZXMgdGhlIGNyYXNoLCBwbGVh
c2UgdGVzdDoNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRn
cHVfZHJ2LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmMNCj4gaW5k
ZXggMDNhYjc4YjQ0YWIzLi40OGJiMjFmMzMzMDYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlv
L3ZpcnRncHVfZHJ2LmMNCj4gQEAgLTE4Nyw2ICsxODcsMTAgQEAgc3RhdGljIGludCB2aXJ0Z3B1
X2ZyZWV6ZShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikNCj4gICAgICAgICBmbHVzaF93b3Jr
KCZ2Z2Rldi0+Y3RybHEuZGVxdWV1ZV93b3JrKTsNCj4gICAgICAgICBmbHVzaF93b3JrKCZ2Z2Rl
di0+Y3Vyc29ycS5kZXF1ZXVlX3dvcmspOw0KPiAgICAgICAgIGZsdXNoX3dvcmsoJnZnZGV2LT5j
b25maWdfY2hhbmdlZF93b3JrKTsNCj4gKyAgICAgICB3YWl0X2V2ZW50KHZnZGV2LT5jdHJscS5h
Y2tfcXVldWUsDQo+ICsgICAgICAgICAgICAgICAgICB2Z2Rldi0+Y3RybHEudnEtPm51bV9mcmVl
ID09IHZnZGV2LT5jdHJscS52cS0+bnVtX21heCk7DQo+ICsgICAgICAgd2FpdF9ldmVudCh2Z2Rl
di0+Y3Vyc29ycS5hY2tfcXVldWUsDQo+ICsgICAgICAgICAgICAgICAgICB2Z2Rldi0+Y3Vyc29y
cS52cS0+bnVtX2ZyZWUgPT0NCj4gKyB2Z2Rldi0+Y3Vyc29ycS52cS0+bnVtX21heCk7DQo+ICAg
ICAgICAgdmRldi0+Y29uZmlnLT5kZWxfdnFzKHZkZXYpOw0KPiANCj4gICAgICAgICByZXR1cm4g
MDsNCj4gDQo+IC0tDQo+IEJlc3QgcmVnYXJkcywNCj4gRG1pdHJ5DQo=
