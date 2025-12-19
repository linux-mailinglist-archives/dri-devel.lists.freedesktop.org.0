Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B939CD1C88
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 21:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E5A10F0C7;
	Fri, 19 Dec 2025 20:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VN2Tw3Ye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA04A10F0B0;
 Fri, 19 Dec 2025 20:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766176712; x=1797712712;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Gks6iIHzeDuTrwf2i53d7acHvl4q6E0OzfnJdy8+c4w=;
 b=VN2Tw3YecPnGkz80Oue9gpzbNnloCcRRiXQePTWfvDXhmqAO9Znjdr9t
 jKBhyLEPpaSjaCkmP6XETpLZpRo8HSgGZ1jo+76cyqcjJKzbfo+myCa22
 prs+goD2QGhPbO8JVEO3GcU3kZ37cGj9dlGg7aau1kDArUICVC1WikU9d
 OFcpHlvP7sHd4sSXSHXdoe1jPObw7wo+bFVePE4kFJhvIW8/dthIAn2n8
 NCkamHwWy3V+9T8Yb2Jigtyg2qZaLQAadXiENjr1KsdrisjB16Ow+Fnfi
 vbZ7BEodPeHcogceSuvTdnicDT8CTNmeoGqJb8GkUAdI2w/6nI4lhAqDR Q==;
X-CSE-ConnectionGUID: qpY/rJOHRaCE+pWVnA1sAA==
X-CSE-MsgGUID: NSkVjPy6TEqQ9XutDiG7eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68034380"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="68034380"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:38:31 -0800
X-CSE-ConnectionGUID: /+D6kQevRPmdiIMLo2dp9A==
X-CSE-MsgGUID: 4lgSGQPTSF6X/sl1UCDkMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="222368123"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:38:31 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 12:38:30 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 12:38:30 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 12:38:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nChKWtw7uppZMe985+8vJmXxe6V6PeVUNZr7QgG4GHXijD5OkVU5c2rqVnlSHn9XOPLYSY9ZXaYsOtjrBIEpAsEeENkbaNjv13WdT5/452A5GqydutRVUNTM33Q3A6+AzUs4aJZN9cRTyweE6pwgJ6vJHLe55Kbo3vwfUr8dLwpP/Qk6msxLOrXEVTtRpLmt4PcRgTT/mf1eoDy4r3luJ/o/Sehks9VXPx0RZKa0Vm/kNwTJzbcF1JeV2sTif25KcMPY2HPZLC1yANlGSF4dNH6qFeS2FDGpqzrAToAWOdElR/CORvXiIs5/Krom+YzZi1kT8TT5oOGCclDCqRySng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gks6iIHzeDuTrwf2i53d7acHvl4q6E0OzfnJdy8+c4w=;
 b=jkOmw30rJ0Pa6NCP4UZOf/t+LIyVH75X0E65QXUy2HgubAgrLID+yIIGJmQZeOsbiQIwmTsiEcEzoOOilDtp9mJtqBj+uY3WOeIl8xW4cB7nfNGVGGs+GNZ7Nlvp4BGy44VDfh3HvMAgMdOReqCPkWxKi3zxoyfO7FETSR03nOQZaXHPWODgyYNQFi85ClqrvqefWm6Om3e1wNMEXUZA07LYGELZP5+ZWv8Rl84zL1er6SaLXGIxK2SjtVLMCcjLwFZZ/mEvd7NOjdiDFnGV909VtcLBGFpc48gq6zdxn/pWERkTJOwshHv1vK6dwXeVB3Cdvw/2gFQSaqJmM/WTJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DS0PR11MB7482.namprd11.prod.outlook.com (2603:10b6:8:14a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 20:38:28 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 20:38:28 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Grzelak, Michal"
 <michal.grzelak@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [RESEND 1/1] drm/buddy: release free_trees array on buddy mm
 teardown
Thread-Topic: [RESEND 1/1] drm/buddy: release free_trees array on buddy mm
 teardown
Thread-Index: AQHccR5Seq9sFNfVX0KHf/eqmloKobUpa9/Q
Date: Fri, 19 Dec 2025 20:38:28 +0000
Message-ID: <DM4PR11MB54560DF369537BCE07175297EAA9A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251219193237.1454565-1-michal.grzelak@intel.com>
In-Reply-To: <20251219193237.1454565-1-michal.grzelak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DS0PR11MB7482:EE_
x-ms-office365-filtering-correlation-id: 716d5dda-bca2-49c6-496c-08de3f3e90c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VmgyVCttRUxXRnpuZGQ4UDRqRUMzTVEzZzQza2VuOWJielR2YWxhL2ZNdUYz?=
 =?utf-8?B?NjZPOGNRN1d6T3p4SmJIZjM1bHlUZTNnQVFBbDI3bGh2Y0V1N2xXMGRoejdk?=
 =?utf-8?B?Yjd4U3B0R20xbTBwQmtSRnduV25HWVk0cFZYV00rdGw3UDNjR0tvTGZ5UFN6?=
 =?utf-8?B?cUNkV0xVU1NIanpzTnp4M2o4Z1lScmdoa2pQR0tqdlhBUUNLN09IRlZEZ2Z4?=
 =?utf-8?B?TDZvLzVLWm5FSGJJR1hSSnNRYWhYT002WDAvT21wNVFzQXkxeEtTcUtpLytN?=
 =?utf-8?B?VlRTSmRzTW9zUU80ZVJIRE14U3NYTlF4WWJRTXcwVVZqeHBNcUhhUFFlbjZG?=
 =?utf-8?B?K3RVQk14TWVzbi9IRm0xMXR1eTJDRkxUWXJCbG4yWUhQanplQ3JGaFk0a2Fr?=
 =?utf-8?B?MlBzbFZKYzNwYW9MYjQ1K0ladHJkYStTR2xxS3pRSE5oOTl2cW96OEFYTmxq?=
 =?utf-8?B?UjdxRUlLaEhKdTVuYUI2NDVmeGQvWGphUThjMjkzMHBHNzVrK01LTW9yNHZG?=
 =?utf-8?B?eEpkNDJpQjFGSkpUV0JFbVc3OFJKNjJqdkQ0OENUeXpnTmNiTDJkN1JkSG5I?=
 =?utf-8?B?Q20rbmp1eDFpS255SWp5MXl1ckdVSFBONmZ2QnhGSUxFc1pmZk5rTDQyMFlz?=
 =?utf-8?B?MVdXY3R2Vmp3Y1ZGb1dnRG9wZEhVTU8yN3AzWkZpK1NQc2FCclRseEtVVnBS?=
 =?utf-8?B?SFV6RDhRckUvRlR5V1VtT2dWd20yMkNNOWcrdi8yUU5hL3pWUTlHWWhnSXhB?=
 =?utf-8?B?elAwZVNDQkFHOGdBUnRsdU9uZVdLZG9sMklRUlRSaHJ6RVhwUE4vOFE4SU5C?=
 =?utf-8?B?Tks5QktYRWxqRFdIblFZNld3R2crbmZJenRhNDBSTUJ6cDZpcTRXbjNRRWN0?=
 =?utf-8?B?alpWNFFXVlpKUktrZ1FKWmhDR1V6YlU5YWh3SDVOTi9MTjdtTlAvTUlwT1E3?=
 =?utf-8?B?TjUwenhpR0J1eDZrOFFjN0xpeGpjY2lzWldFZEt1WEtycUxrYW16WE1GM1NM?=
 =?utf-8?B?c0VrQS9ocDhCVWVzWVNTTnJlRHg0cE1UV3NXSUpXOHVEM2ZsWFE4d01RWi8w?=
 =?utf-8?B?SUdxU2xialVpa1pQbktiMGRwUUpHZlNKSXpiVU9Bd01sdGV5TVV6RDNha2l2?=
 =?utf-8?B?elBrUFFGSUFNT3YvU3hmVUc4YkpIWGNkY25UckJJeVlTZFNQQ0Z4MVF6WElP?=
 =?utf-8?B?RDdhNmN4RWtpSzdYTkxmMFd5MDd6N1FITTh3aDVvcUxTSU40QlZEUVZRQlJU?=
 =?utf-8?B?S3p0V2RBTTNoZVFaQWdXNkdGY3o2ampsKzdpN0UvcXVUQ3c3RVYzVkJtdnhF?=
 =?utf-8?B?N05KSjdua2xGY1U0Qk9wR3FsVVZjb2ZROXRhVVc2WkorbmZkQ2E0MUhWNVMv?=
 =?utf-8?B?NzhUNm1KbzRrbHZ4OUQ4bkZvandKdFlycThPbFNmcXQweC9HOWtudTFFRGky?=
 =?utf-8?B?S2d2TGdUZFV1NmlnYitEUnlXbDQwVDZ4OFg2SEorTmtJU25tZy8yVGZUTnpw?=
 =?utf-8?B?NDE4TjJ5SW1ISE5udkZrNHhNOStZMnBacHdtdVNtY0pNMTRoR1pvZHdMbFN4?=
 =?utf-8?B?c0ZCRU1OS21aRUhmcFM2ck9wdENaaUY5aHNQcmFNYTNOYnRDVTR4L3Z6NFJY?=
 =?utf-8?B?OU1wQm5PUjk0bWk1NURmZjA3eGMxUUR0b2VjY3lBVkpRcys1WmRYQXY4bDl3?=
 =?utf-8?B?S05nNHBIalZ4M2ZOVkQvbDExZXd4Unk5bGh5OHY3cFRjOXlWS256M0wyMXc2?=
 =?utf-8?B?NWVpZlZTVndyUlZBVmVPU3VDcEU5dWVzRFIxVDRsRkg1TDF1bUpiWStpSnkw?=
 =?utf-8?B?dUNnbndZejBOTDc5YjRwZWRXN1hNTEtGUWZXQkw5NHJPaXZVNGg0bTV3amFU?=
 =?utf-8?B?OHBycWFZUThuQnJMeDFkaW80Tk04WnN4ZWFMS1paZ3NSZTBtdVFkaGluTFJG?=
 =?utf-8?B?cEtEWXE2SHhxMVM1NkRvbUl3NXR1cFJEYURWcUdSeVorQ3JLelkzb1NLYWw2?=
 =?utf-8?B?UW1YaFRyZ1c0RnpsVm1COGg3aXMyekhMcHNqb1VlUExPV3BNd1dSMEoxSG9Z?=
 =?utf-8?Q?Rq9ZcU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGVEMXJhOEhvek9FRi9xSzZMZmt2WVExNDRRcFRiT1JSNzU4UlVydDFHMWt5?=
 =?utf-8?B?MFA5T3lBYzhDTFN0dENQekYxR3Q2OENtdm95RVF0L2x4T0RNT2I1M0hXai9z?=
 =?utf-8?B?cjZVaUkxTEFlYXprV3REUHVmSkNwYXFOelhabEg5NXZrU0xwcmRoWHZ4ZUlU?=
 =?utf-8?B?T0QyMTZ0d250ZjFaRVZpNlFYdXZWRFBPUTFPL05jK3lyOGtIZUhKYThrRkVx?=
 =?utf-8?B?cmRiMmFZcHlpUmpya1V3bWUwTjZIM2pmRWx5UWFobXYvZkx1UlFmdGVRcDJ4?=
 =?utf-8?B?M3BEaEhNNUhoeU1raUhYb1B4dDVhNlR5Tng1T0FhTjJxM0NWQ09mS08zVDl0?=
 =?utf-8?B?M0tlL0dMZWtDcWdrQk1QTi90VkRSOHBlRWd1T29PWm9lUTNCVWlYTjJYRmpy?=
 =?utf-8?B?dm5CZ3RhZ1F4YmxXNDhwdGU4M24yUk55MnlITUFxVXBRNEoxL2wwOXJMMVJx?=
 =?utf-8?B?ZVJvaURmNUhBRU1MbGNaZ0FjR215MXF0NEY0NDJNMktKa2J5UnBmWXJka3lp?=
 =?utf-8?B?cTVDM0xYM3JudUVTcHk2bmlPNk9rTG9DMGN3OXp1RVNQck5ndDl4UlBzOTdp?=
 =?utf-8?B?K2lITmxNMUlFTDNKREhtNlQ1bG1aUEY2QVR5YXNMNm1rWitQcE5RNG1PSmR0?=
 =?utf-8?B?Y2ZjRVA0ZnhBQ0tRaktPcnZrSzREN2dya1c3U3Yrc2FKMHd0MUVxcnErb0ox?=
 =?utf-8?B?RlphTUt4eEt0bm93RjI1QnZ0aDUwRDRlRnMrQ25BU2ZPN0JBZ0lEdmtxM3ZJ?=
 =?utf-8?B?VmNVOVVwTHFIK0NBN3h1VmkvTDZ4T3JQV3R5MXR1TnllSzRQTGo1bnlsbnZH?=
 =?utf-8?B?RW5RRG5neFM0UDdBWkF6dEFhbGxnVHg3eEZaY2xReFlmbC9KTlZyY3NhV3Ay?=
 =?utf-8?B?OHRyNGxjQXFsZ3NXcGgwTjNuLy84M2Vaa0Fjd1pJVUVDSEg1WjhlU1VJS3RH?=
 =?utf-8?B?MWVDb1p6UEd2bVJ4eUFqZ2NnUmpGZ2pKdW9pNVUzNUtpZHFxanY1YkxMSWlj?=
 =?utf-8?B?VDNSWUR0Sm1tcXJSb2J2MzEyUWhyYjVZbWIyOFUyaU16MmZCN1BLOUFuKytU?=
 =?utf-8?B?QS9GSGtHaW02TlFtMnM2azRFazBWRjZZeGZMdmZEb1NzZ0lwYXV2MW1DK0NF?=
 =?utf-8?B?bXhRalJEQ1RmZ05tRHlIRmVha3RqNUNpVGt1TXFYdFgvc1R5bTZtUGltQ2hO?=
 =?utf-8?B?elBZTVJlaStjOXc0SXJMRzlGQ1NKTHlQWUQ3d1JhaUpWSWVLTXR6M1pCV28z?=
 =?utf-8?B?N3c4YkFPa0VXOU1ta3JhY1NBbTN6Tk1seVlKQ1M1ZVEvc0tjc3hFWmNqNnBa?=
 =?utf-8?B?bDJnV3pCWk50WGowbEZEZzVpSmc2ckFKSnptRnFSZEJ5MEk5SUZhRXYrTFEv?=
 =?utf-8?B?TzRTODVmVzVQT2pkQVFNeC95VEVHQU41Slk3bUtYNXlSUDBmWEFJUW5BdnFy?=
 =?utf-8?B?NDNhZDJpN1FmUk1ldWI4Z2RoUlhiZ0s0eWJqcW9EU0JsVmtqK0FFR0dBcW9W?=
 =?utf-8?B?aU5rTVBRZERGdVpicVh5dFpBRGxpVTUxbXdmbGRSWnhDS3BnUklpbGFqUjlO?=
 =?utf-8?B?V0F5SHhPM0hwS21FU3hwNHJORXovQXMyRFJXaU9XOWJ4NFJxemVONGV4SXM5?=
 =?utf-8?B?U0xacmNUYTZWamhHZkhmcS9sZjFrcFFyK1dmZThyTk4zazNSb1RPWFVYSmtL?=
 =?utf-8?B?NHF2TDJuaFIvTzNxRjNGL2NJQlBrclJEdWh3dWFlNC9pZy9nTVpxdm5oOGJE?=
 =?utf-8?B?d3JmMW9wUHlRd2U3bFRiREdncTEzRU9ucjhjd1dqNUF3eGVzeHBmallIK2kr?=
 =?utf-8?B?ampJb05HajZQY09NWFJkTzdPM3J5dEpKSm8rN2dRYVRSVzkxTUVKRHFPaFM3?=
 =?utf-8?B?WmlyeWdQcHJPZ2ZvVDc0VG82eEtQa0srMFVrd2xEL1pwcE51R04vOHBBbFFH?=
 =?utf-8?B?TkhkRlhLMjF1L2VDY1dxYXh2c1dPVVlicE51WWp5Uk4zQUVkUDVLYjA1V0Zu?=
 =?utf-8?B?ZEJ3WU0ydXlaRFZKS3JocURLQjhtRmplV1lsWnFWR29BcUhlenRTYW16aDlt?=
 =?utf-8?B?TXY5ZEZvZlpUcnM4SFZzNE1NbS9tbkNtUGl1NUNIZDZYNjRvdDFZNFNmaVFK?=
 =?utf-8?B?aCtKMDJsRmVPaDZQbjY0MjZtSTk5dnNyNVRnSCtJb2RLY2NmR0o2Skx1Tkhk?=
 =?utf-8?B?WndEVU8ya1JUMkFZRDl4eGN6VndDSkZTVkRpanFJRHUxQVNsaE5ETTgvTFJK?=
 =?utf-8?B?Y3FyMGRoTVk1ZUpMY3lsYWIzVXd5elR0U255VXB3NXhjWDEvVS8yeGtKcTRr?=
 =?utf-8?B?MVJDQTVoSllKVCs2dG5TMldaNmxjQkJtMmV5RDlmWGxUQXc3ZXU5QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 716d5dda-bca2-49c6-496c-08de3f3e90c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2025 20:38:28.2306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3hB9DiGhw0PdBKNu3eOwywVEbNeERfBFvmIF8s8lBRoYVVzEWMSOjc1xEUlbLcG/mQGccIVS3cbRIw0RxjPAPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7482
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

T24gRnJpLCBEZWMgMTksIDIwMjUgMTE6MzMgQU0gTWljaGHFgiBHcnplbGFrIHdyb3RlOg0KPiBE
dXJpbmcgaW5pdGlhbGl6YXRpb24gb2YgRFJNIGJ1ZGR5IG1lbW9yeSBtYW5hZ2VyIGF0IGRybV9i
dWRkeV9pbml0LA0KPiBtbS0+ZnJlZV90cmVlcyBhcnJheSBpcyBhbGxvY2F0ZWQgZm9yIGJvdGgg
Y2xlYXIgYW5kIGRpcnR5IFJCIHRyZWVzLg0KPiBEdXJpbmcgY2xlYW51cCBoYXBwZW5pbmcgYXQg
ZHJtX2J1ZGR5X2ZpbmkgaXQgaXMgbmV2ZXIgZnJlZWQsIGxlYWRpbmcgdG8NCj4gZm9sbG93aW5n
IG1lbW9yeSBsZWFrcyBvYnNlcnZlZCBvbiB4ZSBtb2R1bGUgbG9hZCAmIHVubG9hZCBjeWNsZXM6
DQo+IA0KPiAgICAga21lbWxlYWtfYWxsb2MrMHg0YS8weDkwDQo+ICAgICBfX2ttYWxsb2NfY2Fj
aGVfbm9wcm9mKzB4NDg4LzB4ODAwDQo+ICAgICBkcm1fYnVkZHlfaW5pdCsweGMyLzB4MzMwIFtk
cm1fYnVkZHldDQo+ICAgICBfX3hlX3R0bV92cmFtX21ncl9pbml0KzB4YzMvMHgxOTAgW3hlXQ0K
PiAgICAgeGVfdHRtX3N0b2xlbl9tZ3JfaW5pdCsweGY1LzB4OWQwIFt4ZV0NCj4gICAgIHhlX2Rl
dmljZV9wcm9iZSsweDMyNi8weDllMCBbeGVdDQo+ICAgICB4ZV9wY2lfcHJvYmUrMHgzOWEvMHg2
MTAgW3hlXQ0KPiAgICAgbG9jYWxfcGNpX3Byb2JlKzB4NDcvMHhiMA0KPiAgICAgcGNpX2Rldmlj
ZV9wcm9iZSsweGYzLzB4MjYwDQo+ICAgICByZWFsbHlfcHJvYmUrMHhmMS8weDNjMA0KPiAgICAg
X19kcml2ZXJfcHJvYmVfZGV2aWNlKzB4OGMvMHgxODANCj4gICAgIGRyaXZlcl9wcm9iZV9kZXZp
Y2UrMHgyNC8weGQwDQo+ICAgICBfX2RyaXZlcl9hdHRhY2grMHgxMGYvMHgyMjANCj4gICAgIGJ1
c19mb3JfZWFjaF9kZXYrMHg3Zi8weGUwDQo+ICAgICBkcml2ZXJfYXR0YWNoKzB4MWUvMHgzMA0K
PiAgICAgYnVzX2FkZF9kcml2ZXIrMHgxNTEvMHgyOTANCj4gDQo+IERlYWxsb2NhdGUgYXJyYXkg
Zm9yIGZyZWUgdHJlZXMgd2hlbiBjbGVhbmluZyB1cCBidWRkeSBtZW1vcnkgbWFuYWdlciBpbg0K
PiB0aGUgc2FtZSB3YXkgYXMgaWYgZ29pbmcgdGhyb3VnaCBvdXRfZnJlZV90cmVlIGxhYmVsLg0K
PiANCj4gRml4ZXM6IGQ0Y2Q2NjVjOThjMSAoImRybS9idWRkeTogU2VwYXJhdGUgY2xlYXIgYW5k
IGRpcnR5IGZyZWUgYmxvY2sgdHJlZXMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYcWCIEdyemVs
YWsgPG1pY2hhbC5ncnplbGFrQGludGVsLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEx1Y2FzIERlIE1h
cmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiBSZXZpZXdlZC1ieTogTWF0dGhldyBB
dWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KDQpJIGFsc28gbWVldCB0aGlzIGlzc3VlLiBB
bmQgdGhlIGZpeCBMR1RNLiBJdCBoYXMgdGhlIHNhbWUgbG9naWMgYXMgdGhlIGZhaWx1cmUgcGF0
aCBvZiBkcm1fYnVkZHlfaW5pdCgpLg0KUmV2aWV3ZWQtYnk6IFNodWljaGVuZyBMaW4gPHNodWlj
aGVuZy5saW5AaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9idWRk
eS5jIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2J1ZGR5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2J1ZGR5LmMNCj4gaW5kZXggMmYyNzliNDZiZDJjLi44MzA4MTE2MDU4Y2MgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnVkZHkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2J1ZGR5LmMNCj4gQEAgLTQyMCw2ICs0MjAsNyBAQCB2b2lkIGRybV9idWRkeV9maW5pKHN0
cnVjdCBkcm1fYnVkZHkgKm1tKQ0KPiANCj4gIAlmb3JfZWFjaF9mcmVlX3RyZWUoaSkNCj4gIAkJ
a2ZyZWUobW0tPmZyZWVfdHJlZXNbaV0pOw0KPiArCWtmcmVlKG1tLT5mcmVlX3RyZWVzKTsNCj4g
IAlrZnJlZShtbS0+cm9vdHMpOw0KPiAgfQ0KPiAgRVhQT1JUX1NZTUJPTChkcm1fYnVkZHlfZmlu
aSk7DQo+IC0tDQo+IDIuNDUuMg0KDQo=
