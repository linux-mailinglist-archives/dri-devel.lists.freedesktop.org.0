Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F18E5AC77B6
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620B510E23D;
	Thu, 29 May 2025 05:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lxv3Q2ze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED2610E23D;
 Thu, 29 May 2025 05:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748496817; x=1780032817;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gCs7aEgm01JZz0dGvy3GGcJ+LwAslsBvtjWYarVU60Y=;
 b=lxv3Q2zeDImZHlAMqjn/wu4uih3fHnYLWrnhldEwKfFxWtnGZutlufGH
 X4ubteMiOK3fCjlt0jtpLGQ21VOjLXeuW1X+VPwWlPSuXEXL3fpSTdTBB
 XYRJ43FkGW5G0HVZxZ4OkiQciaz+5p8NNMvjHLKVEwZ/ijX/KfY66HYZG
 0I1Bvj3Ccj0Pqliwx1hTigDP0vqn/zwVyZ9tj5LbsiVpp23PawZnoRgWG
 YqV6ttdwIb6WMmMjFRqaZGcByMDRnOa1X83MjnS7oWmGKP/MbwSGlVxr/
 yZg4PTVEL5L/reKYoltl9xhJtyEc2uIfE40aNXSuRpSdIgLrk8WxEr5Kq Q==;
X-CSE-ConnectionGUID: 3sNNKd+qQsug+ELtVx5vKw==
X-CSE-MsgGUID: 2ZMs2mjDRGSaqtIR9+L5aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61204050"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="61204050"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:33:36 -0700
X-CSE-ConnectionGUID: p7DOmd8wSci2k8Uk6+Y28g==
X-CSE-MsgGUID: 4ATnFFw1RqiWRVjnzco2Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="143924443"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:33:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 22:33:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 22:33:35 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.56)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 22:33:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2t4mdCzfVVSFDfFOHuboxH4ORcaTC09l478l6O6GazLcIUQOZDLSTe8VHokH3+Qo/k2F6TusHxSRJxdTm+vzxzJcRj3p8fdVxlm7FKsJgS5D4ofpzpk+CbSWG30z4xH9tbi/Oj35T2KXZU7B57lexUcVQGAM+VOx+K9zeudImSY5Tf5Eh6K6EIE/p6m9L65tt8RImcT/2dWWTESKwDYr+jmNgGxM7wa7OAjNbAoJu2xT9yih+R+Fg1VUKDl6XIA402F7PAajLAkMJbw+/sYvN2hEC2b2VanOjmDRKnc0btyAeEP5XuZ/e2ltlXtxjypGF995czDniTZ8jv5/NWnFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCs7aEgm01JZz0dGvy3GGcJ+LwAslsBvtjWYarVU60Y=;
 b=vyNKxvT1wCo4KtlAEYek6UySusPhyszjQnjcBtga3cOKaUcNIeBJSjHTvNUo9EqxRjJr4x+1B2KhRniLlg7/F2w7aOZm0hTOyyNXYR9G+RnK4BS0AvLubDa4JEMDvSjbmYZ4tf2OkwQ4/VeonQ5jbChk0Jo0mM9QqNhVty7wEDSDR3wlwkNoV6LXgA9XMwzxqWzDwqO6vfmnF/nrTQ87jgj7kaoXhf6G/rQ2H2T1B0pCHlJZkdADbhpZlSP69eoaFnIPUkLO7g0MpLEVtTKohMp1rcMXosDU8f1sYPacQl226luJ6lbB9QxoSGM+ho1dA4PSCo7CrAJrA8g9nSaUXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MN6PR11MB8171.namprd11.prod.outlook.com (2603:10b6:208:471::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Thu, 29 May 2025 05:33:33 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.8722.027; Thu, 29 May 2025
 05:33:33 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH v4 00/12] Panel Replay + Adaptive sync
Thread-Topic: [PATCH v4 00/12] Panel Replay + Adaptive sync
Thread-Index: AQHbykcEp8a24XJb30ezjyF4XWEVFrPeHz+AgAazGYCABE+HAA==
Date: Thu, 29 May 2025 05:33:32 +0000
Message-ID: <eab485152102c3947326829bd98501a13dee610c.camel@intel.com>
References: <20250521115319.2380655-1-jouni.hogander@intel.com>
 <4ba5f8375dea2ee73b430730abd11cd45fd12fcc.camel@intel.com>
 <224ad9ad-dd59-447f-978d-24e6e315d5fc@linux.intel.com>
In-Reply-To: <224ad9ad-dd59-447f-978d-24e6e315d5fc@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MN6PR11MB8171:EE_
x-ms-office365-filtering-correlation-id: 1bab5796-a441-4ba5-89b7-08dd9e725a08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZWFKRE9KYmlrMEdwUDdtT1NQVVNQU1F5TkN2cUR1K01oWmdvRlhwQnlLRVE2?=
 =?utf-8?B?TWthdmdJd08xdGVkcUt4RUVHMlVzZlZWK09WMENLWGM4Y0tMTTNSL3R2UEtJ?=
 =?utf-8?B?emh5S3JvMk9zeWRrRUhOWCtBTFVMbExvUzg1Qmd6cG9jSW9WVjBNTFRwVlpV?=
 =?utf-8?B?SVB0enprbWtYZ29jdEVlanUzNXFPZEVseVV4QTNTS1hPdkVMM1NlMFMwUTdj?=
 =?utf-8?B?M2xDeHhqRnNuK2pFM1ZGQmxqNVFWeTFqS3FLM0FneGRaSVhtZndhcXZmSTZ2?=
 =?utf-8?B?U2Z1cG1SYXNxekY2ZXJUVXFYSEFGVlozOTVKcHU3OWtZRVhVamh6c2gzNEw5?=
 =?utf-8?B?UUszSUJHYTBFdGxwWkJpUXJ1Nzh3ZUt1MWJuYU8xOHliSWNmbzZabkxOWDBj?=
 =?utf-8?B?bEN1REE0elB5WXB1TEFWS0pwdnk4bnkvOVNPeEkyNkVwblcrNlQzZ2VUWi8v?=
 =?utf-8?B?NzVEMXk1Z3FDRVYwSk1sZHRNSDQ1WEsveDRCQTU2eXJqZmk3aC9LZWNnTkNW?=
 =?utf-8?B?UWtLM1Y4NDVmVDMyTDdDVWdOOVRueUh0cjltemI2T2JBcXR1U0owK1hFQ3c1?=
 =?utf-8?B?aUx0TmRIRmtGZXVpMnVJdXhWYUpOWTh2Tng5c1BQcDNFNXA4dUVaZXZmd0xx?=
 =?utf-8?B?MjZQYmI2OUZSdnBTbVBzUUVuL1NrSnVzTWY2SzIrR3hLL1o4Y1JDMzVtTEU3?=
 =?utf-8?B?VGJPeW5Ic3c2TXlVcDgzQXVaSmNoUXU3bjN0RVBIVVVkbVdKK1JzOU5RRlZj?=
 =?utf-8?B?a3UvNzRtd2ZyYVVEalRDZFpWNXRDb0E4OFlzVjc3MmNMeWdDZnFvMmFHSWYv?=
 =?utf-8?B?M3dCakowK1Z3VEpqT2Rvb0NvWFVqMzZ3SXhDVHphdDh1ODJteE14MjMwYmtm?=
 =?utf-8?B?KzBoWkJnMUZNUmtjdEwwWWFnZG1iKzZBc1JJRlJISmNhT1JtQWIvVWtJSjVU?=
 =?utf-8?B?OFEvR1RsVjRlTEdiNnNHUWhNZysvUGJIYkl0MURxR3U4ak5DN2dkRFZSRmln?=
 =?utf-8?B?RkNRMnpUSWFad0tNdWRubTAyUTBtK1hxOFRWRUlrS0xlSmtpTklrUkZYKzJq?=
 =?utf-8?B?M2RHb282eWVDMEp2K296YzNlMzIvaFJnMm45SHZLU1RacUYvc0FoUGtRcy9x?=
 =?utf-8?B?ZVNjSlNaVDAvM0hQa2RmN0ZxYXpoSkVKbThHeXhQbHVPSEE3T1c1SHFBN2hM?=
 =?utf-8?B?Q0JOMUpHTjJaR1V6TlJGOVR3RU1qTkR1bGJtWnRmYTdMc0F0elkxdGExcWli?=
 =?utf-8?B?Snh4bmt3TTBHem9Fd1ZFL1VWZXBKbFNNano4SGJKay8zSHAvM3JnenBLMlRX?=
 =?utf-8?B?KzNPQkxBYUsxbUllODFOWFVxdmo1eUhvdjlzNWpTZlZPd2dSN05ZdTVBczB2?=
 =?utf-8?B?RDhLRVdMYm1hd0VzMU1FYXE2TVd4YlA1c2IzSkpmSXF3RU15cUtzRzkxSW9O?=
 =?utf-8?B?bi9BSi9jNHRVRFVTK2RrSHR0YXRwMzI1dGE4NzJQZEJSYW5WL2xocjRmb0gz?=
 =?utf-8?B?WndWRExRYUVyZUUrTFZaUDJVTHN5MWdCaHQzQllKbldnK3MwbkpST0h2UG15?=
 =?utf-8?B?ZUxoSjB3OG9oVjdudVIyR1NBTWdQVnlkeWViNFo0N0phVEdqN2h3Qk5GQmIv?=
 =?utf-8?B?ak9PVGl0ZXZveCtuSXZ0TjhYajJ6WnZwL1ZSejVoYWdsR01CdXQ5ck42Tkxr?=
 =?utf-8?B?cFI1SFQwbHRFZ0ZBc1E0eGZmUXVsWDhWNzVrQ1BpUFNWcVRjQllGb3ZSMFMy?=
 =?utf-8?B?cWtzWE14M0x4Sm9oTU5JZUx0SE9CdDkvdDdhRzJ3ZmY2aWZqSlkyWFZDbTZm?=
 =?utf-8?B?cStlNm1SelRDQjBQY2k3YjRGOG9LTFF1REZoazNqckZpQmJnZnNvUE1lY2cv?=
 =?utf-8?B?Y1NsS25panFDU0twYVZ3VVg5bnZ3NmVzNVBnK3E2aXExcXZJVW9jaE5iN2xn?=
 =?utf-8?B?Q1poVjl3Mm9wRDlWSTlILzROcmVwUWFZVjdwbk9EMm5haEhYSFhYUTExaW93?=
 =?utf-8?Q?LJfULsi06tPSXEhm4bWi5WPK3AIB4E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTkxSzY3TFpNYktOd2dldDA2TytsbFpubkUrSU5oUjZmSXd2NUNFeWZkOVJr?=
 =?utf-8?B?MkFRS3FPVTBTYzBxVVZOZkhOa0YrS245ZkUyK1M4bSttMHFoNUJrbWtoWWpq?=
 =?utf-8?B?Zyt6NDlXUW16bVZWbWVSZXFlMWlPTWk2N0NGT0ZWRWhFYm55Q2ZQcS9FdW9S?=
 =?utf-8?B?eUNyaWNDdVdkSGJuUDJrUkpCcGk2enBETXQ2RXJoV0I5RkJEcnNKem4xSk1L?=
 =?utf-8?B?Rnp5VWdySVdUNm4zNStFTVY4ZS9DWHdNQUZ4SDdRL2hZSy83QnFTK0oxMm9U?=
 =?utf-8?B?aGRWaFc4Tmh6eU9MRzJ4eDlTVDRHVE55VER0Ymw4N3o1NWFmWnhjUUQwQ0ZZ?=
 =?utf-8?B?WTVsM3RXSHZuRURzY0xCUm9iOHlVZm50NkRWZEorZjhRbUszejVMQ0ZBZWZ4?=
 =?utf-8?B?WWJxVkUwdkRYT1ZVNlNBaGh6L0hYbFJna3JEWlBJNzdZdmU2bVZmVVJMOVNk?=
 =?utf-8?B?NDRPTThiWkxuVVFLZ2U5N2lMODlIWXhvdnIraWp2T21mMjlBanlDQnlZZ2F0?=
 =?utf-8?B?djFnY3I2N1F4ZkdyTUZkOEhTT3YvNytyVTN3OWtsK2VSOHlDL1J5VEkrODdn?=
 =?utf-8?B?QjNKbGZic3lRQWNkVUphM092UjM2UmZBVFBVeVVzNlhKbURqS2R6QlZ1QkZz?=
 =?utf-8?B?UStINnBzTlhPYnF1VkZ5dUxNT2dnRnFVdEdxdkV5aDQ1NWxxYmY3VkdMd09H?=
 =?utf-8?B?K0VRQ2VOdGhTZ0VuYy9Gczh1UDFGTmhabUFYay9WZEVsWEhtKzF1dHpIeEZj?=
 =?utf-8?B?L1d1R0w4ZFlIUGYwQnhSajJBRnRwUWlWMnB4VCtNeWNaQmRwbjV1UVVudWRC?=
 =?utf-8?B?bHB0WlJFSDAyNVFzTENOZmtvWUpYUjJuZ1V0c3Y0eWFlZG5CSHdTSWg1djVR?=
 =?utf-8?B?VFU3dHNyUGNjVHFiUWw4RGsyQUs2d3dRU0hnNE0wN2N0d01rM2h1aDRvRXBv?=
 =?utf-8?B?M3NGbXFUUkNnUXhBUk5lMklJejVicHZ4YkJHMXJSalN1azhSbVAxU1RqZWNu?=
 =?utf-8?B?RHRtZ290b0FwU1pKV0s4SlppRms1dmFSOEliSHh2M0lwVkpPLzJDOWxjY3ZM?=
 =?utf-8?B?L29mTVBSenFzUFJsTzZ5d29BTnR4K1ZaTUlTYmo3WmRhbDhhQndEZG9MdDJK?=
 =?utf-8?B?b0FPeFE2NUpWN2RmQXAyWlk3MTI1ZnJURDFtRXJaWXE3K0YzYVR3Y2hXK0xm?=
 =?utf-8?B?ek5oYTM5OTg4akdlU0J6UUxaaGh1cXB4TU14bFdvNDhvckprY3BSNjNhSEtQ?=
 =?utf-8?B?b3NDUzBtQnJmY3hPSjdsdjZFbnZFc1pWK2NkMnhMUzNaVm1lSEZwMldQZmhv?=
 =?utf-8?B?aENyRStNMVpPcXVjcWpyeDlwbkRxL3BKc0QxcSs3WjBOTkF2Rk9YOUlPMWVO?=
 =?utf-8?B?ZmljQ1RCK2M4dm02YkdNWjA2NjBBN2s4cWwycW05WUFoUWJDSENUZkxOczFF?=
 =?utf-8?B?VnhweFd6VVRFMUpxejBrN1l2MDZRczFVM1RldTlUUWR4N3pQTzdMUW5kY2Ja?=
 =?utf-8?B?UWdsOUlhZXRSb1E1RnZPb2dseTJKTEZxK1ZDREtPcG40U0RlVGkyQ25DWnNB?=
 =?utf-8?B?S2h6UWcxNW1mVzlicEdoYUhZWDJKaHY3RDRmU1cwck5HUnlOS1IvS1YxUlJx?=
 =?utf-8?B?d0hxejM0U1hkZ01keVNObnNEQlVsQzNlWTZIVG9GSnRCYkFheExYRllheHd5?=
 =?utf-8?B?ZTk1M3VReUk0U0VPamRCNkdISHR2bGoycXRIck5KQlpyVGNVWXlMdk8yY0xn?=
 =?utf-8?B?V014T0hYa0RQZmcrRTFLdnM1VDBPZG1sR3VsZ0RUNVhPVzhabktDLzhBalg2?=
 =?utf-8?B?Z3pNenJ1UUZ1Uno2a1IxTUhvT1NBMTNnMUQ0Y1dteWVRcWk3NEo5ZkE5VjFF?=
 =?utf-8?B?ZEpCeTdjbkk2UmFhY3E0QW5EVEE2T3lEZXV3aFM1Q3k0aS9lSnFWQVBvUWVC?=
 =?utf-8?B?MStzUHNtVEFrOGtzUDZkTFVRR0ZwQlArZkhXTG5SK0dsMzF3VmM5blhIanNW?=
 =?utf-8?B?SWpYZUJ0SUI1SG1ubGMxN0c1SmZDdGNsMnJodERNOC85SUFjc0dJbjROUnlO?=
 =?utf-8?B?aElla3N3d0dHV05RVms4L3hGWjVVeG94dURHdk9Rdmw0SU85N0lYcUZjTXFV?=
 =?utf-8?B?N25HL0hLUlFTdWtGcitjSzMybDJibWNJcjkzM2dyQUxIaGRtWmpSSzFQZGJ1?=
 =?utf-8?B?RWp1VHNJTEZaRHVyVEUrVEpiTXUwWVVmd1lwVzE2QWVvQlR5bUdCRnhHU01t?=
 =?utf-8?B?OHdFcUJLbnBYWXVjVXpLbzl4L3N3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD0187B3B928EE42B3E05604B76EBA09@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bab5796-a441-4ba5-89b7-08dd9e725a08
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2025 05:33:33.0303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yG7NTJESD21VN0yjfb5Ttyqp3ILhNJdDpEozfQnumQSMDE+FdBHkAoNAmF3EDv+qRWHeOjgKFtHvK+7aIjD9bMSIK4r7yYuD6Y/DtKcYahU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8171
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

T24gTW9uLCAyMDI1LTA1LTI2IGF0IDEzOjQzICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gSGV5LA0KPiANCj4gU2VlbXMgdG8gYmUganVzdCBzb21lIHJlZ2lzdGVyIGRlZmluaXRp
b25zLg0KPiANCj4gQWNrZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3Jz
dEBsaW51eC5pbnRlbC5jb20+DQoNClRoYW5rIHlvdSBNYWFydGVuIGFuZCBBbmtpdCBmb3IgY2hl
Y2tpbmcgbXkgcGF0Y2hlcy4gVGhlc2UgYXJlIG5vdw0KcHVzaGVkIHRvIGRybS1pbnRlbC1uZXh0
Lg0KDQpCUiwNCg0KSm91bmkgSMO2Z2FuZGVyDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gfk1h
YXJ0ZW4NCj4gDQo+IE9uIDIwMjUtMDUtMjIgMDc6MjUsIEhvZ2FuZGVyLCBKb3VuaSB3cm90ZToN
Cj4gPiBIZWxsbyBEUk0gTWFpbnRhaW5lcnMsDQo+ID4gDQo+ID4gSSBoYXZlIHR3byBwYXRjaGVz
ICgwMS8xMiBhbmQgMDIvMTIpIGluIHRoaXMgc2V0IEkgd291bGQgbGlrZSB0bw0KPiA+IG1lcmdl
DQo+ID4gdmlhIGRybS1pbnRlbC9kcm0taW50ZWwtbmV4dC4gSXMgdGhhdCBvayB0byB5b3U/IFRo
ZXkgYXJlIHRvdWNoaW5nDQo+ID4gaTkxNQ0KPiA+IGRpc3BsYXkgZHJpdmVyIGFuZCBkcm1fZHAu
aCBoZWFkZXIgYW5kIHJlc3Qgb2YgdGhlIHBhdGNoIHNldCBpcw0KPiA+IGRlcGVuZGluZyBvbiB0
aG9zZSBjaGFuZ2VzLiBDYW4gb25lIG9mIHlvdSBhY2sgdGhvc2UgdHdvIHBhdGNoZXM/DQo+ID4g
DQo+ID4gVGhhbmsgWW91IGluIEFkdmFuY2UsDQo+ID4gDQo+ID4gSm91bmkgSMO2Z2FuZGVyDQo+
ID4gDQo+ID4gT24gV2VkLCAyMDI1LTA1LTIxIGF0IDE0OjUzICswMzAwLCBKb3VuaSBIw7ZnYW5k
ZXIgd3JvdGU6DQo+ID4gPiBUaGlzIHBhdGNoIHNldCBpcyBhZGRpbmcgbWlzc2luZyBjb25maWd1
cmF0aW9uIHRvIGhhdmUgUGFuZWwNCj4gPiA+IFJlcGxheQ0KPiA+ID4gYW5kIEFkYXB0aXZlIFN5
bmMgZW5hYmxlZCBzaW11bHRhbmVvdXNseS4gQWxzbyBzb21lIGlzc3Vlcw0KPiA+ID4gaWRlbnRp
ZmllZA0KPiA+ID4gd2hpbGUgZGVidWdnaW5nIGFyZSBmaXhlZDoNCj4gPiA+IA0KPiA+ID4gMS4g
U291cmNlIFBPUlQgQUxQTSBjb25maWd1cmF0aW9uIGhhcyB0byBtYWRlIGR1cmluZyBtb2Rlc2V0
Lg0KPiA+ID4gMi4gUEhZX0NNTjFfQ09OVFJPTCBpcyBub3Qgd3JpdHRlbiBhY2NvcmRpbmcgdG8g
SEFTIGRvY3VtZW50DQo+ID4gPiAzLiBXcm9uZyByZWdpc3RlciBmaWVsZCBkZWZpbml0aW9ucyBm
b3IgUE9SVF9BTFBNX0xGUFNfQ1RMLg0KPiA+ID4gDQo+ID4gPiBQYXRjaGVzIGFyZSB0ZXN0ZWQg
b24gTHVuYXJMYWtlIGFuZCBQYW50aGVyTGFrZSB1c2luZyBvdXINCj4gPiA+IHJlZmVyZW5jZQ0K
PiA+ID4gcGFuZWwgc3VwcG9ydGluZw0KPiA+ID4gQWRhcHRpdmUgU3luYyBhbmQgUGFuZWwgUmVw
bGF5Lg0KPiA+ID4gDQo+ID4gPiB2NDoNCj4gPiA+IMKgIC0gYWRkZWQgRFBfRFNDX0RFQ09ERV9D
QVBBQklMSVRZIGRlZmluaXRpb25zDQo+ID4gPiDCoCAtIHVzZSBkZWZpbmVkIHNoaWZ0IGluc3Rl
YWQgb2YgaGFyZGNvZGVkIHZhbHVlDQo+ID4gPiB2MzoNCj4gPiA+IMKgIC0gY29tbWVudCBhYm91
dCBEUDIuMSBjb3JyZWN0ZWQgYXMgRFAyLjFhDQo+ID4gPiDCoCAtIHJlZmVycmluZyBwYXRjaCBy
ZW1vdmVkIGZyb20gY29tbWl0IG1lc3NhZ2UNCj4gPiA+IHYyOg0KPiA+ID4gwqAgLSByZXdvcmsg
UGFuZWwgUmVwbGF5IERQQ0QgcmVnaXN0ZXIgZGVmaW5pdGlvbnMNCj4gPiA+IMKgIC0gZG8gbm90
IHVzZSBoYXJkY29kZWQgaW5kaWNlcyB3aGlsZSBhY2Nlc3NpbmcgaW50ZWxfZHAtDQo+ID4gPiA+
cHJfZHBjZA0KPiA+ID4gwqAgLSBlbnN1cmUgQUxQTSByZWdpc3RlcnMgYXJlIG5vdCB3cml0dGVu
IG9uIHBsYXRmb3JtIHdoZXJlIHRoZXkNCj4gPiA+IGRvDQo+ID4gPiDCoMKgwqAgbm90IGV4aXN0
DQo+ID4gPiDCoCAtIHJlbW92ZSBrZXJuZWxkb2MgY29tbWVudHMNCj4gPiA+IA0KPiA+ID4gSm91
bmkgSMO2Z2FuZGVyICgxMik6DQo+ID4gPiDCoCBkcm0vcGFuZWxyZXBsYXk6IFBhbmVsIFJlcGxh
eSBjYXBhYmlsaXR5IERQQ0QgcmVnaXN0ZXINCj4gPiA+IGRlZmluaXRpb25zDQo+ID4gPiDCoCBk
cm0vZHA6IEFkZCBQYW5lbCBSZXBsYXkgY2FwYWJpbGl0eSBiaXRzIGZyb20gRFAyLjENCj4gPiA+
IHNwZWNpZmljYXRpb24NCj4gPiA+IMKgIGRybS9pOTE1L3BzcjogUmVhZCBhbGwgUGFuZWwgUmVw
bGF5IGNhcGFiaWxpdHkgcmVnaXN0ZXJzIGZyb20NCj4gPiA+IERQQ0QNCj4gPiA+IMKgIGRybS9p
OTE1L2FscG06IEFkZCBQUl9BTFBNX0NUTCByZWdpc3RlciBkZWZpbml0aW9ucw0KPiA+ID4gwqAg
ZHJtL2k5MTUvYWxwbTogV3JpdGUgUFJfQUxQTV9DVEwgcmVnaXN0ZXINCj4gPiA+IMKgIGRybS9p
OTE1L3BzcjogQWRkIGludGVyZmFjZSB0byBjaGVjayBpZiBBVVhMZXNzIEFMUE0gaXMgbmVlZGVk
DQo+ID4gPiBieQ0KPiA+ID4gUFNSDQo+ID4gPiDCoCBkcm0vaTkxNS9hbHBtOiBBZGQgbmV3IGlu
dGVyZmFjZSB0byBjaGVjayBpZiBBVVhMZXNzIEFMUE0gaXMNCj4gPiA+IHVzZWQNCj4gPiA+IMKg
IGRybS9pOTE1L2FscG06IE1vdmUgcG9ydCBhbHBtIGNvbmZpZ3VyYXRpb24NCj4gPiA+IMKgIGRy
bS9pOTE1L2Rpc3BsYXk6IEFkZCBQSFlfQ01OMV9DT05UUk9MIHJlZ2lzdGVyIGRlZmluaXRpb25z
DQo+ID4gPiDCoCBkcm0vaTkxNS9kaXNwbGF5OiBBZGQgZnVuY3Rpb24gdG8gY29uZmlndXJlIExG
UFMgc2VuZGluZw0KPiA+ID4gwqAgZHJtL2k5MTUvcHNyOiBGaXggdXNpbmcgd3JvbmcgbWFzayBp
biBSRUdfRklFTERfUFJFUA0KPiA+ID4gwqAgZHJtL2k5MTUvcHNyOiBEbyBub3QgZGlzYWJsZSBQ
YW5lbCBSZXBsYXkgaW4gY2FzZSBWUlIgaXMNCj4gPiA+IGVuYWJsZWQNCj4gPiA+IA0KPiA+ID4g
wqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uY8KgwqDCoMKgIHwgNzIN
Cj4gPiA+ICsrKysrKysrKysrKystLS0tDQo+ID4gPiAtLQ0KPiA+ID4gwqBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uaMKgwqDCoMKgIHzCoCA0ICsrDQo+ID4gPiDCoGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3gwX3BoeS5jwqAgfCAzMiArKysrKysr
KysNCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jeDBfcGh5LmjC
oCB8wqAgMiArDQo+ID4gPiDCoC4uLi9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jeDBfcGh5
X3JlZ3MuaCB8wqAgMyArDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGRpLmPCoMKgwqDCoMKgIHwgMTIgKysrKw0KPiA+ID4gwqAuLi4vZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kaXNwbGF5X3R5cGVzLmjCoMKgwqAgfMKgIDQgKy0NCj4gPiA+IMKgZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuY8KgwqDCoMKgwqAgfCA0NCArKysrKysrLS0t
LS0NCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuaMKgwqDC
oMKgwqAgfMKgIDIgKw0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X3Bzcl9yZWdzLmggfCAxNCArKystDQo+ID4gPiDCoGluY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2Rw
LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMjQgKysrKystLQ0KPiA+ID4g
wqAxMSBmaWxlcyBjaGFuZ2VkLCAxNjggaW5zZXJ0aW9ucygrKSwgNDUgZGVsZXRpb25zKC0pDQo+
ID4gPiANCj4gPiANCj4gDQoNCg==
