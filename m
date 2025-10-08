Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E00CEBC3334
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 05:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21E510E740;
	Wed,  8 Oct 2025 03:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MquWeNKC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010071.outbound.protection.outlook.com [52.101.61.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6903B10E03A;
 Wed,  8 Oct 2025 03:18:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsyRiRdGDa/2zg5BQWADUJk28LVXwamMF2aKBAS9kFFPFa1oRiZCpg71Xb/QBs4/DhyZJ1acgu1aVnW7kdgVc5ZTmGhPi+E914dKZRmwdadlNZwjBLm6h+dCYknWThyNhBmQoG3AQ0ddg08p3/D4izCyyCv1QJeG1aBd6aur4nP5AUODfmz2ETzpDPJz99RjdeVd+P4S9A3PYWvVzvYaS2uebso1e0W/JUIvFoCO4WvFLC3b7J0vGlzwExsct/RDyusPNv4Jj7pZcKqkA9yus5CVsLGPS34Yd6IvYViQTwIRapLvCgA/1gpayCQdUd4U69AR8UyNRJL1q1WA3x9N3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDOooVC1Iv1i8WhadeYmyh82H+Hz50ChtH+RVeiqcv0=;
 b=syqvqFGnsvkLXbT0gb8NnbF8tj3t8XYd6/RbSGgutfzOStuYS/z9y++nOagCwcgI/4C78clRtmYGsaE6t2ftlb7da3hRBa4+XPs/sjp5/EarQ6p4K3SGFOVypmid8qy84ZN57AbE0lozAfp68pHRjTOS3Gng7yF5/hEvcQWAleyn2nHQO+vdvGyLdWdi3rr/OubahpdMJ+q18L8XbuSkhuVYtsX4HLyEfG4tMQASe/6Yf++uZn8aX1JM2WFEE4PVeg1ZaXt3CxDfKqL/HioD3Qj+UZ7V7dBupHvIjeTfsJ2bWS7Gjvv4VO17Kdhuen3cv7PGuytu7H6nP+Uybc/3EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDOooVC1Iv1i8WhadeYmyh82H+Hz50ChtH+RVeiqcv0=;
 b=MquWeNKCcKQK9NzC1Rkqv8FLwaQo4FF5vIZf9CvDi47z+yZLQqXCcmB4hDxfq7p3TZt26spBr8sTCLFSodZVz9zIvU1uxbbyXpIOzTdcvKaL5hf+CWfl0fdG+9k+08+VQCV6Ka2D3ZdstblrNuO0ErQbvOiXhNUUAEqI2GNrHqfPPJ6pNMK5rm6M21dy9kGpnwAOQBdt1BzaEIlUVj4JIAgehVUhgRgSFHmdI50QdPPn1/JC6D0tHlH74ngz/5QznoLBIKKB5xouA3uLb9ZVd094Kv1SMA50qwQlNCJQIsWmGTR6c2GS7H7OMGPYvnMbYrU/ELd70TomfOt2h4KiFw==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DS7PR12MB6142.namprd12.prod.outlook.com (2603:10b6:8:9a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 03:18:22 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 03:18:22 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "airlied@gmail.com" <airlied@gmail.com>, "pvorel@suse.cz" <pvorel@suse.cz>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH] nouveau: add option to avoid 535 firmware in initramfs
Thread-Topic: [PATCH] nouveau: add option to avoid 535 firmware in initramfs
Thread-Index: AQHcNysd9qNU+e6b00yF0jiV6WT0IrS2BtKAgAAAtACAAALFgIAAwymAgACvXQCAABk+gA==
Date: Wed, 8 Oct 2025 03:18:22 +0000
Message-ID: <4d706ee978f0e975e5bb99e2ea342fedfbac214b.camel@nvidia.com>
References: <20251007013207.1469618-1-airlied@gmail.com>
 <d57eb562b87f9c3ead50acc81d76526e947d0ab9.camel@nvidia.com>
 <CAPM=9tx3Q4NdAc5NDGUjdjOH-ZPagKNu43+zOUZTVcpEO9zSsQ@mail.gmail.com>
 <a02a0105aed482a977b06e66391b35e5a6f39cd0.camel@nvidia.com>
 <20251007152021.GA139177@pevik>
 <CAPM=9tz_fnRxZm74C+JuxZjCbGEH66JbabN012zVNgKucrw8oA@mail.gmail.com>
In-Reply-To: <CAPM=9tz_fnRxZm74C+JuxZjCbGEH66JbabN012zVNgKucrw8oA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DS7PR12MB6142:EE_
x-ms-office365-filtering-correlation-id: 21e939b1-5561-42ca-9eb3-08de06195672
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UzhwZXpZWndzQjczVEsvRW1NQU9DK2w4bXBMSldoV292dWFXWFJ3MmdROFpn?=
 =?utf-8?B?QWNoZkxNWEJLVndJVUJya0JRU21qZEdJaDBJek40b0JUVjdrME9yRkF6UEQ5?=
 =?utf-8?B?Mk9RUDZWeFRsWjduMnZKRFFzekNVMUxxNmV5SkIwdHY0NVFaL29ZNy9TaDk5?=
 =?utf-8?B?VzFMRUV2VmJXTVVTRGRRdU54Rnh5TU9SaXB3dFBscjhza3ZMbG4raEZRYjlk?=
 =?utf-8?B?NHpoZ1JIaXllL2xIZ2t3MjlpT0c1RVVaTkZMRkF0R3hkZXVPK3BJYVExV1Zw?=
 =?utf-8?B?NGs4cDhFdEZlc20wQldMMjVyMXhJR2E5NVVuV01DUkVFTFZZMGFORHhmNmVW?=
 =?utf-8?B?Y2JwbnNSUThoVXRWTGtZa09wNEIxa3kvWTREY2h5WGorKzFmTHBLejJWWEdN?=
 =?utf-8?B?WS8xRXp2Mm9HOC83YlovSDhleG9zYnlJWTJtdm1VMHI5d2J3OUR4ZW0wVFFr?=
 =?utf-8?B?SDgvRDArV04ybmN1VG5wem05MzUwRzFMbFEvU0taRWc2YW9vaG51QnAzNVpO?=
 =?utf-8?B?WkFZMG5kTWZRRS9xZTYxam1FNjg3b2RhemQ1QW1idHF6NmwvdmttOFpGYmpM?=
 =?utf-8?B?NG05dFVZUG96UkZ0dXdlZFFYUm53RlhhcnZZTk9FTDA3YVJzQTlWRUl0RGt3?=
 =?utf-8?B?T3RwSjY3LzltRGFjWTVGYzdCT1lIeXVkRldlZUFxNUREc3pYNjk1QmFsVk5Y?=
 =?utf-8?B?V1hvcnJlZGEyaC8yd2FXV3IvSSt2akxqTzVjMGJXb1dSNlBrZjBiUVNVV2FC?=
 =?utf-8?B?RXVpR0tITEVVSldTeW1ZRlpXYndaSEhTanJScnFvUHVhMjZwNmRNbjBJVDVr?=
 =?utf-8?B?L1hJaFJCKzNpTDRJRmtQNmw2WVF2SHBjQmc2VVJ5bTdjM3kxMlFXbUxuODFJ?=
 =?utf-8?B?V2hPbVdHSHpLRUNTc1I3akRrNVlRdDVmU0R6Y0tSbjVHWWYvcXR5TDE2OWI1?=
 =?utf-8?B?SGtTSEMrWCtZUGpETnp4K0pFbis3Y1NnOHdrYUlsYkxEWmFJQ2RPTVMxOWlt?=
 =?utf-8?B?aTRjSHVucWZGMHZZa285WlNNUko2WjFkZmNiZ0g4OEp1RlJraVNjVFo4akhV?=
 =?utf-8?B?dGNHWHNjZjQwQ0J5c2Z6L2EzVm1zazJ3RmJxRHY0b2Z2MFMraE1LMVp5bG9y?=
 =?utf-8?B?cXRlTHZwSU1qTlhVUWRkRS9ydVVycTB6SWxDMW1YNExXQnlkbE1kMitWNW5j?=
 =?utf-8?B?SEVqVGVtZ2V5WG5sbVVZeCtGZWltb1RGSUYzMUhlOW9GU08rOXEyVElQZmk1?=
 =?utf-8?B?Z3RPM0Ywd0ViV3ZwWU9PNEZIclM2L3V1c0pZN1VKKytVUk8zVmV4NzFhTDYy?=
 =?utf-8?B?VG9Qb3N2V0ZJdzA5RmhvTGZiZUQ2RDVQTjE5YTJlRU9wazhScVJoMTJ5aWNJ?=
 =?utf-8?B?TDY5NXVFMGdKTzczd1MycWNSRWtSbnRSWUw2TzBPaVA1d0g4TlBJdUwzSGFj?=
 =?utf-8?B?YUc3OUNNZFdYZHBzM2dGTlBwVWRNMHNBWHFBU0lQaWlsQ3pSTFkvK1RYOFFo?=
 =?utf-8?B?MldGU2dObDhDakF6TnVNT2lRTTNRWGIxdm84bmo1YnRvSVZjam42aDZCWGpH?=
 =?utf-8?B?aDBEMWNtbTRBWEVSbE1xbVRaZ3BzZHVNSFA2TWlZYWRTeDZ1ZVRNRjViVE4r?=
 =?utf-8?B?bnhSSGZjVTlJSlNNV0V1cnpaNXhhMVFiMkpoRlNpYlNFL2hTdEh6eUxBN3NT?=
 =?utf-8?B?alY1dUdwSTE5eXExRmlGeklkSmFYSHdzNm5RcmZBMm5QdTI4ZXZBdHB5R0VV?=
 =?utf-8?B?SWJ5ajNKbTQ3UDZ3Z0lWaXVtQWRMSDFvbEljeWwzVkFCYWVPdGF5VGFrOWJ4?=
 =?utf-8?B?VWVrSkp6bnFuUzV5Q3RUMytJcXI2bHYxZU5qWHdHNXVYT2UvK3FsS09GV1k1?=
 =?utf-8?B?NlJDTG1MbTdhOVRLbitTWVFpcExGeEFZY00yTUl0UjEwUUVPMkk5cVE2YnFN?=
 =?utf-8?B?dGtnbVY5VDF4bzgxZ0dMMlFCQmZreXh5aks1a0VUcFNiU0E0SGk3dnkxR0dE?=
 =?utf-8?B?RE9qZlZaRXRNQ3VoUVpIVjM4dEVtVERkZkZjRTM5L3lFNDVDeHdTQ0lma2RP?=
 =?utf-8?Q?/jlS3P?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFdSMjRpVXZqZTRDV1ZIb203TU1LeG1iQ0Nuei9WMmpzRnc2MnViOStZYVRo?=
 =?utf-8?B?Y3NpdEgzbXJBdkFMd2xYbS9OUTRrK2tKRmtGSHNCNCtuZlFlV3lxS0R6bTlF?=
 =?utf-8?B?cmFrUkpQcHkrajBDTjFTbkNrby81NEg3R1RoUFVRdG1udVdHcHhZTzZ1djNu?=
 =?utf-8?B?bzV3Z1F3cDdkaHgydHhObFFqUXhDenRENmFweUhybit5OThaR3hUcit4Y1lI?=
 =?utf-8?B?aGcxbnJKQm5xTzFrcHNpVDFyS0xRZW9qTjJLYldTWlc0NFFrVHVEU2I0WHVM?=
 =?utf-8?B?bDlXbFF0SHFDL1dpN2NVOVJSd2pjZVR0Y1Q4azltNWFZTWs0Y3A3QUh6WTQz?=
 =?utf-8?B?VEI1MEN4YU04RndBNS9xbFVvRncvTzdrc3ZJQk9FVUNLMWlQOGxCL2lwdmFQ?=
 =?utf-8?B?dm5ZK2orTmd0Zll6ZnFBV3BPdEh2TFRxWjEzcVU0WWhxSkJrWFQ5WGt2QnNp?=
 =?utf-8?B?RWJCaFczR2RCYitlbk1pVUtJNXBvVHdEekkxL280YTFFSmpSbk1Iem5ra2xL?=
 =?utf-8?B?YmUvYkovS0pUc1Q2OC8rVGcvVTVHajZOcEQ0UDJPK2FJR1RWMUF0cm55Lysz?=
 =?utf-8?B?N3RzTkY5RjR6aDh2bW8vWVFsQ2hSOGZjUzJqRW51RnJsK2hWYWR3T25rdldw?=
 =?utf-8?B?YnBDTXVSUlUySjhkZndnOWhnYmRRUG0zU29xYnFrU0xoR3owdE1namc4UUo5?=
 =?utf-8?B?bnZhVzUwMGV5cEpTalNhTHduVkNaaTJJeS80bHZISmlFbkV4dVdpQ1YvMUhB?=
 =?utf-8?B?RTZzQkk5eUpyaWVTQ2pQNjFKTWl1a1NWSGJrNVRTSkdGYUlFVjJ2ayt3N3Zq?=
 =?utf-8?B?YzNRNmUxN0VIYXU5cFIyT3NlNDc0UzE5SDNuV1llZjA4NHJGbUpoTkxPb0cy?=
 =?utf-8?B?ZU1keDlpQ2VhSnBGUnlOQnVNenlKNDVCOHZsUlIwMGEzUGdiNkFjcGRwT2lN?=
 =?utf-8?B?TWw0R2xieDhWQzkxcGFuQjZNTjkvbmdUYkRJbzBhaEt6dE9NdkI2T1cyOEt4?=
 =?utf-8?B?S3FSVDVSc0pTMmxERWlPdUpndWt4RUdTTTJkNi9FRUZMUnpBNnhBSXQ5cVl6?=
 =?utf-8?B?V2U1SnpaNHJ3MStPU3Y5MGlSV2FrV2lvQ1ZlQVhzRTY1TnBSOWFGK2tYNFMr?=
 =?utf-8?B?a2VUT25hb2ZlY2Q2Q3JWSGEwanRsUnJaK05RTlZWYWN2aXNaOTgwUjJxSDJF?=
 =?utf-8?B?NzBZTkNHTFNBUmh1Y2FiTVcwK1RIYTcrOVI2WW5CYjVSYUluS2ZUUzhaY2FB?=
 =?utf-8?B?c1hHQmwrNXg2UW9jRUhoNWdNZmh6bzROWTBKekZwVnVrY2YzaytMZm5CWnBC?=
 =?utf-8?B?RXlVK0pLVmhjNkpLRjRKVlExdzg1ZmR2bXFxMU9GNWNrZ1F1WXNTYll4bVRF?=
 =?utf-8?B?cU1JbHdQRHNWTEExQzYyWWFJeW0vOENPbm5CRXI3aThISHdaZlZkc2QxOGgx?=
 =?utf-8?B?L0RsYzJvTDZxam1XYWoyaDRWbDBxSTNXcUVMOW1Pb0IxVlhleVptK1NpZE43?=
 =?utf-8?B?dGFqUGZQVlhTd1A5Kytra1BJZkE1aW1IVnIwZHo4ZDlCMEk1VGNHdFNENU1p?=
 =?utf-8?B?MXI2TzlMVzBtY1BpQWp0Z1MzMmxKdEpUZTExT255VWR0YjJQbFlrSWJER09Y?=
 =?utf-8?B?WGFQaUZ5MGpJVUFYeXNPQzRkSVlzcmNDRDgwVGpMQXlQMHJNRkhSbVpDOVJr?=
 =?utf-8?B?RlFaVUtXU3k1OUJ5Z1pZRmcwYTRRbXdDSVduQmFpaFpNMENxRUZPV0ZtWHBi?=
 =?utf-8?B?YWZCVUk4Y1liOHo5SElpNDFZcEROS2RGMVF4Q2FGRCs0NCszVTJZTVlDd1ds?=
 =?utf-8?B?dGpDb2dKdE5zU294RGhHamxldXhWc1BkOVYrQ1dCZFpsM0hSMyt4QzU1L0NW?=
 =?utf-8?B?NDFSNndYNVFVQUpoNmlKMWEvVzRqVkRhVjZMMW81eDlRUFlXaWZNK0RUR0Nt?=
 =?utf-8?B?U04wYTVJVDRjNlBBZXo0U1NaUTNRaXVCQ2FHaXVwcE1kQzBpWGw1a3JVeGFK?=
 =?utf-8?B?RDlzNCttaEo1a1Mwb1p4SGdFaTNsK2k2WVZaclRmUlpRN1IwdVNEYm5rRWFG?=
 =?utf-8?B?NzgyVXBpbW1ZYXE1Y051N3J3YWxnUHg5QzNDdHJmZkVvUG5UdGFrWDFiSlZn?=
 =?utf-8?Q?AAr4ggSVcCZRdv+vf2sVcsGYL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD70A8C531548348932040F267A3423C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e939b1-5561-42ca-9eb3-08de06195672
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2025 03:18:22.7280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wevSNDyCVqofusvtsZB8C/OQYoqKlphylScs8edq72DqbF82MgMGw9q2N/uNQ6WCmlECJ49fCMTzfi9QXkXcug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6142
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

T24gV2VkLCAyMDI1LTEwLTA4IGF0IDExOjQ4ICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4g
SSB0aGluayB0aGF0IGlzIGdldHRpbmcgYSBiaXQgY29tcGxpY2F0ZWQgZm9yIGRpc3Ryb3MgdGhv
dWdoLiBUaGVyZSBpcw0KPiBubyByZWFzb24gdG8gZXZlciB3YW50IDUzNSBvbmx5LiBXZSBkb24n
dCB3YW50IHRvIGdpdmUgcGVvcGxlIG9wdGlvbnMNCj4gd2UgZG9uJ3QgYWN0dWFsbHkgc3VwcG9y
dC4NCg0KTXkgVWJ1bnR1IDI1LjA0IHN5c3RlbSBzaGlwcyB3aXRoIGtlcm5lbCA2LjE0IGJ1dCBv
bmx5IHRoZSByNTM1IGZpcm13YXJlLiAgU28gdGhlcmUgc3lzdGVtcyBvdXQNCnRoZXJlIHdpdGgg
cmVjZW50IGtlcm5lbHMgdGhhdCB3b3VsZCBzZWxlY3QgNTM1LW9ubHkuDQoNCj4gVGhlIG9wdGlv
bnMgd2UgaGF2ZSBpbiB0aGUgY3VycmVudCBkcml2ZXIsIGlzIHlvdSBnZXQgNTM1ICsgNTcwLCBh
bmQNCj4gd2UgZ2l2ZSB5b3UgdGhlIG9wdGlvbiB0byBzYXkgSSBvbmx5IG5lZWQgNTcwLiBJZiB3
ZSBhZGQgNTgwLCB3ZSBhZGQNCj4gYW5vdGhlciBvcHRpb24gYW5kIGZpeCBpdCB0aGVuLCBidXQg
SSBkb24ndCBzZWUgdGhlIHBvaW50IGluDQo+IG92ZXJkZXNpZ25pbmcgdGhpcyBmb3Igbm93Lg0K
DQpXZWxsLCBsaWtlIHlvdSBzYWlkLCBpZiB3ZSBtb3ZlIHRvIDU4MCwgdGhlbiBub3cgd2UgbmVl
ZCB0byBkZWNpZGUgYmV0d2VlbiA1NzAgYW5kIDU4MC4gIFNvDQpsZXQncyBzZXQgdXAgYSBLY29u
ZmlnIHN5c3RlbSB0aGF0IGhhbmRsZXMgbXVsdGlwbGUgdmVyc2lvbnMgaW4gYSBmdXR1cmUtcHJv
b2Ygd2F5Lg0K
