Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPa5HytwlmlqfQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 03:06:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF90C15B7DB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 03:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3680C10E64E;
	Thu, 19 Feb 2026 02:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RZWPLAGZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5C010E64E;
 Thu, 19 Feb 2026 02:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYxSUrV/DeOCuc4MxcXvvr+g581KSJI52CZHrrFZfgQbZbYaAZSY8hvfWCK6xHe7vlCbFUhKC3M0SYjSKd6zqCJo89bCQYhOJBSr/RxU+/iwJZ051wny6w8DVzQkdwbYUeWIWnzBqtNblFTfZfaeY9GGK3aAeIkNyuxzoP8HXDL8uGVS1I7hbbIqWWlFxyZ5bOoHxNnwWTjl8QrVXOWDdoAYpXddY/3BDIACKWyO3fWPZccD3buXsVr2bqy+X4dh09LP1fYdu2f2hg7ORVmPwiOOsIQOMWRHjuVK+Suj4fbjOoIDRATV58m+mpCX8VsPQM5bhZ4Kc5aJKTbVdDSW3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HOQ9Z4e/9tdS+BiN6YcdGlgi/BfKGwrA9tDBg567wY=;
 b=VqIZ0id+xDHScE7/+xQ57J87FlgyRjYZXk+5ip7/3Ek8BLjkw73jidJsJzaY2LEirw8gHeb9z7JhFaz1RMR5ceaYnyT3+hIL4erI6+uRLPafEfTfxQ0HiufO3pzQQaJXCoMLSenuGrJ5RFyr/glRRSMS8S87JYegvECx0boinDPsX1GAhJw33LZp/Ju1fLwx66IcnOjoYGO64mfR3KhEHytmIzuBWoCfGnjB7w/7Cxy5+GY1/okUEEd2VKTe0G7qQYYwFtFTdgSZzcV5JfSobLt/q+7/jmYBPtBwhB/EpJrMSp/f+mzjXwSQmV5ONbjqNktS04lD+/IHapOW8ZTVXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HOQ9Z4e/9tdS+BiN6YcdGlgi/BfKGwrA9tDBg567wY=;
 b=RZWPLAGZ8STACWq33qB69x/8girosdoq+aW1gZGy1+f1/Lj0x4YkxtnGW2bFNG3coSPYViYvBlnmb/p8ShY/WBKRyXfr3ynwnkgZeKltn57jYj7CfX1Af9nqYDM3VUDJNz+7AnuQ9UJ5Rayx//FwNu8GE4dKvvF7VH4BS57ldyc4eiHzWGvnxBdAxKhnnD5JUN3FvcGpKLt++QIi/pK/OalluiJ329BatwNX02/qtn3i2FsrD5PGYP+bAtzOyaJBF0ZcEvqafDNM0nfM4i0H+ol64muxISBM0UcRcgrec+a0owhjRqxLje+7gZdo6f5zvPhnGGtrVDF5P0MQXVYvAw==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY5PR12MB6179.namprd12.prod.outlook.com (2603:10b6:930:24::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.13; Thu, 19 Feb 2026 02:06:25 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 02:06:25 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Danilo
 Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda
 <ojeda@kernel.org>, Dave Airlie <airlied@redhat.com>, Gary Guo
 <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>, Koen
 Koning <koen.koning@linux.intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, Nikola Djukic <ndjukic@nvidia.com>
Subject: Re: [PATCH v10 7/8] nova-core: mm: Select GPU_BUDDY for VRAM
 allocation
Thread-Topic: [PATCH v10 7/8] nova-core: mm: Select GPU_BUDDY for VRAM
 allocation
Thread-Index: AQHcoRj6qxe6p/NwmUSqKq81ZPm+trWJL5wAgAAW5ks=
Date: Thu, 19 Feb 2026 02:06:25 +0000
Message-ID: <F26F8438-98B0-4D49-BDA5-440CBC11FA40@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-8-joelagnelf@nvidia.com>
 <DGIITNWQG26Q.VN7FUL89C5D5@nvidia.com>
In-Reply-To: <DGIITNWQG26Q.VN7FUL89C5D5@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB6486:EE_|CY5PR12MB6179:EE_
x-ms-office365-filtering-correlation-id: 8658fe53-9fe5-4687-2b8e-08de6f5b7cad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?RWJnczlUaXpFNTJSa3pZVGFYemNIZG9qUnFDUHJHV2JBclRVQ2Vack9kMHV6?=
 =?utf-8?B?TVRUdnpzeFNabzVBTzNNZHVhSzJTN2lmVDdqR21vSXdHSzArQXJzNVZoemtq?=
 =?utf-8?B?bFhON3Y2OWpRVklXS1dJTzlGa1krNkluNUtuSWxoVzZiU3dqYmpLZm1iVFRk?=
 =?utf-8?B?WVd6bi9uY01aRWlEU1JzOE1LQjF3NjNTM1g2d2FtWkUyZ1czMUZBdjNhZ2py?=
 =?utf-8?B?bjZWa3E1ZE82V0RYTC9pYTl0dHlwNXB6UVppeUF2RWFMbTBHOGpsMmZXVVQr?=
 =?utf-8?B?VkRSSFhLTVg1UTd6UllYZGpBWHlUZWVYUGRLMDFqRUxFZ0NxZHNoRys3V3FX?=
 =?utf-8?B?UFNVc2srdVVhaDlPV29BcER1N2x5eEZkbUhJUEQ5RGh3ZVVZUm8vaEgvdGtQ?=
 =?utf-8?B?YUszVHZOMmdpTTI5SVI5OXBldXFlK05tWWxYSGRRcjJ2NmF5cGdreXFFb0Ju?=
 =?utf-8?B?dnl5UlMzTWpwcUVhZmVadlpySGJNL2VYaVZEeEQvMTYxRVBZV2JvUXNscVAy?=
 =?utf-8?B?a0FxbXFaQ0VhL1MrMHNzYTliRjB0VkVXek9rUHhZZnJNN0laRThGeEtWVkdu?=
 =?utf-8?B?bU45MXdpUE8yTmlsaDd4UFAxUU1uamRUeXFuY3VDTk9YNklxelF1RERqSk9B?=
 =?utf-8?B?WnpPSzFxY09SVzEwcjh2WnJ4bmh1MDhDUWZwRW9BOHk2aXVTQWgwdERWd0tR?=
 =?utf-8?B?TmxoZGp1bXVPdUdXZUtWMjVCWHo0MmNudjdQdEVndDJrK21MenZtN1RQVWR0?=
 =?utf-8?B?WUdvWlUvUVRjR3hGWG5TTmhpblJtOHNTRW01MmZLMVVRa0JnSldORU9QNnJj?=
 =?utf-8?B?VFZacndZb0lrTGxDSTFxbFRoblN5K21LcmcrMHZnd2RHS1Z6N2xEYlA1WUwy?=
 =?utf-8?B?RkhtTUVzbzBDdGNOalNSV0wya1dtRFBMUWhvaDhmdGV6bHRWMDAxRWxwZUln?=
 =?utf-8?B?OWZUQUpPWW5mK0hzaXFZOVV2dXRkMlptQjkxdHoreWsvU2F1ZG9Ma3o0dFRs?=
 =?utf-8?B?bUZHVVBjR3JxK04zMitEcHhYV21JdUpYeDM5SGZDWHVvMWFJTWNLUWtKb09Z?=
 =?utf-8?B?b0tGQkwwQndqUnJTNHJuRVh2bmQ4M3JiYWp2dkpucmNZNkdraG5vcHZ2Zmho?=
 =?utf-8?B?Q2tzajA3V0JzUjRpcVdGaHUwbGhFWjNLQW9ybDZCeUVuSHdTQmt1NnZpRC9D?=
 =?utf-8?B?TzVHZTdpTEI1WDFNQk1WdDgwQk9sMFlKem9qNUhtVkpFcG5Vbm4wTGVrN25i?=
 =?utf-8?B?S2NDb1pVODdKRSt1UmlDWGlOdTQ2LzJNTnBtbk5QQVg5Z0ZMZHJ6cnlIZWxz?=
 =?utf-8?B?aE9lZ3BhcGtMTjNJZFM4SEw5V0dUeFZPYTFHb2lrYldsU3RRSVFwSGNmRmNh?=
 =?utf-8?B?TmN0c0pLUmJwV3BJaU9SOFFUWFdtdWxPZVU1RUxuYnpKNzBFeFJnZVZjb1BT?=
 =?utf-8?B?b0lmbmFNcHdpRktqSFB2cm1VQ29ubFRMdTh0U1pMQ1FpeE05YWZYczRmN2tt?=
 =?utf-8?B?MFRUWnZ6QTRBN1FmYk9kL1FZZGpYT20vZUVhWFVqRlZuVjY1ZWVCOTh1M2lZ?=
 =?utf-8?B?aGxxTVRGUmdqUmlIcHFTdHdyOTlja0NzZkptaVFVNjlmV1NxQXdaaGZJRUVU?=
 =?utf-8?B?bFhJeXlEWUg0SkI5QzdlK2lHaUFjVlV2SnFCTFFma1pDbUN2dzBSQzdtY1FE?=
 =?utf-8?B?V3FVejV2MUhEU1FEL0kwdGhSZ0hsUm1ZbjVwVFRPemJpSzZwc213S2x6UWtw?=
 =?utf-8?B?RUVzUGVTNWF0MTNSY2pBTTF1UjJHT3dpYlZZY0EzMDUyN2ZzdDVIcFh3TFY3?=
 =?utf-8?B?cDFSWm1RalpkeXBzVnh5elg1eEErdVgwd01DOElyaThoTzFQYXA1czExZVFY?=
 =?utf-8?B?UVNhNmI1WlFtaVJRaTJXMWZuSUszSkl4OCtWdUgyRnNUMTh1L2cvNVZqbDY2?=
 =?utf-8?B?WlBFZ2d4RWMxS2o2a1E5SWUvYzcxUExaRFE5MHNDQis1T0JqcGdWMjVxRGd1?=
 =?utf-8?B?V3RLQmVCYVkwOHBPTTd1bm1CdGFRVmc5aVJHMENqMW12Y3FKbnk5WVd1cG9p?=
 =?utf-8?B?ekhnM0JmelhpVVZqQXdDVWk5cFlBOE5TZzJOYjFCVEZ6K09MSTAxZHM4MkpK?=
 =?utf-8?B?SkxtQXUwR2NnZmdaUEREaVpVQ2lnMUFPWnZid3hLL05jRUJZZ2JhOUtnR3Fw?=
 =?utf-8?Q?xPVEqUpX/1/cYCSMkDD5os0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEsrNk9sUTgxa3RlbUZ2aGxVR1VYdVNXU053QnVXdmpDRkVtVHY5ZWZaRWxt?=
 =?utf-8?B?dWlkNDJDM1FHUEF1MmRaWk9iY3pkWkdpd0YxUWorc3ZWZHZVa2ZTWHNXbjVh?=
 =?utf-8?B?MW1wcmgxUGZhUndSanY0bzAzNDNXTVJkQjFOL1BPeGEvd2NYcjhEcWpUL0x6?=
 =?utf-8?B?Um55VnlBWC9rTm9qVkJtS1o1L0sxSmpvS2s2RTJuZi84ZGF1REcrSjVqSXVl?=
 =?utf-8?B?NkZrR05YVS9KdExhRnNvZ1oxVmpxOHUzYVI2RndLMDRjOVlnekU1V1htN0Uw?=
 =?utf-8?B?cHRjTmt0cFlFVlVTRGRwM1ExbzB4L282dGprZ1IxK2pOYzV4dVNlK3JpY0FO?=
 =?utf-8?B?NVJaSWJtT3BqaVI0NXpzNUtESlFUWVpUTWhpaGhwMjZaTCtKYUtyNUR1c09K?=
 =?utf-8?B?WWpzVkRUWEczZFFXV1lpUy9Xa25vaXpGdFVMVXlGT1oyRkpjbFNybFVHWTZX?=
 =?utf-8?B?Nk8wemhlRVM5eGVDUUowa2lUNzlYSEJjT2NPS0FOVlFoVFRYMWRRMkFjMC9h?=
 =?utf-8?B?S2pVbENrSGVVN0FtSmRGK3A0ZGhkcDBiOVZTVG5KLy82TmZZZmdYS0ZxSFAw?=
 =?utf-8?B?ckQyNG5HeWltYkFkYmtGRXNKVlEyWWlqeHBTTEwzTlI0M0ROSktmUDFLZU1n?=
 =?utf-8?B?YjFWcjFZbm1UN3NseFlBUUY1ajlDVUErWkh1c0RERW9YclJSZzJIakZ3bUR4?=
 =?utf-8?B?eGo3YTRQY1V6eFpXZkNGeUViWVRUMjZxWk90RnNjcms1bDFMY0xKRU9VeGJz?=
 =?utf-8?B?aUZWT0lyVXYrc0NZQzl3VE9DbTBQR2pwRXVObW5SWTQ0TThPbnVuTERuRFFM?=
 =?utf-8?B?T1ozNGdEQ1hKZEppYjgvYlluN0ZTRlUwN1JkSDZYR2lhYkNtNVIvbEg1WGhj?=
 =?utf-8?B?cEFLaXVObkEyUC9DMUZPZGJTUEhiSlVzRktpRDZqbU8wSmFlbzFZTEp2UHZU?=
 =?utf-8?B?eThsWGV5OHFZMSsyRDNKZUFrQnhJRDZxdjEvcEFpbnhzUzFhTWUzdFlpMmhS?=
 =?utf-8?B?ZUppYlVIM1UwZ2h3VkNnZk9SamQ0allJNHRTVGNIRGpqdEozZzhPWTNGdE9V?=
 =?utf-8?B?dEJjeS9nSzFiVnNaczk5SUNNS3VxRHFqYnVkcEdJVkV6c3hWR1k0SmtEVGJO?=
 =?utf-8?B?clRTOVZDUTI3NWFsOUl0Vys0bGV1UVozZmdIRjA2SDhlKzU2YlhZUXIyOWxE?=
 =?utf-8?B?dkd2TC96M3dpZE9uamFkZXhKTEJ4WVN5dndNbVNZei9BOE12NFYyaWxhNm85?=
 =?utf-8?B?bEJSeURlVW5BQWFEd3NORGZpWVNTd2Zrbk1zZUszQnAwZjlLbGNLakhxOG1V?=
 =?utf-8?B?Z3VQMWR5ZEpQanF3VDJrclEwU1dNcWtVMXJBWU5pN1RKeUlxTHM4RFlOeU1z?=
 =?utf-8?B?UG1Xa1I0SXhFcnloc05oNUZncjU2NGZWUzJKbVVZTS9tcDl3QzVrMDNjT2Zr?=
 =?utf-8?B?ejcwWGJNNGFpbHJtVFV3NXN3RE1LL0VyVzN2MkNOSkxBaTJUQkY4ZzRpSElS?=
 =?utf-8?B?UDNnMlhLTGhUSWhwYmUwQnRhN2NWcGt3NG9haUVZZmRZeFhjQ09yVVZHbVhu?=
 =?utf-8?B?YWhkSmJtd2xIa280VWhtVW1WU3czSUVVVFU3RVJqUXJ5amN1QXJ0b1VjRlVp?=
 =?utf-8?B?b3Rqb0k2YUFRQ0JQSE9jZDRSbnp3UmJERzFoSGtyakhLbDJ0bXluN1hsLzVo?=
 =?utf-8?B?OVF3TXhqT2lFeTVoL2NJUWdLQVhoNVQ1MU1SS2xJMjhxVnFLeWRFNk15eXZX?=
 =?utf-8?B?dUx3NDNxOE1OVStYdzZwUEE3WS9MQVlDTGNMdTEwZi9Ca2JhQ0I4RlZOTlg3?=
 =?utf-8?B?KzJrK2VTSm54aFFJTFpwS1NKOXhxNGdiZWpmcHByeVZ1UDJqc0hLLzJ4NjVz?=
 =?utf-8?B?WkFpUURQdTltcnEwbS9wSmJBV1pkK0hGSmkxbjczd0U2OVFjNjd6clFjMWp0?=
 =?utf-8?B?ZVpCbmkrc1hrMk16c2tjZ01RRzVGMnRTVWRhc0Zyd3pIeEpRVUUrYVRJVVVS?=
 =?utf-8?B?bmJaOWpKd3pqV0lidzVaZWE0NkJCMW81QWVSZUZidmM3dGFBWlZUT2FEOVV3?=
 =?utf-8?B?Nm5vSHR4ZGdvTnFhWVF2US8rOWNscUd1dmNSL3dINkRyYXJ4ZVhDWHFuNDJI?=
 =?utf-8?B?V0k5cHVGR05UbW9TS0xMamNmREU3RGs4aTRIdXkyVkZ6cHh5ZzFuUlNjQ3gr?=
 =?utf-8?B?UVVQWTI0THBOeUtBRlgvY0VWS29aQWkxbTA0VXU5ODdlZ0xIZmJuelZpMnpm?=
 =?utf-8?B?NkNyZ0Q4NDRmQzByazhHUEZxY0N2UFdSN21Tb0hUTWMzYlN6ZlZ3YU1QK0Js?=
 =?utf-8?B?QUp2emlndk9raWNVSVEyUjNFMzhvbGJ0WDR5Nmc0WnZ0L2VyYkJuZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8658fe53-9fe5-4687-2b8e-08de6f5b7cad
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 02:06:25.6828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VXwAwWZVfU/MTAl8WXKsqV9ytuIxDgJARGvFSbjGuZ940FsmNK9ViJGD6clQVsMIez0ZFLGkOzUdmkhcC6mC1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6179
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,gmail.com,ffwll.ch,redhat.com,garyguo.net,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DF90C15B7DB
X-Rspamd-Action: no action

DQoNCj4gT24gRmViIDE4LCAyMDI2LCBhdCA3OjQ04oCvUE0sIEFsZXhhbmRyZSBDb3VyYm90IDxh
Y291cmJvdEBudmlkaWEuY29tPiB3cm90ZToNCj4gDQo+IO+7v09uIFRodSBGZWIgMTksIDIwMjYg
YXQgNTo1NSBBTSBKU1QsIEpvZWwgRmVybmFuZGVzIHdyb3RlOg0KPj4gbm92YS1jb3JlIHdpbGwg
dXNlIHRoZSBHUFUgYnVkZHkgYWxsb2NhdG9yIGZvciBwaHlzaWNhbCBWUkFNIG1hbmFnZW1lbnQu
DQo+PiBFbmFibGUgaXQgaW4gS2NvbmZpZy4NCj4gDQo+IFN1YmplY3QgcHJlZml4IHNob3VsZCBq
dXN0IGJlIGBub3ZhLWNvcmU6YCwgYXMgdGhpcyB0b3VjaGVzIHRoZSBtb2R1bGUncw0KPiBjb25m
aWd1cmF0aW9uLg0KPiANCj4gSSdkIGFsc28gc3VnZ2VzdCB0byBzZWxlY3QgYEdQVV9CVUREWWAg
aW4gdGhlIHNlcmllcyB0aGF0IGFjdGl2ZWx5DQo+IHN0YXJ0cyB1c2luZyBpdC4NCg0KQm90aCBz
dWdnZXN0aW9ucyBzb3VuZCBnb29kIHRvIG1lLg0KDQotIC0NCkpvZWwgRmVybmFuZGVzDQoNCg0K
DQo=
