Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B005A9D1FD7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 07:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452DD10E5B3;
	Tue, 19 Nov 2024 06:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nKtDBZXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9172710E5B3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 06:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731996104; x=1763532104;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gULvvksUSqKNcgMRmWtLqfFFMkNL6tWXoCjPUSFhrbI=;
 b=nKtDBZXafufTl1Oi7FaZ4dSPoACAcENtS6DWMy/kUQTRNNyRdbn3M4JB
 mW1M/HEbWch1jnJZ8Ygl3OrHuV9SXzvJr14vd5aeNPUlyNTlpNBSHpW3q
 aXx72G15EULdjM4Mgy14KCIS6oP5AfocdTavcoVxlD6dPHnnfx6M/qIYH
 lHsQkYxiPFyvESdE4OQO2Gg6Rt7pg/t1jguhkN9j1it4weZmmCAU8UQy8
 L2idJThU8ZXyKBoP+tyroYykJHvZb56oOJTnB7mTqTwwEVb41XnBpTv7G
 3L1IewCn6zvudaBHPjOLMFG99BrZyCwPrJU/bjIZ3VetYw24LfvMmS1Vg A==;
X-CSE-ConnectionGUID: evzMPT8OQjyEK1lVDu7X3A==
X-CSE-MsgGUID: XLjEEfaiQG2UA+/GyOxPeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19589592"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="19589592"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 22:01:38 -0800
X-CSE-ConnectionGUID: ldY2gmHYRd2sb5z9RzKlcw==
X-CSE-MsgGUID: MeKB2/9ZRUC5zMXNQab48g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89229560"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 22:01:35 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 22:01:34 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 22:01:34 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 22:01:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRlP8laXRfQ+NKR6JiwgR+7rHzE5td0W498rPDSUfkWmHTbbteAWEnaJmpvdMIYtOezpMlXMLzr7tJuN4djDB8PkJ1GkWVOnlqv0/S46qjxUeWSoygF3ekPwDgXwBGrJtarsrzCoess+H/Jd+gvS7J9f+CVA6EvLCble81WoiZaYh6+O8DxdfxWyqZMiHu9YMOVwphfvOLMDxy4Uo/i/HA1nV0MWialxpO8i2x3PA85O+agHUpBWDmi+dRNPi7wjoX5TDlgFNt7nuKz00rOhnbGpWqlFE3G7dQkaUTpnE7zCOntLqTPixzB2Ruv5Gv7t69kuUtcoQrvH0QOQ4lLLyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gULvvksUSqKNcgMRmWtLqfFFMkNL6tWXoCjPUSFhrbI=;
 b=IzlcEjVTLxxK9gDGEP8RV86li/VI5KaJ/hX44bh521PycxC7JA+uI96O9e5MAkU9Ps6jhJGXpvLeePyLyJyOgYDWITdt49HQMLGkxOJoUnAwqBWyAxwL6Wc2PJ2vJdRpag+6XpdP2gwh+oEbQt+LYHbN4oYyxIJ5ICQ3FOSfXOLzLln+VNTZluGmCIoXyYHcaGKCaGB9+K6rABeS7TWPS3r3ydvmsCTTdTPCqbIz3tqZHLftS7+T4IhR07BTjgaP7zBSltiSaajHY/k4B62LWHt59RxtEl7vdO2Ova1mEUvMgRJ7+ujuNILnZDsiQS4awwO8tzN3sTI5JciDqFrNzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH7PR11MB5819.namprd11.prod.outlook.com (2603:10b6:510:13b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Tue, 19 Nov
 2024 06:01:31 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%6]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 06:01:31 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
Subject: RE: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
Thread-Topic: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
Thread-Index: AQHa7TgPrcbKIkB680CVAbY2s3+7ybKQ+qcAgAEiG4CAAgTjAIABpIUwgAK8GwCABQI3cIAeUOCAgAErI0CAAZMJwA==
Date: Tue, 19 Nov 2024 06:01:31 +0000
Message-ID: <IA0PR11MB7185671D43889B076086940CF8202@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240813035509.3360760-1-vivek.kasireddy@intel.com>
 <20240813035509.3360760-3-vivek.kasireddy@intel.com>
 <45fbbd65-7e97-41c3-898a-49b6fa65e27e@collabora.com>
 <IA0PR11MB7185625CF2B9E7635A0CF164F84C2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <071a239f-50fd-44f3-9283-3dc928edb389@collabora.com>
 <IA0PR11MB718548F4F8971C91FCA456CCF84E2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <4feda09d-7a5e-4db4-83f8-f75eb0566b4a@collabora.com>
 <IA0PR11MB7185C176AF07732D39AA4F86F84B2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <e336b9ef-c8f3-44c8-904f-42736f6ac481@collabora.com>
 <IA0PR11MB7185A20AA84175C4D44D44E3F8272@IA0PR11MB7185.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7185A20AA84175C4D44D44E3F8272@IA0PR11MB7185.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH7PR11MB5819:EE_
x-ms-office365-filtering-correlation-id: 7a771044-2e21-43c6-983a-08dd085f9d85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MWRrTmtFcXFIWjBkVmdIR1RacGlvaVZYUnFoMzY5ZHZiTkJkQ2FDeGx3dHZz?=
 =?utf-8?B?c1dLUHB5aGhwby9Ka0tPWVh3UEpONE1Pd05jU0VuaDJYZkUrWFBENGxDbGFW?=
 =?utf-8?B?ZXVwcGorSVlVd0RQTGtqd2ZsamRYNC83cTF4Tk9oNVlaSnQycWsrMmxtcDU4?=
 =?utf-8?B?dXozU3paaFo4M3l6RktGUlJZUWFZSkhsZnZUWHg2ZXdkSVc5QnNEMEZGRlZ0?=
 =?utf-8?B?bWpMSVdUS21Sa3dpU3MyTFlSWHVLS0xnbGtwNVc3OVpDc2diRU1NWmZveTB6?=
 =?utf-8?B?NUhicE5qc0poOGE0S2ZiOStRWVJELytnMUlDWWJuUU5yTCtmRzlHd1RRQnMy?=
 =?utf-8?B?a0xQYlFSajJta3YrYWY2UFZMWXBwV09VaUtzVHdZdUJBWGYxaExUdmNqQzNJ?=
 =?utf-8?B?Rk1LcWRKVTZqNFpHVm9XVkdBKzZibjU5ZDliMjFmeGtCTDlLampCZmFUVEVU?=
 =?utf-8?B?OXI0NjVaNVJWS0xqcncyOGc2U3dhUm9FOXc4WkVpMmNSRENoaHJnVFF0dE1S?=
 =?utf-8?B?SmpERWJSS2pDbXNCTHpMVDdnVEhHMHJJN0l4NlpUTkR1NU5uaEFDWVpvMkRw?=
 =?utf-8?B?V3dDcm1tOEIrNW9qaE1UTGFGOGdqZFp1YnpPQXZTUWo3TXp2dDNjNVo3d2hN?=
 =?utf-8?B?aE9WNGpGc1JySHJPOG1tT1VNU0pRSGdvQXFuS0RsVTZxZlcvWE00Y2dpa0Ns?=
 =?utf-8?B?UzU2bGUybzRvK2RBbFUzSHJSeGNIYjlNMDNaR3pjaTBpTnJ0UldXQVo4RStH?=
 =?utf-8?B?cE14d2lKcnBKZGpoSHQrUUNMMU1Ka1JRNUZtU2hOTnMrUWpTV1lkcm5XVmJ3?=
 =?utf-8?B?aktIVjFRMFlldlFiN3Z3ZWRseHBxMzYyRHdNSzk1STIwYzJJSTJVSk1qaG9j?=
 =?utf-8?B?enhicERmdmxaT3VMVG1xL2E1L21TemcxV3I4bE1idUNlay9JT2JWdGFGUzUw?=
 =?utf-8?B?amVkbUVwSjI3V3M2RmxKV1hMWTVNbFdvKzRvV01wT2JlRCtuRnYwMEhOL0sy?=
 =?utf-8?B?ckMyM0hhS2V5dHlMaXBlL0ZwSGNPTGhCT0l3RnVaTXJ3UjQ3bkNreUVHbitQ?=
 =?utf-8?B?MDRxQy8yb0ZpS3BvT0MwTlc5QndUbGs1NjZyR0RBaks1aTZ5cXFJdWgvUGFs?=
 =?utf-8?B?NXhDZ0NtWGZTVmJKY1lmS3JEbmU3S0pCbzFqdjcwcTlTL0RFSDI5TUpYT0tv?=
 =?utf-8?B?Y0JOOVM4anhFMDNlTTVFSHJGOGJOLzBpZTZFRUp3eXpIb2YrZEIrNHpRTFdW?=
 =?utf-8?B?QWhwalhOQ1FVZW9TZ0Y5aVc5SUJIUWowcnVwZlBmMTZlMzZRTVZmaVo3bXhG?=
 =?utf-8?B?S3V5eTZ5MDNLQk96a3p2bXliQzNKNWJ4T2NKNjlZcW9KQmd4WHI2M2dvMG04?=
 =?utf-8?B?bGc4OS9JbFJhajJtaThTQmVid3RxUjNsV293aWh0NVdNRURhSnlBOTB1UGVK?=
 =?utf-8?B?b3dIRXM0ZHdhQjlXMjg4eDF3WlJBOC94SVYwamNiaE5TZ3NVaVVocmNvSGtN?=
 =?utf-8?B?andHRWxXVkQ3bFRnWlFmdzhLT1dHSDJkZzY3RVRQdWpMdE1hc2ZOc0FFNWR2?=
 =?utf-8?B?ZGJML1pYeTVXSjdndmZqTjdaMlZ6Sktpd3hEeVp0dEltNWcrcXBzaFhyVmJW?=
 =?utf-8?B?SnBxMk5xZ0lnVGNPclJJK0k4ZnRNN2hPb2RVeFdxb2RlYzR2cTRTVCtJSm1K?=
 =?utf-8?B?M0NKbmFRK1pZdTZSN0hrT3pEWDgzdUdmbVB6Y0F4VEo1UTBDVmtCR2pRaWhZ?=
 =?utf-8?B?d0txalphb3ZPbHBMSVJDckV3NTZNMDJaSXNHci9KMmprMnc1WTRmYVNSNDBw?=
 =?utf-8?Q?E3y4VEiJjgci2flIER83BozQnyu9Wcma0JFbs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGZaMlp0Mkx6eDk4L1lpUnJoMUNZWmFKeG02MW8xckN6NlYxbStQYTQ4MFBq?=
 =?utf-8?B?U1lISVFGNUU4RW5xamM2VHJOTW4vOFUza3Z1UlowMUJZMXpSSzlnME9jeVFr?=
 =?utf-8?B?ejBUd0htSy9BSG1CUzVJMURJK0ZGMUVTcUVHdWduSnp6OEVxbkQ0aVB5aXhn?=
 =?utf-8?B?NDhqTk9VdThvMDlPNS9UcWRjRDBsTGo4ODc3M2xPUitxV2RINmdOaXRYYk14?=
 =?utf-8?B?bDdlQktwai9xWG1pM3lEdFM5Y1dQUDkvTFVYY2pTM3pjc2ZIWkNSMFo3c3pH?=
 =?utf-8?B?eTZiRHkvU0N6T1UyQzNMTTB3VENGbm1EYlhQWTBTeEFSZk5BRVcxa3gyZVE4?=
 =?utf-8?B?ZHVmMk5ONzl0Y01XR0RkanU4bnAxSWF4dmlPcnRGaDlkOXpoUkVrcmZVRW80?=
 =?utf-8?B?ZG96WTZwNUhrcEM5b0RjZ0VWNjJxQWlhVjZiMmg5YndQSWxDazNZZ3IxTkJK?=
 =?utf-8?B?a3dzL1NvMzBPNDZhSmNoSmNrMzcwT0x5REthd2U4dkVnRmR6SWhta2VhSDdw?=
 =?utf-8?B?ZFRTMWR4VXVDUlkvOHEwRVNwTDk3KzdmNDdDQWtHbTdYQ0QwYVZieHhSZGhp?=
 =?utf-8?B?anBMekdpQm1qaXpQb0dhdWhQaW5jdy9UK2ZWbnM5SG9NNzBsRlI5ZW1SS1M0?=
 =?utf-8?B?OFNuVVRoRzJTMXNOL294c25Xbzc5a3lVVFh6eXBsMUZYMFlEeFQxNWxqTk1D?=
 =?utf-8?B?SDhzM3QxL0pNN2pIeGdZUUt0R2hhb0FscWVsSkZSK2FHQ2NTaXpYU3VDbkcx?=
 =?utf-8?B?TjYveFN5bS9BSTVnalJYMklJYTlLZEpLZ1BxcmhualdKNWd2djFkYzVXSTFn?=
 =?utf-8?B?WnJBdWR2TTFzdWJWOTloMUNWNzRSeWdqK2dseElUQ2lhY01rV3hTOE1CRHNi?=
 =?utf-8?B?ZVdIT2N4U2wyUElPNDl2aEI5STREYmpLSElTN2JLbWNxeTZhTVhSdUNPN2ZW?=
 =?utf-8?B?bG1OMWFOMG5wbnZGaTZCK09uQTVQczV3dEcwSGQ2K3NxSTZuTlRvMFBmMWI1?=
 =?utf-8?B?TUlFTk1vMUhabHAxdERJYm5oUDBBMGI0N21LRWZzYVM3MXlycWRqdUpwRnRz?=
 =?utf-8?B?MDlOVlNjWXA2QVFuVEVrbGluVGg4NnlBaXVOd1Y4ZFBTRG91ODV1N2dhK2RO?=
 =?utf-8?B?WXFQTzZuZmR5RVZ4M2J1eW0zai8vemdlWTcxNlV2OEQ2aFJUUy9vdHA0Qlg0?=
 =?utf-8?B?aGd5VmgwaXMveUQyWDlVZUR0eU9heHc5VnEwRThBVlY3b3d1cjNNL3RyM1RM?=
 =?utf-8?B?OG1xMEpIc1ZqUGdlRzdEeHdWMnZUMWVnazNJc3lRbXJsYk40dFhTMWlNc255?=
 =?utf-8?B?T25HWUwzbG9GWG14UE9LVVFkTlBqYWRWS2pEWkNZOEo4d3NkMzlIWmVRMHZ6?=
 =?utf-8?B?eVBlNFhSdGhmMjkrUmc1NHJwYzYwYzR4aGdWUSs4MVl5NnJIN2U0b3k0NDJz?=
 =?utf-8?B?eTcrakdYNTk5b0FtaytuNlh6SjZMTGxTZ2J3K05zMzIvbFRHRE5DMVVKczha?=
 =?utf-8?B?bTlINE0xVUhLMmdHdnFNMHlUb3VmbkxJMTIyZzZZWHJFMHRQSng3NGJMY0t3?=
 =?utf-8?B?MUpXV1pjREgzUmY1SXdtYk84NzNEQld4TjdaZEF1b2dPYTVJRUNjVUg4TUpG?=
 =?utf-8?B?UnhUeC92bklnWXl0K1hsb1NLa004bmZ0Z3Q2ckI3Rm1OTGltUGJJNm9TSkVm?=
 =?utf-8?B?QitmTVFLZXhrbUpMVGF5S1NpUjQ1SWdPeUY4SHFyak1hWkFxc0FYeWlKWi9s?=
 =?utf-8?B?cndJYzVFQk5vL0lEdjRUUVV6NVhTWU1lVC90WS8zTUplb0Z4NVJlOGs1RVly?=
 =?utf-8?B?U1laK2o2TFNCYzErZE9Sb3RJbkt1YTlqNTlIbGVhNzNLN0Nrb0lDK0lyOUFJ?=
 =?utf-8?B?TEZTOFVkZFBqTlUyVDhHY1hBL3RtYUU5RWVvYjltRytaV0t0VlZSZUZxd3Q0?=
 =?utf-8?B?UldkMkNpOHpXalZNN0RKcmVaaWFXVlZTVlNyc2hzTVNJWTc0MEhMKzFjcHZl?=
 =?utf-8?B?dEp2NGNDWVkzZG51UDJTQlFZRGExaEJWejQ5RjFOOTZFVEdDN1RmMUVLTERF?=
 =?utf-8?B?eEMwa0RnUlBFQXlhQ3dQZ1F1YVhnUDBNQXljZVhxV3RsRXQ0UFNXSWtCUmVR?=
 =?utf-8?Q?voOKadebjlfVdzWrL6n6fVS17?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a771044-2e21-43c6-983a-08dd085f9d85
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 06:01:31.3840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zTcoCzHwAzq+bVCsqdxwAoZuSCZU+2e4FqlcEIEyms1pdVP+bYVewY6tGnskF3TaeKce0aaa1EvB7QK72JxDZjEM2w/3OpsSfcFHKzJYBqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5819
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

SGkgRG1pdHJ5LA0KDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzVdIGRybS92aXJ0aW86
IEFkZCBhIGhlbHBlciB0byBtYXAgYW5kIG5vdGUgdGhlDQo+ID4gZG1hIGFkZHJzIGFuZCBsZW5n
dGhzDQo+ID4NCj4gPiBPbiAxMC8yOS8yNCAwOToxOCwgS2FzaXJlZGR5LCBWaXZlayB3cm90ZToN
Cj4gPiA+Pj4+IEJUVywgaXMgYW55IERHMiBHUFUgc3VpdGFibGUgZm9yIHRlc3Rpbmcgb2YgdGhp
cyBwYXRjaHNldD8gV2lsbCBJIGJlDQo+ID4gPj4+PiBhYmxlIHRvIHRlc3QgaXQgdXNpbmcgYSBy
ZWd1bGFyIGNvbnN1bWVyIEE3NTAgY2FyZD8NCj4gPiA+Pj4gWWVzLCB5b3UgY2FuIHRlc3Qgd2l0
aCBhbnkgREcyIGRHUFUgYXMgbG9uZyBhcyB5b3UgY2FuIHBhc3N0aHJvdWdoIGl0DQo+IHRvDQo+
ID4gPj4gdGhlDQo+ID4gPj4+IEd1ZXN0IFZNLiBBbmQsIGlmIHRoZXJlIGlzIGFuIGlHUFUgYXZh
aWxhYmxlIG9uIHRoZSBIb3N0LCB5b3UgY2FuIHVzZQ0KPiA+ID4+IEdUSy9TREwgVUkNCj4gPiA+
Pj4gZm9yIGxvY2FsIGRpc3BsYXkgb3IgU3BpY2UgVUkgZm9yIHJlbW90ZSBkaXNwbGF5IGlmIHRo
ZXJlIGlzIG5vIGlHUFUgb24gdGhlDQo+ID4gPj4gSG9zdC4NCj4gPiA+Pj4gVGhpcyBpcyBleGFj
dGx5IGhvdyBJIHN0YXJ0ZWQgdGVzdGluZyB0aGlzIHBhdGNoIHNlcmllcyBidXQgSSBhbSBub3cN
Cj4gPiA+PiBwcmVkb21pbmFudGx5DQo+ID4gPj4+IHRlc3RpbmcgdGhpcyBzZXJpZXMgd2l0aCBT
UklPViBlbmFibGVkIGlHUFVzIGFuZCBkR1BVcy4NCj4gPiA+PiBXYXMgaG9waW5nIHRvIHRyeSBv
dXQgU1ItSU9WIG9uIEE3NTAgaWYgaXQncyBldmVuIHBvc3NpYmxlIGF0IGFsbC4NCj4gPiA+IEFG
QUlLLCBTUklPViBpcyBub3Qgc3VwcG9ydGVkIG9uIGFueSB2ZXJzaW9ucyBvZiBERzIgaW5jbHVk
aW5nIEE3NTAuDQo+ID4NCj4gPiBJJ20gaGF2aW5nIHRyb3VibGUgd2l0aCBnZXR0aW5nIGl0IHRv
IHdvcmsuDQo+ID4NCj4gPiBNeSB0ZXN0aW5nIHNldHVwOg0KPiA+DQo+ID4gMS4gUGFzc3Rocm91
Z2hlZCBBNzUwIHRoYXQgdXNlcyBYRSBkcml2ZXINCj4gSSB0ZXN0ZWQgc3VjY2Vzc2Z1bGx5IHdp
dGggYm90aCBpOTE1IGFuZCBYZSBidXQgREcyIGlzIG9mZmljaWFsbHkgc3VwcG9ydGVkDQo+IG9u
bHkgd2l0aCBpOTE1LiBYZSBvZmZpY2lhbGx5IHN1cHBvcnRzIExOTCBhbmQgbmV3ZXIgcGxhdGZv
cm1zLiBGb3Igb2xkZXINCj4gcGxhdGZvcm1zLA0KPiBNZXNhIHRocm93cyB0aGUgZm9sbG93aW5n
IHdhcm5pbmc6DQo+IE1FU0E6IHdhcm5pbmc6IFN1cHBvcnQgZm9yIHRoaXMgcGxhdGZvcm0gaXMg
ZXhwZXJpbWVudGFsIHdpdGggWGUgS01ELCBidWcNCj4gcmVwb3J0cyBtYXkgYmUgaWdub3JlZC4N
Cj4gDQo+ID4gMi4gUmFwdG9yTGFrZSBpR1BVIG9uIGhvc3QgdXNlZCBmb3IgdmlydGlvLWdwdSwg
dXNlcyBpOTE1IGRyaXZlcg0KPiBJIGFtIHRlc3Rpbmcgd2l0aCBhIHNpbWlsYXIgc2V0dXA6IFJQ
TC1QIGlHUFUgKyBERzINCj4gDQo+ID4gMy4gUUVNVSBsYXRlc3QgbWFzdGVyIGJyYW5jaCArIHlv
dXIgUUVNVSB2ZmlvX2RtYWJ1Zl8yIHBhdGNoZXMNCj4gYXBwbGllZA0KPiA+IG9uIHRvcA0KPiBJ
IGp1c3QgdHJpZWQgd2l0aCBsYXRlc3QgUWVtdSBtYXN0ZXIgYW5kIGl0IGFwcGVhcnMgdG8gYmUg
dmVyeSBzbHVnZ2lzaCBpbiBteQ0KVHVybnMgb3V0LCB0aGUgc2x1Z2dpc2huZXNzIGlzIHRoZSBy
ZXN1bHQgb2YgYSBidXN5IGxvb3AgdHJpZ2dlcmVkIGJ5IHRoaXMgcGF0Y2ggaW4gUWVtdToNCmNv
bW1pdCA2NDBmOTE0OWMzZGNhZmJmZWI0OTVhMTBmNjEwNWM2ZjcxZjI0ZDFkDQpBdXRob3I6IERt
aXRyeSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20+DQpEYXRlOiAgIEZy
aSBPY3QgMjUgMDA6MDM6MDggMjAyNCArMDMwMA0KDQogICAgdmlydGlvLWdwdTogU3VwcG9ydCBz
dXNwZW5zaW9uIG9mIGNvbW1hbmRzIHByb2Nlc3NpbmcNCg0KICAgIENoZWNrIHdoZXRoZXIgY29t
bWFuZCBwcm9jZXNzaW5nIGhhcyBiZWVuIGZpbmlzaGVkOyBvdGhlcndpc2UsIHN0b3ANCiAgICBw
cm9jZXNzaW5nIGNvbW1hbmRzIGFuZCByZXRyeSB0aGUgY29tbWFuZCBhZ2FpbiBuZXh0IHRpbWUu
IFRoaXMgYWxsb3dzDQogICAgdXMgdG8gc3VwcG9ydCBhc3luY2hyb25vdXMgZXhlY3V0aW9uIG9m
IG5vbi1mZW5jZWQgY29tbWFuZHMgbmVlZGVkIGZvcg0KICAgIHVubWFwcGluZyBob3N0IGJsb2Jz
IHNhZmVseS4NCg0KVGhlIGFib3ZlIHBhdGNoIGV4cG9zZXMgYW4gaXNzdWUgdGhhdCBvY2N1cnMg
aW4gdmVyeSBzcGVjaWZpYyBjYXNlcyB0aGF0DQptYWtlIHVzZSBvZiBzaW5nbGUgRkIgKHN1Y2gg
YXMgZmJjb24gYW5kIGRpcnR5ZmIpIHdoZXJlIGEgZmVuY2UgaXMgbm90IGFkZGVkDQp0byB0aGUg
KHJlc291cmNlX2ZsdXNoKSBjbWQuIEhvd2V2ZXIsIHRoaXMgaXNzdWUgY2FuIGJlIGZpeGVkIGlu
IHRoZSBHdWVzdA0KdmlydGlvIGRybSBkcml2ZXIgYnkgaW5jbHVkaW5nIHRoZSBmb2xsb3dpbmcg
cGF0Y2g6DQpjb21taXQgY2VmNTFjYmQ3YWM3MGQyMjVlYWEwZDRkNDdlNmUyOWY2NmViY2VkZg0K
QXV0aG9yOiBEb25nd29uIEtpbSA8ZG9uZ3dvbi5raW1AaW50ZWwuY29tPg0KRGF0ZTogICBNb24g
T2N0IDIxIDAyOjA4OjAzIDIwMjQgKzAzMDANCg0KICAgIGRybS92aXJ0aW86IE5ldyBmZW5jZSBm
b3IgZXZlcnkgcGxhbmUgdXBkYXRlDQoNCiAgICBIYXZpbmcgYSBmZW5jZSBsaW5rZWQgdG8gYSB2
aXJ0aW9fZ3B1X2ZyYW1lYnVmZmVyIGluIHRoZSBwbGFuZSB1cGRhdGUNCiAgICBzZXF1ZW5jZSB3
b3VsZCBjYXVzZSBjb25mbGljdCB3aGVuIHNldmVyYWwgcGxhbmVzIHJlZmVyZW5jaW5nIHRoZSBz
YW1lDQogICAgZnJhbWVidWZmZXIgKGUuZy4gWG9yZyBzY3JlZW4gY292ZXJpbmcgbXVsdGktZGlz
cGxheXMgY29uZmlndXJlZCBmb3IgYW4NCiAgICBleHRlbmRlZCBtb2RlKSBhbmQgdGhvc2UgcGxh
bmVzIGFyZSB1cGRhdGVkIGNvbmN1cnJlbnRseS4gU28gaXQgaXMgbmVlZGVkDQogICAgdG8gYWxs
b2NhdGUgYSBmZW5jZSBmb3IgZXZlcnkgcGxhbmUgc3RhdGUgaW5zdGVhZCBvZiB0aGUgZnJhbWVi
dWZmZXIuDQoNCkFmdGVyIHJlYmFzaW5nIHYyIG9mIHRoaXMgcGF0Y2ggc2VyaWVzIG9uIHRvcCBv
ZiB0aGUgYWJvdmUgcGF0Y2gsIEkgc2VlIHRoYXQNCnRoaXMgdXNlLWNhc2Ugd29ya3MgYXMgZXhw
ZWN0ZWQgd2l0aCBRZW11IG1hc3Rlci4gTGV0IG1lIHNlbmQgb3V0IHYzLA0Kd2hpY2ggd291bGQg
YmUgYSByZWJhc2Ugb2YgdjIgb24gdG9wIG9mIHRoZSBhYm92ZSBwYXRjaC4NCg0KVGhhbmtzLA0K
Vml2ZWsNCg0KPiBlbnZpcm9ubWVudCAoRmVkb3JhIDM5IEd1ZXN0IGFuZCBGZWRvcmEgMzkgSG9z
dCkuIEJ1dCwgZmV3IG1vbnRocyBvbGQNCj4gUWVtdSBtYXN0ZXIgKyB2ZmlvX2RtYWJ1Zl8yIHBh
dGNoZXMgKGFjdHVhbGx5LCB0aGVzZSBwYXRjaGVzIGFyZSBub3QNCj4gbmVlZGVkDQo+IHRvIHRl
c3QgdGhpcyBwYXRjaCBzZXJpZXMgd2l0aCBHVEsvU0RMKSBzZWVtcyB0byB3b3JrIE9LIGZvciBt
ZS4gQW5kLCBoZXJlDQo+IGFyZQ0KPiB0aGUgcmVsZXZhbnQgUWVtdSBsYXVuY2ggb3B0aW9ucyBJ
IGFtIHVzaW5nOg0KPiBxZW11LXN5c3RlbS14ODZfNjQgLW0gNDA5Nm0gLWVuYWJsZS1rdm0gLWNw
dSBob3N0LGhvc3QtcGh5cy0NCj4gYml0cz1vbixob3N0LXBoeXMtYml0cy1saW1pdD0zOS4uLi4N
Cj4gLWRldmljZSB2ZmlvLXBjaSxob3N0PTAwMDA6MDM6MDAuMCAtZGV2aWNlIHZpcnRpby0NCj4g
dmdhLG1heF9vdXRwdXRzPTEseHJlcz0xOTIwLHlyZXM9MTA4MCxibG9iPXRydWUNCj4gLWRpc3Bs
YXkgZ3RrLGdsPW9uIC1vYmplY3QgbWVtb3J5LWJhY2tlbmQtbWVtZmQsaWQ9bWVtMSxzaXplPTQw
OTZNIC0NCj4gbWFjaGluZSBtZW1vcnktYmFja2VuZD1tZW0xLi4uLi4uLg0KPiANCj4gPiA0LiBM
YXRlc3QgbGludXgtbmV4dCBrZXJuZWwgb24gaG9zdA0KPiA+IDUuIExhdGVzdCBsaW51eC1uZXh0
IGtlcm5lbCBvbiBndWVzdCArIHRoaXMgdjIgYXBwbGllZA0KPiBJIGp1c3QgdGVzdGVkIHN1Y2Nl
c3NmdWxseSB3aXRoIHRvZGF5J3MgZHJtLXRpcCAoNi4xMikgKyB2MiBvZiB0aGlzIHNlcmllcy4N
Cj4gDQo+ID4NCj4gPiBJbiBndWVzdCBJJ20gcnVubmluZyB0aGlzOg0KPiA+DQo+ID4gICBzZWF0
ZC1sYXVuY2ggLS0gd2VzdG9uIC0tZHJtLWRldmljZT1jYXJkMSAtLWFkZGl0aW9uYWwtZGV2aWNl
cz1jYXJkMA0KPiA+DQo+ID4gd2hlcmUgY2FyZDEgaXMgQTc1MCBhbmQgY2FyZDAgaXMgdmlydGlv
LWdwdS4NCj4gPg0KPiA+IEkgYWRkZWQgcHJpbnRrJ3MgYW5kIHNlZSB0aGF0IHZpcnRpby1ncHUg
aW1wb3J0cyBBNzUwIGRtYS1idWYgYW5kIGdldHMNCj4gPiBYRSdzIFNHVCwgYnV0IG5vdGhpbmcg
c2hvd3Mgb24gdGhlIFFFTVUgZGlzcGxheS4NCj4gQ291bGQgeW91IHBsZWFzZSB0cnkgdGhpcyB0
ZXN0IGFnYWluIHdpdGggaTkxNSBpbnN0ZWFkIG9mIFhlPyBBbHNvLCBhcmUgdGhlcmUNCj4gYW55
IGVycm9ycyBzZWVuIGluIEd1ZXN0IG9yIEhvc3QgbG9ncz8NCj4gDQo+ID4gSSB0cmllZCBib3Ro
IEdUSyBhbmQgU1BJQ0UgZGlzcGxheXMuDQo+IEdUSyBzaG91bGQgYmUgc2ltcGxlciBnaXZlbiB0
aGF0IHRoZXJlIGFyZSBvdGhlciBjb21wb25lbnRzIChHc3RyZWFtZXIsDQo+IGV0YykNCj4gbmVl
ZGVkIGZvciBTUElDRSB0aGF0IGhhdmUgdGhlaXIgb3duIHNldCBvZiBkZXBlbmRlbmNpZXMuDQo+
IA0KPiA+IElmIEkgY29ubmVjdCBIRE1JIGRpc3BsYXkgdG8gcGFzc3Rocm91Z2hlZCBBNzUwIHdo
aWxlDQo+ID4gcnVubmluZyB3ZXN0b24gY29tbWFuZCBhYm92ZSwgdGhlbiBJIGdldCB3ZXN0b24g
d29ya2luZyBvbiB0aGUgQTc1MA0KPiA+IEhETUkNCj4gPiBkaXNwbGF5IGFuZCBzdGlsbCBub3Ro
aW5nIGlzIHNob3duIG9uIHZpcnRpby1ncHUgZGlzcGxheS4NCj4gSSB0cmllZCB0aGlzIGV4YWN0
IHNhbWUgdGVzdCBhbmQgaXQgc2VlbXMgdG8gd29yayBPSyBmb3IgbWUuIENvdWxkIHlvdSBwbGVh
c2UNCj4gYWxzbyB0ZXN0DQo+IEdub21lICsgV2F5bGFuZDoNCj4gWERHX1NFU1NJT05fVFlQRT13
YXlsYW5kIGRidXMtcnVuLXNlc3Npb24gLS0gL3Vzci9iaW4vZ25vbWUtc2hlbGwgLS0NCj4gd2F5
bGFuZCAtLW5vLXgxMSAmDQo+IA0KPiBOb3RlIHRoYXQsIGZvciBXZXN0b24sIHRoZSBwcmltYXJ5
IGRldmljZSAoZHJtLWRldmljZT0pIG5lZWRzIHRvIHN1cHBvcnQNCj4gS01TIGFuZA0KPiBoYXZl
IGF0LWxlYXN0IG9uZSBjb25uZWN0b3IgY29ubmVjdGVkLiBGb3IgR25vbWUgKyBXYXlsYW5kLCB0
aGVyZSBpcyBubw0KPiBzdWNoDQo+IHJlcXVpcmVtZW50IGFzIHRoZSBwcmltYXJ5IGRldmljZSBj
YW4gd29yayB3aXRoIGR1bW15IGJhY2tlbmQgYW5kIGJlDQo+IHVzZWQNCj4gb25seSBmb3IgcmVu
ZGVyaW5nLiBUaGVyZWZvcmUsIHRvIHRlc3QgR25vbWUgd2l0aCBERzIgaW4gR3Vlc3QsIEkgdHlw
aWNhbGx5IGRvDQo+IG1vZHByb2JlIGk5MTUgZW5hYmxlX2d1Yz0zIGRpc2FibGVfZGlzcGxheT10
cnVlDQo+IA0KPiA+DQo+ID4gSSBhbHNvIGhhZCB0byBmb3JjZSB2aXJ0aW8tZ3B1IGRyaXZlciB0
byBhbHdheXMgcHJvYmUgYmVmb3JlIFhFLA0KPiA+IG90aGVyd2lzZSB2aXJ0aW8tZ3B1IGdldHMg
UENJIHJlYWQgZXJyb3JzIGFuZCBmYWlscyB0byBwcm9iZSBiZWNhdXNlIGl0DQo+ID4gZmFpbHMg
dG8gZGV0ZWN0IHZpcnRpbyBmZWF0dXJlcy4NCj4gVGhhdCBpcyBjb25jZXJuaW5nLiBJIGd1ZXNz
IHdlJ2xsIG5lZWQgdG8gaW52ZXN0aWdhdGUgaG93IHRvIGZpeCB0aGlzIHByb3Blcmx5Lg0KPiBB
cyBwYXJ0IG9mIG15IHRlc3RzLCBJIHR5cGljYWxseSBibGFja2xpc3QgWGUgYW5kIGk5MTUgYW5k
IGxvYWQgdGhlbSBsYXRlcg0KPiBhZnRlciBib290aW5nIHRvIHRoZSBjbWQgbGluZSBhbmQgYmVm
b3JlIGxhdW5jaGluZyB0aGUgY29tcG9zaXRvcnMuDQo+IA0KPiA+DQo+ID4gQW0gSSBkb2luZyBh
bnl0aGluZyB3cm9uZz8gU3VnZ2VzdGlvbnMgYXJlIHdlbGNvbWUuDQo+IENvdWxkIHlvdSBwbGVh
c2Ugc2hhcmUgeW91ciBRZW11IGxhdW5jaCBwYXJhbWV0ZXJzPyBJJ2xsIHRyeSB0byByZWNyZWF0
ZSB0aGUNCj4gaXNzdWUgeW91IGFyZSBzZWVpbmcuDQo+IA0KPiBUaGFua3MsDQo+IFZpdmVrDQo+
IA0KPiA+DQo+ID4gLS0NCj4gPiBCZXN0IHJlZ2FyZHMsDQo+ID4gRG1pdHJ5DQo=
