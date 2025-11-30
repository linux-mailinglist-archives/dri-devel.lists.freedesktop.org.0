Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 950BEC949F3
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 02:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EAD10E23A;
	Sun, 30 Nov 2025 01:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oJI11G8B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010002.outbound.protection.outlook.com [52.101.56.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431A410E232;
 Sun, 30 Nov 2025 01:04:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDHRiWctDsPejvNnhti1GOQw4M60r1Oyl+xpteWCoD33IGf86ewPNmmC8/hU/Id7PrOLjd6Pr1VblgiLFPsFsR0sDMOiDk56VUlAvBZRAouJTfd8hattfPhliJ6LOD74d3Xd9QNebGTPuGmQouNA0T1rDGCKl1CmLuS7PGYSJI0U5juyGPLlyfEN/BH1OPNpF/LmRs6ozZJu8sHwSjoKp5LqBg9mE+t7P7J4ucbPxffAw67XRupdc1UbQihDgDPGk0wfCUbWAntXAtNImG/tH3kun5XDetsX0SFp3UE+1O2STjmSF8Hmilu25yz2kc9rbZ71K0DXqgFm/Vw0P4aMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNImZ5CCFwZ1BsFHoB6BLU6Jz2f78/JFAbMxzdSrxqM=;
 b=RCvmaBi0u71wMkHOvuTpWlaAd493WZCIiGvn8OzcPEfMAvudFsls+cBADOAim3wC9N9nmAPe3wJOJ5Bqk54iSAekI5CxV6xSCc3bGTO5Au6bgZnOo/RhmHoFzClX26sgccrECnPeyW9PaXIseKjB05kMUvPcsyo16oCMV2uluJoAhWx+9ZEd1nWteMhNdmUIDp1reod5/4SItOBvpltMyESy8IzZcX3Yvc1SDtEiUzGthkxw3E8Ngw/cNztQtyhH1QZSeQFO/3OfEfQozqYh8eRqIFIgHlnuxvS8XoZ29ya3jEsC7bnu/QSwJN7TsC0pwqnjygEXudIUqIc85PG7iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNImZ5CCFwZ1BsFHoB6BLU6Jz2f78/JFAbMxzdSrxqM=;
 b=oJI11G8BeB4aiJDMZxAJBkG9G3l/+QhvHIaz/PJUh7ftmFNWYXzttzV80mn7Cx9QnTYN5hrM974ArEfYycoI4+zqfRfHAVH9BIrkrtmFxugelVYFVqOQI4BWp4UwubVER1dMz6IAg6dsb+FvTWQEPvuf0CQZ7rtoaQ0KGc+PkN5vkRAsZHg2Qo6RBrcGNIMfDNIwU3iFKbXTzWfzi8d6tBNDN3gR8WGIwVG6HXCcyPFjnTBkRhCHaOshLqISgsLh6fTRnp/6lAU35wT6vY00vhhExs1duqlAm4FI+LI2lAG8kmO4T9LaZNO8rN7hxpALblGCPSdFo62SlmJe9eHKNQ==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS4PR12MB999099.namprd12.prod.outlook.com (2603:10b6:8:2fd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sun, 30 Nov
 2025 01:04:51 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Sun, 30 Nov 2025
 01:04:51 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
CC: Alexandre Courbot <acourbot@nvidia.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, Alistair Popple
 <apopple@nvidia.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "boqun.feng@gmail.com"
 <boqun.feng@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>, "elle@weathered-steel.dev"
 <elle@weathered-steel.dev>, "daniel.almeida@collabora.com"
 <daniel.almeida@collabora.com>, Andrea Righi <arighi@nvidia.com>,
 "phasta@kernel.org" <phasta@kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, Nouveau
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list
 operations
Thread-Topic: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list
 operations
Thread-Index: AQHcUy58YAKhaa3SYEu72qT54gYYALUDj+0AgAA481eAAHVaAIABJoGjgAAjbQCAAInegIAAj/oAgAIZcoCAAaGXAIAAJ0Le
Date: Sun, 30 Nov 2025 01:04:50 +0000
Message-ID: <021990F1-196A-47CB-8200-4B6887058BEA@nvidia.com>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com>
 <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
 <DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com>
 <F3A7E1BB-883C-4EF4-B245-8E9DD329131F@nvidia.com>
 <03003f10-00c0-44dd-b9df-5763cc1e715f@nvidia.com>
 <7529a7b1-b204-44cb-bb34-57161e6b7b8c@nvidia.com>
 <DEJIUDQ3ZGPA.2UIPTGU4WT7RW@nvidia.com>
 <7627f224-5fe9-456d-8981-8b3799e332e1@nvidia.com>
 <b79fc5fe-3682-4439-b669-663e234943b5@nvidia.com>
In-Reply-To: <b79fc5fe-3682-4439-b669-663e234943b5@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|DS4PR12MB999099:EE_
x-ms-office365-filtering-correlation-id: ece55d9f-9c16-473f-407e-08de2fac76fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?bGI4bjFnbUFtc01hTHI3OFk4dUNnNkRKUVJRR3ZuajNCUndCZ0NCK053b3p0?=
 =?utf-8?B?b1NBS2tKTFFZZDhPTEdMTEhLRldoZUcrTzVldTdXOTdFMHNuM2M0Z1VBMVNa?=
 =?utf-8?B?OXA0a2FwY2llK3F4bkRGREt1UVdVN0dCbDd6K3FUb2pXakZpM0Z6dnpONW96?=
 =?utf-8?B?UGFkc09qR0hROXBzS2VNTVZvY3hPMEVRMUVtZjhncFdBanJ1NVdtWDZZUzFu?=
 =?utf-8?B?TXNrZjJpS0ZaZU9tOENBaHRUSVJCMFRFb0VxZmRtaE5SNW1tRytkNTRiTE5Y?=
 =?utf-8?B?anFoNnQvbHorSzRvdUZHOVhWNmd5cXJxQ2dsQmJQRmlkL3pYcE11Mk93N3lW?=
 =?utf-8?B?RklEbFM2REtFZE9ySVp6dWVwSmdtdVJ0a1ZteHJIRDdyY2lMTkJYalZqeERC?=
 =?utf-8?B?VjJ3MlhmdHNSVUFnY0ppakFKalAzNENJbGxRVm5ISE5mVkpZMm9mVHJDNFow?=
 =?utf-8?B?YjVZVFNULzByZVphcUlTeHVkUFRJeUNYNStUeGE4UUFJdzNhM2NkS0ZoTmw5?=
 =?utf-8?B?Zng4cWRocWRENytTelNRUWZtOEhGTkhQRmFKNlFOdDFYMWYveDUxVGZrRjRa?=
 =?utf-8?B?SWI0bmVUckVybXpJTVJ4U000U2plaFVrUFRBUXUwT3AwSHVUY2YyTzUxMmRD?=
 =?utf-8?B?cjJFaWswN0ptNGpvdWtNU3lnaENVUHlPWUpLR0wwNVB2alZFQkxXQ2xLWTNP?=
 =?utf-8?B?UVVaVEF6MUhVek1ZSVk2aDhQRGZOUTJzRGc2RlBRckhrZDNmYm9TTDNnTFBq?=
 =?utf-8?B?V3hMUHQwOHNmcUR6eUNHakJSdjJMVTBMSlNrcjA0Z0t4MUduN3pYeksvTWtQ?=
 =?utf-8?B?NXB2R2czTGQ0ajRQR3hIbTA3cjB6dUFzaXM2RzJpYVFUeXRjV2V1ZmE2Wlhw?=
 =?utf-8?B?U1dnTzZsbDlmQWNpSFVDUzRIVUFLcXgwSnQxUWhJcnVJQnViYml6MDBDdWRM?=
 =?utf-8?B?ako1UHBRQXhBWmtzbTNmTm91MGt5LzY5R1E5Rno1NnV0Z3Qrb0dzY2lhT1g1?=
 =?utf-8?B?SGVUdnZHZU5VdUNCSlp2VVdLMUNHU0FaeE1zLzM2ZThjU3ExaG9IY3IzQzZM?=
 =?utf-8?B?RDE5MWd2R1k0eWZrUUdoUEpIWE5mQlc4TlZBa3VQZWkvSm0wV3BJRFNrN0p3?=
 =?utf-8?B?ZkFCczBLemt5aDl0Qm5KSzdGVzY1cFRBMU05RHE0cm9NQ3NXV0R6OGdROHo3?=
 =?utf-8?B?V0ZJQWk5Y2ZXTnFVOE03MlZSZExKcWE2Ym5DZGdDTHZ3cERBS1p1WXlWdWht?=
 =?utf-8?B?czNueTdmSThXaVFHYzYra0NEY2FxKzYvWllnclpXOHJKR0dGZW0yb3FiUW8r?=
 =?utf-8?B?VVorK3hDR1Y3WjR2VmpHbzRuRitGeVNJUWw5aTBsblFHNzQ3aTAvRXJvcCtj?=
 =?utf-8?B?anJUcXd6ejQ2K1o5SFpXQ1dxdllrWVpnYXJPdThMdEtLN2Q0U3ZiTlgwNFp0?=
 =?utf-8?B?alk5aytjLzlERHJUMnNrMnlFTTZGeklaQTY2VW1uZ1NMV2JTNDVFcjQzZE5x?=
 =?utf-8?B?TzJVWEhOM284cTJqL0JsVE93dnNiNExHT0JNRVQ5UUs0a0ZWaGhpUUpadG0x?=
 =?utf-8?B?VEpobDh4Y2JTZElxR3JpclZIRGhqRjRtT09QMmtHMGduNktXc1VwZ2JqZjVo?=
 =?utf-8?B?cUQ2bGtySUxjM2ZYQUtNV3ZGUXdBMEdnVU1UT2xZMTdjQWdlUEo1U1FFT01D?=
 =?utf-8?B?c3ZQamFXaE9FZGU5K0RTVE04VHN6RHpRdi8rTGpNUG13eEFjZUtXYThZazZa?=
 =?utf-8?B?NmhMY3M3MWJKQmdkVENTWWExaCthMGdFYWlmMDhKUnByRFZZbWp0ZU9QUFJ5?=
 =?utf-8?B?RjBycFc3b0c0TEtLcnlBZENSVmVmQUR2VUptcjEvbW1uRmdKc0hJQjRzamVZ?=
 =?utf-8?B?MzB3RGRTU0RMOCtkSFhlWkx2THN6OUUvQmF3d1hlNFBpcklvWllVV3BmYUhY?=
 =?utf-8?B?Vm5sSnR5eVdSdlkzT29kY3M1QjA2NDVXZzlGTkdtZEhJblFITUZBVzBReFRQ?=
 =?utf-8?B?amRKQ29JaDAySENSKzlEUGpTUzhWNkpuWEtuOXVOR0E4Q3BrU3p1enhYSWFH?=
 =?utf-8?Q?9CJbOd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHJySWx0bzg1TllMOGRiRWFhL2VTQU9wL1BxbWpVd0VtWFZzbGxPQTRPVDdN?=
 =?utf-8?B?WFpZdFk0bUdxSm11bzU1MXZhNDJtdC81MG0ra2RtRlY2eEFlWTZXR1V0KzNJ?=
 =?utf-8?B?V0dMSS80VWpCdTMvU0ZqV3g2UklFYXBDM1BzbTk5ZGxsUmdTa1VjVjlwcHpo?=
 =?utf-8?B?cG9wcEorSjcrOTMzU2lJVDZMNjRSSGtCUlA0ODJETTdHOTJFSTAreFpxdlI2?=
 =?utf-8?B?OGNXMzBWMkU2M1kvaklaUWZUMjBPSEdSYkVYMVRwdW5YZUJYZi9BVVBBUW5N?=
 =?utf-8?B?ZlVPbFdOL0hTeHdmelRRdDArY1F2SFpRWTBEUXZOTnFYWDJQUGc1NUJSUmtt?=
 =?utf-8?B?Ly9EN3h1b2pMWHg1UDNYS1Z0VWdoUGM2WWFwWFcrWitUa0FzaFo1THZFSGti?=
 =?utf-8?B?bk5lMDR6WHRCdVpkZG1nbDNxSHpraEN1bm9kVGZYNTd6bVVXUGpTTG1PNkxC?=
 =?utf-8?B?R1BGaFI4RVNOb2ZYei9lR2FXeGR3aE9UZXozT2RneWxLQmlCZWMxOGpPMHI4?=
 =?utf-8?B?QWxPSVA5TGViR3NmVVQyQ29BSXdkb21OS1RkSlVpMjhWRG1aSWVDSlladzQ0?=
 =?utf-8?B?cWJNa2FSZ0w3cUNrTFdsQUQ1VUQ5VUE1cUxyL1hNMmVHdnFraTRDb3RkNHVB?=
 =?utf-8?B?ZmtoQTJDUGJsYTd1ck94SGVKWVBrUVhUbmwvTE80dGo3SWQ3Q0ZsSHp6em50?=
 =?utf-8?B?SlJUVmZzK0FnaFMvbndsU29IMXlSdnlJNS9nS3VzYVl5Tmt5Vnk2L2xtaDI0?=
 =?utf-8?B?YmQrR0o2clFCelpxRkRFNVRRQkRYbnAwQkM0aGxkNmZPNHJORHZiWC9MbWlp?=
 =?utf-8?B?UlJsT25KWVl1UXJ2UEwzajlvRnk0S3dHY2x6VzNsSXN1bmZEbnFvS0FqYmdY?=
 =?utf-8?B?OFA4V2FXOElJYkVTa3lNaGZSZFdrRGhNQXdnR0haUjZCUEFyVlE5czhKQmtX?=
 =?utf-8?B?RTNIVmVlVy9yWmlsWUg3a0F5NWJiZm9hU21iTjcrS3VwYUc4Q09wNjhjNThN?=
 =?utf-8?B?WGlkaThkWnduYm5KOWdtYmFlUUJ2K1BwdkpwbmFCQzByV2pPalI0T1NyeTRp?=
 =?utf-8?B?VHJOY3pxTEkyY2RFNS9pSGlzbFIyVyt6R28wWmtyOHVVRGFXVHRMK2RCY2Fu?=
 =?utf-8?B?WWtEaWw1Z1dYMmRjNlo0dktneG1nV3cvRUVmTFBOaXFxN2I0RHo1K1JtTHk5?=
 =?utf-8?B?TVZ0bEpVK3ZMdHZIYnc0MWlSb3pBYzRyLzY2K0xyTWxmdVhaVW53QzNBeDBk?=
 =?utf-8?B?K1c5RUo4STdGZ0ZRcFhoOWpEclR4cVRXY1JVUU84WmRTb0hNSG5sTFpJU2Jm?=
 =?utf-8?B?TVFOWkdvNnJLa05vdG56dnd4MnlCYnMyclJLVyt1dkpVYWE2bkk5MWVONVN6?=
 =?utf-8?B?VVlUKzdsZWkydjhrWlZwUHZ3WjdwQUVLcXJQanlLbkNLZS9ObjVPSXcvM3pT?=
 =?utf-8?B?eW83YzRlZldMd3ZZL0dFOHpiMnNGMnQyVmdRYlZhZGVYenJGZW1xVy9WWXVG?=
 =?utf-8?B?K3RLY2RpcHpVekhKai9TOWZqbm1PZHhyNDV0dHdqOHJNN1VlUmNsUkFBUzdv?=
 =?utf-8?B?SzVGalhGbDZQVHpWdkR2VktubkdUWEdaUEFGS2gvajRGbENEQ3hiVW8wSnpK?=
 =?utf-8?B?SDUzekpvM0dkV25NT2s4cnhYVmQySjg2MEc0RHdMYks0K0pRTmdCcS9abnZ1?=
 =?utf-8?B?SDIxN3RCb0duTDNhUFUzVUVxZUtNTmJQQlhjR0w5Ry9NR25yWFFNa24yNEkx?=
 =?utf-8?B?a0dmWDJubEUyRFdmcUFrVStPK1lXeU1SdnlqNVRCdlMzeUNXaUdmWStRNURY?=
 =?utf-8?B?bjNjQ0VuUFdKMmFjVWRQS2N2L2RBVDZTTDRyb0xha05rVG1YZHI5MHhTMng2?=
 =?utf-8?B?RlA0aENaR0ZRTmovNEVZemVXUExwZHhIRStXTDBmejAwbVFlSlRyMHJuT1Ju?=
 =?utf-8?B?dVJTdHRvWE92REVFVlZWTWtyRzJPRjZqZXdMdjFMQVZwT0I1U0gzeU0wVzRv?=
 =?utf-8?B?eFN4QUg2eVZLRCtNZnZzV2NjQXM2YW9XeWVwSGozWnJtRzVHOThkbU1BVUFl?=
 =?utf-8?B?Qkh4Y0dzamo1YjRHZndGRVJzTjY2dFFEUmpyZlVKcThKSGQyOWN3QnNUSzkx?=
 =?utf-8?Q?9VZIKCC+3++3u0oW9PlREclOi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ece55d9f-9c16-473f-407e-08de2fac76fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2025 01:04:50.9807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xlAh7LR//F2Ii0Qd6NkDelcTYB6ZksteuKeJrP0p5yG5nTo+2KphOSLDrqncam7P9YDDPewQuH4Mowp5LVTAsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB999099
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

DQoNCj4gT24gTm92IDI5LCAyMDI1LCBhdCA1OjQ04oCvUE0sIEpvaG4gSHViYmFyZCA8amh1YmJh
cmRAbnZpZGlhLmNvbT4gd3JvdGU6DQo+IA0KPiDvu79PbiAxMS8yOC8yNSAxOjQ5IFBNLCBKb2Vs
IEZlcm5hbmRlcyB3cm90ZToNCj4+PiBPbiAxMS8yNy8yMDI1IDg6NDYgQU0sIEFsZXhhbmRyZSBD
b3VyYm90IHdyb3RlOg0KPj4+IE9uIFRodSBOb3YgMjcsIDIwMjUgYXQgMjoxMCBQTSBKU1QsIEpv
ZWwgRmVybmFuZGVzIHdyb3RlOg0KPiAuLi4NCj4+PiBUaGVyZSBpcyBhbHNvIGF0IGxlYXN0IG9u
ZSBwcmVjZWRlbnQ6IHRoZSBSdXN0IGBwYWdlX2FsaWduKClgIGRvZXMgbm90DQo+Pj4gY2FsbCBh
IEMgaGVscGVyIHRoYXQgd3JhcHMgYFBBR0VfQUxJR04oKWAsIGl0IGp1c3QgcmVpbXBsZW1lbnRz
IGl0LiBJDQo+Pj4gdGhpbmsgYGxpc3RfaGVhZGAgaXMgYSBxdWl0ZSBzaW1pbGFyIHNpdHVhdGlv
biwgYnV0IHVsdGltYXRlbHkgdGhhdCdzDQo+Pj4gZm9yIHRoZSBjb3JlIHRlYW0gdG8gc2F5Lg0K
Pj4gSSBkb24ndCB0aGluayBhIG9uZSBzaXplL3J1bGUgZml0cyBhbGwgd2lsbCBhcHBseSBmb3Ig
dGhpcy4gV2UgbmVlZCBjYXJlZnVsbHkgZG8NCj4gDQo+IENhc2UtYnktY2FzZSBpcyBjZXJ0YWlu
bHkgYSBnb29kIHdheSB0byBldmFsdWF0ZSB0aGVzZSB0aGluZ3MsIHllcy4NCj4gDQo+PiBpdCBv
biBhIGNhc2UtYnktY2FzZSBiYXNpcywgZm9yIGV4YW1wbGUgLSBpZiB3ZSBpbXBsZW1lbnQgbGlz
dF9hZGQgZGlyZWN0bHkgaW4NCj4+IHJ1c3QsIHdlJ2QgbWlzcyBvdXQgb24gQ09ORklHX0xJU1Rf
SEFSREVORUQuIFNvIGZvciB0aGF0LCBJIHdpbGwgc3RpbGwgdXNlIHRoZQ0KPj4gYmluZGluZ3Mu
IEZvciBJTklUX0xJU1RfSEVBRCBhbmQgaXRlcmF0aW9uLCBpdCBzaG91bGQgYmUgT2ssIHRob3Vn
aC4gU28gSSdsbCBhZGQNCj4+IHRoYXQgZGlyZWN0bHkgaW4gUnVzdCB3aXRob3V0IGJpbmRpbmdz
Lg0KPiANCj4gSGVyZSwgSSdtIG5vdCBzbyBzdXJlIHRoYXQgZXZlbiB0aGlzIGNhc2UgaXMgYSBz
b2xpZCBvbmUuIEJlY2F1c2UNCj4gQ09ORklHX0xJU1RfSEFSREVORUQgaXMgYSB3YXkgZm9yIEMg
Y29kZSB0byBoZWxwIHByb3RlY3QgYWdhaW5zdA0KPiBsaXN0IGNvcnJ1cHRpb24tLXdoaWNoIGlz
IGdlbmVyYWxseSBnb2luZyB0byBjb21lIGZyb20gdGhlIEMgc2lkZSwNCj4gbm90IHRoZSBSdXN0
IHNpZGUsIGZvciB0aGUgbW9zdCBwYXJ0Lg0KPiANCj4gTGV0IHRoZSBDIGNvZGUgaGF2ZSBpdHMg
ZXh0cmEgY2hlY2tzLCBidXQgb24gdGhlIFJ1c3Qgc2lkZSB3ZSBjYW4NCj4gZWl0aGVyIGFkZCB0
aGVtLCBvciBza2lwIHRoZW0tLWJ1dCBJIGRvbid0IHRoaW5rIHdlIG5lZWQgdG8gKmludm9rZSoN
Cj4gdGhlbSB2aWEgdGhlIEMgY29kZS4NCg0KSSB0aGluayB3ZSBkby4gVGhpcyBpcyBhIEMgbGlz
dCBhYnN0cmFjdGlvbiAocnVzdCBpbnRlcmFjdGluZyB3aXRoIEMtc2lkZSBjb2RlLCB0aGUgbGlz
dF9oZWFkIGNvbWVzIGZyb20gQyBiaW5kaW5ncykuIElmIHdlIHdhbnQgYSBwdXJlIHJ1c3QgbGlz
dCwgd2Ugc2hvdWxkIG5vdCBiZSB1c2luZyBjbGlzdCBpbiB0aGUgZmlyc3QgcGxhY2UuIFRoZXJl
IGlzIGxpc3QucnMgZm9yIHRoYXQuDQoNCkltYWdpbmUgQyBhbmQgcnVzdCBib3RoIGFkZGluZyBp
dGVtcyB0byBhIEMgbGlzdCBidXQgb25lIGlzIGhhdmluZyBkZWJ1Z2dpbmcgY29kZSBidXQgdGhl
IG90aGVyIGRvZXMgbm90LiBUaGF0IGlzIHJlYWxseSB3ZWlyZC4NCg0KVGhhbmtzLg0KDQoNCg0K
PiANCj4gDQo+IA0KPiB0aGFua3MsDQo+IC0tDQo+IEpvaG4gSHViYmFyZA0KPiANCg==
